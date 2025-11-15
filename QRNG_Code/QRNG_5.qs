namespace QRNG64 {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Math;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;
    open Microsoft.Quantum.Arrays;
    open Microsoft.Quantum.Diagnostics;

    operation NextQuantumDouble() : Double {
        mutable result = 0L;

        use qubits = Qubit[64];
        for i in 0..63 {
            H(qubits[i]);
            if (MResetZ(qubits[i]) == One) {
                set result += (1L <<< i);
            }
        }

        let mantissaMask = 0x000FFFFFFFFFFFFFL;
        let mantissa = result &&& mantissaMask;
        let exponent = 1023L <<< 52;
        let encoded = exponent ||| mantissa;
        return IntAsDouble(BigIntAsInt(encoded)) - 1.0;
    }

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..20 {
        let sample = NextQuantumDouble();
        set all += $"{sample},";
    }
    Message(all);
}
}