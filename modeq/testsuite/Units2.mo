// name:     Units2
// keywords: connect
// status:   incorrect
// 
// Connections of flow variables with non-flow variables are not 
// possible.
//

type Voltage = Real(unit = "V");
type Current = Real(unit = "A");

model Units2
  Voltage v;
  flow Current i;
equation
  connect(v, i);
end Units2;
