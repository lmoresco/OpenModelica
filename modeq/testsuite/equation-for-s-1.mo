
class A
  Real a[5]; // = [1,2,3,4,5];
equation
  a[1] = 1;
  for i in [2,3,4,5] loop
    a[i] = a[i-1] + 1;
  end for;
end A;

// Equations:
//
//   a[1] = real(1)
//   a[2] = a[2-1] +(real) real(1)
//   a[3] = a[3-1] +(real) real(1)
//   a[4] = a[4-1] +(real) real(1)
//   a[5] = a[5-1] +(real) real(1)
//
