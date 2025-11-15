namespace QRNG {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Diagnostics;

    operation Sample64() : Double {
        use qs = Qubit[64];
        mutable r = 0;
        for i in 0..63 {
            H(qs[i]);
        }
        for i in 0..63 {
            if M(qs[i]) == One {
                set r += 1 <<< i;
            }
            Reset(qs[i]);
        }
        return IntAsDouble(r) / 18446744073709551616.0;
    }

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..50 {
        let sample = Sample64();
        set all += $"{sample},";
    }
    Message(all);
}
}