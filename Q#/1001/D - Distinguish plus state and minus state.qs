// https://codeforces.com/contest/1001/problem/D

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;

    operation Solve (q : Qubit) : Int {
        body {
            H(q);
            if (M(q) == Zero) {
                return 1;
            }
            return -1;
        }
    }
}


namespace qsharp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    operation Test(): Unit {
        body {
            mutable result = 0;
            using (qs = Qubit[1]) {
                H(qs[0]);
                set result = Solution.Solve(qs[0]);
                Fact(1 == result, $"{result}");
                Reset(qs[0]);

                X(qs[0]);
                H(qs[0]);
                set result = Solution.Solve(qs[0]);
                Fact(-1 == result, $"{result}");
                Reset(qs[0]);

                Message("completed!");
            }
        }
    }
}
