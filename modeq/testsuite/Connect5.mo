// name:     Connect5
// keywords: connect,type,unknown
// status:   incorrect
// 
// Are booleans allowed in connectors?
// 

connector C
  Boolean b;
end C;

model Connect5
  C c1,c2;
equation
  connect(c1,c2);
end Connect5;
