# Command Reference

Verify each command against your installed OpenLane version; names can differ between releases.

## OpenLane interactive session
```tcl
./flow.tcl -interactive
package require openlane <version>
prep -design picorv32a -tag run1 -overwrite
```

## Stage commands
| Stage | Command |
|-------|---------|
| Synthesis | `run_synthesis` |
| Floorplan | `run_floorplan` |
| Placement | `run_placement` (or `global_placement_or` then `detailed_placement`) |
| CTS | `run_cts` |
| PDN | `gen_pdn` |
| Routing | `run_routing` |
| GDS / layout | `run_magic` |
| Signoff | `run_magic_spice_export`, `run_magic_drc`, `run_lvs_netgen`, `run_antenna_check` |

## Useful environment variables
| Variable | Meaning |
|----------|---------|
| `FP_CORE_UTIL` | Target core utilisation (%) |
| `FP_ASPECT_RATIO` | Core height / width |
| `FP_IO_MODE` | IO placement mode (random vs equidistant) |
| `SYNTH_STRATEGY` | Yosys/ABC optimisation target (area vs delay) |
| `SYNTH_SIZING` | Allow cell sizing during synthesis |
| `PL_TARGET_DENSITY` | Placement density target |
| `CTS_CLK_BUFFER_LIST` | Clock buffers TritonCTS may use |
| `CLOCK_PERIOD` | Clock period for the design (ns) |

Print any variable with `puts $::env(NAME)`.

## Magic
```bash
magic -T <path>/sky130A.tech lef read <merged.lef> def read <design.def> &
```
Inside Magic's tkcon: `extract all`, `ext2spice cthresh 0 rthresh 0`, `ext2spice`, `drc check`, `drc why`, `lef write`.

## ngspice
```bash
ngspice <deck>.spice
```
Then: `plot y vs time a`, hover/cursor to read 50% crossing points.

## DEF units
DEF files use database units. Check `UNITS DISTANCE MICRONS <n>` at the top (commonly 1000) and divide `DIEAREA` coordinates by it to get microns.
