// name: Exp
// keywords: exp
// status: correct
//
// Tests the built-in exp function
//

model Exp
  Real r;
equation
  r = exp(45);
end Exp;

// Result:
// fclass Exp
// Real r;
// equation
//   r = 3.49342710574851e+19;
// end Exp;
// endResult
