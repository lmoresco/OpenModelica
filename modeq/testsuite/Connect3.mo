// name:     Connect3
// keywords: connect,unknown
// status:   correct
// 
// Connection of two reals is not specifically allowed in the report,
// but it seems that at least some people thought that it should be
// possible.
// 

model Connect3
  Real e1,e2;
  flow Real f1,f2;
equation
  connect(e1,e2);
  connect(f1,f2);
end Connect3;

// fclass Connect3
//   Real e1;
//   Real e2;
//   Real f1;
//   Real f2;
// equation
//   e1 = e2;
//   -f1 + -f2 = 0.0;
// end Connect3;
