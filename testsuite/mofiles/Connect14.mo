// name: Connect14
// keywords:  connector, primitive types 
// status: correct
//
// Test that all primitive types can be used in connectors.
// 
connector BooleanSignal = Boolean;


connector StrangeConnector
  String s;
  Boolean b;
  Integer n;
  Real x;
end StrangeConnector;

model Connect14
  StrangeConnector c1,c2;
  BooleanSignal b2;
equation
  connect(c1,c2);
  connect(c1.b,b2);
end Connect14;
// Result:
// fclass Connect14
// String c1.s;
// Boolean c1.b;
// Integer c1.n;
// Real c1.x;
// String c2.s;
// Boolean c2.b;
// Integer c2.n;
// Real c2.x;
// Boolean b2;
// equation
//   c1.b = c2.b;
//   c2.b = b2;
//   c1.x = c2.x;
//   c1.n = c2.n;
//   c1.s = c2.s;
// end Connect14;
// endResult
