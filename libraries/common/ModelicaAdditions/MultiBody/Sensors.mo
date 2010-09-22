package Sensors "Sensors for 3D mechanical components"
   extends Modelica.Icons.Library;
   annotation (Documentation(info="<html>
 <p>
 This package contains sensor elements
 </p>
 
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
 <li><i>April 5, 2000</i>
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
   model Sensor "General sensor element"
      extends Interfaces.Interact2;
      annotation (Documentation(info="
 A sensor element determines the relative kinematic quantities
 between frame_a and frame_b (= variables of superclass
 Interact). It does not exert forces or torques.
 The following relative variables can be determined:
 
   S_rel : Rotation matrix relating frame_a and frame_b, i.e. if
          hb is vector h resoved in frame_b and ha is vector h resolved
          in frame_a, hb = S_rel*ha.
   r_rela: Vector from the origin of frame_a to the origin of frame_b,
          resolved in frame_a.
   v_rela: (Translational) velocity of frame_b with respect to frame_a,
          resolved in frame_a: v_rela = der(r_rela)
   w_rela: Angular velocity of frame_b with respect to frame_a,
          resolved in frame_a: v_rela = vec( der(S_rel)'*S_rel )
   a_rela: (Translational) acceleration of frame_b with respect to
          frame_a, resolved in frame_a: a_rela = der( v_rela )
   z_rela: Angular acceleration of frame_b with respect to frame_a,
          resolved in frame_a: z_rela = der( w_rela )
 
 If needed, all of the above quantities can also easily be resolved in
 frame_b, according to  Xrelb = S_rel*Xrela . However note, that
  v_relb  is NOT  der(r_relb)  (v_relb=S_rel*v_rela; r_relb=S_rel*r_rela).
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,10.},{-70.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{70.,10.},{90.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-70.,50.},{-50.,-50.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{70.,50.},{50.,-50.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Line(points={{-21.,21.},{-10.,36.},{10.,36.},{21.,23.},{12.,9.},{-11.,5.},{-21.,-10.},{-11.,-25.},{9.,-25.},{20.,-11.}},pattern=LinePattern.Solid,thickness=0.5,arrow={Arrow.None,Arrow.None},color={0,0,255}),Ellipse(extent={{-3.,-37.},{3.,-42.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-100.,60.},{100.,118.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,10.},{-70.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{70.,10.},{90.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-70.,50.},{-50.,-50.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{70.,50.},{50.,-50.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Line(points={{-21.,21.},{-10.,36.},{10.,36.},{21.,23.},{12.,9.},{-11.,5.},{-21.,-10.},{-11.,-25.},{9.,-25.},{20.,-11.}},pattern=LinePattern.Solid,thickness=0.5,arrow={Arrow.None,Arrow.None},color={0,0,255}),Ellipse(extent={{-3.,-37.},{3.,-42.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-80.,70.},{80.,100.}},textString="general sensor",fillColor={0,0,255})}));
      
   equation
      fa = zeros(3);
      fb = zeros(3);
      ta = zeros(3);
      tb = zeros(3);
   end Sensor;
   model LineSensor "Measures kinematic data along a line"
      extends Interfaces.Interact2;
      parameter Real sEps=1.e-6 "prevent zero-division if rel. distance s=0 [m]";
      SI.Acceleration sdd;
      Real na[3];
      SI.Position smod;
      SI.Position s;
      SI.Velocity sd;
      Modelica.Blocks.Interfaces.OutPort outPort_s(final n=1) annotation (Placement(transformation(x=-40.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90),iconTransformation(x=-40.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90)));
      Modelica.Blocks.Interfaces.OutPort outPort_sd(final n=1) annotation (Placement(transformation(x=40.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90,flipHorizontal=true),iconTransformation(x=40.,y=-100.,scale=0.1,aspectRatio=1.,rotation=-90,flipHorizontal=true)));
      annotation (Documentation(info="
 The distance as well as the first and second derivative of the
 distance between the cut-frames A and B are determined.
 
 Terminal variables:
   s    : The distance between the origin of frame_a and the
          origin of frame_b in [m].
   sd   : The first derivative of s in [m/s].
   sdd  : The second derivative of s in [m/s^2].
   na(3): Unit vector on the line from the origin of frame_a to
          the origin of frame_b, resolved in frame_a.
 
 Parameters:
   sEps: When  sd  and  sdd  are calculated, a division by zero takes
         place, if the distance becomes zero. Therefore, for this
         calculation the modified distance  smod = max(s, sEps)  is used.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-50.,-10.},{-30.,-90.}},lineColor={255,255,0},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{50.,-10.},{30.,-90.}},lineColor={255,255,0},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-90.,10.},{90.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Line(points={{-40.,-10.},{-40.,-90.}},color={0,0,255}),Line(points={{40.,-10.},{40.,-90.}},color={0,0,255}),Text(extent={{-98.,-56.},{-53.,-96.}},textString="s",fillColor={0,0,0},pattern=LinePattern.None),Text(extent={{109.,-60.},{54.,-100.}},textString="sd",fillColor={0,0,0}),Text(extent={{-100.,26.},{100.,86.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-50.,-10.},{-30.,-90.}},lineColor={255,255,0},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{50.,-10.},{30.,-90.}},lineColor={255,255,0},fillColor={255,255,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-90.,10.},{90.,-10.}},lineColor={0,0,255},fillColor={255,255,0},fillPattern=FillPattern.Solid),Line(points={{-40.,-10.},{-40.,-90.}},color={0,0,255}),Line(points={{40.,-10.},{40.,-90.}},color={0,0,255}),Line(points={{-90.,66.},{-90.,10.}},color={0,0,255}),Line(points={{90.,66.},{90.,10.}},color={0,0,255}),Line(points={{-90.,60.},{80.,60.}},color={0,0,255}),Polygon(points={{90.,60.},{80.,64.},{80.,56.},{90.,60.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-40.,84.},{40.,60.}},textString="s, sd=der(s)",fillColor={0,0,255}),Text(extent={{-100.,-30.},{-60.,-70.}},textString="s",fillColor={0,0,255}),Text(extent={{100.,-30.},{60.,-70.}},textString="sd",fillColor={0,0,255})}));
      
   equation
      fa = zeros(3);
      fb = zeros(3);
      ta = zeros(3);
      tb = zeros(3);
      s = outPort_s.signal[1];
      sd = outPort_sd.signal[1];
      s = sqrt(r_rela*r_rela);
      smod = max([s,sEps]);
      na = r_rela/smod;
      sd = na*v_rela;
      sdd = na*a_rela+(v_rela*v_rela-sd*sd)/smod;
   end LineSensor;
end Sensors;