// name:     FunctionEvalBuiltin
// keywords: function,constant propagation
// status:   correct
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica. 
// Result is unverified. Builtin functions like asin not implemented in rml
// doesn't seem to get called.

model FunctionEvalBuiltin
  constant Real pi1=arcsin(1.0);
  constant Real pi2=sin(1.0);
  constant Real pi=2*arcsin(1.0);
  constant Real r[:]= 
    {
     sin(pi/3),
     cos(pi/3),
     tan(pi/3),
     arccos(1.0),
     arctan(1.0),
     exp(1.0),
     div(15.0,7.0),
     rem(15.0,7.0),
     ceil(2.55),
     ceil(2.45),
     floor(2.55),
     floor(2.45),
     abs(2.7),
     abs(-2.7),
     sign(2.7),
     sign(-2.7)
     };
  constant Integer i[:] = 
    {
     div(15,7),
     rem(15,7),
     integer(2.55),
     integer(2.45),
     size({1,2,3},1)
     };
end FunctionEvalBuiltin;

// Result:
// class FunctionEvalBuiltin
// constant Real pi1 = 1.5707963267949;
// constant Real pi2 = 0.841470984807897;
// constant Real pi = 3.14159265358979;
// constant Real r[1] = 0.866025403784439;
// constant Real r[2] = 0.5;
// constant Real r[3] = 1.73205080756888;
// constant Real r[4] = 0.0;
// constant Real r[5] = 0.785398163397448;
// constant Real r[6] = 2.71828182845905;
// constant Real r[7] = 2.0;
// constant Real r[8] = 1.0;
// constant Real r[9] = 3.0;
// constant Real r[10] = 3.0;
// constant Real r[11] = 2.0;
// constant Real r[12] = 2.0;
// constant Real r[13] = 2.7;
// constant Real r[14] = 2.7;
// constant Real r[15] = 1.0;
// constant Real r[16] = -1.0;
// constant Integer i[1] = 2;
// constant Integer i[2] = 1;
// constant Integer i[3] = 2;
// constant Integer i[4] = 2;
// constant Integer i[5] = 3;
// end FunctionEvalBuiltin;
// Warning: Using non-standardized function arcsin in component <NO COMPONENT>. For full conformance with language specification please use appropriate function in e.g. Modelica.Math
// Warning: Using non-standardized function arccos in component <NO COMPONENT>. For full conformance with language specification please use appropriate function in e.g. Modelica.Math
// Warning: Using non-standardized function arctan in component <NO COMPONENT>. For full conformance with language specification please use appropriate function in e.g. Modelica.Math
// Warning: Using non-standardized function arccos in component <NO COMPONENT>. For full conformance with language specification please use appropriate function in e.g. Modelica.Math
// Warning: Using non-standardized function arctan in component <NO COMPONENT>. For full conformance with language specification please use appropriate function in e.g. Modelica.Math
// 
// endResult
