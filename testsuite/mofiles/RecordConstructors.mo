// name: RecordConstructors
// keywords: record
// status: correct
//
// Tests record constructor functions
// Currently, something is wrong with record constructors
//

record TestRecord
  Integer i;
end TestRecord;

model RecordConstructors
  TestRecord tr;
equation
  tr = TestRecord(1);
end RecordConstructors;

// fclass RecordConstructors
// Integer tr.i;
// equation
//   tr = TestRecord();
// end RecordConstructors;
