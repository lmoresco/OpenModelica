// name:     DeclareConstant3
// keywords: declaration
// status:   incorrect
// 
// A constant requires a declaration equation with constant 
// expression on the right hand side.
// 

class DeclareConstant3
  Real x, y;
  constant Real c = x + y;
equation
  c = 5.0;
end DeclareConstant3;
