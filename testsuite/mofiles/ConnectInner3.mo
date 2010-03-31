// name:     ConnectInner3
// keywords: connect,dynamic scoping
// status:   correct
// 
// This demonstrates dynamic scoping for
// connector variables.
// Note the sign for the flow-variables.
//
connector C
  Real e;
  flow Real f;
end C;
model CC
  C c;
end CC;
model A
  outer CC global;
  C my;
equation
  connect(global.c,my);
  my.f=10+my.e;
end A;
model B
  A a;
end B;

model ConnectInner3
  inner CC global;
  B b;
  A a;
equation
  global.c.e=10;
end ConnectInner3;

// Result:
// fclass ConnectInner3
// Real global.c.e;
// Real global.c.f;
// Real b.a.global.c.e;
// Real b.a.global.c.f;
// Real b.a.my.e;
// Real b.a.my.f;
// Real a.global.c.e;
// Real a.global.c.f;
// Real a.my.e;
// Real a.my.f;
// equation
// b.a.my.f = 10.0 + b.a.my.e;
// b.a.global.c.f + -b.a.my.f = 0.0;
// b.a.global.c.e = b.a.my.e;
// a.my.f = 10.0 + a.my.e;
// a.global.c.f + -a.my.f = 0.0;
// a.global.c.e = a.my.e;
// global.c.e = 10.0;
// global.c.f = 0.0;
// a.my.f = 0.0;
// end ConnectInner3;
// endResult
