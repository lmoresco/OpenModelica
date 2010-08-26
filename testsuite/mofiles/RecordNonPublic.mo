// name: RecordNonPublic
// keywords: record
// status: correct
//
// Tests the declaration and instantiation of a record
// that has non-public components
// THIS TEST SHOULD FAIL
//

record TestRecord
  protected
    Integer i;
end TestRecord;

model RecordNonPublic
  TestRecord tr;
end RecordNonPublic;

// Result:
// class RecordNonPublic
// protected Integer tr.i;
// end RecordNonPublic;
// endResult
