// name:     Connect4
// keywords: connect,type,unknown
// status:   correct
// 
// Integers are allowed in connectors
// 

connector C
  Integer i;
end C;

model Connect4
  C c1,c2;
equation
  connect(c1,c2);
  c1.i=integer(time*10);
end Connect4;

// fclass Connect4
//   Integer c1.i;
//   Integer c2.i;
// equation
//   c1.i=c2.i;
// end Connect4;
