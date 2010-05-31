// name:     PartialFn7
// keywords: PartialFn
// status:   incorrect
//
// Passing record constructors
//

model PartialFn7

record TestRecord
  Integer i;
  Real r;
end TestRecord;

function CreateTestRecord

  input Integer i;
  input Real r;
  input InRecordConstructor rc;
  output TestRecord tr;
  
  partial function InRecordConstructor
    input Integer i;
    input Real r;
    output TestRecord tr;
  end InRecordConstructor;
  
algorithm

  tr := rc(i, r);

end CreateTestRecord;

function TestCreateTestRecord

  input Integer i;
  input Real r;
  output Integer o;
  TestRecord tr;

algorithm

  tr := CreateTestRecord(i, r, TestRecord);
  o := 2;
  
end TestCreateTestRecord;

Integer i;
Real r;
Integer tr;

equation
  i = 1;
  r = 2.0;
  tr = TestCreateTestRecord(i, r);
end PartialFn7;

// Result:
// fclass PartialFn7
// Integer i1;
// Integer i2;
// equation
//   i1 = 2;
//   i2 = PartialFn7.ApplyIntOp(PartialFn7.AddInt,i1);
// end PartialFn7;
