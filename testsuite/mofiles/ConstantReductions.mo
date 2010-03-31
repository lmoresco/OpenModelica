// name:     ConstantReductions
// keywords: declaration
// status:   correct
// 
// Constant evaluation of reductions.
// 

class ConstantReductions
  Real x1, x2, x3, x4;
equation
	x1 = sum(i * 3 for i in {1,3,4,5});
	x2 = min(i for i in 1:5);
	x3 = max(i - 3 for i in 1:4);
	x4 = product(i for i in 1:5);
end ConstantReductions;

// Result:
// fclass ConstantReductions
// Real x1;
// Real x2;
// Real x3;
// Real x4;
// equation
// 	x1 = 39.0;
// 	x2 = 1.0;
// 	x3 = 1.0;
// 	x4 = 120.0;
// end ConstantReductions;
// endResult
