// name:     Connect5
// keywords: connect,type
// status:   correct
// 
// Booleans are allowed in connectors
// 

connector C
  Boolean b;
end C;

model Connect5
  C c1,c2;
equation
  connect(c1,c2);
  c1.b=time<0.5;
end Connect5;

// Result:
// fclass Connect5
//   Boolean c1.b;
//   Boolean c2.b;
// equation
//   c1.b = time < 0.5;
//   c1.b = c2.b;
// end Connect5;
// endResult
