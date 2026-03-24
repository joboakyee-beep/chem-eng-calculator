# Green Chemical & Industrial Process Modeling Toolkit (Racket)

A **modular Racket calculator** designed for **industrial engineering and chemical process modeling**, emphasizing **process efficiency, material balance, and sustainability metrics**. This project combines programming, math modeling, and engineering computations into a single toolkit suitable for **educational purposes, portfolio showcasing, and real-world process analysis**.

## Features

### 1. Unit Conversion Module
- Converts **length, volume, and mass** (e.g., nm ↔ Å, mL ↔ L, g ↔ kg).
- Ensures consistent units for all calculations.

### 2. Batch Statistics Module
- Summarizes measurements for **quality control**.
- Calculates **min, max, mean, range, standard deviation, and coefficient of variation**.
- Outputs are **rounded for readability**.

### 3. Mass Balance Module
- Tracks material flows within production systems.
- Functions include:
- Output calculation from input and waste percentage
- Waste calculation from input and output
- Waste percentage computation
- Supports **batch-level efficiency analysis**.

### 4. Sustainability Metrics Module
- Calculates **carbon footprint** based on material mass and emission factors.
- Provides **quantitative insight into environmental impact**.

### 5. Material Efficiency & Process Module
- Calculates **material balance, percent yield, material efficiency, and process run metrics**.
- Functions include:
- **Material Balance:** determines product and waste from feed mass and loss fraction
- **Percent Yield:** measures efficiency relative to ideal output
- **Material Efficiency:** fraction of feed converted to product
- **Run Process:** simulates a process and returns product, waste, and efficiency
- Integrates with other modules for a **comprehensive view of process performance and sustainability**.

## Installation
Requires [Racket](https://racket-lang.org/) to run.

