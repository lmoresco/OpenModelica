// name:     VanDerPol
// keywords: equation
// status:   correct

model VanDerPol	"Van der Pol oscillator model"
  Real x(start = 1);
  Real y(start = 1);	
  parameter Real lambda = 0.3;
equation
  der(x) = y;	
  der(y) = - x + lambda*(1 - x*x)*y;	
end VanDerPol;

// fclass VanDerPol
// Real x(start = 1.0);
// Real y(start = 1.0);
// parameter Real lambda = 0.3;
// equation
//   der(x) = y;
//   der(y) = lambda * ((1.0 - x ^ 2.0) * y) - x;
// end VanDerPol;
