// name:     Function5
// keywords: function,unknown
// status:   correct
// 
// Decarling a function as `class' seems to be allowed.  I wonder if
// any implementation will allow this...
// 

class f
  input Real x;
  output Real y;
algorithm
  y := x * 2.0;
end f;

model Function5
  Real a,b;
equation
  a = f(b);
end Function5;

// fclass Function5
//   Real a;
//   Real b;
// equation
//   a = f(b);
// end Function5;
