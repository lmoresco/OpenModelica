// name:     Non-expanded Array1
// keywords: array
// status:   correct
// cflags:   +a
// 
// This is a simple test of non-expanded array handling.
// 

model Array1
  parameter Integer p;
  Real x[5] = {1,2,3,4,5};
  Real y[p];
end Array1;

// Result:
// class Array1
//   parameter Integer p;
//   Real x[1:5] = {1.0, 2.0, 3.0, 4.0, 5.0};
//   Real y[1:p];
// end Array1;
// Warning: Parameter p has neither value nor start value, and is fixed during initialization (fixed=true)
// 
// endResult
