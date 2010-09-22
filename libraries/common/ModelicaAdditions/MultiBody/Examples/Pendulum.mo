encapsulated model Pendulum
   import Modelica.Icons;
   import Modelica.Mechanics.Rotational;
   import ModelicaAdditions.MultiBody.Joints;
   import ModelicaAdditions.MultiBody.Parts;
   extends Icons.Example;
   parameter Real L=0.8 "length of box";
   parameter Real d=1. "damping constant";
   Parts.InertialSystem inertial annotation (Placement(transformation(x=-90.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=30.,scale=0.1,aspectRatio=1.)));
   Parts.BoxBody boxBody(r={L,0,0}) annotation (Placement(transformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.)));
   Joints.Revolute revolute(n={0,0,1}) annotation (Placement(transformation(x=-50.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=30.,scale=0.1,aspectRatio=1.)));
   Rotational.Damper damper(d=d) annotation (Placement(transformation(x=-50.,y=70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=70.,scale=0.1,aspectRatio=1.)));
   
equation
   connect(inertial.frame_b, revolute.frame_a) annotation (Line(points={{-79.5,30.},{-60.5,30.}},color={0,0,255}));
   connect(revolute.frame_b, boxBody.frame_a) annotation (Line(points={{-39.5,30.},{-20.5,30.}},color={0,0,255}));
   connect(damper.flange_b, revolute.axis) annotation (Line(points={{-40.,70.},{-40.,50.},{-50.,50.},{-50.,37.}},color={0,0,255}));
   connect(damper.flange_a, revolute.bearing) annotation (Line(points={{-60.,70.},{-60.,50.},{-56.,50.},{-56.,37.}},color={0,0,255}));
end Pendulum;