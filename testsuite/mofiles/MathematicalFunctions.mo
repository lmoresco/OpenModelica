// name: MathematicalFunctions
// keywords: builtin, function, math
// status: correct
//
// Testing built-in mathematical functions
//

model MathematicalFunctions
  Real r1 = sin(45);
  Real r2 = cos(45);
  Real r3 = tan(45);
  Real r4 = asin(0.5);
  Real r5 = acos(0.5);
  Real r6 = atan(0.5);
  Real r7 = atan2(0.5,0.5);
  Real r8 = sinh(45);
  Real r9 = cosh(45);
  Real r10 = tanh(45);
  Real r11 = exp(5);
  Real r12 = log(5);
  Real r13 = log10(5);
end MathematicalFunctions;

// Results:
// Result:
// class MathematicalFunctions
// Real r1 = 0.850903524534118;
// Real r2 = 0.52532198881773;
// Real r3 = 1.61977519054386;
// Real r4 = 0.523598775598299;
// Real r5 = 1.0471975511966;
// Real r6 = 0.463647609000806;
// Real r7 = 0.785398163397448;
// Real r8 = 1.74671355287425e+19;
// Real r9 = 1.74671355287425e+19;
// Real r10 = 1.0;
// Real r11 = 148.413159102577;
// Real r12 = 1.6094379124341;
// Real r13 = 0.698970004336019;
// end MathematicalFunctions;
// endResults
// endResult
