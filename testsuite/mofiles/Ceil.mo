// name: Ceil
// keywords: ceil
// status: correct
//
// Tests the built-in ceil function
//

model Ceil
  Real r;
equation
  r = ceil(4.5);
end Ceil;

// Result:
// fclass Ceil
// Real r;
// equation
//   r = 5.0;
// end Ceil;
// endResult
