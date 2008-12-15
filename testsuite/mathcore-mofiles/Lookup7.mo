// name:     Lookup7
// keywords: scoping
// status:   incorrect
// 
// Modelica uses lexical scoping.
// 

class A
  Real x = y;
end A;

class Lookup7
  Real y;
  A a;
end Lookup7;
