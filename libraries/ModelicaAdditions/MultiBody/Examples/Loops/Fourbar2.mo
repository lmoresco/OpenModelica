encapsulated model Fourbar2
   import Modelica.Icons;
   import ModelicaAdditions.MultiBody.CutJoints;
   import ModelicaAdditions.MultiBody.Joints;
   import ModelicaAdditions.MultiBody.Parts;
   import SI = Modelica.SIunits;
   extends Icons.Example;
   output SI.Angle j1q "angle of revolute joint j1";
   output SI.Position j2q "distance of prismatic joint j2";
   output SI.AngularVelocity j1qd "axis speed of revolute joint j1";
   output SI.Velocity j2qd "axis velocity of prismatic joint j2";
   annotation (Documentation(info="Simulate for 1 second (100 output points)
 "));
   Parts.InertialSystem inertial annotation (Placement(transformation(x=-90.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=-70.,scale=0.1,aspectRatio=1.)));
   Joints.Revolute j1(n={1,0,0},qd(start=20),startValueFixed=true) annotation (Placement(transformation(x=-44.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-44.,y=-30.,scale=0.1,aspectRatio=1.)));
   Joints.Prismatic j2(n={1,0,0}) annotation (Placement(transformation(x=20.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=20.,y=-70.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b1(r={0,0.5,0.1},Radius=0.05) annotation (Placement(transformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.,rotation=90)));
   Parts.CylinderBody b2(r={0,0.2,0},Radius=0.05) annotation (Placement(transformation(x=50.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=50.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90)));
   Parts.BoxBody b0(r={1,0,0},Width=0.01,Height=0.01,Material={0,0,1,0.5}) annotation (Placement(transformation(x=-10.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=-70.,scale=0.1,aspectRatio=1.)));
   CutJoints.Spherical sphereC annotation (Placement(transformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b3(r={-1,0.3,0.1},Radius=0.05,Material={0,1,0,0.5}) annotation (Placement(transformation(x=30.,y=30.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=30.,y=30.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   Joints.Revolute rev(n={0,1,0}) annotation (Placement(transformation(x=50.,y=-22.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=50.,y=-22.,scale=0.1,aspectRatio=1.,rotation=90)));
   Joints.Revolute rev1 annotation (Placement(transformation(x=70.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=70.,y=10.,scale=0.1,aspectRatio=1.)));
   
equation
   connect(inertial.frame_b, b0.frame_a) annotation (Line(points={{-79.5,-70.},{-20.5,-70.}},color={0,0,255}));
   connect(b0.frame_b, j2.frame_a) annotation (Line(points={{0.5,-70.},{9.5,-70.}},color={0,0,255}));
   connect(j2.frame_b, b2.frame_a) annotation (Line(points={{30.5,-70.},{50.,-70.},{50.,-60.5}},color={0,0,255}));
   connect(b1.frame_b, sphereC.frame_a) annotation (Line(points={{-30.,10.5},{-30.,30.},{-20.5,30.}},color={0,0,255}));
   connect(j1.frame_b, b1.frame_a) annotation (Line(points={{-33.5,-30.},{-30.,-30.},{-30.,-10.5}},color={0,0,255}));
   connect(rev.frame_a, b2.frame_b) annotation (Line(points={{50.,-32.5},{50.,-39.5}},color={0,0,255}));
   connect(rev.frame_b, rev1.frame_a) annotation (Line(points={{50.,-11.5},{50.,10.},{59.5,10.}},color={0,0,255}));
   connect(b3.frame_b, sphereC.frame_b) annotation (Line(points={{19.5,30.},{0.5,30.}},color={0,0,255}));
   connect(rev1.frame_b, b3.frame_a) annotation (Line(points={{80.5,10.},{90.,10.},{90.,30.},{40.5,30.}},color={0,0,255}));
   connect(inertial.frame_b, j1.frame_a) annotation (Line(points={{-79.5,-70.},{-66.,-70.},{-66.,-30.},{-54.5,-30.}},color={0,0,255}));
   j1q = j1.q;
   j2q = j2.q;
   j1qd = j1.qd;
   j2qd = j2.qd;
end Fourbar2;