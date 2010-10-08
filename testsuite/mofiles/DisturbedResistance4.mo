// name:     DisturbedResistance4
// keywords: modification
// status:   incorrect
// 
// Finalized objects shall not be overwritten.
//

model Resistor
  Real u, i;
  final parameter Real R = 1.0;
equation
  u = R*i;
end Resistor;

model DisturbedResistance4
  Real R = 1.0 + 0.1*sin(time);
  extends Resistor;
end DisturbedResistance4;

// Result:
// Error processing file: DisturbedResistance4.mo
// [DisturbedResistance4.mo:16:3-16:31:writable] Error: Duplicate elements (due to inherited elements) not identical:
// 	first element is:  Real R  = 1.0 + 0.1 * sin(time);
// 	second element is: parameter Real R final = 1.0;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
