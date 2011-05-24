within Modelica;
package SimpleVisual ""
  extends Modelica.Icons.Library;

annotation (Documentation(info="<html>
<p></p>
</html>"));
  
class Position
  Real[3] frame_a (start = {0,0,0});
end Position;

class PositionRotation
  extends Position;
  Real[3] frame_b (start = {0,0,0});
end PositionRotation;

class PositionSize
  extends Position;
  Real[3] size (start = {0,0,0});
end PositionSize;

class PositionRotationSize
  extends PositionRotation;
  Real[3] size (start = {0,0,0});
end PositionRotationSize;

class PositionRotationSizeOffset
  extends PositionRotationSize;
  Real[3] offset (start = {0,0,0});
end PositionRotationSizeOffset;

// Preferably set by "shape" parameter
class Cube
  extends PositionRotationSize;
end Cube;

class Sphere
  extends PositionRotationSize;
end Sphere;

class Cylinder
  extends PositionRotationSize;
end Cylinder;


end SimpleVisual;
