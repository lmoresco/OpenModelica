// name: RecordConstructors
// keywords: record
// status: correct
//
// Tests record constructor functions
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
//   tr = TestRecord(1);
// end RecordConstructors;
