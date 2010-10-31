A full copy of Modelica Standard Library 3.2 build 5:
 http://www.modelica.org/libraries/Modelica

Added by Martin Sjolund, 2010-10-26
Changed: 
- Modelica/Constants.mo
  final constant Integer Integer_inf=2147483647
  to
  final constant Integer Integer_inf=1073741823
  so we get rid of the MetaModelica maxint warning.
