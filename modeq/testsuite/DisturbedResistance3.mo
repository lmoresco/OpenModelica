// name:     DisturbedResistance3
// keywords: modification
// status:   correct
// 
// This is an example of replacing a variable without using 
// redeclaration syntax. In this way a parameter can be replaced 
// by a variable.
//

model Resistor
  Real u, i;
  parameter Real R = 1.0;
equation
  u = R*i;
end Resistor;

model DisturbedResistance3
  Real R = 1.0 + 0.1*sin(time);
  extends Resistor;
end DisturbedResistance3;

// fclass DisturbedResistance3
//   Real R;
//   Real u;
//   Real i;
// equation
//   R = 1.0 + 0.1*sin(time);
//   u = R*i;
// end DisturbedResistance3;
