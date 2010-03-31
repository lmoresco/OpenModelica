// name: AssignmentSimple
// keywords: assignment
// status: correct
//
// Tests simple assignment
//

model AssignmentSimple
  Real x;
algorithm
  x := 2;
end AssignmentSimple;

// Result:
// fclass AssignmentSimple
// Real x;
// algorithm
//   x := 2.0;
// end AssignmentSimple;
// endResult
