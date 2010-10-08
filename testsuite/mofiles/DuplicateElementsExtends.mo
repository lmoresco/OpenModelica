// name:     DuplicateElementsExtends
// keywords: check if duplicate elements one from extends are equivalent!
// status:   incorrect


package Crap
  type X = Real;
  type Y = Real;
end Crap;

model Duplicate
 Crap.Y x;  
end Duplicate;

model DuplicateElementsExtends
 extends Duplicate; // have another x
 import C=Crap;
 C.X x;
end DuplicateElementsExtends;

// Result:
// Error processing file: DuplicateElementsExtends.mo
// [DuplicateElementsExtends.mo:18:2-18:7:writable] Error: Duplicate elements (due to inherited elements) not identical:
// 	first element is:  C.X x ;
// 	second element is: Crap.Y x ;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
