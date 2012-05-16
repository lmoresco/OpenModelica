// name:Test14.mo
// keywords: This tests the function call statements with arguments
// status: correct
 
 function equal
 input Real x[:];
 input Real y[:];
 input Real eps=1e-6;
 output Boolean equal;
algorithm
 equal := false;
end equal;

model test
  Real x[2],y[2]={1,2};
  Boolean b;
equation
x=y;
b = equal(x,y);
end test;


// succeed
// omcc- v.2012