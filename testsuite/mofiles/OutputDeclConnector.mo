// name: OutputDeclConnector
// keywords: output
// status: correct
//
// Tests the output prefix on a connector type
//

connector OutputConnector
  Real r;
end OutputConnector;

class OutputDeclConnector
  output OutputConnector oc;
equation
  oc.r = 1.0;
end OutputDeclConnector;

// Result:
// class OutputDeclConnector
// output Real oc.r;
// equation
//   oc.r = 1.0;
// end OutputDeclConnector;
// endResult
