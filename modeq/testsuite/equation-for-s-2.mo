
class A
  constant Integer N = 4;
  Real a[N];
equation
  a[1] = 1;
  for i in 2:N loop
    a[i] = a[i-1] + 1;
  end for;
end A;

// Equations:
//
//   N = 4
//   a[1] = real(1)
//   a[2] = a[2-1] +(real) real(1)
//   a[3] = a[3-1] +(real) real(1)
//   a[4] = a[4-1] +(real) real(1)
//
