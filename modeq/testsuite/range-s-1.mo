
class A
  Integer x[5] = 1:5;
equation
  for i in 1:5 loop
    x[i] = x[i] + 1;
  end for;

  for i in 1:2:5 loop
    x[i] = x[i] + 2;
  end for;
end A;

// Equations:
//
//   x = (1:5)
//   x[1] = x[1] + 1
//   x[2] = x[2] + 1
//   x[3] = x[3] + 1
//   x[4] = x[4] + 1
//   x[5] = x[5] + 1
//   x[1] = x[1] + 2
//   x[3] = x[3] + 2
//   x[5] = x[5] + 2
//
