# Physical Design Flow Overview

| Stage | Tool (OpenLane) | Main inputs | Main outputs | What to check |
|-------|-----------------|-------------|--------------|---------------|
| Synthesis | Yosys + ABC | RTL, liberty, SDC | Gate-level netlist, stat report | Cell count, flop ratio, area, unmapped cells |
| Floorplan | OpenROAD `init_floorplan` | Netlist, LEF, utilisation / aspect ratio | Floorplan DEF | Die/core area, IO placement, tap/endcap cells |
| Placement | RePlAce, OpenDP | Floorplan DEF | Placement DEF | Overlaps, congestion, legalisation, HPWL |
| CTS | TritonCTS | Placement DEF, clock buffer list | CTS DEF, new netlist | Skew, insertion delay, clock buffer count |
| PDN | OpenROAD `pdngen` | Placed DEF, PDN config | Power grid in DEF | Rings/straps/rails connected to all cells |
| Routing | FastRoute, TritonRoute | CTS DEF | Routed DEF | DRC violations, overflow, wirelength |
| Parasitics + STA | OpenROAD RCX, OpenSTA | Routed DEF, liberty, SDC | SPEF, timing reports | WNS/TNS setup & hold across corners |
| Layout signoff | Magic, Netgen | Routed DEF, tech file | GDSII, DRC/LVS/antenna reports | Zero DRC, LVS clean, antenna violations |

## Why the order matters
- Floorplan decides what placement and routing can achieve; a poor aspect ratio or utilisation cannot be repaired later.
- CTS comes **after** placement because clock buffers need real cell locations; clocks are treated as ideal before this point.
- PDN is generated before detailed routing so signal routes avoid the power grid.
- Timing is checked at several points (post-synthesis, post-placement, post-CTS, post-route) because the delay model gets more accurate at each step.
