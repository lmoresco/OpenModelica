// name:     Connect6
// keywords: connect,type,unknown
// status:   incorrect
// 
// Strings are not allowed in connectors.  Or are they?
// 

connector C
  String s;
end C;

model Connect6
  C c1,c2;
equation
  connect(c1,c2);
end Connect6;
