// name:     SimpleIntegrator1
// keywords: declaration,equation
// status:   erroneous
// 
// In this example 'x' is defined twice: constant and
// non-constant. But this is not something we need to worry about.
//

model SimpleIntegrator1
  Real u = 1.0;
  Real x = 2.0;
equation
  der(x) = u;
end SimpleIntegrator1;

// fclass SimpleIntegrator1
//   Real u;
//   Real x;
// equation
//   u = 1.0;
//   x = 2.0;
//   der(x) = u;
// end SimpleIntegrator1;

