package Modelica "Modelica Standard Library"
  extends Icons.Library;
  annotation(preferedView="info", version="2.2.1", versionDate="2006-03-24", conversion(from(version="1.6", ModelicaAdditions(version="1.5"), MultiBody(version="1.0.1"), MultiBody(version="1.0"), Matrices(version="0.8"), script="Scripts/ConvertModelica_from_1.6_to_2.1.mos"), from(version="2.1 Beta1", script="Scripts/ConvertModelica_from_2.1Beta1_to_2.1.mos"), noneFromVersion="2.1", noneFromVersion="2.2"), Dymola(checkSum="539989979:1143034484"), Settings(NewStateSelection=true), Documentation(info="<HTML>
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
<img src=\"./Images/UsersGuide/ModelicaLibraries.png\">
</p>
 
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.UsersGuide\">Users Guide</a>
     discusses some aspects of the Modelica Standard Library, such as
     interface definitions and used conventions.</li>
<li><a href=\"Modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the changes of new versions of this package.</li>
<li> Packages <b>Examples</b> in the various subpackages, demonstrate
     how to use the components of the corresponding sublibrary.</li>
</ul>
 
<p>
Copyright &copy; 1998-2006, Modelica Association.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
"));
  package Mechanics "Library to model 1-dim. and 3-dim. mechanical systems (multi-body, rotational, translational)"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-5,-40},{45,-70}}, fillPattern=FillPattern.HorizontalCylinder, fillColor={192,192,192}),Ellipse(extent={{-90,-50},{-80,-60}}, lineColor={0,0,0}),Line(points={{-85,-55},{-60,-21}}, color={0,0,0}, thickness=0.5),Ellipse(extent={{-65,-16},{-55,-26}}, lineColor={0,0,0}),Line(points={{-60,-21},{9,-55}}, color={0,0,0}, thickness=0.5),Ellipse(extent={{4,-50},{14,-60}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{-10,-34},{72,-34},{72,-76},{-10,-76}}, color={0,0,0})}), Documentation(info="<HTML>
<p>
This package contains components to model the movement
of 1-dim. rotational, 1-dim. translational, and
3-dim. <b>mechanical systems</b>.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>June 23, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       included the Mechanics.MultiBody library 1.0 and adapted it to the new
       Blocks connectors.</li>
<li><i>Oct. 27, 2003</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Bearing torque computation added to package <b>Rotational</b>.</li>
<li><i>Oct. 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New components and examples in package <b>Rotational</b>.</li>
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Changes according to the Twente meeting introduced. Especially,
       package Rotational1D renamed to Rotational and package
       Translational1D renamed to Translational. For the particular
       changes in these packages, see the corresponding package
       release notes.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version for 1-dimensional rotational mechanical
       systems based on an existing Dymola library of Martin Otter and
       Hilding Elmqvist.</li>
</ul>
</html>"));
    package Translational "Library to model 1-dimensional, translational mechanical systems"
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-84,-73},{66,-73}}, color={0,0,0}),Rectangle(extent={{-81,-22},{-8,-65}}, lineColor={0,0,0}, fillPattern=FillPattern.Sphere, fillColor={192,192,192}),Line(points={{-8,-43},{-1,-43},{6,-64},{17,-23},{29,-65},{40,-23},{50,-44},{61,-44}}, color={0,0,0}),Line(points={{-59,-73},{-84,-93}}, color={0,0,0}),Line(points={{-11,-73},{-36,-93}}, color={0,0,0}),Line(points={{-34,-73},{-59,-93}}, color={0,0,0}),Line(points={{14,-73},{-11,-93}}, color={0,0,0}),Line(points={{39,-73},{14,-93}}, color={0,0,0}),Line(points={{63,-73},{38,-93}}, color={0,0,0})}), Documentation(info="<html>
<p>
This package contains components to model <i>1-dimensional translational
mechanical</i> systems.
</p>
<p>
The <i>filled</i> and <i>non-filled green squares</i> at the left and
right side of a component represent <i>mechanical flanges</i>.
Drawing a line between such squares means that the corresponding
flanges are <i>rigidly attached</i> to each other. The components of this
library can be usually connected together in an arbitrary way. E.g. it is
possible to connect two springs or two sliding masses with inertia directly
together.
<p> The only <i>connection restriction</i> is that the Coulomb friction
elements (Stop) should be only connected
together provided a compliant element, such as a spring, is in between.
The reason is that otherwise the frictional force is not uniquely
defined if the elements are stuck at the same time instant (i.e., there
does not exist a unique solution) and some simulation systems may not be
able to handle this situation, since this leads to a singularity during
simulation. It can only be resolved in a \"clean way\" by combining the
two connected friction elements into
one component and resolving the ambiguity of the frictional force in the
stuck mode.
</p>
<p> Another restriction arises if the hard stops in model Stop are used, i. e.
the movement of the mass is limited by a stop at smax or smin.
<font color=\"#ff0000\"> <b>This requires the states Stop.s and Stop.v</b> </font>. If these states are eliminated during the index reduction
the model will not work. To avoid this any inertias should be connected via springs
to the Stop element, other sliding masses, dampers or hydraulic chambers must be avoided. </p>
<p>
In the <i>icon</i> of every component an <i>arrow</i> is displayed in grey
color. This arrow characterizes the coordinate system in which the vectors
of the component are resolved. It is directed into the positive
translational direction (in the mathematical sense).
In the flanges of a component, a coordinate system is rigidly attached
to the flange. It is called <i>flange frame</i> and is directed in parallel
to the component coordinate system. As a result, e.g., the positive
cut-force of a \"left\" flange (flange_a) is directed into the flange, whereas
the positive cut-force of a \"right\" flange (flange_b) is directed out of the
flange. A flange is described by a Modelica connector containing
the following variables:
</p>
<pre>
   SIunits.Position s  \"absolute position of flange\";
   <i>flow</i> Force f        \"cut-force in the flange\";
</pre>

<p>
This library is designed in a fully object oriented way in order that
components can be connected together in every meaningful combination
(e.g. direct connection of two springs or two shafts with inertia).
As a consequence, most models lead to a system of
differential-algebraic equations of <i>index 3</i> (= constraint
equations have to be differentiated twice in order to arrive at
a state space representation) and the Modelica translator or
the simulator has to cope with this system representation.
According to our present knowledge, this requires that the
Modelica translator is able to symbolically differentiate equations
(otherwise it is e.g. not possible to provide consistent initial
conditions; even if consistent initial conditions are present, most
numerical DAE integrators can cope at most with index 2 DAEs).
</p>

<dl>
<dt><b>Main Author:</b></dt>
<dd>Peter Beater <br>
    Universit&auml;t Paderborn, Abteilung Soest<br>
    Fachbereich Maschinenbau/Automatisierungstechnik<br>
    L&uuml;becker Ring 2 <br>
    D 59494 Soest <br>
    Germany <br>
    email: <A HREF=\"mailto:Beater@mailso.uni-paderborn.de\">Beater@mailso.uni-paderborn.de</A><br>
</dd>
</dl>

<p>
Copyright &copy; 1998-2006, Modelica Association and Universit&auml;t Paderborn, FB 12.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>

</HTML>
", revisions="<html>
<ul>
<li><i>Version 1.0 (January 5, 2000)</i>
       by Peter Beater <br>
       Realized a first version based on Modelica library Mechanics.Rotational
       by Martin Otter and an existing Dymola library onedof.lib by Peter Beater.
       <br>
<li><i>Version 1.01 (July 18, 2001)</i>
       by Peter Beater <br>
       Assert statement added to \"Stop\", small bug fixes in examples.
       <br><br>
</li>
</ul>
</html>"));
      package Interfaces "Interfaces for 1-dim. translational mechanical components"
        extends Modelica.Icons.Library;
        connector Flange_a "(left) 1D translational flange (flange axis directed INTO cut plane, e. g. from left to right)"
          annotation(defaultComponentName="flange_a", Documentation(info="<html>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
INTO the cut plane, i. e. from left to right. All vectors in the cut plane are
resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={0,191,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,-40},{40,40}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={0,191,0}),Text(extent={{-160,110},{40,50}}, fillColor={0,191,0}, lineColor={0,191,0}, textString="%name")}));
          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
        end Flange_a;
        connector Flange_b "right 1D translational flange (flange axis directed OUT OF cut plane)"
          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
          annotation(defaultComponentName="flange_b", Documentation(info="<html>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
OUT OF the cut plane. All vectors in the cut plane are resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,-40},{40,40}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(extent={{-40,110},{160,50}}, lineColor={0,191,0}, fillColor={0,191,0}, textString="%name")}));
        end Flange_b;
        partial model Rigid "Rigid connection of two translational 1D flanges "
          SI.Position s "absolute position of center of component (s = flange_a.s + L/2 = flange_b.s - L/2)";
          parameter SI.Length L=0 "length of component from left flange to right flange (= flange_b.s - flange_a.s)";
          Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane, i. e. from left to right)" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane, i. e. from right to left)" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Documentation(info="<html>
<p>
This is a 1D translational component with two <i>rigidly</i> connected flanges.
The distance between the left and the right flange is always constant, i. e. L.
The forces at the right and left flange can be different.
It is used e.g. to built up sliding masses.
</p>
</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>First Version from August 26, 1999 by P. Beater  (based on Rotational.Rigid)</i> </li>
</ul>
</html>"), Diagram, Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));

        equation 
          flange_a.s=s - L/2;
          flange_b.s=s + L/2;
        end Rigid;
        partial model Compliant "Compliant connection of two translational 1D flanges"
          Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane, e. g. from left to right)" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          SI.Distance s_rel "relative distance (= flange_b.s - flange_a.s)";
          SI.Force f "forcee between flanges (positive in direction of flange axis R)";
          annotation(Documentation(info="<html>
<p>
This is a 1D translational component with a <i>compliant </i>connection of two
translational 1D flanges where inertial effects between the two
flanges are not included. The absolute value of the force at the left and the right
flange is the same. It is used to built up springs, dampers etc.
</p>

</HTML>
", revisions="<html>
<p>
<b>Release Notes:</b></p>
<ul>
<li><i>First Version from August 26, 1999 by P. Beater (based on Rotational.Compliant)</i> </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{50,-90},{20,-80},{20,-100},{50,-90}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-60,-90},{20,-90}}, color={0,0,0})}));

        equation 
          s_rel=flange_b.s - flange_a.s;
          flange_b.f=f;
          flange_a.f=-f;
        end Compliant;
        annotation(Documentation(info="<html>
  
</html>"));
      end Interfaces;
      model SlidingMass "Sliding mass with inertia"
        extends Interfaces.Rigid;
        parameter SI.Mass m(min=0)=1 "mass of the sliding mass";
        SI.Velocity v "absolute velocity of component";
        SI.Acceleration a "absolute acceleration of component";
        annotation(Documentation(info="<html>
<p>
Sliding mass with <i>inertia, without friction</i> and two rigidly connected flanges.
</p>
<p>
The sliding mass has the length L, the position coordinate s is in the middle.
Sign convention: A positive force at flange flange_a moves the sliding mass in the positive direction.
A negative force at flange flange_a moves the sliding mass to the negative direction.
</p>

</html>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>First Version from August 26, 1999 by P. Beater (based on Rotational.Shaft)</i> </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{-55,0}}, color={0,191,0}),Line(points={{55,0},{100,0}}, color={0,191,0}),Rectangle(extent={{-55,-30},{56,30}}, lineColor={0,0,0}, fillPattern=FillPattern.Sphere, fillColor={255,255,255}),Polygon(points={{50,-90},{20,-80},{20,-100},{50,-90}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-60,-90},{20,-90}}, color={0,0,0}),Text(extent={{0,100},{0,40}}, fillColor={0,0,255}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{-55,0}}, color={0,191,0}),Line(points={{55,0},{100,0}}, color={0,191,0}),Rectangle(extent={{-55,-30},{55,30}}, lineColor={0,0,0}, fillPattern=FillPattern.Sphere, fillColor={255,255,255}),Polygon(points={{50,-90},{20,-80},{20,-100},{50,-90}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-60,-90},{20,-90}}, color={0,0,0}),Line(points={{-100,-29},{-100,-61}}, color={0,0,0}),Line(points={{100,-61},{100,-28}}, color={0,0,0}),Line(points={{-98,-60},{98,-60}}, color={0,0,0}),Polygon(points={{-101,-60},{-96,-59},{-96,-61},{-101,-60}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Polygon(points={{100,-60},{95,-61},{95,-59},{100,-60}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(extent={{-44,-41},{51,-57}}, textString="Length L"),Line(points={{0,30},{0,53}}, color={0,0,0}),Line(points={{-72,40},{1,40}}, color={0,0,0}),Polygon(points={{-7,42},{-7,38},{-1,40},{-7,42}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(extent={{-61,53},{-9,42}}, textString="Position s")}));

      equation 
        v=der(s);
        a=der(v);
        m*a=flange_a.f + flange_b.f;
      end SlidingMass;
      model Fixed "Fixed flange"
        parameter SI.Position s0=0 "fixed offset position of housing";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-40},{80,-40}}, color={0,0,0}),Line(points={{80,-40},{40,-80}}, color={0,0,0}),Line(points={{40,-40},{0,-80}}, color={0,0,0}),Line(points={{0,-40},{-40,-80}}, color={0,0,0}),Line(points={{-40,-40},{-80,-80}}, color={0,0,0}),Line(points={{0,-40},{0,-10}}, color={0,0,0}),Text(extent={{0,-90},{0,-150}}, fillColor={0,0,255}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-40},{80,-40}}, color={0,0,0}),Line(points={{80,-40},{40,-80}}, color={0,0,0}),Line(points={{40,-40},{0,-80}}, color={0,0,0}),Line(points={{0,-40},{-40,-80}}, color={0,0,0}),Line(points={{-40,-40},{-80,-80}}, color={0,0,0}),Line(points={{0,-40},{0,-4}}, color={0,0,0}),Polygon(points={{50,-90},{20,-80},{20,-100},{50,-90}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-60,-90},{20,-90}}, color={0,0,0})}), Documentation(info="<html>
<p>
The <i>flange</i> of a 1D translational mechanical system <i>fixed</i>
at an position s0 in the <i>housing</i>. May be used:
</p>
<ul>
<li> to connect a compliant element, such as a spring or a damper,
     between a sliding mass and the housing.
<li> to fix a rigid element, such as a sliding mass, at a specific
     position.
</ul>

</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>First Version from August 26, 1999 by P. Beater (based on Rotational.LockedR)</i> </li>
</ul>
</html>"));
        Interfaces.Flange_b flange_b annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=-180.0), iconTransformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=-180.0)));

      equation 
        flange_b.s=s0;
      end Fixed;
    end Translational;
  end Mechanics;
  package Math "Mathematical functions (e.g., sin, cos) and operations on matrices (e.g., norm, solve, eig, exp)"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Invisible=true, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(extent={{-59,-9},{42,-56}}, textString="f(x)", fillColor={0,0,0})}), Documentation(info="<HTML>
<p>
This package contains <b>basic mathematical functions</b> (such as sin(..)),
as well as functions operating on <b>matrices</b>.
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
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
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
    function asin "inverse sine (-1 <= u <= 1)"
      extends baseIcon2;
      input Real u;
      output SI.Angle y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-88,78},{-16,30}}, textString="asin", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(extent={{-40,-72},{-15,-88}}, textString="-pi/2"),Text(extent={{-38,88},{-13,72}}, textString=" pi/2"),Text(extent={{70,25},{90,5}}, textString="+1"),Text(extent={{-90,21},{-70,1}}, textString="-1"),Line(points={{-100,0},{84,0}}, color={192,192,192}),Polygon(points={{100,0},{84,6},{84,-6},{100,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{92,-2},{112,-22}}, textString="u", fillColor={160,160,160})}), Documentation(info="<html>
 
</html>"));

      external "C" y=asin(u) ;

    end asin;
    function exp "exponential, base e"
      extends baseIcon2;
      input Real u;
      output Real y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,-80.3976},{68,-80.3976}}, color={192,192,192}),Polygon(points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-86,50},{-14,2}}, textString="exp", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,-80.3976},{84,-80.3976}}, color={192,192,192}),Polygon(points={{100,-80.3976},{84,-74.3976},{84,-86.3976},{100,-80.3976}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-31,72},{-11,88}}, textString="20"),Text(extent={{-92,-83},{-72,-103}}, textString="-3"),Text(extent={{70,-83},{90,-103}}, textString="3"),Text(extent={{-18,-53},{2,-73}}, textString="1"),Text(extent={{96,-82},{116,-102}}, textString="u", fillColor={160,160,160})}));

      external "C" y=exp(u) ;

    end exp;
    function log "natural (base e) logarithm (u shall be > 0)"
      extends baseIcon1;
      input Real u;
      output Real y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-6,-24},{66,-72}}, textString="log", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{84,0}}, color={192,192,192}),Polygon(points={{100,0},{84,6},{84,-6},{100,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-105,72},{-85,88}}, textString="3"),Text(extent={{-109,-88},{-89,-72}}, textString="-3"),Text(extent={{70,-3},{90,-23}}, textString="20"),Text(extent={{-78,-1},{-58,-21}}, textString="1"),Text(extent={{92,-2},{112,-22}}, textString="u", fillColor={160,160,160})}), Documentation(info="<html>
    
</html>"));

      external "C" y=log(u) ;

    end log;
    partial function baseIcon1 "Basic icon for mathematical function with y-axis on left side"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(extent={{-75,110},{-55,90}}, textString="y", fillColor={160,160,160}),Polygon(points={{-80,100},{-86,84},{-74,84},{-80,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name")}));
    end baseIcon1;
    partial function baseIcon2 "Basic icon for mathematical function with y-axis in middle"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(points={{0,-90},{0,84}}, color={192,192,192}),Text(extent={{5,110},{25,90}}, textString="y", fillColor={160,160,160}),Polygon(points={{0,100},{-6,84},{6,84},{0,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name")}));
    end baseIcon2;
  end Math;
  package Electrical "Library for electrical models (analog, digital, machines, multi-phase)"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Documentation(info="<html>
<p>
This library contains electrical components to build up analog and digital circuits,
as well as machines to model electrical motors and generators,
especially three phase induction machines such as an asynchronous motor.
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-29,-13},{3,-27}}, lineColor={0,0,0}),Line(points={{37,-58},{62,-58}}, color={0,0,0}),Line(points={{36,-49},{61,-49}}, color={0,0,0}),Line(points={{-78,-50},{-43,-50}}, color={0,0,0}),Line(points={{-67,-55},{-55,-55}}, color={0,0,0}),Line(points={{-61,-50},{-61,-20},{-29,-20}}, color={0,0,0}),Line(points={{3,-20},{48,-20},{48,-49}}, color={0,0,0}),Line(points={{48,-58},{48,-78},{-61,-78},{-61,-55}}, color={0,0,0})}));
    package Analog "Library for analog electrical models"
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Window(x=0.05, y=0.06, width=0.16, height=0.58, library=1, autolayout=1), classOrder={"Examples","*"}, Documentation(info="<html>
<p>
This package contains packages for analog electrical components:
<ul>
<li>Basic: basic components (resistor, capacitor, conductor, inductor, transformer, gyrator)</li>
<li>Semiconductors: semiconductor devices (diode, bipolar and MOS transistors)</li>
<li>Lines: transmission lines (lossy and lossless)</li>
<li>Ideal: ideal elements (switches, diode, transformer, idle, short, ...)</li>
<li>Sources: time-dependend and controlled voltage and current sources</li>
<li>Sensors: sensors to measure potential, voltage, and current</li>
</ul>
</p>
<dl>
<dt>
<b>Main Authors:</b></dt>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden</dd>
</dl>
 
 
<p>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
"));
      package Sources "Time-dependend and controlled voltage and current sources"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains time-dependend and controlled voltage and current sources.
</p>

</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>"));
        model StepVoltage "Step voltage source"
          parameter SI.Voltage V=1 "Height of step";
          extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Step signalSource(height=V) );
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,-70},{0,-70},{0,70},{69,70}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-80,-18},{0,-18},{0,50},{80,50}}, color={0,0,0}, thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(lineColor={0,0,255}, extent={{70,-80},{94,-100}}, textString="time", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-21,-72},{25,-90}}, textString="startTime", fillColor={160,160,160}),Line(points={{0,-17},{0,-71}}, color={192,192,192}, pattern=LinePattern.Dash),Text(lineColor={0,0,255}, extent={{-68,-36},{-22,-54}}, textString="offset", fillColor={160,160,160}),Line(points={{-13,50},{-13,-17}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{2,50},{-19,50},{2,50}}, lineColor={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-13,50},{-16,37},{-9,37},{-13,50}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-68,26},{-22,8}}, textString="V", fillColor={160,160,160}),Polygon(points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-13,-18},{-13,-70}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-67,93},{-2,67}}, textString="v = p.v - n.v", fillColor={160,160,160})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
        end StepVoltage;
      end Sources;
      package Interfaces "Connectors and partial models for Analog electrical components"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains connectors and interfaces (partial models) for
