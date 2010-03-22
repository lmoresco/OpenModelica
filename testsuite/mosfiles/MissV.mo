model MissV
  Real pb(start = 12000000);
  Real Qb;
  Real pa(start = 12000000); 
  Real Qa;
  parameter Real s = 1e-3;
  parameter Real v = 5e3;

equation
  der(pb) = (Qb - v)/s;
  der(pa) = (Qa - v)/s;
  pa = pb;
  Qa + Qb = 0;
end MissV; 