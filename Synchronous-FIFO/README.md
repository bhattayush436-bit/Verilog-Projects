# Synchronous FIFO (Verilog HDL)

A **Synchronous First-In-First-Out (FIFO)** memory implemented in **Verilog HDL**. This project demonstrates the design and verification of a circular FIFO buffer using a single clock domain. The FIFO supports read, write, and simultaneous read/write operations while maintaining data integrity using read/write pointers and an occupancy counter.

---

## 📌 Features

- 8-bit data width
- FIFO depth of 8 locations
- Single clock (Synchronous FIFO)
- Circular buffer implementation
- Independent Read and Write pointers
- Occupancy Counter (`count`)
- Full flag generation
- Empty flag generation
- Supports:
  - Write operation
  - Read operation
  - Simultaneous Read & Write
- Behavioral simulation with Verilog Testbench

---

## 📂 Project Files

```
.
├── fifo.v          # RTL Design
├── tb.v      # Testbench
└── README.md
└── waveform_fifo_1.png #waveform Part-1
└── waveform_fifo_2.png #waveform Part-2
```

---

## 🏗️ FIFO Architecture

```
                 +------------------------------+
                 |      Synchronous FIFO        |
                 |                              |
 data_in ------->|                              |-------> data_out
 wr_en --------->|                              |
 rd_en --------->|                              |
 clk ----------->|                              |
 rst ----------->|                              |
                 |                              |
                 |   +----------------------+   |
                 |   |   8 x 8-bit Memory   |   |
                 |   +----------------------+   |
                 |          ▲         ▲         |
                 |          |         |         |
                 |     Write Ptr   Read Ptr     |
                 |                              |
                 |    Occupancy Counter         |
                 |                              |
                 |   Full Flag / Empty Flag     |
                 +------------------------------+
```

---

## 📖 Working Principle

### Write Operation

When:

- `wr_en = 1`
- `full = 0`

The FIFO:

- Stores `data_in` into memory
- Increments the write pointer
- Increments the occupancy counter

---

### Read Operation

When:

- `rd_en = 1`
- `empty = 0`

The FIFO:

- Reads data from memory
- Sends it to `data_out`
- Increments the read pointer
- Decrements the occupancy counter

---

### Simultaneous Read & Write

Current implementation supports simultaneous operations.

Behavior:

- If FIFO is **Full**, only the read operation is performed.
- If FIFO is **Empty**, only the write operation is performed.
- Otherwise, read and write occur simultaneously while the occupancy remains unchanged.

---

## 📊 Full & Empty Detection

The FIFO status is determined using the occupancy counter.

| Count | FIFO Status |
|-------:|-------------|
| 0 | Empty |
| 1 – 7 | Partially Filled |
| 8 | Full |

---

## 🔄 Circular Buffer

The FIFO implements circular addressing.

Since both pointers are 3 bits wide:

```
7 → 0
```

When a pointer reaches address 7, the next increment automatically wraps back to address 0, allowing continuous reuse of memory locations.

---

## 🧪 Testbench Verification

The provided testbench verifies:

- Reset operation
- Single Write
- Single Read
- Multiple consecutive Writes
- Multiple consecutive Reads
- Simultaneous Read & Write
- Pointer movement
- Occupancy Counter updates
- Full flag generation
- Empty flag generation

---

## 💻 Simulation

The project was simulated using **Xilinx Vivado**.

Signals observed during simulation:

- `clk`
- `rst`
- `wr_en`
- `rd_en`
- `data_in`
- `data_out`
- `wr_ptr`
- `rd_ptr`
- `count`
- `full`
- `empty`

Simulation confirmed correct FIFO functionality under normal operating conditions.

---

## 🛠️ Tools Used

- Verilog HDL
- Xilinx Vivado
- Behavioral Simulation

---

## 📚 Concepts Learned

This project helped strengthen understanding of:

- RTL Design
- FIFO Architecture
- Circular Buffers
- Memory Arrays in Verilog
- Read and Write Pointer Management
- Occupancy Counter
- Full and Empty Detection
- Sequential Logic Design
- Testbench Development
- Waveform Debugging

---

## 🚀 Future Improvements

- Parameterized FIFO Depth
- Parameterized Data Width
- Overflow Detection
- Underflow Detection
- Simultaneous Read & Write while Full (High Throughput FIFO)
- SystemVerilog Assertions
- UVM-based Verification

---

## 👨‍💻 Author

**Ayush Bhatt**

B.Tech Electronics & Communication Engineering (ECE)

Interested in RTL Design, Digital Design, and VLSI Front-End Development.
