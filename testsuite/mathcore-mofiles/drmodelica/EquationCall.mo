// name:     EquationCall
// keywords: multiple results, equation
// status:   correct
// 
// Computes cartesian coordinates of a point
//

function PointOnCircle 
  input Real angle "Angle in radians";
  input Real radius;
  output Real x; // 1:st result formal parameter
  output Real y; // 2:nd result formal parameter
algorithm
  x := radius*Modelica.Math.cos(angle);
  y := radius*Modelica.Math.sin(angle);
end PointOnCircle;

class EquationCall
  Real px, py;
equation
  (px, py) = PointOnCircle(1.2, 2);
end EquationCall;

// fclass EquationCall
// Real px;
// Real py;
// equation
//   (px,py) = PointOnCircle(1.2,2.0);
// end EquationCall;
