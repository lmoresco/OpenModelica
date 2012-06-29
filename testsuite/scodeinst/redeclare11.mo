// name: redeclare11.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// 
//

model ModelA
  parameter Real a = 10 ;
end ModelA;

model ModelB
  replaceable model Model = ModelA;
  Model m;
end ModelB;
 
model Test3
  model ModelA1 = ModelA(final a = 1);

  ModelB b( redeclare model Model = ModelA(a = 1));
  ModelB b1( redeclare model Model = ModelA1);
  ModelA1 a;
end Test3;

// Result:
// 
// EXPANDED FORM:
// 
// class Test3
//   parameter Real b.m.a = 1;
//   parameter Real b1.m.a = 1;
//   parameter Real a.a = 1;
// end Test3;
// 
// 
// Found 0 components and 3 parameters.
// class Test3
//   parameter Real b.m.a = 1.0;
//   parameter Real b1.m.a = 10.0;
//   parameter Real a.a = 1.0;
// end Test3;
// endResult