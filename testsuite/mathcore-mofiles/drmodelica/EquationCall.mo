// name:     EquationCall
// keywords: multiple results, equation
// status:   correct
// 
// Computes cartesian coordinates of a point
//
/*
package Modelica
  package Math

    function cos
      input Real u;
      output Real y;
      external "C" y = cos(u) ;      annotation(Library = "ModelicaExternalC");
    end cos;

    function sin
      input Real u;
      output Real y;
      external "C" y = sin(u) ;      annotation(Library = "ModelicaExternalC");
    end sin;
  end Math;
end Modelica;
*/

function PointOnCircle 
  input Real angle "Angle in radians";
  input Real radius;
  output Real x; // 1:st result formal parameter
  output Real y; // 2:nd result formal parameter
algorithm
  x := radius*/*Modelica.Math.*/cos(angle);
  y := radius*/*Modelica.Math.*/sin(angle);
end PointOnCircle;

class EquationCall
  Real px, py;
equation
  (px, py) = PointOnCircle(1.2, 2);
end EquationCall;

// function PointOnCircle
// input Real angle "Angle in radians";
// input Real radius;
// output Real x;
// output Real y;
// algorithm
//   x := radius * cos(angle);
//   y := radius * sin(angle);
// end PointOnCircle;
// 
// fclass EquationCall
// Real px;
// Real py;
// equation
//   (px,py) = (0.724715508953347,1.86407817193445);
// end EquationCall;
// Result:
// function PointOnCircle
// input Real angle "Angle in radians";
// input Real radius;
// output Real x;
// output Real y;
// algorithm
//   x := radius * cos(angle);
//   y := radius * sin(angle);
// end PointOnCircle;
// 
// fclass EquationCall
// Real px;
// Real py;
// equation
//   (px,py) = (0.724715508953347,1.86407817193445);
// end EquationCall;
// endResult
