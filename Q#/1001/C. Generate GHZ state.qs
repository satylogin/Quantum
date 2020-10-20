// https://codeforces.com/contest/1001/problem/C

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Arrays;

    operation Solve (qs : Qubit[]): Unit {
        H(qs[0]);
        for (i in 1..(Length(qs)-1)) {
            CNOT(qs[0], qs[i]);
        }
    }
}


namespace qsharp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    operation Test(): Unit {
        using (qs = Qubit[3]) {    
            Solution.Solve(qs);
            DumpMachine();
            ResetAll(qs);
        }
        Message("Completed !");
    }
}
