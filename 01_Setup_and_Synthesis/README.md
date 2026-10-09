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
| `images/01_openlane_launch.png` | Interactive session started, package loaded |
| `images/02_prep_done.png` | `prep` completed with your tag |
| `images/03_synthesis_done.png` | Synthesis finished without errors |
| `images/04_cell_stats.png` | Cell statistics report |

## Results
| Metric | Value |
|--------|-------|
| Total cells | |
| Flip-flops | |
| Flop ratio | |
| Area (µm²) | |

## Observations
- _What does the flop ratio suggest about this design?_
- _Which cell types dominate the count?_
- _What changed (if anything) when you changed `SYNTH_STRATEGY` or `SYNTH_SIZING`?_

## Issues faced
See [`docs/troubleshooting.md`](../docs/troubleshooting.md).
