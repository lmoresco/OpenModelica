// name: ConstantDeclConnector
// keywords: constant
// status: correct
//
// Tests the constant prefix used on a connector
//

connector ConstantConnector
  Real r;
end ConstantConnector;

model ConstantDeclConnector
  constant ConstantConnector cc(r = 2.0);
end ConstantDeclConnector;

// fclass ConstantDeclConnector
// constant Real cc.r = 2.0;
// end ConstantDeclConnector;
