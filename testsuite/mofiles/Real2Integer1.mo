// name:     Real2Integer1
// keywords: type
// status:   incorrect
//
// No implicit conversion from 'Real' to 'Integer'. But integers are 
// converted to reals in equations with real-expressions.
// 

class Real2Integer1
  Real a = 5.6;
  Integer n = a;
end Real2Integer1;

// Result:
// class Real2Integer1
//   Real a;
//   Integer n;
// equation
//   a = 5.6;
//   Real(n) = a;
// end Real2Integer1;
// endResult
