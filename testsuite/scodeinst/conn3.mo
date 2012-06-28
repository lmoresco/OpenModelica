// name: conn3.mo
// keywords:
// status: correct
//
// FAILREASON: Connects not handled yet.
//

connector C
  Real e;
  flow Real f;
end C;

model A
  C c1;
end A;

model B
  A a;
  C c2;
equation
  connect(a.c1, c2);
end B;
