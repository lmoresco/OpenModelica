// name:     DuplicateElementsEquivalent
// keywords: check if duplicate elements are the same even with when having named imports!
// status:   correct


package Crap
  type X = Real;
  type Y = Real;
end Crap;


model DuplicateElementsEquivalent
 import C=Crap;
 C.X x;
 Crap.X x;
end DuplicateElementsEquivalent;

// Result:
// class DuplicateElementsEquivalent
//   Real x;
// end DuplicateElementsEquivalent;
// [DuplicateElementsEquivalent.mo:15:2-15:10:writable] Warning: Duplicate elements (due to inherited elements) not syntactically identical but semantically identical:
// 	first element is:  Crap.X x ;
// 	second element is: C.X x ;
// 	Modelica specification requires that elements are exactly identical.
// 
// endResult
