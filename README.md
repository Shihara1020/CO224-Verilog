# CO224 - Computer Architecture Lab (Verilog)

![Verilog](https://img.shields.io/badge/Verilog-HDL-orange)
![License](https://img.shields.io/badge/License-MIT-blue)
![Simulator](https://img.shields.io/badge/Simulator-Icarus%20Verilog-green)

This repository contains all Verilog implementations for the **Computer Architecture (CO224)** lab sessions.

## 📂 Repository Structure
```
co224-verilog-lab/
├── lab01/                 # Lab 1: Combinational Circuits
│   ├── gates/             # Basic logic gates
│   ├── mux/               # Multiplexers
│   ├── alu/               # Arithmetic Logic Unit
│   └── README.md          # Lab instructions
├── lab02/                 # Lab 2: Sequential Circuits
│   ├── flipflops/         # D, T, JK Flip-flops
│   ├── registers/         # Shift registers
│   └── counters/          # Various counters
├── lab03/                 # Lab 3: Processor Components
│   ├── datapath/          # Datapath components
│   ├── control_unit/      # Control unit modules
│   └── simple_cpu/        # Basic single-cycle CPU
├── docs/                  # Lab manuals, schematics, references
├── testbenches/           # Centralized testbench files
└── LICENSE                # MIT License

```

## 🛠️ Tool Setup

### Prerequisites
- Icarus Verilog (iverilog)
- GTKWave for waveform viewing
- Git for version control

### Installation (Ubuntu)
```bash
sudo apt-get install iverilog gtkwave
```

### 🚀 Running Simulations
Compile Verilog files:
```bach
iverilog -o output.vvp source.v testbench.v
```
Run the simulation:
```bash
vvp output.vvp
```

View waveforms (if VCD file generated):

```bash
gtkwave dump.vcd
```
### 🧪 Lab Progress
| Lab | Topic                   | Status | Completed Date |
| --- | ----------------------- | ------ | -------------- |
| 01  | Combinational Logic     | ✅      | 2023-10-10     |
| 02  | Sequential Circuits     | ✅      | 2023-10-17     |
| 03  | Processor Components    | ⏳      | -              |
| 04  | Pipeline Implementation | ❌      | -              |


