# ============================================================
# SKY130 / OpenLane: command sequence (interactive mode)
# Run one stage at a time and inspect results between stages.
# Edit <tag> and variable values to match what you used.
# ============================================================

# --- 01 Setup & synthesis ---------------------------------
package require openlane <version>
prep -design picorv32a -tag <tag> -overwrite
run_synthesis

# --- 02 Floorplan & placement -----------------------------
# Optional overrides BEFORE running floorplan, e.g.:
# set ::env(FP_CORE_UTIL) 35
# set ::env(FP_ASPECT_RATIO) 1
# set ::env(FP_IO_MODE) 1
run_floorplan
run_placement
# or: global_placement_or ; detailed_placement

# --- 03 Custom standard cell (after layout + LEF/lib ready)
# set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
# add_lefs -src $lefs
# Re-run prep + synthesis so the new cell is visible to the flow.

# --- 04 CTS ------------------------------------------------
run_cts
# Inspect / change clock buffers before re-running if needed:
# puts $::env(CTS_CLK_BUFFER_LIST)

# --- 05 PDN, routing, signoff -----------------------------
gen_pdn
run_routing
run_magic
run_magic_spice_export
run_magic_drc
run_antenna_check
