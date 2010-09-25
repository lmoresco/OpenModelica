A full copy of Modelica Standard Library 1.6

Added by Martin Sjolund, 2010-09-25
Changed: 
- Modelica/Constants.mo
  final constant Integer Integer_inf=2147483647
  to
  final constant Integer Integer_inf=1073741823
  so we get rid of the MetaModelica maxint warning.
