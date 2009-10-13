// name:     Type3
// keywords: type
// status:   incorrect
// 
// This should give a type error because the expression i/4 is of
// type Real.

class Type3
  Integer i = 16;
  Real x[100];
equation
  x[i/4] = 0.5;
end Type3;
