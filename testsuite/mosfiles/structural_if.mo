model test 
  Real x(start=3),y(start=1),z(start=1),w;
  Boolean b(start=false);
  discrete Real h;

equation
when {x<= 2} then
  b= true;
  h=1.0;
end when;
  der(x)=-2*x;
  der(x)=if b then 2*der(y) else der(z);
  w=2*der(x);
  w= if b then 2*der(z) else -der(y);
end test;

