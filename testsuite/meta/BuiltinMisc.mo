package BuiltinMisc
  
function myIf
  input Boolean cond;
  input Integer i1;
  input Integer i2;
  output Integer out;
algorithm
  out := if_exp(cond,i1,i2);
end myIf;

function myIfOpt
  input Boolean cond;
  input Integer i1;
  output Option<Integer> out;
algorithm
  out := if_exp(cond,SOME(i1),NONE);
end myIfOpt;

function myTick
  output Integer i;
algorithm
  i := tick();
end myTick;

function myPrint
  input String s;
algorithm
  print(s);
  print("\n");
end myPrint;

function myClock
  output Real r;
algorithm
  r := clock();
end myClock;

end BuiltinMisc;
