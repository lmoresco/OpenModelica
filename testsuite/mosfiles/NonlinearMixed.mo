model NonlinearMixed
  Real x( start=0);
  Real y( start=0);
  Real z( start=0);
  discrete Boolean a( start=false);
equation
  a = x < -1;
  (x+y)^2 = if a then time else 0;
  (y+z)^2 = if a then 0 else time;
  (z+x)^2 = 0;
end NonlinearMixed;

