// name: FlowDeclConnector
// keywords: flow
// status: correct
//
// Tests the flow prefix on a connector type
//

connector FlowConnector
  Real r;
end FlowConnector;

class FlowDeclConnector
  flow FlowConnector fc;
equation
  fc.r = 1.0;
end FlowDeclConnector;

// Result:
// fclass FlowDeclConnector
// Real fc.r;
// equation
//   fc.r = 1.0;
// end FlowDeclConnector;
// endResult
