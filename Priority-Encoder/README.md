# 8:3 Priority Encoder using Verilog

## Overview

This project implements an 8:3 Priority Encoder in Verilog HDL. A priority encoder generates the binary code corresponding to the highest-priority active input. If multiple inputs are active simultaneously, the encoder outputs the binary value of the highest-priority input.

## Features

* Designed using Verilog HDL
* Combinational logic implementation
* Highest priority assigned to Input 7
* Synthesized and simulated using Xilinx Vivado
* Includes testbench for functional verification

## Truth Table

| Active Input | Output (dout) |
| ------------ | ------------- |
| 10000000     | 111           |
| 01000000     | 110           |
| 00100000     | 101           |
| 00010000     | 100           |
| 00001000     | 011           |
| 00000100     | 010           |
| 00000010     | 001           |
| 00000001     | 000           |

## Module Description

### Inputs

* `in[7:0]` : 8-bit input vector

### Outputs

* `dout[2:0]` : Encoded binary output

## Simulation Results

The design was verified using a Verilog testbench in Xilinx Vivado. Various input combinations were tested to ensure correct priority encoding functionality.

## Tools Used

* Verilog HDL
* Xilinx Vivado

## Learning Outcomes

* Understanding of combinational circuit design
* Implementation of priority encoding logic in Verilog
* Writing and testing Verilog testbenches
* Functional simulation and verification

## Author

Ayush Bhatt
B.Tech Electronics and Communication Engineering


