
 
 // name:Test19.mo    
// keywords:this tests conditional statements- for
// status:   correct
 

class fortest
  parameter Real x=10;
  Real xpowers[n];
  parameter Integer i=1;
  parameter Integer n = 5;
equation
  xpowers[1]=1;
  for i in 1:n-1 loop
    xpowers[i + 1] = xpowers[i]*x;
  end for;
end fortest;  


// succeed
// omcc- v.2012