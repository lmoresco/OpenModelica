// name:     HelloWorld
// keywords: equation
// status:   correct
// 
// Equation handling
// 

model HelloWorld
	Real x(start = 1);
	parameter Real a = 1;
equation
	der(x) = - a * x;
end HelloWorld;

// fclass HelloWorld
// Real x(start = 1.0);
// parameter Real a = 1.0;
// equation
//    der(x) = (-a) * x;
// end HelloWorld;
// Result:
// fclass HelloWorld
// Real x(start = 1.0);
// parameter Real a = 1.0;
// equation
//   der(x) = (-a) * x;
// end HelloWorld;
// endResult
