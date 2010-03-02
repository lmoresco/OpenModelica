model when_sorting
  Real x;
  Real y;
  Boolean w(start=true);
  Boolean v(start=true);
  Boolean z(start=true);
equation 
  when y > 2 and pre(z) then
    w=false;
  end when;
  when y > 2 and z then
    v=false;
  end when;
  when x>2 then
    z=false;
  end when;
  when sample(0,1) then
    x=pre(x)+1;
    y=pre(y)+1;
  end when;
end when_sorting;
