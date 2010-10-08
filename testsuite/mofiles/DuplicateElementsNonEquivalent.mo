// name:     DuplicateElementsNonEquivalent
// keywords: check if duplicate elements are the same! even if they (in the end, via X, Y) point to the same class Real, they are not the same
// status:   incorrect

package Crap
  type X = Real;
  type Y = Real;
end Crap;

model DuplicateElementsNonEquivalent
 Crap.Y x;
 Crap.X x;
end DuplicateElementsNonEquivalent;

// Result:
// Error processing file: DuplicateElementsNonEquivalent.mo
// [DuplicateElementsNonEquivalent.mo:12:2-12:10:writable] Error: Duplicate elements (due to inherited elements) not identical:
// 	first element is:  Crap.X x ;
// 	second element is: Crap.Y x ;
// 
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
