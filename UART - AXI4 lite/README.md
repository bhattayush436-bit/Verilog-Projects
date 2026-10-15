# AXI4-Lite Controlled UART Controller

## Overview

This project implements an AXI4-Lite controlled UART transmitter and receiver using Verilog HDL. It integrates a memory-mapped AXI4-Lite slave interface with UART TX and RX modules, allowing data to be transmitted and received through register accesses.

The design is verified using RTL simulation and UART loopback testing.

## Architecture

The design consists of the following modules:

- **AXI4-Lite Slave Interface:** Handles write-address, write-data, write-response, read-address, and read-data channels.
- **UART Transmitter (`UART_tx`):** Transmits an 8-bit data byte received through the AXI write interface.
- **UART Receiver (`uart_rx`):** Receives serial data and reconstructs the original byte.
- **TX Data Register:** Stores the byte to be transmitted.
- **RX Data Register:** Stores the most recently received byte for AXI read access.

### Data Flow

1. The AXI master writes an 8-bit byte to the TX Data Register.
2. The AXI slave generates a transmit-start pulse.
3. The UART transmitter sends the byte serially through the TX output.
4. In loopback simulation, TX is connected to RX in the testbench.
5. The UART receiver reconstructs the byte and asserts `data_valid`.
6. The received byte is stored in the RX Data Register.
7. An AXI read returns the received byte through `RDATA`.

## Register Map

| Address | Register | Access | Description |
|---|---|---|---|
| `0x00` | TX Data Register | Write | Writing a byte initiates UART transmission. |
| `0x04` | RX Data Register | Read | Returns the most recently received byte. |

The AXI data bus is 32 bits wide, while UART data is 8 bits wide. Received data is zero-extended when returned through `RDATA`.

## Features

- AXI4-Lite read and write channel handling
- UART transmitter and receiver integration
- Memory-mapped register access
- UART serial loopback verification
- RTL simulation and waveform-based debugging
- Separate AXI write and read transactions

## Simulation and Verification

The design is tested using a Verilog testbench.

### Example Test

The testbench writes `0x55` to the TX Data Register, transmits it through UART, receives it through loopback, and reads the received byte from the RX Data Register.

**Expected result:**

```text
AXI Write Data : 0x00000055
UART Received  : 0x55
AXI Read Data  : 0x00000055
```

The expected result should be confirmed in the simulation waveform.

### Loopback Connection

The testbench connects the transmitter output to the receiver input:

```verilog
wire tx;
wire rx;

assign rx = tx;
```

This connection is used for simulation-based loopback verification.

## Project Structure

```text
AXI4-Lite-UART-Controller/
├── axi_slave_uart.v   # AXI4-Lite slave and control logic
├── UART_tx.v          # UART transmitter
├── uart_rx.v          # UART receiver
├── tb.v               # Simulation testbench
└── README.md          # Project documentation
```

Adjust the filenames if your repository uses different names.

## Tools and Technologies

- Verilog HDL
- Vivado Simulator / XSim
- AXI4-Lite Protocol
- UART Serial Communication
- RTL Simulation and Waveform Analysis

## Future Improvements

- Expand testbench coverage for multiple data patterns.
- Verify back-to-back transactions and AXI backpressure.
- Add invalid-address and reset tests.
- Add assertions and functional coverage.
- Perform RTL synthesis and analyze timing, area, and power.

## Learning Outcomes

This project provides practical experience in AXI4-Lite handshaking, UART serial framing, register-mapped peripheral design, RTL integration, and simulation-based debugging.

---

**Project Focus:** RTL Design | Digital Design | AXI4-Lite | UART | Functional Verification
