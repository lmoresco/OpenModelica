// name:     PartialFn2
// keywords: PartialFn
// status:  correct
//
// Using pointers to functions pointing to other functions.
//

model PartialFn2

function AddInt
  input Integer i;
  output Integer out;
algorithm
  out := i+1;
end AddInt;

function ApplyIntOp

  input FuncIntToInt inFunc;
  input Integer i;
  output Integer outInt;

  partial function FuncIntToInt
    input Integer in1;
    output Integer out1;
  end FuncIntToInt;

algorithm
  outInt := inFunc(i);
end ApplyIntOp;

function ApplyApplyIntOp

  input FuncFuncIntToInt inFuncFunc;
  input FuncIntToInt inFunc;
  input Integer i;
  output Integer outInt;

  partial function FuncFuncIntToInt
    input FuncIntToInt inFunc;
    input Integer in1;
    output Integer out1;
  end FuncFuncIntToInt;

  partial function FuncIntToInt
    input Integer in1;
    output Integer out1;
  end FuncIntToInt;

algorithm
  outInt := inFuncFunc(inFunc, i);
end ApplyApplyIntOp;


function TestApplyApplyIntOp
  input Integer i1;
  output Integer out;
algorithm
  out := ApplyApplyIntOp(ApplyIntOp,AddInt,i1);
end TestApplyApplyIntOp;

Integer i1;
Integer i2;
equation
  i1 = AddInt(1);
  i2 = TestApplyApplyIntOp(i1);
end PartialFn2;

// Result:
// class PartialFn2
// Integer i1;
// Integer i2;
// equation
//   i1 = 2;
//   i2 = PartialFn2.ApplyApplyIntOp(PartialFn2.ApplyIntOp,PartialFn2.AddInt,i1);
// end PartialFn2;
