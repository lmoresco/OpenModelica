// name: conn8.mo
// keywords:
// status: correct
//
// FAILREASON: Connects not handled yet.
//

connector C = input Real;

model A
  C c1, c2;
  output C c3;
equation
  connect(c1, c2);
end A;
