model Sample2
 Real x(start=1),y;
 Boolean b;
equation
  when sample(0,0.1) and x > 1 then
     y = pre(y) + time;
  end when;
  der(x) = x+y;
  when x > 5 or sample(1,1) then
    b = not b;
  end when;
  when b then
    reinit(x,0.1);
  end when;
end Sample2;
