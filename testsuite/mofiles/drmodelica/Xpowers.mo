// name:     Xpowers
// keywords: equation, array
// status:   correct


model Xpowers
  parameter Real x = 10;
  Real xpowers[n];
  parameter Integer i = 1;
  parameter Integer n = 5;
equation
  xpowers[1] = 1;
  for i in 1:n-1 loop
    xpowers[i+1] = xpowers[i]*x;
  end for;
end Xpowers;



