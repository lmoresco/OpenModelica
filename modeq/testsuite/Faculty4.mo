// name:     Faculty4
// keywords: equation,array
// status:   correct
// 
// Definition of faculty using equations. It is a matter of 
// quality of implementation if the model can be treated with 
// 'x' being a parameter. In the expected result given here 'x' 
// is treated constant.
//

block Faculty4
  parameter Integer x(min = 0) = 4;
  Integer work[x];
  output Integer y;
equation
  if x < 2 then
    y = 1;
  else
    y = work[x];
    work[x:-1:2] = work[x-1:-1:1] * (ones(x-1) + work[x-1:-1:1]);
    work[1] = 1;
  end if;
end Faculty4;

// fclass Faculty4
//   parameter Integer x;
//   parameter Integer x.min;
//   Integer work[x];
//   output Integer y;
// equation
//   x = 4;
//   x.min = 0;
//   if x < 2 then
//     y = 1;
//   else
//     y = work[4];
//     work[4] = work[3] * (1 + work[3]);
//     work[3] = work[2] * (1 + work[2]);
//     work[2] = work[1] * (1 + work[1]);
//     work[1] = 1;
//   end if;
//   assert(x >= x.min);
// end Faculty4;
