// name: RecordPrefixes.mo
// keywords: record
// status: correct
//
// Tests if prefixed components can be used in records
// THIS TEST SHOULD FAIL
//

record TestRecord
  input Integer i;
end TestRecord;

model RecordPrefixes
  TestRecord tr;
equation
  tr.i = 1;
end RecordPrefixes;

// Result:
// class RecordPrefixes
// input Integer tr.i;
// equation
//   tr.i = 1;
// end RecordPrefixes;
// endResult