analog electrical components.
</p>

</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
</dl>

<b>Copyright:</b>
<dl>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>

<ul>
<li><i> 1998</i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
        connector Pin "Pin of an electrical component"
          SI.Voltage v "Potential at the pin";
          flow SI.Current i "Current flowing into the pin";
          annotation(defaultComponentName="pin", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
        end Pin;
        connector PositivePin "Positive pin of an electric component"
          extends Pin;
          annotation(defaultComponentName="pin_p", Documentation(info="<html><p>Connectors PositivePin
and NegativePin are nearly identical.
The only difference is that the icons are different in order
to identify more easily the pins of a component. Usually,
connector PositivePin is used for the positive and
connector NegativePin for the negative pin of an electrical
component.</p></html>", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255}),Text(extent={{-160,110},{40,50}}, textString="%name", fillColor={0,0,255})}));
        end PositivePin;
        connector NegativePin "Negative pin of an electric component"
          extends Pin;
          annotation(defaultComponentName="pin_n", Documentation(info="<html><p>Connectors PositivePin
and NegativePin are nearly identical.
The only difference is that the icons are different in order
to identify more easily the pins of a component. Usually,
connector PositivePin is used for the positive and
connector NegativePin for the negative pin of an electrical
component.</p></html>", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,40},{40,-40}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Text(extent={{-40,110},{160,50}}, fillColor={0,0,255}, textString="%name")}));
        end NegativePin;
        partial model OnePort "Component with two electrical pins p and n and current i from p to n"
          SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
          SI.Current i "Current flowing from pin p to pin n";
          annotation(Documentation(info="<HTML>
<P>
Superclass of elements which have <b>two</b> electrical pins:
the positive pin connector <i>p</i>, and the negative pin
connector <i>n</i>. It is assumed that the current flowing
into pin p is identical to the current flowing out of pin n.
This current is provided explicitly as current i.
</P>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-110,20},{-85,20}}, color={160,160,160}),Polygon(points={{-95,23},{-85,20},{-95,17},{-95,23}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{90,20},{115,20}}, color={160,160,160}),Line(points={{-125,0},{-115,0}}, color={160,160,160}),Line(points={{-120,-5},{-120,5}}, color={160,160,160}),Text(extent={{-110,25},{-90,45}}, textString="i", fillColor={160,160,160}),Polygon(points={{105,23},{115,20},{105,17},{105,23}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{115,0},{125,0}}, color={160,160,160}),Text(extent={{90,45},{110,25}}, textString="i", fillColor={160,160,160})}));
          PositivePin p "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          NegativePin n "Negative pin" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));

        equation 
          v=p.v - n.v;
          0=p.i + n.i;
          i=p.i;
        end OnePort;
        partial model VoltageSource "Interface for voltage sources"
          extends OnePort;
          parameter SI.Voltage offset=0 "Voltage offset";
          parameter SI.Time startTime=0 "Time offset";
          annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name"),Line(visible=true, points={{-90,0},{90,0}}),Text(visible=true, fillColor={0,0,255}, extent={{-120,0},{-20,50}}, textString="+"),Text(visible=true, fillColor={0,0,255}, extent={{20,0},{120,50}}, textString="-")}));
          replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset=offset, final startTime=startTime) annotation(Placement(transformation(x=80.0, y=80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));

        equation 
          v=signalSource.y;
        end VoltageSource;
      end Interfaces;
      package Basic "Basic electrical components such as resistor, capacitor, transformer"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<HTML>
<p>
This package contains basic analog electrical components.
</p>

</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
</dl>
</html>"));
        model Ground "Ground node"
          annotation(Documentation(info="<HTML>
<P>
Ground of an electrical circuit. The potential at the
ground node is zero. Every electrical circuit has to contain
at least one ground object.
</P>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-60,50},{60,50}}, color={0,0,255}),Line(points={{-40,30},{40,30}}, color={0,0,255}),Line(points={{-20,10},{20,10}}, color={0,0,255}),Line(points={{0,90},{0,50}}, color={0,0,255}),Text(extent={{-144,-60},{138,0}}, fillColor={0,0,255}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-60,50},{60,50}}, color={0,0,255}, thickness=0.5),Line(points={{-40,30},{40,30}}, color={0,0,255}, thickness=0.5),Line(points={{-20,10},{20,10}}, color={0,0,255}, thickness=0.5),Line(points={{0,96},{0,50}}, color={0,0,255}, thickness=0.5),Text(extent={{-24,-38},{22,-6}}, textString="p.v=0")}));
          Interfaces.Pin p annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));

        equation 
          p.v=0;
        end Ground;
        model Resistor "Ideal linear electrical resistor"
          extends Interfaces.OnePort;
          parameter SI.Resistance R=1 "Resistance";
          annotation(Documentation(info="<HTML>
<P>
The linear resistor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <i>i*R = v</i>.
The Resistance <i>R</i> is allowed to be positive, zero, or negative.
</P>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{-90,0},{-70,0}}, color={0,0,255}),Line(points={{70,0},{90,0}}, color={0,0,255}),Text(extent={{-144,-60},{144,-100}}, textString="R=%R", fillColor={0,0,0}),Text(extent={{-144,40},{144,100}}, fillColor={0,0,255}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}),Line(points={{-96,0},{-70,0}}, color={0,0,255}),Line(points={{70,0},{96,0}}, color={0,0,255})}));

        equation 
          R*i=v;
        end Resistor;
      end Basic;
    end Analog;
  end Electrical;
  package Blocks "Library for basic input/output control blocks (continuous, discrete, logical, table blocks)"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-32,-6},{16,-35}}, lineColor={0,0,0}),Rectangle(extent={{-32,-56},{16,-85}}, lineColor={0,0,0}),Line(points={{16,-20},{49,-20},{49,-71},{16,-71}}, color={0,0,0}),Line(points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}, color={0,0,0}),Polygon(points={{16,-71},{29,-67},{29,-74},{16,-71}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Polygon(points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
This library contains input/output blocks to build up block diagrams.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<br>
<br>

<p>
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
", revisions="<html>
<ul>
<li><i>June 23, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced new block connectors and adapated all blocks to the new connectors.
       Included subpackages Continuous, Discrete, Logical, Nonlinear from
       package ModelicaAdditions.Blocks.
       Included subpackage ModelicaAdditions.Table in Modelica.Blocks.Sources
       and in the new package Modelica.Blocks.Tables.
       Added new blocks to Blocks.Sources and Blocks.Logical.
       </li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New subpackage Examples, additional components.
       </li>
<li><i>June 20, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
       Michael Tiller:<br>
       Introduced a replaceable signal type into
       Blocks.Interfaces.RealInput/RealOutput:
<pre>
   replaceable type SignalType = Real
</pre>
       in order that the type of the signal of an input/output block
       can be changed to a physical type, for example:
<pre>
   Sine sin1(outPort(redeclare type SignalType=Modelica.SIunits.Torque))
</pre>
      </li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed to Blocks. New subpackages Math, Nonlinear.
       Additional components in subpackages Interfaces, Continuous
       and Sources. </li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
    package Sources "Signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.Library;
      annotation(preferedView="info", Documentation(info="<HTML>
<p>
This package contains <b>source</b> components, i.e., blocks which
have only output signals. These blocks are used as signal generators
for Real, Integer and Boolean signals.
</p>

<p>
All Real source signals (with the exception of the Constant source)
have at least the following two parameters:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>offset</b></td>
      <td>Value which is added to the signal</td>
  </tr>
  <tr><td><b>startTime</b></td>
      <td>Start time of signal. For time &lt; startTime,
                the output y is set to offset.</td>
  </tr>
</table>

<p>
The <b>offset</b> parameter is especially useful in order to shift
the corresponding source, such that at initial time the system
is stationary. To determine the corresponding value of offset,
usually requires a trimming calculation.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Integer sources added. Step, TimeTable and BooleanStep slightly changed.</li>
<li><i>Nov. 8, 1999</i>
       by <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <A HREF=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</A>,
       <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New sources: Exponentials, TimeTable. Trapezoid slightly enhanced
       (nperiod=-1 is an infinite number of periods).</li>
<li><i>Oct. 31, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <A HREF=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</A>,
       All sources vectorized. New sources: ExpSine, Trapezoid,
       BooleanConstant, BooleanStep, BooleanPulse, SampleTrigger.
       Improved documentation, especially detailed description of
       signals in diagram layer.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"), Icon(coordinateSystem(extent={{100,-100},{-100,100}})), Diagram(coordinateSystem(extent={{0,0},{430,442}})));
      block Step "Generate step signal of type Real"
        parameter Real height=1 "Height of step";
        extends Interfaces.SignalSource;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-70},{0,-70},{0,50},{80,50}}, color={0,0,0}),Text(extent={{-150,-150},{150,-110}}, textString="startTime=%startTime", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-80,-18},{0,-18},{0,50},{80,50}}, color={0,0,0}, thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(extent={{70,-80},{94,-100}}, textString="time", fillColor={160,160,160}),Text(extent={{-21,-72},{25,-90}}, textString="startTime", fillColor={160,160,160}),Line(points={{0,-17},{0,-71}}, color={192,192,192}, pattern=LinePattern.Dash),Text(extent={{-68,-36},{-22,-54}}, textString="offset", fillColor={160,160,160}),Line(points={{-13,50},{-13,-17}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{2,50},{-19,50},{2,50}}, lineColor={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-13,50},{-16,37},{-9,37},{-13,50}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-68,26},{-22,8}}, textString="height", fillColor={160,160,160}),Polygon(points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-13,-18},{-13,-70}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-72,100},{-31,80}}, textString="y", fillColor={160,160,160})}), Documentation(info="<html>

</html>"));

      equation 
        y=offset + (if time < startTime then 0 else height);
      end Step;
    end Sources;
    package Interfaces "Connectors and partial models for input/output blocks"
      import Modelica.SIunits;
      extends Modelica.Icons.Library;
      annotation(preferedView="info", Documentation(info="<HTML>
<p>
This package contains interface definitions for
<b>continuous</b> input/output blocks with Real,
Integer and Boolean signals. Furthermore, it contains
partial models for continuous and discrete blocks.
</p>

</HTML>
", revisions="<html>
<ul>
<li><i>Oct. 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added several new interfaces. <a href=\"../Documentation/ChangeNotes1.5.html\">Detailed description</a> available.
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       RealInputSignal renamed to RealInput. RealOutputSignal renamed to
       output RealOutput. GraphBlock renamed to BlockIcon. SISOreal renamed to
       SISO. SOreal renamed to SO. I2SOreal renamed to M2SO.
       SignalGenerator renamed to SignalSource. Introduced the following
       new models: MIMO, MIMOs, SVcontrol, MVcontrol, DiscreteBlockIcon,
       DiscreteBlock, DiscreteSISO, DiscreteMIMO, DiscreteMIMOs,
       BooleanBlockIcon, BooleanSISO, BooleanSignalSource, MI2BooleanMOs.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>
"), Icon(coordinateSystem(extent={{100,-100},{-100,100}})), Diagram(coordinateSystem(extent={{0,0},{733,491}})));
      connector RealSignal "Real port (both input/output possible)"
        replaceable type SignalType= Real;
        extends SignalType;
        annotation(Documentation(info="<html>
<p>
Connector with one signal of type Real (no icon, no input/output prefix).
</p>
</html>"));
      end RealSignal;
      connector RealOutput= output RealSignal "'output Real' as connector" annotation(defaultComponentName="y", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,127}, fillColor={255,255,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,50},{0,0},{-100,-50},{-100,50}}, fillPattern=FillPattern.Solid, lineColor={0,0,127}, fillColor={255,255,255}),Text(extent={{-100,140},{130,60}}, textString="%name", fillColor={0,0,127})}), Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"));
      partial block BlockIcon "Basic graphical layout of input/output block"
        annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name")}));
      end BlockIcon;
      partial block SO "Single Output continuous control block"
        extends BlockIcon;
        RealOutput y "Connector of Real output signal" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        annotation(Diagram, Documentation(info="<html>
<p>
Block has one continuous Real output signal.
</p>
</html>"));
      end SO;
      partial block SignalSource "Base class for continuous signal source"
        extends SO;
        parameter Real offset=0 "offset of output signal";
        parameter SIunits.Time startTime=0 "output = offset for time < startTime";
        annotation(Documentation(info="<html>
<p>
Basic block for Real sources of package Blocks.Sources.
This component has one continuous Real output signal y
and two parameters (offset, startTime) to shift the
generated signal.
</p>
</html>"));
      end SignalSource;
    end Interfaces;
  end Blocks;
  package SIunits "Type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Invisible=true, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(extent={{-63,-13},{45,-67}}, textString="[kg.m2]", fillColor={0,0,0})}), Documentation(info="<html>
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
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

</html>", revisions="<html>
<ul>
<li><i>Dec. 14, 2005</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Add users guide and removed \"min\" values for Resistance and Conductance.</li>
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
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{169,86},{349,236}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{169,236},{189,256},{369,256},{349,236},{169,236}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{369,256},{369,106},{349,86},{349,236},{369,256}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(extent={{179,226},{339,196}}, textString="Library", fillColor={160,160,160}),Text(extent={{206,173},{314,119}}, textString="[kg.m2]", fillColor={0,0,0}),Text(extent={{163,320},{406,264}}, textString="Modelica.SIunits", fillColor={255,0,0})}));
    package Conversions "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(extent={{-33,-7},{-92,-67}}, textString="°C", fillColor={0,0,0}, lineThickness=1.0),Text(extent={{82,-7},{22,-67}}, textString="K", fillColor={0,0,0}),Line(points={{-26,-36},{6,-36}}, color={0,0,0}),Polygon(points={{6,-28},{6,-45},{26,-37},{6,-28}}, fillPattern=FillPattern.Solid, pattern=LinePattern.None, fillColor={0,0,0})}), Documentation(info="<HTML>
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
      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Library2;
        type Temperature_degC= Real(final quantity="ThermodynamicTemperature", final unit="degC");
        annotation(preferedView="info", Documentation(info="<HTML>
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
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(extent={{-66,-13},{52,-67}}, textString="[rev/min]", fillColor={0,0,0})}));
      end NonSIunits;
    end Conversions;
    type Angle= Real(final quantity="Angle", final unit="rad", displayUnit="deg");
    type Length= Real(final quantity="Length", final unit="m");
    type Position= Length;
    type Distance= Length(min=0);
    type Area= Real(final quantity="Area", final unit="m2");
    type Time= Real(final quantity="Time", final unit="s");
    type Velocity= Real(final quantity="Velocity", final unit="m/s");
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2");
    type Mass= Real(quantity="Mass", final unit="kg", min=0);
    type Force= Real(final quantity="Force", final unit="N");
    type ElectricCurrent= Real(final quantity="ElectricCurrent", final unit="A");
    type Current= ElectricCurrent;
    type ElectricPotential= Real(final quantity="ElectricPotential", final unit="V");
    type Voltage= ElectricPotential;
    type MagneticPotentialDifference= Real(final quantity="MagneticPotential", final unit="A");
    type MagneticFluxDensity= Real(final quantity="MagneticFluxDensity", final unit="T");
    type MagneticFlux= Real(final quantity="MagneticFlux", final unit="Wb");
    type RelativePermeability= Real(final quantity="RelativePermeability", final unit="1");
    type Resistance= Real(final quantity="Resistance", final unit="Ohm");
    type Reluctance= Real(final quantity="Reluctance", final unit="H-1");
    type CrossSection= Real(final quantity="Area", final unit="m2");
  end SIunits;
  package Icons "Icon definitions"
    annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of
components which may be used in different libraries.
The icons can be utilized by inheriting them in the desired class
using \"extends\".
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
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,135}}, textString="%name"),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library"),Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-64,-20},{-50,-4},{50,-4},{36,-20},{-64,-20},{-64,-20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-64,-84},{36,-20}}),Text(visible=true, fillColor={128,128,128}, extent={{-60,-38},{32,-24}}, textString="Library"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-4},{50,-70},{36,-84},{36,-20},{50,-4}})}));
    partial package Library "Icon for library"
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-85,-85},{65,35}}, textString="Library"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,122}}, textString="%name")}));
    end Library;
    partial package Library2 "Icon for library where additional icon elements shall be added"
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,125}}, textString="%name"),Text(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-90,10},{70,40}}, textString="Library")}));
    end Library2;
    partial model Example "Icon for an example model"
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85,-85},{65,35}}, textString="Example"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name")}));
    end Example;
    partial function Function "Icon for a function"
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-140,102},{136,162}}, textString="%name"),Ellipse(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={255,127,0}, extent={{-100,-100},{100,100}}, textString="f")}));
    end Function;
  end Icons;
  package Constants "Mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Library2;
    constant Real e=Modelica.Math.exp(1.0);
    constant Real pi=2*Modelica.Math.asin(1.0);
    constant Real D2R=pi/180 "Degree to Radian";
    constant Real R2D=180/pi "Radian to Degree";
    constant Real eps=1e-15 "Biggest number such that 1.0 + eps = 1.0";
    constant Real small=1e-60 "Smallest number such that small and -small are representable on the machine";
    constant Real inf=1e+60 "Biggest Real number such that inf and -inf are representable on the machine";
    constant Integer Integer_inf=1073741823 "Biggest Integer number such that Integer_inf and -Integer_inf are representable on the machine";
    constant SI.Velocity c=299792458 "Speed of light in vacuum";
    constant SI.Acceleration g_n=9.80665 "Standard acceleration of gravity on earth";
    constant Real G(final unit="m3/(kg.s2)")=6.6742e-11 "Newtonian constant of gravitation";
    constant Real h(final unit="J.s")=6.6260693e-34 "Planck constant";
    constant Real k(final unit="J/K")=1.3806505e-23 "Boltzmann constant";
    constant Real R(final unit="J/(mol.K)")=8.314472 "Molar gas constant";
    constant Real sigma(final unit="W/(m2.K4)")=5.6704e-08 "Stefan-Boltzmann constant";
    constant Real N_A(final unit="1/mol")=6.0221415e+23 "Avogadro constant";
    constant Real mue_0(final unit="N/A2")=4*pi*1e-07 "Magnetic constant";
    constant Real epsilon_0(final unit="F/m")=1/(mue_0*c*c) "Electric constant";
    constant NonSI.Temperature_degC T_zero=-273.15 "Absolute zero temperature";
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
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-34,-38},{12,-38}}, color={0,0,0}, thickness=0.5),Line(points={{-20,-38},{-24,-48},{-28,-56},{-34,-64}}, color={0,0,0}, thickness=0.5),Line(points={{-2,-38},{2,-46},{8,-56},{14,-64}}, color={0,0,0}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})));
  end Constants;
