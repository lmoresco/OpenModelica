// name:     Tuple1
// keywords: tuple, expression
// status:   correct
// 
// Test of the difference of a one element tuple and an single expression. These should be treated in the same way.

model Tuple1
  Real x, y;
equation
algorithm
  while ((i/10) < y) loop
    x := x + 0.5;
  end while;
end Tuple1;

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
//     if i > 2 then
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
//   when y > 0.9 do
//     x := 0.0;
//   end when;
// end Algorithm1;
