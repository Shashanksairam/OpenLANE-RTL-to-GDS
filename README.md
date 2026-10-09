# SKY130 RTL-to-GDSII: Physical Design Notes & Labs

> Hands-on notes, commands and results from walking a RISC-V core (`picorv32a`) through the open-source **OpenLane** flow on the **SkyWater SKY130** PDK.

![PDK](https://img.shields.io/badge/PDK-SKY130-blue)
![Flow](https://img.shields.io/badge/Flow-OpenLane%20v1.0.x-green)
![Domain](https://img.shields.io/badge/Domain-Physical%20Design-orange)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

---

## Table of Contents
1. [About](#about)
2. [Flow at a Glance](#flow-at-a-glance)
3. [Repository Map](#repository-map)
4. [Module Progress](#module-progress)
5. [Results Snapshot](#results-snapshot)
6. [Tools & Environment](#tools--environment)
7. [How to Reproduce](#how-to-reproduce)
8. [Key Learnings](#key-learnings)
9. [Author](#author)

---

## About

This repository documents my practical study of the ASIC backend flow: synthesis, floorplanning, placement, standard-cell design, static timing analysis, clock tree synthesis, power distribution, routing and signoff checks.

Each module folder holds the **concepts**, the **exact commands** I ran, the **logs** and **screenshots** I captured, and a short **observations** section written in my own words. The goal is a repo that someone can follow end to end *and* that shows I understand why each step exists, not only how to type it.

## Flow at a Glance

```mermaid
flowchart LR
    A[RTL + SDC + config.tcl] --> B[Synthesis<br/>Yosys + ABC]
    B --> C[Floorplan<br/>die/core, IO, tap cells]
    C --> D[Placement<br/>global + detailed]
    D --> E[CTS<br/>TritonCTS]
    E --> F[PDN<br/>rings, straps, rails]
    F --> G[Routing<br/>global + detailed]
    G --> H[Signoff<br/>STA, DRC, LVS, antenna]
    H --> I[GDSII]
```

## Repository Map

```
.
├── 01_Setup_and_Synthesis/            # OpenLane setup, config, synthesis, flop ratio
├── 02_Floorplan_and_Placement/        # die/core sizing, IO modes, placement, Magic inspection
├── 03_Std_Cell_Design_Magic_ngspice/  # inverter layout, extraction, SPICE characterisation, DRC
├── 04_Timing_Analysis_and_CTS/        # STA setup/hold, ideal vs propagated clock, CTS, skew
├── 05_PDN_Routing_and_Signoff/        # PDN, global/detailed routing, GDS, DRC, antenna
```

Every module folder contains `README.md`, `images/` (screenshots) and `logs/` (trimmed logs/reports).

## Module Progress

| # | Module | Focus | Status |
|---|--------|-------|--------|
| 01 | [Setup & Synthesis](01_Setup_and_Synthesis/) | OpenLane setup, `config.tcl`, Yosys synthesis, cell stats | ✅ Done |
| 02 | [Floorplan & Placement](02_Floorplan_and_Placement/) | Utilisation, aspect ratio, IO placement, global/detailed placement | ✅ Done |
| 03 | [Std Cell Design](03_Std_Cell_Design_Magic_ngspice/) | Inverter layout, parasitic extraction, ngspice characterisation, DRC | ✅ Done |
| 04 | [Timing & CTS](04_Timing_Analysis_and_CTS/) | Setup/hold analysis, clock skew, TritonCTS | ✅ Done |
| 05 | [PDN, Routing & Signoff](05_PDN_Routing_and_Signoff/) | Power grid, routing, GDS, DRC/antenna checks | ✅ Done |



### Pending items
- _None yet. List unfinished labs here with the reason._

## Results Snapshot

Full numbers live in [`results/metrics_summary.md`](results/metrics_summary.md). Copy the headline figures here once the run is complete:

| Metric | Value |
|--------|-------|
| Design | picorv32a |
| Clock period | _fill_ ns |
| Die area | _fill_ µm² |
| Core utilisation | _fill_ % |
| Cell count (post-synth) | _fill_ |
| Flop ratio | _fill_ |
| Setup WNS / TNS (post-CTS) | _fill_ / _fill_ ns |
| Hold WNS (post-CTS) | _fill_ ns |
| Clock skew | _fill_ ns |
| Routing DRC violations (final) | _fill_ |

## Tools & Environment

| Category | Tool |
|----------|------|
| PDK | SkyWater SKY130 (`sky130A`, `sky130_fd_sc_hd`) |
| Flow manager | OpenLane (record your exact version) |
| Synthesis | Yosys, ABC |
| Floorplan / placement / CTS / routing | OpenROAD (RePlAce, OpenDP, TritonCTS), TritonRoute |
| STA | OpenSTA |
| Layout & extraction | Magic |
| Circuit simulation | ngspice |
| OS | Linux (record distro/version) |
| Version control | Git & GitHub |

## How to Reproduce

1. Install OpenLane and the SKY130 PDK following the upstream OpenLane documentation.
2. Copy `design/` contents into `designs/picorv32a/` inside your OpenLane directory (see [`design/README.md`](design/README.md)).
3. Launch the interactive flow and run the commands in [`flow/flow_commands.tcl`](flow/flow_commands.tcl) one stage at a time.
4. Compare your numbers against `results/metrics_summary.md`.

## Author

**Shashank**
MTech, Semiconductor Materials & Devices, IIT Hyderabad | ECE background
Interested in semiconductor fabrication, device physics and the design-technology interface.

Links: [GitHub](https://github.com/) · [LinkedIn](https://linkedin.com/) _(replace with your own)_

## Acknowledgements

Course material and tool flow by VLSI System Design (VSD) and the OpenLane / OpenROAD / Magic / ngspice open-source communities. All notes, results and screenshots in this repository are from my own runs.
