package Dyn2_pkg

protected function trice
  input Real x;
  output Real y;
algorithm
  y := x * 3;
end trice;

function dyn2real
  input Real x;
  output Real y;
algorithm
  y := trice(x);
end dyn2real;

end Dyn2_pkg;
