using System;
using Microsoft.Quantum.Simulation.Simulators;

namespace qsharp {
    public class Driver {
        public static void Main(string[] args) {
            using (var sim = new QuantumSimulator()) {
                Test.Run(sim).Wait();
            }
        }
    }
}
