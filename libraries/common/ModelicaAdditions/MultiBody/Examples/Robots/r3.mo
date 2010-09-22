package r3 "Models of the Manutec r3 robot"
   extends Modelica.Icons.Library;
   annotation (Documentation(info="<HTML>
 <p>
 This package contains models of the robot r3 of the company Manutec.
 It is used to demonstrate in which way complex robot models should
 be built up by testing first the components of the model
 individually before composing them together. The following models are
 available:
 </p>
 
 <pre>
    <b>axisType1</b>        Test one axis (controller, motor, gearbox) of structure 1.
    <b>axisType2</b>        Test one axis (controller, motor, gearbox) of structure 2.
    <b>inverseDynamics</b>  Test mechanical structure
                     (predefined joint angle time functions).
    <b>robot</b>            Test complete robot model.
 </pre>
 
 <p>
 The parameters of this robot have been determined by measurements
 in the laboratory of DLR. The measurement procedure is described in:
 </p>
 
 <pre>
    Tuerk S. (1990): Zur Modellierung der Dynamik von Robotern mit
        rotatorischen Gelenken. Fortschrittberichte VDI, Reihe 8, Nr. 211,
        VDI-Verlag 1990.
 </pre>
 
 <p>
 The robot model is described in detail in
 </p>
 
 <pre>
    Otter M. (1995): Objektorientierte Modellierung mechatronischer
        Systeme am Beispiel geregelter Roboter. Dissertation,
        Fortschrittberichte VDI, Reihe 20, Nr. 147, VDI-Verlag 1995.
        This report can be downloaded as compressed postscript file
        from: http://www.robotic.dlr.de/Martin.Otter/publications.html
 </pre>
 
 <dl>
 <dt><b>Main Author:</b>
 <dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
     Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
     Institut f&uuml;r Robotik und Mechatronik<br>
     Postfach 1116<br>
     D-82230 Wessling<br>
     Germany<br>
     email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
 </dl>
 <br>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 20, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 <br>
 
 <p><b>Copyright &copy; 2000-2002, DLR.</b></p>
 
 <p><i>
 The Modelica package is <b>free</b> software; it can be redistributed and/or modified
 under the terms of the <b>Modelica license</b>, see the license conditions
 and the accompanying <b>disclaimer</b> in the documentation of package
 Modelica in file \"Modelica/package.mo\".
 </i></p>
 
 </HTML>
 "));
   encapsulated model axisType1 "Test one axis of r3 robot (controller, motor, gearbox) of structure 1."
      import Modelica.Icons;
      import Modelica.Constants;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import ModelicaAdditions.MultiBody.Examples.Robots.r3.Components;
      extends Icons.Example;
      output Real refq "reference joint angle in [deg]";
      output Real q "actual joint angle in [deg]";
      output Real eq "joint angle error in [deg]";
      output Real refqd "reference joint angular velocity in [rad/s]";
      output Real qd "actual joint angular velocity in [rad/s]";
      output Real eqd "joint angular velocity error in [rad/s]";
      constant Real pi=Constants.pi;
      constant Real rad2deg=180/pi;
      annotation (Documentation(info="<HTML>
 <p>
 The robot r3 has 2 different model structures of its axes.
 Axis type 1 is checked with this model.
 Simulate for 0.8 s.
 </p>
 </HTML>
 "));
      Components.AxisType1 axis1 annotation (Placement(transformation(x=-23.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-23.,y=10.,scale=0.1,aspectRatio=1.)));
      Sources.KinematicPTP PTP(deltaq={pi/2},qd_max={3},qdd_max={50}) annotation (Placement(transformation(x=-59.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-59.,y=10.,scale=0.1,aspectRatio=1.)));
      Rotational.Inertia load(J=5) annotation (Placement(transformation(x=10.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=10.,scale=0.1,aspectRatio=1.)));
      
   equation
      connect(PTP.outPort, axis1.inPort_a_ref) annotation (Line(points={{-48.,10.},{-35.,10.}},color={0,0,255}));
      connect(axis1.flange, load.flange_a) annotation (Line(points={{-13.,10.},{0.,10.}},color={128,128,128},thickness=0.5));
      refq = axis1.phi_ref*rad2deg;
      q = axis1.flange.phi*rad2deg;
      eq = refq-q;
      refqd = axis1.w_ref;
      qd = der(axis1.flange.phi);
      eqd = refqd-qd;
   end axisType1;
   encapsulated model axisType2 "Test one axis of r3 robot (controller, motor, gearbox) of structure 2."
      import Modelica.Icons;
      import Modelica.Constants;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import ModelicaAdditions.MultiBody.Examples.Robots.r3.Components;
      extends Icons.Example;
      output Real refq "reference joint angle in [deg]";
      output Real q "actual joint angle in [deg]";
      output Real eq "joint angle error in [deg]";
      output Real refqd "reference joint angular velocity in [rad/s]";
      output Real qd "actual joint angular velocity in [rad/s]";
      output Real eqd "joint angular velocity error in [rad/s]";
      constant Real pi=Constants.pi;
      constant Real rad2deg=180/pi;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 The robot r3 has 2 different model structures of its axes.
 Axis type 2 is checked with this model.
 Simulate for 0.8 s.
 </p>
 </HTML>
 "));
      Components.AxisType2 axis2 annotation (Placement(transformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=30.,scale=0.1,aspectRatio=1.)));
      Rotational.Inertia load(J=1) annotation (Placement(transformation(x=30.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=30.,y=30.,scale=0.1,aspectRatio=1.)));
      Sources.KinematicPTP PTP(deltaq={pi/2},qd_max={3},qdd_max={50}) annotation (Placement(transformation(x=-49.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-49.,y=30.,scale=0.1,aspectRatio=1.)));
      
   equation
      connect(axis2.flange, load.flange_a) annotation (Line(points={{0.,30.},{20.,30.}},color={0,0,255}));
      connect(PTP.outPort, axis2.inPort_a_ref) annotation (Line(points={{-38.,30.},{-21.9,30.}},color={0,0,255}));
      refq = axis2.phi_ref*rad2deg;
      q = axis2.flange.phi*rad2deg;
      eq = refq-q;
      refqd = axis2.w_ref;
      qd = der(axis2.flange.phi);
      eqd = refqd-qd;
   end axisType2;
   encapsulated model inverseDynamics "Test of the mechanical structure model using time-dependent joint motion"
      import Modelica.Icons;
      import Modelica.Constants;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import ModelicaAdditions.Blocks.Multiplexer;
      import ModelicaAdditions.MultiBody.Examples.Robots.r3.Components;
      extends Icons.Example;
      constant Real deg2rad=Constants.pi/180;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 This model is used to test the mechanical structure of the
 Manutec r3 robot. The 6 joints are forced to move according
 to a pre-defined motion, i.e., the inverse dynamics of the
 robot is computed. <br>
 Simulate for 1.2 seconds.
 </p>
 </HTML>
 "));
      Components.MechanicalStructure mechanics annotation (Placement(transformation(x=55.,y=5.,scale=0.225,aspectRatio=1.),iconTransformation(x=55.,y=5.,scale=0.225,aspectRatio=1.)));
      Sources.KinematicPTP PTP(deltaq={180,180,-100,120,120,120}*deg2rad,qd_max={3,3,4.5,3,4,3},qdd_max={50,50,50,50,50,50}) annotation (Placement(transformation(x=-90.,y=6.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=6.,scale=0.1,aspectRatio=1.)));
      Multiplexer.DeMultiplex6 deMux annotation (Placement(transformation(x=-60.5,y=6.,scale=0.105,aspectRatio=0.9523809523809523,flipVertical=true),iconTransformation(x=-60.5,y=6.,scale=0.105,aspectRatio=0.9523809523809523,flipVertical=true)));
      Rotational.Accelerate accelerate1(phi_start=-120*deg2rad) annotation (Placement(transformation(x=-20.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=-70.,scale=0.1,aspectRatio=1.)));
      Rotational.Accelerate accelerate2(phi_start=-90*deg2rad) annotation (Placement(transformation(x=-20.,y=-40.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=-40.,scale=0.1,aspectRatio=1.)));
      Rotational.Accelerate accelerate3(phi_start=0) annotation (Placement(transformation(x=-20.,y=-10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=-10.,scale=0.1,aspectRatio=1.)));
      Rotational.Accelerate accelerate4(phi_start=-60*deg2rad) annotation (Placement(transformation(x=-20.,y=20.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=20.,scale=0.1,aspectRatio=1.)));
      Rotational.Accelerate accelerate5(phi_start=-90*deg2rad) annotation (Placement(transformation(x=-20.,y=50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=50.,scale=0.1,aspectRatio=1.)));
      Rotational.Accelerate accelerate6(phi_start=-90*deg2rad) annotation (Placement(transformation(x=-20.,y=80.,scale=0.1,aspectRatio=1.),iconTransformation(x=-20.,y=80.,scale=0.1,aspectRatio=1.)));
      
   equation
      connect(PTP.outPort, deMux.inPort) annotation (Line(points={{-79.,6.},{-73.1,6.}},color={0,0,255}));
      connect(deMux.outPort6, accelerate6.inPort) annotation (Line(points={{-48.95,15.},{-46.,15.},{-46.,80.},{-32.,80.}},color={0,0,255}));
      connect(deMux.outPort5, accelerate5.inPort) annotation (Line(points={{-48.95,11.4},{-44.,11.4},{-44.,50.},{-32.,50.}},color={0,0,255}));
      connect(deMux.outPort4, accelerate4.inPort) annotation (Line(points={{-48.95,7.8},{-42.,7.8},{-42.,20.},{-32.,20.}},color={0,0,255}));
      connect(deMux.outPort3, accelerate3.inPort) annotation (Line(points={{-48.95,4.2},{-42.,4.2},{-42.,-10.},{-32.,-10.}},color={0,0,255}));
      connect(deMux.outPort2, accelerate2.inPort) annotation (Line(points={{-48.95,0.6},{-44.,0.6},{-44.,-40.},{-32.,-40.}},color={0,0,255}));
      connect(accelerate1.inPort, deMux.outPort1) annotation (Line(points={{-32.,-70.},{-46.,-70.},{-46.,-3.},{-48.95,-3.}},color={0,0,255}));
      connect(accelerate2.flange_b, mechanics.axis2) annotation (Line(points={{-10.,-40.},{-5.,-40.},{-5.,-19.75},{7.75,-19.75}},color={128,128,128},thickness=0.5));
      connect(accelerate1.flange_b, mechanics.axis1) annotation (Line(points={{-10.,-70.},{0.,-70.},{0.,-33.},{7.75,-33.25}},color={128,128,128},thickness=0.5));
      connect(accelerate3.flange_b, mechanics.axis3) annotation (Line(points={{-10.,-10.},{-5.,-10.},{-5.,-6.25},{7.75,-6.25}},color={128,128,128},thickness=0.5));
      connect(accelerate4.flange_b, mechanics.axis4) annotation (Line(points={{-10.,20.},{-5.,20.},{-5.,7.},{7.75,7.25}},color={128,128,128},thickness=0.5));
      connect(accelerate5.flange_b, mechanics.axis5) annotation (Line(points={{-10.,50.},{-2.,50.},{-2.,20.75},{7.75,20.75}},color={128,128,128},thickness=0.5));
      connect(accelerate6.flange_b, mechanics.axis6) annotation (Line(points={{-10.,80.},{2.,80.},{2.,34.25},{7.75,34.25}},color={128,128,128},thickness=0.5));
   end inverseDynamics;
   encapsulated model robot "Detailled model of Manutec r3 robot with reference path"
      import Modelica.Icons;
      import ModelicaAdditions.Tables;
      import ModelicaAdditions.MultiBody.Examples.Robots.r3.Components;
      extends Icons.Example;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 Complete model of Mantuec r3 robot, including
 controller, motor, gearbox, 3D-mechanics model.
 Simulate for 1.3 s.
 </p>
 </HTML>
 "),Commands(file="r3.mos" "Simulate and plot torque"));
      Components.FullRobot robot(q0={-1,0.43,1.57,0,-2,0}) annotation (Placement(transformation(x=35.,y=-5.,scale=0.65,aspectRatio=1.),iconTransformation(x=35.,y=-5.,scale=0.65,aspectRatio=1.)));
      Tables.CombiTableTime a_ref1(table={{0,30},{0.1,30},{0.1,0},{0.74,0},{0.74,-13.96},{1.12,-13.96},{1.12,28.75},{1.2,28.75},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-80.5,y=-80.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-80.5,y=-80.,scale=0.105,aspectRatio=0.9523809523809523)));
      Tables.CombiTableTime a_ref2(table={{0,-15},{0.1,-15},{0.1,0},{1.1,0},{1.1,15},{1.2,15},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-80.5,y=-50.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-80.5,y=-50.,scale=0.105,aspectRatio=0.9523809523809523)));
      Tables.CombiTableTime a_ref3(table={{0,30},{0.15,30},{0.15,-21.56},{0.6,-21.56},{0.6,0},{0.9,0},{0.9,17.33},{1.2,17.33},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-79.5,y=-20.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-79.5,y=-20.,scale=0.105,aspectRatio=0.9523809523809523)));
      Tables.CombiTableTime a_ref4(table={{0,-80},{0.04,-80},{0.04,0},{0.54,0},{0.54,71.11},{0.63,71.11},{0.63,0},{1.14,0},{1.14,-53.33},{1.2,-53.33},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-80.5,y=10.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-80.5,y=10.,scale=0.105,aspectRatio=0.9523809523809523)));
      Tables.CombiTableTime a_ref5(table={{0,105},{0.04,105},{0.04,0},{1.02,0},{1.02,-68.33},{1.14,-68.33},{1.14,66.67},{1.2,66.67},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-79.5,y=40.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-79.5,y=40.,scale=0.105,aspectRatio=0.9523809523809523)));
      Tables.CombiTableTime a_ref6(table={{0,-95},{0.04,-95},{0.04,0},{0.54,0},{0.54,84.44},{0.63,84.44},{0.63,0},{1.14,0},{1.14,-63.33},{1.2,-63.33},{1.2,0},{1.3,0}}) annotation (Placement(transformation(x=-80.5,y=70.,scale=0.105,aspectRatio=0.9523809523809523),iconTransformation(x=-80.5,y=70.,scale=0.105,aspectRatio=0.9523809523809523)));
      
   equation
      connect(a_ref1.outPort, robot.a_ref1) annotation (Line(points={{-68.95,-80.},{-50.,-80.},{-50.,-57.},{-33.25,-57.}},color={0,0,255}));
      connect(a_ref2.outPort, robot.a_ref2) annotation (Line(points={{-68.95,-50.},{-60.,-50.},{-60.,-37.5},{-33.25,-37.5}},color={0,0,255}));
      connect(a_ref3.outPort, robot.a_ref3) annotation (Line(points={{-67.95,-20.},{-50.,-20.},{-50.,-18.},{-33.25,-18.}},color={0,0,255}));
      connect(a_ref4.outPort, robot.a_ref4) annotation (Line(points={{-68.95,10.},{-50.,10.},{-50.,1.5},{-33.25,1.5}},color={0,0,255}));
      connect(a_ref5.outPort, robot.a_ref5) annotation (Line(points={{-67.95,40.},{-60.,40.},{-60.,21.},{-33.25,21.}},color={0,0,255}));
      connect(a_ref6.outPort, robot.a_ref6) annotation (Line(points={{-68.95,70.},{-50.,70.},{-50.,40.5},{-33.25,40.5}},color={0,0,255}));
   end robot;
   package Components "Library of components for the Manutec r3 robot"
      extends Modelica.Icons.Library;
      model GearType1 "Motor inertia and gearbox model for r3 joints 1,2,3 "
         extends Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
         parameter SI.Inertia J=0.0013 "moment of inertia of motor";
         parameter Real i=-105 "gear ratio";
         parameter Real c=43 "spring constant";
         parameter Real d=0.005 "damper constant";
         parameter SI.Torque Rv0=0.4 "viscous friction torque at zero velocity";
         parameter Real Rv1=0.13/160 "viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
         parameter Real peak=1 "peak*Rv0 = maximum static friction torque (peak >= 1)";
         annotation (Documentation(info="
 Models the gearbox used in the first three joints with all its effects,
 like elasticity and friction.
 
 Coulomb friction is approximated by a friction element acting
 at the \"motor\"-side. In reality, bearing friction should be
 also incorporated at the driven side of the gearbox. However,
 this would require considerable more effort for the measurement
 of the friction parameters.
 
 Default values for all parameters are given for joint 1.
 
 Model relativeStates is used to define the relative angle
 and relative angular velocity across the spring (=gear elasticity)
 as state variables. The reason is, that a default initial
 value of zero of these states makes always sense.
 If the absolute angle and the absolute angular velocity of model
 Jmotor would be used as states, and the load angle (= joint angle of
 robot) is NOT zero, one has always to ensure that the initial values
 of the motor angle and of the joint angle are modified correspondingly.
 Otherwise, the spring has an unrealistic deflection at initial time.
 Since relative quantities are used as state variables, this simplifies
 the definition of initial values considerably.
 
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,10.},{-60.,-10.}},fillColor={192,192,192},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{-60.,10.},{-60.,20.},{-40.,40.},{-40.,-40.},{-60.,-20.},{-60.,10.}},lineColor={0,0,0},fillColor={128,128,128},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-40.,60.},{40.,-60.}},lineColor={0,0,0},pattern=LinePattern.None,lineThickness=0.25,fillColor={192,192,192},fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{60.,20.},{40.,40.},{40.,-40.},{60.,-20.},{60.,20.}},lineColor={128,128,128},fillColor={128,128,128},fillPattern=FillPattern.Solid),Rectangle(extent={{60.,10.},{90.,-10.}},fillColor={192,192,192},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{-60.,-90.},{-50.,-90.},{-20.,-30.},{20.,-30.},{48.,-90.},{60.,-90.},{60.,-100.},{-60.,-100.},{-60.,-90.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Text(extent={{0.,128.},{0.,68.}},textString="%name",fillColor={0,0,255}),Text(extent={{-36.,40.},{36.,-30.}},textString="1",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{72.,30.},{130.,22.}},textString="flange of joint axis",fillColor={0,0,0}),Text(extent={{-124.,28.},{-66.,20.}},textString="flange of motor axis",fillColor={0,0,0})}));
         Modelica.Mechanics.Rotational.Inertia Jmotor(J=J) annotation (Placement(transformation(x=-64.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-64.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.IdealGear gear(ratio=i) annotation (Placement(transformation(x=60.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=60.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.SpringDamper spring(c=c,d=d) annotation (Placement(transformation(x=10.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.RelativeStates relativeStates annotation (Placement(transformation(x=10.,y=40.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=40.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.BearingFriction bearingFriction(tau_pos=[0,Rv0; 1,Rv0+Rv1]) annotation (Placement(transformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-30.,y=0.,scale=0.1,aspectRatio=1.)));
         
      equation
         connect(spring.flange_b, gear.flange_a) annotation (Line(points={{20.,0.},{50.,0.}},color={0,0,255}));
         connect(relativeStates.flange_b, spring.flange_b) annotation (Line(points={{20.,40.},{30.,40.},{30.,0.},{20.,0.}},color={0,0,255}));
         connect(relativeStates.flange_a, spring.flange_a) annotation (Line(points={{0.,40.},{-10.,40.},{-10.,0.},{0.,0.}},color={0,0,255}));
         connect(bearingFriction.flange_b, spring.flange_a) annotation (Line(points={{-20.,0.},{0.,0.}},color={0,0,255}));
         connect(Jmotor.flange_b, bearingFriction.flange_a) annotation (Line(points={{-54.,0.},{-40.,0.}},color={0,0,255}));
         connect(Jmotor.flange_a, flange_a) annotation (Line(points={{-74.,0.},{-100.,0.}},color={0,0,255}));
         connect(gear.flange_b, flange_b) annotation (Line(points={{70.,0.},{100.,0.}},color={0,0,255}));
      end GearType1;
      model GearType2 "Motor inertia and gearbox model for r3 joints 4,5,6  "
         extends Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
         parameter SI.Inertia J=0.00016 "moment of inertia of motor";
         parameter Real i=-99 "gear ratio";
         parameter SI.Torque Rv0=21.8 "viscous friction torque at zero velocity";
         parameter Real Rv1=9.8 "viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
         parameter Real peak=26.7/21.8 "peak*Rv0 = maximum static friction torque (peak >= 1)";
         annotation (Documentation(info="The elasticity and damping in the gearboxes of the outermost
 three joints of the robot is neglected.
 
 Default values for all parameters are given for joint 4.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,10.},{-60.,-10.}},fillColor={192,192,192},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{-60.,10.},{-60.,20.},{-40.,40.},{-40.,-40.},{-60.,-20.},{-60.,10.}},lineColor={0,0,0},fillColor={128,128,128},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-40.,60.},{40.,-60.}},lineColor={0,0,0},pattern=LinePattern.None,lineThickness=0.25,fillColor={192,192,192},fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{60.,20.},{40.,40.},{40.,-40.},{60.,-20.},{60.,20.}},lineColor={128,128,128},fillColor={128,128,128},fillPattern=FillPattern.Solid),Rectangle(extent={{60.,10.},{90.,-10.}},fillColor={192,192,192},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{-60.,-90.},{-50.,-90.},{-20.,-30.},{20.,-30.},{48.,-90.},{60.,-90.},{60.,-100.},{-60.,-100.},{-60.,-90.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Text(extent={{0.,128.},{0.,68.}},textString="%name",fillColor={0,0,255}),Text(extent={{-36.,40.},{38.,-30.}},textString="2",fillColor={0,0,255})}));
         Modelica.Mechanics.Rotational.Inertia Jmotor(J=J) annotation (Placement(transformation(x=-50.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.IdealGear gear(ratio=i) annotation (Placement(transformation(x=2.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=2.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.BearingFriction bearingFriction(tau_pos=[0,Rv0; 1,Rv0+Rv1],peak=peak) annotation (Placement(transformation(x=50.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=50.,y=0.,scale=0.1,aspectRatio=1.)));
         
      equation
         connect(Jmotor.flange_a, flange_a) annotation (Line(points={{-60.,0.},{-100.,0.}},color={0,0,255}));
         connect(gear.flange_b, bearingFriction.flange_a) annotation (Line(points={{12.,0.},{40.,0.}},color={0,0,255}));
         connect(bearingFriction.flange_b, flange_b) annotation (Line(points={{60.,0.},{100.,0.}},color={0,0,255}));
         connect(Jmotor.flange_b, gear.flange_a) annotation (Line(points={{-40.,0.},{-8.,0.}},color={0,0,255}));
      end GearType2;
      model Motor "Motor model including current controller of r3 motors "
         extends Modelica.Icons.MotorIcon;
         parameter Real k=1.1616 "gain of motor";
         parameter Real wm=4590 "time constant of motor";
         parameter Real D=0.6 "damping constant of motor";
         annotation (Documentation(info=" Default values are given for the motor of joint 1.
 The input of the motor is the desired current
 (the actual current is proportional to the torque
 produced by the motor).
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{0.,120.},{0.,60.}},textString="%name",fillColor={0,0,255}),Line(points={{50.,-10.},{50.,-89.}},color={0,0,255}),Line(points={{80.,-90.},{80.,-10.}},color={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-134.,35.},{-104.,18.}},textString="(reference current)",fillColor={0,0,0})}));
         Modelica.Blocks.Interfaces.InPort i_ref annotation (Placement(transformation(x=-119.5,y=0.,scale=0.195,aspectRatio=1.0256410256410255),iconTransformation(x=-119.5,y=0.,scale=0.195,aspectRatio=1.0256410256410255)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_motor annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort_w annotation (Placement(transformation(x=50.,y=-99.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=50.,y=-99.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Blocks.Interfaces.OutPort outPort_phi annotation (Placement(transformation(x=80.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=80.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Electrical.Analog.Sources.SignalVoltage Vs annotation (Placement(transformation(x=-76.,y=0.,scale=0.1,aspectRatio=1.,rotation=-90,flipHorizontal=true),iconTransformation(x=-76.,y=0.,scale=0.1,aspectRatio=1.,rotation=-90,flipHorizontal=true)));
         Modelica.Electrical.Analog.Ideal.IdealOpAmp diff annotation (Placement(transformation(x=-40.,y=25.,scale=0.1,aspectRatio=1.),iconTransformation(x=-40.,y=25.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Ideal.IdealOpAmp power annotation (Placement(transformation(x=40.,y=25.,scale=0.1,aspectRatio=1.),iconTransformation(x=40.,y=25.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.EMF emf(k=k) annotation (Placement(transformation(x=70.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=70.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.Inductor La(L=250/((2*D)*wm)) annotation (Placement(transformation(x=70.,y=30.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=70.,y=30.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Electrical.Analog.Basic.Resistor Ra(R=250) annotation (Placement(transformation(x=70.,y=60.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=70.,y=60.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Electrical.Analog.Basic.Resistor Rd2(R=100) annotation (Placement(transformation(x=-64.5,y=30.,scale=0.075,aspectRatio=1.0666666666666667),iconTransformation(x=-64.5,y=30.,scale=0.075,aspectRatio=1.0666666666666667)));
         Modelica.Electrical.Analog.Basic.Capacitor C(C=(0.004*D)/wm) annotation (Placement(transformation(x=10.,y=46.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=46.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Ideal.IdealOpAmp OpI annotation (Placement(transformation(x=10.,y=20.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=20.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.Resistor Rd1(R=100) annotation (Placement(transformation(x=-41.5,y=45.,scale=0.075,aspectRatio=1.0666666666666667),iconTransformation(x=-41.5,y=45.,scale=0.075,aspectRatio=1.0666666666666667)));
         Modelica.Electrical.Analog.Basic.Resistor Ri(R=10) annotation (Placement(transformation(x=-15.5,y=25.,scale=0.075,aspectRatio=1.0666666666666667),iconTransformation(x=-15.5,y=25.,scale=0.075,aspectRatio=1.0666666666666667)));
         Modelica.Electrical.Analog.Basic.Resistor Rp1(R=200) annotation (Placement(transformation(x=38.5,y=46.,scale=0.075,aspectRatio=1.0666666666666667),iconTransformation(x=38.5,y=46.,scale=0.075,aspectRatio=1.0666666666666667)));
         Modelica.Electrical.Analog.Basic.Resistor Rp2(R=50) annotation (Placement(transformation(x=25.,y=72.,scale=0.07,aspectRatio=1.1428571428571428,rotation=90),iconTransformation(x=25.,y=72.,scale=0.07,aspectRatio=1.1428571428571428,rotation=90)));
         Modelica.Electrical.Analog.Basic.Resistor Rd4(R=100) annotation (Placement(transformation(x=-33.5,y=-7.,scale=0.075,aspectRatio=1.0666666666666667),iconTransformation(x=-33.5,y=-7.,scale=0.075,aspectRatio=1.0666666666666667)));
         Modelica.Electrical.Analog.Sources.SignalVoltage hall2 annotation (Placement(transformation(x=-55.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90,flipHorizontal=true,flipVertical=true),iconTransformation(x=-55.,y=-50.,scale=0.1,aspectRatio=1.,rotation=90,flipHorizontal=true,flipVertical=true)));
         Modelica.Electrical.Analog.Basic.Resistor Rd3(R=100) annotation (Placement(transformation(x=-55.,y=-22.,scale=0.07,aspectRatio=1.1428571428571428,rotation=90),iconTransformation(x=-55.,y=-22.,scale=0.07,aspectRatio=1.1428571428571428,rotation=90)));
         Modelica.Electrical.Analog.Basic.Ground g1 annotation (Placement(transformation(x=-76.,y=-27.,scale=0.1,aspectRatio=1.),iconTransformation(x=-76.,y=-27.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.Ground g2 annotation (Placement(transformation(x=-55.,y=-80.,scale=0.1,aspectRatio=1.),iconTransformation(x=-55.,y=-80.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.Ground g3 annotation (Placement(transformation(x=-10.,y=-17.,scale=0.1,aspectRatio=1.),iconTransformation(x=-10.,y=-17.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Sensors.CurrentSensor hall1 annotation (Placement(transformation(x=30.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=30.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Electrical.Analog.Basic.Ground g4 annotation (Placement(transformation(x=30.,y=-74.,scale=0.1,aspectRatio=1.),iconTransformation(x=30.,y=-74.,scale=0.1,aspectRatio=1.)));
         Modelica.Electrical.Analog.Basic.Ground g5 annotation (Placement(transformation(x=25.,y=93.,scale=0.1,aspectRatio=1.,rotation=180),iconTransformation(x=25.,y=93.,scale=0.1,aspectRatio=1.,rotation=180)));
         Modelica.Mechanics.Rotational.Sensors.AngleSensor phi annotation (Placement(transformation(x=90.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=90.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90)));
         Modelica.Mechanics.Rotational.Sensors.SpeedSensor w annotation (Placement(transformation(x=70.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=70.,y=-50.,scale=0.1,aspectRatio=1.,rotation=-90)));
         
      equation
         connect(La.n, emf.p) annotation (Line(points={{70.,20.},{70.,10.}},color={0,0,255}));
         connect(Ra.n, La.p) annotation (Line(points={{70.,50.},{70.,40.}},color={0,0,255}));
         connect(Rd2.n, diff.n1) annotation (Line(points={{-57.,30.},{-50.,30.}},color={0,0,255}));
         connect(C.n, OpI.p2) annotation (Line(points={{20.,46.},{20.,20.}},color={0,0,255}));
         connect(OpI.p2, power.p1) annotation (Line(points={{20.,20.},{30.,20.}},color={0,0,255}));
         connect(Vs.p, Rd2.p) annotation (Line(points={{-76.,10.},{-76.,30.},{-72.,30.}},color={0,0,255}));
         connect(diff.n1, Rd1.p) annotation (Line(points={{-50.,30.},{-54.,30.},{-54.,45.},{-49.,45.}},color={0,0,255}));
         connect(Rd1.n, diff.p2) annotation (Line(points={{-34.,45.},{-30.,45.},{-30.,25.}},color={0,0,255}));
         connect(diff.p2, Ri.p) annotation (Line(points={{-30.,25.},{-23.,25.}},color={0,0,255}));
         connect(Ri.n, OpI.n1) annotation (Line(points={{-8.,25.},{0.,25.}},color={0,0,255}));
         connect(OpI.n1, C.p) annotation (Line(points={{0.,25.},{0.,46.}},color={0,0,255}));
         connect(power.n1, Rp1.p) annotation (Line(points={{30.,30.},{25.,30.},{25.,46.},{31.,46.}},color={0,0,255}));
         connect(power.p2, Rp1.n) annotation (Line(points={{50.,25.},{50.,46.},{46.,46.}},color={0,0,255}));
         connect(Rp1.p, Rp2.p) annotation (Line(points={{31.,46.},{25.,46.},{25.,64.}},color={0,0,255}));
         connect(power.p2, Ra.p) annotation (Line(points={{50.,25.},{56.,25.},{56.,80.},{70.,80.},{70.,70.}},color={0,0,255}));
         connect(Rd3.p, hall2.p) annotation (Line(points={{-55.,-30.},{-55.,-40.}},color={0,0,255}));
         connect(Rd3.n, diff.p1) annotation (Line(points={{-55.,-14.},{-55.,20.},{-50.,20.}},color={0,0,255}));
         connect(Rd3.n, Rd4.p) annotation (Line(points={{-55.,-14.},{-55.,-7.},{-41.,-7.}},color={0,0,255}));
         connect(Vs.n, g1.p) annotation (Line(points={{-76.,-10.},{-76.,-17.}},color={0,0,255}));
         connect(g2.p, hall2.n) annotation (Line(points={{-55.,-70.},{-55.,-60.}},color={0,0,255}));
         connect(Rd4.n, g3.p) annotation (Line(points={{-26.,-7.},{-10.,-7.}},color={0,0,255}));
         connect(g3.p, OpI.p1) annotation (Line(points={{-10.,-7.},{-10.,15.},{0.,15.}},color={0,0,255}));
         connect(hall1.outPort, hall2.inPort) annotation (Line(points={{20.,-50.},{-48.,-50.}},pattern=LinePattern.Dot,thickness=0.25,arrow={Arrow.None,Arrow.None},color={0,0,255}));
         connect(g5.p, Rp2.n) annotation (Line(points={{25.,83.},{25.,80.}},color={0,0,255}));
         connect(emf.n, hall1.p) annotation (Line(points={{70.,-10.},{70.,-24.},{30.,-24.},{30.,-40.}},color={0,0,255}));
         connect(hall1.n, g4.p) annotation (Line(points={{30.,-60.},{30.,-64.}},color={0,0,255}));
         connect(emf.flange_b, phi.flange_a) annotation (Line(points={{80.,0.},{80.,0.},{80.,-40.},{90.,-40.},{90.,-40.}},pattern=LinePattern.Dot,color={0,0,255}));
         connect(emf.flange_b, w.flange_a) annotation (Line(points={{80.,0.},{80.,0.},{80.,-40.},{70.,-40.},{70.,-40.}},pattern=LinePattern.Dot,color={0,0,255}));
         connect(w.outPort, outPort_w) annotation (Line(points={{70.,-61.},{50.,-61.},{50.,-99.}},pattern=LinePattern.Dot,color={0,0,255}));
         connect(phi.outPort, outPort_phi) annotation (Line(points={{90.,-61.},{90.,-80.5},{80.,-80.5},{80.,-100.}},pattern=LinePattern.Dot,color={0,0,255}));
         connect(flange_motor, emf.flange_b) annotation (Line(points={{100.,0.},{80.,0.}},color={0,0,0},thickness=0.5));
         connect(OpI.n2, power.n2) annotation (Line(points={{10.,10.},{10.,4.},{40.,4.},{40.,15.}},color={0,0,255}));
         connect(OpI.p1, OpI.n2) annotation (Line(points={{0.,15.},{0.,10.},{10.,10.}},color={0,0,255}));
         connect(OpI.p1, diff.n2) annotation (Line(points={{0.,15.},{-40.,15.}},color={0,0,255}));
         connect(Vs.inPort, i_ref) annotation (Line(points={{-83.,4.44089e-16},{-119.5,0.}},pattern=LinePattern.Dot,color={0,0,255}));
      end Motor;
      model Control "Controller model of r3 robot "
         extends Modelica.Blocks.Interfaces.BlockIcon;
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 For the robot 6 identical controllers are used.
 Therefore, this class has no parameters.
 </p>
 
 <p>
 In reality, the position controller is realized in digital
 form (components Kv, Kd). For efficiency reasons, this
 controller part is modelled as continuous component.
 By simulation it has been shown, that the difference in the
 results is below the plot accuracy.
 </p>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-40.,70.},{44.,28.}},fillColor={255,255,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-40.,-20.},{44.,-62.}},fillColor={255,255,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{44.,46.},{78.,46.},{78.,-42.},{44.,-42.}},color={0,0,255}),Line(points={{-40.,-42.},{-76.,-42.},{-76.,48.},{-40.,48.}},color={0,0,255}),Polygon(points={{44.,-42.},{64.,-32.},{64.,-50.},{44.,-42.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Polygon(points={{-40.,48.},{-60.,56.},{-60.,40.},{-40.,48.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255})}));
         Modelica.Blocks.Interfaces.InPort phi_ref annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort w_ref annotation (Placement(transformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort phi annotation (Placement(transformation(x=-80.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90),iconTransformation(x=-80.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90)));
         Modelica.Blocks.Interfaces.InPort w annotation (Placement(transformation(x=70.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90),iconTransformation(x=70.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90)));
         Modelica.Blocks.Interfaces.OutPort i_ref annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.TransferFunction rate2(b={0.00995,1},a={0.00056,1}) annotation (Placement(transformation(x=40.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=40.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.Integrator rate3(k={340.8}) annotation (Placement(transformation(x=70.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=70.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.TransferFunction rate1(b={1/25,1},a={0.0202,1}) annotation (Placement(transformation(x=26.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=26.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
         Modelica.Blocks.Continuous.FirstOrder tacho1(k={0.03},T={0.0008475}) annotation (Placement(transformation(x=80.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=80.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
         Modelica.Blocks.Math.Gain Kd(k={0.03}) annotation (Placement(transformation(x=-60.,y=70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-60.,y=70.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Feedback wSum annotation (Placement(transformation(x=10.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=10.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Add sum annotation (Placement(transformation(x=-14.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-14.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Feedback pSum annotation (Placement(transformation(x=-80.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Gain Kv(k={0.3}) annotation (Placement(transformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.TransferFunction tacho2(a={1/(2014*2014),(2*0.294)/2014,1}) annotation (Placement(transformation(x=53.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true),iconTransformation(x=53.,y=-50.,scale=0.1,aspectRatio=1.,flipHorizontal=true)));
         
      equation
         connect(rate2.outPort, rate3.inPort) annotation (Line(points={{51.,0.},{58.,0.}},color={0,0,255}));
         connect(wSum.outPort, rate2.inPort) annotation (Line(points={{19.,0.},{28.,0.}},color={0,0,255}));
         connect(sum.outPort, wSum.inPort1) annotation (Line(points={{-3.,0.},{2.,0.}},color={0,0,255}));
         connect(Kd.outPort, sum.inPort1) annotation (Line(points={{-49.,70.},{-34.,70.},{-34.,6.},{-26.,6.}},color={0,0,255}));
         connect(rate3.outPort, i_ref) annotation (Line(points={{81.,0.},{110.,0.}},color={0,0,255}));
         connect(rate1.outPort, wSum.inPort2) annotation (Line(points={{15.,-50.},{10.,-50.},{10.,-8.}},color={0,0,255}));
         connect(Kv.inPort, pSum.outPort) annotation (Line(points={{-68.,0.},{-71.,0.}},color={0,0,255}));
         connect(tacho1.outPort, tacho2.inPort) annotation (Line(points={{69.,-50.},{65.,-50.}},color={0,0,255}));
         connect(tacho2.outPort, rate1.inPort) annotation (Line(points={{42.,-50.},{38.,-50.}},color={0,0,255}));
         connect(Kv.outPort, sum.inPort2) annotation (Line(points={{-45.,0.},{-40.,0.},{-40.,-6.},{-26.,-6.}},color={0,0,255}));
         connect(Kd.inPort, w_ref) annotation (Line(points={{-72.,70.},{-120.,70.}},color={0,0,255}));
         connect(pSum.inPort1, phi_ref) annotation (Line(points={{-88.,0.},{-120.,0.}},color={0,0,255}));
         connect(pSum.inPort2, phi) annotation (Line(points={{-80.,-8.},{-80.,-120.}},color={0,0,255}));
         connect(tacho1.inPort, w) annotation (Line(points={{92.,-50.},{100.,-50.},{100.,-80.},{70.,-80.},{70.,-120.}},color={0,0,255}));
      end Control;
      model AxisType1 "Axis model of the r3 joints 1,2,3 "
         parameter SI.Angle phi_ref0=0 "initial value of reference and joint angle";
         parameter SI.AngularVelocity w_ref0=0 "initial value of reference and joint speed";
         parameter Real k=1.1616 "gain of motor";
         parameter Real w=4590 "time constant of motor";
         parameter Real D=0.6 "damping constant of motor";
         parameter Real J=0.0013 "moment of inertia of motor in [kgm^2]";
         parameter Real i=-105 "gear ratio";
         parameter Real c=43 "spring constant";
         parameter Real cd=0.005 "damper constant";
         parameter Real Rv0=0.4 "viscous friction torque at zero velocity in [Nm]";
         parameter Real Rv1=0.13/160 "viscous friction coefficient in [Nms/rad]";
         parameter Real peak=1 "peak*Rv0 = maximum static friction torque (peak >= 1)";
         SI.AngularAcceleration a_ref;
         SI.AngularVelocity w_ref;
         SI.Angle phi_ref;
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 The axis model consists of the <b>controller</b>, the <b>motor</b> including current
 controller and the <b>gearbox</b> including gear elasticity and bearing friction.
 The only difference to the axis model of joints 4,5,6 (= model axisType2) is
 that elasticity and damping in the gear boxes are not neglected.
 The component <b>States</b> is a dummy inertia, i.e., the inertia is zero,
 to define that the absolute angle and the absolute angular velocity of the
 driven gear flange are used as <b>states</b>.
 </p>
 
 <p>
 The input signal of this component is the desired angular acceleration
 of the joint (= reference acceleration). From the acceleration, the
 reference position and reference velocity are computed via integration.
 The reference input is an acceleration, because the reference signals
 have to be \"smooth\" (position has to be differentiable at least 2 times).
 Otherwise, the gear elasticity leads to significant oscillations which
 are not acceptable.
 </p>
 
 <p>
 Default values of the parameters are given for the axis of joint 1.
 </p>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,40.},{91.,-41.}},lineColor={0,0,0},fillColor={160,160,160},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{0.,110.},{0.,50.}},textString="%name",fillColor={0,0,255}),Text(extent={{-81.,32.},{80.,-32.}},textString="1",fillColor={0,0,255})}));
         Modelica.Blocks.Interfaces.InPort inPort_a_ref annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
         GearType1 r3Gear1(J=J,i=i,c=c,d=cd,Rv0=Rv0,Rv1=Rv1,peak=peak) annotation (Placement(transformation(x=50.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=50.,y=0.,scale=0.1,aspectRatio=1.)));
         Motor r3Motor(k=k,wm=w,D=D) annotation (Placement(transformation(x=25.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=25.,y=0.,scale=0.1,aspectRatio=1.)));
         Control r3Control annotation (Placement(transformation(x=-3.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-3.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.Integrator integrator1(final y0={w_ref0}) annotation (Placement(transformation(x=-84.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-84.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.Integrator integrator2(final y0={phi_ref0}) annotation (Placement(transformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Gain k2(k={i}) annotation (Placement(transformation(x=-44.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-44.,y=30.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Gain k1(k={i}) annotation (Placement(transformation(x=-29.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-29.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Inertia states(J=0,phi(start=phi_ref0,fixed=true),w(start=w_ref0,fixed=true)) annotation (Placement(transformation(x=75.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=75.,y=0.,scale=0.1,aspectRatio=1.)));
         
      equation
         connect(k1.outPort, r3Control.phi_ref) annotation (Line(points={{-18.,0.},{-15.,0.}},color={0,0,255}));
         connect(r3Motor.outPort_w, r3Control.w) annotation (Line(points={{30.,-9.9},{30.,-20.},{4.,-20.},{4.,-12.}},color={0,0,255}));
         connect(r3Motor.outPort_phi, r3Control.phi) annotation (Line(points={{33.,-10.},{33.,-30.},{-11.,-30.},{-11.,-12.}},color={0,0,255}));
         connect(integrator1.outPort, integrator2.inPort) annotation (Line(points={{-73.,0.},{-68.,0.}},color={0,0,255}));
         connect(r3Control.i_ref, r3Motor.i_ref) annotation (Line(points={{8.,0.},{13.05,0.}},color={0,0,255}));
         connect(integrator2.outPort, k1.inPort) annotation (Line(points={{-45.,0.},{-41.,0.}},color={0,0,255}));
         connect(integrator1.outPort, k2.inPort) annotation (Line(points={{-73.,0.},{-71.,0.},{-71.,30.},{-56.,30.}},color={0,0,255}));
         connect(r3Motor.flange_motor, r3Gear1.flange_a) annotation (Line(points={{35.,0.},{40.,0.}},color={128,128,128},thickness=0.5));
         connect(integrator1.inPort, inPort_a_ref) annotation (Line(points={{-96.,0.},{-120.,0.}},color={0,0,255}));
         connect(k2.outPort, r3Control.w_ref) annotation (Line(points={{-33.,30.},{-24.,30.},{-24.,7.},{-15.,7.}},color={0,0,255}));
         connect(r3Gear1.flange_b, states.flange_a) annotation (Line(points={{60.,0.},{65.,0.}},color={128,128,128},thickness=0.5));
         connect(states.flange_b, flange) annotation (Line(points={{85.,0.},{100.,0.}},color={128,128,128},thickness=0.5));
         a_ref = inPort_a_ref.signal[1];
         w_ref = integrator1.outPort.signal[1];
         phi_ref = integrator2.outPort.signal[1];
      end AxisType1;
      model AxisType2 "Axis model of the r3 joints 4,5,6 "
         parameter SI.Angle phi_ref0=0 "initial value of reference and of joint angle";
         parameter SI.AngularVelocity w_ref0=0 "initial value of reference and joint speed";
         parameter Real k=0.2365 "gain of motor";
         parameter Real w=6250 "time constant of motor";
         parameter Real D=0.55 "damping constant of motor";
         parameter Real J=0.00016 "moment of inertia of motor in [kgm^2]";
         parameter Real i=-99 "gear ratio";
         parameter Real Rv0=21.8 "viscous friction torque at zero velocity in [Nm]";
         parameter Real Rv1=9.8 "viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
         parameter Real peak=26.7/21.8 "peak*Rv0 = maximum static friction torque (peak >= 1)";
         SI.AngularAcceleration a_ref;
         SI.AngularVelocity w_ref;
         SI.Angle phi_ref;
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 The axis model consists of the <b>controller</b>, the <b>motor</b> including current
 controller and the <b>gearbox</b> including gear elasticity and bearing friction.
 The only difference to the axis model of joints 1,2,3 (= model axisType1) is
 elasticity and damping in the gear boxes are neglected.
 The component <b>States</b> is a dummy inertia, i.e., the inertia is zero,
 to define that the absolute angle and the absolute angular velocity of the
 driven gear flange are used as <b>states</b>.
 </p>
 
 <p>
 The input signal of this component is the desired angular acceleration
 of the joint (= reference acceleration). From the acceleration, the
 reference position and reference velocity are computed via integration.
 The reference input is an acceleration, because the reference signals
 have to be \"smooth\" (position has to be differentiable at least 2 times).
 Otherwise, the gear elasticity leads to significant oscillations which
 are not acceptable.
 </p>
 
 <p>
 Default values of the parameters are given for the axis of joint 1.
 </p>
 </HTML>
 
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,40.},{91.,-41.}},lineColor={0,0,0},fillColor={160,160,160},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{0.,111.},{0.,50.}},textString="%name",fillColor={0,0,255}),Text(extent={{-81.,32.},{80.,-32.}},textString="2",fillColor={0,0,255})}));
         Modelica.Blocks.Interfaces.InPort inPort_a_ref annotation (Placement(transformation(x=-119.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-119.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
         GearType2 r3Gear2(J=J,i=i,Rv0=Rv0,Rv1=Rv1,peak=peak) annotation (Placement(transformation(x=51.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=51.,y=0.,scale=0.1,aspectRatio=1.)));
         Motor r3Motor(k=k,wm=w,D=D) annotation (Placement(transformation(x=25.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=25.,y=0.,scale=0.1,aspectRatio=1.)));
         Control r3Control annotation (Placement(transformation(x=-2.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-2.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.Integrator integrator1(final y0={w_ref0}) annotation (Placement(transformation(x=-84.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-84.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Continuous.Integrator integrator2(final y0={phi_ref0}) annotation (Placement(transformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-56.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Gain k2(k={i}) annotation (Placement(transformation(x=-40.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-40.,y=30.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Math.Gain k1(k={i}) annotation (Placement(transformation(x=-29.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-29.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Inertia states(J=0,phi(start=phi_ref0,fixed=true),w(start=w_ref0,fixed=true)) annotation (Placement(transformation(x=75.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=75.,y=0.,scale=0.1,aspectRatio=1.)));
         
      equation
         connect(integrator1.outPort, integrator2.inPort) annotation (Line(points={{-73.,0.},{-68.,0.}},color={0,0,255}));
         connect(r3Control.i_ref, r3Motor.i_ref) annotation (Line(points={{9.,0.},{13.05,0.}},color={0,0,255}));
         connect(r3Motor.flange_motor, r3Gear2.flange_a) annotation (Line(points={{35.,0.},{41.,0.}},color={128,128,128},thickness=0.5));
         connect(k1.outPort, r3Control.phi_ref) annotation (Line(points={{-18.,0.},{-14.,0.}},color={0,0,255}));
         connect(integrator2.outPort, k1.inPort) annotation (Line(points={{-45.,0.},{-41.,0.}},color={0,0,255}));
         connect(integrator1.outPort, k2.inPort) annotation (Line(points={{-73.,0.},{-72.,0.},{-72.,30.},{-52.,30.}},color={0,0,255}));
         connect(r3Motor.outPort_w, r3Control.w) annotation (Line(points={{30.,-9.9},{30.,-20.},{5.,-20.},{5.,-12.}},color={0,0,255}));
         connect(r3Motor.outPort_phi, r3Control.phi) annotation (Line(points={{33.,-10.},{33.,-30.},{-10.,-30.},{-10.,-12.}},color={0,0,255}));
         connect(k2.outPort, r3Control.w_ref) annotation (Line(points={{-29.,30.},{-22.,30.},{-22.,7.},{-14.,7.}},color={0,0,255}));
         connect(integrator1.inPort, inPort_a_ref) annotation (Line(points={{-96.,0.},{-119.,0.}},color={0,0,255}));
         connect(r3Gear2.flange_b, states.flange_a) annotation (Line(points={{61.,0.},{65.,0.}},color={128,128,128},thickness=0.5));
         connect(states.flange_b, flange) annotation (Line(points={{85.,0.},{100.,0.}},color={128,128,128},thickness=0.5));
         a_ref = inPort_a_ref.signal[1];
         w_ref = integrator1.outPort.signal[1];
         phi_ref = integrator2.outPort.signal[1];
      end AxisType2;
      model MechanicalStructure "Model of the mechanical part of the r3 robot "
         parameter SI.Length loadSize[3]={0.125,0.05,0.05} "size of (steel) load box";
         SI.Angle q[6] "joint angles";
         SI.AngularVelocity qd[6] "joint speeds";
         SI.AngularAcceleration qdd[6] "joint accelerations";
         SI.Torque tau[6] "joint driving torques";
         annotation (Diagram(coordinateSystem(extent={{-200.,-200.},{200.,200.}})),Documentation(info="<HTML>
 <p>
 This model contains the mechanical components of the r3 robot
 (multibody system) including animation information.
 </p>
 </HTML>
 "),Icon(coordinateSystem(extent={{-200.,-200.},{200.,200.}}),graphics={Rectangle(extent={{-200.,200.},{200.,-200.}},fillColor={192,192,192},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-200.,280.},{200.,200.}},textString="%name",fillColor={0,0,255}),Text(extent={{-200.,-150.},{-140.,-190.}},textString="1",fillColor={0,0,255}),Text(extent={{-200.,-30.},{-140.,-70.}},textString="3",fillColor={0,0,255}),Text(extent={{-200.,-90.},{-140.,-130.}},textString="2",fillColor={0,0,255}),Text(extent={{-200.,90.},{-140.,50.}},textString="5",fillColor={0,0,255}),Text(extent={{-200.,28.},{-140.,-12.}},textString="4",fillColor={0,0,255}),Text(extent={{-198.,150.},{-138.,110.}},textString="6",fillColor={0,0,255}),Rectangle(extent={{-24.,-138.},{-4.,-118.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-4.,-118.},{8.,-18.}},lineColor={0,0,0},fillColor={255,255,0},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-24.,-130.},{-4.,-124.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-24.,-118.},{-4.,-98.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-18.,-118.},{-12.,-98.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-24.,-38.},{-4.,-18.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-18.,-38.},{-12.,-18.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-24.,-18.},{-4.,2.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-24.,-10.},{-4.,-4.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-20.,2.},{-8.,82.}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={255,255,0},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-24.,82.},{-4.,102.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-18.,82.},{-12.,102.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-24.,102.},{-4.,122.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-24.,110.},{-4.,116.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid)}));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1 annotation (Placement(transformation(x=-210.,y=-170.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=-170.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2 annotation (Placement(transformation(x=-210.,y=-110.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=-110.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis3 annotation (Placement(transformation(x=-210.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=-50.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis4 annotation (Placement(transformation(x=-210.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=10.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis5 annotation (Placement(transformation(x=-210.,y=70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=70.,scale=0.1,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_a axis6 annotation (Placement(transformation(x=-210.,y=130.,scale=0.1,aspectRatio=1.),iconTransformation(x=-210.,y=130.,scale=0.1,aspectRatio=1.)));
         Parts.InertialSystem inertial annotation (Placement(transformation(x=-90.,y=-190.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=-190.,scale=0.1,aspectRatio=1.)));
         Joints.Revolute r1(n={0,1,0}) annotation (Placement(transformation(x=-70.,y=-160.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-70.,y=-160.,scale=0.1,aspectRatio=1.,rotation=90)));
         Joints.Revolute r2(n={1,0,0}) annotation (Placement(transformation(x=-50.,y=-100.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=-100.,scale=0.1,aspectRatio=1.)));
         Joints.Revolute r3(n={1,0,0}) annotation (Placement(transformation(x=-50.,y=-30.,scale=0.1,aspectRatio=1.,rotation=180),iconTransformation(x=-50.,y=-30.,scale=0.1,aspectRatio=1.,rotation=180)));
         Joints.Revolute r4(n={0,1,0}) annotation (Placement(transformation(x=-70.,y=10.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-70.,y=10.,scale=0.1,aspectRatio=1.,rotation=90)));
         Joints.Revolute r5(n={1,0,0}) annotation (Placement(transformation(x=-50.,y=80.,scale=0.1,aspectRatio=1.),iconTransformation(x=-50.,y=80.,scale=0.1,aspectRatio=1.)));
         Joints.Revolute r6(n={0,1,0}) annotation (Placement(transformation(x=-60.,y=130.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-60.,y=130.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.Shape b0(Shape="cylinder",r0={0,-0.4,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=0.225,Width=0.3,Height=0.3,Material={0,0,1,1}) annotation (Placement(transformation(x=-40.,y=-170.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-40.,y=-170.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.ShapeBody b1(r={0,0,0},I22=1.16,Shape="box",r0={0,-0.175,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=0.25,Width=0.15,Height=0.2,Material={1,0,0,0.5}) annotation (Placement(transformation(x=-70.,y=-130.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-70.,y=-130.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.ShapeBody b2(r={0,0.5,0},rCM={0.172,0.205,0},m=56.5,I11=2.58,I22=0.64,I33=2.73,I21=-0.46,Shape="beam",r0={0.15,0,0},LengthDirection={0,1,0},WidthDirection={0,0,1},Length=0.5,Width=0.2,Height=0.15,Material={1,0.7,0,1}) annotation (Placement(transformation(x=-20.,y=-70.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-20.,y=-70.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.ShapeBody b3(r={0,0,0},rCM={0.064,-0.034,0},m=26.4,I11=0.279,I22=0.245,I33=0.413,I21=-0.07,Shape="box",r0={0,-0.075,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=0.15,Width=0.15,Height=0.15,Material={1,0,0,0.5}) annotation (Placement(transformation(x=-90.,y=-10.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-90.,y=-10.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.ShapeBody b4(r={0,0.73,0},rCM={0,0.32,0},m=28.7,I11=1.67,I22=0.081,I33=1.67,Shape="cylinder",r0={0,0.075,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=0.73,Width=0.1,Height=0.1,Material={1,0.7,0,1}) annotation (Placement(transformation(x=-70.,y=50.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-70.,y=50.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.ShapeBody b5(r={0,0,0},rCM={0,0.023,0},m=5.2,I11=1.25,I22=0.81,I33=1.53,Shape="box",r0={0,-0.075,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=0.225,Width=0.075,Height=0.1,Material={0,0,1,0.5}) annotation (Placement(transformation(x=-20.,y=90.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-20.,y=90.,scale=0.1,aspectRatio=1.,rotation=90)));
         Parts.BoxBody load(r={0,0,0},r0={0,0.15,0},LengthDirection={0,1,0},WidthDirection={1,0,0},Length=loadSize[1],Width=loadSize[2],Height=loadSize[3],Material={1,0,0,0.5}) annotation (Placement(transformation(x=-60.,y=170.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-60.,y=170.,scale=0.1,aspectRatio=1.,rotation=90)));
         
      equation
         connect(inertial.frame_b, b0.frame_a) annotation (Line(points={{-79.5,-190.},{-40.,-190.},{-40.,-180.5}},color={0,0,0},thickness=0.5));
         connect(r1.frame_a, inertial.frame_b) annotation (Line(points={{-70.,-170.5},{-70.,-190.},{-79.5,-190.}},color={0,0,0},thickness=0.5));
         connect(r1.frame_b, b1.frame_a) annotation (Line(points={{-70.,-149.5},{-70.,-140.5}},color={0,0,0},thickness=0.5));
         connect(b1.frame_b, r2.frame_a) annotation (Line(points={{-70.,-119.5},{-70.,-100.},{-60.5,-100.}},color={0,0,0},thickness=0.5));
         connect(r2.frame_b, b2.frame_a) annotation (Line(points={{-39.5,-100.},{-20.,-100.},{-20.,-80.5}},color={0,0,0},thickness=0.5));
         connect(b2.frame_b, r3.frame_a) annotation (Line(points={{-20.,-59.5},{-20.,-30.},{-39.5,-30.}},color={0,0,0},thickness=0.5));
         connect(r3.frame_b, b3.frame_a) annotation (Line(points={{-60.5,-30.},{-90.,-30.},{-90.,-20.5}},color={0,0,0},thickness=0.5));
         connect(r4.frame_b, b4.frame_a) annotation (Line(points={{-70.,20.5},{-70.,39.5}},color={0,0,0},thickness=0.5));
         connect(r3.frame_b, r4.frame_a) annotation (Line(points={{-60.5,-30.},{-70.,-30.},{-70.,-0.5}},color={0,0,0},thickness=0.5));
         connect(b4.frame_b, r5.frame_a) annotation (Line(points={{-70.,60.5},{-70.,80.},{-60.5,80.}},color={0,0,0},thickness=0.5));
         connect(r5.frame_b, b5.frame_a) annotation (Line(points={{-39.5,80.},{-22.,80.},{-20.,79.5}},color={0,0,0},thickness=0.5));
         connect(r6.frame_b, load.frame_a) annotation (Line(points={{-60.,140.5},{-60.,159.5}},color={0,0,0},thickness=0.5));
         connect(r5.frame_b, r6.frame_a) annotation (Line(points={{-39.5,80.},{-40.,90.},{-40.,100.},{-60.,100.},{-60.,119.5}},color={0,0,0},thickness=0.5));
         connect(r1.axis, axis1) annotation (Line(points={{-77.,-160.},{-152.,-160.},{-152.,-170.},{-210.,-170.}},color={128,128,128},thickness=0.5));
         connect(r2.axis, axis2) annotation (Line(points={{-50.,-93.},{-50.,-80.},{-152.,-80.},{-152.,-110.},{-210.,-110.}},color={128,128,128},thickness=0.5));
         connect(r4.axis, axis4) annotation (Line(points={{-77.,10.},{-152.,10.},{-152.,10.},{-210.,10.}},color={128,128,128},thickness=0.5));
         connect(r5.axis, axis5) annotation (Line(points={{-50.,87.},{-50.,94.},{-152.,94.},{-152.,70.},{-210.,70.}},color={128,128,128},thickness=0.5));
         connect(r6.axis, axis6) annotation (Line(points={{-67.,130.},{-210.,130.}},color={128,128,128},thickness=0.5));
         connect(r3.axis, axis3) annotation (Line(points={{-50.,-37.},{-50.,-50.},{-210.,-50.}},color={128,128,128},thickness=0.5));
         q = {r1.q,r2.q,r3.q,r4.q,r5.q,r6.q};
         qd = der(q);
         qdd = der(qd);
         tau = {r1.axis.tau,r2.axis.tau,r3.axis.tau,r4.axis.tau,r5.axis.tau,r6.axis.tau};
      end MechanicalStructure;
      model TwoPuls
         extends Modelica.Blocks.Interfaces.SO;
         parameter Real T1=1;
         parameter Real T2=1;
         parameter Real Height=1;
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-80.,0.},{-80.,60.},{-40.,60.},{-40.,0.},{0.,0.},{0.,-60.},{40.,-60.},{40.,0.},{80.,0.}},color={0,0,255})}));
         
      equation
         y = if time < T1 then
            Height
         else
            if time < T1+T2 then
               0.
            else
               if time < (T1+T2)+T1 then
                  -Height
               else
                  0;
      end TwoPuls;
      annotation (Icon(coordinateSystem(extent={{0.,0.},{584.,489.}})),Diagram(coordinateSystem(extent={{0.,0.},{584.,489.}})));
      model FullRobot "Complete model of Manutec r3 robot "
         parameter SI.Angle q0[6] "initial joint angles";
         output SI.Angle q_ref[6] "reference values of joint angles";
         output SI.AngularVelocity qd_ref[6] "reference values of joint speeds";
         output SI.AngularAcceleration qdd_ref[6] "reference values of joint accelerations";
         output SI.Angle eq[6] "control errors of joint angles";
         output SI.AngularVelocity eqd[6] "control errors of joint speeds";
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="<HTML>
 <p>
 Complete model of Mantuec r3 robot, including
 controller, motor, gearbox, 3D-mechanics model.
 The input connectors <b>a_refX</b> are the <b>reference accelerations</b>, i.e., the desired
 accelerations, for the 6 joint axes. Via parameter <b>q0</b> the initial
 joint angles are defined.
 </p>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,90.},{100.,-100.}},fillColor={192,192,192},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{0.,154.},{0.,94.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-20.,56.},{0.,73.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-20.,62.},{0.,68.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-20.,41.},{0.,56.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-14.,42.},{-7.,56.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-16.,10.},{-5.,42.}},pattern=LinePattern.None,lineColor={0,0,0},fillColor={255,255,0},fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{0.,-69.},{12.,-7.}},lineColor={0,0,0},fillColor={255,255,0},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-20.,-7.},{0.,10.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-20.,-1.},{0.,5.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-14.,-21.},{-7.,-7.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-20.,-22.},{0.,-7.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-14.,-22.},{-7.,-8.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-20.,-69.},{0.,-54.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-14.,-69.},{-7.,-55.}},pattern=LinePattern.None,fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-20.,-85.},{0.,-68.}},lineColor={0,0,0},fillColor={192,192,192},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Rectangle(extent={{-20.,-79.},{0.,-73.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid)}));
         MechanicalStructure mechanics annotation (Placement(transformation(x=30.,y=-20.,scale=0.35,aspectRatio=1.),iconTransformation(x=30.,y=-20.,scale=0.35,aspectRatio=1.)));
         AxisType1 axis1(phi_ref0=q0[1]) annotation (Placement(transformation(x=-80.,y=-80.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=-80.,scale=0.1,aspectRatio=1.)));
         AxisType1 axis2(w=5500,i=210,c=8,cd=0.01,Rv0=0.5,Rv1=0.1/130,phi_ref0=q0[2]) annotation (Placement(transformation(x=-80.,y=-50.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=-50.,scale=0.1,aspectRatio=1.)));
         AxisType1 axis3(w=5500,i=60,c=58,cd=0.04,Rv0=0.7,Rv1=0.2/130,phi_ref0=q0[3]) annotation (Placement(transformation(x=-80.,y=-20.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=-20.,scale=0.1,aspectRatio=1.)));
         AxisType2 axis4(phi_ref0=q0[4]) annotation (Placement(transformation(x=-80.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=10.,scale=0.1,aspectRatio=1.)));
         AxisType2 axis5(k=0.2608,J=0.00018,i=79.2,Rv0=30.1,Rv1=0.03,peak=39.6/30.1,phi_ref0=q0[5]) annotation (Placement(transformation(x=-80.,y=40.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=40.,scale=0.1,aspectRatio=1.)));
         AxisType2 axis6(k=0.0842,w=7400,D=0.27,J=0.000043,i=-99,Rv0=10.9,Rv1=3.92,peak=16.8/10.9,phi_ref0=q0[6]) annotation (Placement(transformation(x=-80.,y=70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-80.,y=70.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref1 annotation (Placement(transformation(x=-105.,y=-80.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=-80.,scale=0.05,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref2 annotation (Placement(transformation(x=-105.,y=-50.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=-50.,scale=0.05,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref3 annotation (Placement(transformation(x=-105.,y=-20.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=-20.,scale=0.05,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref4 annotation (Placement(transformation(x=-105.,y=10.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=10.,scale=0.05,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref5 annotation (Placement(transformation(x=-105.,y=40.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=40.,scale=0.05,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.InPort a_ref6 annotation (Placement(transformation(x=-105.,y=70.,scale=0.05,aspectRatio=1.),iconTransformation(x=-105.,y=70.,scale=0.05,aspectRatio=1.)));
         
      equation
         connect(axis1.flange, mechanics.axis1) annotation (Line(points={{-70.,-80.},{-56.75,-80.},{-56.75,-79.5},{-43.5,-79.5}},color={0,0,0},thickness=0.5));
         connect(axis2.flange, mechanics.axis2) annotation (Line(points={{-70.,-50.},{-60.,-50.},{-60.,-58.5},{-43.5,-58.5}},color={0,0,0},thickness=0.5));
         connect(axis3.flange, mechanics.axis3) annotation (Line(points={{-70.,-20.},{-60.,-20.},{-60.,-37.5},{-43.5,-37.5}},color={0,0,0},thickness=0.5));
         connect(axis4.flange, mechanics.axis4) annotation (Line(points={{-70.,10.},{-60.,10.},{-60.,-16.5},{-43.5,-16.5}},color={0,0,0},thickness=0.5));
         connect(axis5.flange, mechanics.axis5) annotation (Line(points={{-70.,40.},{-57.,40.},{-57.,4.5},{-43.5,4.5}},color={0,0,0},thickness=0.5));
         connect(axis6.flange, mechanics.axis6) annotation (Line(points={{-70.,70.},{-53.,70.},{-53.,25.5},{-43.5,25.5}},color={0,0,0},thickness=0.5));
         connect(axis1.inPort_a_ref, a_ref1) annotation (Line(points={{-92.,-80.},{-105.,-80.}},color={0,0,255}));
         connect(axis6.inPort_a_ref, a_ref6) annotation (Line(points={{-91.9,70.},{-105.,70.}},color={0,0,255}));
         connect(axis5.inPort_a_ref, a_ref5) annotation (Line(points={{-91.9,40.},{-105.,40.}},color={0,0,255}));
         connect(axis4.inPort_a_ref, a_ref4) annotation (Line(points={{-91.9,10.},{-105.,10.}},color={0,0,255}));
         connect(axis3.inPort_a_ref, a_ref3) annotation (Line(points={{-92.,-20.},{-105.,-20.}},color={0,0,255}));
         connect(axis2.inPort_a_ref, a_ref2) annotation (Line(points={{-92.,-50.},{-105.,-50.}},color={0,0,255}));
         q_ref = {axis1.phi_ref,axis2.phi_ref,axis3.phi_ref,axis4.phi_ref,axis5.phi_ref,axis6.phi_ref};
         qd_ref = {axis1.w_ref,axis2.w_ref,axis3.w_ref,axis4.w_ref,axis5.w_ref,axis6.w_ref};
         qdd_ref = {a_ref1.signal[1],a_ref2.signal[1],a_ref3.signal[1],a_ref4.signal[1],a_ref5.signal[1],a_ref6.signal[1]};
         eq = q_ref-mechanics.q;
         eqd = qd_ref-mechanics.qd;
      end FullRobot;
      model SimpleControl "Simple PD-controller to control one axis"
         parameter Real k=0 "gain of P-controller";
         parameter Real d=0 "gain of D-controller (= velocity dependent damping in the joint)";
         output SI.Angle q_ref "reference angle";
         output SI.Angle q "actual joint angle";
         output SI.AngularVelocity qd "actual joint speed";
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-60.},{100.,60.}},lineColor={0,0,0},pattern=LinePattern.None,fillColor={159,159,223},fillPattern=FillPattern.HorizontalCylinder),Text(extent={{0.,131.},{0.,70.}},textString="%name",fillColor={0,0,255})}));
         Modelica.Blocks.Interfaces.InPort inPort_q_ref annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         
      equation
         q_ref = inPort_q_ref.signal[1];
         q = flange.phi;
         qd = der(q);
         flange.tau = k*(q-q_ref)+d*qd;
      end SimpleControl;
   end Components;
end r3;