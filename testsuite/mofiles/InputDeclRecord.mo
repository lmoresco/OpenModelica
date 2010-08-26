// name: InputDeclRecord
// keywords: input
// status: correct
//
// Tests the input prefix on a record type
//

record InputRecord
  Real r;
end InputRecord;

class InputDeclRecord
  input InputRecord ir;
equation
  ir.r = 1.0;
end InputDeclRecord;

// Result:
// class InputDeclRecord
// input Real ir.r;
// equation
//   ir.r = 1.0;
// end InputDeclRecord;
// endResult
