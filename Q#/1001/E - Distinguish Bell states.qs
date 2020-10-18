// https://codeforces.com/contest/1001/problem/E

namespace Solution {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Convert;

    operation UnBell(qs: Qubit[]): Unit {
        CNOT(qs[0], qs[1]);
        H(qs[0]);
    }

    operation Solve (qs : Qubit[]) : Int {
        body {
            UnBell(qs);
            return ResultArrayAsInt([M(qs[0]), M(qs[1])]);
        }
    }
}


namespace qsharp {
    open Microsoft.Quantum.Intrinsic;
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Diagnostics;

    operation Bell(qs : Qubit[], index : Int) : () {
        body {
            if (index % 2 == 1) {
                X(qs[0]);
            }
            if (index >= 2) {
                X(qs[1]);
            }
            H(qs[0]);
            CNOT(qs[0], qs[1]);
        }
    }

    operation Test(): Unit {
        body {
            mutable result = 0;
            using (qs = Qubit[2]) {
                for (index in 0..3) {
                    Bell(qs, index);
                    set result = Solution.Solve(qs);
                    Message($"{result}");
                    Fact(result == index, $"{result}");
                    ResetAll(qs);

                    Message($"completed index {index} !");
                }
            }
        }
    }
}
