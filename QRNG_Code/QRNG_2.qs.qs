namespace RNG
{
open Microsoft.Quantum.Intrinsic;

operation Main() : Double {
use qs = Qubit[64];
mutable d = 0.0;
mutable w = 0.5;
for i in 0..63 {
let q = qs[i];
H(q);
if MResetZ(q) == One { set d = d + w; }
set w = w * 0.5;
}
return d;
}

@EntryPoint()
operation Main2() : Unit {
    mutable all = "";
    for _ in 1..200000 {
        let sample = Main();
        set all += $"{sample},";
    }
    Message(all);
}
}