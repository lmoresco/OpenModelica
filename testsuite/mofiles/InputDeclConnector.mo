// name: InputDeclConnector
// keywords: input
// status: correct
//
// Tests the input prefix on a connector type
//

connector InputConnector
  Real r;
end InputConnector;

class InputDeclConnector
  input InputConnector ic;
equation
  ic.r = 1.0;
end InputDeclConnector;

// fclass InputDeclConnector
// input Real ic.r;
// equation
//   ic.r = 1.0;
// end InputDeclConnector;
