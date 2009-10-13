// name: StringLiterals
// keywords: string
// status: correct

model StringLiterals
  constant String s = "\'\"\?\\\a\b\f\n\r\t\v";
  String str;
equation
  str = "test";
end StringLiterals;

// fclass StringLiterals
// constant String s = "\'\"\?\\\a\b\f\n\r\t\v";
// String str;
// equation
//   str = "test";
// end StringLiterals;
