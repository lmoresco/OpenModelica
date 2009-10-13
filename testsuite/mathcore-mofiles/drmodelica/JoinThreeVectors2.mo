// name:     joinThreeVectors
// keywords: external functions
// status:   correct
// 
// External C function with column-major arrays
//


function joinThreeVectors2 
  input Real v1[:],v2[:],v3[:];
  output Real vres[size(v1,1)+size(v2,1)+size(v3,1)];
external "C"
  join3vec(v1,v2,v3,vres,size(v1,1),size(v2,1),size(v3,1));
  annotation(arrayLayout = "columnMajor");
end joinThreeVectors2;

model joinThreeVectors
  Real a={1,2};
  Real b={3,4,5};
  Real c={6,7,8,9};
  Real x[9];
algorithm
  x:=joinThreeVectors2(a,b,c);
end joinThreeVectors;