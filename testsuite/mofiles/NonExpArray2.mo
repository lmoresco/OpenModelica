// name:     Non-expanded Array 2
// keywords: array
// status:   correct
// cflags:   +a
// 
// This is a simple test of non-expanded array handling which does not work yet.
// The problem is that it is impossible to represent an array expression of unknown size as Values.Value at the moment.
// 

model Array2
  parameter Integer p;
  Real y[p] = fill(0,p);
end Array2;

