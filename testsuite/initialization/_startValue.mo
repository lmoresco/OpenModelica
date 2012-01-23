model startValue
  Real x(start=-3);
  Real y(start=-3);
initial equation 
  x^2 = 10;
equation 
  der(x) = time;
  y = x;
end startValue;
