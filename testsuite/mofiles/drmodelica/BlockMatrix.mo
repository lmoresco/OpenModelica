// name:     BlockMatrix
// keywords: array
// status:   incorrect
//
// Drmodelica: 7.5 Array Concatenation and Slice Operations (p. 219)
// 

class BlockMatrix 
  Real[3, 3] P=[1, 2, 3; 4, 5, 6; 7, 8, 9];
  // A 3x3 matrix value
  Real[6, 6] Q;
equation 
  // Q consists of four 3x3 matrix blocks to be defined
  // by P apart from sign										
  Q[1:3, 1:3] = P;
  // Upper left block
  Q[1:3, 4:6] = [Q[1:3, 1:2], -Q[1:3, {3}]];
  // Upper right block
  Q[4:6, 1:3] = [Q[1:2, 1:3], -Q[{3}, 1:3]];
  // Lower left block
  Q[4:6, 4:6] = P;
  // Lower right block
end BlockMatrix;

// Result:
// Error processing file: BlockMatrix.mo
// [BlockMatrix.mo:19:15-21:15:writable] Error: Type mismatch in equation Q[{4,5,6},{1,2,3}]=cat(2,{{Q[1,1],Q[1,2],Q[1,3]},{Q[2,1],Q[2,2],Q[2,3]}},-{{Q[3,1],Q[3,2],Q[3,3]}}) of type Real[3, 3]=Real[1, 6]
// 
// # Error encountered! Exiting...
// # Please check the error message and the flags.
// 
// Execution failed!
// endResult
