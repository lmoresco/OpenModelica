// name:     DisturbedResistance4
// keywords: modification
// status:   incorrect
// 
// Finalized objects shall not be overwritten.
//

model Resistor
  Real u, i;
  final parameter Real R = 1.0;
equation
  u = R*i;
end Resistor;

model DisturbedResistance4
  Real R = 1.0 + 0.1*sin(time);
  extends Resistor;
end DisturbedResistance4;

// Result:
// fclass DisturbedResistance4
// Real u;
// Real i;
// Real R;
// equation
// R = 1.0 + 0.1*sin(time);
// u = R*i;
// end DisturbedResistance4;
// endResult
