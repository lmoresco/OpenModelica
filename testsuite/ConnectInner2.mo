
// name:     ConnectInner2
// keywords: connect,dynamic scoping
// status:   incorrect
// 
// The inner connector must be declared 'inner'.
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
