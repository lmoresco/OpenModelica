// name:     SimpleIntegrator4
// keywords: declaration,modification
// status:   incorrect
// 
// Try to access non-existend attribute 'initial'.
//

model SimpleIntegrator4
  Real u = 1.0;
  Real x(initial = 2.0);
equation
  der(x) = u;
end SimpleIntegrator4;
