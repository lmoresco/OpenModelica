// name:     Min & Max 
// keywords: builtin functions min max
// status:   correct
// 
// Usage of the min and max functions
model MinMax
  Real x[max(n,m)];
  Real y[max([n,m])];
  parameter Integer n=min(m,3);
  parameter Integer m = 4;
equation
  x= fill(1.0,max(n,m));
end MinMax;
// Result:
// fclass MinMax
// Real x[1];
// Real x[2];
// Real x[3];
// Real x[4];
// Real y[1];
// Real y[2];
// Real y[3];
// Real y[4];
// parameter Integer n = min(m,3);
// parameter Integer m = 4;
// equation
//   x[1] = 1.0;
//   x[2] = 1.0;
//   x[3] = 1.0;
//   x[4] = 1.0;
// end MinMax;
// endResult
