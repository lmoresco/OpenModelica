// name:     TestGravityAcceleration
// keywords: instance function
// status:   correct
// 
// Tests for calling function via instance
//
// calling functions via instance MultiBody.World.gravityAcceleration 
// 


package Constants
  final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";
end Constants;

package Math
  function normalize "Return normalized vector such that length = 1Return normalized vector such that length = 1 and prevent zero-division for zero vector"
    input Real v[:] "Vector";
    input Real eps = 100*Constants.eps "if |v| < eps then result = v/eps";
    output Real result[size(v, 1)] "Input vector v normalized to length=1";
  algorithm
    result := smooth(0,if length(v) >= eps then v/length(v) else v/eps);
  end normalize;
  
  function length "Return length of a vectorReturn length of a vector (better as norm(), if further symbolic processing is performed)"
    input Real v[:] "Vector";
    output Real result "Length of vector v";
  algorithm
    result := sqrt(v*v);
  end length;
end Math;  

package Types
 type TypeReal "Icon for a Real type" extends Real; end TypeReal;
 
 type GravityTypes = enumeration(
          NoGravity "No gravity field",
          UniformGravity "Uniform gravity field",
          PointGravity "Point gravity field") "Enumeration defining the type of the gravity field";
 type Axis = TypeReal[3](each final unit="1") "Axis vector with choices for menus";
end Types;

model World

    import Types;

    parameter Types.Axis n={0,-1,0};
    
    parameter Real mue(
        unit="m3/s2",
        min=0) = 3.986e14
        "Gravity field constant (default = field constant of earth)";
    
    parameter Types.GravityTypes gravityType = Types.GravityTypes.UniformGravity;
    parameter Real g=9.81 "Constant gravity acceleration";
    // Real gravity[3];

    public
      function gravityAcceleration = gravityAccelerationTypes(
          gravityType=gravityType,
          g=g*Math.normalize(n),
          mue=mue);

    public
      function gravityAccelerationTypes "Gravity field acceleration depending on field type and position"
        import Types.GravityTypes;
        input Real r[3] "Position vector from world frame to actual point, resolved in world frame";
        input GravityTypes gravityType "Type of gravity field";
        input Real g[3] "Constant gravity acceleration, resolved in world frame, if gravityType=1";
        input Real mue(unit="m3/s2") "Field constant of point gravity field, if gravityType=2";
        output Real gravity[3] "Gravity acceleration at point r, resolved in world frame";
      algorithm
        gravity := if gravityType == GravityTypes.UniformGravity
                   then g 
                   else if gravityType == GravityTypes.PointGravity 
                        then (mue/(r*r))*(r/Math.length(r))*(-1)
                        else zeros(3);
      end gravityAccelerationTypes;
      
  //equation
  //    gravity = gravityAcceleration({1,5,6});
end World;


model TestGravityAcceleration
  World w;
  Real gravity[3];
equation
  gravity = w.gravityAcceleration({1,5,6});
end TestGravityAcceleration;


// fclass TestGravityAcceleration
// parameter Real w.n[1] = 0;
// parameter Real w.n[2] = -1;
// parameter Real w.n[3] = 0;
// parameter Real w.mue(unit = "m3/s2", min = 0.0) = 398600000000000.0"Gravity field constant (default = field constant of earth)";
// parameter enumeration(NoGravity, UniformGravity, PointGravity) w.gravityType = Types.GravityTypes.UniformGravity;
// parameter Real w.g = 9.81"Constant gravity acceleration";
// Real gravity[1];
// Real gravity[2];
// Real gravity[3];
// equation
//   gravity = w.gravityAcceleration({1.0,5.0,6.0},w.gravityType,w.g * Math.normalize({w.n[1],w.n[2],w.n[3]},1e-13),w.mue);
// end TestGravityAcceleration;
