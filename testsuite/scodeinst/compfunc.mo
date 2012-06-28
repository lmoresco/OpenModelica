// name: compfunc.mo
// keywords:
// status: correct
// cflags:   +d=scodeInst
// teardown_command: rm -rf B_a____f*
//


model A
  function f
    input Integer n;
    output Real x = 2;
  end f;
end A;

model B
  A a;
  Real x = a.f(1);
end B;

// Result:
// 
// EXPANDED FORM:
// 
// function a.f
//   input Integer n;
//   output Real x;
// algorithm
//   x := 2;
// end a.f;
// 
// class B
//   Real x = a.f(1);
// end B;
// 
// 
// Found 1 components and 0 parameters.
// function B.a__f
//   input Integer n;
//   output Real x = 2.0;
// end B.a__f;
// 
// class B
//   Real x = 2.0;
// end B;
// endResult
