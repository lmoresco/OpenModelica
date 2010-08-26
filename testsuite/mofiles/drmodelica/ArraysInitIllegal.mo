// name:     ArraysInitIllegal
// keywords: <insert keywords here>
// status:   incorrect
// 
// Test the public and protected access keywords
// Drmodelica: 3.2 Initialized (p. 94)
// 
class ArraysInit
  Real A3[2, 2];
   // Array variable
  Real A4[2, 2](start = {{1, 0}, {0, 1}});			
   // Array with explicit start value
  Real A5[2, 2](start[2, 1] = 2.3);					
   // Array with single element modification 
end ArraysInit;
// Result:
// Error processing file: ArraysInitIllegal.mo
// [ArraysInitIllegal.mo:13:3-13:35:readonly] Error: Variable A5: In modifier start, not processed in the built-in class Real
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
