// name: ArrayInvalidDims
// keywords: array invalid dimensions
// status: incorrect
//
// Checks that an error message is generated if the arguments to array have
// different dimensions.
//

model ArrayInvalidDims
	Real r[:,:] = array({1,2,3},{3,4});
end ArrayInvalidDims;

// Result:
// Error processing file: ArrayInvalidDims.mo
// [ArrayInvalidDims.mo:10:2-10:36:writable] Error: Different dimension sizes in arguments to array in component <NO COMPONENT>
// [ArrayInvalidDims.mo:10:2-10:36:writable] Error: Wrong type or wrong number of arguments to array({1,2,3}, {3,4})'.
//  (in component <NO COMPONENT>)
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
