model NonLinSys 
  Real x(start=1);
equation 
  der(x)=sin(der(x)+1)-x;
end NonLinSys;

