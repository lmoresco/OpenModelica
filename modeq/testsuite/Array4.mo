// name:     Array4
// keywords: array,unknown
// status:   correct
// 
// This is a test of arrays of arrays.  The type T2 is equivalent or
// similar to Real[2,3].
// 

model Array4
  type T1 = Real[3];
  type T2 = T1[2];
  T2 x;
end Array4;

// fclass Array4
//   Integer x[1,1];
//   Integer x[1,2];
//   Integer x[1,3];
//   Integer x[2,1];
//   Integer x[2,2];
//   Integer x[2,3];
// equation
// end Array4;
