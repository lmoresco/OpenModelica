//|name:     Faculty2
//|keywords: algorithm
//|status:   correct
// 
// Definition of faculty using a for loop. The for loop can not be
// unrolled.
//

function Faculty2
  input Integer x;
  output Integer y;
  Integer i;
algorithm
  y := 1;
  for i in 2:x loop
    y := i * y;
  end for;
end Faculty2;

// fclass Faculty2
//   Integer x;
//   Integer y;
//   Integer i;
// equation
// algorithm
//   y := 1;
//   for i in (2:x) loop
//     y := i * y;
//   end for;
// end Faculty2;

