// name: ExtObjError
// status: incorrect

model ExtObjError
  class A
    extends ExternalObject;
    function constructor input Real r; output A a; end constructor;
    function destructor input A a; end destructor;
  end A;
  class B
    extends ExternalObject;
    function constructor input Real r; output B b; end constructor;
    function destructor input B b; end destructor;
  end B;
  function f
    input A a;
    output Real r = 1.5;
  end f;
  A a = A(time);
  B b = B(time);
  Real r1 = f(a);
  Real r2 = f(b);
end ExtObjError;

// Result:
// Error processing file: ExtObjError.mo
// [ExtObjError.mo:22:3-22:17:writable] Error: No matching function found for f(b)
// of type
//   .ExtObjError.f<function>(a:ExtObjError.B ExternalObject) => Real in component <NO COMPONENT>
// candidates are 
//   .ExtObjError.f<function>(a:ExtObjError.A ExternalObject) => Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
