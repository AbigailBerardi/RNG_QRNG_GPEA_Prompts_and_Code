namespace QRNG {
open Microsoft.Quantum.Intrinsic;
open Microsoft.Quantum.Convert;

operation QRand64() : Double {
    use qs = Qubit[53];
    mutable acc = 0;
    for i in 0..52 {
        H(qs[i]);
        if M(qs[i]) == One {
            set acc += (1 <<< i);
        }
        Reset(qs[i]);
    }
    return IntAsDouble(acc) / IntAsDouble(1 <<< 53);
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