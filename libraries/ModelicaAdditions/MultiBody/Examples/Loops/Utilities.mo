package Utilities
   extends Modelica.Icons.Library;
   model GasForce
      extends Modelica.Mechanics.Translational.Interfaces.Compliant;
      parameter SI.Length L "Length of cylinder";
      parameter SI.Length d "diameter of cylinder";
      parameter Real k0=0.01;
      parameter Real k1=1;
      parameter Real k=1;
      constant Real pi=Modelica.Constants.pi;
      constant Real PI=Modelica.Constants.pi;
      SI.Position x;
      SI.Density dens;
      SI.Pressure press "cylinder pressure";
      SI.Volume V;
      SI.Temperature T;
      SI.Velocity v_rel;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,50.},{90.,-50.}},lineColor={0,0,0},fillColor={192,192,192},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,50.},{-20.,-50.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-90.,10.},{-40.,-10.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Polygon(points={{60.,2.},{54.,2.},{0.,2.},{0.,10.},{-20.,0.},{0.,-10.},{0.,-4.},{60.,-4.},{60.,2.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Text(extent={{-100.,120.},{100.,60.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,50.},{90.,-50.}},lineColor={0,0,0},fillColor={192,192,192},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,50.},{-20.,-50.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Rectangle(extent={{-90.,10.},{-40.,-10.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Polygon(points={{60.,2.},{54.,2.},{0.,2.},{0.,10.},{-20.,0.},{0.,-10.},{0.,-4.},{60.,-4.},{60.,2.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Text(extent={{-100.,120.},{100.,60.}},textString="%name",fillColor={0,0,255})}));
      
   equation
      x = 1-s_rel/L;
      v_rel = der(s_rel);
      press = if v_rel < 0 then
         if x < 0.987 then
            (177.4132*x^(4)-287.2189*x^(3)+151.8252*x^(2))-24.9973*x+2.4
         else
            (2836360*x^(4)-10569296*x^(3)+14761814*x^(2))-9158505*x+2129670
      else
         if x > 0.93 then
            ((-3929704*x^(4)+14748765*x^(3))-20747000*x^(2)+12964477*x)-3036495
         else
            ((145.93*x^(4)-131.707*x^(3)+17.3438*x^(2))+17.9272*x)+2.4;
      f = -(((100000.*press)*pi)*d^(2))/4;
      V = k0+k1*(1-x);
      dens = 1/V;
      press*V = k*T;
   end GasForce;
   partial model Engine
      extends Modelica.Icons.Example;
      parameter Real D=0.1;
      parameter Real e=0.05;
      parameter Real L=0.2;
      parameter Real Load=20;
      constant Real pi=Modelica.Constants.pi;
      constant Real PI=Modelica.Constants.pi;
      output Real AngVelDegS;
      output Real x;
      output Real press;
      output Real T;
      output Real V;
      output Real dens;
      annotation (Documentation(info="Use the following settings:
 
 experiment StopTime=0.2 Interval=0.002 Tolerance=1.E-8
 
 
 Perform 'simulate' and then see animation in
 Animation window.
 
   Plot the following variables:
 
   AngVelDegS: Angular velocity of motor shaft [rev/min]
   x         : position of cylinder [m]
   press     : pressure in cylinder [bar]
 "));
      Parts.InertialSystem inertial(g=0) annotation (Placement(transformation(x=-70.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=-70.,y=-70.,scale=0.1,aspectRatio=1.)));
      Joints.Revolute r1(startValueFixed=true,qd(start=-157)) annotation (Placement(transformation(x=-40.,y=-30.,scale=0.1,aspectRatio=1.,rotation=90),iconTransformation(x=-40.,y=-30.,scale=0.1,aspectRatio=1.,rotation=90)));
      Joints.Prismatic cyl(n={-1,0,0}) annotation (Placement(transformation(x=50.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=50.,y=-70.,scale=0.1,aspectRatio=1.)));
      Parts.FrameTranslation trans(r={sqrt((D/2+L)^(2)-e^(2)),-e,0}) annotation (Placement(transformation(x=0.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=0.,y=-70.,scale=0.1,aspectRatio=1.)));
      Parts.ShapeBody piston(r={0.1,0,0},m=0.3,I33=0.0001,Shape="cylinder",Width=0.05,Height=0.05) annotation (Placement(transformation(x=90.,y=-70.,scale=0.1,aspectRatio=1.),iconTransformation(x=90.,y=-70.,scale=0.1,aspectRatio=1.)));
      Parts.ShapeBody crank(r={D/2,0,0},Width=0.01,Height=0.01,Material={0,0,1,0.5}) annotation (Placement(transformation(x=-28.,y=10.,scale=0.1,aspectRatio=1.),iconTransformation(x=-28.,y=10.,scale=0.1,aspectRatio=1.)));
      GasForce gasForce(L=sqrt((L+D/2)^(2)-e^(2))-sqrt((L-D/2)^(2)-e^(2)),d=0.05) annotation (Placement(transformation(x=50.,y=-50.,scale=0.06,aspectRatio=1.),iconTransformation(x=50.,y=-50.,scale=0.06,aspectRatio=1.)));
      Modelica.Mechanics.Rotational.Inertia flyWheel(J=0.0025) annotation (Placement(transformation(x=-64.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-64.,y=-30.,scale=0.1,aspectRatio=1.)));
      Modelica.Mechanics.Rotational.BearingFriction torque(tau_pos=[0,Load]) annotation (Placement(transformation(x=-90.,y=-30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=-30.,scale=0.1,aspectRatio=1.)));
      
   equation
      connect(inertial.frame_b, r1.frame_a) annotation (Line(points={{-59.5,-70.},{-40.,-70.},{-40.,-40.5}},color={0,0,255}));
      connect(inertial.frame_b, trans.frame_a) annotation (Line(points={{-59.5,-70.},{-10.5,-70.}},color={0,0,255}));
      connect(trans.frame_b, cyl.frame_a) annotation (Line(points={{10.5,-70.},{39.5,-70.}},color={0,0,255}));
      connect(cyl.frame_b, piston.frame_a) annotation (Line(points={{60.5,-70.},{79.5,-70.}},color={0,0,255}));
      connect(cyl.bearing, gasForce.flange_a) annotation (Line(points={{47.,-64.},{47.,-60.},{40.,-60.},{40.,-50.},{44.,-50.}},color={0,0,255}));
      connect(cyl.axis, gasForce.flange_b) annotation (Line(points={{57.,-64.},{57.,-60.},{60.,-60.},{60.,-50.},{56.,-50.}},color={0,0,255}));
      connect(flyWheel.flange_b, r1.axis) annotation (Line(points={{-54.,-30.},{-47.,-30.}},color={0,0,255}));
      connect(torque.flange_b, flyWheel.flange_a) annotation (Line(points={{-80.,-30.},{-74.,-30.}},color={0,0,255}));
      connect(r1.frame_b, crank.frame_a) annotation (Line(points={{-40.,-19.5},{-40.,10.},{-38.5,10.}},color={0,0,255}));
      AngVelDegS = -(r1.qd*60)/(2*pi);
      x = gasForce.s_rel;
      press = gasForce.press;
      T = gasForce.T;
      V = gasForce.V;
      dens = gasForce.dens;
   end Engine;
end Utilities;