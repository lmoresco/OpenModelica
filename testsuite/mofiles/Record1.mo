// name:     Record1
// keywords: type
// status:   correct
// 

record A
  Real x = 17.0;
end A;

model Record1
  A a(x=18.0);
end Record1;

// fclass Record1
//   Real a.x;
// equation
//   a.x = 18.0;
// end Record1;
