# 05: PDN, Routing & Signoff

## Goal
Build the power grid, route the design, generate the final layout and run physical checks.

## Concepts
- **Power distribution network**: rings, straps (upper metals) and rails (lowest metal along cell rows) bring VDD/VSS to every cell.
- **IR drop and electromigration** motivate wide, redundant power metal.
- **Global routing** assigns nets to routing regions (guides); **detailed routing** (TritonRoute) draws exact wires and vias obeying DRC.
- **Routing grid and preferred direction**: each metal layer has a preferred direction and track pitch.
- **Parasitic extraction** (SPEF) after routing feeds final STA.
- **Antenna effect**: charge buildup on long metal during fabrication can damage gate oxide; fixed with diodes or jumpers.
- **Signoff checks**: DRC (rules), LVS (layout matches netlist), antenna, final STA.

## Lab steps
1. `gen_pdn`; view the grid in Magic or the generated DEF.
2. `run_routing`; read the detailed-routing log for the DRC violation count per iteration.
3. `run_magic` to generate the GDS and open it.
4. `run_magic_spice_export`, `run_magic_drc`, `run_antenna_check`.
5. Extract SPEF and re-run STA to confirm timing after routing.

## Screenshots to capture
| File name | What it shows |
|-----------|---------------|
| `images/01_pdn_layout.png` | Power rails and straps |
| `images/02_routing_log.png` | Detailed routing DRC violations decreasing per iteration |
| `images/03_routed_layout.png` | Final routed layout |
| `images/04_magic_drc.png` | Magic DRC result |
| `images/05_antenna_report.png` | Antenna check summary |

## Results
| Metric | Value |
|--------|-------|
| Total wirelength (µm) | |
| Via count | |
| Final routing DRC violations | |
| Magic DRC violations | |
| Antenna violations | |
| Post-route setup WNS (ns) | |
| Post-route hold WNS (ns) | |

## Observations
- _How did DRC violations change across detailed-routing iterations?_
- _Which metal layers carry power and which carry signals?_
- _Did timing get better or worse after routing, and why?_
