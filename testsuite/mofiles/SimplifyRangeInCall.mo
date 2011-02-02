// name:     SimplifyRangeInCall
// keywords: simplify call range
// status:   correct
// 
// Checks that ranges in calls are simplified.
// 

class SimplifyRangeInClass
  Real r[2] = sin(1:2);
end SimplifyRangeInClass;

// Result:
// class SimplifyRangeInClass
//   Real r[1] = 0.841470984807897;
//   Real r[2] = 0.909297426825682;
// end SimplifyRangeInClass;
// endResult
