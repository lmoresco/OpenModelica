// name: conn4.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Connects not handled yet.
//

connector C
  Real e;
  flow Real f;
end C;

model A
  C c1, c2;
equation
  connect(C, c2);
end A;
