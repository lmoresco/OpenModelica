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
// Result:
// Error processing file: Units2.mo
// [Units2.mo:23:3-23:16:writable] Error: Cannot connect flow component i.x to non-flow component v.x
// [Units2.mo:23:3-23:16:writable] Error: The type of variables v and i (Pin1 connector and Pin2 connector) are inconsistent in connect equations
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
