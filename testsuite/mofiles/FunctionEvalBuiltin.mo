// name:     FunctionEvalBuiltin
// keywords: function,constant propagation
// status:   correct
// 
// Constant evaluation of function calls. Result of a function call with 
// constant arguments is inserted into flat modelica. 
// Result is unverified. Builtin functions like asin not implemented in rml
// doesn't seem to get called.

model FunctionEvalBuiltin
  constant Real pi1=asin(1.0);
  constant Real pi2=sin(1.0);
  constant Real pi=2*asin(1.0);
  constant Real r[:]= 
    {
     sin(pi/3),
     cos(pi/3),
     tan(pi/3),
     acos(1.0),
     atan(1.0),
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
     integer(2.45)
     /* why parse error for these?

     size({1,2,3,}),
     ndims({{1,2},{3,4},{5,6}})

     */
     };
end FunctionEvalBuiltin;

// fclass FunctionEvalBuiltin
// constant Real pi1 = asin(1.0);
// constant Real pi2 = 0.841470984807897;
// constant Real pi = 2.0 * asin(1.0);
// constant Real r[1];
// constant Real r[2];
// constant Real r[3];
// constant Real r[4];
// constant Real r[5];
// constant Real r[6];
// constant Real r[7];
// constant Real r[8];
// constant Real r[9];
// constant Real r[10];
// constant Real r[11];
// constant Real r[12];
// constant Real r[13];
// constant Real r[14];
// constant Real r[15];
// constant Real r[16];
// constant Integer i[1] = 2;
// constant Integer i[2] = 0;
// constant Integer i[3] = 2;
// constant Integer i[4] = 2;
// equation
//   r = {sin(pi / 3.0),cos(pi / 3.0),tan(pi / 3.0),acos(1.0),atan(1.0),exp(1.0),2.0,0.0,3.0,3.0,2.0,2.0,2.7,2.7,sign(2.7),sign(-2.7)};
// end FunctionEvalBuiltin;
