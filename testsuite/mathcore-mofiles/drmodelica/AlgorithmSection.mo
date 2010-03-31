// name:     AlgorithmSection
// keywords: algorithm, equation
// status:   correct


model AlgorithmSection
  Real x, z, u;
  parameter Real w = 3, y = 2;
  Real x1, x2, x3;
equation
  x = y*2;
  z = w;
algorithm
  x1 := z  + x;  
  x2 := y  - 5;
  x3 := x2 + y;
equation
  u = x1 + x2;  
end AlgorithmSection;


// fclass AlgorithmSection
// Real x;
// Real z;
// Real u;
// parameter Real w = 3.0;
// parameter Real y = 2.0;
// Real x1;
// Real x2;
// Real x3;
// equation
//   u = x1 + x2;
//   x = 2.0 * y;
//   z = w;
// algorithm
//   x1 := z + x;
//   x2 := y - 5.0;
//   x3 := x2 + y;
// end AlgorithmSection;
// Result:
// fclass AlgorithmSection
// Real x;
// Real z;
// Real u;
// parameter Real w = 3.0;
// parameter Real y = 2.0;
// Real x1;
// Real x2;
// Real x3;
// equation
//   u = x1 + x2;
//   x = 2.0 * y;
//   z = w;
// algorithm
//   x1 := z + x;
//   x2 := y - 5.0;
//   x3 := x2 + y;
// end AlgorithmSection;
// endResult
