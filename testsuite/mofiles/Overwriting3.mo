// name:     Overwriting3
// keywords: modification,equation
// status:   correct
// 
// The declaration in class A defines three quations for x[1], x[2],
// and x[3]. The equation for x[1] is modified in Overwriting3.
//

class A 
  Real x[3] = zeros(3);
end A;

class Overwriting3 = A(x[1]=1.0);

// Result:
// fclass Overwriting3
//   Real x[1];
//   Real x[2];
//   Real x[3];
// equation
//   x[1] = 1.0;
//   x[2] = Real(0);
//   x[3] = Real(0);
// end Overwriting3;
// endResult
