
class A
  constant Integer N = 4;
  Real a[N];
equation
  a[1] = 1;
  for i in 1:N-1 loop
    a[i+1] = a[i] + 1;
  end for;
end A;

// Equations:
//
//   N = 4
//   a[1] = real(1)
//   a[1 + 1] = a[1] + real(1)
//   a[2 + 1] = a[2] + real(1)
//   a[3 + 1] = a[3] + real(1)
//
