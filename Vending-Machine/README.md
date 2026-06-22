# Vending Machine Controller using Verilog HDL

## Overview

This project implements a **Vending Machine Controller** using **Verilog HDL** and **Finite State Machine (FSM)** concepts. The machine dispenses a product priced at **₹10** and accepts **₹5** and **₹10** coins as inputs.

The design was simulated and verified using **Xilinx Vivado**.

---

## Features

* Product price: ₹10
* Accepts ₹5 and ₹10 coins
* Product dispensing functionality
* Change return functionality
* FSM-based design
* Verilog RTL implementation
* Testbench verification
* Vivado simulation support

---

## Inputs

| Signal  | Description       |
| ------- | ----------------- |
| clk     | System Clock      |
| rst     | Active High Reset |
| coin_5  | ₹5 Coin Input     |
| coin_10 | ₹10 Coin Input    |

---

## Outputs

| Signal   | Description             |
| -------- | ----------------------- |
| dispense | Product Dispense Signal |
| change   | Change Return Signal    |

---

## FSM States

| State | Description              |
| ----- | ------------------------ |
| S0    | Idle State (₹0 inserted) |
| S5    | ₹5 inserted              |
| S10   | Product Dispense State   |

---

## State Transitions

* S0 → S5 on ₹5 coin insertion
* S0 → S10 on ₹10 coin insertion
* S5 → S10 on additional ₹5 coin insertion
* S5 → S10 with change output on ₹10 coin insertion
* S10 → S0 after dispensing the product

---

## Test Cases Verified

### Case 1: ₹10 Coin

* Insert ₹10
* Product is dispensed
* No change returned

### Case 2: ₹5 + ₹5

* Insert ₹5
* Insert another ₹5
* Product is dispensed
* No change returned

### Case 3: ₹5 + ₹10

* Insert ₹5
* Insert ₹10
* Product is dispensed
* Change is returned

---

## Tools Used

* Verilog HDL
* Xilinx Vivado

---

## Learning Outcomes

Through this project, I gained practical experience in:

* Finite State Machine (FSM) Design
* Verilog RTL Coding
* Sequential Logic Design
* State Transition Analysis
* Testbench Development
* Functional Simulation and Waveform Analysis

---

## Future Improvements

* Support for multiple product prices
* Additional coin denominations
* Product selection feature
* Timeout and refund mechanism
* Enhanced change return logic

---

## Author

**Ayush Bhatt**

B.Tech Electronics and Communication Engineering (ECE)

Aspiring RTL Design / VLSI Front-End Engineer
