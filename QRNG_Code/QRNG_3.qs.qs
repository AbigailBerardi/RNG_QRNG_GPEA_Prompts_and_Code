namespace QRNG {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Measurement;
    open Microsoft.Quantum.Convert;

    operation QRNG3() : Double {
        mutable x = 0;
        use qs = Qubit[53];
        H(qs[0]);
        if MResetZ(qs[0]) == One { set x += 1 <<< 52; }

        H(qs[1]);
        if MResetZ(qs[1]) == One { set x += 1 <<< 51; }

        H(qs[2]);
        if MResetZ(qs[2]) == One { set x += 1 <<< 50; }

        H(qs[3]);
        if MResetZ(qs[3]) == One { set x += 1 <<< 49; }

        H(qs[4]);
        if MResetZ(qs[4]) == One { set x += 1 <<< 48; }

        H(qs[5]);
        if MResetZ(qs[5]) == One { set x += 1 <<< 47; }

        H(qs[6]);
        if MResetZ(qs[6]) == One { set x += 1 <<< 46; }

        H(qs[7]);
        if MResetZ(qs[7]) == One { set x += 1 <<< 45; }

        H(qs[8]);
        if MResetZ(qs[8]) == One { set x += 1 <<< 44; }

        H(qs[9]);
        if MResetZ(qs[9]) == One { set x += 1 <<< 43; }

        H(qs[10]);
        if MResetZ(qs[10]) == One { set x += 1 <<< 42; }

        H(qs[11]);
        if MResetZ(qs[11]) == One { set x += 1 <<< 41; }

        H(qs[12]);
        if MResetZ(qs[12]) == One { set x += 1 <<< 40; }

        H(qs[13]);
        if MResetZ(qs[13]) == One { set x += 1 <<< 39; }

        H(qs[14]);
        if MResetZ(qs[14]) == One { set x += 1 <<< 38; }

        H(qs[15]);
        if MResetZ(qs[15]) == One { set x += 1 <<< 37; }

        H(qs[16]);
        if MResetZ(qs[16]) == One { set x += 1 <<< 36; }

        H(qs[17]);
        if MResetZ(qs[17]) == One { set x += 1 <<< 35; }

        H(qs[18]);
        if MResetZ(qs[18]) == One { set x += 1 <<< 34; }

        H(qs[19]);
        if MResetZ(qs[19]) == One { set x += 1 <<< 33; }

        H(qs[20]);
        if MResetZ(qs[20]) == One { set x += 1 <<< 32; }

        H(qs[21]);
        if MResetZ(qs[21]) == One { set x += 1 <<< 31; }

        H(qs[22]);
        if MResetZ(qs[22]) == One { set x += 1 <<< 30; }

        H(qs[23]);
        if MResetZ(qs[23]) == One { set x += 1 <<< 29; }

        H(qs[24]);
        if MResetZ(qs[24]) == One { set x += 1 <<< 28; }

        H(qs[25]);
        if MResetZ(qs[25]) == One { set x += 1 <<< 27; }

        H(qs[26]);
        if MResetZ(qs[26]) == One { set x += 1 <<< 26; }

        H(qs[27]);
        if MResetZ(qs[27]) == One { set x += 1 <<< 25; }

        H(qs[28]);
        if MResetZ(qs[28]) == One { set x += 1 <<< 24; }

        H(qs[29]);
        if MResetZ(qs[29]) == One { set x += 1 <<< 23; }

        H(qs[30]);
        if MResetZ(qs[30]) == One { set x += 1 <<< 22; }

        H(qs[31]);
        if MResetZ(qs[31]) == One { set x += 1 <<< 21; }

        H(qs[32]);
        if MResetZ(qs[32]) == One { set x += 1 <<< 20; }

        H(qs[33]);
        if MResetZ(qs[33]) == One { set x += 1 <<< 19; }

        H(qs[34]);
        if MResetZ(qs[34]) == One { set x += 1 <<< 18; }

        H(qs[35]);
        if MResetZ(qs[35]) == One { set x += 1 <<< 17; }

        H(qs[36]);
        if MResetZ(qs[36]) == One { set x += 1 <<< 16; }

        H(qs[37]);
        if MResetZ(qs[37]) == One { set x += 1 <<< 15; }

        H(qs[38]);
        if MResetZ(qs[38]) == One { set x += 1 <<< 14; }

        H(qs[39]);
        if MResetZ(qs[39]) == One { set x += 1 <<< 13; }

        H(qs[40]);
        if MResetZ(qs[40]) == One { set x += 1 <<< 12; }

        H(qs[41]);
        if MResetZ(qs[41]) == One { set x += 1 <<< 11; }

        H(qs[42]);
        if MResetZ(qs[42]) == One { set x += 1 <<< 10; }

        H(qs[43]);
        if MResetZ(qs[43]) == One { set x += 1 <<< 9; }

        H(qs[44]);
        if MResetZ(qs[44]) == One { set x += 1 <<< 8; }

        H(qs[45]);
        if MResetZ(qs[45]) == One { set x += 1 <<< 7; }

        H(qs[46]);
        if MResetZ(qs[46]) == One { set x += 1 <<< 6; }

        H(qs[47]);
        if MResetZ(qs[47]) == One { set x += 1 <<< 5; }

        H(qs[48]);
        if MResetZ(qs[48]) == One { set x += 1 <<< 4; }

        H(qs[49]);
        if MResetZ(qs[49]) == One { set x += 1 <<< 3; }

        H(qs[50]);
        if MResetZ(qs[50]) == One { set x += 1 <<< 2; }

        H(qs[51]);
        if MResetZ(qs[51]) == One { set x += 1 <<< 1; }

        H(qs[52]);
        if MResetZ(qs[52]) == One { set x += 1 <<< 0; }

        return IntAsDouble(x) / 9007199254740992.0;

    }

    @EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = QRNG3();
        set all += $"{sample},";
    }
    Message(all);
}
}