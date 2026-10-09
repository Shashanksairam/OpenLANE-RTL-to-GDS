# 02: Floorplan & Placement

## Goal
Understand how floorplan parameters shape the die, then run placement and inspect the result in Magic.

## Concepts
- **Utilisation** = (area of standard cells) / (core area). Higher utilisation means a smaller die but harder routing.
- **Aspect ratio** = core height / width. Affects wire lengths and IO distribution.
- **Core vs die**: the core holds cells; the die adds the IO ring margin.
- **IO placement**: random vs equidistant pin placement influences wirelength and congestion.
- **Pre-placed cells, tap cells, endcaps**: fixed before placement; macros and decap/tap cells are never moved by the placer.
- **Global placement**: wirelength-driven (RePlAce), allows overlaps, optimises density and congestion.
- **Detailed placement / legalisation** (OpenDP): snaps cells to legal sites in rows without overlaps.

## Lab steps
1. `run_floorplan`; open the floorplan DEF and compute die/core area from `DIEAREA` using the DEF unit scale.
2. Try a second run with a different `FP_CORE_UTIL` or `FP_IO_MODE` and compare.
3. `run_placement`.
4. Open the placed DEF in Magic and locate standard-cell rows, tap cells and IO pins.

```bash
magic -T <path>/sky130A.tech lef read <merged.lef> def read <placement.def> &
```

## Screenshots to capture
| File name | What it shows |
|-----------|---------------|
| `images/01_floorplan_def_header.png` | DEF die-area line and unit scale |
| `images/02_floorplan_magic.png` | Floorplan view in Magic |
| `images/03_placement_magic.png` | Placed cells in Magic |
| `images/04_zoomed_cells.png` | Zoomed-in standard cells and tap cells |

## Results
| Parameter | Run A | Run B |
|-----------|-------|-------|
| `FP_CORE_UTIL` | | |
| `FP_ASPECT_RATIO` | | |
| `FP_IO_MODE` | | |
| Die area (µm²) | | |
| Core area (µm²) | | |

## Observations
- _How did die area scale with utilisation? Does it match the formula?_
- _Where did the placer cluster cells, and does that match connectivity?_
- _What did IO mode do to pin positions?_
