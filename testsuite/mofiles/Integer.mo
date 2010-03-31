// name: Integer
// keywords: integer
// status: correct
//
// Tests the built-in integer function
// This test is not really correct...
// The flattened model output is completely wrong
//

model Integer
  Real r;
equation
  r = integer(4.5);
end Integer;

// Result:
// fclass Integer
// end Integer;
// endResult
