// name:     Connect4
// keywords: connect,type,unknown
// status:   incorrect
// 
// Are integers allowed in connectors?
// 

connector C
  Integer i;
end C;

model Connect4
  C c1,c2;
equation
  connect(c1,c2);
end Connect4;
