// name: conn5.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
//
// FAILREASON: Connects not handled yet.
//

connector C1
  Real x;
end C1;

connector C2
  C1 c;
  flow Real f;
end C2;

model A
  C2 c1, c2;
equation
  connect(c1.f, c2.c);
end A;
