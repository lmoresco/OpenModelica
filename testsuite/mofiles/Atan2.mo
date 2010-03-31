// name: Atan2
// keywords: atan2
// status: correct
//
// Tests the built-in atan2 function
//

model Atan2
  Real r;
equation
  r = atan2(0.5,0.5);
end Atan2;

// Result:
// fclass Atan2
// Real r;
// equation
//   r = 0.785398163397448;
// end Atan2;
// endResult
