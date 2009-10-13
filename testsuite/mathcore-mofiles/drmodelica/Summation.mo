// name:     Summation
// keywords: algorithm, array
// status:   correct


model Summation
  Real sum;
  Integer n;
  Real a[5] = {1, 3, 6, 9, 12};
algorithm
  sum := 0;
  n := size(a,1); 
  while (n > 0) loop
    if (a[n] > 0) then
      sum := sum + a[n];
    end if;
    n := n - 1;
  end while;
end Summation;


// fclass Summation
// Real sum;
// Integer n;
// Real a[1] = 1.0;
// Real a[2] = 3.0;
// Real a[3] = 6.0;
// Real a[4] = 9.0;
// Real a[5] = 12.0;
// algorithm
//   sum := 0.0;
//   n := 5;
//   while n > 0 loop
//     if a[n] > 0.0 then
//       sum := sum + a[n];
//     end if;
//     n := n - 1;
//   end while;
// end Summation;
