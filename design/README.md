# Design Inputs

This folder holds what is needed to re-run the flow for `picorv32a`.

| File | Purpose |
|------|---------|
| `config.tcl` | Design-level OpenLane configuration (clock, source files) |
| `src/` | RTL, SDC and any custom LEF/liberty files |

## Setup
1. Copy the RTL `picorv32a.v` from your OpenLane installation's `designs/picorv32a/src/` into `design/src/`. (It is open source under its own licence; keep that licence notice with the file.)
2. Put your SDC (for example `my_base.sdc`) in `design/src/`.
3. If you finish the standard-cell lab, put the custom `sky130_vsdinv.lef` and the matching liberty file in `design/src/` too.
4. Copy the folder into `<openlane>/designs/picorv32a/`.

Note: the `.v` and library files are intentionally not committed by this template. Add them once you have confirmed their licences allow redistribution.
