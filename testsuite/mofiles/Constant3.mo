// name:     Constant3
// keywords: declaration,array
// status:   correct
// 
// Basic constant definitions.
// 

class Constant3
  constant Integer N = 3;
  Real x[N];
equation
  x[N-1] = 2.0;
  x[{1,N}] = {1,time};
end Constant3;

// fclass Constant3
//   constant Integer N;
//   Real x[1];
//   Real x[2];
//   Real x[3];
// equation
//   N = 3;
//   x[N-1] = 2.0;
//   x[1]   = 1;
//   x[N]   = time;
// end Constant3;
