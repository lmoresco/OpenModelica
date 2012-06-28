// name: func9.mo
// keywords:
// status: correct
//

model M
  Real x, y;
  constant Integer n = 2;

  function f
    input Real x;
    output Real y;
  algorithm
    y := x * 2;
  end f;
equation
  x = f(n);
end M;

model N
  M m;
end N;

// Result:
// 
// EXPANDED FORM:
// 
// function M.f
//   input Real x;
//   output Real y;
// algorithm
//   y := x * 2;
// end M.f;
// 
// class N
//   Real m.x;
//   Real m.y;
// equation
//   m.x = M.f(m.n);
// end N;
// 
// 
// Found 2 components and 0 parameters.
// function M.f
//   input Real x;
//   output Real y;
// algorithm
//   y := 2.0 * x;
// end M.f;
// 
// class N
//   Real m.x;
//   Real m.y;
//   constant Integer m.n = 2;
// equation
//   m.x = 4.0;
// end N;
// endResult
