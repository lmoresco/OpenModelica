// name:     Connect6
// keywords: connect,type
// status:   correct
// 
// Strings are allowed in connectors
// 

connector C
  String s;
end C;

model Connect6
  C c1,c2;
  Boolean b;
equation
  connect(c1,c2);
  c1.s="h";
  b=c2.s=="h"; 
end Connect6;

// fclass Connect4
//   String c1.s;
//   String c2.s;
// equation
//   c1.s=c2.s;
// end Connect4;
