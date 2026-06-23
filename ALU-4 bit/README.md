# 4-Bit ALU in Verilog HDL

## Overview

This project implements a **4-Bit Arithmetic Logic Unit (ALU)** using **Verilog HDL**. The ALU performs arithmetic, logical, comparison, and data transfer operations based on a 4-bit select input. The design also generates **Carry** and **Borrow** flags for arithmetic operations.

The project was simulated and verified using **Xilinx Vivado**.

---

## Features

* 16 ALU Operations
* Arithmetic Operations

  * Addition
  * Subtraction
  * Increment
  * Decrement
* Logical Operations

  * AND
  * OR
  * XOR
  * XNOR
  * NAND
  * NOR
  * NOT
* Comparison Operations

  * Equal To
  * Less Than
  * Greater Than
* Data Transfer Operations

  * PASS A
  * PASS B
* Carry and Borrow Flag Generation

---

## Module Interface

### Inputs

| Signal | Width | Description      |
| ------ | ----- | ---------------- |
| A      | 4-bit | Operand A        |
| B      | 4-bit | Operand B        |
| sel    | 4-bit | Operation Select |

### Outputs

| Signal | Width | Description |
| ------ | ----- | ----------- |
| result | 4-bit | ALU Output  |
| carry  | 1-bit | Carry Flag  |
| borrow | 1-bit | Borrow Flag |

---

## Opcode Table

| Select | Operation   |
| ------ | ----------- |
| 0000   | A AND B     |
| 0001   | A OR B      |
| 0010   | A XOR B     |
| 0011   | A XNOR B    |
| 0100   | A NAND B    |
| 0101   | PASS A      |
| 0110   | PASS B      |
| 0111   | NOT A       |
| 1000   | A == B      |
| 1001   | A < B       |
| 1010   | A > B       |
| 1011   | Increment A |
| 1100   | Decrement A |
| 1101   | A NOR B     |
| 1110   | A - B       |
| 1111   | A + B       |

---

## Carry and Borrow Logic

### Carry Flag

The carry flag is generated during:

* Addition
* Increment

Example:

A = 1111
B = 0001

Result = 0000
Carry = 1

---

### Borrow Flag

The borrow flag is generated during:

* Subtraction when A < B
* Decrement when A = 0000

Example:

A = 0010
B = 0100

Result = 1110
Borrow = 1

---

## Simulation

The design was verified using a dedicated Verilog testbench covering:

* All 16 ALU operations
* Carry generation
* Borrow generation
* Arithmetic operations
* Logical operations
* Comparison operations
* Increment and decrement operations

Simulation Tool:

* Xilinx Vivado

---

## Project Structure

```text
ALU-4 bit
│
├── ALU-4_bit.v
├── ALU-4_bit_tb.v
├── waveform_ALU-4_bit.png
└── README.md
```

---

## Applications

* Processor Datapaths
* Digital Signal Processing
* Embedded Systems
* FPGA-Based Designs
* Computer Architecture Learning

---

## Future Improvements

* Parameterized ALU Width
* Zero Flag Generation
* Overflow Flag Generation
* Shift Operations
* Rotate Operations
* Signed Arithmetic Support

---

## Author

Ayush Bhatt

B.Tech Electronics and Communication Engineering (ECE)

Interested in RTL Design, Digital Design, and VLSI Front-End Engineering.
