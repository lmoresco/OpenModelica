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
// class Overwriting3
//   Real x[1] = 1.0;
//   Real x[2] = 0.0;
//   Real x[3] = 0.0;
// end Overwriting3;
// [Overwriting3.mo:10:3-10:23:writable] Warning: Index modifications: (x[1] = 1.0) are overlapping with array binding modification x={0,0,0} for array component: x. 
// 	The final bindings will be set by the last index modification given for the same index.
// 
// endResult
