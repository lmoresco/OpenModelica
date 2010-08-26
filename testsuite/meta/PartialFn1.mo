// name:     PartialFn1
// keywords: PartialFn
// status:  correct
//
// Using function pointers.
//

model PartialFn1

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

Integer i1;
Integer i2;
equation
  i1 = AddInt(17);
  i2 = ApplyIntOp(AddInt,i1);
end PartialFn1;

// Result:
// class PartialFn1
// Integer i1;
// Integer i2;
// equation
//   i1 = 18;
//   i2 = PartialFn1.ApplyIntOp(PartialFn1.AddInt,i1);
// end PartialFn1;
