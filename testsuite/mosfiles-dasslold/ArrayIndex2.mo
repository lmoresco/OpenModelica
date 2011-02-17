// name:     ArrayIndex2
// keywords: array indexing
// status:   correct
// 
// Tests array indexing with arrays.
// 

model ArrayIndex2
  Integer array[5] = {1,2,3,4,5};
  Integer array2[5];
equation
  for i in 1:size(array,1) loop
    array2[array[i]] = i+1;
  end for;
end ArrayIndex2;

// Result:
// class ArrayIndex2
//   Integer array[1] = 1;
//   Integer array[2] = 2;
//   Integer array[3] = 3;
//   Integer array[4] = 4;
//   Integer array[5] = 5;
//   Integer array2[1];
//   Integer array2[2];
//   Integer array2[3];
//   Integer array2[4];
//   Integer array2[5];
// equation
//   array2[array[1]] = 2;
//   array2[array[2]] = 3;
//   array2[array[3]] = 4;
//   array2[array[4]] = 5;
//   array2[array[5]] = 6;
// end ArrayIndex2;
// endResult
