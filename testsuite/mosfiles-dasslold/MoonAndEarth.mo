//within Astronomy;

model MoonAndEarth
  import Modelica.Math.sin;
  import Modelica.Math.cos;
  Body earth(
    x(start=0),
    y(start=0),
    vx(start=0),
    vy(start=0),
    mass=5.9736*10^24);
  Body moon(
    x(start=384400000),
    y(start=0),
    vx(start=0),
    vy(start=1023.14),
    mass=7.347673*10^22);
  constant Real G=6.67300*10^(-11) "gravitational constant";
  Real force;
  Real xDistance;
  Real yDistance;
  Real alfa;
equation
  xDistance = moon.x - earth.x;
  yDistance = moon.y - earth.y;
  cos(alfa) = xDistance/sqrt((xDistance^2 + yDistance^2));
  
  force = G * earth.mass * moon.mass / (xDistance^2 + yDistance^2);

  earth.fx = force * cos(alfa);
  earth.fy = force * sin(alfa);
  
  earth.fx = -moon.fx;
  earth.fy = -moon.fy;
end MoonAndEarth;
