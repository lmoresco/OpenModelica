// name: StringConcatenation
// keywords: string
// status: correct
//
// Tests string concatenation
//

model StringConcatenation
  String s;
equation
  s = "te" + "st";
end StringConcatenation;

// Result:
// fclass StringConcatenation
// String s;
// equation
//   s = "test";
// end StringConcatenation;
// endResult
