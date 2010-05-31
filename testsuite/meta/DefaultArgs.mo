// name:     DefaultArgs
// keywords: DefaultArgs
// status:  correct
//
// Using function pointers.
//

model DefaultArgs

function AddFunc
  input Integer i1 = 1;
  input Integer i2 = 2;
  output Integer o;
algorithm
  o := i1 + i2;
end AddFunc;

Integer i;
equation
  i = AddFunc();
end DefaultArgs;
