// name:     Extends5
// keywords: extends several levels with import
// status:   correct
// 
// Testing extending in several levels and using imports.


package A
  model ABase
    Real x;
  end ABase;
end A;
model Base2
  import D = A.ABase;
  extends D;
end Base2;
model Base
  extends Base2;
end Base;

model test
  extends Base;
end test;
// Result:
// fclass test
// Real x;
// end test;
// endResult
