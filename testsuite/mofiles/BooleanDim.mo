// name:     BooleanDim
// keywords: boolean dimension
// status:   correct
// 
// Tests the use of Boolean as dimension.
// 

model BooleanDim
  Boolean b[Boolean] = {not b for b in Boolean};
end BooleanDim;

// Result:
// class BooleanDim
//   Boolean b[1] = true;
//   Boolean b[2] = false;
// end BooleanDim;
// endResult
