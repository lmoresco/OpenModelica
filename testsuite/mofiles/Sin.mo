// name: Sin
// keywords: sin
// status: correct
//
// Tests the built-in sin function
//

model Sin
  Real r;
equation
  r = sin(45);
end Sin;

// Result:
// class Sin
// Real r;
// equation
//   r = 0.850903524534118;
// end Sin;
// endResult
