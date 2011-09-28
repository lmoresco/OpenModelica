// name:     ArrayModification15
// keywords: array, modification, bug1627
// status:   correct
// 
// Checks that subscript bounds checking works with modifications.
// 

connector Signal 
  parameter Integer n;
  Real values[n];
end Signal; 

model ArrayModification15 
  Signal mySignals[1](each n = 3); 
equation
  mySignals[1].values[2] = 1; 
end ArrayModification15; 

// Result:
// class ArrayModification15
//   parameter Integer mySignals[1].n = 3;
//   Real mySignals[1].values[1];
//   Real mySignals[1].values[2];
//   Real mySignals[1].values[3];
// equation
//   mySignals[1].values[2] = 1.0;
// end ArrayModification15;
// endResult
