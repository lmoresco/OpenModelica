// record.mdc

type Real = RealType;

record A
  Real x = 17;
end A;

model World
  A a(x=18);
end World;

// Equations:
//
//   a.x = 18
//
