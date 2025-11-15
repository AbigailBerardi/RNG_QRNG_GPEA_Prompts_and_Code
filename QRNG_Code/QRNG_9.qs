namespace Qrng {

    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    operation Rng64() : Double {
        use qs = Qubit[52];
        mutable bits = 0;
        for i in 0..51 {
            H(qs[i]);
            if MResetZ(qs[i]) == One {
                set bits = bits ||| (1 <<< i);
            }
        }
        return IntAsDouble(bits) / 4503599627370496.0; // 2^52
    }
    
@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = Rng64();
        set all += $"{sample},";
    }
    Message(all);
}
}