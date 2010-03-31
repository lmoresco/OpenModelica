// name: OutputDeclRecord
// keywords: output
// status: correct
//
// Tests the output prefix on a record type
//

record OutputRecord
  Real r;
end OutputRecord;

class OutputDeclRecord
  output OutputRecord orec;
equation
  orec.r = 1.0;
end OutputDeclRecord;

// Result:
// fclass OutputDeclRecord
// output Real orec.r;
// equation
//   orec.r = 1.0;
// end OutputDeclRecord;
// endResult
