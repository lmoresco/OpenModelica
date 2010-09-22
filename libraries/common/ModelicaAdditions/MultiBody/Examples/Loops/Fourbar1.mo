encapsulated model Fourbar1
   import Modelica.Icons;
   import ModelicaAdditions.MultiBody.CutJoints;
   import ModelicaAdditions.MultiBody.Joints;
   import ModelicaAdditions.MultiBody.Parts;
   import SI = Modelica.SIunits;
   extends Icons.Example;
   parameter SI.Length L=sqrt((1+0.3*0.3)+0.1*0.1) "Length of connecting rod";
   output SI.Angle j1q "angle of revolute joint j1";
   output SI.Position j2q "distance of prismatic joint j2";
   output SI.AngularVelocity j1qd "axis speed of revolute joint j1";
   output SI.Velocity j2qd "axis velocity of prismatic joint j2";
   annotation (Documentation(info="Simulate for 1 second (100 output points)
 "));
   Parts.InertialSystem inertial annotation (Placement(transformation(x=-70.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-70.,y=-70.,scale=0.1,aspectRatio=1.)));
   Joints.Revolute j1(n={1,0,0},qd(start=20),startValueFixed=true) annotation (Placement(transformation(x=-44.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-44.,y=-30.,scale=0.1,aspectRatio=1.)));
   Joints.Prismatic j2(n={1,0,0}) annotation (Placement(transformation(x=20.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=20.,y=-70.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b1(r={0,0.5,0.1},Radius=0.05) annotation (Placement(transformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.,rotation=90)));
   Parts.CylinderBody b2(r={0,0.2,0},Radius=0.05) annotation (Placement(transformation(x=50.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=50.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90)));
   Parts.BoxBody b0(r={1,0,0},Width=0.01,Height=0.01,Material={0,0,1,0.5}) annotation (Placement(transformation(x=-10.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=-70.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b3(r={L,0,0},Radius=0.05) annotation (Placement(transformation(x=-26.,y=50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=-26.,y=50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   CutJoints.ConnectingRod2 barC(L=L,na={0,1,0}) annotation (Placement(transformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   
equation
   connect(inertial.frame_b, b0.frame_a) annotation (Line(points={{-59.5,-70.},{-20.5,-70.}},color={0,0,255}));
   connect(b0.frame_b, j2.frame_a) annotation (Line(points={{0.5,-70.},{9.5,-70.}},color={0,0,255}));
   connect(j2.frame_b, b2.frame_a) annotation (Line(points={{30.5,-70.},{50.,-70.},{50.,-60.5}},color={0,0,255}));
   connect(j1.frame_b, b1.frame_a) annotation (Line(points={{-33.5,-30.},{-30.,-30.},{-30.,-10.5}},color={0,0,255}));
   connect(j1.frame_a, inertial.frame_b) annotation (Line(points={{-54.5,-30.},{-59.5,-30.},{-59.5,-70.}},color={0,0,255}));
   connect(b1.frame_b, barC.frame_b) annotation (Line(points={{-30.,10.5},{-30.,30.},{-20.5,30.}},color={0,0,255}));
   connect(barC.frame_a, b2.frame_b) annotation (Line(points={{0.5,30.},{50.,30.},{50.,-39.5}},color={0,0,255}));
   connect(b3.frame_a, barC.frame_c) annotation (Line(points={{-15.5,50.},{-8.,50.},{-7.9,32.1}},color={0,0,255}));
   j1q = j1.q;
   j2q = j2.q;
   j1qd = j1.qd;
   j2qd = j2.qd;
end Fourbar1;