model Init1 
   Real x;
   Real y;
equation
   der(x) = 2*x*y-3*y;
   der(y)= 5*y-7*x*y;
initial equation
   x=5;
   y=5;
end Init1;

model Init2
   Real x(start=5);
   Real y(start=5);
equation
   der(x) = 2*x*y-3*y;
   der(y)= 5*y-7*x*y;
end Init2;

model Init3
   Real x(start=5);
   Real y(start=5);
equation
   der(x) = 2*x*y-3*y;
   der(y)= 5*y-7*x*y;
initial equation
   x=3;
   y=4;
end Init3;
