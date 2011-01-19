// name: ExternalFunctionBuiltin
// status: correct
//
// MSL 3.2 started defining sin,cos,etc as external "builtin"
// This tests that such definitions work correctly

class ExternalFunctionBuiltin
  function sin
    input Real r;
    output Real o;
  external "builtin";
  end sin;
  Real r1 = sin(time), r2 = sin(1.0);
end ExternalFunctionBuiltin;

// Result:
// class ExternalFunctionBuiltin
//   Real r1 = sin(time);
//   Real r2 = 0.841470984807897;
// end ExternalFunctionBuiltin;
// endResult
