//|name:     DisturbedResistance1
//|keywords: modification
//|status:   incorrect
// 
// A parameter must not be time-varying.
//

model Resistor
  Real u, i;
  parameter Real R = 1.0;
equation
  u = R*i;
end Resistor;

model DisturbedResistance1
  extends Resistor(R = 1.0 + 0.1*sin(time));
end DisturbedResistance1;
