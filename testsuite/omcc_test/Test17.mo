
 
 // name:Test17.mo    
// keywords: this tests algorithmic constructs with equation and algorithm statements
// status:   correct
 

 model Algorithmtest
  Real x, z, u;
  parameter Real w = 3, y = 2;
  Real x1, x2, x3;
equation
  x = y*2;
  z = w;
algorithm
  x1 := z  + x;
  x2 := y  - 5;
  x3 := x2 + y;
equation
  u = x1 + x2;
end Algorithmtest;



// succeed
// omcc- v.2012