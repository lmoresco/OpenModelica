//|name:     Algorithm1
//|keywords: algorithm
//|status:   correct
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
  x := y-1;
  while ((i/10) < y) loop
    x := x + 0.5;
  end while;
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
//   x := y - 1;
//   while(i/10 < y) loop
//     x := x + 0.5;
//   end while;
// end Algorithm1;
