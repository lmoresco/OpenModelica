// name:     Shadow1
// keywords: modification,shadow
// status:   correct
// 
// This test shows what shadowing of variable names can do. Especially
// the replacing of equation where the LHS is a simple variable name.
//
// In my opinion, this is a very dubious feature, which I'm not sure
// is a good idea at all.
//
// The x = 1 equation is shadowed by the modification.

class A
  Real x=1.0;
  // Real y[17];
equation
  x = 1;
  // y[3] = 4;
end A;

model Shadow1
  A a(x = 2.0 /*, y[3] = 5.0 */ );
end Shadow1;

// fclass Shadow1
//   Real a.x;
//   Real a.b.x;
// equation
//   a.x = 2.0;
// end Shadow1;

