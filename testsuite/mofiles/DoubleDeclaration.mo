// name: DoubleDeclaration
// keywords: component, declaration
// status: incorrect
//
// Tests double declaration of components
// THIS TEST SHOULD FAIL!
//

model DoubleDeclaration
  Integer x;
  Real x;
equation
  x = 1;
end DoubleDeclaration;

// Result:
// Error processing file: DoubleDeclaration.mo
// [DoubleDeclaration.mo:11:3-11:9:writable] Error: Duplicate elements (due to inherited elements) not identical:
// 	first element is:  Real x ;
// 	second element is: Integer x ;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
