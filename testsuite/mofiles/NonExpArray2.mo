// name:     Non-expanded Array 2
// keywords: array
// status:   correct
// cflags:   +a
// 
// This is a simple test of non-expanded array handling 
// with array expressions which cannot be ceval-ed because of indefinite dimensions. 
// 

model Array2
  parameter Integer p;
  Real x[p](start = fill(0.0,p));
  Real y[p] = fill(0.0,p);
end Array2;

// Result:
// class Array2
//   parameter Integer p;
//   Real y[1:p] = fill(0.0,p);
//   Real x[1:p](start = fill(0.0,p));
// end Array2;
// Warning: Parameter p has neither value nor start value, and is fixed during initialization (fixed=true)
// 
// endResult
