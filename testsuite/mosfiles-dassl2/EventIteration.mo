model EventIteration 
  Real x(start = 1);
  Boolean y(start = false);
  Boolean z(start = false);
  Boolean h1;
  Boolean c1,c2,c3;
equation 
  der(x) = 1;
  h1 = x >= 1.5;
  when y then 
    z = true;
  end when;  
  c1 = pre(z);
  c2 = pre(c1);
  c3 = pre(c2);
  when h1 then 
     y = true;
  end when;  
end EventIteration;

