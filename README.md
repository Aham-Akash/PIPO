# PIPO
# Verilog PIPO Register

This repository contains the Verilog code for a **Parallel-In, Parallel-Out (PIPO) register** and a corresponding testbench to verify its functionality.

## Table of Contents
- [Project Description](#project-description)
- [File Structure](#file-structure)
- [Module: PIPO](#module-pipo)
- [Testbench: PIPO_tb](#testbench-pipo_tb)
- [How to Simulate](#how-to-simulate)
- [Simulation Waveforms](#simulation-waveforms)

## Project Description
A Parallel-In, Parallel-Out (PIPO) register is a digital storage element that allows multiple bits of data to be loaded simultaneously and read out in parallel.  
It is commonly used in processors, memory units, and data buffering applications where fast parallel transfer of data is required.

The core behavior is as follows:
- On `i_load = 1`, the parallel input data (`i_parallel_in`) is stored in the register.  
- The stored data is immediately available on the output (`o_parallel_out`).  
- When reset (`i_rst = 1`), the register and output are cleared to `0`.  

## File Structure
The repository contains the following files:
- **PIPO.v**: The synthesizable Verilog module for the n-bit PIPO register.  
- **PIPO_tb.v**: The testbench used to simulate and verify the PIPO.v module.  

## Module: PIPO
This file defines the PIPO module.

### Parameters
- `n`: The number of bits in the register (default = 4).  

### Ports
- `i_clk` (Input): Clock signal, active on positive edge.  
- `i_rst` (Input): Active-high asynchronous reset. Clears both register and output.  
- `i_load` (Input): Load signal. When high, loads `i_parallel_in` into the register.  
- `i_parallel_in [n-1:0]` (Input): Parallel input data.  
- `o_parallel_out [n-1:0]` (Output): Parallel output data from the register.  

### Functionality
- When `i_rst` is high, both internal register and output are cleared.  
- When `i_load` is high, the parallel input data is latched into the register and reflected on `o_parallel_out`.  
- The output holds its value until the next load operation.  

## Testbench: PIPO_tb
This file (`PIPO_tb.v`) instantiates the PIPO module as the Device Under Test (DUT) and applies stimulus to verify functionality.

### Test Sequence
1. **Reset Phase**: Assert reset to initialize the register.  
2. **Load Phase 1**: Load parallel input `1010` into the register.  
3. **Hold Phase**: Keep `i_load` low, output holds the previous value.  
4. **Load Phase 2**: Load a new value `0101` into the register.  
5. **Simulation End**: Run for a fixed duration and then stop.  

The testbench also generates a **250 MHz clock** (`4 ns period`).  

## How to Simulate
To run the simulation, you will need a Verilog simulator such as ModelSim, Vivado, or Icarus Verilog.

Steps:
1. Compile both `PIPO.v` and `PIPO_tb.v`.  
2. Set `PIPO_tb` as the top-level module.  
3. Run the simulation.  
4. Observe signals (`i_clk`, `i_rst`, `i_load`, `i_parallel_in`, `o_parallel_out`) in a waveform viewer.  

Expected output:  
- When `i_load` is high, the parallel input should appear at `o_parallel_out`.  
- When `i_load` is low, the output should remain unchanged.  

## Simulation Waveforms
Below is an example waveform captured during simulation:

### Waveform
<img width="1919" height="1079" alt="PIPO_waveform" src="https://github.com/user-attachments/assets/9a25eeec-2510-4c8d-9ef1-48acc6ce3438" />


- `i_clk`: Clock signal (4 ns period).  
- `i_rst`: Asynchronous reset signal.  
- `i_load`: Load control signal.  
- `i_parallel_in`: Parallel input data (`1010`, then `0101`).  
- `o_parallel_out`: Output showing correct parallel values when loaded.  
