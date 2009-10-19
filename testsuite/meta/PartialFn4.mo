// name:     PartialFn4
// keywords: PartialFn
// status:  correct
//
// Using function pointers to non-returning functions
//

model PartialFn4

function VoidOp
  input Integer i;
  Integer j;
algorithm
  j := i + 1;
end VoidOp;

function ApplyVoidOp

  input FuncIntegerToVoid inFunc;
  input Integer i;
  output Integer j;

  partial function FuncIntegerToVoid
    input Integer i1;
  end FuncIntegerToVoid;

algorithm
  inFunc(i);
  j := 2;
end ApplyVoidOp;

function TestApplyVoidOp

  input Integer i;
  output Integer j;
  
algorithm
  j := ApplyVoidOp(VoidOp, i);
end TestApplyVoidOp;

Integer i1;
Integer i2;

equation
  i1 = 1;
  i2 = TestApplyVoidOp(i1);
end PartialFn4;

