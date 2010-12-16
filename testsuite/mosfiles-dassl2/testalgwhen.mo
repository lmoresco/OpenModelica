model testalgwhen 
  Boolean b;
  Real r;
  Real x(start=1);
  Real y(start=0);
  Real z(start=0);
  Real w(start=0);
  Real v(start=0);
  Real tt;
equation 
  der(x) = 1;
  b = time >= 0.9;
algorithm 
  r := x + y;
  if edge(b) then
    tt := time;
  end if;
  when r > 1.1 then
    z := x + y + r;
  elsewhen {r > 1.1,r>1.2} then
    v := r;
  elsewhen {b,not b} then
    v := r;
  end when;
  
equation 
  der(y) = r;
  when r > 2 and r > 1.1 then
    w = y;
  end when;
  
end testalgwhen;
