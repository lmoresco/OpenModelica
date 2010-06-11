// name:     DerConstant2
// keywords: derivative
// status:   correct
// 
// der(expr): For Integer parameters and constants the result is a zero scalar or array of the same size as the variable. 
// 

class DerConstant2 
  constant Integer pa = 1; 
  Real a = der(pa);
  Real b = der(1);
  parameter Integer[1,2,1,2] pc = {{{{1,2}},{{3,4}}}};
  Real[1,2,1,2] c = der(pc);  
  Real[1,2,1,2] d = der({{{{1,2}},{{3,4}}}});
end DerConstant2; 

// Result:
// fclass DerConstant2
// constant Integer pa = 1;
// Real a = 0.0;
// Real b = 0.0;
// parameter Integer pc[1,1,1,1] = 1;
// parameter Integer pc[1,1,1,2] = 2;
// parameter Integer pc[1,2,1,1] = 3;
// parameter Integer pc[1,2,1,2] = 4;
// Real c[1,1,1,1] = 0.0;
// Real c[1,1,1,2] = 0.0;
// Real c[1,2,1,1] = 0.0;
// Real c[1,2,1,2] = 0.0;
// Real d[1,1,1,1] = 0.0;
// Real d[1,1,1,2] = 0.0;
// Real d[1,2,1,1] = 0.0;
// Real d[1,2,1,2] = 0.0;
// end DerConstant2;
// endResult
