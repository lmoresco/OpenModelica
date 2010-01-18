// name: Inline6
// keywords: inline, function
// status: correct
//
// Test case for inline annotations
//

function simpleInline
  input Integer[:] inInt;
  output Integer outInt;
  annotation(Inline = true);
algorithm
  outInt := inInt[1];
end simpleInline;

model Inline6
  Integer[1] x;
  Integer y;
equation
  x[1] = 2;
  y = simpleInline(x);
end Inline6;

// fclass Inline1
// Integer x;
// Integer y;
// equation
//   x = 2;
//   Real(y) = Real(2 + (5 + x - x) * x) * Real((13 + x - (8 + x)) * (8 + x)) / 2.0;
// end Inline1;
