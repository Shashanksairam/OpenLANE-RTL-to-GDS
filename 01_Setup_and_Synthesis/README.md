# 01: Setup & Synthesis

## Goal
Get the OpenLane environment running, prepare `picorv32a`, run synthesis and read the cell statistics.

## Concepts
- **RTL-to-GDSII**: the sequence of transformations from behavioural code to manufacturable layout.
- **Synthesis**: Yosys maps RTL to generic gates, ABC maps those to standard cells from the liberty file.
- **Standard cell library**: pre-characterised cells (function, timing, power, area) in `.lib`, geometry in `.lef`.
- **Open-source EDA stack**: OpenLane orchestrates Yosys, OpenROAD, Magic, Netgen and others.
- **Flop ratio** = number of flip-flops / total cell count: a quick sanity check on design character (control- vs datapath-heavy).

## Lab steps
1. Launch OpenLane interactively and load the package.
2. `prep -design picorv32a -tag <tag> -overwrite`
3. `run_synthesis`
4. Open the synthesis stat report and note total cells, flops and area.
5. Compute the flop ratio.

Reports to look at (paths under `runs/<tag>/`):
- `reports/synthesis/` : cell statistics
- `results/synthesis/` : gate-level netlist
- `logs/synthesis/` : Yosys log

## Screenshots to capture
| File name | What it shows |
|-----------|---------------|
| <img width="940" height="433" alt="image" src="https://github.com/user-attachments/assets/3929c29b-42c9-4c7e-9a77-707165bb7a02" /> | | Interactive session started, package loaded |
| <img width="940" height="567" alt="image" src="https://github.com/user-attachments/assets/881b455f-23e6-4ec2-aefb-5f6b3be181a4" /> | | Cell statistics report |

## Results
| Metric | Value |
|--------|-------|
| Total cells |18508|
| Flip-flops |1613|
| Flop ratio |0.087 (8.7%)|
