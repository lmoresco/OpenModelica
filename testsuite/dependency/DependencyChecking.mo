//name:        DependencyChecking.mo
//keyword:     checking if the omc +d=usedep works the same as without it.
//status:      correct
//
// instantiate/check model example
//


package Modelica
   package Constants
   final constant Real eps = 0.1;
	 final constant Integer wrong = 1.0; // this one will fail to instantiate and the dependency will be wrong.
   end Constants;
end Modelica;

model DependencyChecking
  function func
    input Real x;
	output Real y;
  algorithm
    y := x * Modelica.Constants.eps;
  end func;
  parameter Real u = func(1);
end DependencyChecking;

