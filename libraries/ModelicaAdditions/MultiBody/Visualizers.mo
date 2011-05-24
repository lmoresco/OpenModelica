package Visualizers "For animation of across vector quantities."
   extends Modelica.Icons.Library;
   annotation (Documentation(info="Special classes that store
 vector, acceleration, angular velocity,
 and angular acceleration at a cut.
 
 By connecting these to a cut they animate the
 relevant quantities in the cut.
 
 The class also contain sensors for forces, torques,
 and a sensor that measure both forces and torques.
 
 Note that these sensors measure the forces and torques
 transmitted through the sensor. This is necessary
 since forces and torques are flow quantities.
 
 "));
   model Velocity
      extends Interfaces.OneFrame_a;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{6.,74.},{18.,89.},{21.,68.},{16.,70.},{2.,23.},{-2.,24.},{11.,72.},{6.,74.}},lineColor={0,0,255},fillColor={0,0,255},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector velocity(Material={0,0,1,0.5},category="velocity",r=r0a,Size=va,S=Sa) annotation (Placement(transformation(x=-40.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true),iconTransformation(x=-40.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true)));
      
   equation
      fa = zeros(3);
      ta = zeros(3);
   end Velocity;
   model Acceleration
      extends Interfaces.OneFrame_a;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{6.,74.},{18.,89.},{21.,68.},{16.,70.},{2.,23.},{-2.,24.},{11.,72.},{6.,74.}},lineColor={255,255,0},fillColor={255,255,0},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector acceleration(Material={1,1,0,0.5},category="acceleration",r=r0a,Size=aa,S=Sa) annotation (Placement(transformation(x=-40.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true),iconTransformation(x=-40.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true)));
      
   equation
      fa = zeros(3);
      ta = zeros(3);
   end Acceleration;
   model AngularVelocity
      extends Interfaces.OneFrame_a;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-6.,74.},{-18.,89.},{-21.,68.},{-16.,70.},{-2.,23.},{2.,24.},{-11.,72.},{-6.,74.}},lineColor={0,255,255},fillColor={0,255,255},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector angular_velocity(Material={0,1,1,0.5},category="angular velocity",r=r0a,Size=wa,S=Sa) annotation (Placement(transformation(x=-29.5,y=0.5,scale=0.195,aspectRatio=1.,flipVertical=true),iconTransformation(x=-29.5,y=0.5,scale=0.195,aspectRatio=1.,flipVertical=true)));
      
   equation
      fa = zeros(3);
      ta = zeros(3);
   end AngularVelocity;
   model AngularAcceleration
      extends Interfaces.OneFrame_a;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-6.,74.},{-18.,89.},{-21.,68.},{-16.,70.},{-2.,23.},{2.,24.},{-11.,72.},{-6.,74.}},lineColor={255,0,255},fillColor={255,0,255},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector angular_acceleration(Material={1,0,1,0.5},category="angular acceleration",r=r0a,Size=za,S=Sa) annotation (Placement(transformation(x=-20.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true),iconTransformation(x=-20.,y=-10.,scale=0.2,aspectRatio=1.,flipVertical=true)));
      
   equation
      fa = zeros(3);
      ta = zeros(3);
   end AngularAcceleration;
   model ForceTorqueSensor
      extends Interfaces.TwoTreeFrames;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-100.,0.},{104.,0.}},color={0,0,0},thickness=1.),Text(extent={{-40.,-20.},{30.,-40.}},textString="r=0 (fixed)",fillColor={0,0,255})}),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{6.,74.},{18.,89.},{21.,68.},{16.,70.},{2.,23.},{-2.,24.},{11.,72.},{6.,74.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Polygon(points={{-6.,74.},{-18.,89.},{-21.,68.},{-16.,70.},{-2.,23.},{2.,24.},{-11.,72.},{-6.,74.}},lineColor={0,255,0},fillColor={0,255,0},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector force(category="force",r=r0a,Size=fa,S=Sa) annotation (Placement(transformation(x=-60.,y=80.,scale=0.1,aspectRatio=1.,flipVertical=true),iconTransformation(x=-60.,y=80.,scale=0.1,aspectRatio=1.,flipVertical=true)));
      VisualVector torque(Material={0,1,0,0.5},category="torque",r=r0a,Size=ta,S=Sa) annotation (Placement(transformation(x=-60.,y=50.,scale=0.1,aspectRatio=1.,flipVertical=true),iconTransformation(x=-60.,y=50.,scale=0.1,aspectRatio=1.,flipVertical=true)));
      
   equation
      Sb = Sa;
      wb = wa;
      zb = za;
      r0b = r0a;
      vb = va;
      ab = aa;
      fa = fb;
      ta = tb;
   end ForceTorqueSensor;
   model ForceSensor
      extends Interfaces.TwoTreeFrames;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-100.,0.},{104.,0.}},color={0,0,0},thickness=1.),Text(extent={{-40.,-20.},{30.,-40.}},textString="r=0 (fixed)",fillColor={0,0,255})}),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{6.,74.},{18.,89.},{21.,68.},{16.,70.},{2.,23.},{-2.,24.},{11.,72.},{6.,74.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector force(category="force",r=r0a,Size=fa,S=Sa) annotation (Placement(transformation(x=-60.,y=80.,scale=0.1,aspectRatio=1.,flipVertical=true),iconTransformation(x=-60.,y=80.,scale=0.1,aspectRatio=1.,flipVertical=true)));
      
   equation
      Sb = Sa;
      wb = wa;
      zb = za;
      r0b = r0a;
      vb = va;
      ab = aa;
      fa = fb;
      ta = tb;
   end ForceSensor;
   model TorqueSensor
      extends Interfaces.TwoTreeFrames;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-100.,0.},{104.,0.}},color={0,0,0},thickness=1.),Text(extent={{-40.,-20.},{30.,-40.}},textString="r=0 (fixed)",fillColor={0,0,255})}),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-6.,74.},{-18.,89.},{-21.,68.},{-16.,70.},{-2.,23.},{2.,24.},{-11.,72.},{-6.,74.}},lineColor={0,255,0},fillColor={0,255,0},fillPattern=FillPattern.Solid),Text(extent={{-73.,33.},{83.,-22.}},textString="%name",fillColor={0,0,255}),Rectangle(extent={{-100.,100.},{101.,-100.}},fillPattern=FillPattern.None,lineColor={0,0,255})}));
      VisualVector torque(Material={0,1,0,0.5},category="torque",r=r0a,Size=ta,S=Sa) annotation (Placement(transformation(x=-60.,y=50.,scale=0.1,aspectRatio=1.,flipVertical=true),iconTransformation(x=-60.,y=50.,scale=0.1,aspectRatio=1.,flipVertical=true)));
      
   equation
      Sb = Sa;
      wb = wa;
      zb = za;
      r0b = r0a;
      vb = va;
      ab = aa;
      fa = fb;
      ta = tb;
   end TorqueSensor;
end Visualizers;