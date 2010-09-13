package Modelica "Modelica Standard Library (Version 3.1)"
  extends Modelica.Icons.Library;
  annotation(preferredView="info", version="3.1", versionBuild=5, versionDate="2009-08-14", dateModified="2009-12-18 08:49:49Z", revisionId="$Id:: package.mo 3222 2009-12-18 08:53:50Z #$", conversion(noneFromVersion="3.0.1", noneFromVersion="3.0", from(version="2.1", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version="2.2", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version="2.2.1", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"), from(version="2.2.2", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos")), __Dymola_classOrder={"UsersGuide","Blocks","StateGraph","Electrical","Magnetic","Mechanics","Fluid","Media","Thermal","Math","Utilities","Constants","Icons","SIunits"}, Settings(NewStateSelection=true), Documentation(info="<HTML>
<p>
Package <b>Modelica</b> is a <b>standardized</b> and <b>free</b> package
that is developed together with the Modelica language from the
Modelica Association, see
<a href=\"http://www.Modelica.org\">http://www.Modelica.org</a>.
It is also called <b>Modelica Standard Library</b>.
It provides model components in many domains that are based on
standardized interface definitions. Some typical examples are shown
in the next figure:
</p>

<p>
<img src=\"Images/UsersGuide/ModelicaLibraries.png\">
</p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.UsersGuide.Overview\">Overview</a>
  provides an overview of the Modelica Standard Library
  inside the <a href=\"Modelica://Modelica.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"Modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
 summarizes the changes of new versions of this package.</li>
<li> <a href=\"Modelica://Modelica.UsersGuide.Contact\">Contact</a>
  lists the contributors of the Modelica Standard Library.</li>
<li> The <b>Examples</b> packages in the various libraries, demonstrate
  how to use the components of the corresponding sublibrary.</li>
</ul>

<p>
This version of the Modelica Standard Library consists of
</p>
<ul>
<li> <b>922</b> models and blocks, and</li>
<li> <b>615</b> functions
</ul>
<p>
that are directly usable (= number of public, non-partial classes).
</p>


<p>
<b>Licensed by the Modelica Association under the Modelica License 2</b><br>
Copyright &copy; 1998-2009, ABB, arsenal research, T.&nbsp;Bödrich, DLR, Dynasim, Fraunhofer, Modelon,
TU Hamburg-Harburg, Politecnico di Milano.
</p>

<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty)
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a></u>
or at
<a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">
http://www.Modelica.org/licenses/ModelicaLicense2</a>.
</p>

</HTML>
"));
  package Utilities "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>
<p>
This package contains Modelica <b>functions</b> that are
especially suited for <b>scripting</b>. The functions might
be used to work with strings, read data from file, write data
to file or copy, move and remove files.
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Utilities.UsersGuide\">Modelica.Utilities.User's Guide</a>
     discusses the most important aspects of this library.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Examples\">Modelica.Utilities.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
<p>
The following main sublibraries are available:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Utilities.Files\">Files</a>
     provides functions to operate on files and directories, e.g.,
     to copy, move, remove files.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Streams\">Streams</a>
     provides functions to read from files and write to files.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Strings\">Strings</a>
     provides functions to operate on strings. E.g.
     substring, find, replace, sort, scanToken.</li>
<li> <a href=\"Modelica://Modelica.Utilities.System\">System</a>
     provides functions to interact with the environment.
     E.g., get or set the working directory or environment
     variables and to send a command to the default shell.</li>
</ul>

<p>
Copyright &copy; 1998-2009, Modelica Association, DLR and Dynasim.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</html>
"));
    package Internal "Internal components that a user should usually not directly utilize"
      partial package PartialModelicaServices "Interfaces of components requiring a tool specific implementation"
        package Animation "Models and functions for 3-dim. animation"
          partial model PartialShape "Different visual shapes with variable size; all data have to be set as modifiers"
            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Frames;
            import Modelica.Mechanics.MultiBody.Types;
            parameter Types.ShapeType shapeType="box" "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring)";
            input Frames.Orientation R=Frames.nullRotation() "Orientation object to rotate the world frame into the object frame" annotation(Dialog);
            input SI.Position r[3]={0,0,0} "Position vector from origin of world frame to origin of object frame, resolved in world frame" annotation(Dialog);
            input SI.Position r_shape[3]={0,0,0} "Position vector from origin of object frame to shape origin, resolved in object frame" annotation(Dialog);
            input Real lengthDirection[3](each final unit="1")={1,0,0} "Vector in length direction, resolved in object frame" annotation(Dialog);
            input Real widthDirection[3](each final unit="1")={0,1,0} "Vector in width direction, resolved in object frame" annotation(Dialog);
            input SI.Length length=0 "Length of visual object" annotation(Dialog);
            input SI.Length width=0 "Width of visual object" annotation(Dialog);
            input SI.Length height=0 "Height of visual object" annotation(Dialog);
            input Types.ShapeExtra extra=0.0 "Additional size data for some of the shape types" annotation(Dialog);
            input Real color[3]={255,0,0} "Color of shape" annotation(Dialog);
            input Types.SpecularCoefficient specularCoefficient=0.7 "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog);
            annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Rectangle(extent={{-100,-100},{80,60}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Polygon(points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}}, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{100,100},{100,-60},{80,-100},{80,60},{100,100}}, lineColor={0,0,255}, fillColor={160,160,164}, fillPattern=FillPattern.Solid),Text(extent={{-100,-100},{80,60}}, lineColor={0,0,0}, textString="%shapeType"),Text(extent={{-132,160},{128,100}}, textString="%name", lineColor={0,0,255})}), Documentation(info="<html>

<p>
This model is documented at
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>.
</p>

</html>
"));
          end PartialShape;

        end Animation;

        annotation(Documentation(info="<html>

<p>
This package contains interfaces of a set of functions and models used in the
Modelica Standard Library that requires a <u>tool specific implementation</u>.
There is an associated package called <u>ModelicaServices</u>. A tool vendor
should provide a proper implementation of this library for the corresponding
tool. The default implementation is \"do nothing\".
In the Modelica Standard Library, the models and functions of ModelicaServices
are used.
</p>

</html>"));
      end PartialModelicaServices;

    end Internal;

  end Utilities;

  package Mechanics "Library of 1-dim. and 3-dim. mechanical components (multi-body, rotational, translational)"
    extends Modelica.Icons.Library2;
    annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-5,-40},{45,-70}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={192,192,192}),Ellipse(extent={{-90,-50},{-80,-60}}, lineColor={0,0,0}),Line(points={{-85,-55},{-60,-21}}, color={0,0,0}, thickness=0.5),Ellipse(extent={{-65,-16},{-55,-26}}, lineColor={0,0,0}),Line(points={{-60,-21},{9,-55}}, color={0,0,0}, thickness=0.5),Ellipse(extent={{4,-50},{14,-60}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{-10,-34},{72,-34},{72,-76},{-10,-76}}, color={0,0,0})}), Documentation(info="<HTML>
<p>
This package contains components to model the movement
of 1-dim. rotational, 1-dim. translational, and
3-dim. <b>mechanical systems</b>.
</p>
</HTML>
"));
    package MultiBody "Library to model 3-dimensional mechanical systems"
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Library;
      model World "World coordinate system + gravity field + default animation definition"
        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Types.GravityTypes;
        import Modelica.Mechanics.MultiBody.Types;
        Interfaces.Frame_b frame_b "Coordinate system fixed in the origin of the world frame" annotation(Placement(transformation(extent={{84,-16},{116,16}}, rotation=0)));
        parameter Boolean enableAnimation=true "= true, if animation of all components is enabled";
        parameter Boolean animateWorld=true "= true, if world coordinate system shall be visualized" annotation(Dialog(enable=enableAnimation));
        parameter Boolean animateGravity=true "= true, if gravity field shall be visualized (acceleration vector or field center)" annotation(Dialog(enable=enableAnimation));
        parameter Types.AxisLabel label1="x" "Label of horizontal axis in icon";
        parameter Types.AxisLabel label2="y" "Label of vertical axis in icon";
        parameter Types.GravityTypes gravityType=GravityTypes.UniformGravity "Type of gravity field" annotation(Evaluate=true);
        parameter SI.Acceleration g=9.81 "Constant gravity acceleration" annotation(Dialog(enable=gravityType == GravityTypes.UniformGravity));
        parameter Types.Axis n={0,-1,0} "Direction of gravity resolved in world frame (gravity = g*n/length(n))" annotation(Evaluate=true, Dialog(enable=gravityType == Modelica.Mechanics.MultiBody.Types.GravityTypes.UniformGravity));
        parameter Real mue(unit="m3/s2", min=0)=398600000000000.0 "Gravity field constant (default = field constant of earth)" annotation(Dialog(enable=gravityType == Types.GravityTypes.PointGravity));
        parameter Boolean driveTrainMechanics3D=true "= true, if 3-dim. mechanical effects of Parts.Mounting1D/Rotor1D/BevelGear1D shall be taken into account";
        parameter SI.Distance axisLength=nominalLength/2 "Length of world axes arrows" annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        parameter SI.Distance axisDiameter=axisLength/defaultFrameDiameterFraction "Diameter of world axes arrows" annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        parameter Boolean axisShowLabels=true "= true, if labels shall be shown" annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        input Types.Color axisColor_x=Modelica.Mechanics.MultiBody.Types.Defaults.FrameColor "Color of x-arrow" annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        input Types.Color axisColor_y=axisColor_x annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        input Types.Color axisColor_z=axisColor_x "Color of z-arrow" annotation(Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
        parameter SI.Position gravityArrowTail[3]={0,0,0} "Position vector from origin of world frame to arrow tail, resolved in world frame" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = UniformGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
        parameter SI.Length gravityArrowLength=axisLength/2 "Length of gravity arrow" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = UniformGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
        parameter SI.Diameter gravityArrowDiameter=gravityArrowLength/defaultWidthFraction "Diameter of gravity arrow" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = UniformGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
        input Types.Color gravityArrowColor={0,230,0} "Color of gravity arrow" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = UniformGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
        parameter SI.Diameter gravitySphereDiameter=12742000 "Diameter of sphere representing gravity center (default = mean diameter of earth)" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = PointGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity));
        input Types.Color gravitySphereColor={0,230,0} "Color of gravity sphere" annotation(Dialog(tab="Animation", group="if animateGravity = true and gravityType = PointGravity", enable=enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity));
        parameter SI.Length nominalLength=1 "\"Nominal\" length of multi-body system" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultAxisLength=nominalLength/5 "Default for length of a frame axis (but not world frame)" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultJointLength=nominalLength/10 "Default for the fixed length of a shape representing a joint" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultJointWidth=nominalLength/20 "Default for the fixed width of a shape representing a joint" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultForceLength=nominalLength/10 "Default for the fixed length of a shape representing a force (e.g. damper)" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultForceWidth=nominalLength/20 "Default for the fixed width of a shape represening a force (e.g. spring, bushing)" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultBodyDiameter=nominalLength/9 "Default for diameter of sphere representing the center of mass of a body" annotation(Dialog(tab="Defaults"));
        parameter Real defaultWidthFraction=20 "Default for shape width as a fraction of shape length (e.g., for Parts.FixedTranslation)" annotation(Dialog(tab="Defaults"));
        parameter SI.Length defaultArrowDiameter=nominalLength/40 "Default for arrow diameter (e.g., of forces, torques, sensors)" annotation(Dialog(tab="Defaults"));
        parameter Real defaultFrameDiameterFraction=40 "Default for arrow diameter of a coordinate system as a fraction of axis length" annotation(Dialog(tab="Defaults"));
        parameter Real defaultSpecularCoefficient(min=0)=0.7 "Default reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog(tab="Defaults"));
        parameter Real defaultN_to_m(unit="N/m", min=0)=1000 "Default scaling of force arrows (length = force/defaultN_to_m)" annotation(Dialog(tab="Defaults"));
        parameter Real defaultNm_to_m(unit="N.m/m", min=0)=1000 "Default scaling of torque arrows (length = torque/defaultNm_to_m)" annotation(Dialog(tab="Defaults"));
      protected 
        parameter Integer ndim=if enableAnimation and animateWorld then 1 else 0;
        parameter Integer ndim2=if enableAnimation and animateWorld and axisShowLabels then 1 else 0;
        parameter SI.Length headLength=min(axisLength, axisDiameter*Types.Defaults.FrameHeadLengthFraction);
        parameter SI.Length headWidth=axisDiameter*Types.Defaults.FrameHeadWidthFraction;
        parameter SI.Length lineLength=max(0, axisLength - headLength);
        parameter SI.Length lineWidth=axisDiameter;
        parameter SI.Length scaledLabel=Modelica.Mechanics.MultiBody.Types.Defaults.FrameLabelHeightFraction*axisDiameter;
        parameter SI.Length labelStart=1.05*axisLength;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowLine(shapeType="cylinder", length=lineLength, width=lineWidth, height=lineWidth, lengthDirection={1,0,0}, widthDirection={0,1,0}, color=axisColor_x, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowHead(shapeType="cone", length=headLength, width=headWidth, height=headWidth, lengthDirection={1,0,0}, widthDirection={0,1,0}, color=axisColor_x, r={lineLength,0,0}, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines x_label(lines=scaledLabel*{[0,0;1,1],[0,1;1,0]}, diameter=axisDiameter, color=axisColor_x, r_lines={labelStart,0,0}, n_x={1,0,0}, n_y={0,1,0}, specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowLine(shapeType="cylinder", length=lineLength, width=lineWidth, height=lineWidth, lengthDirection={0,1,0}, widthDirection={1,0,0}, color=axisColor_y, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowHead(shapeType="cone", length=headLength, width=headWidth, height=headWidth, lengthDirection={0,1,0}, widthDirection={1,0,0}, color=axisColor_y, r={0,lineLength,0}, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines y_label(lines=scaledLabel*{[0,0;1,1.5],[0,1.5;0.5,0.75]}, diameter=axisDiameter, color=axisColor_y, r_lines={0,labelStart,0}, n_x={0,1,0}, n_y={-1,0,0}, specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowLine(shapeType="cylinder", length=lineLength, width=lineWidth, height=lineWidth, lengthDirection={0,0,1}, widthDirection={0,1,0}, color=axisColor_z, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowHead(shapeType="cone", length=headLength, width=headWidth, height=headWidth, lengthDirection={0,0,1}, widthDirection={0,1,0}, color=axisColor_z, r={0,0,lineLength}, specularCoefficient=0) if enableAnimation and animateWorld;
        Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines z_label(lines=scaledLabel*{[0,0;1,0],[0,1;1,1],[0,1;1,0]}, diameter=axisDiameter, color=axisColor_z, r_lines={0,0,labelStart}, n_x={0,0,1}, n_y={0,1,0}, specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;
        parameter SI.Length gravityHeadLength=min(gravityArrowLength, gravityArrowDiameter*Types.Defaults.ArrowHeadLengthFraction);
        parameter SI.Length gravityHeadWidth=gravityArrowDiameter*Types.Defaults.ArrowHeadWidthFraction;
        parameter SI.Length gravityLineLength=max(0, gravityArrowLength - gravityHeadLength);
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowLine(shapeType="cylinder", length=gravityLineLength, width=gravityArrowDiameter, height=gravityArrowDiameter, lengthDirection=n, widthDirection={0,1,0}, color=gravityArrowColor, r_shape=gravityArrowTail, specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowHead(shapeType="cone", length=gravityHeadLength, width=gravityHeadWidth, height=gravityHeadWidth, lengthDirection=n, widthDirection={0,1,0}, color=gravityArrowColor, r_shape=gravityArrowTail + Modelica.Math.Vectors.normalize(n)*gravityLineLength, specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;
        parameter Integer ndim_pointGravity=if enableAnimation and animateGravity and gravityType == 2 then 1 else 0;
        Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravitySphere(shapeType="sphere", r_shape={-gravitySphereDiameter/2,0,0}, lengthDirection={1,0,0}, length=gravitySphereDiameter, width=gravitySphereDiameter, height=gravitySphereDiameter, color=gravitySphereColor, specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity;
        function gravityAcceleration= gravityAccelerationTypes(gravityType=gravityType, g=g*Modelica.Math.Vectors.normalize(n), mue=mue);
      protected 
        function gravityAccelerationTypes "Gravity field acceleration depending on field type and position"
          import Modelica.Mechanics.MultiBody.Types.GravityTypes;
          extends Modelica.Icons.Function;
          input SI.Position r[3] "Position vector from world frame to actual point, resolved in world frame";
          input GravityTypes gravityType "Type of gravity field";
          input SI.Acceleration g[3] "Constant gravity acceleration, resolved in world frame, if gravityType=1";
          input Real mue(unit="m3/s2") "Field constant of point gravity field, if gravityType=2";
          output SI.Acceleration gravity[3] "Gravity acceleration at point r, resolved in world frame";
        algorithm 
          gravity:=if gravityType == GravityTypes.UniformGravity then g else if gravityType == GravityTypes.PointGravity then -mue/(r*r)*(r/Modelica.Math.Vectors.length(r)) else zeros(3);
        end gravityAccelerationTypes;

      equation 
        Connections.root(frame_b.R);
        assert(Modelica.Math.Vectors.length(n) > 1e-10, "Parameter n of World object is wrong (lenght(n) > 0 required)");
        frame_b.r_0=zeros(3);
        frame_b.R=Frames.nullRotation();
        annotation(defaultComponentName="world", defaultComponentPrefixes="inner", missingInnerMessage="No \"world\" component is defined. A default world
component with the default gravity field will be used
(g=9.81 in negative y-axis). If this is not desired,
drag Modelica.Mechanics.MultiBody.World into the top level of your model.", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{-100,-118},{-100,61}}, color={0,0,0}, thickness=0.5),Polygon(points={{-100,100},{-120,60},{-80,60},{-100,100},{-100,100}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{-119,-100},{59,-100}}, color={0,0,0}, thickness=0.5),Polygon(points={{99,-100},{59,-80},{59,-120},{99,-100}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(extent={{-140,165},{140,103}}, textString="%name", lineColor={0,0,255}),Text(extent={{95,-113},{144,-162}}, lineColor={0,0,0}, textString="%label1"),Text(extent={{-170,127},{-119,77}}, lineColor={0,0,0}, textString="%label2"),Line(points={{-56,78},{-56,-26}}, color={0,0,255}),Polygon(points={{-68,-26},{-56,-66},{-44,-26},{-68,-26}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Line(points={{2,78},{2,-26}}, color={0,0,255}),Polygon(points={{-10,-26},{2,-66},{14,-26},{-10,-26}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Line(points={{66,80},{66,-26}}, color={0,0,255}),Polygon(points={{54,-26},{66,-66},{78,-26},{54,-26}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics), Documentation(info="<HTML>
<p>
Model <b>World</b> represents a global coordinate system fixed in
ground. This model serves several purposes:
<ul>
<li> It is used as <b>inertial system</b> in which
     the equations of all elements of the MultiBody library
     are defined.</li>
<li> It is the world frame of an <b>animation window</b> in which
     all elements of the MultiBody library are visualized.</li>
<li> It is used to define the <b>gravity field</b> in which a
     multi-body model is present. Default is a uniform gravity
     field where the gravity acceleration vector g is the
     same at every position. Additionally, a point gravity field
     can be selected.</li>
<li> It is used to define <b>default settings</b> of animation properties
     (e.g. the diameter of a sphere representing by default
     the center of mass of a body, or the diameters of the cylinders
     representing a revolute joint).</li>
<li> It is used to define a <b>visual representation</b> of the
     world model (= 3 coordinate axes with labels) and of the defined
     gravity field.<br>
    <IMG SRC=\"../../Images/MultiBody/world.png\" ALT=\"MultiBodys.World\">
</li>
</ul>
<p>
Since the gravity field function is required from all bodies with mass
and the default settings of animation properties are required
from nearly every component, exactly one instance of model World needs
to be present in every model on the top level. The basic declaration
needs to be:
</p>
<pre>
    <b>inner</b> Modelica.Mechanics.MultiBody.World world
</pre>
<p>
Note, it must be an <b>inner</b> declaration with instance name <b>world</b>
in order that this world object can be accessed from all objects in the
model. When dragging the \"World\" object from the package browser into
the diagram layer, this declaration is automatically generated
(this is defined via annotations in model World).
</p>
<p>
All vectors and tensors of a mechanical system are resolved in a
frame that is local to the corresponding component. Usually,
if all relative joint coordinates vanish, the local frames
of all components are parallel to each other, as well as to the
world frame (this holds as long as a Parts.FixedRotation,
component is <b>not</b> used). In this \"reference configuration\"
it is therefore
alternatively possible to resolve all vectors in the world
frame, since all frames are parallel to each other.
This is often very convenient. In order to give some visual
support in such a situation, in the icon of a World instance
two axes of the world frame are shown and the labels
of these axes can be set via parameters.
</p>
</HTML>
"));
      end World;

      annotation(Documentation(info="<HTML>
<p>
Library <b>MultiBody</b> is a <b>free</b> Modelica package providing
3-dimensional mechanical components to model in a convenient way
<b>mechanical systems</b>, such as robots, mechanisms, vehicles.
Typical animations generated with this library are shown
in the next figure:
</p>
<p>
<img src=\"../../Images/MultiBody/MultiBody.png\">
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Mechanics.MultiBody.UsersGuide\">MultiBody.UsersGuide</a>
     discusses the most important aspects how to use this library.</li>
<li> <a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples\">MultiBody.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</HTML>"));
      package Visualizers "3-dimensional visual objects used for animation"
        extends Modelica.Icons.Library;
        package Advanced "Visualizers that require basic knowledge about Modelica in order to use them"
          extends Modelica.Icons.Library;
          model Shape "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"
            extends Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;
            extends ModelicaServices.Animation.Shape;
            annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Rectangle(extent={{-100,-100},{80,60}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Polygon(points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}}, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{100,100},{100,-60},{80,-100},{80,60},{100,100}}, lineColor={0,0,255}, fillColor={160,160,164}, fillPattern=FillPattern.Solid),Text(extent={{-100,-100},{80,60}}, lineColor={0,0,0}, textString="%shapeType"),Text(extent={{-132,160},{128,100}}, textString="%name", lineColor={0,0,255})}), Documentation(info="<HTML>
<p>
Model <b>Shape</b> defines a visual shape that is
shown at the location of its reference coordinate system, called
'object frame' below. All describing variables such
as size and color can vary dynamically (with the only exception
of parameter shapeType). The default equations in the
declarations should be modified by providing appropriate equations.
Model <b>Shape</b> is usually used as a basic building block to
implement simpler to use graphical components.
</p>
<p>
The following shapes are supported via
parameter <b>shapeType</b> (e.g., shapeType=\"box\"):<br>&nbsp;
</p>
<IMG SRC=\"../../Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the Shape component.
</p>
<p>
Additionally, external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found either in the current
directory or in the directory where the Shape instance is stored
that references the DXF file.
</p>

<p>
Via input variable <b>extra</b> additional sizing data is defined
according to:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of variable <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the gear.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>

<p>
Parameter <b>color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
The predefined type <b>MultiBody.Types.Color</b> contains
a menu definition of the colors used in the MultiBody
library (will be replaced by a color editor).
</p>

<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where a <b>Shape</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.Shape shape(length = sin(time));
</pre>
</HTML>
"));
          end Shape;

          annotation(Documentation(info="<HTML>
<p>
Package <b>Visualizers.Advanced</b> contains components to visualize
3-dimensional shapes with dynamical sizes. None of the components
has a frame connector. The position and orientation is set via
modifiers. Basic knowledge of Modelica
is needed in order to utilize the components of this package.
These components have also to be used for models,
where the forces and torques in the frame connector are set via
equations (in this case, the models of the Visualizers package cannot be used,
since they all have frame connectors).
<p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Arrow\">Arrow</a></td>
      <td valign=\"top\">Visualizing an arrow where all parts of the arrow can vary dynamically:<br>
      <IMG SRC=\"../../Images/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.DoubleArrow\">DoubleArrow</a></td>
      <td valign=\"top\">Visualizing a double arrow where all parts of the arrow can vary dynamically:<br>
      <IMG SRC=\"../../Images/MultiBody/Visualizers/DoubleArrow.png\" ALT=\"model Visualizers.Advanced.DoubleArrow\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Shape</a></td>
      <td valign=\"top\">Animation shape of a part with dynamically varying sizes.
      The following shape types are supported:<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.Advanced.Shape\">
      </td>
  </tr>
</table>
</HTML>"));
        end Advanced;

        package Internal "Visualizers that will be replaced by improved versions in the future (don't use them)"
          extends Modelica.Icons.Library;
          model Lines "Visualizing a set of lines as cylinders with variable size, e.g., used to display characters (no Frame connector)"
            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;
            import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
            input Modelica.Mechanics.MultiBody.Frames.Orientation R=Frames.nullRotation() "Orientation object to rotate the world frame into the object frame" annotation(Dialog);
            input SI.Position r[3]={0,0,0} "Position vector from origin of world frame to origin of object frame, resolved in world frame" annotation(Dialog);
            input SI.Position r_lines[3]={0,0,0} "Position vector from origin of object frame to the origin of 'lines' frame, resolved in object frame" annotation(Dialog);
            input Real n_x[3](each final unit="1")={1,0,0} "Vector in direction of x-axis of 'lines' frame, resolved in object frame" annotation(Dialog);
            input Real n_y[3](each final unit="1")={0,1,0} "Vector in direction of y-axis of 'lines' frame, resolved in object frame" annotation(Dialog);
            input SI.Position lines[:,2,2]=zeros(0, 2, 2) "List of start and end points of cylinders resolved in an x-y frame defined by n_x, n_y, e.g., {[0,0;1,1], [0,1;1,0], [2,0; 3,1]}" annotation(Dialog);
            input SI.Length diameter(min=0)=0.05 "Diameter of the cylinders defined by lines" annotation(Dialog);
            input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255} "Color of cylinders" annotation(Dialog);
            input Types.SpecularCoefficient specularCoefficient=0.7 "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog);
          protected 
            parameter Integer n=size(lines, 1) "Number of cylinders";
            T.Orientation R_rel=T.from_nxy(n_x, n_y);
            T.Orientation R_lines=T.absoluteRotation(R.T, R_rel);
            Modelica.SIunits.Position r_abs[3]=r + T.resolve1(R.T, r_lines);
            Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinders[n](each shapeType="cylinder", lengthDirection=array(T.resolve1(R_rel, vector([lines[i,2,:] - lines[i,1,:];0])) for i in 1:n), length=array(Modelica.Math.Vectors.length(lines[i,2,:] - lines[i,1,:]) for i in 1:n), r=array(r_abs + T.resolve1(R_lines, vector([lines[i,1,:];0])) for i in 1:n), each width=diameter, each height=diameter, each widthDirection={0,1,0}, each color=color, each R=R, each specularCoefficient=specularCoefficient);
            annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={128,128,128}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Polygon(points={{-24,-34},{-82,40},{-72,46},{-14,-26},{-24,-34}}, lineColor={0,127,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid),Polygon(points={{-82,-24},{-20,46},{-10,38},{-72,-32},{-82,-24}}, lineColor={0,127,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid),Polygon(points={{42,-18},{10,40},{20,48},{50,-6},{42,-18}}, lineColor={0,127,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid),Polygon(points={{10,-68},{84,48},{96,42},{24,-72},{10,-68}}, lineColor={0,127,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid),Text(extent={{-140,164},{148,102}}, textString="%name", lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics), Documentation(info="<HTML>
<p>
With model <b>Lines</b> a set of dynamic lines is defined
that are located relatively to frame_a. Every line
is represented by a cylinder. This allows, e.g., to define simple shaped
3-dimensional characters. Note, if the lines are fixed relatively to frame_a,
it is more convenient to use model <b>Visualizers.FixedLines</b>.
An example for dynamic lines is shown in the following figure:<br>&nbsp;
</p>
<IMG SRC=\"../../Images/MultiBody/FixedLines.png\" ALT=\"model Visualizers.FixedLines\">
<p>&nbsp;<br>
The two letters \"x\" and \"y\" are constructed with 4 lines
by providing the following data for input variable <b>lines</b>
</p>
<pre>
   lines = {[0, 0; 1, 1],[0, 1; 1, 0],[1.5, -0.5; 2.5, 1],[1.5, 1; 2, 0.25]}
</pre>
<p>
Via vectors <b>n_x</b> and <b>n_y</b> a two-dimensional
coordinate system is defined. The points defined with variable
<b>lines</b> are with respect to this coordinate system. For example
\"[0, 0; 1, 1]\" defines a line that starts at {0,0} and ends at {1,1}.
The diameter and color of all line cylinders are identical
and are defined by parameters.
</p>

</HTML>
"));
          end Lines;

          annotation(Documentation(info="<html>
<p>
This package contains components to construct 3-dim. fonts
with \"cylinder\" elements for the animation window.
This is just a temporary hack until 3-dim. fonts are supported in
Modelica tools. The components are used to construct the \"x\", \"y\",
\"z\" labels of coordinates systems in the animation.
</p>
</html>"));
        end Internal;

        annotation(Documentation(info="<HTML>
<p>
Package <b>Visualizers</b> contains components to visualize
3-dimensional shapes. These components are the basis for the
animation features of the MultiBody library.
<p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">FixedShape</a><br>
             <a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape2\">FixedShape2</a></td>
      <td valign=\"top\">Animation shape of a part with fixed sizes. FixedShape2 has additionally
          a frame_b for easier connection to further visual objects.
          The following shape types are supported:<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.FixedShape\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedFrame\">FixedFrame</a></td>
      <td valign=\"top\">Visualizing a coordinate system including axes labels with fixed sizes:<br>
      <IMG SRC=\"../../Images/MultiBody/FixedFrame2.png\"
       ALT=\"model Visualizers.FixedFrame\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedArrow\">FixedArrow</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.SignalArrow\">SignalArrow</a></td>
      <td valign=\"top\">Visualizing an arrow. Model \"FixedArrow\" provides
      a fixed sized arrow, model \"SignalArrow\" provides
      an arrow with dynamically varying length that is defined
      by an input signal vector:<br>
      <IMG SRC=\"../../Images/MultiBody/Visualizers/Arrow.png\" \">
      </td>
  </tr>
<tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced\">Advanced</a></td>
      <td valign=\"top\"> <b>Package</b> that contains components to visualize
          3-dimensional shapes where all parts of the shape
          can vary dynamically. Basic knowledge of Modelica is
          needed in order to utilize the components of this package.
      </td>
  </tr>
</table>
<p>
The colors of the visualization components are declared with
the predefined type <b>MultiBody.Types.Color</b>.
This is a vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given as Integer[3] in the ranges 0 .. 255,
respectively.
</p>
</HTML>"));
      end Visualizers;

      package Types "Constants and types with choices, especially to build menus"
        extends Modelica.Icons.Library;
        type Axis= Modelica.Icons.TypeReal[3](each final unit="1") "Axis vector with choices for menus" annotation(preferedView="text", Evaluate=true, choices(choice={1,0,0} "{1,0,0} \"x axis\"", choice={0,1,0} "{0,1,0} \"y axis\"", choice={0,0,1} "{0,0,1} \"z axis\"", choice={-1,0,0} "{-1,0,0} \"negative x axis\"", choice={0,-1,0} "{0,-1,0} \"negative y axis\"", choice={0,0,-1} "{0,0,-1} \"negative z axis\""), Documentation(info="<html>
</html>"));
        type AxisLabel= Modelica.Icons.TypeString "Label of axis with choices for menus" annotation(preferedView="text", choices(choice="x" "x", choice="y" "y", choice="z" "z"));
        type RotationSequence= Modelica.Icons.TypeInteger[3](min={1,1,1}, max={3,3,3}) "Sequence of planar frame rotations with choices for menus" annotation(preferedView="text", Evaluate=true, choices(choice={1,2,3} "{1,2,3} \"Cardan/Tait-Bryan angles\"", choice={3,1,3} "{3,1,3} \"Euler angles\"", choice={3,2,1} "{3,2,1}"));
        type Color= Modelica.Icons.TypeInteger[3](each min=0, each max=255) "RGB representation of color (will be improved with a color editor)" annotation(Dialog(colorSelector), choices(choice={0,0,0} "{0,0,0}       \"black\"", choice={155,0,0} "{155,0,0}     \"dark red\"", choice={255,0,0} "{255,0,0 }    \"red\"", choice={255,65,65} "{255,65,65}   \"light red\"", choice={0,128,0} "{0,128,0}     \"dark green\"", choice={0,180,0} "{0,180,0}     \"green\"", choice={0,230,0} "{0,230,0}     \"light green\"", choice={0,0,200} "{0,0,200}     \"dark blue\"", choice={0,0,255} "{0,0,255}     \"blue\"", choice={0,128,255} "{0,128,255}   \"light blue\"", choice={255,255,0} "{255,255,0}   \"yellow\"", choice={255,0,255} "{255,0,255}   \"pink\"", choice={100,100,100} "{100,100,100} \"dark grey\"", choice={155,155,155} "{155,155,155} \"grey\"", choice={255,255,255} "{255,255,255} \"white\""), Documentation(info="<html>
<p>
Type <b>Color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of a shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
</p>
</html>"));
        type SpecularCoefficient= Modelica.Icons.TypeReal "Reflection of ambient light (= 0: light is completely absorbed)" annotation(min=0, choices(choice=0 "\"0.0 (dull)\"", choice=0.7 "\"0.7 (medium)\"", choice=1 "\"1.0 (glossy)\""), Documentation(info="<html>
<p>
Type <b>SpecularCoefficient</b> defines the reflection of
ambient light on shape surfaces. If value = 0, the light
is completely absorbed. Often, 0.7 is a reasonable value.
It might be that from some viewing directions, a body is no
longer visible, if the SpecularCoefficient value is too high.
In the following image, the different values of SpecularCoefficient
are shown for a cylinder:
</p>

<p>
<img src=\"../Images/MultiBody/Visualizers/SpecularCoefficient.png\"
</p>
</html>"));
        type ShapeType= Modelica.Icons.TypeString "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, dxf-file)" annotation(choices(choice="box" "\"box\"", choice="sphere" "\"sphere\"", choice="cylinder" "\"cylinder\"", choice="pipecylinder" "\"pipecylinder\"", choice="cone" "\"cone\"", choice="pipe" "\"pipe\"", choice="beam" "\"beam\"", choice="gearwheel" "\"gearwheel\"", choice="spring" "\"spring\"", choice="1" "File \"1.dxf\" in current directory", choice="2" "File \"2.dxf\" in current directory", choice="3" "File \"3.dxf\" in current directory", choice="4" "File \"4.dxf\" in current directory", choice="5" "File \"5.dxf\" in current directory", choice="6" "File \"6.dxf\" in current directory", choice="7" "File \"7.dxf\" in current directory", choice="8" "File \"8.dxf\" in current directory", choice="9" "File \"9.dxf\" in current directory"), Documentation(info="<html>
<p>
Type <b>ShapeType</b> is used to define the shape of the
visual object as parameter String. Usually, \"shapeType\" is used
as instance name. The following
values for shapeType are possible, e.g., shapeType=\"box\":
</p>
<IMG SRC=\"../Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the Shape component.
</p>
<p>
Additionally, external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found either in the current
directory or in the directory where the Shape instance is stored
that references the DXF file.
</p>
</html>"));
        type ShapeExtra= Modelica.Icons.TypeReal "Reflection of ambient light (= 0: light is completely absorbed)" annotation(min=0, Documentation(info="<html>
<p>
This type is used in shapes of visual objects to define
extra data depending on the shape type. Usually, input
variable <b>extra</b> is used as instance name:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of variable <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the gear.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>
</html>"));
        type GravityTypes= enumeration(NoGravity "No gravity field", UniformGravity "Uniform gravity field", PointGravity "Point gravity field") "Enumeration defining the type of the gravity field" annotation(Documentation(info="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.GravityTypes.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">NoGravity</td>
    <td valign=\"top\">No gravity field</td></tr>

<tr><td valign=\"top\">UniformGravity</td>
    <td valign=\"top\">Gravity field is described by a vector of constant gravity acceleration</td></tr>

<tr><td valign=\"top\">PointGravity</td>
    <td valign=\"top\">Central gravity field. The gravity acceleration vector is directed to
        the field center and the gravity is proportional to 1/r^2, where
        r is the distance to the field center.</td></tr>
</table>
</html>"));
        package Defaults "Default settings of the MultiBody library via constants"
          extends Modelica.Icons.Library;
          constant Types.Color BodyColor={0,128,255} "Default color for body shapes that have mass (light blue)";
          constant Types.Color RodColor={155,155,155} "Default color for massless rod shapes (grey)";
          constant Types.Color JointColor={255,0,0} "Default color for elementary joints (red)";
          constant Types.Color ForceColor={0,128,0} "Default color for force arrow (dark green)";
          constant Types.Color TorqueColor={0,128,0} "Default color for torque arrow (dark green)";
          constant Types.Color SpringColor={0,0,255} "Default color for a spring (blue)";
          constant Types.Color SensorColor={255,255,0} "Default color for sensors (yellow)";
          constant Types.Color FrameColor={0,0,0} "Default color for frame axes and labels (black)";
          constant Types.Color ArrowColor={0,0,255} "Default color for arrows and double arrows (blue)";
          constant Real FrameHeadLengthFraction=5.0 "Frame arrow head length / arrow diameter";
          constant Real FrameHeadWidthFraction=3.0 "Frame arrow head width / arrow diameter";
          constant Real FrameLabelHeightFraction=3.0 "Height of frame label / arrow diameter";
          constant Real ArrowHeadLengthFraction=4.0 "Arrow head length / arrow diameter";
          constant Real ArrowHeadWidthFraction=3.0 "Arrow head width / arrow diameter";
          constant SI.Diameter BodyCylinderDiameterFraction=3 "Default for body cylinder diameter as a fraction of body sphere diameter";
          constant Real JointRodDiameterFraction=2 "Default for rod diameter as a fraction of joint sphere diameter attached to rod";
          annotation(Documentation(info="<html>
<p>
This package contains constants used as default setting
in the MultiBody library.
</p>
</html>"));
        end Defaults;

        annotation(Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used in the
MultiBody library. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"));
      end Types;

      package Parts "Rigid components such as bodies with mass and inertia and massless rods"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;
        model FixedTranslation "Fixed translation of frame_b with respect to frame_a"
          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(Placement(transformation(extent={{-116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(Placement(transformation(extent={{84,-16},{116,16}}, rotation=0)));
          parameter Boolean animation=true "= true, if animation shall be enabled";
          parameter SI.Position r[3](start={0,0,0}) "Vector from frame_a to frame_b resolved in frame_a";
          parameter Types.ShapeType shapeType="cylinder" " Type of shape" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position r_shape[3]={0,0,0} " Vector from frame_a to shape origin, resolved in frame_a" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.Axis lengthDirection=r - r_shape " Vector in length direction of shape, resolved in frame_a" annotation(Evaluate=true, Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.Axis widthDirection={0,1,0} " Vector in width direction of shape, resolved in frame_a" annotation(Evaluate=true, Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Length length=Modelica.Math.Vectors.length(r - r_shape) " Length of shape" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance width=length/world.defaultWidthFraction " Width of shape" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance height=width " Height of shape." annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.ShapeExtra extra=0.0 " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)." annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor " Color of shape" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient=world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
        protected 
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape(shapeType=shapeType, color=color, specularCoefficient=specularCoefficient, r_shape=r_shape, lengthDirection=lengthDirection, widthDirection=widthDirection, length=length, width=width, height=height, extra=extra, r=frame_a.r_0, R=frame_a.R) if world.enableAnimation and animation;
        equation 
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0 or cardinality(frame_b) > 0, "Neither connector frame_a nor frame_b of FixedTranslation object is connected");
          frame_b.r_0=frame_a.r_0 + Frames.resolve1(frame_a.R, r);
          frame_b.R=frame_a.R;
          zeros(3)=frame_a.f + frame_b.f;
          zeros(3)=frame_a.t + frame_b.t + cross(r, frame_b.f);
          annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Rectangle(extent={{-99,5},{101,-5}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(extent={{-131,101},{129,41}}, textString="%name", lineColor={0,0,255}),Text(extent={{127,-72},{-133,-22}}, lineColor={0,0,0}, textString="%=r"),Text(extent={{-89,38},{-53,13}}, lineColor={128,128,128}, textString="a"),Text(extent={{57,39},{93,14}}, lineColor={128,128,128}, textString="b")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Rectangle(extent={{-100,5},{100,-5}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{-95,20},{-58,20}}, color={128,128,128}, arrow={Arrow.None,Arrow.Filled}),Line(points={{-94,18},{-94,50}}, color={128,128,128}, arrow={Arrow.None,Arrow.Filled}),Text(extent={{-72,35},{-58,24}}, lineColor={128,128,128}, textString="x"),Text(extent={{-113,57},{-98,45}}, lineColor={128,128,128}, textString="y"),Line(points={{-100,-4},{-100,-69}}, color={128,128,128}),Line(points={{-100,-63},{90,-63}}, color={128,128,128}),Text(extent={{-22,-39},{16,-63}}, lineColor={128,128,128}, textString="r"),Polygon(points={{88,-59},{88,-68},{100,-63},{88,-59}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{100,-3},{100,-68}}, color={128,128,128}),Line(points={{69,20},{106,20}}, color={128,128,128}, arrow={Arrow.None,Arrow.Filled}),Line(points={{70,18},{70,50}}, color={128,128,128}, arrow={Arrow.None,Arrow.Filled}),Text(extent={{92,35},{106,24}}, lineColor={128,128,128}, textString="x"),Text(extent={{51,57},{66,45}}, lineColor={128,128,128}, textString="y")}), Documentation(info="<HTML>
<p>
Component for a <b>fixed translation</b> of frame_b with respect
to frame_a, i.e., the relationship between connectors frame_a and frame_b
remains constant and frame_a is always <b>parallel</b> to frame_b.
</p>
<p>
By default, this component is visualized by a cylinder connecting
frame_a and frame_b, as shown in the figure below. Note, that the
two visualized frames are not part of the component animation and that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../../Images/MultiBody/FixedTranslation.png\" ALT=\"Parts.FixedTranslation\">
</HTML>"));
        end FixedTranslation;

        model Body "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"
          import SI = Modelica.SIunits;
          import C = Modelica.Constants;
          import Modelica.Math.*;
          import Modelica.Mechanics.MultiBody.Types;
          import Modelica.Mechanics.MultiBody.Frames;
          Interfaces.Frame_a frame_a "Coordinate system fixed at body" annotation(Placement(transformation(extent={{-116,-16},{-84,16}}, rotation=0)));
          parameter Boolean animation=true "= true, if animation shall be enabled (show cylinder and sphere)";
          parameter SI.Position r_CM[3](start={0,0,0}) "Vector from frame_a to center of mass, resolved in frame_a";
          parameter SI.Mass m(min=0, start=1) "Mass of rigid body";
          parameter SI.Inertia I_11(min=0)=0.001 " (1,1) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_22(min=0)=0.001 " (2,2) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_33(min=0)=0.001 " (3,3) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_21(min=-C.inf)=0 " (2,1) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_31(min=-C.inf)=0 " (3,1) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_32(min=-C.inf)=0 " (3,2) element of inertia tensor" annotation(Dialog(group="Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          SI.Position r_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          parameter Boolean angles_fixed=false "= true, if angles_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0} "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b" annotation(Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3} "Sequence of rotations to rotate frame_a into frame_b at initial time" annotation(Evaluate=true, Dialog(tab="Initialization"));
          parameter Boolean w_0_fixed=false "= true, if w_0_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(Dialog(tab="Initialization"));
          parameter Boolean z_0_fixed=false "= true, if z_0_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(Dialog(tab="Initialization"));
          parameter SI.Diameter sphereDiameter=world.defaultBodyDiameter "Diameter of sphere" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of sphere" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Diameter cylinderDiameter=sphereDiameter/Types.Defaults.BodyCylinderDiameterFraction "Diameter of cylinder" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color cylinderColor=sphereColor "Color of cylinder" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient=world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Boolean enforceStates=false " = true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(Evaluate=true, Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(Evaluate=true, Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3} " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(Evaluate=true, Dialog(tab="Advanced", enable=not useQuaternions));
          final parameter SI.Inertia I[3,3]=[I_11,I_21,I_31;I_21,I_22,I_32;I_31,I_32,I_33] "inertia tensor";
          final parameter Frames.Orientation R_start=Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start, zeros(3)) "Orientation object from world frame to frame_a at initial time";
          final parameter SI.AngularAcceleration z_a_start[3]=Frames.resolve2(R_start, z_0_start) "Initial values of angular acceleration z_a = der(w_a), i.e., time derivative of angular velocity resolved in frame_a";
          SI.AngularVelocity w_a[3](start=Frames.resolve2(R_start, w_0_start), fixed=fill(w_0_fixed, 3), stateSelect=if enforceStates then if useQuaternions then StateSelect.always else StateSelect.never else StateSelect.avoid) "Absolute angular velocity of frame_a resolved in frame_a";
          SI.AngularAcceleration z_a[3](start=Frames.resolve2(R_start, z_0_start), fixed=fill(z_0_fixed, 3)) "Absolute angular acceleration of frame_a resolved in frame_a";
          SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
        protected 
          outer Modelica.Mechanics.MultiBody.World world;
          parameter Frames.Quaternions.Orientation Q_start=Frames.to_Q(R_start) "Quaternion orientation object from world frame to frame_a at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, stateSelect=if enforceStates then if useQuaternions then StateSelect.prefer else StateSelect.never else StateSelect.avoid) "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";
          parameter SI.Angle phi_start[3]=if sequence_start[1] == sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2] and sequence_start[3] == sequence_angleStates[3] then angles_start else Frames.axesRotationsAngles(R_start, sequence_angleStates) "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, stateSelect=if enforceStates then if useQuaternions then StateSelect.never else StateSelect.always else StateSelect.avoid) "Dummy or 3 angles to rotate world frame into frame_a of body";
          SI.AngularVelocity phi_d[3](stateSelect=if enforceStates then if useQuaternions then StateSelect.never else StateSelect.always else StateSelect.avoid) "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";
          Visualizers.Advanced.Shape cylinder(shapeType="cylinder", color=cylinderColor, specularCoefficient=specularCoefficient, length=if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*sphereDiameter then sphereDiameter/2 else 0) else 0, width=cylinderDiameter, height=cylinderDiameter, lengthDirection=r_CM, widthDirection={0,1,0}, r=frame_a.r_0, R=frame_a.R) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape sphere(shapeType="sphere", color=sphereColor, specularCoefficient=specularCoefficient, length=sphereDiameter, width=sphereDiameter, height=sphereDiameter, lengthDirection={1,0,0}, widthDirection={0,1,0}, r_shape=r_CM - {1,0,0}*sphereDiameter/2, r=frame_a.r_0, R=frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
        initial equation 
          if angles_fixed then
            if not Connections.isRoot(frame_a.R) then
              zeros(3)=Frames.Orientation.equalityConstraint(frame_a.R, R_start);
            elseif useQuaternions then
              zeros(3)=Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
            else
              phi=phi_start;
            end if;
          end if;
        equation 
          if enforceStates then
            Connections.root(frame_a.R);
          else
            Connections.potentialRoot(frame_a.R);
          end if;
          r_0=frame_a.r_0;
          if not Connections.isRoot(frame_a.R) then
            Q={0,0,0,1};
            phi=zeros(3);
            phi_d=zeros(3);
            phi_dd=zeros(3);
          elseif useQuaternions then
            frame_a.R=Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
            {0}=Frames.Quaternions.orientationConstraint(Q);
            phi=zeros(3);
            phi_d=zeros(3);
            phi_dd=zeros(3);
          else
            phi_d=der(phi);
            phi_dd=der(phi_d);
            frame_a.R=Frames.axesRotations(sequence_angleStates, phi, phi_d);
            Q={0,0,0,1};
          end if;
          g_0=world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R, r_CM));
          v_0=der(frame_a.r_0);
          a_0=der(v_0);
          w_a=Frames.angularVelocity2(frame_a.R);
          z_a=der(w_a);
          frame_a.f=m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM)));
          frame_a.t=I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f);
          annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Rectangle(extent={{-100,30},{-3,-31}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={0,127,255}),Text(extent={{131,-123},{-129,-73}}, lineColor={0,0,0}, textString="m=%m"),Text(extent={{-128,132},{132,72}}, textString="%name", lineColor={0,0,255}),Ellipse(extent={{-20,60},{100,-60}}, lineColor={0,0,0}, fillPattern=FillPattern.Sphere, fillColor={0,127,255})}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics), Documentation(info="<HTML>
<p>
<b>Rigid body</b> with mass and inertia tensor.
All parameter vectors have to be resolved in frame_a.
The <b>inertia tensor</b> has to be defined with respect to a
coordinate system that is parallel to frame_a with the
origin at the center of mass of the body.
</p>
<p>
By default, this component is visualized by a <b>cylinder</b> located
between frame_a and the center of mass and by a <b>sphere</b> that has
its center at the center of mass. If the cylinder length is smaller as
the radius of the sphere, e.g., since frame_a is located at the
center of mass, the cylinder is not displayed. Note, that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../../Images/MultiBody/Body.png\" ALT=\"Parts.Body\">
<p>
<b>States of Body Components</b>
</p>
<p>
Every body has potential states. If possible a tool will select
the states of joints and not the states of bodies because this is
usually the most efficient choice. In this case the position, orientation,
velocity and angular velocity of frame_a of the body will be computed
by the component that is connected to frame_a. However, if a body is moving
freely in space, variables of the body have to be used as states. The potential
states of the body are:
</p>
<ul>
<li> The <b>position vector</b> frame_a.r_0 from the origin of the
     world frame to the origin of frame_a of the body, resolved in
     the world frame and the <b>absolute velocity</b> v_0 of the origin of
     frame_a, resolved in the world frame (= der(frame_a.r_0)).</li>
</li>
<li> If parameter <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>true</b> (this is the default), then <b>4 quaternions</b>
     are potential states. Additionally, the coordinates of the
     absolute angular velocity vector of the
     body are 3 potential states.<br>
     If <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>false</b>, then <b>3 angles</b> and the derivatives of
     these angles are potential states. The orientation of frame_a
     is computed by rotating the world frame along the axes defined
     in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
     the Cardan angle sequence) around the angles used as potential states.
     For example, the default is to rotate the x-axis of the world frame
     around angles[1], the new y-axis around angles[2] and the new z-axis
     around angles[3], arriving at frame_a.
 </li>
</ul>
<p>
The quaternions have the slight disadvantage that there is a
non-linear constraint equation between the 4 quaternions.
Therefore, at least one non-linear equation has to be solved
during simulation. A tool might, however, analytically solve this
simple constraint equation. Using the 3 angles as states has the
disadvantage that there is a singular configuration in which a
division by zero will occur. If it is possible to determine in advance
for an application class that this singular configuration is outside
of the operating region, the 3 angles might be used as potential
states by setting <b>useQuaternions</b> = <b>false</b>.
</p>
<p>
In text books about 3-dimensional mechanics often 3 angles and the
angular velocity are used as states. This is not the case here, since
3 angles and their derivatives are used as potential states
(if useQuaternions = false). The reason
is that for real-time simulation the discretization formula of the
integrator might be \"inlined\" and solved together with the body equations.
By appropriate symbolic transformation the performance is
drastically increased if angles and their
derivatives are used as states, instead of angles and the angular
velocity.
</p>
<p>
Whether or not variables of the body are used as states is usually
automatically selected by the Modelica translator. If parameter
<b>enforceStates</b> is set to <b>true</b> in the \"Advanced\" menu,
then body variables are forced to be used as states according
to the setting of parameters \"useQuaternions\" and
\"sequence_angleStates\".
</p>
</HTML>"));
        end Body;

        model BodyCylinder "Rigid body with cylinder shape. Mass and animation properties are computed from cylinder data and density (12 potential states)"
          import SI = Modelica.SIunits;
          import NonSI = Modelica.SIunits.Conversions.NonSIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(Placement(transformation(extent={{-116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b "Coordinate system fixed to the component with one cut-force and cut-torque" annotation(Placement(transformation(extent={{84,-16},{116,16}}, rotation=0)));
          parameter Boolean animation=true "= true, if animation shall be enabled (show cylinder between frame_a and frame_b)";
          parameter SI.Position r[3](start={0.1,0,0}) "Vector from frame_a to frame_b, resolved in frame_a";
          parameter SI.Position r_shape[3]={0,0,0} "Vector from frame_a to cylinder origin, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection=r - r_shape "Vector in length direction of cylinder, resolved in frame_a" annotation(Evaluate=true);
          parameter SI.Length length=Modelica.Math.Vectors.length(r - r_shape) "Length of cylinder";
          parameter SI.Distance diameter=length/world.defaultWidthFraction "Diameter of cylinder";
          parameter SI.Distance innerDiameter=0 "Inner diameter of cylinder (0 <= innerDiameter <= Diameter)";
          parameter SI.Density density=7700 "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)";
          input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor "Color of cylinder" annotation(Dialog(enable=animation));
          input Types.SpecularCoefficient specularCoefficient=world.defaultSpecularCoefficient "Reflection of ambient light (= 0: light is completely absorbed)" annotation(Dialog(enable=animation));
          SI.Position r_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Position vector from origin of world frame to origin of frame_a" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, stateSelect=if enforceStates then StateSelect.always else StateSelect.avoid) "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0}) "Absolute acceleration of frame_a resolved in world frame (= der(v_0))" annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          parameter Boolean angles_fixed=false "= true, if angles_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0} "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b" annotation(Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3} "Sequence of rotations to rotate frame_a into frame_b at initial time" annotation(Evaluate=true, Dialog(tab="Initialization"));
          parameter Boolean w_0_fixed=false "= true, if w_0_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0} "Initial or guess values of angular velocity of frame_a resolved in world frame" annotation(Dialog(tab="Initialization"));
          parameter Boolean z_0_fixed=false "= true, if z_0_start are used as initial values, else as guess values" annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0} "Initial values of angular acceleration z_0 = der(w_0)" annotation(Dialog(tab="Initialization"));
          parameter Boolean enforceStates=false " = true, if absolute variables of body object shall be used as states (StateSelect.always)" annotation(Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states" annotation(Evaluate=true, Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3} " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states" annotation(Evaluate=true, Dialog(tab="Advanced", enable=not useQuaternions));
          constant Real pi=Modelica.Constants.pi;
          final parameter SI.Distance radius=diameter/2 "Radius of cylinder";
          final parameter SI.Distance innerRadius=innerDiameter/2 "Inner-Radius of cylinder";
          final parameter SI.Mass mo(min=0)=density*pi*length*radius*radius "Mass of cylinder without hole";
          final parameter SI.Mass mi(min=0)=density*pi*length*innerRadius*innerRadius "Mass of hole of cylinder";
          final parameter SI.Inertia I22=(mo*(length*length + 3*radius*radius) - mi*(length*length + 3*innerRadius*innerRadius))/12 "Inertia with respect to axis through center of mass, perpendicular to cylinder axis";
          final parameter SI.Mass m(min=0)=mo - mi "Mass of cylinder";
          final parameter Frames.Orientation R=Frames.from_nxy(r, {0,1,0}) "Orientation object from frame_a to frame spanned by cylinder axis and axis perpendicular to cylinder axis";
          final parameter SI.Position r_CM[3]=Modelica.Math.Vectors.normalize(r)*length/2 "Position vector from frame_a to center of mass, resolved in frame_a";
          final parameter SI.Inertia I[3,3]=Frames.resolveDyade1(R, diagonal({(mo*radius*radius - mi*innerRadius*innerRadius)/2,I22,I22})) "Inertia tensor of cylinder with respect to center of mass, resolved in frame parallel to frame_a";
          Body body(r_CM=r_CM, m=m, I_11=I[1,1], I_22=I[2,2], I_33=I[3,3], I_21=I[2,1], I_31=I[3,1], I_32=I[3,2], animation=false, sequence_start=sequence_start, angles_fixed=angles_fixed, angles_start=angles_start, w_0_fixed=w_0_fixed, w_0_start=w_0_start, z_0_fixed=z_0_fixed, z_0_start=z_0_start, useQuaternions=useQuaternions, enforceStates=enforceStates, sequence_angleStates=sequence_angleStates) annotation(Placement(transformation(extent={{-30,-80},{10,-40}}, rotation=0)));
          FixedTranslation frameTranslation(r=r, animation=animation, shapeType="pipecylinder", r_shape=r_shape, lengthDirection=lengthDirection, length=length, width=diameter, height=diameter, extra=innerDiameter/diameter, color=color, specularCoefficient=specularCoefficient, widthDirection={0,1,0}) annotation(Placement(transformation(extent={{-30,-20},{10,20}}, rotation=0)));
        protected 
          outer Modelica.Mechanics.MultiBody.World world;
        equation 
          r_0=frame_a.r_0;
          v_0=der(r_0);
          a_0=der(v_0);
          assert(innerDiameter < diameter, "parameter innerDiameter is greater as parameter diameter.");
          connect(frameTranslation.frame_a,frame_a) annotation(Line(points={{-30,0},{-100,0}}, color={95,95,95}, thickness=0.5));
          connect(frameTranslation.frame_b,frame_b) annotation(Line(points={{10,0},{100,0}}, color={95,95,95}, thickness=0.5));
          connect(frame_a,body.frame_a) annotation(Line(points={{-100,0},{-70,0},{-70,-60},{-30,-60}}, color={95,95,95}, thickness=0.5));
          annotation(Documentation(info="<HTML>
<p>
<b>Rigid body</b> with <b>cylinder</b> shape.
The mass properties of the body (mass, center of mass,
inertia tensor) are computed
from the cylinder data. Optionally, the cylinder may be hollow.
The cylinder shape is by default used in the animation.
The two connector frames <b>frame_a</b> and <b>frame_b</b>
are always parallel to each other. Example of component
animation (note, that
the animation may be switched off via parameter animation = <b>false</b>):
</p>
<IMG SRC=\"../../Images/MultiBody/BodyCylinder.png\" ALT=\"Parts.BodyCylinder\">
<p>
A BodyCylinder component has potential states. For details of these
states and of the \"Advanced\" menu parameters, see model
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.</HTML>
"), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Text(extent={{-129,100},{131,40}}, textString="%name", lineColor={0,0,255}),Text(extent={{130,-98},{-130,-48}}, lineColor={0,0,0}, textString="%=r"),Rectangle(extent={{-100,40},{100,-40}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={0,127,255}),Text(extent={{-87,13},{-51,-12}}, lineColor={0,0,0}, textString="a"),Text(extent={{51,12},{87,-13}}, lineColor={0,0,0}, textString="b")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics));
        end BodyCylinder;

        annotation(Documentation(info="<HTML>
<p>
Package <b>Parts</b> contains <b>rigid components</b> of a
multi-body system. These components may be used to build up
more complicated structures. For example, a part may be built up of
a \"Body\" and of several \"FixedTranslation\" components.
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Fixed\">Fixed</a></td>
      <td valign=\"top\">Frame fixed in world frame at a given position.
          It is visualized with a shape, see <b>shapeType</b> below
         (the frames on the two
          sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/Fixed.png\" ALT=\"model Parts.Fixed\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.FixedTranslation\">FixedTranslation</a></td>
      <td valign=\"top\">Fixed translation of frame_b with respect to frame_a.
          It is visualized with a shape, see <b>shapeType</b> below
          (the frames on the two sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/FixedTranslation.png\" ALT=\"model Parts.FixedTranslation\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.FixedRotation\">FixedRotation</a></td>
      <td valign=\"top\">Fixed translation and fixed rotation of frame_b with respect to frame_a
          It is visualized with a shape, see <b>shapeType</b>  below
          (the frames on the two sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/FixedRotation.png\" ALT=\"model Parts.FixedRotation\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">Body</a></td>
      <td valign=\"top\">Rigid body with mass, inertia tensor and one frame connector.
          It is visualized with a cylinder and a sphere at the
          center of mass:<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/Body.png\" ALT=\"model Parts.Body\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BodyShape\">BodyShape</a></td>
      <td valign=\"top\">Rigid body with mass, inertia tensor, different shapes
          (see <b>shapeType</b> below)
          for animation, and two frame connectors:<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/BodyShape.png\" ALT=\"model Parts.BodyShape\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Fixed\">Fixed</a>
BodyBox</b></td>
      <td valign=\"top\">Rigid body with box shape (mass and animation properties are computed
          from box data and from density):<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/BodyBox.png\" ALT=\"model Parts.BodyBox\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BodyCylinder\">BodyCylinder</a></td>
      <td valign=\"top\">Rigid body with cylinder shape (mass and animation properties
          are computed from cylinder data and from density):<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/BodyCylinder.png\" ALT=\"model Parts.BodyCylinder\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.PointMass\">PointMass</a></td>
      <td valign=\"top\">Rigid body where inertia tensor and rotation is neglected:<br>&nbsp;<br>
      <IMG SRC=\"../../Images/MultiBody/Parts/PointMass.png\" ALT=\"model Parts.PointMass\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Mounting1D\">Mounting1D</a></td>
      <td valign=\"top\"> Propagate 1-dim. support torque to 3-dim. system
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Rotor1D\">Rotor1D</a></td>
      <td valign=\"top\">1D inertia attachable on 3-dim. bodies (without neglecting dynamic effects)<br>
      <IMG SRC=\"../../Images/MultiBody/Parts/Rotor1D.png\" ALT=\"model Parts.Rotor1D\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BevelGear1D\">BevelGear1D</a></td>
      <td valign=\"top\">1D gearbox with arbitrary shaft directions (3D bearing frame)
      </td>
  </tr>
</table>
<p>
Components <b>Fixed</b>, <b>FixedTranslation</b>, <b>FixedRotation</b>
and <b>BodyShape</b> are visualized according to parameter
<b>shapeType</b>, that may have the following values (e.g., shapeType = \"box\"): <br>&nbsp;<br>
</p>
<IMG SRC=\"../../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.FixedShape\">
<p>
All the details of the visualization shape parameters are
given in
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">Visualizers.FixedShape</a>
</p>
<p>
Colors in all animation parts are defined via parameter <b>color</b>.
This is an Integer vector with 3 elements, {r, g, b}, and specifies the
color of the shape. {r,g,b} are the \"red\", \"green\" and \"blue\" color parts,
given in the ranges 0 .. 255, respectively. The predefined type
<b>MultiBody.Types.Color</b> contains a menu
definition of the colors used in the MultiBody library
(this will be replaced by a color editor).
</p>
</HTML>
"));
      end Parts;

      package Interfaces "Connectors and partial models for 3-dim. mechanical components"
        extends Modelica.Icons.Library;
        connector Frame "Coordinate system fixed to the component with one cut-force and cut-torque (no icon)"
          import SI = Modelica.SIunits;
          SI.Position r_0[3] "Position vector from world frame to the connector frame origin, resolved in world frame";
          Frames.Orientation R "Orientation object to rotate the world frame into the connector frame";
          flow SI.Force f[3] "Cut-force resolved in connector frame" annotation(unassignedMessage="All Forces cannot be uniquely calculated.
The reason could be that the mechanism contains
a planar loop or that joints constrain the
same motion. For planar loops, use for one
revolute joint per loop the joint
Joints.RevolutePlanarLoopConstraint instead of
Joints.Revolute.");
          flow SI.Torque t[3] "Cut-torque resolved in connector frame";
          annotation(Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting. This component has no icon definition
and is only used by inheritance from frame connectors to define
different icons.
</p>
</html>"));
        end Frame;

        connector Frame_a "Coordinate system fixed to the component with one cut-force and cut-torque (filled rectangular icon)"
          extends Frame;
          annotation(defaultComponentName="frame_a", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}, initialScale=0.16), graphics={Rectangle(extent={{-10,10},{10,-10}}, lineColor={95,95,95}, lineThickness=0.5),Rectangle(extent={{-30,100},{30,-100}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}, initialScale=0.16), graphics={Text(extent={{-140,-50},{140,-88}}, lineColor={0,0,0}, textString="%name"),Rectangle(extent={{-12,40},{12,-40}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting.
This component has a filled rectangular icon.
</p>
</html>"));
        end Frame_a;

        connector Frame_b "Coordinate system fixed to the component with one cut-force and cut-torque (non-filled rectangular icon)"
          extends Frame;
          annotation(defaultComponentName="frame_b", Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}, initialScale=0.16), graphics={Rectangle(extent={{-10,10},{10,-10}}, lineColor={95,95,95}, lineThickness=0.5),Rectangle(extent={{-30,100},{30,-100}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}, initialScale=0.16), graphics={Text(extent={{-140,-50},{140,-88}}, lineColor={0,0,0}, textString="%name"),Rectangle(extent={{-12,40},{12,-40}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting. This component has a non-filled rectangular icon.
</p>
</html>"));
        end Frame_b;

        annotation(Documentation(info="<html>
<p>
This package contains connectors and partial models (i.e. models
that are only used to build other models) of the MultiBody library.
</p>
</html>"));
      end Interfaces;

      package Frames "Functions to transform rotational frame quantities"
        extends Modelica.Icons.Library;
        record Orientation "Orientation object defining rotation from a frame 1 into a frame 2"
          import SI = Modelica.SIunits;
          extends Modelica.Icons.Record;
          Real T[3,3] "Transformation matrix from world frame to local frame";
          SI.AngularVelocity w[3] "Absolute angular velocity of local frame, resolved in local frame";
          encapsulated function equalityConstraint "Return the constraint residues to express that two frames have the same orientation"
            import Modelica;
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Frames.Orientation R1 "Orientation object to rotate frame 0 into frame 1";
            input Frames.Orientation R2 "Orientation object to rotate frame 0 into frame 2";
            output Real residue[3] "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
            annotation(Inline=true);
          algorithm 
            residue:={Modelica.Math.atan2(cross(R1.T[1,:], R1.T[2,:])*R2.T[2,:], R1.T[1,:]*R2.T[1,:]),Modelica.Math.atan2(-cross(R1.T[1,:], R1.T[2,:])*R2.T[1,:], R1.T[2,:]*R2.T[2,:]),Modelica.Math.atan2(R1.T[2,:]*R2.T[1,:], R1.T[3,:]*R2.T[3,:])};
          end equalityConstraint;

          annotation(Documentation(info="<html>
<p>
This object describes the <b>rotation</b> from a <b>frame 1</b> into a <b>frame 2</b>.
An instance of this type should never be directly accessed but
only with the access functions provided
in package Modelica.Mechanics.MultiBody.Frames. As a consequence, it is not necessary to know
the internal representation of this object as described in the next paragraphs.
</p>
<p>
\"Orientation\" is defined to be a record consisting of two
elements: \"Real T[3,3]\", the transformation matrix to rotate frame 1
into frame 2 and \"Real w[3]\", the angular velocity of frame 2 with
respect to frame 1, resolved in frame 2. Element \"T\"
has the following interpretation:
</p>
<pre>
   Orientation R;
   <b>R.T</b> = [<b>e</b><sub>x</sub>, <b>e</b><sub>y</sub>, <b>e</b><sub>z</sub>];
       e.g., <b>R.T</b> = [1,0,0; 0,1,0; 0,0,1]
</pre>
<p>
where <b>e</b><sub>x</sub>,<b>e</b><sub>y</sub>,<b>e</b><sub>z</sub>
are unit vectors in the direction of the x-axis, y-axis, and z-axis
of frame 1, resolved in frame 2, respectively. Therefore, if <b>v</b><sub>1</sub>
is vector <b>v</b> resolved in frame 1 and <b>v</b><sub>2</sub> is
vector <b>v</b> resolved in frame 2, the following relationship holds:
</p>
<pre>
    <b>v</b><sub>2</sub> = <b>R.T</b> * <b>v</b><sub>1</sub>
</pre>
</p>
The <b>inverse</b> orientation
<b>R_inv.T</b> = <b>R.T</b><sup>T</sup> describes the rotation
from frame 2 into frame 1.
</p>
<p>
Since the orientation is described by 9 variables, there are
6 constraints between these variables. These constraints
are defined in function <b>Frames.orientationConstraint</b>.
</p>
<p>
R.w is the angular velocity of frame 2 with respect to frame 1, resolved
in frame 2. Formally, R.w is defined as:<br>
<b>skew</b>(R.w) = R.T*<b>der</b>(transpose(R.T))
with
</p>
<pre>
             |   0   -w[3]  w[2] |
   <b>skew</b>(w) = |  w[3]   0   -w[1] |
             | -w[2]  w[1]     0 |
</pre>

</html>
"));
        end Orientation;

        function angularVelocity2 "Return angular velocity resolved in frame 2 from orientation object"
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          output Modelica.SIunits.AngularVelocity w[3] "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
          annotation(Inline=true);
        algorithm 
          w:=R.w;
        end angularVelocity2;

        function resolve1 "Transform vector from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          input Real v2[3] "Vector in frame 2";
          output Real v1[3] "Vector in frame 1";
          annotation(derivative(noDerivative=R)=Internal.resolve1_der, __Dymola_InlineAfterIndexReduction=true);
        algorithm 
          v1:=transpose(R.T)*v2;
        end resolve1;

        function resolve2 "Transform vector from frame 1 to frame 2"
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          input Real v1[3] "Vector in frame 1";
          output Real v2[3] "Vector in frame 2";
          annotation(derivative(noDerivative=R)=Internal.resolve2_der, __Dymola_InlineAfterIndexReduction=true);
        algorithm 
          v2:=R.T*v1;
        end resolve2;

        function resolveDyade1 "Transform second order tensor from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          input Real D2[3,3] "Second order tensor resolved in frame 2";
          output Real D1[3,3] "Second order tensor resolved in frame 1";
          annotation(Inline=true);
        algorithm 
          D1:=transpose(R.T)*D2*R.T;
        end resolveDyade1;

        function nullRotation "Return orientation object that does not rotate a frame"
          extends Modelica.Icons.Function;
          output Orientation R "Orientation object such that frame 1 and frame 2 are identical";
          annotation(Inline=true);
        algorithm 
          R:=Orientation(T=identity(3), w=zeros(3));
        end nullRotation;

        function planarRotationAngle "Return angle of a planar rotation, given the rotation axis and the representations of a vector in frame 1 and frame 2"
          extends Modelica.Icons.Function;
          input Real e[3](each final unit="1") "Normalized axis of rotation to rotate frame 1 around e into frame 2 (must have length=1)";
          input Real v1[3] "A vector v resolved in frame 1 (shall not be parallel to e)";
          input Real v2[3] "Vector v resolved in frame 2, i.e., v2 = resolve2(planarRotation(e,angle),v1)";
          output Modelica.SIunits.Angle angle "Rotation angle to rotate frame 1 into frame 2 along axis e in the range: -pi <= angle <= pi";
          annotation(Inline=true, Documentation(info="<HTML>
<p>
A call to this function of the form
</p>
<pre>
    Real[3]                e, v1, v2;
    Modelica.SIunits.Angle angle;
  <b>equation</b>
    angle = <b>planarRotationAngle</b>(e, v1, v2);
</pre>
<p>
computes the rotation angle \"<b>angle</b>\" of a planar
rotation along unit vector <b>e</b>, rotating frame 1 into frame 2, given
the coordinate representations of a vector \"v\" in frame 1 (<b>v1</b>)
and in frame 2 (<b>v2</b>). Therefore, the result of this function
fulfills the following equation:
</p>
<pre>
    v2 = <b>resolve2</b>(<b>planarRotation</b>(e,angle), v1)
</pre>
<p>
The rotation angle is returned in the range
</p>
<pre>
    -<font face=\"Symbol\">p</font> &lt;= angle &lt;= <font face=\"Symbol\">p</font>
</pre>
<p>
This function makes the following assumptions on the input arguments
</p>
<ul>
<li> Vector <b>e</b> has length 1, i.e., length(e) = 1</li>
<li> Vector \"v\" is not parallel to <b>e</b>, i.e.,
     length(cross(e,v1)) &ne; 0</li>
</ul>
<p>
The function does not check the above assumptions. If these
assumptions are violated, a wrong result will be returned
and/or a division by zero will occur.
</p>
</HTML>"));
        algorithm 
          angle:=Modelica.Math.atan2(-cross(e, v1)*v2, v1*v2 - e*v1*(e*v2));
        end planarRotationAngle;

        function axesRotations "Return fixed rotation object to rotate in sequence around fixed angles along 3 axes"
          import TM = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
          extends Modelica.Icons.Function;
          input Integer sequence[3](min={1,1,1}, max={3,3,3})={1,2,3} "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input Modelica.SIunits.Angle angles[3] "Rotation angles around the axes defined in 'sequence'";
          input Modelica.SIunits.AngularVelocity der_angles[3] "= der(angles)";
          output Orientation R "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm 
          R:=Orientation(T=TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(sequence[2], angles[2])*TM.axisRotation(sequence[1], angles[1]), w=Frames.axis(sequence[3])*der_angles[3] + TM.resolve2(TM.axisRotation(sequence[3], angles[3]), Frames.axis(sequence[2])*der_angles[2]) + TM.resolve2(TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(sequence[2], angles[2]), Frames.axis(sequence[1])*der_angles[1]));
        end axesRotations;

        function axesRotationsAngles "Return the 3 angles to rotate in sequence around 3 axes to construct the given orientation object"
          import SI = Modelica.SIunits;
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          input Integer sequence[3](min={1,1,1}, max={3,3,3})={1,2,3} "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input SI.Angle guessAngle1=0 "Select angles[1] such that |angles[1] - guessAngle1| is a minimum";
          output SI.Angle angles[3] "Rotation angles around the axes defined in 'sequence' such that R=Frames.axesRotation(sequence,angles); -pi < angles[i] <= pi";
        protected 
          Real e1_1[3](each final unit="1") "First rotation axis, resolved in frame 1";
          Real e2_1a[3](each final unit="1") "Second rotation axis, resolved in frame 1a";
          Real e3_1[3](each final unit="1") "Third rotation axis, resolved in frame 1";
          Real e3_2[3](each final unit="1") "Third rotation axis, resolved in frame 2";
          Real A "Coefficient A in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          Real B "Coefficient B in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          SI.Angle angle_1a "Solution 1 for angles[1]";
          SI.Angle angle_1b "Solution 2 for angles[1]";
          TransformationMatrices.Orientation T_1a "Orientation object to rotate frame 1 into frame 1a";
        algorithm 
          assert(sequence[1] <> sequence[2] and sequence[2] <> sequence[3], "input argument 'sequence[1:3]' is not valid");
          e1_1:=if sequence[1] == 1 then {1,0,0} else if sequence[1] == 2 then {0,1,0} else {0,0,1};
          e2_1a:=if sequence[2] == 1 then {1,0,0} else if sequence[2] == 2 then {0,1,0} else {0,0,1};
          e3_1:=R.T[sequence[3],:];
          e3_2:=if sequence[3] == 1 then {1,0,0} else if sequence[3] == 2 then {0,1,0} else {0,0,1};
          A:=e2_1a*e3_1;
          B:=cross(e1_1, e2_1a)*e3_1;
          if abs(A) <= 1e-12 and abs(B) <= 1e-12 then 
            angles[1]:=guessAngle1;
          else
            angle_1a:=Modelica.Math.atan2(A, -B);
            angle_1b:=Modelica.Math.atan2(-A, B);
            angles[1]:=if abs(angle_1a - guessAngle1) <= abs(angle_1b - guessAngle1) then angle_1a else angle_1b;
          end if;
          T_1a:=TransformationMatrices.planarRotation(e1_1, angles[1]);
          angles[2]:=planarRotationAngle(e2_1a, TransformationMatrices.resolve2(T_1a, e3_1), e3_2);
          angles[3]:=planarRotationAngle(e3_2, e2_1a, TransformationMatrices.resolve2(R.T, TransformationMatrices.resolve1(T_1a, e2_1a)));
          annotation(Documentation(info="<HTML>
<p>
A call to this function of the form
</p>
<pre>
    Frames.Orientation     R;
    <b>parameter</b> Integer      sequence[3] = {1,2,3};
    Modelica.SIunits.Angle angles[3];
  <b>equation</b>
    angle = <b>axesRotationAngles</b>(R, sequence);
</pre>
<p>
computes the rotation angles \"<b>angles</b>[1:3]\" to rotate frame 1
into frame 2 along axes <b>sequence</b>[1:3], given the orientation
object <b>R</b> from frame 1 to frame 2. Therefore, the result of
this function fulfills the following equation:
</p>
<pre>
    R = <b>axesRotation</b>(sequence, angles)
</pre>
<p>
The rotation angles are returned in the range
</p>
<pre>
    -<font face=\"Symbol\">p</font> &lt;= angles[i] &lt;= <font face=\"Symbol\">p</font>
</pre>
<p>
There are <b>two solutions</b> for \"angles[1]\" in this range.
Via the third argument <b>guessAngle1</b> (default = 0) the
returned solution is selected such that |angles[1] - guessAngle1| is
minimal. The orientation object R may be in a singular configuration, i.e.,
there is an infinite number of angle values leading to the same R. The returned solution is
selected by setting angles[1] = guessAngle1. Then angles[2]
and angles[3] can be uniquely determined in the above range.
</p>
<p>
Note, that input argument <b>sequence</b> has the restriction that
only values 1,2,3 can be used and that sequence[1] &ne; sequence[2]
and sequence[2] &ne; sequence[3]. Often used values are:
</p>
<pre>
  sequence = <b>{1,2,3}</b>  // Cardan angle sequence
           = <b>{3,1,3}</b>  // Euler angle sequence
           = <b>{3,2,1}</b>  // Tait-Bryan angle sequence
</pre>
</HTML>"));
        end axesRotationsAngles;

        function from_nxy "Return fixed orientation object from n_x and n_y vectors"
          extends Modelica.Icons.Function;
          input Real n_x[3](each final unit="1") "Vector in direction of x-axis of frame 2, resolved in frame 1";
          input Real n_y[3](each final unit="1") "Vector in direction of y-axis of frame 2, resolved in frame 1";
          output Orientation R "Orientation object to rotate frame 1 into frame 2";
        protected 
          Real abs_n_x=sqrt(n_x*n_x);
          Real e_x[3](each final unit="1")=if abs_n_x < 1e-10 then {1,0,0} else n_x/abs_n_x;
          Real n_z_aux[3](each final unit="1")=cross(e_x, n_y);
          Real n_y_aux[3](each final unit="1")=if n_z_aux*n_z_aux > 1e-06 then n_y else if abs(e_x[1]) > 1e-06 then {0,1,0} else {1,0,0};
          Real e_z_aux[3](each final unit="1")=cross(e_x, n_y_aux);
          Real e_z[3](each final unit="1")=e_z_aux/sqrt(e_z_aux*e_z_aux);
        algorithm 
          R:=Orientation(T={e_x,cross(e_z, e_x),e_z}, w=zeros(3));
          annotation(Documentation(info="<html>
<p>
It is assumed that the two input vectors n_x and n_y are
resolved in frame 1 and are directed along the x and y axis
of frame 2 (i.e., n_x and n_y are orthogonal to each other)
The function returns the orientation object R to rotate from
frame 1 to frame 2.
</p>
<p>
The function is robust in the sense that it returns always
an orientation object R, even if n_y is not orthogonal to n_x.
This is performed in the following way:
</p>
<p>
If n_x and n_y are not orthogonal to each other, first a unit
vector e_y is determined that is orthogonal to n_x and is lying
in the plane spanned by n_x and n_y. If n_x and n_y are parallel
or nearly parallel to each other, a vector e_y is selected
arbitrarily such that e_x and e_y are orthogonal to each other.
</p>
</html>"));
        end from_nxy;

        function from_Q "Return orientation object R from quaternion orientation object Q"
          extends Modelica.Icons.Function;
          input Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2";
          input Modelica.SIunits.AngularVelocity w[3] "Angular velocity from frame 2 with respect to frame 1, resolved in frame 2";
          output Orientation R "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm 
          R:=Orientation([2*(Q[1]*Q[1] + Q[4]*Q[4]) - 1,2*(Q[1]*Q[2] + Q[3]*Q[4]),2*(Q[1]*Q[3] - Q[2]*Q[4]);2*(Q[2]*Q[1] - Q[3]*Q[4]),2*(Q[2]*Q[2] + Q[4]*Q[4]) - 1,2*(Q[2]*Q[3] + Q[1]*Q[4]);2*(Q[3]*Q[1] + Q[2]*Q[4]),2*(Q[3]*Q[2] - Q[1]*Q[4]),2*(Q[3]*Q[3] + Q[4]*Q[4]) - 1], w=w);
        end from_Q;

        function to_Q "Return quaternion orientation object Q from orientation object R"
          extends Modelica.Icons.Function;
          input Orientation R "Orientation object to rotate frame 1 into frame 2";
          input Quaternions.Orientation Q_guess=Quaternions.nullRotation() "Guess value for output Q (there are 2 solutions; the one closer to Q_guess is used";
          output Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm 
          Q:=Quaternions.from_T(R.T, Q_guess);
        end to_Q;

        function axis "Return unit vector for x-, y-, or z-axis"
          extends Modelica.Icons.Function;
          input Integer axis(min=1, max=3) "Axis vector to be returned";
          output Real e[3](each final unit="1") "Unit axis vector";
          annotation(Inline=true);
        algorithm 
          e:=if axis == 1 then {1,0,0} else if axis == 2 then {0,1,0} else {0,0,1};
        end axis;

        package Quaternions "Functions to transform rotational frame quantities based on quaternions (also called Euler parameters)"
          extends Modelica.Icons.Library;
          type Orientation "Orientation type defining rotation from a frame 1 into a frame 2 with quaternions {p1,p2,p3,p0}"
            extends Internal.QuaternionBase;
            encapsulated function equalityConstraint "Return the constraint residues to express that two frames have the same quaternion orientation"
              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.Quaternions;
              extends Modelica.Icons.Function;
              input Quaternions.Orientation Q1 "Quaternions orientation object to rotate frame 0 into frame 1";
              input Quaternions.Orientation Q2 "Quaternions orientation object to rotate frame 0 into frame 2";
              output Real residue[3] "The half of the rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (shall be zero)";
              annotation(Inline=true);
            algorithm 
              residue:=[Q1[4],Q1[3],-Q1[2],-Q1[1];-Q1[3],Q1[4],Q1[1],-Q1[2];Q1[2],-Q1[1],Q1[4],-Q1[3]]*Q2;
            end equalityConstraint;

            annotation(Documentation(info="<html>
<p>
This type describes the <b>rotation</b> to rotate a frame 1 into
a frame 2 using quaternions (also called <b>Euler parameters</b>)
according to the following definition:
</p>
<pre>
   Quaternions.Orientation Q;
   Real  n[3];
   Real  phi(unit=\"rad\");
   Q = [ n*sin(phi/2)
           cos(phi/2) ]
</pre>
<p>
where \"n\" is the <b>axis of rotation</b> to rotate frame 1 into
frame 2 and \"phi\" is the <b>rotation angle</b> for this rotation.
Vector \"n\" is either resolved in frame 1 or in frame 2
(the result is the same since the coordinates of \"n\" with respect to
frame 1 are identical to its coordinates with respect to frame 2).
<p>
<p>
The term \"quaternions\" is prefered over the historically
more reasonable \"Euler parameters\" in order to not get
confused with Modelica \"parameters\".
</p>
</html>
"));
          end Orientation;

          type der_Orientation= Real[4](each unit="1/s") "First time derivative of Quaternions.Orientation";
          function orientationConstraint "Return residues of orientation constraints (shall be zero)"
            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2";
            output Real residue[1] "Residue constraint (shall be zero)";
            annotation(Inline=true);
          algorithm 
            residue:={Q*Q - 1};
          end orientationConstraint;

          function angularVelocity2 "Compute angular velocity resolved in frame 2 from quaternions orientation object and its derivative"
            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2";
            input der_Orientation der_Q "Derivative of Q";
            output Modelica.SIunits.AngularVelocity w[3] "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
            annotation(Inline=true);
          algorithm 
            w:=2*([Q[4],Q[3],-Q[2],-Q[1];-Q[3],Q[4],Q[1],-Q[2];Q[2],-Q[1],Q[4],-Q[3]]*der_Q);
          end angularVelocity2;

          function nullRotation "Return quaternions orientation object that does not rotate a frame"
            extends Modelica.Icons.Function;
            output Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm 
            Q:={0,0,0,1};
          end nullRotation;

          function from_T "Return quaternions orientation object Q from transformation matrix T"
            extends Modelica.Icons.Function;
            input Real T[3,3] "Transformation matrix to transform vector from frame 1 to frame 2 (v2=T*v1)";
            input Quaternions.Orientation Q_guess=nullRotation() "Guess value for Q (there are 2 solutions; the one close to Q_guess is used";
            output Quaternions.Orientation Q "Quaternions orientation object to rotate frame 1 into frame 2 (Q and -Q have same transformation matrix)";
          protected 
            Real paux;
            Real paux4;
            Real c1;
            Real c2;
            Real c3;
            Real c4;
            constant Real p4limit=0.1;
            constant Real c4limit=4*p4limit*p4limit;
          algorithm 
            c1:=1 + T[1,1] - T[2,2] - T[3,3];
            c2:=1 + T[2,2] - T[1,1] - T[3,3];
            c3:=1 + T[3,3] - T[1,1] - T[2,2];
            c4:=1 + T[1,1] + T[2,2] + T[3,3];
            if c4 > c4limit or c4 > c1 and c4 > c2 and c4 > c3 then 
              paux:=sqrt(c4)/2;
              paux4:=4*paux;
              Q:={(T[2,3] - T[3,2])/paux4,(T[3,1] - T[1,3])/paux4,(T[1,2] - T[2,1])/paux4,paux};
            elseif c1 > c2 and c1 > c3 and c1 > c4 then
              paux:=sqrt(c1)/2;
              paux4:=4*paux;
              Q:={paux,(T[1,2] + T[2,1])/paux4,(T[1,3] + T[3,1])/paux4,(T[2,3] - T[3,2])/paux4};

            elseif c2 > c1 and c2 > c3 and c2 > c4 then
              paux:=sqrt(c2)/2;
              paux4:=4*paux;
              Q:={(T[1,2] + T[2,1])/paux4,paux,(T[2,3] + T[3,2])/paux4,(T[3,1] - T[1,3])/paux4};
            else
              paux:=sqrt(c3)/2;
              paux4:=4*paux;
              Q:={(T[1,3] + T[3,1])/paux4,(T[2,3] + T[3,2])/paux4,paux,(T[1,2] - T[2,1])/paux4};
            end if;
            if Q*Q_guess < 0 then 
              Q:=-Q;
            end if;
          end from_T;

          annotation(Documentation(info="<HTML>
<p>
Package <b>Frames.Quaternions</b> contains type definitions and
functions to transform rotational frame quantities with quaternions.
Functions of this package are currently only utilized in
MultiBody.Parts.Body components, when quaternions shall be used
as parts of the body states.
Some functions are also used in a new Modelica package for
B-Spline interpolation that is able to interpolate paths consisting of
position vectors and orientation objects.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Quaternions.Orientation Q, Q1, Q2, Q_rel, Q_inv;
   Real[3,3]   T, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation Q;</b></td>
      <td valign=\"top\">New type defining a quaternion object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\"><b>der_Orientation</b> der_Q;</td>
      <td valign=\"top\">New type defining the first time derivative
         of Frames.Quaternions.Orientation.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(Q);</td>
      <td valign=\"top\">Return the constraints between the variables of a quaternion object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(Q, der_Q);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          quaternion object Q<br> and its derivative der_Q.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(Q, der_Q);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          quaternion object Q<br> and its derivative der_Q.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(Q,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(Q,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">[v1,w1] = <b>multipleResolve1</b>(Q, [v2,w2]);</td>
      <td valign=\"top\">Transform several vectors from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">[v2,w2] = <b>multipleResolve2</b>(Q, [v1,w1]);</td>
      <td valign=\"top\">Transform several vectors from frame 1 to frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>nullRotation</b>()</td>
      <td valign=\"top\">Return quaternion object R that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">Q_inv = <b>inverseRotation</b>(Q);</td>
      <td valign=\"top\">Return inverse quaternion object.
      </td>
  </tr>
  <tr><td valign=\"top\">Q_rel = <b>relativeRotation</b>(Q1,Q2);</td>
      <td valign=\"top\">Return relative quaternion object from two absolute
          quaternion objects.
      </td>
  </tr>
  <tr><td valign=\"top\">Q2 = <b>absoluteRotation</b>(Q1,Q_rel);</td>
      <td valign=\"top\">Return absolute quaternion object from another
          absolute<br> and a relative quaternion object.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>planarRotation</b>(e, angle);</td>
      <td valign=\"top\">Return quaternion object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(Q);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>from_T</b>(T);</td>
      <td valign=\"top\">Return quaternion object Q from transformation matrix T.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>from_T_inv</b>(T_inv);</td>
      <td valign=\"top\">Return quaternion object Q from inverse transformation matrix T_inv.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(Q);</td>
      <td valign=\"top\">Return transformation matrix T from quaternion object Q.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(Q);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from quaternion object Q.
      </td>
  </tr>
</table>
</HTML>"));
        end Quaternions;

        package TransformationMatrices "Functions for transformation matrices"
          extends Modelica.Icons.Library;
          type Orientation "Orientation type defining rotation from a frame 1 into a frame 2 with a transformation matrix"
            extends Internal.TransformationMatrix;
            encapsulated function equalityConstraint "Return the constraint residues to express that two frames have the same orientation"
              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
              extends Modelica.Icons.Function;
              input TransformationMatrices.Orientation T1 "Orientation object to rotate frame 0 into frame 1";
              input TransformationMatrices.Orientation T2 "Orientation object to rotate frame 0 into frame 2";
              annotation(Inline=true);
              output Real residue[3] "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
            algorithm 
              residue:={cross(T1[1,:], T1[2,:])*T2[2,:],-cross(T1[1,:], T1[2,:])*T2[1,:],T1[2,:]*T2[1,:]};
            end equalityConstraint;

            annotation(Documentation(info="<html>
<p>
This type describes the <b>rotation</b> from a <b>frame 1</b> into a <b>frame 2</b>.
An instance <b>R</b> of type <b>Orientation</b> has the following interpretation:
</p>
<pre>
   <b>T</b> = [<b>e</b><sub>x</sub>, <b>e</b><sub>y</sub>, <b>e</b><sub>z</sub>];
       e.g., <b>T</b> = [1,0,0; 0,1,0; 0,0,1]
</pre>
<p>
where <b>e</b><sub>x</sub>,<b>e</b><sub>y</sub>,<b>e</b><sub>z</sub>
are unit vectors in the direction of the x-axis, y-axis, and z-axis
of frame 1, resolved in frame 2, respectively. Therefore, if <b>v</b><sub>1</sub>
is vector <b>v</b> resolved in frame 1 and <b>v</b><sub>2</sub> is
vector <b>v</b> resolved in frame 2, the following relationship holds:
</p>
<pre>
    <b>v</b><sub>2</sub> = <b>T</b> * <b>v</b><sub>1</sub>
</pre>
</p>
The <b>inverse</b> orientation
<b>T_inv</b> = <b>T</b><sup>T</sup> describes the rotation
from frame 2 into frame 1.
</p>
<p>
Since the orientation is described by 9 variables, there are
6 constraints between these variables. These constraints
are defined in function <b>TransformationMatrices.orientationConstraint</b>.
</p>
<p>
Note, that in the MultiBody library the rotation object is
never directly accessed but only with the access functions provided
in package TransformationMatrices. As a consequence, other implementations of
Rotation can be defined by adapting this package correspondingly.
</p>
</html>
"));
          end Orientation;

          function resolve1 "Transform vector from frame 2 to frame 1"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector in frame 2";
            output Real v1[3] "Vector in frame 1";
            annotation(Inline=true);
          algorithm 
            v1:=transpose(T)*v2;
          end resolve1;

          function resolve2 "Transform vector from frame 1 to frame 2"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector in frame 1";
            output Real v2[3] "Vector in frame 2";
            annotation(Inline=true);
          algorithm 
            v2:=T*v1;
          end resolve2;

          function absoluteRotation "Return absolute orientation object from another absolute and a relative orientation object"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T1 "Orientation object to rotate frame 0 into frame 1";
            input TransformationMatrices.Orientation T_rel "Orientation object to rotate frame 1 into frame 2";
            output TransformationMatrices.Orientation T2 "Orientation object to rotate frame 0 into frame 2";
            annotation(Inline=true);
          algorithm 
            T2:=T_rel*T1;
          end absoluteRotation;

          function planarRotation "Return orientation object of a planar rotation"
            import Modelica.Math;
            extends Modelica.Icons.Function;
            input Real e[3](each final unit="1") "Normalized axis of rotation (must have length=1)";
            input Modelica.SIunits.Angle angle "Rotation angle to rotate frame 1 into frame 2 along axis e";
            output TransformationMatrices.Orientation T "Orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm 
            T:=[e]*transpose([e]) + (identity(3) - [e]*transpose([e]))*Math.cos(angle) - skew(e)*Math.sin(angle);
          end planarRotation;

          function axisRotation "Return rotation object to rotate around one frame axis"
            import Modelica.Math.*;
            extends Modelica.Icons.Function;
            input Integer axis(min=1, max=3) "Rotate around 'axis' of frame 1";
            input Modelica.SIunits.Angle angle "Rotation angle to rotate frame 1 into frame 2 along 'axis' of frame 1";
            output TransformationMatrices.Orientation T "Orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm 
            T:=if axis == 1 then [1,0,0;0,cos(angle),sin(angle);0,-sin(angle),cos(angle)] else if axis == 2 then [cos(angle),0,-sin(angle);0,1,0;sin(angle),0,cos(angle)] else [cos(angle),sin(angle),0;-sin(angle),cos(angle),0;0,0,1];
          end axisRotation;

          function from_nxy "Return orientation object from n_x and n_y vectors"
            extends Modelica.Icons.Function;
            input Real n_x[3](each final unit="1") "Vector in direction of x-axis of frame 2, resolved in frame 1";
            input Real n_y[3](each final unit="1") "Vector in direction of y-axis of frame 2, resolved in frame 1";
            output TransformationMatrices.Orientation T "Orientation object to rotate frame 1 into frame 2";
          protected 
            Real abs_n_x=sqrt(n_x*n_x);
            Real e_x[3](each final unit="1")=if abs_n_x < 1e-10 then {1,0,0} else n_x/abs_n_x;
            Real n_z_aux[3](each final unit="1")=cross(e_x, n_y);
            Real n_y_aux[3](each final unit="1")=if n_z_aux*n_z_aux > 1e-06 then n_y else if abs(e_x[1]) > 1e-06 then {0,1,0} else {1,0,0};
            Real e_z_aux[3](each final unit="1")=cross(e_x, n_y_aux);
            Real e_z[3](each final unit="1")=e_z_aux/sqrt(e_z_aux*e_z_aux);
          algorithm 
            T:={e_x,cross(e_z, e_x),e_z};
            annotation(Documentation(info="<html>
<p>
It is assumed that the two input vectors n_x and n_y are
resolved in frame 1 and are directed along the x and y axis
of frame 2 (i.e., n_x and n_y are orthogonal to each other)
The function returns the orientation object T to rotate from
frame 1 to frame 2.
</p>
<p>
The function is robust in the sense that it returns always
an orientation object T, even if n_y is not orthogonal to n_x.
This is performed in the following way:
</p>
<p>
If n_x and n_y are not orthogonal to each other, first a unit
vector e_y is determined that is orthogonal to n_x and is lying
in the plane spanned by n_x and n_y. If n_x and n_y are parallel
or nearly parallel to each other, a vector e_y is selected
arbitrarily such that e_x and e_y are orthogonal to each other.
</p>
</html>"));
          end from_nxy;

          annotation(Documentation(info="<HTML>
<p>
Package <b>Frames.TransformationMatrices</b> contains type definitions and
functions to transform rotational frame quantities using
transformation matrices.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Orientation T, T1, T2, T_rel, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, e, e_x, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation T;</b></td>
      <td valign=\"top\">New type defining an orientation object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\"><b>der_Orientation</b> der_T;</td>
      <td valign=\"top\">New type defining the first time derivative
         of Frames.Orientation.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(T);</td>
      <td valign=\"top\">Return the constraints between the variables of an orientation object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(T, der_T);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          orientation object T<br> and its derivative der_T.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(T, der_T);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          orientation object T<br> and its derivative der_T.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(T,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(T,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">[v1,w1] = <b>multipleResolve1</b>(T, [v2,w2]);</td>
      <td valign=\"top\">Transform several vectors from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">[v2,w2] = <b>multipleResolve2</b>(T, [v1,w1]);</td>
      <td valign=\"top\">Transform several vectors from frame 1 to frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">D1 = <b>resolveDyade1</b>(T,D2);</td>
      <td valign=\"top\">Transform second order tensor D2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">D2 = <b>resolveDyade2</b>(T,D1);</td>
      <td valign=\"top\">Transform second order tensor D1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">T= <b>nullRotation</b>()</td>
      <td valign=\"top\">Return orientation object T that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>inverseRotation</b>(T);</td>
      <td valign=\"top\">Return inverse orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">T_rel = <b>relativeRotation</b>(T1,T2);</td>
      <td valign=\"top\">Return relative orientation object from two absolute
          orientation objects.
      </td>
  </tr>
  <tr><td valign=\"top\">T2 = <b>absoluteRotation</b>(T1,T_rel);</td>
      <td valign=\"top\">Return absolute orientation object from another
          absolute<br> and a relative orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>planarRotation</b>(e, angle);</td>
      <td valign=\"top\">Return orientation object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">angle = <b>planarRotationAngle</b>(e, v1, v2);</td>
      <td valign=\"top\">Return angle of a planar rotation, given the rotation axis<br>
        and the representations of a vector in frame 1 and frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>axisRotation</b>(i, angle);</td>
      <td valign=\"top\">Return orientation object T for rotation around axis i of frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>axesRotations</b>(sequence, angles);</td>
      <td valign=\"top\">Return rotation object to rotate in sequence around 3 axes. Example:<br>
          T = axesRotations({1,2,3},{90,45,-90});
      </td>
  </tr>
  <tr><td valign=\"top\">angles = <b>axesRotationsAngles</b>(T, sequence);</td>
      <td valign=\"top\">Return the 3 angles to rotate in sequence around 3 axes to<br>
          construct the given orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(T);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_nxy</b>(n_x, n_y);</td>
      <td valign=\"top\">Return orientation object from n_x and n_y vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_nxz</b>(n_x, n_z);</td>
      <td valign=\"top\">Return orientation object from n_x and n_z vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T</b>(T);</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T_inv</b>(T_inv);</td>
      <td valign=\"top\">Return orientation object R from inverse transformation matrix T_inv.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_Q</b>(Q);</td>
      <td valign=\"top\">Return orientation object T from quaternion orientation object Q.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(R);</td>
      <td valign=\"top\">Return transformation matrix T from orientation object R.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(R);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>to_Q</b>(T);</td>
      <td valign=\"top\">Return quaternione orientation object Q from orientation object T.
      </td>
  </tr>
  <tr><td valign=\"top\">exy = <b>to_exy</b>(T);</td>
      <td valign=\"top\">Return [e_x, e_y] matrix of an orientation object T, <br>
          with e_x and e_y vectors of frame 2, resolved in frame 1.
  </tr>
</table>
</HTML>"));
        end TransformationMatrices;

        package Internal "Internal definitions that may be removed or changed (do not use)"
          extends Modelica.Icons.Library;
          type TransformationMatrix= Real[3,3];
          type QuaternionBase= Real[4];
          function resolve1_der "Derivative of function Frames.resolve1(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector resolved in frame 2";
            input Real v2_der[3] "= der(v2)";
            output Real v1_der[3] "Derivative of vector v resolved in frame 1";
            annotation(Inline=true);
          algorithm 
            v1_der:=Frames.resolve1(R, v2_der + cross(R.w, v2));
          end resolve1_der;

          function resolve2_der "Derivative of function Frames.resolve2(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector resolved in frame 1";
            input Real v1_der[3] "= der(v1)";
            output Real v2_der[3] "Derivative of vector v resolved in frame 2";
            annotation(Inline=true);
          algorithm 
            v2_der:=Frames.resolve2(R, v1_der) - cross(R.w, Frames.resolve2(R, v1));
          end resolve2_der;

        end Internal;

        annotation(Documentation(info="<HTML>
<p>
Package <b>Frames</b> contains type definitions and
functions to transform rotational frame quantities. The basic idea is to
hide the actual definition of an <b>orientation</b> in this package
by providing essentially type <b>Orientation</b> together with
<b>functions</b> operating on instances of this type.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Frames.Orientation R, R1, R2, R_rel, R_inv;
   Real[3,3]   T, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, e, e_x, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation R;</b></td>
      <td valign=\"top\">New type defining an orientation object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(R);</td>
      <td valign=\"top\">Return the constraints between the variables of an orientation object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(R);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          orientation object R.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(R);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          orientation object R.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(R,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(R,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolveRelative</b>(v1,R1,R2);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2
          using absolute orientation objects R1 of frame 1 and R2 of frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">D1 = <b>resolveDyade1</b>(R,D2);</td>
      <td valign=\"top\">Transform second order tensor D2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">D2 = <b>resolveDyade2</b>(R,D1);</td>
      <td valign=\"top\">Transform second order tensor D1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">R = <b>nullRotation</b>()</td>
      <td valign=\"top\">Return orientation object R that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">R_inv = <b>inverseRotation</b>(R);</td>
      <td valign=\"top\">Return inverse orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">R_rel = <b>relativeRotation</b>(R1,R2);</td>
      <td valign=\"top\">Return relative orientation object from two absolute
          orientation objects.
      </td>
  </tr>
  <tr><td valign=\"top\">R2 = <b>absoluteRotation</b>(R1,R_rel);</td>
      <td valign=\"top\">Return absolute orientation object from another
          absolute<br> and a relative orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>planarRotation</b>(e, angle, der_angle);</td>
      <td valign=\"top\">Return orientation object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">angle = <b>planarRotationAngle</b>(e, v1, v2);</td>
      <td valign=\"top\">Return angle of a planar rotation, given the rotation axis<br>
        and the representations of a vector in frame 1 and frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>axisRotation</b>(axis, angle, der_angle);</td>
      <td valign=\"top\">Return orientation object R to rotate around angle along axis of frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>axesRotations</b>(sequence, angles, der_angles);</td>
      <td valign=\"top\">Return rotation object to rotate in sequence around 3 axes. Example:<br>
          R = axesRotations({1,2,3},{pi/2,pi/4,-pi}, zeros(3));
      </td>
  </tr>
  <tr><td valign=\"top\">angles = <b>axesRotationsAngles</b>(R, sequence);</td>
      <td valign=\"top\">Return the 3 angles to rotate in sequence around 3 axes to<br>
          construct the given orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(R);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation R.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_nxy</b>(n_x, n_y);</td>
      <td valign=\"top\">Return orientation object from n_x and n_y vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_nxz</b>(n_x, n_z);</td>
      <td valign=\"top\">Return orientation object from n_x and n_z vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T</b>(T,w);</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T and
          its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T2</b>(T,der(T));</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T and
          its derivative der(T).
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T_inv</b>(T_inv,w);</td>
      <td valign=\"top\">Return orientation object R from inverse transformation matrix T_inv and
          its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_Q</b>(Q,w);</td>
      <td valign=\"top\">Return orientation object R from quaternion orientation object Q
          and its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(R);</td>
      <td valign=\"top\">Return transformation matrix T from orientation object R.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(R);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>to_Q</b>(R);</td>
      <td valign=\"top\">Return quaternione orientation object Q from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">exy = <b>to_exy</b>(R);</td>
      <td valign=\"top\">Return [e_x, e_y] matrix of an orientation object R, <br>
          with e_x and e_y vectors of frame 2, resolved in frame 1.
  </tr>
  <tr><td valign=\"top\">L = <b>length</b>(n_x);</td>
      <td valign=\"top\">Return length L of a vector n_x.
      </td>
  </tr>
  <tr><td valign=\"top\">e_x = <b>normalize</b>(n_x);</td>
      <td valign=\"top\">Return normalized vector e_x of n_x such that length of e_x is one.
      </td>
  </tr>
  <tr><td valign=\"top\">e = <b>axis</b>(i);</td>
      <td valign=\"top\">Return unit vector e directed along axis i
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Frames.Quaternions\">Quaternions</a></td>
      <td valign=\"top\"><b>Package</b> with functions to transform rotational frame quantities based
          on quaternions (also called Euler parameters).
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Frames.TransformationMatrices\">TransformationMatrices</a></td>
      <td valign=\"top\"><b>Package</b> with functions to transform rotational frame quantities based
          on transformation matrices.
      </td>
  </tr>
</table>
</HTML>"));
      end Frames;

    end MultiBody;

  end Mechanics;

  package Math "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;
    package Vectors "Library of functions operating on vectors"
      extends Modelica.Icons.Library;
      function length "Return length of a vectorReturn length of a vector (better as norm(), if further symbolic processing is performed)"
        extends Modelica.Icons.Function;
        input Real v[:] "Vector";
        output Real result "Length of vector v";
        annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Vectors.<b>length</b>(v);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>Vectors.<b>length</b>(v)</code>\" returns the
<b>Euclidean length</b> \"<code>sqrt(v*v)</code>\" of vector v.
The function call is equivalent to Vectors.norm(v). The advantage of
length(v) over norm(v)\"is that function length(..) is implemented
in one statement and therefore the function is usually automatically
inlined. Further symbolic processing is therefore possible, which is
not the case with function norm(..).
</p>
<h4>Example</h4>
<blockquote><pre>
  v = {2, -4, -2, -1};
  <b>length</b>(v);  // = 5
</pre></blockquote>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Vectors.norm\">Vectors.norm</a>
</html>"));
      algorithm 
        result:=sqrt(v*v);
      end length;

      function normalize "Return normalized vector such that length = 1Return normalized vector such that length = 1 and prevent zero-division for zero vector"
        extends Modelica.Icons.Function;
        input Real v[:] "Vector";
        input Real eps=100*Modelica.Constants.eps "if |v| < eps then result = v/eps";
        output Real result[size(v, 1)] "Input vector v normalized to length=1";
        annotation(Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Vectors.<b>normalize</b>(v);
Vectors.<b>normalize</b>(v,eps=100*Modelica.Constants.eps);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>Vectors.<b>normalize</b>(v)</code>\" returns the
<b>unit vector</b> \"<code>v/length(v)</code>\" of vector v.
If length(v) is close to zero (more precisely, if length(v) &lt; eps),
v/eps is returned in order to avoid
a division by zero. For many applications this is useful, because
often the unit vector <b>e</b> = <b>v</b>/length(<b>v</b>) is used to compute
a vector x*<b>e</b>, where the scalar x is in the order of length(<b>v</b>),
i.e., x*<b>e</b> is small, when length(<b>v</b>) is small and then
it is fine to replace <b>e</b> by <b>v</b> to avoid a division by zero.
</p>
<p>
Since the function is implemented in one statement,
it is usually inlined and therefore symbolic processing is
possible.
</p>
<h4>Example</h4>
<blockquote><pre>
  <b>normalize</b>({1,2,3});  // = {0.267, 0.534, 0.802}
  <b>normalize</b>({0,0,0});  // = {0,0,0}
</pre></blockquote>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Vectors.length\">Vectors.length</a>
</html>"));
      algorithm 
        result:=smooth(0, if length(v) >= eps then v/length(v) else v/eps);
      end normalize;

      annotation(preferedView="info", Documentation(info="<HTML>
<h4>Library content</h4>
<p>
This library provides functions operating on vectors:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><i>Function</i></th>
      <th><i>Description</i></th>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.isEqual\">isEqual</a>(v1, v2)</td>
      <td valign=\"top\">Determines whether two vectors have the same size and elements</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.norm\">norm</a>(v,p)</td>
      <td valign=\"top\">p-norm of vector v</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.length\">length</a>(v)</td>
      <td valign=\"top\">Length of vector v (= norm(v,2), but inlined and therefore usable in
          symbolic manipulations) </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.normalize\">normalize</a>(v)</td>
      <td valign=\"top\">Return normalized vector such that length = 1 and prevent
          zero-division for zero vector</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.reverse\">reverse</a>(v)</td>
      <td valign=\"top\">Reverse vector elements</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.sort\">sort</a>(v)</td>
      <td valign=\"top\">Sort elements of vector in ascending or descending order</td>
  </tr>
</table>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Matrices\">Matrices</a>
</HTML>"));
    end Vectors;

    function sin "Sine"
      extends baseIcon1;
      input SI.Angle u;
      output Real y;

      external "C" y=sin(u) ;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,0}),Text(extent={{12,84},{84,36}}, lineColor={192,192,192}, textString="sin")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-100,0},{84,0}}, color={95,95,95}),Polygon(points={{100,0},{84,6},{84,-6},{100,0}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,255}, thickness=0.5),Text(extent={{-105,72},{-85,88}}, textString="1", lineColor={0,0,255}),Text(extent={{70,25},{90,5}}, textString="2*pi", lineColor={0,0,255}),Text(extent={{-103,-72},{-83,-88}}, textString="-1", lineColor={0,0,255}),Text(extent={{82,-6},{102,-26}}, lineColor={95,95,95}, textString="u"),Line(points={{-80,80},{-28,80}}, color={175,175,175}, smooth=Smooth.None),Line(points={{-80,-80},{50,-80}}, color={175,175,175}, smooth=Smooth.None)}), Documentation(info="<html>
<p>
This function returns y = sin(u), with -&infin; &lt; u &lt; &infin;:
</p>

<p>
<img src=\"../Images/Math/sin.png\">
</p>
</html>"), Library="ModelicaExternalC");
    end sin;

    function cos "Cosine"
      extends baseIcon1;
      input SI.Angle u;
      output Real y;

      external "C" y=cos(u) ;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},{24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,73.4},{75.2,78.6},{80,80}}, color={0,0,0}),Text(extent={{-36,82},{36,34}}, lineColor={192,192,192}, textString="cos")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Text(extent={{-103,72},{-83,88}}, textString="1", lineColor={0,0,255}),Text(extent={{-103,-72},{-83,-88}}, textString="-1", lineColor={0,0,255}),Text(extent={{70,25},{90,5}}, textString="2*pi", lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={95,95,95}),Polygon(points={{98,0},{82,6},{82,-6},{98,0}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),Line(points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},{24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,73.4},{75.2,78.6},{80,80}}, color={0,0,255}, thickness=0.5),Text(extent={{78,-6},{98,-26}}, lineColor={95,95,95}, textString="u"),Line(points={{-80,-80},{18,-80}}, color={175,175,175}, smooth=Smooth.None)}), Documentation(info="<html>
<p>
This function returns y = cos(u), with -&infin; &lt; u &lt; &infin;:
</p>

<p>
<img src=\"../Images/Math/cos.png\">
</p>
</html>"), Library="ModelicaExternalC");
    end cos;

    function asin "Inverse sine (-1 <= u <= 1)"
      extends baseIcon2;
      input Real u;
      output SI.Angle y;

      external "C" y=asin(u) ;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, color={0,0,0}),Text(extent={{-88,78},{-16,30}}, lineColor={192,192,192}, textString="asin")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Text(extent={{-40,-72},{-15,-88}}, textString="-pi/2", lineColor={0,0,255}),Text(extent={{-38,88},{-13,72}}, textString=" pi/2", lineColor={0,0,255}),Text(extent={{68,-9},{88,-29}}, textString="+1", lineColor={0,0,255}),Text(extent={{-90,21},{-70,1}}, textString="-1", lineColor={0,0,255}),Line(points={{-100,0},{84,0}}, color={95,95,95}),Polygon(points={{98,0},{82,6},{82,-6},{98,0}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, color={0,0,255}, thickness=0.5),Text(extent={{82,24},{102,4}}, lineColor={95,95,95}, textString="u"),Line(points={{0,80},{86,80}}, color={175,175,175}, smooth=Smooth.None),Line(points={{80,86},{80,-10}}, color={175,175,175}, smooth=Smooth.None)}), Documentation(info="<html>
<p>
This function returns y = asin(u), with -1 &le; u &le; +1:
</p>

<p>
<img src=\"../Images/Math/asin.png\">
</p>
</html>"), Library="ModelicaExternalC");
    end asin;

    function atan2 "Four quadrant inverse tangent"
      extends baseIcon2;
      input Real u1;
      input Real u2;
      output SI.Angle y;

      external "C" y=atan2(u1,u2) ;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{69.9,-45.8},{80,-45.1}}, color={0,0,0}),Line(points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,-14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{62.1,33.5},{80,34.9}}, color={0,0,0}),Line(points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},{-1.82,77.2},{0,80}}, color={0,0,0}),Text(extent={{-90,-46},{-18,-94}}, lineColor={192,192,192}, textString="atan2")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-100,0},{84,0}}, color={95,95,95}),Polygon(points={{96,0},{80,6},{80,-6},{96,0}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),Line(points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{69.9,-45.8},{80,-45.1}}, color={0,0,255}, thickness=0.5),Line(points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,-14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{62.1,33.5},{80,34.9}}, color={0,0,255}, thickness=0.5),Line(points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},{-1.82,77.2},{0,80}}, color={0,0,255}, thickness=0.5),Text(extent={{-32,89},{-10,74}}, textString="pi", lineColor={0,0,255}),Text(extent={{-32,-72},{-4,-88}}, textString="-pi", lineColor={0,0,255}),Text(extent={{0,55},{20,42}}, textString="pi/2", lineColor={0,0,255}),Line(points={{0,40},{-8,40}}, color={192,192,192}),Line(points={{0,-40},{-8,-40}}, color={192,192,192}),Text(extent={{0,-23},{20,-42}}, textString="-pi/2", lineColor={0,0,255}),Text(extent={{62,-4},{94,-26}}, lineColor={95,95,95}, textString="u1, u2"),Line(points={{-88,40},{86,40}}, color={175,175,175}, smooth=Smooth.None),Line(points={{-86,-40},{86,-40}}, color={175,175,175}, smooth=Smooth.None)}), Documentation(info="<HTML>
This function returns y = atan2(u1,u2) such that tan(y) = u1/u2 and
y is in the range -pi &lt; y &le; pi. u2 may be zero, provided
u1 is not zero. Usually u1, u2 is provided in such a form that
u1 = sin(y) and u2 = cos(y):
</p>

<p>
<img src=\"../Images/Math/atan2.png\">
</p>

</HTML>
"), Library="ModelicaExternalC");
    end atan2;

    function exp "Exponential, base e"
      extends baseIcon2;
      input Real u;
      output Real y;

      external "C" y=exp(u) ;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-90,-80.3976},{68,-80.3976}}, color={192,192,192}),Polygon(points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, color={0,0,0}),Text(extent={{-86,50},{-14,2}}, lineColor={192,192,192}, textString="exp")}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Line(points={{-100,-80.3976},{84,-80.3976}}, color={95,95,95}),Polygon(points={{98,-80.3976},{82,-74.3976},{82,-86.3976},{98,-80.3976}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, color={0,0,255}, thickness=0.5),Text(extent={{-31,72},{-11,88}}, textString="20", lineColor={0,0,255}),Text(extent={{-92,-81},{-72,-101}}, textString="-3", lineColor={0,0,255}),Text(extent={{66,-81},{86,-101}}, textString="3", lineColor={0,0,255}),Text(extent={{2,-69},{22,-89}}, textString="1", lineColor={0,0,255}),Text(extent={{78,-54},{98,-74}}, lineColor={95,95,95}, textString="u"),Line(points={{0,80},{88,80}}, color={175,175,175}, smooth=Smooth.None),Line(points={{80,84},{80,-84}}, color={175,175,175}, smooth=Smooth.None)}), Documentation(info="<html>
<p>
This function returns y = exp(u), with -&infin; &lt; u &lt; &infin;:
</p>

<p>
<img src=\"../Images/Math/exp.png\">
</p>
</html>"), Library="ModelicaExternalC");
    end exp;

    partial function baseIcon1 "Basic icon for mathematical function with y-axis on left side"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{-80,-80},{-80,68}}, color={192,192,192}),Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-150,150},{150,110}}, textString="%name", lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={95,95,95}),Line(points={{-80,-80},{-88,-80}}, color={95,95,95}),Line(points={{-80,-90},{-80,84}}, color={95,95,95}),Text(extent={{-75,104},{-55,84}}, lineColor={95,95,95}, textString="y"),Polygon(points={{-80,98},{-86,82},{-74,82},{-80,98}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
Icon for a mathematical function, consisting of an y-axis on the left side.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
    end baseIcon1;

    partial function baseIcon2 "Basic icon for mathematical function with y-axis in middle"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{0,-80},{0,68}}, color={192,192,192}),Polygon(points={{0,90},{-8,68},{8,68},{0,90}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-150,150},{150,110}}, textString="%name", lineColor={0,0,255})}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={95,95,95}),Line(points={{0,-80},{-8,-80}}, color={95,95,95}),Line(points={{0,-90},{0,84}}, color={95,95,95}),Text(extent={{5,104},{25,84}}, lineColor={95,95,95}, textString="y"),Polygon(points={{0,98},{-6,82},{6,82},{0,98}}, lineColor={95,95,95}, fillColor={95,95,95}, fillPattern=FillPattern.Solid)}), Documentation(revisions="<html>
<p>
Icon for a mathematical function, consisting of an y-axis in the middle.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
    end baseIcon2;

    annotation(Invisible=true, Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-59,-9},{42,-56}}, lineColor={0,0,0}, textString="f(x)")}), Documentation(info="<HTML>
<p>
This package contains <b>basic mathematical functions</b> (such as sin(..)),
as well as functions operating on <b>vectors</b> and <b>matrices</b>.
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

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Function tempInterpol2 added.</li>
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Icons for icon and diagram level introduced.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

</html>"));
  end Math;

  package SIunits "Library of type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Library2;
    package Conversions "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Library2;
      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Library2;
        type Temperature_degC= Real(final quantity="ThermodynamicTemperature", final unit="degC") "Absolute temperature in degree Celsius (for relative temperature use SIunits.TemperatureDifference)" annotation(__Dymola_absoluteValue=true);
        annotation(Documentation(info="<HTML>
<p>
This package provides predefined types, such as <b>Angle_deg</b> (angle in
degree), <b>AngularVelocity_rpm</b> (angular velocity in revolutions per
minute) or <b>Temperature_degF</b> (temperature in degree Fahrenheit),
which are in common use but are not part of the international standard on
units according to ISO 31-1992 \"General principles concerning quantities,
units and symbols\" and ISO 1000-1992 \"SI units and recommendations for
the use of their multiples and of certain other units\".</p>
<p>If possible, the types in this package should not be used. Use instead
types of package Modelica.SIunits. For more information on units, see also
the book of Francois Cardarelli <b>Scientific Unit Conversion - A
Practical Guide to Metrication</b> (Springer 1997).</p>
<p>Some units, such as <b>Temperature_degC/Temp_C</b> are both defined in
Modelica.SIunits and in Modelica.Conversions.NonSIunits. The reason is that these
definitions have been placed erroneously in Modelica.SIunits although they
are not SIunits. For backward compatibility, these type definitions are
still kept in Modelica.SIunits.</p>
</HTML>
"), Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-66,-13},{52,-67}}, lineColor={0,0,0}, textString="[km/h]")}));
      end NonSIunits;

      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-33,-7},{-92,-67}}, lineColor={0,0,0}, lineThickness=1, textString="°C"),Text(extent={{82,-7},{22,-67}}, lineColor={0,0,0}, textString="K"),Line(points={{-26,-36},{6,-36}}, color={0,0,0}),Polygon(points={{6,-28},{6,-45},{26,-37},{6,-28}}, pattern=LinePattern.None, fillColor={0,0,0}, fillPattern=FillPattern.Solid, lineColor={0,0,255})}), Documentation(info="<HTML>
<p>This package provides conversion functions from the non SI Units
defined in package Modelica.SIunits.Conversions.NonSIunits to the
corresponding SI Units defined in package Modelica.SIunits and vice
versa. It is recommended to use these functions in the following
way (note, that all functions have one Real input and one Real output
argument):</p>
<pre>
  <b>import</b> SI = Modelica.SIunits;
  <b>import</b> Modelica.SIunits.Conversions.*;
     ...
  <b>parameter</b> SI.Temperature     T   = from_degC(25);   // convert 25 degree Celsius to Kelvin
  <b>parameter</b> SI.Angle           phi = from_deg(180);   // convert 180 degree to radian
  <b>parameter</b> SI.AngularVelocity w   = from_rpm(3600);  // convert 3600 revolutions per minutes
                                                      // to radian per seconds
</pre>

</HTML>
"));
    end Conversions;

    type Angle= Real(final quantity="Angle", final unit="rad", displayUnit="deg");
    type Length= Real(final quantity="Length", final unit="m");
    type Position= Length;
    type Distance= Length(min=0);
    type Diameter= Length(min=0);
    type AngularVelocity= Real(final quantity="AngularVelocity", final unit="rad/s");
    type AngularAcceleration= Real(final quantity="AngularAcceleration", final unit="rad/s2");
    type Velocity= Real(final quantity="Velocity", final unit="m/s");
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2");
    type Mass= Real(quantity="Mass", final unit="kg", min=0);
    type Density= Real(final quantity="Density", final unit="kg/m3", displayUnit="g/cm3", min=0);
    type MomentOfInertia= Real(final quantity="MomentOfInertia", final unit="kg.m2");
    type Inertia= MomentOfInertia;
    type Force= Real(final quantity="Force", final unit="N");
    type Torque= Real(final quantity="Torque", final unit="N.m");
    type FaradayConstant= Real(final quantity="FaradayConstant", final unit="C/mol");
    annotation(Invisible=true, Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-63,-13},{45,-67}}, lineColor={0,0,0}, textString="[kg.m2]")}), Documentation(info="<html>
<p>This package provides predefined types, such as <i>Mass</i>,
<i>Angle</i>, <i>Time</i>, based on the international standard
on units, e.g.,
</p>

<pre>   <b>type</b> Angle = Real(<b>final</b> quantity = \"Angle\",
                     <b>final</b> unit     = \"rad\",
                     displayUnit    = \"deg\");
</pre>

<p>
as well as conversion functions from non SI-units to SI-units
and vice versa in subpackage
<a href=\"Modelica://Modelica.SIunits.Conversions\">Conversions</a>.
</p>

<p>
For an introduction how units are used in the Modelica standard library
with package SIunits, have a look at:
<a href=\"Modelica://Modelica.SIunits.UsersGuide.HowToUseSIunits\">How to use SIunits</a>.
</p>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p>

</html>", revisions="<html>
<ul>
<li><i>Dec. 14, 2005</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Add User's Guide and removed \"min\" values for Resistance and Conductance.</li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added new package <b>Conversions</b>. Corrected typo <i>Wavelenght</i>.</li>
<li><i>June 6, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced the following new types<br>
       type Temperature = ThermodynamicTemperature;<br>
       types DerDensityByEnthalpy, DerDensityByPressure,
       DerDensityByTemperature, DerEnthalpyByPressure,
       DerEnergyByDensity, DerEnergyByPressure<br>
       Attribute \"final\" removed from min and max values
       in order that these values can still be changed to narrow
       the allowed range of values.<br>
       Quantity=\"Stress\" removed from type \"Stress\", in order
       that a type \"Stress\" can be connected to a type \"Pressure\".</li>
<li><i>Oct. 27, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New types due to electrical library: Transconductance, InversePotential,
       Damping.</li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed from SIunit to SIunits. Subpackages expanded, i.e., the
       SIunits package, does no longer contain subpackages.</li>
<li><i>Aug 12, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Type \"Pressure\" renamed to \"AbsolutePressure\" and introduced a new
       type \"Pressure\" which does not contain a minimum of zero in order
       to allow convenient handling of relative pressure. Redefined
       BulkModulus as an alias to AbsolutePressure instead of Stress, since
       needed in hydraulics.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Bug-fix: Double definition of \"Compressibility\" removed
       and appropriate \"extends Heat\" clause introduced in
       package SolidStatePhysics to incorporate ThermodynamicTemperature.</li>
<li><i>April 8, 1998</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and Astrid Jaschinski:<br>
       Complete ISO 31 chapters realized.</li>
<li><i>Nov. 15, 1997</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.control.lth.se/~hubertus/\">Hubertus Tummescheit</a>:<br>
       Some chapters realized.</li>
</ul>
</html>"), Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{169,86},{349,236}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{169,236},{189,256},{369,256},{349,236},{169,236}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{369,256},{369,106},{349,86},{349,236},{369,256}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{179,226},{339,196}}, lineColor={160,160,164}, textString="Library"),Text(extent={{206,173},{314,119}}, lineColor={0,0,0}, textString="[kg.m2]"),Text(extent={{163,320},{406,264}}, lineColor={255,0,0}, textString="Modelica.SIunits")}));
  end SIunits;

  package Icons "Library of icons"
    partial package Library "Icon for library"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Rectangle(extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{-85,35},{65,-85}}, lineColor={0,0,255}, textString="Library"),Text(extent={{-120,122},{120,73}}, lineColor={255,0,0}, textString="%name")}), Documentation(info="<html>
<p>
This icon is designed for a <b>library</b>.
</p>
</html>"));
    end Library;

    partial package Library2 "Icon for library where additional icon elements shall be added"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={1,1}), graphics={Rectangle(extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{-120,125},{120,70}}, lineColor={255,0,0}, textString="%name"),Text(extent={{-90,40},{70,10}}, lineColor={160,160,164}, textString="Library")}), Documentation(info="<html>
<p>
This icon is designed for a <b>package</b> where a package
specific graphic is additionally included in the icon.
</p>
</html>"));
    end Library2;

    partial function Function "Icon for a function"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Text(extent={{-140,162},{136,102}}, textString="%name", lineColor={0,0,255}),Ellipse(extent={{-100,100},{100,-100}}, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Text(extent={{-100,100},{100,-100}}, lineColor={255,127,0}, textString="f")}), Documentation(info="<html>
<p>
This icon is designed for a <b>function</b>
</p>
</html>"));
    end Function;

    partial record Record "Icon for a record"
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,50},{100,-100}}, fillColor={255,255,127}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{-127,115},{127,55}}, textString="%name", lineColor={0,0,255}),Line(points={{-100,-50},{100,-50}}, color={0,0,0}),Line(points={{-100,0},{100,0}}, color={0,0,0}),Line(points={{0,50},{0,-100}}, color={0,0,0})}), Documentation(info="<html>
<p>
This icon is designed for a <b>record</b>
</p>
</html>"));
    end Record;

    type TypeReal "Icon for a Real type"
      extends Real;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={181,181,181}, fillPattern=FillPattern.Solid),Text(extent={{-94,94},{94,-94}}, lineColor={0,0,0}, textString="R")}), Documentation(info="<html>
<p>
This icon is designed for a <b>Real</b> type.
</p>
</html>"));
    end TypeReal;

    type TypeInteger "Icon for an Integer type"
      extends Integer;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={181,181,181}, fillPattern=FillPattern.Solid),Text(extent={{-94,94},{94,-94}}, lineColor={0,0,0}, textString="I")}), Documentation(info="<html>
<p>
This icon is designed for an <b>Integer</b> type.
</p>
</html>"));
    end TypeInteger;

    type TypeString "Icon for a String type"
      extends String;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0}, fillColor={181,181,181}, fillPattern=FillPattern.Solid),Text(extent={{-94,94},{94,-94}}, lineColor={0,0,0}, textString="S")}), Documentation(info="<html>
<p>
This icon is designed for a <b>String</b> type.
</p>
</html>"));
    end TypeString;

    annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{-120,135},{120,70}}, lineColor={255,0,0}, textString="%name"),Text(extent={{-90,40},{70,10}}, lineColor={160,160,164}, textString="Library"),Rectangle(extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{-90,40},{70,10}}, lineColor={160,160,164}, textString="Library"),Polygon(points={{-64,-20},{-50,-4},{50,-4},{36,-20},{-64,-20},{-64,-20}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Rectangle(extent={{-64,-20},{36,-84}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-60,-24},{32,-38}}, lineColor={128,128,128}, textString="Library"),Polygon(points={{50,-4},{50,-70},{36,-84},{36,-20},{50,-4}}, lineColor={0,0,0}, fillColor={192,192,192}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of
components which may be used in different libraries.
The icons can be utilized by inheriting them in the desired class
using \"extends\" or by directly copying the \"icon\" layer.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum fuer Luft und Raumfahrt e.V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added new icons <b>Function</b>, <b>Enumerations</b> and <b>Record</b>.</li>
<li><i>June 6, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Replaced <b>model</b> keyword by <b>package</b> if the main
       usage is for inheriting from a package.<br>
       New icons <b>GearIcon</b> and <b>MotorIcon</b>.</li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renaming package Icon to Icons.
       Model Advanced removed (icon not accepted on the Modelica meeting).
       New model Library2, which is the Library icon with enough place
       to add library specific elements in the icon. Icon also used in diagram
       level for models Info, TranslationalSensor, RotationalSensor.</li>
<li><i>July 15, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Model Caution renamed to Advanced, model Sensor renamed to
       TranslationalSensor, new model RotationalSensor.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version.</li>
</ul>
<br>
</html>"));
  end Icons;

  package Constants "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Library2;
    final constant Real e=Modelica.Math.exp(1.0);
    final constant Real pi=2*Modelica.Math.asin(1.0);
    final constant Real D2R=pi/180 "Degree to Radian";
    final constant Real R2D=180/pi "Radian to Degree";
    final constant Real eps=1e-15 "Biggest number such that 1.0 + eps = 1.0";
    final constant Real small=1e-60 "Smallest number such that small and -small are representable on the machine";
    final constant Real inf=1e+60 "Biggest Real number such that inf and -inf are representable on the machine";
    final constant Integer Integer_inf=1073741823 "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
    final constant SI.Velocity c=299792458 "Speed of light in vacuum";
    final constant SI.Acceleration g_n=9.80665 "Standard acceleration of gravity on earth";
    final constant Real G(final unit="m3/(kg.s2)")=6.6742e-11 "Newtonian constant of gravitation";
    final constant SI.FaradayConstant F=96485.3399 "Faraday constant, C/mol";
    final constant Real h(final unit="J.s")=6.6260693e-34 "Planck constant";
    final constant Real k(final unit="J/K")=1.3806505e-23 "Boltzmann constant";
    final constant Real R(final unit="J/(mol.K)")=8.314472 "Molar gas constant";
    final constant Real sigma(final unit="W/(m2.K4)")=5.6704e-08 "Stefan-Boltzmann constant";
    final constant Real N_A(final unit="1/mol")=6.0221415e+23 "Avogadro constant";
    final constant Real mue_0(final unit="N/A2")=4*pi*1e-07 "Magnetic constant";
    final constant Real epsilon_0(final unit="F/m")=1/(mue_0*c*c) "Electric constant";
    final constant NonSI.Temperature_degC T_zero=-273.15 "Absolute zero temperature";
    annotation(Documentation(info="<html>
<p>
This package provides often needed constants from mathematics, machine
dependent constants and constants from nature. The latter constants
(name, value, description) are from the following source:
</p>

<dl>
<dt>Peter J. Mohr and Barry N. Taylor (1999):</dt>
<dd><b>CODATA Recommended Values of the Fundamental Physical Constants: 1998</b>.
    Journal of Physical and Chemical Reference Data, Vol. 28, No. 6, 1999 and
    Reviews of Modern Physics, Vol. 72, No. 2, 2000. See also <a href=
\"http://physics.nist.gov/cuu/Constants/\">http://physics.nist.gov/cuu/Constants/</a></dd>
</dl>

<p>CODATA is the Committee on Data for Science and Technology.</p>

<dl>
<dt><b>Main Author:</b></dt>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 11 16<br>
    D-82230 We&szlig;ling<br>
    email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
</dl>


<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</html>
", revisions="<html>
<ul>
<li><i>Nov 8, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Constants updated according to 2002 CODATA values.</li>
<li><i>Dec 9, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants updated according to 1998 CODATA values. Using names, values
       and description text from this source. Included magnetic and
       electric constant.</li>
<li><i>Sep 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants eps, inf, small introduced.</li>
<li><i>Nov 15, 1997</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
</html>"), Invisible=true, Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}), graphics={Line(points={{-34,-38},{12,-38}}, color={0,0,0}, thickness=0.5),Line(points={{-20,-38},{-24,-48},{-28,-56},{-34,-64}}, color={0,0,0}, thickness=0.5),Line(points={{-2,-38},{2,-46},{8,-56},{14,-64}}, color={0,0,0}, thickness=0.5)}), Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{200,162},{380,312}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{200,312},{220,332},{400,332},{380,312},{200,312}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Polygon(points={{400,332},{400,182},{380,162},{380,312},{400,332}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, lineColor={0,0,255}),Text(extent={{210,302},{370,272}}, lineColor={160,160,164}, textString="Library"),Line(points={{266,224},{312,224}}, color={0,0,0}, thickness=1),Line(points={{280,224},{276,214},{272,206},{266,198}}, color={0,0,0}, thickness=1),Line(points={{298,224},{302,216},{308,206},{314,198}}, color={0,0,0}, thickness=1),Text(extent={{152,412},{458,334}}, lineColor={255,0,0}, textString="Modelica.Constants")}));
  end Constants;

end Modelica;
function PackMaterial
  input Real r;
  input Real g;
  input Real b;
  input Real spec;
  output Real packedMaterial;
  Integer i1;
  Integer i2;
  Integer i3;
  Integer i4;
algorithm 
  i1:=integer(floor(r*99));
  if i1 < 0 then 
    i1:=0;
  end if;
  if i1 > 99 then 
    i1:=99;
  end if;
  i2:=integer(floor(g*99));
  if i2 < 0 then 
    i2:=0;
  end if;
  if i2 > 99 then 
    i2:=99;
  end if;
  i3:=integer(floor(b*99));
  if i3 < 0 then 
    i3:=0;
  end if;
  if i3 > 99 then 
    i3:=99;
  end if;
  i4:=integer(floor(spec*9));
  if i4 < 0 then 
    i4:=0;
  end if;
  if i4 > 99 then 
    i4:=9;
  end if;
  packedMaterial:=((i1*100 + i2)*100 + i3)*10 + i4;
end PackMaterial;
function PackShape
  input String shape;
  output Real packedShape;
algorithm 
  if shape == "box" then 
    packedShape:=101.0;
  elseif shape == "sphere" then
    packedShape:=102.0;

  elseif shape == "cylinder" then
    packedShape:=103.0;

  elseif shape == "cone" then
    packedShape:=104.0;

  elseif shape == "pipe" then
    packedShape:=105.0;

  elseif shape == "beam" then
    packedShape:=106.0;

  elseif shape == "wirebox" then
    packedShape:=107.0;

  elseif shape == "gearwheel" then
    packedShape:=108.0;

  elseif shape == "pipecylinder" then
    packedShape:=110.0;

  elseif shape == "spring" then
    packedShape:=111.0;
  else
    packedShape:=200;
  end if;
end PackShape;
package ModelicaServices "Models and functions used in the Modelica Standard Library requiring a tool specific implementation"
  package Animation "Models and functions for 3-dim. animation"
    model Shape "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"
      extends Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;
      import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
      import SI = Modelica.SIunits;
      import Modelica.Mechanics.MultiBody.Frames;
      import Modelica.Mechanics.MultiBody.Types;
    protected 
      Real abs_n_x(final unit="1")=Modelica.Math.Vectors.length(lengthDirection) annotation(HideResult=true);
      Real e_x[3](each final unit="1")=noEvent(if abs_n_x < 1e-10 then {1,0,0} else lengthDirection/abs_n_x) annotation(HideResult=true);
      Real n_z_aux[3](each final unit="1")=cross(e_x, widthDirection) annotation(HideResult=true);
      Real e_y[3](each final unit="1")=noEvent(cross(Modelica.Math.Vectors.normalize(cross(e_x, if n_z_aux*n_z_aux > 1e-06 then widthDirection else if abs(e_x[1]) > 1e-06 then {0,1,0} else {1,0,0})), e_x)) annotation(HideResult=true);
      output Real Form annotation(HideResult=false);
    public 
      output Real rxvisobj[3](each final unit="1") "x-axis unit vector of shape, resolved in world frame" annotation(HideResult=false);
      output Real ryvisobj[3](each final unit="1") "y-axis unit vector of shape, resolved in world frame" annotation(HideResult=false);
      output SI.Position rvisobj[3] "position vector from world frame to shape frame, resolved in world frame" annotation(HideResult=false);
    protected 
      output SI.Length size[3] "{length,width,height} of shape" annotation(HideResult=false);
      output Real Material annotation(HideResult=false);
      output Real Extra annotation(HideResult=false);
    equation 
      Form=(987000 + PackShape(shapeType))*1e+20;
      rxvisobj=transpose(R.T)*e_x;
      ryvisobj=transpose(R.T)*e_y;
      rvisobj=r + T.resolve1(R.T, r_shape);
      size={length,width,height};
      Material=PackMaterial(color[1]/255.0, color[2]/255.0, color[3]/255.0, specularCoefficient);
      Extra=extra;
      annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}, grid={2,2}), graphics={Rectangle(extent={{-100,-100},{80,60}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Polygon(points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}}, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{100,100},{100,-60},{80,-100},{80,60},{100,100}}, lineColor={0,0,255}, fillColor={160,160,164}, fillPattern=FillPattern.Solid),Text(extent={{-100,-100},{80,60}}, lineColor={0,0,0}, textString="%shapeType"),Text(extent={{-132,160},{128,100}}, textString="%name", lineColor={0,0,255})}), Documentation(info="<html>

<p>
This model is documented at
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>.
</p>


</html>
"));
    end Shape;

  end Animation;

  annotation(preferredView="info", version="1.0", versionDate="2009-06-21", versionBuild=2, revisionId="$Id:: package.mo 3120 2009-11-08 18:22:04Z #$", Documentation(info="<html>
<p>
This package contains a set of functions and models to be used in the
Modelica Standard Library that requires a tool specific implementation.
These are:
</p>

<ul>
<li> <a href=\"Modelica://ModelicaServices.Animation.Shape\">ModelicaServices.Animation.Shape</a>.
     provides a 3-dim. visualization of
     mechanical objects. It is used in
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>
     via inheritance.</li>
</ul>

<p>
<b>Licensed by DLR and Dynasim under the Modelica License 2</b><br>
Copyright &copy; 2009, DLR and Dynasim.
</p>

<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty)
<a href=\"Modelica://ModelicaServices.UsersGuide.ModelicaLicense2\">here</a></u>
or at
<a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">
http://www.Modelica.org/licenses/ModelicaLicense2</a>.
</p>

</html>"), uses(Modelica(version="3.1")));
end ModelicaServices;
model Modelica_Mechanics_MultiBody_Parts_BodyCylinder
  extends Modelica.Mechanics.MultiBody.Parts.BodyCylinder;
end Modelica_Mechanics_MultiBody_Parts_BodyCylinder;
