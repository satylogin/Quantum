// https://codeforces.com/contest/1001/problem/F

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;

    operation Solve (qs : Qubit[], bits0 : Bool[], bits1 : Bool[]) : Int {
        body {
            mutable num_q = new Result[0];
            mutable num_0 = new Result[0];
            for (i in 0..(Length(qs)-1)) {
                set num_q += [M(qs[i])];
                set num_0 += [bits0[i] ? One | Zero];
            }
            return ResultArrayAsInt(num_q) == ResultArrayAsInt(num_0) ? 0 | 1;
        }
    }
}


namespace qsharp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    operation Test(): Unit {
        body {
            let bits0 = [false, false];
            let bits1 = [false, true];
            using (qs = Qubit[2]) {    
                Fact(Solution.Solve(qs, bits0, bits1) == 0, "");
            }
            using (qs = Qubit[2]) {
                X(qs[1]);
                Fact(Solution.Solve(qs, bits0, bits1) == 1, "");
                ResetAll(qs);
            }
            Message("Completed !");
        }
    }
}
