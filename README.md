# chem-eng-toolkit
A chemical engineering toolkit built in Racket.
# Green Chemical Process Modeling Toolkit

**Functional Programming | Engineering Systems | Sustainability**

---

## Project Overview

The Green Chemical Process Modeling Toolkit is a Racket-based project designed to model simplified chemical processes using functional programming principles.  
Originally started as a generic calculator project, it has been **pivoted into a chemical engineering toolkit** to:

- Perform unit conversions
- Calculate averages of experimental trials
- Model material balances
- Compute process yields and efficiencies
- Simulate simple chemical process flows

This toolkit demonstrates **initiative, engineering logic, and sustainability awareness**, providing a foundation for more advanced process modeling and environmental efficiency calculations.

---

## Features

1. **Unit Conversions**
   - Nanometers ↔ Angstroms
   - Liters ↔ Milliliters
   - Grams ↔ Kilograms

2. **Experimental Calculations**
   - Average of multiple measurements (`average-trials`)

3. **Material Balance**
   - Compute product and waste mass given feed and loss fraction

4. **Process Modeling**
   - `run-process` combines material balance and efficiency calculations
   - Returns product mass, waste mass, and material efficiency for a single-step process

---

## Example Usage

```racket
; Calculate unit conversions
(converts 15 "nm" "A") ; => 150

; Average of experimental trials
(average '(98 100 102)) ; => 100

; Material balance for a process
(material-balance 100 0.1) ; => '(90 10)

; Run full process simulation
(run-process 100 0.1) ; => '(90 10 0.9)
