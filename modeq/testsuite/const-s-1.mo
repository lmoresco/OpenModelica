
model World
  constant Real PI = 3.14159265358979;
  constant Integer N(unit="hej") = 17;
  Real x[N];
equation
  x[N-1] = PI;
end World;

// 
// fclass World
//   PI = 3.14159265358979;
//   N = 17;
//   N.unit = "hej";
//   x[N - 1] = PI;
// end World;
