// name:     Algorithm1
// keywords: algorithm
// status:   correct
// 
// Simple algorithms

model Algorithm1
  Real x, y;
equation
  y = sin(time);
protected
  Integer i;
algorithm
  i := 0;
  x := y-1.0;
  while ((i/10) < y) loop
    x := x + 0.5;
  end while;
algorithm
  for i in 1:3 loop
    if i > 2 then
      x := x - i;
    end if;
    if i < 1 then
      x := 1.0;
    elseif i < 2 then
      x := 2.0;
    else
      x := 3.0;
    end if;
  end for;
algorithm
  when y>0.9 do
    x := 0.0;
  end when;
end Algorithm1;

// fclass Algorithm1
// 	       String  i.unit;
// 	       Integer i;
// 	       String  x.unit;
// 	       Real    x;
// 	       String  y.unit;
// 	       Real    y;
// equation
//   y = sin(time);
// algorithm
//   i := 0;
//   x := y - 1.0;
//   while Real(i)/Real(10) < y loop
//     x := x + 0.5;
//   end while;
// algorithm
//   for i in 1:3 loop
//     if 2 < i then
// 	 x := x - Real(i);
//     end if;
//     if i < 1 then
// 	 x := 1.0;
//     elseif i < 2 then
// 	 x := 2.0;
//     else
// 	 x := 3.0;
//     end if;
//   end for;
// algorithm
//   when 0.9<y do
//     x := 0.0;
//   end when;
// end Algorithm1;
