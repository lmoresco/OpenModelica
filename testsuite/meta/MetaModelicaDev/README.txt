MetaModelica exercises pack
---------------------------

For Windows you need to have installed:
- OpenModelica 1.4.2 (1.5.0 or later recommended)
- Latest OMDev-mingw-msvc.zip unpacked, and OMDEV environment variable set.
- Java 5.0
- Eclipse 3.5 (or later) with the latest MDT

Point your Eclipse workspace to this directory.
(File->Switch Workspace->/path/to/MetaModelica)
Add as new Modelica projects (if they are not already there):
01_experiment
02a_exp1
02b_exp2
03_symbolicderivative
04_assignment
05a_assigntwotype
05b_modassigntwotype
06_advanced
08_pam
09_pamdecl
10_pamtrans
11_petrol
documentation

Add as new Java project:
07_OMCAndCorba

NOTES:
- When working with an exercise, close all 
  the other projects and leave just the 
  current exercise project open.
- Each exercise has a README.txt in it with assignments.
- Exercises 08->11 are just as examples 
  of how to model different languages 
  using MetaModelica.

If you need any help with anything just contact 
Adrian Pop or Martin Sjölund [{adrpo,marsj}@ida.liu.se]

2009-10-21: Modified makefiles, added previosuly missing files and 03_symbolicderivative. Martin Sjölund.
2007-08-28: Original version. Adrian Pop.