// name:     ArraySlice1
// keywords: array
// status:   correct
// 
// Simple array slicing.
// 

class ArraySlice1
  Real a[4];
equation
  a[[1,3]] = a[[2,4]];
end ArraySlice1;
