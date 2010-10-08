// name:     DuplicateElementsExtendsEquivalent
// keywords: check if duplicate elements one from extends are equivalent!
// status:   correct


package Crap
  type X = Real;
  type Y = Real;
end Crap;

model Duplicate
 Crap.X x;  
end Duplicate;

model DuplicateElementsExtendsEquivalent
 extends Duplicate; // have another x
 import C=Crap;
 C.X x;
end DuplicateElementsExtendsEquivalent;

// Result:
// class DuplicateElementsExtendsEquivalent
//   Real x;
// end DuplicateElementsExtendsEquivalent;
// [DuplicateElementsExtendsEquivalent.mo:18:2-18:7:writable] Warning: Duplicate elements (due to inherited elements) not syntactically identical but semantically identical:
// 	first element is:  C.X x ;
// 	second element is: Crap.X x ;
// 	Modelica specification requires that elements are exactly identical.
// 
// endResult
