function oneg_generate_mesh "Example of grid-generation 1D" 
  constant Integer N0=100;
  constant Real eps=0.01;
  input Real left;
  input Real right;
  input Real refine;
  input Integer n_auxiliary;
  output Real grid[n_auxiliary];
protected 
  Real len;
  Real dx;
  Real tol;
  Integer m;
  Integer N;
  function log = Modelica.Math.log;
   annotation(
          Icon, Documentation(info="<HTML>
<pre>
This function should mark the future generic grid-generator.
</pre>
</HTML>"));
algorithm 
  len := right - left;
  tol := 1./((1 + N0*(1 - refine)).*(1 - log(refine + eps)));
  
  dx := len;
  m :=0;
  while abs(dx) > tol loop
    dx := dx/2;
    m := m+1;
  end while;
  
  N := integer(2^m);
  grid := fill(left, N+1) + (0:N)*dx;
  
end oneg_generate_mesh;
