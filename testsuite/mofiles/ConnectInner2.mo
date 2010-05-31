
// name:     ConnectInner2
// keywords: connect,dynamic scoping
// status:   correct
// 
// The inner connector must be declared 'inner'. Generate a warning.
//
connector C
  Real e;
  flow Real f;
end C;
model A
  outer C global;
  C my;
equation
  connect(global,my);
  my.f=10+my.e;
end A;
model B
  A a;
end B;

model ConnectInner2
  C global;
  B b;
  A a;
equation
  global.e=10;
end ConnectInner2;


// Result:
// fclass ConnectInner2
//   Real global.e;
//   Real global.f;
//   Real b.a.global.e;
//   Real b.a.global.f;
//   Real b.a.my.e;
//   Real b.a.my.f;
//   Real a.global.e;
//   Real a.global.f;
//   Real a.my.e;
//   Real a.my.f;
// equation
//   b.a.my.f = 10.0 + b.a.my.e;
//   a.my.f = 10.0 + a.my.e;
//   global.e = 10.0;
//   b.a.global.f + b.a.my.f = 0.0;
//   b.a.global.e = b.a.my.e;
//   a.global.f + a.my.f = 0.0;
//   a.global.e = a.my.e;
//   global.f = 0.0;
// end ConnectInner2;
// [ConnectInner2.mo:20:3-20:6:readonly] Warning: Variable b.a: No corresponding 'inner' declaration found for component b.a.global declared as 'outer '.
// 	Please declare an 'inner' component with the same name in the top scope.
// 	Continuing flattening by only considering the 'outer' component declaration.
// [ConnectInner2.mo:26:3-26:6:readonly] Warning: Variable a: No corresponding 'inner' declaration found for component a.global declared as 'outer '.
// 	Please declare an 'inner' component with the same name in the top scope.
// 	Continuing flattening by only considering the 'outer' component declaration.
// 
// endResult
