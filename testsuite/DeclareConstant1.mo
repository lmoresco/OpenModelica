// name:     DeclareConstant1
// keywords: declaration,equation
// status:   incorrect
// 
// A constant requires a declaration equation with constant 
// expression on the right hand side.
// 

class DeclareConstant1
  constant String s;
equation
  s = "value";
end DeclareConstant1;
