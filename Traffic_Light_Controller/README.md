# Traffic Light Controller using Verilog HDL

## Overview

This project implements a simple Traffic Light Controller using a Moore Finite State Machine (FSM) in Verilog HDL. The controller consists of three states: RED, GREEN, and YELLOW. State transitions are controlled by an input signal (`din`) and synchronized with the clock.

## Features

* Moore FSM implementation
* Three traffic light states:

  * RED
  * GREEN
  * YELLOW
* Synchronous active-high reset
* Verilog testbench for verification
* Simulated using Xilinx Vivado

## State Encoding

| State  | Binary Encoding |
| ------ | --------------- |
| RED    | 00              |
| GREEN  | 01              |
| YELLOW | 10              |

## State Transition Diagram

RED → GREEN → YELLOW → RED

When `din = 1`, the FSM transitions to the next state.

When `din = 0`, the FSM remains in the current state.

## Output Behavior

| State  | dout |
| ------ | ---- |
| RED    | 0    |
| GREEN  | 0    |
| YELLOW | 1    |

The output `dout` is asserted only when the controller is in the YELLOW state.

## Design Files

* `traffic_controller.v` – RTL design of the Traffic Light Controller
* `traffic_controller_tb.v` – Testbench for simulation and verification

## Simulation

The design was verified using Vivado Behavioral Simulation.

### Sample State Sequence

RED → GREEN → YELLOW → RED → GREEN → YELLOW

### Simulation Waveform

Add your Vivado waveform screenshot here.

## Tools Used

* Verilog HDL
* Xilinx Vivado

## Learning Outcomes

* Finite State Machine (FSM) Design
* Moore Machine Implementation
* State Transition Logic
* Verilog HDL Coding
* Testbench Development
* Functional Simulation and Verification

## Author

Ayush Bhatt

B.Tech Electronics and Communication Engineering (ECE)

Interested in VLSI Front-End Design, RTL Design, and Verification.
