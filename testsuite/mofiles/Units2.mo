// name:     Units2
// keywords: connect
// status:   incorrect
// 
// Connections of flow variables with non-flow variables are not 
// possible.
//

type Voltage = Real(unit = "V");
type Current = Real(unit = "A");


connector Pin1
  Voltage x;
end Pin1;
connector Pin2
  flow Current x;
end Pin2;
model Units2
  Pin1 v;
  Pin2 i;
equation
  connect(v, i);
end Units2;
