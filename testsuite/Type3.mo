// name:     Type3
// keywords: type
// status:   incorrect
// 
// This should give a type error because the expression i/4 is not of
// type Real.

class A
  Integer i = 17;
  Real x[100];
equation
  x[i/4] = 0.5;
end A;
