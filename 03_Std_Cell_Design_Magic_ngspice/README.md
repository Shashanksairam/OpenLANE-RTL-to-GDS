# 03: Standard Cell Design (Magic + ngspice)

## Goal
Inspect a CMOS inverter layout, extract parasitics, characterise it in ngspice and plug the cell into the OpenLane flow.

## Concepts
- **Standard-cell conventions**: fixed height, power rails top and bottom, ports on a routing-track grid, width a multiple of the site pitch.
- **Technology file** (`sky130A.tech`): layer definitions, DRC rules, extraction parameters used by Magic.
- **Parasitic extraction**: `extract` produces a netlist with R/C from geometry.
- **Characterisation metrics**
  - Rise/fall transition: time between 20% and 80% of the output swing.
  - Propagation delay: time between the 50% point of input and the 50% point of output.
- **Voltage transfer characteristic** and switching threshold: where Vout = Vin, set by the PMOS/NMOS strength ratio.
- **LEF vs liberty**: LEF carries geometry and pins; liberty carries timing, power and function. Both are needed by the flow.

## Lab steps
1. Clone the inverter lab repository provided in the course and open the layout in Magic.
2. Identify NMOS, PMOS, input/output ports, VDD/VSS rails; verify port placement on the track grid.
3. Extract: `extract all`, `ext2spice cthresh 0 rthresh 0`, `ext2spice`.
4. Edit the SPICE deck (include PDK models, add supply and input pulse) and run ngspice.
5. Measure rise/fall transition and propagation delays from the waveform.
6. Run `lef write`, copy LEF and liberty into `design/src/`, add the LEF to the flow, re-run synthesis.
7. Open a layout with intentional DRC errors and use `drc check` / `drc why` to understand the rules; fix one.

## Screenshots to capture
| File name | What it shows |
|-----------|---------------|
| `<img width="307" height="461" alt="image" src="https://github.com/user-attachments/assets/bfc79ce8-78c2-4e2a-9bad-415c42c3097e" />
` | Inverter layout in Magic |
| `images/02_extraction_files.png` | Generated `.ext` / `.spice` files |
| `images/03_ngspice_waveform.png` | Input and output waveforms |
| `images/04_measurement_cursor.png` | Cursor readings used for delays |
| `images/05_custom_cell_in_flow.png` | Custom cell appearing in synthesis or placement |
| `images/06_drc_error_and_fix.png` | A DRC error and its explanation |

## Results
| Metric | Value |
|--------|-------|
| Rise transition (20%-80%) | |
| Fall transition (20%-80%) | |
| Cell rise delay | |
| Cell fall delay | |

## Observations
- _How do your numbers compare with the library's typical values?_
- _What does extraction with parasitics change compared with an ideal netlist?_
- _What rule did the DRC error violate and how did you fix it?_
