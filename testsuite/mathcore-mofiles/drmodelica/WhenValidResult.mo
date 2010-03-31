// name:     WhenValidResult
// keywords: when
// status:   correct
// 


model WhenValidResult
  Real x;
  Real y;
equation
  x + y = 5;                  // Equation to be used to compute x
  when sample(0, 2) then 
    y = 7; // - 2*x;              // Correct, y is a result variable from the when
  end when;   
end WhenValidResult;

// fclass WhenValidResult
// Real x;
// Real y;
// equation
//   x + y = 5.0;
//   when sample(0,2) then
//   y = 7.0;
//   end when;
// end WhenValidResult;
// Result:
// fclass WhenValidResult
// Real x;
// Real y;
// equation
//   x + y = 5.0;
//   when sample(0,2) then
//   y = 7.0;
//   end when;
// end WhenValidResult;
// endResult
