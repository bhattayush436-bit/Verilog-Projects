# Overlapping Sequence Detector (1001) using Verilog

## Overview

This project implements an Overlapping Sequence Detector for the binary sequence **1001** using a **Mealy Finite State Machine (FSM)** in Verilog HDL. The detector generates an output whenever the sequence `1001` is identified in the input stream. Overlapping detection allows the detector to reuse bits from a previously detected sequence to identify subsequent occurrences efficiently.

## Features

* Detects the sequence **1001**
* Supports **overlapping sequence detection**
* Implemented using a **Mealy FSM**
* Designed in Verilog HDL
* Synthesized and simulated using Xilinx Vivado
* Includes testbench for functional verification

## State Diagram

States used in the design:

* **S0** : Initial state (No match detected)
* **S1** : Detected `1`
* **S2** : Detected `10`
* **S3** : Detected `100`

When the input sequence `1001` is completed, the output becomes `1`.

## Inputs and Outputs

### Inputs

* `clk` : Clock signal
* `rst` : Reset signal
* `din` : Serial input data

### Output

* `dout` : Sequence detection output

## State Transitions

| Present State | Input | Next State | Output |
| ------------- | ----- | ---------- | ------ |
| S0            | 0     | S0         | 0      |
| S0            | 1     | S1         | 0      |
| S1            | 0     | S2         | 0      |
| S1            | 1     | S1         | 0      |
| S2            | 0     | S3         | 0      |
| S2            | 1     | S1         | 0      |
| S3            | 0     | S0         | 0      |
| S3            | 1     | S1         | 1      |

## Example

Input Stream:
1001001

Output Stream:
0001001

The detector successfully identifies two overlapping occurrences of the sequence `1001`.

## Simulation Results

The design was verified through simulation in Xilinx Vivado. Different input patterns were applied to validate correct sequence detection and overlapping functionality.

## Tools Used

* Verilog HDL
* Xilinx Vivado

## Learning Outcomes

* Understanding of Finite State Machines (FSMs)
* Difference between Mealy and Moore Machines
* Implementation of Sequence Detectors in Verilog
* State Transition Design and Verification
* Functional Simulation using Vivado

## Files Included

* `sequence_detector_1001.v`
* `sequence_detector_1001_tb.v`
* `waveform.png`
* `README.md`

## Author

Ayush Bhatt
B.Tech Electronics and Communication Engineering
Aspiring VLSI Front-End / RTL Design Engineer
