// name:     PolynomialEvaluator1
// keywords: function, algorithm, scoping, array
// status:   correct


function polyeval
  input Real a[3];
  input Real x = 1;
  output Real y;
protected
  Real xpower;
algorithm
  y := 0;
  xpower := 1;
  for i in 1:size(a,1) loop
    y := y + a[i]*xpower;
    xpower := xpower * x;
  end for;
end polyeval;

model PolynomialEvaluator1
  Real inVector[3] = {3,8,5};
  Real result;
equation
  result = polyeval(inVector);
end PolynomialEvaluator1;


// function polyeval
// input Real a;
// input Real x;
// output Real y;
// Real xpower;
// equation
//   x = 1.0;
// algorithm
//   y := 0.0;
//   xpower := 1.0;
//   for i in 1:size(a,1) loop
//     y := y + a[i] * xpower;
//     xpower := xpower * x;
//   end for;
// end polyeval;
// 
// fclass PolynomialEvaluator1
// Real inVector[1];
// Real inVector[2];
// Real inVector[3];
// Real result;
// equation
//   inVector[1] = 3.0;
//   inVector[2] = 8.0;
//   inVector[3] = 5.0;
//   result = polyeval(inVector);
// end PolynomialEvaluator1;