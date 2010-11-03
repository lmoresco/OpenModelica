#!/bin/bash

MMDIRS="01_experiment 02a_exp1 02b_exp2 03_symbolicderivative 04_assignment 05a_assigntwotype 05b_modassigntwotype 06_advanced 08_pam 09_pamdecl 10_pamtrans 11_petrol"

for DIR in $MMDIRS; do
  sed s/%NAME%/$DIR/ project.in > $DIR/.project
  sed s/%TARGET%/Makefile.omc/ tool.launch.in | sed s/%ENABLED%/true/ > $DIR/.externalToolBuilders/OMC.launch
  sed s/%TARGET%/Makefile.rml/ tool.launch.in | sed s/%ENABLED%/false/ > $DIR/.externalToolBuilders/RML.launch
done

