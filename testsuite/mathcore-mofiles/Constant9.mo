// name:     Constant9
// keywords: constant, package
// status:   incorrect
// 
// Lookup of variables in packages must result in variable being constant. Parameters and variables
// are not allowed to look up in packages.


package A
  parameter Real x=1;
end A;

model test
  Real x=A.x;
end test;
