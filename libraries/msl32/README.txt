A full copy of Modelica Standard Library 3.2 beta:
 https://svn.modelica.org/projects/Modelica/tags/v3.2-beta2_build2

Added by Martin Sjolund, 2010-09-24
Changed: 
- Modelica/Constants.mo
  final constant Integer Integer_inf=2147483647
  to
  final constant Integer Integer_inf=1073741823
  so we get rid of the MetaModelica maxint warning.
