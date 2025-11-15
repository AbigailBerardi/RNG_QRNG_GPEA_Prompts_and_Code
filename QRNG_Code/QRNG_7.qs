namespace QRNG64 {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    operation RandomFloat64() : Double {
        use qs = Qubit[64];

        for i in 0..63 {
            H(qs[i]);
        }

        mutable bits = 0;
        for i in 0..63 {
            if M(qs[i]) == One {
                set bits = bits + (1 <<< i);
            }
        }

        for i in 0..63 {
            Reset(qs[i]);
        }

        // Convert Int to Double and divide by 2^64
        let d = IntAsDouble(bits);
        let denom = 18446744073709551616.0; // 2^64
        return d / denom;
    }

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = RandomFloat64();
        set all += $"{sample},";
    }
    Message(all);
}
}