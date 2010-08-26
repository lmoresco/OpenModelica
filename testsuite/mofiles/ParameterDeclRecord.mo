// name: ParameterDeclRecord
// keywords: parameter
// status: correct
//
// Tests the parameter prefix on a record type
//

record ParameterRecord
  Real r;
end ParameterRecord;

class ParameterDeclRecord
  parameter ParameterRecord pr;
equation
  pr.r = 1.0;
end ParameterDeclRecord;

// Result:
// class ParameterDeclRecord
//   parameter Real pr.r;
// equation
//   pr.r = 1.0;
// end ParameterDeclRecord;
// Warning: Parameter pr.r has no value, and is fixed during initialization (fixed=true)
// 
// endResult
