package Parts "Parts with and without mass for 3D mechanical components"
   extends Modelica.Icons.Library;
   annotation (Documentation(info="<html>
 <p>
 This package contains the inertial system and elements
 which have mass and inertia.
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
   model InertialSystem "Inertial system"
      parameter SI.Acceleration g=9.81 "Gravity constant";
      parameter Real ng[3]={0,-1,0} "Direction of gravity (gravity = g*ng)";
      parameter String label1="x" "Label of horizontal axis in icon";
      parameter String label2="y" "Label of vertical axis in icon";
      SI.Acceleration gravity[3] "Gravity acceleration vector";
      Interfaces.Frame_b frame_b annotation (Placement(transformation(x=105.,y=0.,scale=0.15,aspectRatio=1.),iconTransformation(x=105.,y=0.,scale=0.15,aspectRatio=1.)));
      annotation (Documentation(info="
 An instance of this class defines a coordinate system: the inertial
 frame. All parameter vectors and tensors (e.g. position vectors)
 are given in the home position of the multibody system with respect
 to the inertial frame.
 
 One instance of class  InertialSystem  MUST always be present for every
 multibody model.
 
 In order to identify the desired axes of the used inertial frame in
 the icon, the labels of the two axes can be defined as string parameters.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-80.,70.},{90.,-80.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Line(points={{-80.,-100.},{-80.,30.}},color={0,0,0},thickness=0.5),Polygon(points={{-80.,70.},{-100.,30.},{-60.,30.},{-80.,70.},{-80.,70.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Line(points={{-100.,-80.},{50.,-80.}},color={0,0,0},thickness=0.5),Polygon(points={{90.,-80.},{50.,-60.},{50.,-100.},{90.,-80.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Text(extent={{0.,150.},{0.,79.}},textString="%name",fillColor={0,0,255}),Text(extent={{50.,18.},{50.,-51.}},textString="%label1",fillColor={0,0,255}),Text(extent={{-30.,60.},{-30.,-11.}},textString="%label2",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-80.,70.},{90.,-80.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Line(points={{-80.,-100.},{-80.,30.}},color={0,0,0},thickness=0.5),Polygon(points={{-80.,70.},{-100.,30.},{-60.,30.},{-80.,70.},{-80.,70.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Line(points={{-100.,-80.},{50.,-80.}},color={0,0,0},thickness=0.5),Polygon(points={{90.,-80.},{50.,-60.},{50.,-100.},{90.,-80.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Text(extent={{-100.,110.},{100.,70.}},textString="inertial system",fillColor={0,0,255}),Text(extent={{-10.,-10.},{50.,-70.}},textString="%label1",fillColor={0,0,255}),Text(extent={{-60.,60.},{0.,0.}},textString="%label2",fillColor={0,0,255})}));
      
   equation
      gravity = g*ng;
      frame_b.S = identity(3);
      frame_b.r0 = zeros(3);
      frame_b.v = zeros(3);
      frame_b.w = zeros(3);
      frame_b.a = -gravity;
      frame_b.z = zeros(3);
   end InertialSystem;
   model FrameTranslation "Fixed translation of frame_b with respect to frame_a"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0,0,0} "Vector from frame_a to frame_b resolved in frame_a";
      
   protected
      SI.Velocity vaux[3];
      annotation (Documentation(info="
 Fixed translation of frame_b with respect to frame_a, i.e.,
 the frames of connectors a and b are parallel to each other.
 
 Parameters:
   r: Position vector from the origin of (connector) frame_a to the origin of
      (connector) frame_b, resolved in frame_a in [m].
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-99.,-100.},{101.,-40.}},textString="r=%r",fillColor={0,0,0}),Rectangle(extent={{-90.,5.},{90.,-5.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Text(extent={{-101.,41.},{99.,101.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-90.,0.},{-90.,-65.}},color={0,0,255}),Line(points={{90.,0.},{90.,-65.}},color={0,0,255}),Line(points={{-90.,-60.},{80.,-60.}},color={0,0,255}),Polygon(points={{80.,-55.},{80.,-65.},{90.,-60.},{80.,-55.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-22.,-36.},{16.,-60.}},textString="r",fillColor={0,0,255}),Rectangle(extent={{-90.,5.},{90.,-5.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Line(points={{69.,29.},{106.,29.}},arrow={Arrow.None,Arrow.Filled},color={0,0,255}),Line(points={{70.,27.},{70.,59.}},arrow={Arrow.None,Arrow.Filled},color={0,0,255}),Text(extent={{92.,44.},{106.,33.}},textString="x",fillColor={0,0,255}),Text(extent={{51.,66.},{66.,54.}},textString="y",fillColor={0,0,255}),Line(points={{-103.,29.},{-66.,29.}},arrow={Arrow.None,Arrow.Filled},color={0,0,255}),Line(points={{-102.,27.},{-102.,59.}},arrow={Arrow.None,Arrow.Filled},color={0,0,255}),Text(extent={{-80.,44.},{-66.,33.}},textString="x",fillColor={0,0,255}),Text(extent={{-121.,66.},{-106.,54.}},textString="y",fillColor={0,0,255})}));
      
   equation
      Sb = Sa;
      wb = wa;
      zb = za;
      r0b = r0a+Sa*r;
      vaux = cross(wa,r);
      vb = va+vaux;
      ab = (aa+cross(za,r))+cross(wa,vaux);
      fa = fb;
      ta = tb+cross(r,fa);
   end FrameTranslation;
   model FrameRotation "Fixed translation and planar rotation of frame_b with respect to frame_a"
      extends Interfaces.FrameBase;
      parameter Real n[3]={1,0,0} "Axis of rotation in frame_a and in frame_b";
      parameter Real angle=0 "Rotation angle in [deg]";
      parameter String label1="x" "Label of horizontal axis in icon";
      parameter String label2="y" "Label of vertical axis in icon";
      
   protected
      Real nn[3];
      SI.Angle angleRad;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{136.,95.},{164.,73.}},textString="%label1",fillColor={0,0,0}),Text(extent={{3.,97.},{31.,75.}},textString="%label2",fillColor={0,0,0})}));
      
   equation
      nn = n/sqrt(n*n);
      angleRad = (angle*pi)/180;
      S_rel = Interfaces.planarRotation(nn,angleRad);
   end FrameRotation;
   model FrameAxes "Fixed translation and rotation of frame_b with respect to frame_a"
      extends Interfaces.FrameBase;
      parameter Real nx[3]={1,0,0} "x-axis of frame_b resolved in frame_a";
      parameter Real ny[3]={0,1,0} "y-axis of frame_b resolved in frame_a";
      parameter String label1="x" "Label of horizontal axis in icon";
      parameter String label2="y" "Label of vertical axis in icon";
      
   protected
      Real nz[3];
      Real nnx[3];
      Real nny[3];
      Real nnz[3];
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{3.,97.},{31.,75.}},textString="%label2",fillColor={0,0,0}),Text(extent={{129.,102.},{157.,80.}},textString="%label1",fillColor={0,0,0})}));
      
   equation
      nz = cross(nx,ny);
      nnz = nz/sqrt(nz*nz);
      nnx = nx/sqrt(nx*nx);
      nny = cross(nnz,nnx);
      S_rel = transpose([nnx,nny,nnz]);
   end FrameAxes;
   model FrameAngles "Fixed translation and elementary rotations of frame_b with respect to frame_a"
      extends Interfaces.FrameBase;
      parameter Integer sequence[3](min={1,1,1},max={3,3,3})={1,2,3} "Sequence of rotations";
      parameter Real angles[3]={0,0,0} "Rotation angles around axes defined in sequence in [deg]";
      parameter String label1="x" "Label of horizontal axis in icon";
      parameter String label2="y" "Label of vertical axis in icon";
      
   protected
      parameter SI.Angle anglesRad[3]=(angles*Modelica.Constants.pi)/180.;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})));
      
   equation
      S_rel = (Interfaces.axisRotation(sequence[3],anglesRad[3])*Interfaces.axisRotation(sequence[2],anglesRad[2]))*Interfaces.axisRotation(sequence[1],anglesRad[1]);
   end FrameAngles;
   model Body "Rigid body with one cut"
      extends Interfaces.OneFrame_a;
      parameter SI.Position rCM[3]={0,0,0} "Vector from frame_a to center of mass, resolved in frame_a";
      parameter SI.Mass m=0 "Mass of body [kg]";
      parameter SI.Inertia I11=0 "(1,1) element of inertia tensor";
      parameter SI.Inertia I22=0 "(2,2) element of inertia tensor";
      parameter SI.Inertia I33=0 "(3,3) element of inertia tensor";
      parameter SI.Inertia I21=0 "(2,1) element of inertia tensor";
      parameter SI.Inertia I31=0 "(3,1) element of inertia tensor";
      parameter SI.Inertia I32=0 "(3,2) element of inertia tensor";
      annotation (Documentation(info="
 Rigid body with one cut. All the mass and inertia properties must be
 supplied with respect to the center of mass.
 
 Parameters:
   rCM[3]: Position vector from the origin of frame_a to the center of
           mass, resolved in frame_a in [m].
   m     : Mass of body in [kg].
   Ixy   : Elements (x,y) of the inertia tensor of the body with respect to
           the center of mass, resolved in frame_a in [kgm^2].
           The following elements can be defined:
           I11, I22, I33, I21, I31, I32.
           (Move the inertial from into the center of mass by translation
           and resolve the inertia tensor in this frame).
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,15.},{0.,-15.}},lineColor={0,0,0},pattern=LinePattern.None,fillColor={127,127,255},fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{0.,50.},{100.,-50.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.Sphere),Text(extent={{0.,59.},{0.,129.}},textString="%name",fillColor={0,0,255}),Text(extent={{0.,-129.},{0.,-60.}},textString="%=rCM",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-100.,-2.},{-100.,-48.}},color={0,0,255}),Line(points={{20.,0.},{20.,-48.}},color={0,0,255}),Line(points={{-100.,-40.},{10.,-40.}},color={0,0,255}),Polygon(points={{20.,-40.},{10.,-36.},{10.,-44.},{20.,-40.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-68.,-44.},{-16.,-62.}},textString="rCM",fillColor={0,0,255})}));
      Interfaces.BodyBase body annotation (Placement(transformation(x=0.,y=0.,scale=0.4,aspectRatio=1.),iconTransformation(x=0.,y=0.,scale=0.4,aspectRatio=1.)));
      
   equation
      connect(frame_a, body.frame_a) annotation (Line(points={{-105.,0.},{-42.,0.}},color={0,0,0},thickness=0.5));
      body.m = m;
      body.rCM = rCM;
      body.I = [I11,I21,I31; I21,I22,I32; I31,I32,I33];
   end Body;
   model Body2 "Rigid body with two cuts"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0,0,0} "Vector from frame_a to frame_b, resolved in frame_a";
      parameter SI.Position rCM[3]={0,0,0} "Vector from frame_a to center of mass, resolved in frame_a";
      parameter SI.Mass m=0 "Mass of body";
      parameter SI.Inertia I11=0 "(1,1) element of inertia tensor";
      parameter SI.Inertia I22=0 "(2,2) element of inertia tensor";
      parameter SI.Inertia I33=0 "(3,3) element of inertia tensor";
      parameter SI.Inertia I21=0 "(2,1) element of inertia tensor";
      parameter SI.Inertia I31=0 "(3,1) element of inertia tensor";
      parameter SI.Inertia I32=0 "(3,2) element of inertia tensor";
      annotation (Documentation(info="
 Rigid body with two frames. All the mass and inertia properties must be
 supplied with respect to the center of mass. All parameter vectors
 have to be resolved in frame_a in [m].
 
 Parameters:
   r[3]  : Position vector from the origin of frame_a to the origin of
           frame_b.
   rCM[3]: Position vector from the origin of frame_a to the center of
           mass.
   m     : Mass of body in [kg].
   Ixy   : Elements (x,y) of the inertia tensor of the body with respect to
           the center of mass, resolved frame_a in [kgm^2].
           The following elements can be defined:
           I11, I22, I33, I21, I31, I32.
           (Move the inertial from into the center of mass by translation
           and resolve the inertia tensor in this frame).
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,15.},{-50.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{90.,15.},{50.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-50.,50.},{50.,-50.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.Sphere),Text(extent={{-100.,120.},{100.,60.}},textString="%name",fillColor={0,0,255}),Text(extent={{-99.,-60.},{101.,-100.}},textString="r=%r",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-90.,10.},{-90.,44.}},color={0,0,255}),Line(points={{90.,0.},{90.,44.}},color={0,0,255}),Line(points={{-90.,40.},{80.,40.}},color={0,0,255}),Polygon(points={{80.,44.},{80.,36.},{90.,40.},{80.,44.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-22.,68.},{20.,40.}},textString="r",fillColor={0,0,255}),Line(points={{-90.,-10.},{-90.,-90.}},color={0,0,255}),Line(points={{0.,-46.},{0.,-90.}},color={0,0,255}),Line(points={{-90.,-84.},{-10.,-84.}},color={0,0,255}),Polygon(points={{-10.,-80.},{-10.,-88.},{0.,-84.},{-10.,-80.}},fillColor={0,0,255},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Text(extent={{-60.,-64.},{-34.,-82.}},textString="rCM",fillColor={0,0,255})}));
      FrameTranslation frameTranslation(r=r) annotation (Placement(transformation(x=0.,y=0.,scale=0.4,aspectRatio=0.5),iconTransformation(x=0.,y=0.,scale=0.4,aspectRatio=0.5)));
      Interfaces.BodyBase body annotation (Placement(transformation(x=-0.6666500000000006,y=-46.66665,scale=0.26666650000000003,aspectRatio=0.9999999999999998),iconTransformation(x=-0.6666500000000006,y=-46.66665,scale=0.26666650000000003,aspectRatio=0.9999999999999998)));
      
   equation
      connect(frame_a, frameTranslation.frame_a) annotation (Line(points={{-105.,0.},{-42.,0.}},color={0,0,0},thickness=0.5));
      connect(frame_b, frameTranslation.frame_b) annotation (Line(points={{105.,0.},{42.,0.}},color={0,0,0},thickness=0.5));
      connect(frame_a, body.frame_a) annotation (Line(points={{-105.,0.},{-60.,0.},{-60.,-46.},{-28.6666,-46.6666}},color={0,0,0},thickness=0.5));
      body.m = m;
      body.rCM = rCM;
      body.I = [I11,I21,I31; I21,I22,I32; I31,I32,I33];
   end Body2;
   model BoxBody "Rigid body with box shape (also used for animation)"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0.1,0,0} "Vector from frame_a to frame_b, resolved in frame_a";
      parameter SI.Position r0[3]={0,0,0} "Vector from frame_a to left box plane, resolved in frame_a";
      parameter SI.Position LengthDirection[3]=r-r0 "Vector in length direction, resolved in frame_a";
      parameter SI.Position WidthDirection[3]={0,1,0} "Vector in width direction, resolved in frame_a";
      parameter SI.Length Length=sqrt((r-r0)*(r-r0)) "Length of box";
      parameter SI.Length Width=0.1 "Width of box";
      parameter SI.Length Height=0.1 "Height of box";
      parameter SI.Length InnerWidth=0 "Width of inner box surface";
      parameter SI.Length InnerHeight=0 "Height of inner box surface";
      parameter Real rho=7.7 "Density of box material [g/cm^3]";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      SI.Mass mo;
      SI.Mass mi;
      //Real Sbox[3,3];
      SI.Length l;
      SI.Length w;
      SI.Length h;
      SI.Length wi;
      SI.Length hi;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="
 Rigid body with  box  shape. The mass properties of the body are computed
 from the box data. Optionally, the box may be hollow.
 The (outer) box shape is automatically used in animation.
 
 Parameter vectors are defined with respect to frame_a in [m].
 
 Parameters:
   r[3]       : Position vector from the origin of frame_a to the
                origin of frame_b.
   r0[3]      : Position vector from frame_a to the mid-point of the  left
                box plane.
   LengthDirection[3]: Unit vector in direction of length (will be normalized).
   WidthDirection[3] : Unit vector in direction of width (will be normalized).
   Length     : Length of box in [m].
   Width      : Width of box in [m].
   Height     : Height of box in direction of a vector which is
                orthogonal to  LengthDirection  and  WidthDirection  in [m].
   InnerWidth : Width of inner box surface in [m] (0 <= InnerWidth < Width).
   InnerHeight: Height of inner box surface in [m] (0 <= InnerHeight < Height).
   rho        : Density of material in [g/cm^3], e.g.
                     steel: 7.7 .. 7.9
                     wood : 0.4 .. 0.8
   Material[4]: = {r, g, b, specular}.
                Color and specular coefficient of the box.
                [r,g,b] affects the color of diffuse and ambient reflected
                light. Specular is a coefficient defining white specular
                reflection. What color that is reflected also depends on the
                color of the light sources. Note, r g, b and specular are
                given in the range 0-1. Specular=1 gives a metallic appearance.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,15.},{-50.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-50.,35.},{30.,-45.}},lineColor={255,255,255},fillColor={191,95,0},fillPattern=FillPattern.Solid),Polygon(points={{-50.,35.},{-30.,55.},{50.,55.},{30.,35.},{-50.,35.}},lineColor={192,192,192},fillColor={127,127,255},fillPattern=FillPattern.Solid),Polygon(points={{50.,55.},{50.,-25.},{30.,-45.},{30.,35.},{50.,55.}},lineColor={255,255,255},fillColor={127,127,255},fillPattern=FillPattern.Solid),Rectangle(extent={{40.,15.},{90.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{-100.,130.},{100.,68.}},textString="%name",fillColor={0,0,255}),Text(extent={{-99.,-61.},{99.,-100.}},textString="r=%r",fillColor={0,0,0})}));
      FrameTranslation frameTranslation(r=r) annotation (Placement(transformation(x=0.,y=0.,scale=0.6,aspectRatio=0.5),iconTransformation(x=0.,y=0.,scale=0.6,aspectRatio=0.5)));
      Interfaces.BodyBase body annotation (Placement(transformation(x=4.,y=-77.,scale=0.29,aspectRatio=1.0344827586206897),iconTransformation(x=4.,y=-77.,scale=0.29,aspectRatio=1.0344827586206897)));
      //VisualShape box(Shape="box",r0=r0,LengthDirection=LengthDirection,WidthDirection=WidthDirection,Length=Length,Width=Width,Height=Height,Material=Material) annotation (Placement(transformation(x=10.,y=70.,scale=0.3,aspectRatio=1.),iconTransformation(x=10.,y=70.,scale=0.3,aspectRatio=1.)));
      
   equation
      connect(body.frame_a, frame_a) annotation (Line(points={{-26.45,-77.},{-105.,0.}},color={0,0,255}));
      connect(frame_a, frameTranslation.frame_a) annotation (Line(points={{-105.,0.},{-63.,0.}},color={0,0,255}));
      connect(frameTranslation.frame_b, frame_b) annotation (Line(points={{63.,0.},{105.,0.}},color={0,0,255}));
      //box.S = Sa;
      //box.r = r0a;
      //box.Sshape = Sbox;
      l = Length;
      w = Width;
      h = Height;
      wi = InnerWidth;
      hi = InnerHeight;
      mo = (((1000*rho)*l)*w)*h;
      mi = (((1000*rho)*l)*wi)*hi;
      body.m = mo-mi;
      //body.rCM = r0+l/2*box.nLength;
      body.rCM = r0+l/2*LengthDirection;
      body.I = diagonal({mo*(w*w+h*h)-mi*(wi*wi+hi*hi),mo*(l*l+h*h)-mi*(l*l+hi*hi),mo*(l*l+w*w)-mi*(l*l+wi*wi)}/12);
   end BoxBody;
   model CylinderBody "Rigid body with cylindrical shape (also used for animation)"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0.2,0,0} "Vector from frame_a to frame_b, resolved in frame_a";
      parameter SI.Position r0[3]={0,0,0} "Vector from frame_a to left circle center, resolved in frame_a";
      parameter SI.Position Axis[3]=r-r0 "Vector in direction of cylinder axis, resolved in frame_a";
      parameter SI.Length Length=sqrt(Axis*Axis) "Length of cylinder";
      parameter SI.Length Radius(min=0)=0.1 "Radius of cylinder";
      parameter SI.Length InnerRadius(min=0,max=Radius)=0 "Inner radius of cylinder";
      parameter Real rho(min=0)=7.7 "Density of material [g/cm^3]";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      //Real Scyl[3,3];
      SI.Mass mo;
      SI.Mass mi;
      SI.Inertia I22;
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="
 Rigid body with  cylindrical  shape. The mass properties of the body are
 computed from the cylinder data. Optionally, the cylinder may be hollow.
 The pipe shape is automatically used in animation.
 
 Parameter vectors are defined with respect to frame_a in [m].
 
 Parameters:
   r[3]       : Position vector from the origin of frame_a to the origin of
                frame_b.
   r0[3]      : Position vector from the origin of frame_a to the center
                of the  left  cylinder circle.
   Axis[3]    : Unit vector in direction of the cylinder axis
                (will be normalized)
   Length     : Length of cylinder in [m].
   Radius     : Radius of cylinder in [m].
   InnerRadius: Inner radius of cylinder in [m].
   rho        : Density of material in [g/cm^3], e.g.
                   steel: 7.7 .. 7.9
                   wood : 0.4 .. 0.8
   Material(4): = {r, g, b, specular}.
                Color and specular coefficient of the box.
                [r,g,b] affects the color of diffuse and ambient reflected
                light. Specular is a coefficient defining white specular
                reflection. What color that is reflected also depends on the
                color of the light sources. Note, r g, b and specular are
                given in the range 0-1. Specular=1 gives a metallic appearance.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,15.},{-50.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{50.,15.},{90.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Rectangle(extent={{-50.,50.},{50.,-50.}},lineColor={0,0,0},fillColor={191,95,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{-102.,120.},{100.,60.}},textString="%name",fillColor={0,0,255}),Text(extent={{-100.,-59.},{100.,-99.}},textString="r=%r",fillColor={0,0,0})}));
      FrameTranslation frameTranslation(r=r) annotation (Placement(transformation(x=0.,y=0.,scale=0.6,aspectRatio=0.5),iconTransformation(x=0.,y=0.,scale=0.6,aspectRatio=0.5)));
      Interfaces.BodyBase body annotation (Placement(transformation(x=0.,y=-72.,scale=0.3,aspectRatio=0.9666666666666667),iconTransformation(x=0.,y=-72.,scale=0.3,aspectRatio=0.9666666666666667)));
      //VisualShape box(r0=r0,Length=Length,Width=2*Radius,Height=2*Radius,LengthDirection=Axis,WidthDirection={0,1,0},Shape="pipe",Material=Material,Extra=InnerRadius/Radius) annotation (Placement(transformation(x=10.,y=70.,scale=0.3,aspectRatio=1.),iconTransformation(x=10.,y=70.,scale=0.3,aspectRatio=1.)));
      
   equation
      connect(frame_a, body.frame_a) annotation (Line(points={{-105.,0.},{-31.5,-72.}},color={0,0,255}));
      connect(frame_a, frameTranslation.frame_a) annotation (Line(points={{-105.,0.},{-63.,0.}},color={0,0,255}));
      connect(frameTranslation.frame_b, frame_b) annotation (Line(points={{63.,0.},{105.,0.}},color={0,0,255}));
      //box.S = Sa;
      //box.r = r0a;
      //box.Sshape = Scyl;
      mo = ((((1000*rho)*pi)*Length)*Radius)*Radius;
      mi = ((((1000*rho)*pi)*Length)*InnerRadius)*InnerRadius;
      I22 = (mo*(Length*Length+(3*Radius)*Radius)-mi*(Length*Length+(3*InnerRadius)*InnerRadius))/12;
      body.m = mo-mi;
      //body.rCM = r0+Length/2*box.nLength;
      body.rCM = r0+Length/2*Axis;
      body.I = diagonal({((mo*Radius)*Radius-(mi*InnerRadius)*InnerRadius)/2,I22,I22});
   end CylinderBody;
   model ShapeBody "Rigid body with visual shape (also used for animation)"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0.1,0,0} "Vector from frame_a to frame_b, resolved in frame_a";
      parameter SI.Position rCM[3]={0,0,0} "Vector from frame_a to center of mass, resolved in frame_a";
      parameter SI.Mass m=0 "Mass of body";
      parameter SI.Inertia I11=0 "(1,1) element of inertia tensor";
      parameter SI.Inertia I22=0 "(2,2) element of inertia tensor";
      parameter SI.Inertia I33=0 "(3,3) element of inertia tensor";
      parameter SI.Inertia I21=0 "(2,1) element of inertia tensor";
      parameter SI.Inertia I31=0 "(3,1) element of inertia tensor";
      parameter SI.Inertia I32=0 "(3,2) element of inertia tensor";
      parameter String Shape="box" "Name of shape (see info text)";
      parameter SI.Position r0[3]={0,0,0} "Vector from frame_a to shape origin. resolved in frame_a";
      parameter SI.Position LengthDirection[3]=r-r0 "Vector in length direction, resolved in frame_a";
      parameter SI.Position WidthDirection[3]={0,1,0} "Vector in width direction, resolved in frame_a";
      parameter SI.Length Length=sqrt((r-r0)*(r-r0)) "Length of shape";
      parameter SI.Length Width=0.1 "Width of shape";
      parameter SI.Length Height=0.1 "Height of shape";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      parameter Real Extra=0. "Additional parameter for cone and pipe";
      annotation (Documentation(info="
 Rigid body with two cuts and an additional shape used in animation.
 All the mass and inertia properties must be supplied with respect
 to the center of mass. All parameter vectors are resolved in frame_a
 in [m].
 
 Parameters:
   r[3]         : Position vector from the origin of frame_a to the origin of
                  frame_b.
   rCM[3]       : Position vector from the origin of frame_a to the center of
                  mass.
   m            : Mass of body in [kg].
   Ixy          : Elements (x,y) of the inertia tensor of the body with respect to
                  the center of mass, resolved in the inertial frame in the home
                  position in [kgm^2]. The following elements can be defined:
                  I11, I22, I33, I21, I31, I32.
                  (Move the inertial from into the center of mass by translation
                  and resolve the inertia tensor in this frame).
 
   Shape        : Type of visual shape. Predefined shapes are
                    Shape = \"box\"
                            \"sphere\"
                            \"cylinder\"
                            \"cone\"
                            \"pipe\"
                            \"beam\"
                            \"gearwheel\"
                            \"wirebox\"
                  External shapes are specified as DXF-files (only 3DFace is supported).
                  External shapes must be named \"1\", \"2\"  etc.. The corresponding definitions
                  should be in files \"1.dxf\", \"2.dxf\" etc.Since the DXF-files contain color
                  and dimensions for the individual faces, the corresponding information
                  in the model is currently ignored, but the specular coefficient is
                  utilized. The DXF-files must be found in the current directory.
 
   r0[3]        : Position vector from the origin of frame_a to the origin
                  of the visual object.
   LengthDirection[3]: Unit vector in direction of length (will be normalized).
   WidthDirection[3] : Unit vector in direction of width (will be normalized).
   Length       : Length of visual shape in [m].
   Width        : Width of visual shape in [m].
   Height       : Height of visual shape in direction of a vector which is
                  orthogonal to  LengthDirection  and  WidthDirection.
   Material[4]  : = {r, g, b, specular} specifies the color of the shape.
                  [r,g,b] affects the color of diffuse and ambient reflected
                  light. Specular is a coefficient defining white specular
                  reflection. What color that is reflected also depends on the
                  color of the light sources. Note, r g, b and specular are
                  given in the range 0 .. 1. Specular=1 gives a metallic appearance.
   Extra        : Additional parameter for cone and pipe.
                  \"pipe\"     : A hollow cylinder. Extra = InnerRadius/Radius of the cylinder.
                  \"gearwheel\": A ring with gear wheel teeth. Extra = number of teeth.
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,15.},{-50.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Polygon(points={{-50.,34.},{-50.,-60.},{0.,-40.},{40.,-60.},{40.,36.},{0.,12.},{-50.,34.}},lineColor={255,255,255},fillColor={191,95,0},fillPattern=FillPattern.Solid),Polygon(points={{-50.,34.},{-30.,46.},{10.,30.},{60.,62.},{40.,36.},{0.,12.},{-50.,34.}},lineColor={255,255,255},fillColor={127,127,255},fillPattern=FillPattern.Solid),Polygon(points={{58.,60.},{40.,36.},{40.,-60.},{58.,-36.},{58.,60.}},lineColor={255,255,255},fillColor={127,127,255},fillPattern=FillPattern.Solid),Rectangle(extent={{48.,15.},{90.,-15.}},lineColor={0,0,0},fillColor={127,127,255},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{-100.,120.},{100.,61.}},textString="%name=%r",fillColor={0,0,255}),Text(extent={{-100.,-61.},{100.,-99.}},textString="%Shape",fillColor={0,0,0})}));
      Body2 body(r=r,rCM=rCM,m=m,I11=I11,I22=I22,I33=I33,I21=I21,I31=I31,I32=I32) annotation (Placement(transformation(x=0.,y=0.,scale=0.4,aspectRatio=1.),iconTransformation(x=0.,y=0.,scale=0.4,aspectRatio=1.)));
      //Parts.Shape vis(Shape=Shape,r0=r0,LengthDirection=LengthDirection,WidthDirection=WidthDirection,Length=Length,Width=Width,Height=Height,Material=Material,Extra=Extra) annotation (Placement(transformation(x=1.,y=-70.,scale=0.3,aspectRatio=1.),iconTransformation(x=1.,y=-70.,scale=0.3,aspectRatio=1.)));
      
   equation
      connect(frame_a, body.frame_a) annotation (Line(points={{-105.,0.},{-42.,0.}},color={0,0,255}));
      connect(frame_b, body.frame_b) annotation (Line(points={{105.,0.},{42.,0.}},color={0,0,255}));
      //connect(vis.frame_a, frame_a) annotation (Line(points={{-30.5,-70.},{-70.,-70.},{-70.,0.},{-105.,0.}},color={0,0,255}));
   end ShapeBody;
end Parts;