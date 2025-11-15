namespace QRNG {
operation QRand64() : Double {
    use reg = Qubit[53];
    for i in 0..52 {
        H(reg[i]);
    }
    let bits = ResultArrayAsBoolArray(MultiM(reg));
    ResetAll(reg);
    mutable acc = 0;
    for i in 0..Length(bits)-1 {
        if bits[i] {
            set acc += 1 <<< (52 - i);
        }
    }
    return IntAsDouble(acc)/IntAsDouble(1 <<< 53);
}

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = QRand64();
        set all += $"{sample},";
    }
    Message(all);
}
}