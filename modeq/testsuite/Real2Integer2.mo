// name:     Real2Integer2
// keywords: typing
// status:   incorrect
// 
// No implicit conversion from Real to Integer. Division via '/' always 
// gives a Real.
// 

class Real2Integer2
  Integer n1, n2;
algorithm
  n1 := 6;
  n2 := n1 / 2;
end Real2Integer2;
