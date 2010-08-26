// name: RecordConnections
// keywords: record
// status: correct
//
// Tests if records can be used in connections
// THIS TEST SHOULD FAIL
//

record TestRecord
  Integer i;
end TestRecord;

model RecordConnections
  TestRecord tr1,tr2;
equation
  tr1.i = 3;
  connect(tr1.i,tr2.i);
end RecordConnections;

// Result:
// class RecordConnections
// Integer tr1.i;
// Integer tr2.i;
// equation
//   tr1.i = 3;
// tr1.i = tr2.i;
// end RecordConnections;
// endResult
