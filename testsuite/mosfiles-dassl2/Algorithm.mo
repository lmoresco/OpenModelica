model Alg1 "model with an algorithm for one variable"
  Real x;
algorithm
  x:=1;
  x:=x+1;
end Alg1;

model Alg2 "model with an algorithm for two variables."
  Real x(start=1),y;
algorithm
  x:=1;
  y:=x+1;
end Alg2;

model Alg3 "model with mixed equation and algorithm sections"
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
end Alg3;

model Alg4 "single algorithm with wrong causality"
  Real x,y;
equation 
  der(x)=-x;
algorithm
  x:=y+1;
end Alg4;

  