# Static Timing Analysis Cheat Sheet

## Core definitions
- **Launch edge**: clock edge at the source flop. **Capture edge**: clock edge at the destination flop.
- **Arrival time**: when data reaches the capture flop D pin. **Required time**: when it must have arrived.
- **Slack** = required time − arrival time (setup). Negative slack = violation.
- **WNS**: worst negative slack. **TNS**: sum of all negative endpoint slacks.

## Setup check (data must arrive before the next capture edge)
```
T_clk_to_Q + T_comb(max) + T_setup  <=  T_clk + (T_capture_clk - T_launch_clk) - T_uncertainty
```
Setup slack = right-hand side − left-hand side. Violated when the path is too slow.
Frequency limit is set by the worst setup path.

## Hold check (data must not change too soon after the capture edge)
```
T_clk_to_Q + T_comb(min)  >=  T_hold + (T_capture_clk - T_launch_clk) + T_uncertainty
```
Hold slack = left-hand side − right-hand side. Hold violations are **independent of clock period**: slowing the clock does not fix them.

## Typical fixes
| Violation | Fixes |
|-----------|-------|
| Setup | Upsize drivers, buffer long nets, restructure logic, reduce fanout/load, useful skew, relax clock |
| Hold | Insert delay buffers on short paths, downsize cells, rebalance clock skew |

## Skew intuition
- Capture clock **later** than launch clock → helps setup, hurts hold.
- Capture clock **earlier** than launch clock → hurts setup, helps hold.

## Things interviewers like to ask
- Ideal vs propagated clock: when do you switch and why?
- Why do hold fixes wait until after CTS?
- What is OCV / derating, and what does CRPR (clock reconvergence pessimism removal) fix?
- Why analyse multiple corners (slow/typical/fast, different voltage and temperature)?
- Difference between clock uncertainty, latency and skew.
- What is a false path vs a multicycle path, and how does each appear in the SDC?

## SKY130 liberty corners (HD library)
| Corner | File name pattern |
|--------|------------------|
| Typical | `sky130_fd_sc_hd__tt_025C_1v80.lib` |
| Slow | `sky130_fd_sc_hd__ss_100C_1v60.lib` |
| Fast | `sky130_fd_sc_hd__ff_n40C_1v95.lib` |

## Useful OpenSTA / OpenROAD commands
```tcl
read_liberty <lib>
read_verilog <netlist>
link_design <top>
read_sdc <sdc>
set_propagated_clock [all_clocks]      ;# after CTS
report_checks -path_delay max           ;# setup
report_checks -path_delay min           ;# hold
report_checks -path_delay min_max -fields {slew cap input_pins} -digits 4
report_clock_skew
report_wns
report_tns
```
