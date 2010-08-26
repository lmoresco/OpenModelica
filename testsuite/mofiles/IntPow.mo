// name: IntPow
// keywords: integer, power
// status: correct
//
// tests Integer powers
//

model IntPow
  constant Integer i = 8 ^ 3;
end IntPow;

// Result:
// class IntPow
// constant Integer i = 512;
// end IntPow;
// endResult
