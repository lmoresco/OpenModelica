// name: TailRecursion
// cflags: +d=noevalfunc
// status: correct

model TailRecursion
function f
  input Real x;
  output Real y := x;
algorithm
  if x > 200000.0 then return; end if;
  y := f(x+1.0);
end f;
  Real r;
equation
  r = f(0.5);
end TailRecursion;

// Result:
// function TailRecursion.f
//   input Real x;
//   output Real y = x;
// algorithm
//   if x > 200000.0 then
//     return;
//   end if;
//   TailRecursion.f(1.0 + x);
// end TailRecursion.f;
// 
// class TailRecursion
//   Real r;
// equation
//   r = 200000.5;
// end TailRecursion;
// [TailRecursion.mo:11:3-11:16:writable] Notification: Tail recursion of: TailRecursion.f(1.0 + x) with input vars: x
// 
// endResult
