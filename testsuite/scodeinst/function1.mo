// status: correct
// cflags: +d=scodeInst

model function1
  function myfill
    input Real x,y,z;
    output Real o[y,z];
  end myfill;

  function f
    input Integer r;
    output Real o := x + y;
  protected
    Real x := sin(r);
    Real y := sin(x);
    Real z2[integer(x)] := {1};
    Real z[size(z2,1),2];
    Real z3[:];
  algorithm
    for r in 1:2 loop
      o := r;
    end for;
    o := x;
    o := c;
    z3 := {1,2};
  end f;
  Real r = sin(time), x = f(integer(time));
  constant Real c = 3.4;
  Real a[2];
end function1;

// Result:
// 
// EXPANDED FORM:
// 
// function function1.f
//   input Integer r;
//   output Real o;
//   protected Real x;
//   protected Real y;
//   protected Real z2[integer(x)];
//   protected Real z[integer(x),2];
//   protected Real z3[:];
// algorithm
//   x := sin(r);
//   /* z2 := array_alloc(Real[integer(x)]) */;
//   y := sin(x);
//   z2 := {1};
//   o := x + y;
//   /* z := array_alloc(Real[integer(x), 2]) */;
//   for r /* iter index 2 */ in 1:2 loop
//     o := r /* iter index 2 */;
//   end for;
//   o := x;
//   o := 3.4;
//   z3 := {1, 2};
// end function1.f;
// 
// function integer
//   input Real x;
//   output Integer y;
// end integer;
// 
// function sin
//   input Real x;
//   output Real y;
// end sin;
// 
// class function1
//   Real r = sin(time);
//   Real x = function1.f(integer(time));
//   Real a[1];
//   Real a[2];
// end function1;
// 
// 
// Found 4 components and 0 parameters.
// function function1.f
//   input Integer r;
//   output Real o = x + y;
//   protected Real x = sin(Real(r));
//   protected Real y = sin(x);
//   protected Real[:] z3;
//   protected Real[1] z2 = {1.0};
//   protected Real[1, 2] z;
// algorithm
//   for r in 1:2 loop
//     o := Real(r);
//   end for;
//   o := x;
//   o := c;
//   z3 := {1.0, 2.0};
// end function1.f;
// 
// class function1
//   Real r = sin(time);
//   Real x = function1.f(integer(time));
//   constant Real c = 3.4;
//   Real a[1];
//   Real a[2];
// end function1;
// endResult
