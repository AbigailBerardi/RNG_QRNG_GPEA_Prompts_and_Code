namespace QRNG {
    // open Microsoft.Quantum.Intrinsic;
    // open Microsoft.Quantum.Canon;

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    operation QRand64() : Double {
        mutable result = 0.0;
        use q = Qubit();
        for i in 1..64 {
            H(q);
            if MResetZ(q) == One {
                mutable pow = 1.0;
                for j in 1..i {
                    set pow /= 2.0;
                }
                set result += pow;
            }
        }
        return result;
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