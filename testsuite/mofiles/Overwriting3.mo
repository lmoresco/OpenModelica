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
//   Real x[1] = 1.0;
//   Real x[2] = 0.0;
//   Real x[3] = 0.0;
// end Overwriting3;
// endResult