end Modelica;

package Magnetic "Library for electromagnetic actuators and drives based on magnetic flux tubes"
  annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.45, y=0.01, width=0.44, height=0.65, library=1, autolayout=1), Documentation(info="<html>
<br>
This library contains components to model magnetic actuators and drives, e.g. eletro-magneto-mechanical linear actuators or rotational electrical machines. In these devices, magnetic fields imposed by coils and/or permanent magnets are utilised for generation of a force respectively torque. For modeling in this library, the conept of <i>magnetic flux tubes</i> is utilised  where distribution of the magnetic field inside an actuator is described with a <i>magnetic network</i>. These network models are suited for both coarse design of the magnetic subsystem of actuators as well as for dynamic simulation  at system level together with neighboring subsystems. Currently, the library contains the following sublibraries:
<ul>
<li><b>Interfaces: </b>Definition of connectors and a magnetic flux tube partial model</li>
<li><b>Reluctance: </b>Basic flux tube geometries and selected reluctance elements for stray flux through air - to be extended</li>
<li><b>Sources: </b>Sources of a magnetic potential difference</li>
<li><b>Material: </b>Material properties of ferromagnetic and permanent magnetic materials - to be extended</li>
<li><b>Solenoid: </b>Model(s) of electromagnetic actuator(s) - to be extended</li>
<li><b>Examples: </b>Exemplary usage of actuator models</li>
</ul>

</p>
<br>
<h3>Overview on the Conept of Magnetic Flux Tubes</h3>
<p>
Following below, the concept of magnetic flux tubes is outlined in short. For a detailed description of flux tube elements, please have a look at the literature listed in the References section.
</p>
<p>
Magnetic flux tubes enable for modeling of magnetic fields with networks. The figure below and the following equations illustrate the transition from the original magnetic field quantities described by <i>Maxwell</i>'s equations to network elements with a flow variable and an across variable:
<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/magnetic_flux_tube_schematic.png\" ALT=\"Magnetic flux tube\"></p>
</dd>
</dl>
<br>
For a region with an approximately homogeneous distribution of the magnetic field strength <b>H</b> and the magnetic flux density <b>B</b> through cross sectional area <i>A</i> at each length coordinate <i>s</i>  (<i>A</i> perpendicular to the direction of the magnetic field lines), a magnetic reluctance <i>R<sub>mag</sub></i> can be defined:<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/equation_3.png\" ALT=\"Transition from field quantities to flow- and across variables\"></p>
</dd>
</dl>
With the definition of a magnetic potential difference <i>V<sub>mag</sub></i> as across variable and the magnetic flux <i><font face=\"Symbol\">F</font></i> as flow variable, a reluctance element <i>R<sub>mag</sub></i> can be defined analogue to resistive network elements in other physical domains. With <i>Maxwell</i>'s constitutive equation<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/equation_5.png\" ALT=\"Maxwell's constitutive equation\"></p>
</dd>
</dl>
the general formula for calculation of a magnetic reluctance <i>R<sub>mag</sub></i> from its gemotetry and material properties is:<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/equation_6.png\" ALT=\"General formula for calculation of a magnetic reluctance\"></p>
</dd>
</dl>
For a prismatic or cylindrical volume of length <i>l</i> and cross sectional area <i>A</i> with the magnetic flux entering and leaving the region through its end planes, the above equation simplifies to:<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/equation_7.png\" ALT=\"Magnetic reluctance of a prismatic or cylindrical volume\"></p>
</dd>
</dl>
<p>
Similar equations can be derived for other geometric shapes. Network elements for sources of a magnetic potential difference <i>V<sub>mag</sub></i>, e.g. coils or permanent magnets can be given, too. 
</p>
<p>
The resulting network models for actuators reflect the main dimensions of the device as well as its  material properties. They are hence suited for coarse design of the geometry of magnetic actuators. 
Due to the little computational effort of the magnetic networks, dynamic behavior of the devices can be simulated during system design efficiently. 
</p>
<hr>
<br>
<h4>References</h4>
<p>
<dl>
<dt>
A first realisation of this Magnetic library is described in:</dt>
<dd>
<p><i>B&ouml;drich, Th.; Roschke, Th.</i>: A Magnetic Library for Modelica. Proceedings of the 4<sup>th</sup> International Modelica Conference. Hamburg, Germany, March 7-8, 2005</p>
</dd>
<dt>
The method of magnetic flux tubes as well as derivation of many flux tube geometries is explained in detail in:</dt>
<dd>
<p><i>Roters, H.</i>: Electromagnetic Devices. New York: John Wiley & Sons 1941.</p>
</dd>
<dt>
Structure, properties, applications and design of translational electromagnetic actuators are thoroughly described in:</dt>
<dd>
<p><i>Kallenbach, E.; Eick, R.; Quendt, P.; Str&ouml;hla, T.; Feindt, K.; Kallenbach, M.</i>: Elektromagnete: Grundlagen, Berechnung, Entwurf und Anwendung. 2. Aufl. Wiesbaden: B.G. Teubner 2003   and</p>
</dd>
<dd>
<p><i>Roschke, Th.</i>: Entwurf geregelter elektromagnetischer Antriebe f&uuml;r Luftsch&uuml;tze. D&uuml;sseldorf: VDI-Verlag 2000.</p>
</dd>
<dt>
Application of the method of magnetic flux tubes for the design of rotational electrical machines is explained in:</dt>
<dd>
<p><i>Hendershot, J.R. Jr.; Miller, T.J.E.</i>: Design of Brushless Permanent-Magnet Motors. Magna Physics Publishing and Oxford University Press 1994.</p>
</dd>
</dl>
</p>
<hr>
<br>
This first version of the Magnetic library is not yet complete. Improvements and add-ons are planned for future releases, as for example: 
<ul>
<li>additional flux tube geometries, especially reluctance elements for stray flux through air,</li>
<li>provision of pre-defined air gap models with both working flux and stray flux for different pole shapes, </li>
<li>estimation of eddy current losses in flux tube elements with electrical conductivity and</li>
<li>more versatile and refined description of material data, e.g. with B-splines.</li>
</ul>
Also note that composite models are not restricted to solenoid actuators. Models for different actuator types such as electrodynamic actuators (voice coils) or rotational electrical machines can be built with the reluctance and source elements of this library, too.
<br>
<br>
<hr>
<br>
<dl>
<dt>
<b>Main Author:</b></dt>
<br>
<dd>
    Thomas B&ouml;drich<br>
    Dresden University of Technology<br>
    Institute of Electromechanical and Electronic Design<br>
    01062 Dresden, Germany<br>
    Phone: ++49 - 351 - 463 36296<br>
    Fax: ++49 - 351 - 463 37183<br>
    email: <A HREF=\"mailto:Thomas.Boedrich@mailbox.tu-dresden.de\">Thomas.Boedrich@mailbox.tu-dresden.de</A><br></dd>
</dl>
<br>
<br>
<dl>
<dt>
<b>Copyright:</b></dt>
<br>
<dd>
Copyright (C) 2005, Modelica Association and Thomas B&ouml;drich.<br>
<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package 
Modelica in file \"Modelica/package.mo\".</i></dd>
</dl>
<br>
</HTML>
"), Icon(Rectangle(extent=[36,2;60,-84], style(color=0)), Line(points=[20,2;-60,2;-60,-84;20,-84;20,-62;-36,-62;-36,-20;20,-20;20,2], style(color=0)), Line(points=[-64,-22;-32,-30], style(color=0)), Line(points=[-64,-30;-32,-38], style(color=0)), Line(points=[-64,-38;-32,-46], style(color=0)), Line(points=[-64,-46;-32,-54], style(color=0)), Line(points=[-64,-54;-32,-62], style(color=0)), Line(points=[-64,-14;-32,-22], style(color=0)), Line(points=[-64,-14;-78,-14], style(color=0)), Line(points=[-64,-54;-78,-54], style(color=0)), Ellipse(extent=[-78,-18;-86,-10], style(color=0)), Ellipse(extent=[-78,-58;-86,-50], style(color=0))), version="0.9", conversion(noneFromVersion=""), uses(Modelica(version="2.1")));
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;
  package Interfaces "Interfaces of magnetic equivalent networks"
    extends Modelica.Icons.Library;
    annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0, y=0.48, width=0.2, height=0.21, library=1, autolayout=1));
    connector MagneticPort "Magnetic connector"
      SI.MagneticPotentialDifference V_mag "Magnetic potential at the port";
      flow SI.MagneticFlux Phi "Magnetic flux flowing into the port";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Diagram(Rectangle(extent=[-100,-100;100,100], style(color=45, fillColor=45)), Text(extent=[-76,-102;80,-164], string="%name", style(color=45))), Icon(Rectangle(extent=[-100,100;100,-100], style(color=45, fillColor=45)), Text(extent=[-100,112;100,164], string="%name", style(color=45))), Window(x=0.31, y=0.08, width=0.39, height=0.52));
    end MagneticPort;
    connector PositiveMagneticPort
      SI.MagneticPotentialDifference V_mag "Magnetic potential at the port";
      flow SI.MagneticFlux Phi "Magnetic flux flowing into the port";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Diagram(Rectangle(extent=[-100,100;100,-100], style(color=45, fillColor=45))), Icon(Rectangle(extent=[-100,100;100,-100], style(color=45, fillColor=45)), Text(extent=[-102,160;100,108], string="%name", style(color=45, fillColor=45))), Window(x=0.45, y=0.01, width=0.35, height=0.49));
    end PositiveMagneticPort;
    connector NegativeMagneticPort
      SI.MagneticPotentialDifference V_mag "Magnetic potential at the port";
      flow SI.MagneticFlux Phi "Magnetic flux flowing into the port";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Diagram(Rectangle(extent=[-100,100;100,-100], style(color=45, fillPattern=0))), Icon(Rectangle(extent=[-100,100;100,-100], style(color=45, rgbcolor={255,127,0}, fillColor=7, rgbfillColor={255,255,255})), Text(extent=[-102,156;100,110], string="%name", style(color=45, fillColor=45))), Window(x=0.45, y=0.01, width=0.35, height=0.49));
    end NegativeMagneticPort;
    partial model MagneticFluxTube "Component with two magnetic ports p and n and magnetic flux Phi from p to n"
      PositiveMagneticPort p "Positive magnetic port" annotation(extent=[-110,-10;-90,10]);
      NegativeMagneticPort n "Negative magnetic port" annotation(extent=[90,-10;110,10]);
      SI.MagneticPotentialDifference V_mag "Magnetic potential difference between the two ports";
      SI.MagneticFlux Phi "Magnetic flux flowing from pin p to pin n";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Documentation(info="<HTML>
<P>
Partial model of a flux tube component with <b>two</b> magnetic ports:
the positive port connector <i>p</i>, and the negative port
connector <i>n</i>. It is assumed that the magnetic flux flowing
into pin p is identical to the flux flowing out of pin n.
This magnetic flux is provided explicitly as flux Phi.
</P>
</HTML>
"), Diagram(Line(points=[-110,20;-85,20], style(color=9, fillColor=9)), Polygon(points=[-95,23;-85,20;-95,17;-95,23], style(color=9, fillColor=9, fillPattern=1)), Line(points=[90,20;115,20], style(color=9, fillColor=9)), Line(points=[-125,0;-115,0], style(color=9)), Line(points=[-120,-5;-120,5], style(color=9)), Text(extent=[-110,25;-90,45], string="Phi", style(color=9)), Polygon(points=[105,23;115,20;105,17;105,23], style(color=9, fillColor=9, fillPattern=1)), Line(points=[115,0;125,0], style(color=9)), Text(extent=[90,45;110,25], string="Phi", style(color=9))), Window(x=0.33, y=0.04, width=0.63, height=0.67), Icon);

    equation 
      V_mag=p.V_mag - n.V_mag;
      0=p.Phi + n.Phi;
      Phi=p.Phi;
    end MagneticFluxTube;
  end Interfaces;
  package Reluctance "Magnetic flux tube elements for magnetic networks"
    extends Modelica.Icons.Library;
    annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0, y=0.48, width=0.2, height=0.21, library=1, autolayout=1), Documentation(info="<html>
<br>
Please refer to the introductory information of the Magnetic library for an explanation of flux tube elements. 
</html>"));
    model MagneticGround "Magnetic ground node"
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Documentation(info="<HTML>
<P>
The default magnetic potential at the magnetic ground node is zero.<br>
Every magnetic equivalent network must contain
at least one magnetic ground object.
</P>
</HTML>
"), Icon(Line(points=[-60,50;60,50], style(color=45)), Line(points=[-40,30;40,30], style(color=45)), Line(points=[-20,10;20,10], style(color=45)), Line(points=[0,90;0,50], style(color=45)), Text(extent=[-100,-40;100,-10], string="%name", style(color=45))), Diagram(Line(points=[-60,50;60,50], style(color=45, thickness=2)), Line(points=[-40,30;40,30], style(color=45, thickness=2)), Line(points=[-20,10;20,10], style(color=45, thickness=2)), Line(points=[0,90;0,50], style(color=45, thickness=2)), Text(extent=[-24,-38;22,-6], style(color=45), string="p.V_mag=0")), Window(x=0.23, y=0.23, width=0.59, height=0.63));
      Magnetic.Interfaces.MagneticPort p annotation(extent=[-10,110;10,90], rotation=-90);

    equation 
      p.V_mag=0;
    end MagneticGround;
    model NonlinearReluctance "Magnetic reluctance of a ferromagnetic flux tube with nonlinear B(H) relationship"
      extends Interfaces.MagneticFluxTube;
      parameter SI.Length l=0.01 "Length of flux tube";
      parameter SI.Area A=0.0001 "Cross sectional area of flux tube";
      SI.MagneticFluxDensity B "Flux density";
      SI.Reluctance R_mag "Magnetic reluctance";
      SI.RelativePermeability my_r "Relative permeability";
      replaceable function my_r_Material= Magnetic.Material.Softmagnetic.Steel_9SMn28K annotation(choices(choice(redeclare function my_r_Material= Magnetic.Material.Softmagnetic.Steel_9SMn28K "Steel 9SMn28K" ), choice(redeclare function my_r_Material= Magnetic.Material.Softmagnetic.VacoferS2 "Pure Iron Vacofer S2 (RFe20)" ), choice(redeclare function my_r_Material= Magnetic.Material.Softmagnetic.MUMETALL "Nickle Iron MUMETALL" ), choice(redeclare function my_r_Material= Magnetic.Material.Softmagnetic.Steel_X6Cr17 "Sheet Steel X6Cr17" ), choice(redeclare function my_r_Material= Magnetic.Material.Softmagnetic.M330_50A "Electric sheet M330 50A" )));
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.16, y=0.15, width=0.6, height=0.6), Icon(Rectangle(extent=[-70,30;70,-30], style(color=45, fillColor=7, fillPattern=1)), Line(points=[-90,0;-70,0], style(color=45)), Line(points=[70,0;90,0], style(color=45)), Text(extent=[-100,-78;100,-36], string="%name", style(color=45)), Rectangle(extent=[44,30;70,-30], style(color=45, fillColor=45, fillPattern=7))));

    equation 
      my_r=my_r_Material(B);
      R_mag=l/(Modelica.Constants.mue_0*my_r*A);
      R_mag*Phi=V_mag;
      B=Phi/A;
    end NonlinearReluctance;
    model WorkingAirGap "Magnetic reluctance of a working air gap and generation of a reluctance force"
      extends Interfaces.MagneticFluxTube;
      SI.Area A "Cross sectional area of flux tube";
      SI.MagneticFluxDensity B "Flux density";
      SI.Reluctance R_mag "Magnetic reluctance";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.16, y=0.15, width=0.6, height=0.6), Icon(Rectangle(extent=[-70,30;70,-30], style(color=45, fillColor=7, fillPattern=1)), Line(points=[-90,0;-70,0], style(color=45)), Line(points=[70,0;90,0], style(color=45)), Text(extent=[-100,-78;100,-36], string="%name", style(color=45))), Diagram);
      Modelica.Mechanics.Translational.Interfaces.Flange_a AirGapFlange "Interface between magnetic and mechanical subsystem" annotation(extent=[-10,20;10,40]);

    equation 
      R_mag=AirGapFlange.s/(Modelica.Constants.mue_0*A);
      R_mag*Phi=V_mag;
      B=Phi/A;
      AirGapFlange.f=Phi*Phi/(2*Modelica.Constants.mue_0*A) "Reluctance force calculated with Maxwell's formula";
    end WorkingAirGap;
    package Air "Flux tube geometries for stray flux through air"
      model CircularHalfAnnulus "Magnetic reluctance of a half annulus, geometry is fixed during simulation"
        extends Interfaces.MagneticFluxTube;
        parameter SI.Length r=0.01 "radius of enclosed region";
        parameter SI.Length d=0.01 "Inner diameter of half annulus";
        parameter SI.Length t=0.01 "Thickness of half annulus";
        parameter SI.Length t_res=0.002 "Residual thickness of half annulus";
        SI.Reluctance R_mag "Magnetic reluctance";
        annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.16, y=0.15, width=0.6, height=0.6), Icon(Rectangle(extent=[-70,30;70,-30], style(color=45, fillColor=7, fillPattern=1)), Line(points=[-90,0;-70,0], style(color=45)), Line(points=[70,0;90,0], style(color=45)), Text(extent=[-100,-78;100,-36], string="%name", style(color=45))), Diagram);

      equation 
        R_mag=(d/(t + t_res) + 1)/(Modelica.Constants.mue_0*r*4);
        R_mag*Phi=V_mag;
      end CircularHalfAnnulus;
      model HollowCylinderRadialFlux "Magnetic reluctance of a hollow cylinder with radial magnetic flux"
        extends Interfaces.MagneticFluxTube;
        parameter SI.Length d_out "Outer diameter of hollow cylinder";
        parameter SI.Length d_in "Inner diameter of hollow cylinder";
        parameter SI.Length l "Length of hollow cylinder in axial direction";
        SI.Reluctance R_mag "Magnetic reluctance";
        annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.16, y=0.15, width=0.6, height=0.6), Icon(Rectangle(extent=[-70,30;70,-30], style(color=45, fillColor=7, fillPattern=1)), Line(points=[-90,0;-70,0], style(color=45)), Line(points=[70,0;90,0], style(color=45)), Text(extent=[-100,-78;100,-36], string="%name", style(color=45))), Diagram);

      equation 
        R_mag=Modelica.Math.log(d_out/d_in)/(2*Modelica.Constants.pi*Modelica.Constants.mue_0*l);
        R_mag*Phi=V_mag;
      end HollowCylinderRadialFlux;
    end Air;
  end Reluctance;
  package Sources "Sources of a magnetic potential difference"
    extends Modelica.Icons.Library;
    annotation(Coordsys(extent=[0,0;440,456], grid=[2,2], component=[20,20]), Window(x=0.45, y=0.01, width=0.35, height=0.49, library=1, autolayout=1));
    model ElectroMagneticConverter
      SI.Voltage v "Voltage drop over the ideal coil";
      SI.Current i "Current through the coil";
      SI.MagneticPotentialDifference V_mag "Magnetic potential difference";
      SI.MagneticFlux Phi "Magnetic flux through the converter";
      parameter Real turns=1000 "Number of turns";
      annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Diagram(Polygon(points=[-134,63;-124,60;-134,57;-134,63], style(color=9, fillColor=9, fillPattern=1)), Line(points=[-150,60;-125,60], style(color=9, fillColor=9)), Polygon(points=[141,-57;151,-60;141,-63;141,-57], style(color=9, fillColor=9, fillPattern=1)), Line(points=[125,-60;150,-60], style(color=9, fillColor=9)), Text(extent=[128,-56;144,-41], string="Phi", style(color=9, fillColor=9)), Text(extent=[128,64;145,79], string="Phi", style(color=9, gradient=2, fillColor=9)), Line(points=[-150,-59;-125,-59], style(color=9, fillColor=9)), Polygon(points=[-140,-56;-150,-59;-140,-62;-140,-56], style(color=9, fillColor=9, fillPattern=1)), Text(extent=[-141,-56;-124,-41], string="i", style(color=9, fillColor=9)), Text(extent=[-150,63;-133,78], string="i", style(color=9, fillColor=9)), Line(points=[124,61;149,61], style(color=9, fillColor=9)), Polygon(points=[134,64;124,61;134,58;134,64], style(color=9, fillColor=9, fillPattern=1))), Window(x=0.26, y=0.14, width=0.58, height=0.58), Icon(Ellipse(extent=[-58,0;-38,20]), Line(points=[-48,60;-48,40]), Ellipse(extent=[-58,20;-38,40]), Ellipse(extent=[-58,-20;-38,0]), Ellipse(extent=[-58,-40;-38,-20]), Line(points=[-48,-40;-48,-60]), Rectangle(extent=[-62,40;-48,-40], style(color=7, fillColor=7)), Line(points=[-48,60;-100,60]), Line(points=[-48,-60;-100,-60]), Line(points=[0,100;-100,100], style(pattern=2)), Line(points=[-100,100;-100,-100], style(color=77, pattern=2)), Line(points=[0,-100;-100,-100], style(pattern=2)), Line(points=[100,100;0,100], style(color=45, pattern=2, fillColor=45)), Line(points=[100,-100;0,-100], style(color=45, pattern=2)), Line(points=[100,100;100,-100], style(color=45, pattern=2, fillColor=45)), Ellipse(extent=[12,-34;80,34], style(color=45)), Line(points=[46,-60;46,-34], style(color=45)), Line(points=[34,0;58,0], style(color=45)), Line(points=[58,10;58,-12], style(color=45)), Line(points=[46,34;46,60], style(color=45)), Line(points=[46,60;100,60], style(color=45)), Line(points=[46,-60;100,-60], style(color=45)), Text(extent=[-100,140;100,100], string="%name", style(color=45)), Line(points=[34,10;34,-12], style(color=45))));
      Modelica.Electrical.Analog.Interfaces.PositivePin p_el annotation(extent=[-110,50;-90,70]);
      Modelica.Electrical.Analog.Interfaces.NegativePin n_el annotation(extent=[-110,-70;-90,-50]);
      Interfaces.PositiveMagneticPort p_mag annotation(extent=[90,50;110,70]);
      Interfaces.NegativeMagneticPort n_mag annotation(extent=[90,-70;110,-50]);

    equation 
      v=p_el.v - n_el.v;
      i=p_el.i;
      0=p_el.i + n_el.i;
      V_mag=p_mag.V_mag - n_mag.V_mag;
      Phi=p_mag.Phi;
      0=p_mag.Phi + n_mag.Phi;
      V_mag=i*turns;
      turns*der(Phi)=-v;
    end ElectroMagneticConverter;
  end Sources;
  package Material "Magnetic properties of selected soft and hard magnetic materials"
    extends Modelica.Icons.Library;
    package Softmagnetic
      function Steel_9SMn28K "Free cutting steel 9SMn28K"
        extends Modelica.Icons.Function;
        input Real B;
        output Real my_r;
      protected 
        parameter Real myInit=6.875;
        parameter Real ca=2205;
        parameter Real cb=7.65;
        parameter Real n=7.6025;
        parameter Real BmyMax=1.051;
        Real BN;
        annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.22, y=0.07, width=0.6, height=0.6), Documentation(info="<html>
<br>
<p>
Source of the underlying data points <i>B(H)</i>:
<dd>
<p>Measurement at Dresden University of Technology</p>
</dd>
</p>
</html>"));
      algorithm 
        BN:=abs(B/BmyMax);
        my_r:=(myInit + ca*BN)/(1 + cb*BN + BN^n);
      end Steel_9SMn28K;
      extends Modelica.Icons.Library;
    end Softmagnetic;
    annotation(Documentation(info="<html>
<br>
<p>
Currently, the relationship <i><font face=\"Symbol\">m</font><sub>r</sub> = f(B)</i> for selected ferromagnetic materials is approximated with a function. A description of that function and its coefficients can be found in:
<dd>
<p><i>Roschke, Th.</i>: Entwurf geregelter elektromagnetischer Antriebe f&uuml;r Luftsch&uuml;tze. D&uuml;sseldorf: VDI-Verlag 2000.</p>
</dd>
</p>
</html>"));
  end Material;
  package Solenoid "Reluctance type electromagnetic actuators "
    extends Modelica.Icons.Library;
    model STA_195205_129 "Tubular Solenoid, Manufacturer: Saia-Burgess"
      parameter SI.Length l_yoke=0.039 "Total length of yoke";
      parameter SI.Length d_yoke=0.01915 "Outer diameter of yoke resp. Solenoid";
      parameter SI.Length t_yoke=0.001 "Thickness of yoke";
      parameter SI.Length d_lidBore=0.0095 "Diameter of lid bore";
      parameter SI.Length t_lid=0.002 "Thickness of yoke lids";
      parameter SI.CrossSection A_yoke=Modelica.Constants.pi*(d_yoke*d_yoke - di_yoke*di_yoke)/4 "Cross sectional area of yoke";
    protected 
      parameter SI.Length di_yoke=d_yoke - 2*t_yoke "Inner yoke diameter";
    public 
      parameter SI.Length d_arm=0.00785 "Outer diameter of armature";
      parameter SI.Length d_armBore=0.00239 "Diameter of pushing rod bore";
      parameter SI.CrossSection A_arm=Modelica.Constants.pi*d_arm*d_arm/4 "Cross sectional area of armature";
      parameter SI.Mass m_arm=0.0133 "Armature weight";
      parameter SI.Length d_pole=0.00815 "Outer diameter of pole";
      parameter SI.Length d_poleBore=0.00345 "Diameter of pole bore for armature pushing rod";
      parameter SI.CrossSection A_pole=Modelica.Constants.pi*(d_pole*d_pole - d_poleBore*d_poleBore)/4 "Cross sectional area of pole";
      Magnetic.Reluctance.MagneticGround MagGround annotation(extent=[-56,-40;-36,-20]);
      annotation(Diagram, Icon(Rectangle(extent=[-90,90;-76,-90], style(color=45, fillColor=45)), Rectangle(extent=[66,92;80,-90], style(color=45, fillColor=45)), Rectangle(extent=[-90,100;80,90], style(color=45, fillColor=45)), Rectangle(extent=[-90,-90;80,-100], style(color=45, fillColor=45)), Rectangle(extent=[-30,40;100,-40], style(pattern=0, fillColor=45)), Rectangle(extent=[-88,40;-48,-40], style(color=45, pattern=0, fillColor=45)), Rectangle(extent=[-76,90;66,40], style(pattern=0, fillColor=7, rgbfillColor={255,255,255})), Rectangle(extent=[-76,-40;66,-90], style(pattern=0, fillColor=7, rgbfillColor={255,255,255})), Rectangle(extent=[-48,40;-30,-40], style(pattern=0, fillColor=7, rgbfillColor={255,255,255})), Text(extent=[-100,140;100,100], style(color=3, rgbcolor={0,0,255}), string="%name")), experiment(StopTime=100, Tolerance=1e-08), Documentation(info="<html>
<br>
<p>
This exemplary model describes an industrial lifting magnet: the tubular solenoid STA 195205-129 of the manufacturer <a href=\"http://www.saia-burgess.com/\">Saia-Burgess</a>. Technical data of this actuator can be found in the manufacturers internet catalogue.The graphical representation of the Modelica model is shown below:<br>
</p>
<dl>
<dd>
<p><IMG SRC=\"../Images/graphical_model_sample_solenoid.png\" ALT=\"Graphical representation of the solenoid model\"></p>
</dd>
</dl>
<br>
The magnetic network of that solenoid was derived with the assistance of magnetostatic Finite Element Analysis at different armature positions <i>x</i> for a given current <i>i</i>:<br>
<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/network_over_field_plot_sample_solenoid.png\" ALT=\"Magnetic network over field plot obtained from FEA\"></p>
</dd>
</dl>
<br>
</p>
</html>"));
      Magnetic.Reluctance.NonlinearReluctance R_mFeYoke(l=5/3*l_yoke + d_yoke, A=A_yoke, redeclare function my_r_Material= Magnetic.Material.Softmagnetic.Steel_9SMn28K ) "Yoke reluctance" annotation(extent=[24,10;44,30]);
      Magnetic.Reluctance.WorkingAirGap R_mAirGap(A=A_pole) "Reluctance of working air gap" annotation(extent=[42,-10;62,10], rotation=270);
      parameter SI.Length x_min=0.00025 "Minimal armature position (equals thickness of impact cushion)";
      parameter SI.Length x_max=0.008 "Maximum armature position";
      SI.Length x_arm(start=x_max) " Armature position, identical with length of working air gap";
      Magnetic.Solenoid.Utilities.ArmatureMechanics Armature(limit_xMin(s0=x_min), limit_xMax(s0=x_max), ArmatureMass(s=x_arm, m=m_arm)) annotation(extent=[66,-10;86,10]);
      Magnetic.Sources.ElectroMagneticConverter ElMagConverter(turns=n_turns) annotation(extent=[-72,-10;-52,10]);
      Modelica.Electrical.Analog.Basic.Resistor R_coil(R=R_coil_20) annotation(extent=[-90,20;-70,40], rotation=270);
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(extent=[-110,50;-90,70]);
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(extent=[-110,-70;-90,-50]);
      parameter SI.Resistance R_coil_20=12.5 "Winding resistance at 20 °C";
      parameter Real n_turns=1146 "Number of winding turns";
      Magnetic.Reluctance.Air.CircularHalfAnnulus R_mStray(d=l_yoke/3, t=l_yoke/3, r=(d_yoke - d_arm)/2) "Coil stray reluctance" annotation(extent=[-22,-10;-2,10], rotation=270);
      Magnetic.Reluctance.NonlinearReluctance R_mFeArm(A=A_arm, l=l_yoke/3, redeclare function my_r_Material= Magnetic.Material.Softmagnetic.Steel_9SMn28K ) "Armature reluctance" annotation(extent=[-38,10;-18,30]);
      Magnetic.Reluctance.Air.HollowCylinderRadialFlux R_mAirParasitic(d_in=d_arm, d_out=d_lidBore, l=t_lid) "Parasitic airgap of armature slide guiding" annotation(extent=[-6,10;14,30], rotation=0);
      SI.Force F_mag "Actuator force";
      Modelica.Mechanics.Translational.Interfaces.Flange_a ArmatureFlange annotation(extent=[90,-10;110,10]);

    equation 
      connect(MagGround.p,R_mAirGap.n) annotation(points=[-46,-20;52,-20;52,-10], style(color=45, rgbcolor={255,127,0}));
      connect(ElMagConverter.n_mag,MagGround.p) annotation(points=[-52,-6;-46,-6;-46,-20], style(color=45, rgbcolor={255,127,0}));
      connect(R_coil.p,pin_p) annotation(points=[-80,40;-80,60;-100,60], style(color=3, rgbcolor={0,0,255}));
      connect(R_coil.n,ElMagConverter.p_el) annotation(points=[-80,20;-80,6;-72,6], style(color=3, rgbcolor={0,0,255}));
      connect(ElMagConverter.n_el,pin_n) annotation(points=[-72,-6;-80,-6;-80,-60;-100,-60], style(color=3, rgbcolor={0,0,255}));
      connect(R_mStray.n,MagGround.p) annotation(points=[-12,-10;-12,-20;-46,-20], style(color=45, rgbcolor={255,127,0}));
      connect(R_mFeArm.p,ElMagConverter.p_mag) annotation(points=[-38,20;-46,20;-46,6;-52,6], style(color=45, rgbcolor={255,127,0}));
      connect(R_mAirGap.AirGapFlange,Armature.flange_a) annotation(points=[55,-5.51073e-16;64.5,-5.51073e-16;64.5,0;66,0], style(color=58, rgbcolor={0,127,0}));
      connect(R_mStray.p,R_mAirParasitic.p) annotation(points=[-12,10;-12,20;-6,20], style(color=45, rgbcolor={255,127,0}));
      connect(R_mAirParasitic.p,R_mFeArm.n) annotation(points=[-6,20;-18,20], style(color=45, rgbcolor={255,127,0}));
      connect(R_mAirParasitic.n,R_mFeYoke.p) annotation(points=[14,20;24,20], style(color=45, rgbcolor={255,127,0}));
      connect(R_mFeYoke.n,R_mAirGap.p) annotation(points=[44,20;52,20;52,10], style(color=45, rgbcolor={255,127,0}));
      F_mag=R_mAirGap.AirGapFlange.f;
      connect(Armature.flange_b,ArmatureFlange) annotation(points=[86,0;100,0], style(color=58, rgbcolor={0,127,0}));
    end STA_195205_129;
    package Utilities "Model components for the mechanical subsystem of solenoid actuators"
      class Stopper "1D translational spring damper combination with gap and nonlinear force function"
        extends Modelica.Mechanics.Translational.Interfaces.Compliant;
        parameter SI.Position s_rel0=0 "unstretched spring length";
        parameter Real c(final unit="N/m", final min=0)=1000000.0 "spring constant";
        parameter Real d(final unit="N/ (m/s)", final min=0)=200.0 "damping constant";
        SI.Velocity v_rel "relative velocity between flange L and R";
        Boolean Contact "false, if s_rel > 0 ";
        parameter SI.Position s_n=1e-06 "normalized entering depth";
        parameter Real n=1 "exponent for force function (n>=1)";
        SI.Velocity delta_v "equals relative velocity for movement ";
        SI.Position delta_s "equals (s_rel - s_rel0)";
        annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Diagram(Line(points=[-100,0;-50,0], style(color=58)), Line(points=[-48,34;-48,-46], style(color=0, thickness=4)), Line(points=[8,40;8,2], style(color=0)), Line(points=[-2,0;38,0;38,44;-2,44], style(color=0)), Line(points=[38,22;72,22], style(color=0)), Line(points=[-12,-38;-12,20], style(color=0, thickness=4)), Line(points=[-12,22;8,22], style(color=0)), Line(points=[-12,-38;-2,-38], style(color=0)), Line(points=[-2,-38;10,-28;22,-48;38,-28;50,-48;64,-28;72,-40], style(color=0)), Rectangle(extent=[8,44;38,0], style(color=0, fillColor=8, fillPattern=1)), Text(extent=[-28,-80;12,-55], string="s_rel", style(color=3)), Line(points=[72,0;90,0], style(color=58)), Line(points=[72,22;72,-42], style(color=0)), Line(points=[-98,-60;98,-60], style(color=0)), Line(points=[-100,-29;-100,-61], style(color=0)), Line(points=[100,-61;100,-28], style(color=0)), Polygon(points=[-101,-60;-96,-59;-96,-61;-101,-60], style(color=0, fillColor=0, fillPattern=1)), Polygon(points=[100,-60;95,-61;95,-59;100,-60], style(color=0, fillColor=0, fillPattern=1))), Icon(Line(points=[-100,0;-50,0], style(color=58)), Line(points=[-48,34;-48,-46], style(color=0, thickness=4)), Line(points=[22,40;22,2], style(color=0)), Line(points=[12,0;52,0;52,44;12,44], style(color=0)), Line(points=[52,22;72,22], style(color=0)), Line(points=[-12,-38;-12,20], style(color=0, thickness=4)), Line(points=[-12,22;22,22], style(color=0)), Line(points=[-12,-38;-2,-38], style(color=0)), Line(points=[74,0;100,0], style(color=58)), Line(points=[72,22;72,-42], style(color=0)), Line(points=[-2,-38;10,-28;22,-48;38,-28;50,-48;64,-28;72,-40], style(color=0)), Rectangle(extent=[22,44;52,0], style(color=0, fillColor=8, fillPattern=1)), Text(extent=[0,120;0,60], string="%name"), Polygon(points=[50,-90;20,-80;20,-100;50,-90], style(color=10, fillColor=10)), Line(points=[-60,-90;20,-90], style(color=0, fillColor=10)), Line(points=[12,-12;54,58], style(color=85)), Polygon(points=[46,52;54,58;52,48;46,52], style(color=85, fillColor=85)), Line(points=[20,-62;50,-14], style(color=85, fillColor=86)), Polygon(points=[44,-18;52,-12;50,-22;44,-18], style(color=85, fillColor=85))), Window(x=0.04, y=0.01, width=0.6, height=0.83), Documentation(info="<html>
<p>
Th. Hegewald, TU Dresden 2001
</p>
<p>
Mathematical model describing the impact based on:<br>
Kamusella, A.: USAN-Handbuch. Institut fuer Feinwerktechnik:
Technische Universitaet Dresden 1999
</p>
<p>
Modelica implementation of the above model based on
Modelica.Mechanics.Translational.ElastoGap
</p>
</html>"));

      equation 
        v_rel=der(s_rel);
        Contact=s_rel < s_rel0;
        delta_s=abs(s_rel - s_rel0);
        delta_v=if v_rel < 0 then v_rel else 0;
        f=if Contact then (c*(s_rel - s_rel0) + d*delta_v)*(delta_s/s_n)^n else 0;
      end Stopper;
      model ArmatureMechanics
        annotation(Coordsys(extent=[-100,-100;100,100], grid=[2,2], component=[20,20]), Window(x=0.21, y=0.35, width=0.53, height=0.73), Diagram(Line(points=[-90,84;-90,62], style(color=9, thickness=2)), Line(points=[-90,80;-50,80], style(color=9, thickness=2, arrow=1)), Text(extent=[-94,96;-86,86], string="0", style(color=9, pattern=2, thickness=2)), Text(extent=[-58,92;-50,82], style(color=9, pattern=2, thickness=2), string="x")), Icon(Rectangle(extent=[-90,10;90,-10], style(gradient=2, fillColor=45)), Text(extent=[-100,80;100,40], string="%name", style(color=45)), Rectangle(extent=[-70,30;70,-30], style(color=45, gradient=2, fillColor=45))), Documentation(info="<html>

<p>
The mechanical subsystem of a translational actuator with limited stroke is described by a sliding mass that can move between stoppers at the maximum respectively minimum position.
</p>
</html>"));
        Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(extent=[90,-10;110,10]);
        Modelica.Mechanics.Translational.Fixed limit_xMin(s0=0) annotation(extent=[-80,20;-60,40]);
        Modelica.Mechanics.Translational.SlidingMass ArmatureMass(m=1) annotation(extent=[-10,20;10,40]);
        Magnetic.Solenoid.Utilities.Stopper Stopper_xMax(c=1000000.0, d=200.0, s_n=1e-05) annotation(extent=[30,20;50,40]);
        Magnetic.Solenoid.Utilities.Stopper Stopper_xMin(c=1000000.0, d=200.0, s_n=1e-05) annotation(extent=[-50,20;-30,40]);
        Modelica.Mechanics.Translational.Fixed limit_xMax(s0=0.01) annotation(extent=[60,20;80,40]);
        Modelica.Mechanics.Translational.Interfaces.Flange_a flange_a annotation(extent=[-110,-10;-90,10]);

      equation 
        connect(ArmatureMass.flange_b,flange_b) annotation(points=[10,30;10,0;100,0]);
        connect(Stopper_xMin.flange_a,limit_xMin.flange_b) annotation(points=[-50,30;-70,30]);
        connect(Stopper_xMin.flange_a,limit_xMin.flange_b) annotation(points=[-50,30;-70,30]);
        connect(ArmatureMass.flange_a,Stopper_xMin.flange_b) annotation(points=[-10,30;-30,30], style(color=58));
        connect(limit_xMax.flange_b,Stopper_xMax.flange_b) annotation(points=[70,30;50,30], style(color=58));
        connect(Stopper_xMax.flange_a,ArmatureMass.flange_b) annotation(points=[30,30;10,30], style(color=58));
        connect(ArmatureMass.flange_a,flange_a) annotation(points=[-10,30;-10,0;-100,0], style(color=58, rgbcolor={0,127,0}));
      end ArmatureMechanics;
    end Utilities;
    annotation(Documentation(info="<html>
<br>
<p>
Solenoid actuators are widely used in many different applications, e.g. in locking mechanisms throughout automation and automotive engineering, in fluidic valves or in relays and switchgear. A cross-sectional view on a general purpose lifting magnet is shown in the figure below.<br>
</p>
<dl>
<dd>
<p><IMG SRC=\"../Images/structure_sample_solenoid.png\" ALT=\"Structure of the sample solenoid actuator\"></p>
</dd>
</dl>
<br>
<p>
Models of solenoid actuators based on magnetic networks are very useful for both coarse design of magnetic actuators itself (e.g. main dimensions, force-stroke charactersitics, dynamic behavior) and for system simulation together with neighboring subsystems, e.g. mechanical loads or excitation and control circuits.
</p>
</html>"));
  end Solenoid;
  package Examples "Exemplary usage of solenoid models"
    extends Modelica.Icons.Library;
    model PullinStroke "Pull-in stroke of the sample solenoid STA 195205-129"
      annotation(Diagram, experiment(StopTime=0.05, Tolerance=1e-08), Documentation(info="<html>
<br>
<p>
In this model, a voltage step of 13.2VDC at time t=0 is applied to the solenoid (The step height corresponds to a duty cycle of 50% for that particular sample actuator). The armature will be pulled in until it reaches its minimum position at a stopper. 
</p>
<p>
Simulate with the predefined settings for 0,05 s:
<ul>
<li>U_step.v = 13.2 V,</li>
<li>STA_195205_129.x_arm(start = 5e-3) m.</li>
</ul>
</p>
<p>
Plot versus time:
<ul>
<li>STA_195205_129.pin_p.i,</li>
<li>STA_195205_129.x_arm,</li>
<li>STA_195205_129.F_mag.</li>
</ul>
<br>
Watch the characteristic current drop during the pull-in movement. It is due to the increase of the  inductance during the stroke (decreasing magnetic reluctance of working air gap, increasing total magnetic flux).</p>
<p>
In the figure below, simulation results obtained with the above settings are compared with a measurement:<br>
<br>
<dl>
<dd>
<p><IMG SRC=\"../Images/diagram_it_xt_measured_simulated.png\" ALT=\"Comparison of measured and simulated pull-in stroke of the sample solenoid\"></p>
</dd>
</dl>
<br>
</p>
</html>"));
      extends Modelica.Icons.Example;
      Modelica.Electrical.Analog.Basic.Ground Ground annotation(extent=[-40,-30;-20,-10]);
      Modelica.Electrical.Analog.Sources.StepVoltage U_step(V=13.2) annotation(extent=[-40,0;-20,20], rotation=270);
      Solenoid.STA_195205_129 STA_195205_129(x_arm(start=0.005)) annotation(extent=[0,0;20,20]);

    equation 
      connect(Ground.p,U_step.n) annotation(points=[-30,-10;-30,-5;-30,0;-30,0], style(color=3, rgbcolor={0,0,255}));
      connect(U_step.p,STA_195205_129.pin_p) annotation(points=[-30,20;-12,20;-12,16;0,16], style(color=3, rgbcolor={0,0,255}));
      connect(U_step.n,STA_195205_129.pin_n) annotation(points=[-30,0;-12,0;-12,4;0,4], style(color=3, rgbcolor={0,0,255}));
    end PullinStroke;
  end Examples;
end Magnetic;

model Magnetic_Examples_PullinStroke
  extends Magnetic.Examples.PullinStroke;
end Magnetic_Examples_PullinStroke;