encapsulated model TwoLoop
   import Modelica.Mechanics.Rotational;
   import Modelica.Blocks.Sources;
   import ModelicaAdditions.MultiBody.CutJoints;
   import ModelicaAdditions.MultiBody.Joints;
   import ModelicaAdditions.MultiBody.Parts;
   annotation (Diagram(coordinateSystem(extent={{-200.,-200.},{200.,200.}})),Documentation(info="Use
 
 experiment StopTime=1.6 NumberOfIntervals=200
 
 Perform 'simulate' and then see animation in
 Animation window.
 
 plot j1.q and j1.qd
 "),Commands(file="TwoLoop.mos" "Simulate and plot angle and rotation of revolute joint"),Icon(coordinateSystem(extent={{-200.,-200.},{200.,200.}}),graphics={Rectangle(extent={{-200.,-200.},{160.,100.}},lineColor={0,0,255}),Polygon(points={{-200.,100.},{-158.,140.},{200.,140.},{160.,100.},{-200.,100.}},lineColor={0,0,255}),Polygon(points={{200.,140.},{200.,-160.},{160.,-200.},{160.,100.},{200.,140.}},lineColor={0,0,255}),Text(extent={{-170.,68.},{132.,-172.}},textString="Example",fillColor={0,0,255}),Text(extent={{-200.,240.},{198.,140.}},textString="%name",fillColor={255,0,0})}));
   Parts.InertialSystem inertial annotation (Placement(transformation(x=-190.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-190.,y=-50.,scale=0.1,aspectRatio=1.)));
   Joints.Revolute j1(n={0,0,1},startValueFixed=true) annotation (Placement(transformation(x=-50.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=-30.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b1(r={0.1,0.5,-0.5},Radius=0.02) annotation (Placement(transformation(x=-30.,y=10.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-30.,y=10.,scale=0.1,aspectRatio=1.,rotation=90)));
   CutJoints.ConnectingRod2 j2(L=1.1,na={1,0,0}) annotation (Placement(transformation(x=-10.,y=50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=50.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b2(r={1.1,0,0},Radius=0.02,Material={0,1,0,0.5}) annotation (Placement(transformation(x=8.,y=90.,scale=0.1,aspectRatio=1.),iconTransformation(x=8.,y=90.,scale=0.1,aspectRatio=1.)));
   Parts.ShapeBody b3(r={-0.2,0,0},Width=0.04,Height=0.04,Material={0,0,1,0.5}) annotation (Placement(transformation(x=30.,y=10.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=30.,y=10.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   Joints.Prismatic j3(n={1,0,0}) annotation (Placement(transformation(x=30.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=30.,y=-50.,scale=0.1,aspectRatio=1.)));
   Parts.ShapeBody b5(r={1.8,0,0},Width=0.02,Height=0.02,Material={0.5,0.5,0.5,0.5}) annotation (Placement(transformation(x=-10.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=-50.,scale=0.1,aspectRatio=1.)));
   Parts.CylinderBody b6(r={0,-0.3,0},Radius=0.03) annotation (Placement(transformation(x=110.,y=-10.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=110.,y=-10.,scale=0.1,aspectRatio=1.,rotation=90)));
   Joints.Prismatic j5(n={0,0,1},qq(start=-0.5,fixed=false)) annotation (Placement(transformation(x=130.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=130.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   Parts.ShapeBody b7(r={0,0,-0.3},Width=0.03,Height=0.03,Material={0,1,0,0.5}) annotation (Placement(transformation(x=160.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=160.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
   CutJoints.Spherical j4 annotation (Placement(transformation(x=74.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=74.,y=10.,scale=0.1,aspectRatio=1.)));
   Joints.Revolute j6(n={-1,0,0}) annotation (Placement(transformation(x=186.,y=-70.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=186.,y=-70.,scale=0.1,aspectRatio=1.,rotation=90)));
   Joints.Revolute j7(n={0,1,0}) annotation (Placement(transformation(x=164.,y=-90.,scale=0.1,aspectRatio=1.),iconTransformation(x=164.,y=-90.,scale=0.1,aspectRatio=1.)));
   Parts.ShapeBody b4(r={0,0,0.5},Width=0.02,Height=0.02,Material={0.5,0.5,0.5,0.5}) annotation (Placement(transformation(x=30.,y=-90.,scale=0.1,aspectRatio=1.),iconTransformation(x=30.,y=-90.,scale=0.1,aspectRatio=1.)));
   Parts.Shape shape(LengthDirection={0,0,0.4},Width=0.02,Height=0.02) annotation (Placement(transformation(x=130.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=130.,y=-30.,scale=0.1,aspectRatio=1.)));
   Parts.FrameAxes frame(nx={1,-1,1}) annotation (Placement(transformation(x=-142.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-142.,y=-50.,scale=0.1,aspectRatio=1.)));
   Rotational.Torque torque annotation (Placement(transformation(x=-130.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-130.,y=10.,scale=0.1,aspectRatio=1.)));
   Rotational.IdealGear gear(ratio=10) annotation (Placement(transformation(x=-100.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=10.,scale=0.1,aspectRatio=1.)));
   Rotational.Inertia shaft(J=0.5) annotation (Placement(transformation(x=-70.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-70.,y=10.,scale=0.1,aspectRatio=1.)));
   Sources.Constant constIn(k={10}) annotation (Placement(transformation(x=-168.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-168.,y=10.,scale=0.1,aspectRatio=1.)));
   Parts.FrameTranslation b8(r={-0.8,0,0}) annotation (Placement(transformation(x=-90.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=-50.,scale=0.1,aspectRatio=1.)));
   
equation
   connect(b1.frame_a, j1.frame_b) annotation (Line(points={{-30.,-0.5},{-30.,-30.},{-39.5,-30.}},color={0,0,255}));
   connect(j2.frame_c, b2.frame_a) annotation (Line(points={{-12.1,52.1},{-12.,90.},{-2.5,90.}},color={0,0,255}));
   connect(b1.frame_b, j2.frame_a) annotation (Line(points={{-30.,20.5},{-30.,50.},{-20.5,50.}},color={0,0,255}));
   connect(b5.frame_b, j3.frame_a) annotation (Line(points={{0.5,-50.},{19.5,-50.}},color={0,0,255}));
   connect(b6.frame_b, j4.frame_b) annotation (Line(points={{110.,0.5},{110.,10.},{84.5,10.}},color={0,0,255}));
   connect(j5.frame_b, b6.frame_a) annotation (Line(points={{119.5,-50.},{110.,-50.},{110.,-20.5}},color={0,0,255}));
   connect(b7.frame_b, j5.frame_a) annotation (Line(points={{149.5,-50.},{140.5,-50.}},color={0,0,255}));
   connect(j6.frame_b, b7.frame_a) annotation (Line(points={{186.,-59.5},{186.,-50.},{170.5,-50.}},color={0,0,255}));
   connect(j7.frame_b, j6.frame_a) annotation (Line(points={{174.5,-90.},{186.,-90.},{186.,-80.5}},color={0,0,255}));
   connect(b5.frame_b, b4.frame_a) annotation (Line(points={{0.5,-50.},{10.,-50.},{10.,-90.},{19.5,-90.}},color={0,0,255}));
   connect(b4.frame_b, j7.frame_a) annotation (Line(points={{40.5,-90.},{153.5,-90.}},color={0,0,255}));
   connect(inertial.frame_b, frame.frame_a) annotation (Line(points={{-179.5,-50.},{-152.5,-50.}},color={0,0,255}));
   connect(constIn.outPort, torque.inPort) annotation (Line(points={{-157.,10.},{-142.,10.}},color={0,0,255}));
   connect(torque.flange_b, gear.flange_a) annotation (Line(points={{-120.,10.},{-110.,10.}},color={0,0,255}));
   connect(gear.flange_b, shaft.flange_a) annotation (Line(points={{-90.,10.},{-80.,10.}},color={0,0,255}));
   connect(shaft.flange_b, j1.axis) annotation (Line(points={{-60.,10.},{-50.,10.},{-50.,-23.}},color={0,0,255}));
   connect(j3.frame_b, j4.frame_a) annotation (Line(points={{40.5,-50.},{52.,-50.},{52.,10.},{63.5,10.}},color={0,0,255}));
   connect(j3.frame_b, b3.frame_a) annotation (Line(points={{40.5,-50.},{52.,-50.},{52.,10.},{40.5,10.}},color={0,0,255}));
   connect(b3.frame_b, j2.frame_b) annotation (Line(points={{19.5,10.},{10.,10.},{10.,50.},{0.5,50.}},color={0,0,255}));
   connect(frame.frame_b, b8.frame_a) annotation (Line(points={{-131.5,-50.},{-100.5,-50.}},color={0,0,255}));
   connect(b8.frame_b, b5.frame_a) annotation (Line(points={{-79.5,-50.},{-20.5,-50.}},color={0,0,255}));
   connect(b8.frame_b, j1.frame_a) annotation (Line(points={{-79.5,-50.},{-68.,-50.},{-68.,-30.},{-60.5,-30.}},color={0,0,255}));
   connect(j5.frame_b, shape.frame_a) annotation (Line(points={{119.5,-50.},{110.,-50.},{110.,-30.},{119.5,-30.}},color={0,0,255}));
end TwoLoop;