// name:     DisturbedResistance3
// keywords: modification
// status:   incorrect
// 
// This is an example of replacing a variable without using 
// redeclaration syntax. 
// 
// This was made illegal in Modelica 1.4 since it depends
// very much on declaration order.
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
//   Real u;
//   Real i;
//   Real R;
// equation
//   R = 1.0 + 0.1*sin(time);
//   u = R*i;
// end DisturbedResistance3;
