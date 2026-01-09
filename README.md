# SU2 Gmsh Mesh and Configuration File Repository

This repository contains configuration files and computational meshes generated using **Gmsh** for simulations with the **SU2 CFD solver**.

## Folder Structure

### 2D slit burner folder  
Contains the files required to simulate a **2D premixed laminar flame stabilised in an isothermal slit burner** using SU2:
- `.geo` — Gmsh geometry definition
- `.su2` — Mesh file for SU2
- `.cfg` — SU2 configuration file

### 2D slit burner CHT folder</u>  
Contains the files required to simulate a **2D premixed laminar flame stabilised in a slit burner with conjugate heat transfer (CHT)**:
- `.geo` — Gmsh geometry definitions. Files ending with `fluid.geo` and `solid.geo` define the computational geometry for the fluid and solid zones, respectively.
- `.su2` — SU2 mesh files. Files ending with `fluid_mesh.su2` and `solid_mesh.su2` provide the meshes for the fluid and solid zones, respectively. File ending with `mesh.su2` contains both meshes combined into a single file, as required for multizone simulations.
- `.cfg` — SU2 configuration files. Files ending with `fluid.cfg` and `solid.cfg` define the numerical setup for the fluid and solid zones, respectively. The file `master.cfg` defines the multiphysics coupling setup.

## Repository Tree

```text
SU2-Gmsh-Mesh-Repository/
├── 2D_slit_burner/
│   ├── *.geo
│   ├── *.su2
│   └── *.cfg
│
├── 2D_slit_burner_CHT/
│   ├── fluid.geo
│   ├── solid.geo
│   ├── fluid_mesh.su2
│   ├── solid_mesh.su2
│   ├── mesh.su2
│   ├── fluid.cfg
│   ├── solid.cfg
│   └── master.cfg
│
└── README.md
