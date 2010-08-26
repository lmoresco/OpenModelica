// name: IntDiv
// keywords: integer, division
// status: erroneous
//
// tests Integer division
//

model IntDiv
  constant Integer i = 4000 / 100;
end IntDiv;

// Result:
// TODO: This needs a proper error message
// Error processing file: IntDiv.mo
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
