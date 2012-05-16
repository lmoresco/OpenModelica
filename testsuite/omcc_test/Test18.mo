
 
 // name:Test18.mo   
// keywords: this tests conditional statements- while
// status:   correct
 

 class whiletest
  parameter Real eps = 1.E-6;
  Integer i;
  Real sum;
  Real delta;
algorithm
  i := 1;
  delta := exp(-0.01 * i);
  while delta >= eps loop
    sum := sum + delta;
    i := i + 1;
    delta := exp(-0.01 * i);
  end while;
end whiletest;




// succeed
// omcc- v.2012