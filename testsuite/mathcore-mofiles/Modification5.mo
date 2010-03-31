// name:     Modification5
// keywords: modification,scoping
// status:   correct
//
// By removing the declare-before-use this is legal in Modelica.
// Note that declaration equation are seen as equation and
// not as assignments.

class A
  Real x = 17 + 2*x;
end A;

class Modification5
  extends A;
end Modification5;

// Result:
// fclass Modification5
// equation
//   x = real(17) +2*x
// end Modification5;
// endResult
