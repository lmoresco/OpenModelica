// name:     SimpleIntegrator2
// keywords: declaration,equation,modification
// status:   correct
// 
// Correct formulation of a simple integrator example.
//

model SimpleIntegrator2
  Real u = 1.0;
  Real x(start = 2.0);
equation
  der(x) = u;
end SimpleIntegrator2;

// fclass SimpleIntegrator2
//   Real u;
//   Real x;
//   parameter Real x.start;
// equation
//   u = 1.0;
//   x.start = 2.0;
//   der(x) = u;
// end SimpleIntegrator2;
