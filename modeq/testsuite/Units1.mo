// name:     Units1
// keywords: connect,modification
// status:   erroneous
// 
// Conversion between units is not supported within the Modelica 
// language. Consequently in the following example the generation 
// of equations from connect statements does not depend on the 
// specified units.
//

type Voltage = Real(unit = "V");
type Current = Real(unit = "A");

model Units1
  Voltage v1, v2(unit = "kV");
  Current i;
equation
  connect(v1, v2);
  connect(v1, i);
end Units1;

// fclass Units1
//   Real v1;
//   Real v2;
//   Real i;
// equation
//   v1.unit = "V";
//   v2.unit = "kV";
//   i.unit = "A";
//   v1 = v2;
//   v1 = i;
// end Units1;
