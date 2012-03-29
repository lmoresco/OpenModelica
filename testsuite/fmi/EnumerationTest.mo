type Enum = enumeration(
    test1,
    test2,
    test3);
	
model EnumerationTest
  parameter Enum s = Enum.test2;
  Real x;
  Enum ss;
  Real y;
equation
  der(x) = 1;
  ss = if x > 0.5 then s else if x<0.3 then Enum.test3 else Enum.test1;
  y = if ss == Enum.test1 then -x else x;
end EnumerationTest;
