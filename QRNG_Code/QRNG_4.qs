namespace Quantum.QRNG {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    /// Measures 53 qubits in |+⟩ to generate 53-bit quantum randomness
    operation MeasureUniformBits53() : Int[] {
        use qs = Qubit[53];
        mutable bits : Int[] = [];

        for q in qs {
            H(q);
        }

        for q in qs {
            let r = M(q);
            set bits += [r == One ? 1 | 0];
        }

        ResetAll(qs);
        return bits;
    }

    /// Converts LSB-first bits into an Int
    function BitsToInt(bits : Int[]) : Int {
        mutable acc = 0;
        for i in 0 .. Length(bits) - 1 {
            set acc += bits[i] * (1 <<< i);
        }
        return acc;
    }

    /// Converts Int in [0, 2^53) to Double in [0, 1)
    function IntToDoubleNormalized(x : Int) : Double {
        return IntAsDouble(x) / 9007199254740992.0; // 2^53
    }

    /// Main operation: uniform quantum-random Double in [0, 1)
    operation NextUniformDouble() : Double {
        let bits = MeasureUniformBits53();
        let value = BitsToInt(bits);
        return IntToDoubleNormalized(value);
    }

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..20 {
        let sample = NextUniformDouble();
        set all += $"{sample},";
    }
    Message(all);
}
}