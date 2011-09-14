// name:     BooleanRanges
// keywords: boolean range
// status:   correct
// 
// Tests boolean ranges.
// 

model BooleanRanges
  Boolean b1[:] = false : true;
  Boolean b2[:] = true : false;
  Boolean b3[:] = false : false;
  Boolean b4[:] = true : true;
end BooleanRanges;

// Result:
// class BooleanRanges
//   Boolean b1[1] = false;
//   Boolean b1[2] = true;
//   Boolean b3[1] = false;
//   Boolean b4[1] = true;
// end BooleanRanges;
// endResult
