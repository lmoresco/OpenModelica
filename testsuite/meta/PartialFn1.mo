// name:     PartialFn1
// keywords: PartialFn
// status:  correct
// cflags: +g=MetaModelica
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

function test
  output Integer i1,i2;
algorithm
  i1 := AddInt(17);
  i2 := ApplyIntOp(AddInt,i1);
end test;

Integer i1;
Integer i2;
equation
  (i1,i2) = test();
end PartialFn1;

// Result:
// function PartialFn1.AddInt
//   input Integer i;
//   output Integer out;
// algorithm
//   out := 1 + i;
// end PartialFn1.AddInt;
// 
// function PartialFn1.ApplyIntOp
//   input inFunc<function>(in1:#Integer) => #Integer inFunc;
//   input Integer i;
//   output Integer outInt;
// algorithm
//   outInt := unbox(inFunc(#(i)));
// end PartialFn1.ApplyIntOp;
// 
// function PartialFn1.test
//   output Integer i1;
//   output Integer i2;
// algorithm
//   i1 := 18;
//   i2 := PartialFn1.ApplyIntOp(PartialFn1.AddInt, i1);
// end PartialFn1.test;
// 
// class PartialFn1
//   Integer i1;
//   Integer i2;
// equation
//   (i1, i2) = (18, 19);
// end PartialFn1;
// endResult
