// name:     SimpleIntegrator3
// keywords: declaration,equation
// status:   correct
// 
// Specify predefined attribute in an equation section.
//

model SimpleIntegrator3
  Real u = 1.0;
  Real x;
equation
  x.start = 2.0;
  der(x) = u;
end SimpleIntegrator3;

// fclass SimpleIntegrator3
//   Real u;
//   Real x;
//   parameter Real x.start;
// equation
//   u = 1.0;
//   x.start = 2.0;
//   der(x) = u;
// end SimpleIntegrator3;
