// name:     Assign3
// keywords: parse error
// status:   correct
// 

model Assign3
algorithm
  (x,y,z) := res;
end Assign3;

// Result:
// Error processing file: Assign3.mo
// [Assign3.mo:8:17-8:17:writable] Error: Modelica assignment statements are either on the form 'component_reference := expression' or '( output_expression_list ) := function_call'.
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
