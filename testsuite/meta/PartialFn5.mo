// name:     PartialFn5
// keywords: PartialFn
// status:  correct
//
// Using function pointers to builtin functions
//

model PartialFn5

function ApplyRealOp

  input FuncRealToReal inFunc;
  input Real rin;
  output Real rout;

  partial function FuncRealToReal
    input Real r1;
    output Real r2;
  end FuncRealToReal;

algorithm
  rout := inFunc(rin);
end ApplyRealOp;

function ceil_
  input Real rin;
  output Real rout;
  external rout=ceil(rin);
end ceil_;

function TestApplyRealOp

  input Real rin;
  output Real rout;
  
algorithm
  rout := ApplyRealOp(ceil_, rin);
end TestApplyRealOp;

Real r1;
Real r2;

equation
  r1 = 1.2;
  r2 = TestApplyRealOp(r1);
end PartialFn5;

