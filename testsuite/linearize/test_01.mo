// name:     test_01.mo
// keywords: <insert keywords here>
// status:   correct
// 
// <insert description here>
// 

model simple_test
  Real x;		// = time+1
  Real y;		// = e^x
  Real z;		// = Int(y) = Int(e^x) = e^x
  Real fac;		// = n!
  Real j;
  parameter Integer n=4;
algorithm
  fac := 1;
  for i in 0:n loop
    j := i;
    if j > 0 then
      fac := fac * j;
    end if;
    y := y + (x^j)/fac;
  end for;
equation
  x = time+1;
  der(z) = y;
end simple_test;

// Result:
// class simple_test
//   Real x;
//   Real y;
//   Real z;
//   Real fac;
//   Real j;
//   parameter Integer n = 4;
// equation
//   x = 1.0 + time;
//   der(z) = y;
// algorithm
//   fac := 1.0;
//   for i in 0:n loop
//     j := Real(i);
//     if j > 0.0 then
//       fac := fac * j;
//     end if;
//     y := y + x ^ j / fac;
//   end for;
// end simple_test;
// endResult
