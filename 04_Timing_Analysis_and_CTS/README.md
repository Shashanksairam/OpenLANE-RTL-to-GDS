# 04: Timing Analysis & Clock Tree Synthesis

> This is the module to spend the most time on. STA and CTS questions dominate physical design interviews. See [`docs/sta_cheatsheet.md`](../docs/sta_cheatsheet.md).

## Goal
Analyse setup and hold with an ideal clock, run CTS, then re-analyse with a propagated clock and explain what changed.

## Concepts
- **Timing path types**: input-to-reg, reg-to-reg, reg-to-output, input-to-output.
- **Setup and hold** equations, slack, WNS, TNS.
- **Ideal vs propagated clock**: before CTS clocks are ideal (zero latency); after CTS the real buffer delays matter.
- **Clock skew, latency, uncertainty**.
- **CTS**: builds a balanced clock distribution (H-tree style) with buffers/inverters to reduce skew.
- **Clock-net shielding**: protects against crosstalk on the most timing-critical net.
- **Delay tables**: liberty cells store delay/slew as lookup tables indexed by input slew and output load.

## Lab steps
1. **Pre-CTS STA**: create a small STA config and SDC, load liberty/netlist, run `report_checks` for setup and hold.
2. Note WNS/TNS and the worst path.
3. `run_cts`; inspect the clock buffers inserted (`CTS_CLK_BUFFER_LIST`).
4. **Post-CTS STA** in OpenROAD: load LEF, liberty, DEF/ODB, SDC, then `set_propagated_clock [all_clocks]`.
5. `report_checks -path_delay min` and `max`; `report_clock_skew`.
6. Experiment: change the clock buffer list, re-run CTS and compare skew and slack.

## Screenshots to capture
| File name | What it shows |
|-----------|---------------|
| `images/01_pre_cts_setup.png` | Setup report before CTS |
| `images/02_pre_cts_hold.png` | Hold report before CTS |
| `images/03_cts_done.png` | CTS completion log |
| `images/04_post_cts_setup.png` | Setup report with propagated clock |
| `images/05_post_cts_hold.png` | Hold report with propagated clock |
| `images/06_clock_skew.png` | `report_clock_skew` output |

## Results
| Metric | Pre-CTS (ideal) | Post-CTS (propagated) |
|--------|-----------------|-----------------------|
| Setup WNS (ns) | | |
| Setup TNS (ns) | | |
| Hold WNS (ns) | | |
| Worst setup path (start → end) | | |
| Clock skew (ns) | | |

## Observations
- _What happened to hold slack after CTS and why?_
- _Which cells dominated the worst setup path?_
- _What did changing the clock buffer list do to skew and area?_
- _How would you fix the worst violating path?_
