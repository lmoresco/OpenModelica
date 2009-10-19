// name:     PartialFn6
// keywords: PartialFn
// status:   correct
// cflags:   PartialFn6_f.c
// 
// Passing external functions as arguments to function calls

function ApplyRealOp
  input RealToReal inFunc;
  input Real x;
  output Real y;
  
  partial function RealToReal
    input Real x;
    output Real y;
  end RealToReal;
  
algorithm
  y := inFunc(x);
end ApplyRealOp;

function TestApplyRealOp
  input Real x;
  output Real y;
  
algorithm
  y := ApplyRealOp(ExtFunc,x);
end TestApplyRealOp;

function ExtFunc
  input Real r;
  output Real out;
  external "C" out=PartialFn6_f(r) annotation(Library="PartialFn6.ext_f.c");
end ExtFunc;

model PartialFn6
  Real x;
  Real y;
equation
  x = 5;
  y = TestApplyRealOp(x);
end PartialFn6;
