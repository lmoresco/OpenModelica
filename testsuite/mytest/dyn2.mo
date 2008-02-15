// name:     Dyn2
// keywords: equation
// status:   correct
// 
// 

model Dyn2
    Real x(start = 1);
	Real z(start = 1);
equation
  x = Dyn2_pkg.dyn2real(z);
  der(z) = z;
end Dyn2;
