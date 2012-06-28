// name: conn8.mo
// keywords:
// status: correct
//
// FAILREASON: Connects not handled yet. Should generate equations for
// unconnected flows.
//

connector C
  Real e;
  Real f;
  Real s;
end C;

model A
  flow C c;
end A;
