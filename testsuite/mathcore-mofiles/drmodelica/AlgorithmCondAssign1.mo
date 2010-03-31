// name:     AlgorithmCondAssign1
// keywords: for statement, if statement
// status:   correct
//
// Assignments within if-Statements
//

model CondAssign
  Real x(start = 35);
  Real y(start = 45);
  parameter Real z := 0;
algorithm
  if x > 5 then
    x := 400;
  end if;
  if z > 10 then
    y := 500;
  end if;
end CondAssign;

// fclass CondAssign
// Real x(start = 35.0);
// Real y(start = 45.0);
// parameter Real z = 0.0;
// algorithm
//   if x > 5.0 then
//     x := 400.0;
//   end if;
//   if z > 10.0 then
//     y := 500.0;
//   end if;
// end CondAssign;

// Result:
// fclass CondAssign
// Real x(start = 35.0);
// Real y(start = 45.0);
// parameter Real z = 0.0;
// algorithm
//   if x > 5.0 then
//     x := 400.0;
//   end if;
//   if z > 10.0 then
//     y := 500.0;
//   end if;
// end CondAssign;
// endResult
