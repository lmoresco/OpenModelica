class Sample1
  parameter Real  offer=1000;
  Real   storage(start=0);
equation
  when sample(1,1) then
    storage=pre(storage)+offer;
  end when;
end Sample1;
