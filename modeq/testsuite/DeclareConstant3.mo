//|name:     DeclareConstant3
//|keywords: declaration
//|status:   incorrect
// 
// Does a constant need a declaration equation with constant 
// expression on the right hand side? If not, then the following 
// example could define a constraining equation for x and y.
// 

class DeclareConstant3
  Real x, y;
  constant Real c = x + y;
equation
  c = 5.0;
end DeclareConstant3;
