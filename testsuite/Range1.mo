// name:     Range1
// keywords: array
// status:   correct
// 
// Some tests of range expressions.
// 

class Range1
  Integer x[5] = 1:5;
  Integer y[5], z[5];
equation
  for i in 1:5 loop
    y[i] = x[i] + 1;
  end for;

  for i in 1:2:5 loop
    z[i] = x[i] + 2;
  end for;
  z[2]=1;
  z[4]=2;
end Range1;

// fclass Range1
//   Integer x[1];
//   Integer x[2];
//   Integer x[3];
//   Integer x[4];
//   Integer x[5];
// equation
//   x[1] = 1;
//   x[2] = 2;
//   x[3] = 3;
//   x[4] = 4;
//   x[5] = 5;
//   y[1] = x[1] + 1;
//   y[2] = x[2] + 1;
//   y[3] = x[3] + 1;
//   y[4] = x[4] + 1;
//   y[5] = x[5] + 1;
//   z[1] = x[1] + 2;
//   z[3] = x[3] + 2;
//   z[5] = x[5] + 2;
//   z[2] = 1;
//   z[4] = 2;
// end Range1;
