
model World
  constant Real PI = 3.14159265358979;
  constant Integer N(unit="hej") = 17;
  Real x[N];
equation
  x[N-1] = PI;
end World;
