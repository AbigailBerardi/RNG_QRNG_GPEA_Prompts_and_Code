namespace QRNG {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    operation Sample64() : Double {
        use qs = Qubit[64];
        for i in 0..63 { H(qs[i]); }
        let r = ResultArrayAsInt(MeasureEachZ(qs[0..62]));
        ResetAll(qs);
        return IntAsDouble(r)/9223372036854775808.0;
    }

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = Sample64();
        set all += $"{sample},";
    }
    Message(all);
}
}