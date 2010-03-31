// name: ParameterDeclConnector
// keywords: parameter
// status: correct
//
// Tests the parameter prefix on a connector type
//

connector ParameterConnector
  Real r;
end ParameterConnector;

class ParameterDeclConnector
  parameter ParameterConnector pc;
equation
  pc.r = 1.0;
end ParameterDeclConnector;

// Result:
// fclass ParameterDeclConnector
// parameter Real pc.r;
// equation
//   pc.r = 1.0;
// end ParameterDeclConnector;
// endResult
