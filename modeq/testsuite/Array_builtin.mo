// name:     Array1
// keywords: array
// status:   correct
// 
// This is a simple test of basic array handling.
// 

model Array1
   Real x=1.0;
   Real y=2.0;
   Integer q;
   Integer A1[5]=[1,2,3,4,5];
   algorithm
//   der(A1)=y;
//   y=der(A1);
    x:=ndims(A1);
    x:=sin(y);
end Array1;

// fclass Array1
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
// end Array1;
