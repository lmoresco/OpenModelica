// name:     Range1
// keywords: array
// status:   correct
// 
// Some tests of range expressions.
// 

class Range1
  Integer x[5] = 1:5;
equation
  for i in 1:5 loop
    x[i] = x[i] + 1;
  end for;

  for i in 1:2:5 loop
    x[i] = x[i] + 2;
  end for;
end Range1;
