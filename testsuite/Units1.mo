// name:     Units1
// keywords: connect,modification
// status:   erroneous
// 
// Conversion between units is not supported within the Modelica 
// language. Consequently in the following example the generation 
// of equations from connect statements does not depend on the 
// specified units. The model is thus incorrect.
//

type Voltage = Real(unit = "V");
type Current = Real(unit = "A");

connector Pin1
  Voltage v(unit="kV");
  flow Current i;
end Pin1;

connector Pin2
  Voltage v;
  flow Current i;
end Pin2;

model Units1
  Pin1 p1;
  Pin2 p2;
equation
  connect(p1,p2);
  p1.v=0;
  p2.i=1;
end Units1;

// fclass Units1
//   Real p1.v;
//   Real p1.i;
//   Real p2.v;
//   Real p2.i;
// equation
//   p1.v.unit = "kV";
//   p2.v.unit = "V";
//   p1.i.unit = "A";
//   p2.i.unit = "A";
//   p1.v = p2.v;
//   p1.i+p2.i= 0;
// end Units1;
