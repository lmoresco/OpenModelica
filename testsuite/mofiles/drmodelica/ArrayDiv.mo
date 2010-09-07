// name:     ArrayDiv
// keywords: array
// status:   incorrect
//
// Drmodelica: 7.6 Arithmetic Array Operators (p. 223)
//

class ArrayDiv
	Real Div1[1, 3], Div2, Div3;
equation

	Div1 = {2, 4, 6} / 2;
	// Result: {1, 2, 3}
end ArrayDiv;
// Result:
// Error processing file: ArrayDiv.mo
// [ArrayDiv.mo:12:2-12:22:writable] Error: Type mismatch in equation {{Div1[1,1],Div1[1,2],Div1[1,3]}}={1.0,2.0,3.0} of type Real[1, 3]=Real[3]
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
