// name:     Array5
// keywords: array
// status:   correct
// 
// This is a variant of Array1, but with the equations in an equation section.
// 

model Array5
  Integer x[5];
  Integer y[3];
equation
  x = [1,2,3,4,5];
  y = 1:3;
end Array5;

// fclass Array5
//   Integer x[1];
//   Integer x[2];
//   Integer x[3];
//   Integer x[4];
//   Integer x[5];
//   Integer y[1];
//   Integer y[2];
//   Integer y[3];
// equation
//   x[1] = 1;
//   x[2] = 2;
//   x[3] = 3;
//   x[4] = 4;
//   x[5] = 5;
//   y[1] = (1:3)[1];
//   y[2] = (1:3)[2];
//   y[3] = (1:3)[3];
// end Array5;
