package Modelica "Modelica Standard Library"
  extends Icons.Library;
  annotation(preferedView="info", version="2.2.1", versionDate="2006-03-24", conversion(from(version="1.6", ModelicaAdditions(version="1.5"), MultiBody(version="1.0.1"), MultiBody(version="1.0"), Matrices(version="0.8"), script="Scripts/ConvertModelica_from_1.6_to_2.1.mos"), from(version="2.1 Beta1", script="Scripts/ConvertModelica_from_2.1Beta1_to_2.1.mos"), noneFromVersion="2.1", noneFromVersion="2.2"), Dymola(checkSum="539989979:1143034484"), Settings(NewStateSelection=true), Documentation(info="<HTML>
<p>
Package <b>Modelica</b> is a <b>standardized</b> and <b>free</b> package
that is developed together with the Modelica language from the
Modelica Association, see <a href=\"http://www.Modelica.org\">http://www.Modelica.org</a>. 
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
</p>
<p> <b>Note:</b> This is a <i>subset</i> of the official Modelica package with minor changes made by MathCore Engineering AB.
For a complete list of changes see the <a href=\"Modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>.
</p> 
</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Mechanics "Library to model 1-dim. and 3-dim. mechanical systems (multi-body, rotational, translational)"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-5,-70},{45,-40}}),Ellipse(visible=true, extent={{-90,-60},{-80,-50}}),Line(visible=true, points={{-85,-55},{-60,-21}}, thickness=0.5),Ellipse(visible=true, extent={{-65,-26},{-55,-16}}),Line(visible=true, points={{-60,-21},{9,-55}}, thickness=0.5),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{4,-60},{14,-50}}),Line(visible=true, points={{-10,-34},{72,-34},{72,-76},{-10,-76}})}), Documentation(info="<HTML>
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package Translational "Library to model 1-dimensional, translational mechanical systems"
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-84,-73},{66,-73}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Sphere, extent={{-81,-65},{-8,-22}}),Line(visible=true, points={{-8,-43},{-1,-43},{6,-64},{17,-23},{29,-65},{40,-23},{50,-44},{61,-44}}),Line(visible=true, points={{-59,-73},{-84,-93}}),Line(visible=true, points={{-11,-73},{-36,-93}}),Line(visible=true, points={{-34,-73},{-59,-93}}),Line(visible=true, points={{14,-73},{-11,-93}}),Line(visible=true, points={{39,-73},{14,-93}}),Line(visible=true, points={{63,-73},{38,-93}})}), Documentation(info="<html>
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,191,0}, fillColor={0,191,0}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,191,0}, fillColor={0,191,0}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, lineColor={0,191,0}, fillColor={0,191,0}, extent={{-160,50},{40,110}}, textString="%name", fontName="Arial")}));
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
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,191,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,191,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, lineColor={0,191,0}, fillColor={0,191,0}, extent={{-40,50},{160,110}}, textString="%name", fontName="Arial")}));
        end Flange_b;

        partial model Compliant "Compliant connection of two translational 1D flanges"
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{50,-90},{20,-80},{20,-100},{50,-90}}),Line(visible=true, points={{-60,-90},{20,-90}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane, e. g. from left to right)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          s_rel=flange_b.s - flange_a.s;
          flange_b.f=f;
          flange_a.f=-f;
        end Compliant;

        annotation(Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end Interfaces;

    end Translational;

    package Rotational "Library to model 1-dimensional, rotational mechanical systems"
      import SI = Modelica.SIunits;
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Documentation(info="<html>
 
<p>
Library <b>Rotational</b> is a <b>free</b> Modelica package providing
1-dimensional, rotational mechanical components to model in a convenient way
drive trains with frictional losses. A typical, simple example is shown
in the next figure:
</p>
 
<p><img src=\"../Images/Rotational/driveExample.png\"></p>
 
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Mechanics.Rotational.UsersGuide\">Rotational.UsersGuide</a>
     discusses the most important aspects how to use this library.</li>
<li> <a href=\"Modelica://Modelica.Mechanics.Rotational.Examples\">Rotational.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
 
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
", revisions=""), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-83,-66},{-63,-66}}),Line(visible=true, points={{36,-68},{56,-68}}),Line(visible=true, points={{-73,-66},{-73,-91}}),Line(visible=true, points={{46,-68},{46,-91}}),Line(visible=true, points={{-83,-29},{-63,-29}}),Line(visible=true, points={{36,-32},{56,-32}}),Line(visible=true, points={{-73,-9},{-73,-29}}),Line(visible=true, points={{46,-12},{46,-32}}),Line(visible=true, points={{-73,-91},{46,-91}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-47,-80},{27,-17}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-87,-54},{-47,-41}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{27,-56},{66,-42}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      package Interfaces "Connectors and partial models for 1D rotational mechanical components"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
rotational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        connector Flange_a "1D rotational flange (filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
          annotation(defaultComponentName="flange_a", Documentation(info="<HTML>
<p>
This is a connector for 1D rotational mechanical systems and models
a mechanical flange. The following variables are defined in this connector:
</p>
<pre>
   <b>phi</b>: Absolute rotation angle of the flange in [rad].
   <b>tau</b>: Cut-torque in the flange in [Nm].
</pre>
<p>
There is a second connector for flanges: Flange_b. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see the information text of package Rotational
(section 4. Sign conventions).
</p>
<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-160,50},{40,90}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}})}));
        end Flange_a;

        connector Flange_b "1D rotational flange (non-filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
          annotation(defaultComponentName="flange_b", Documentation(info="<HTML>
<p>
This is a connector for 1D rotational mechanical systems and models
a mechanical flange. The following variables are defined in this connector:
</p>
<pre>
   <b>phi</b>: Absolute rotation angle of the flange in [rad].
   <b>tau</b>: Cut-torque in the flange in [Nm].
</pre>
<p>
There is a second connector for flanges: Flange_a. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see the information text of package Rotational
(section 4. Sign conventions).
</p>
<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-98,-100},{102,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,50},{160,90}}, textString="%name", fontName="Arial")}));
        end Flange_b;

        partial model Rigid "Base class for the rigid connection of two rotational 1D flanges"
          SI.Angle phi "Absolute rotation angle of component (= flange_a.phi = flange_b.phi)";
          annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two rigidly connected flanges,
i.e., flange_a.phi = flange_b.phi. It is used e.g. to built up components
with inertia.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          flange_a.phi=phi;
          flange_b.phi=phi;
        end Rigid;

        partial model TwoFlanges "Base class for a component with two rotational 1D flanges"
          annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges.
It is used e.g. to build up parts of a drive train consisting
of several base components. There are specialized versions of this
base class for rigidly connected flanges (Interfaces.Rigid) and
for a compliant connection of flanges (Interfaces.Compliant).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          Flange_a flange_a annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        end TwoFlanges;

        partial model Bearing "Base class for interface classes with bearing connector"
          extends TwoFlanges;
          SI.Torque tau_support;
          annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}})}), Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges and an additional bearing flange.
It is a superclass for the two components TwoFlangesAndBearing and TwoFlangesAndBearingH.</p>
 
</HTML>
"));
          Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
        end Bearing;

        partial model TwoFlangesAndBearing "Base class for a equation-based component with two rotational 1D flanges and one rotational 1D bearing flange"
          extends Bearing;
          SI.Angle phi_a;
          SI.Angle phi_b;
          annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges and an additional bearing flange.
It is used e.g. to build up equation-based parts of a drive train.</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        equation 
          if cardinality(bearing) == 0 then
            bearing.phi=0;
          else
            bearing.tau=tau_support;
          end if;
          0=flange_a.tau + flange_b.tau + tau_support;
          phi_a=flange_a.phi - bearing.phi;
          phi_b=flange_b.phi - bearing.phi;
        end TwoFlangesAndBearing;

        partial model FrictionBase "Base class of Coulomb friction elements"
          parameter SI.AngularVelocity w_small=10000000000.0 "Relative angular velocity near to zero if jumps due to a reinit(..) of the velocity can occur (set to low value only if such impulses can occur)" annotation(Dialog(tab="Advanced"));
          SI.AngularVelocity w_relfric "Relative angular velocity between frictional surfaces";
          SI.AngularAcceleration a_relfric "Relative angular acceleration between frictional surfaces";
          SI.Torque tau "Friction torque (positive, if directed in opposite direction of w_rel)";
          SI.Torque tau0 "Friction torque for w=0 and forward sliding";
          SI.Torque tau0_max "Maximum friction torque for w=0 and locked";
          Boolean free "true, if frictional element is not active";
          Real sa "Path parameter of friction characteristic tau = f(a_relfric)";
          Boolean startForward(start=false, fixed=true) "true, if w_rel=0 and start of forward sliding or w_rel > w_small";
          Boolean startBackward(start=false, fixed=true) "true, if w_rel=0 and start of backward sliding or w_rel < -w_small";
          Boolean locked(start=false) "true, if w_rel=0 and not sliding";
          constant Integer Unknown=3 "Value of mode is not known";
          constant Integer Free=2 "Element is not active";
          constant Integer Forward=1 "w_rel > 0 (forward sliding)";
          constant Integer Stuck=0 "w_rel = 0 (forward sliding, locked or backward sliding)";
          constant Integer Backward=-1 "w_rel < 0 (backward sliding)";
          Integer mode(final min=Backward, final max=Unknown, start=Unknown, fixed=true);
          annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        protected 
          parameter Modelica.SIunits.AngularAcceleration unitAngularAcceleration=1;
          parameter Modelica.SIunits.Torque unitTorque=1;
        equation 
          startForward=pre(mode) == Stuck and (sa > tau0_max or pre(startForward) and sa > tau0) or pre(mode) == Backward and w_relfric > w_small or initial() and w_relfric > 0;
          startBackward=pre(mode) == Stuck and (sa < -tau0_max or pre(startBackward) and sa < -tau0) or pre(mode) == Forward and w_relfric < -w_small or initial() and w_relfric < 0;
          locked=not free and not (pre(mode) == Forward or startForward or pre(mode) == Backward or startBackward);
          a_relfric=unitAngularAcceleration*(if locked then 0 else if free then sa else if startForward then sa - tau0_max/unitTorque else if startBackward then sa + tau0_max/unitTorque else if pre(mode) == Forward then sa - tau0/unitTorque else sa + tau0/unitTorque);
          mode=if free then Free else if (pre(mode) == Forward or pre(mode) == Free or startForward) and w_relfric > 0 then Forward else if (pre(mode) == Backward or pre(mode) == Free or startBackward) and w_relfric < 0 then Backward else Stuck;
          annotation(Documentation(info="<html>
<p>
Basic model for Coulomb friction that models the stuck
phase in a reliable way.
</p>
</html>"));
        end FrictionBase;

      end Interfaces;

      model Inertia "1D-rotational component with inertia"
        import SI = Modelica.SIunits;
        import Modelica.Mechanics.Rotational.Types.Init;
        import Modelica.Blocks.Types.StateSelection;
        parameter SI.Inertia J(min=0)=1 "Moment of inertia";
        parameter Init.Temp initType=Modelica.Mechanics.Rotational.Types.Init.NoInit "Type of initialization (defines usage of start values below)" annotation(Dialog(group="Initialization"));
        parameter SI.Angle phi_start=0 "Initial or guess value of rotor rotation angle phi" annotation(Dialog(group="Initialization"), Evaluate=false);
        parameter SI.AngularVelocity w_start=0 "Initial or guess value of angular velocity w = der(phi)" annotation(Dialog(group="Initialization"), Evaluate=false);
        parameter SI.AngularAcceleration a_start=0 "Initial value of angular acceleration a = der(w)" annotation(Dialog(group="Initialization", enable=initType >= Init.InitialAcceleration), Evaluate=false);
        parameter StateSelection.Temp stateSelection=Modelica.Blocks.Types.StateSelection.Default "Priority to use phi and w as states" annotation(Dialog(tab="Advanced"));
        extends Interfaces.Rigid(phi(start=phi_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always));
        SI.AngularVelocity w(start=w_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always) "Absolute angular velocity of component";
        SI.AngularAcceleration a "Absolute angular acceleration of component";
        annotation(Documentation(info="<html>
<p>
Rotational component with <b>inertia</b> and two rigidly connected flanges.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-25},{-60,-25}}),Line(visible=true, points={{60,-25},{80,-25}}),Line(visible=true, points={{-70,-25},{-70,-70}}),Line(visible=true, points={{70,-25},{70,-70}}),Line(visible=true, points={{-80,25},{-60,25}}),Line(visible=true, points={{60,25},{80,25}}),Line(visible=true, points={{-70,45},{-70,25}}),Line(visible=true, points={{70,45},{70,25}}),Line(visible=true, points={{-70,-70},{70,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-50},{50,50}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{96,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{0,-90},{-20,-85},{-20,-95},{0,-90}}),Line(visible=true, points={{-90,-90},{-19,-90}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{4,-96},{72,-83}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{9,73},{19,70},{9,67},{9,73}}),Line(visible=true, points={{9,70},{-21,70}}),Text(visible=true, extent={{25,65},{77,77}}, textString="w = der(phi) ", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{100,10}}),Line(visible=true, points={{-80,-25},{-60,-25}}),Line(visible=true, points={{60,-25},{80,-25}}),Line(visible=true, points={{-70,-25},{-70,-70}}),Line(visible=true, points={{70,-25},{70,-70}}),Line(visible=true, points={{-80,25},{-60,25}}),Line(visible=true, points={{60,25},{80,25}}),Line(visible=true, points={{-70,45},{-70,25}}),Line(visible=true, points={{70,45},{70,25}}),Line(visible=true, points={{-70,-70},{70,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-50},{50,50}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-150,-120},{150,-80}}, textString="J=%J", fontName="Arial")}));
      initial equation 
        if initType == Init.SteadyState then
          der(phi)=0;
          der(w)=0;
        elseif initType == Init.InitialState then
          phi=phi_start;
          w=w_start;
        elseif initType == Init.InitialAngle then
          phi=phi_start;
        elseif initType == Init.InitialSpeed then
          w=w_start;
        elseif initType == Init.InitialAcceleration then
          a=a_start;
        elseif initType == Init.InitialAngleAcceleration then
          phi=phi_start;
          a=a_start;
        elseif initType == Init.InitialSpeedAcceleration then
          w=w_start;
          a=a_start;
        elseif initType == Init.InitialAngleSpeedAcceleration then
          phi=phi_start;
          w=w_start;
          a=a_start;
        else
        end if;
      equation 
        w=der(phi);
        a=der(w);
        J*a=flange_a.tau + flange_b.tau;
      end Inertia;

      model BearingFriction "Coulomb friction in bearings "
        extends Interfaces.TwoFlangesAndBearing;
        parameter Real tau_pos[:,:]=[0,1] "[w,tau] Positive sliding friction characteristic (w>=0)";
        parameter Real peak(final min=1)=1 "peak*tau_pos[1,2] = Maximum friction torque for w==0";
        extends Interfaces.FrictionBase;
        SI.Angle phi;
        SI.AngularVelocity w "Absolute angular velocity of flange_a and flange_b";
        SI.AngularAcceleration a "Absolute angular acceleration of flange_a and flange_b";
        annotation(Documentation(info="<html>
<p>
This element describes <b>Coulomb friction</b> in <b>bearings</b>,
i.e., a frictional torque acting between a flange and the housing.
The positive sliding friction torque \"tau\" has to be defined
by table \"tau_pos\" as function of the absolute angular velocity \"w\".
E.g.
<p>
<pre>
       w | tau
      ---+-----
       0 |   0
       1 |   2
       2 |   5
       3 |   8
</pre>
<p>
gives the following table:
</p>
<pre>
   tau_pos = [0, 0; 1, 2; 2, 5; 3, 8];
</pre>
<p>
Currently, only linear interpolation in the table is supported.
Outside of the table, extrapolation through the last
two table entries is used. It is assumed that the negative
sliding friction force has the same characteristic with negative
values. Friction is modelled in the following way:
</p>
<p>
When the absolute angular velocity \"w\" is not zero, the friction torque
is a function of w and of a constant normal force. This dependency
is defined via table tau_pos and can be determined by measurements,
e.g. by driving the gear with constant velocity and measuring the
needed motor torque (= friction torque).
</p>
<p>
When the absolute angular velocity becomes zero, the elements
connected by the friction element become stuck, i.e., the absolute
angle remains constant. In this phase the friction torque is
calculated from a torque balance due to the requirement, that
the absolute acceleration shall be zero.  The elements begin
to slide when the friction torque exceeds a threshold value,
called the maximum static friction torque, computed via:
</p>
<pre>
   maximum_static_friction = <b>peak</b> * sliding_friction(w=0)  (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled which have to be solved by appropriate
numerical methods. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
<p>
More precise friction models take into account the elasticity of the
material when the two elements are \"stuck\", as well as other effects,
like hysteresis. This has the advantage that the friction element can
be completely described by a differential equation without events. The
drawback is that the system becomes stiff (about 10-20 times slower
simulation) and that more material constants have to be supplied which
requires more sophisticated identification. For more details, see the
following references, especially (Armstrong and Canudas de Witt 1996):
</p>
<dl>
<dt>Armstrong B. (1991):
<dd><b>Control of Machines with Friction</b>. Kluwer Academic
    Press, Boston MA.<br><br>
<dt>Armstrong B., and Canudas de Wit C. (1996):
<dd><b>Friction Modeling and Compensation.</b>
    The Control Handbook, edited by W.S.Levine, CRC Press,
    pp. 1369-1382.<br><br>
<dt>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995):
<dd><b>A new model for control of systems with friction.</b>
    IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<br><br>
</dl>
 
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{96,10}}),Rectangle(visible=true, extent={{-60,-60},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-25},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-61},{60,-45}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,-18}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,-70},{-60,-60},{60,-60}}),Line(visible=true, points={{-75,-10},{-75,-70}}),Line(visible=true, points={{75,-10},{75,-70}}),Rectangle(visible=true, extent={{-60,10},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,45},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,10},{60,25}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,19},{50,51}}),Line(visible=true, points={{-75,70},{-75,10}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{-60,60},{60,60}}),Line(visible=true, points={{75,70},{75,10}}),Line(visible=true, points={{-20,-24},{38,-24}}, color={255,0,0}, thickness=1),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-20,-19},{-20,-29},{-36,-24},{-20,-19}}),Text(visible=true, fillColor={255,0,0}, extent={{-45,-51},{49,-23}}, textString="tau (friction torque)", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{14,84},{82,97}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,90},{-10,95},{-10,85},{10,90}}),Line(visible=true, points={{-80,90},{-9,90}}, color={128,128,128}),Line(visible=true, points={{-10,-90},{0,-80}}),Line(visible=true, points={{-5,-90},{5,-80}}),Line(visible=true, points={{0,-90},{10,-80}}),Line(visible=true, points={{5,-90},{10,-85}}),Line(visible=true, points={{-10,-85},{-5,-80}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{100,10}}),Rectangle(visible=true, extent={{-60,-60},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-25},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-61},{60,-45}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,-18}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,-70},{-60,-60},{60,-60}}),Line(visible=true, points={{-75,-10},{-75,-70}}),Line(visible=true, points={{75,-10},{75,-70}}),Rectangle(visible=true, extent={{-60,10},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,45},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,10},{60,25}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,19},{50,51}}),Line(visible=true, points={{-75,70},{-75,10}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{-60,60},{60,60}}),Line(visible=true, points={{75,70},{75,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,90},{150,130}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-10,-90},{0,-80}}),Line(visible=true, points={{-5,-90},{5,-80}}),Line(visible=true, points={{0,-90},{10,-80}}),Line(visible=true, points={{5,-90},{10,-85}}),Line(visible=true, points={{-10,-85},{-5,-80}})}));
      protected 
        parameter Modelica.SIunits.Torque unitTorque=1;
      equation 
        tau0=Modelica.Math.tempInterpol1(0, tau_pos, 2);
        tau0_max=peak*tau0;
        free=false;
        phi=phi_a;
        phi=phi_b;
        w=der(phi);
        a=der(w);
        w_relfric=w;
        a_relfric=a;
        0=flange_a.tau + flange_b.tau - tau;
        tau=if locked then sa*unitTorque else if startForward then Modelica.Math.tempInterpol1(w, tau_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-w, tau_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(w, tau_pos, 2) else -Modelica.Math.tempInterpol1(-w, tau_pos, 2);
      end BearingFriction;

      package Types "Constants and types with choices, especially to build menus"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        package Init "Type, constants and menu choices to define initialization of absolute rotational quantities"
          extends Modelica.Icons.Enumeration;
          constant Integer NoInit=1 "no initialization (phi_start, w_start are guess values)";
          constant Integer SteadyState=2 "steady state initialization (der(phi)=der(w)=0)";
          constant Integer InitialState=3 "initialization with phi_start, w_start";
          constant Integer InitialAngle=4 "initialization with phi_start";
          constant Integer InitialSpeed=5 "initialization with w_start";
          constant Integer InitialAcceleration=6 "initialization with a_start";
          constant Integer InitialAngleAcceleration=7 "initialization with phi_start, a_start";
          constant Integer InitialSpeedAcceleration=8 "initialization with w_start, a_start";
          constant Integer InitialAngleSpeedAcceleration=9 "initialization with phi_start, w_start, a_start";
          type Temp "Temporary type of absolute initialization with choices for menus (until enumerations are available)"
            extends Modelica.Icons.TypeInteger(min=1, max=9);
            annotation(Evaluate=true, choices(choice=Modelica.Mechanics.Rotational.Types.Init.NoInit "no initialization (phi_start, w_start are guess values)", choice=Modelica.Mechanics.Rotational.Types.Init.SteadyState "steady state initialization (der(phi)=der(w)=0)", choice=Modelica.Mechanics.Rotational.Types.Init.InitialState "initialization with phi_start, w_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngle "initialization with phi_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeed "initialization with w_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAcceleration "initialization with a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngleAcceleration "initialization with phi_start, a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeedAcceleration "initialization with w_start, a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngleSpeedAcceleration "initialization with phi_start, w_start, a_start"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          end Temp;

          annotation(Documentation(info="<html>
<p>
Type <b>Init</b> defines initialization of absolute rotational
quantities.
</p>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end Init;

      end Types;

    end Rotational;

  end Mechanics;

  package Math "Mathematical functions (e.g., sin, cos) and operations on matrices (e.g., norm, solve, eig, exp)"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Invisible=true, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-59,-56},{42,-9}}, textString="f(x)", fontName="Arial")}), Documentation(info="<HTML>
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

</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    function asin "inverse sine (-1 <= u <= 1)"
      extends baseIcon2;
      input Real u;
      output SI.Angle y;
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={192,192,192}, extent={{-88,30},{-16,78}}, textString="asin", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-40,-88},{-15,-72}}, textString="-pi/2", fontName="Arial"),Text(visible=true, extent={{-38,72},{-13,88}}, textString=" pi/2", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="+1", fontName="Arial"),Text(visible=true, extent={{-90,1},{-70,21}}, textString="-1", fontName="Arial"),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{92,-22},{112,-2}}, textString="u", fontName="Arial")}), Documentation(info="<html>
 
</html>"));

      external "C" y=asin(u) ;

    end asin;

    function exp "exponential, base e"
      extends baseIcon2;
      input Real u;
      output Real y;
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,-80.3976},{68,-80.3976}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}}),Line(visible=true, points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={192,192,192}, extent={{-86,2},{-14,50}}, textString="exp", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-80.3976},{84,-80.3976}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-80.3976},{84,-74.3976},{84,-86.3976},{100,-80.3976}}),Line(visible=true, points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-31,72},{-11,88}}, textString="20", fontName="Arial"),Text(visible=true, extent={{-92,-103},{-72,-83}}, textString="-3", fontName="Arial"),Text(visible=true, extent={{70,-103},{90,-83}}, textString="3", fontName="Arial"),Text(visible=true, extent={{-18,-73},{2,-53}}, textString="1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{96,-102},{116,-82}}, textString="u", fontName="Arial")}));

      external "C" y=exp(u) ;

    end exp;

    partial function baseIcon2 "Basic icon for mathematical function with y-axis in middle"
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{5,90},{25,110}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}));
    end baseIcon2;

    function tempInterpol1 "temporary routine for linear interpolation (will be removed)"
      extends Modelica.Icons.Function;
      input Real u "input value (first column of table)";
      input Real table[:,:] "table to be interpolated";
      input Integer icol "column of table to be interpolated";
      output Real y "interpolated input value (icol column of table)";
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    protected 
      Integer i;
      Integer n "number of rows of table";
      Real u1;
      Real u2;
      Real y1;
      Real y2;
    algorithm 
      n:=size(table, 1);
      if n <= 1 then 
        y:=table[1,icol];
      else
        if u <= table[1,1] then 
          i:=1;
        else
          i:=2;
          while (i < n and u >= table[i,1]) loop
            i:=i + 1;
          end while;
          i:=i - 1;
        end if;
        u1:=table[i,1];
        u2:=table[i + 1,1];
        y1:=table[i,icol];
        y2:=table[i + 1,icol];
        assert(u2 > u1, "Table index must be increasing");
        y:=y1 + (y2 - y1)*(u - u1)/(u2 - u1);
      end if;
      annotation(Documentation(info="<html>
  
</html>"));
    end tempInterpol1;

  end Math;

  package Blocks "Library for basic input/output control blocks (continuous, discrete, logical, table blocks)"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-32,-35},{16,-6}}),Rectangle(visible=true, extent={{-32,-85},{16,-56}}),Line(visible=true, points={{16,-20},{49,-20},{49,-71},{16,-71}}),Line(visible=true, points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{16,-71},{29,-67},{29,-74},{16,-71}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}})}), Documentation(info="<html>
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package Types "Constants and types with choices, especially to build menus"
      extends Modelica.Icons.Library;
      annotation(preferedView="info", Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      package StateSelection "Type, constants and menu choices to define state selection of variables"
        annotation(Documentation(info="<html>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        extends Modelica.Icons.Enumeration;
        constant Integer Never=1 "Never (never use as state)";
        constant Integer Avoid=2 "Avoid (avoid to use as state)";
        constant Integer Default=3 "Default (default behaviour)";
        constant Integer Prefer=4 "Prefer (use as state if possible)";
        constant Integer Always=5 "Always (always use as state)";
        type Temp "Temporary type of state selection with choices for menus (until enumerations are available)"
          extends Modelica.Icons.TypeInteger(min=1, max=5);
          annotation(Evaluate=true, choices(choice=Modelica.Blocks.Types.StateSelection.Never "Never (never use as state)", choice=Modelica.Blocks.Types.StateSelection.Avoid "Avoid (avoid to use as state)", choice=Modelica.Blocks.Types.StateSelection.Default "Default (default behaviour)", choice=Modelica.Blocks.Types.StateSelection.Prefer "Prefer (use as state if possible)", choice=Modelica.Blocks.Types.StateSelection.Always "Always (always use as state)"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end Temp;

      end StateSelection;

    end Types;

  end Blocks;

  package SIunits "Type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Invisible=true, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-63,-67},{45,-13}}, textString="[kg.m2]", fontName="Arial")}), Documentation(info="<html>
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{169,86},{349,236}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{169,236},{189,256},{369,256},{349,236},{169,236}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{369,256},{369,106},{349,86},{349,236},{369,256}}),Text(visible=true, fillColor={160,160,160}, extent={{179,196},{339,226}}, textString="Library", fontName="Arial"),Text(visible=true, extent={{206,119},{314,173}}, textString="[kg.m2]", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{163,264},{406,320}}, textString="Modelica.SIunits", fontName="Arial")}));
    package Conversions "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Library2;
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineThickness=1, extent={{-92,-67},{-33,-7}}, textString="°C", fontName="Arial"),Text(visible=true, extent={{22,-67},{82,-7}}, textString="K", fontName="Arial"),Line(visible=true, points={{-26,-36},{6,-36}}),Polygon(visible=true, pattern=LinePattern.None, fillPattern=FillPattern.Solid, points={{6,-28},{6,-45},{26,-37},{6,-28}})}), Documentation(info="<HTML>
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
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Library2;
        type Temperature_degC= Real(final quantity="ThermodynamicTemperature", final unit="degC") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-66,-67},{52,-13}}, textString="[rev/min]", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end NonSIunits;

    end Conversions;

    type Angle= Real(final quantity="Angle", final unit="rad", displayUnit="deg") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Length= Real(final quantity="Length", final unit="m") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Position= Length annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Distance= Length(min=0) annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Volume= Real(final quantity="Volume", final unit="m3") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type AngularVelocity= Real(final quantity="AngularVelocity", final unit="rad/s", displayUnit="rev/min") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type AngularAcceleration= Real(final quantity="AngularAcceleration", final unit="rad/s2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Velocity= Real(final quantity="Velocity", final unit="m/s") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Mass= Real(quantity="Mass", final unit="kg", min=0) annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Density= Real(final quantity="Density", final unit="kg/m3", displayUnit="g/cm3", min=0) annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type MomentOfInertia= Real(final quantity="MomentOfInertia", final unit="kg.m2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Inertia= MomentOfInertia annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Force= Real(final quantity="Force", final unit="N") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Torque= Real(final quantity="Torque", final unit="N.m") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Pressure= Real(final quantity="Pressure", final unit="Pa", displayUnit="bar") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type ThermodynamicTemperature= Real(final quantity="ThermodynamicTemperature", final unit="K", min=0, displayUnit="degC") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Temperature= ThermodynamicTemperature annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    defineunit m;
    defineunit kg;
    defineunit s;
    defineunit A;
    defineunit K;
    defineunit mol;
    defineunit cd;
    defineunit rad (exp="m/m");
    defineunit sr (exp="m2/m2");
    defineunit Hz (exp="s-1", weight=0.8);
    defineunit N (exp="m.kg.s-2");
    defineunit Pa (exp="N/m2");
    defineunit W (exp="J/s");
    defineunit J (exp="N.m");
    defineunit C (exp="s.A");
    defineunit V (exp="W/A");
    defineunit F (exp="C/V");
    defineunit Ohm (exp="V/A");
    defineunit S (exp="A/V");
    defineunit Wb (exp="V.s");
    defineunit S (exp="A/V");
    defineunit Wb (exp="V.s");
    defineunit T (exp="Wb/m2");
    defineunit H (exp="Wb/A");
    defineunit lm (exp="cd.sr");
    defineunit lx (exp="lm/m2");
    defineunit Bq (exp="s-1");
    defineunit Gy (exp="J/kg");
    defineunit Sv (exp="J/kg");
    defineunit kat (exp="s-1.mol");
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,135}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial"),Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-64,-20},{-50,-4},{50,-4},{36,-20},{-64,-20},{-64,-20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-64,-84},{36,-20}}),Text(visible=true, fillColor={128,128,128}, extent={{-60,-38},{32,-24}}, textString="Library", fontName="Arial"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-4},{50,-70},{36,-84},{36,-20},{50,-4}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    partial package Library "Icon for library"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-85,-85},{65,35}}, textString="Library", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,122}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Library;

    partial package Library2 "Icon for library where additional icon elements shall be added"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,125}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Library2;

    partial model Example "Icon for an example model"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85,-85},{65,35}}, textString="Example", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Example;

    partial function Function "Icon for a function"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-140,102},{136,162}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={255,127,0}, extent={{-100,-100},{100,100}}, textString="f", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Function;

    partial class Enumeration "Icon for an enumeration (emulated by a package)"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-138,104},{138,164}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={255,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={255,0,127}, extent={{-100,-100},{100,100}}, textString="e", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Enumeration;

    type TypeInteger "Icon for an Integer type"
      extends Integer;
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-94,-94},{94,94}}, textString="I", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end TypeInteger;

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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-34,-38},{12,-38}}, thickness=0.5),Line(visible=true, points={{-20,-38},{-24,-48},{-28,-56},{-34,-64}}, thickness=0.5),Line(visible=true, points={{-2,-38},{2,-46},{8,-56},{14,-64}}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Constants;

end Modelica;
package MultiBody "Modelica library to model 3D mechanical systems"
  extends Modelica.Icons.Library;
  import SI = Modelica.SIunits;
  annotation(Documentation(info="<html>

<p>
This library is used to model <b>3-dimensional mechanical</b> systems, such as robots, satellites or vehicles. The components of the MultiBody library
can be combined with the 1D-mechanical libraries
Modelica.Mechanics.Rotational and Modelica.Mechanics.Translational.
A unique feature of the MultiBody library is the efficient treatment of
joint locking and unlocking. This allows e.g. easy modeling of friction or
brakes in the joints.

<p>
A first example to model a simple pendulum is given in the next figure:

<IMG SRC=\"Images/Pendulum1.png\" ALT=\"Pendulum1\">

<p>
This system is built up by the following components:

<ul>
<li> Component <b>inertial</b> is an instance of
     MultiBody.Parts.InertialSystem and defines the inertial
     system of the model as well as the gravity acceleration</li>
<li> Component <b>revolute</b> is an instance of
     MultiBody.Joints.Revolute and defines a revolute joint which
     is connected to the inertial system. The axis of rotation is
     defined to be vector {0,0,1}, i.e., a vector in z-direction
     resolved in the frame at the left side of the revolute joint.
     Since this frame is rigidly attached to the inertial frame, these
     two frames are identical. As a consequence, the revolute joint
     rotates around the z-axis of the inertial system.</li>
<li> Component <b>boxBody</b> is an instance of
     MultiBody.Parts.BoxBody and defines a box. The box is defined
     by lenght, width and height and some material properties, such
     as the density. The mass, center of mass and inertia tensor
     are calculated from this data. Additionally, the shape of the box
     is used for animation.</li>
<li> Component <b>damper</b> is an instance of
     Modelica.Mechanics.Rotational.Damper and defines the
     velocity dependent damping in the joint axis. It is connected
     between the driving flange <b>axis</b> of the joint and
     flange <b>bearing</b>. Both flanges are 1D mechanical connections.</li>
</ul>

<p>
The 3D-components are connected together at connectors <b>Frame_a</b>
or <b>Frame_b</b>. Both connectors define a coordinate system (a frame)
at a specific location of the component, which is fixed in the component.
The frame, i.e., the corresponding connector, is defined by the following
variables:

<pre>
  S[3,3]: Rotation matrix describing the frame with respect to the inertial
          frame, i.e. if ha is vector h resolved in frame_a and h0 is
          vector h resolved in the inertial frame, h0 = S*ha.
  r0[3] : Vector from the origin of the inertial frame to the origin
          of the frame, resolved in the inertial frame in [m] !!! (note,
          that all other vector quantities are resolved in frame_a!!!).
  v[3]  : Absolute (translational) velocity of the frame, resolved in
          the frame in [m/s]:  v = transpose(S)*der(r0)
  w[3]  : Absolute angular velocity of the frame, resolved in the frame,
          in [rad/s]:  w = vec(transpose(S)*der(S)), where
                      |   0   -w[3]  w[2] |
            skew(w) = |  w[3]   0   -w[1] | and w=vec(skew(w))
                      | -w[2]  w[1]   0   |
  a[3]  : Absolute translational acceleration of the frame minus gravity
          acceleration, resolved in the frame, in [m/s^2]:
             a = transpose(S)*( der(S*v) - ng*g )
          (ng,g are defined in model MultiBody.Parts.InertialSystem).
  z[3]  : Absolute angular acceleration of the frame, resolved in the
          frame, in [rad/s^2]:  z = transpose(S)*der(S*w)
  f[3]  : Resultant cut-force acting at the origin of the frame,
          resolved in the frame, in [N].
  t[3]  : Resultant cut-torque with respect to the origin of the frame,
          resolved in the frame, in [Nm].
</pre>

<p>
If two frame-connectors are connected together, the corresponding frames
are rigidly fixed together, i.e., they are identical. Usually, all vectors
of a component are expressed in <b>frame_a</b> of this component, i.e., in
a coordinate system fixed in the component. For example, the vector from
the origin of frame_a to the center-of-mass in component
MultiBody.Parts.Body is resolved in frame_a.

<p>
Similiarily to the pendulum example above, most local frames are
parallel to each other, if the generalized relative coordinates of the
joints are zero. This means that in this configuration all vectors
can be defined, as if the vectors would be expressed in the inertial frame
(since all frames are parallel to each other). This view simplifies
the definition. Only, if components
Parts.FrameRotation, Parts.FrameAxes or Parts.FrameAngles are used, the
frames are no longer parallel to each other in this nominal configuration.

<p>
A more advance example is shown in the next figure.
It is the definition of the mechanical structure of the robot r3,
defined in the MultiBody.Examples.Robots.r3 sublibrary. It consists
of a robot with 6 degrees-of-freedoms constructed with 6 revolutes
joints and 6 shape bodies (i.e., the mass and inertia data is computed
from shape data). The flanges of the driving axes of the joints
are defined as flanges external to the model (connectors axis1, axis2,
..., axis6).

<IMG SRC=\"Images/r3Robot1.png\" ALT=\"robot r3 (diagram layer)\">

<p>
After processing the r3 model with a Modelica translator and
simulating it, an animation can be performed:

<IMG SRC=\"Images/r3Robot2.png\" ALT=\"robot r3 (animation)\">

<p>
It is also possible to define multibody systems which have kinematic
loops. An example is given in the next two figures (as object diagram
and as animation view) where a mechanism with two coupled loops and
one degree of freedom is shown:

<IMG SRC=\"Images/TwoLoops1.png\" ALT=\"TwoLoops1\">
<IMG SRC=\"Images/TwoLoops2.png\" ALT=\"TwoLoops2\">

<p>
The ModelicaAdditions.MultiBody library consists of the following elements:

<ul>
<li><b>Inertial system</b> (in package MultiBody.Parts):<br>
    Exactly one inertial system must be present.</li>

<li><b>Rigid bodies</b> in package MultiBody.Parts (grey icons or
  brown icons if animation information included):<br>
  There are several model classes to define rigid bodies which have mass and
  inertia. Often it is most convienient to
  use the  BoxBody- and CylinderBody-model classes. Here, a box or a cylinder
  is defined. From the definition the mass, center of mass and inertia
  tensor is computed. Furthermore, the defined shape is used in the animation.
  All body objects have at most 2 frames where the body can be connected with
  other elements. If a rigid body has several attachment points where
  additional elements can be connected, it has to be built up by several
  body or (massless) frame elements (FrameTranslation, FrameRotationm ...)
  which are rigidly connected together.
  Presently, elastic bodies are not supported.</li>

<li><b>Joints</b> in the <b>spanning tree</b> in package MultiBody.Joints:<br>
  A general multibody system with closed kinematic loops is handeled by dividing
  the joints into two distinct sets: <b>Tree-Joints</b> and <b>Cut-Joints</b>.
  After removal of all of the Cut-Joints, the resulting system must have a
  tree-structure. All joints in subpackage <b>Joints</b>, are joints used
  in this spanning tree. The relative motion between the two cut-frames of a
  Joint is described by f (0 <= f <= 6) generalized minimal-coordinates q
  and their first and second derivatives qd, qdd. By default, q and qd are
  used as state variables. In a kinematic loop, 6-nc degrees-of-freedom
  have to be removed, when the cut-joints introduces nc constraints.
  The Modelica translator can perform this removal automatically. In order
  to guide the translator, every joint has a parameter <b>startValueFixed</b>
  which can be used to require, that a particular degree-of-freedom
  should be selected as a state, because the given start values
  for the generalized coordinates q and qd have to be taken literally
  (this is realized, by setting attribute <b>fixed</b> = startValueFixed
  for the corresponding potential state variables).
  The one-degree-of-freedom joints (Revolute,
  Prismatic, Screw) may have a <b>variable</b> structure. That is, the joint can
  be <b>locked</b> and <b>unlocked</b> during the movement of a multibody system.
  This feature can be used to model brakes, clutches, stops or sticking friction.
  Locking is modelled with elements of the Modelica.Mechanics.Rotational library,
  such as classes Clutch or Friction, which can be attached to flange <b>axis</b>
  of the joints.</li>

<li><b>Cut-Joints</b> in package MultiBody.CutJoints:<br>
  All  red  joints are cut joints. Cut joints are used to
  break closed kinematic loops (see previous paragraph).</li>

<li><b>Force</b> elements in package MultiBody.Forces:<br>
  Force elements, such as springs and dampers, can be attached between
  two points of distinct bodies or joints. However, it is <b>not possible
  to connect force elements with other force elements</b>. It is easy for an
  user to introduce new force elements as subclasses from already existing
  ones (e.g. from model class MultiBody.Interfaces.LineForce).
  One-dimensional force laws can be
  used from the MultiBody.Mechanics.Rotational library.
  Gravitational forces for <b>all</b> bodies are taken into account by setting
  the gravitational acceleration of the inertial system (= object of
  MultiBody.Parts.InertialSystem) to a nonzero value.</li>

<li><b>Sensor</b> elements in package MultiBody.Sensors (yellow icons):<br>
  Between two distinct points of bodies and joints a sensor element can be
  attached. A sensor is used to calculate relative kinematic quantities
  between the two points. In the libraries a general 3D sensor element
  (calculate all relative quantities) and a line-sensor element are
  present. </li>
</ul>

<p>
<b>Connection Rules</b>:<br>
The elements of the multibody library cannot be connected arbitrarily
together. Instead the following rules hold:

<ol>
<li><b>Tree joint</b> objects, <b>body</b> objects
    and the <b>inertial system</b> have to be connected together in such a way
    that a <b>frame_a</b> of an object (cut filled with blue color) is always connected
    to a <b>frame_b</b> of an object (non-filled cut). The connection structure
    has to form a <b>tree</b> with the inertial system as a root.</li>

<li><b>Cut-joint</b>, <b>force</b>, and <b>sensor</b> objects have to be
    always connected
    between two frames of a <b>tree joint</b>, <b>body</b> or
    <b>inertial system</b> object.
    E.g., it is not allowed to connect two force objects together.
    </li>

<li>By using the <b>input/output</b> prefixes of Modelica in the corresponding
    connectors of the MultiBody library, it is guaranteed that
    only connections can be carried out, for which the library is
    designed.</li>
</ol>


<p>
This package is not part of the Modelica standard library, because a
\"truely object-oriented\" 3D-mechanical library is under
development. The essential difference is that the new library
no longer has restrictions on connections and that the modeller
does not have to handle systems with kinematic loops in a different
way (as a consequence, sublibrary CutJoints will be removed; the
structure of the remaining library will be not changed, only the
implementation of the model classes).

<p>
Note, this library utilizes the non-standard function <b>constrain(..)</b>
and assumes that this function is supported by the Modelica translator:

<pre>
   Real r[:], rd[:], rdd[:];
      ...
   r   = ..
   rd  = ...
   rdd = ...
   constrain(r,rd,rdd);
</pre>

<p>
where r, rd and rdd are variables which need to be computed
somewhere else. Function constrain()
is used to explicitly inform the Modelica translator that
rd is the derivative of r and rdd is the derivative of rd
and that all derivatives need to be identical to zero.
The Modelica translator can utilize this information to use
rd and rdd whenever the Pantelides algorithm requires to compute
the derivatives of r. This enhances the efficiency considerably.
A simple, but inefficient, implementation of constrain() is:

<pre>
   r = 0;
</pre>

<p>
In the multibody library, function constrain() is used in the cut joints,
i.e., whenever kinematic loops are present.

<p>
<b>References</b>

<pre>
The following paper can be downloaded from:
 http://www.dynasim.se/publications.html

Algorithmic details of the multibody library are described in
 Otter M., Elmqvist H., and Cellier F.E:  Modeling of Multibody Systems
   with the Object-Oriented Modeling Language Dymola . Proceedings
   of the NATO-Advanced Study Institute on  Computer Aided
   Analysis of Rigid and Flexible Mechancial Systems , Volume II,
   pp. 91-110, Troia, Portugal, 27 June - 9 July, 1993. Also in:
   Nonlinear Dynamics, 9:91-112, 1996, Kluwer Academic Publishers.
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

<p><b>Release Notes:</b>
<ul>
<li><i>June 20, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
<ul>
<li><i>August 21, 2009</i>
       by <a href=\"http://www.mathcore.com/\">MathCore Engineering AB</a>:<br>
This library has been moved out from the ModelicaAdditions library and updated. Below is a list of changes that have been made in order to be compatible with the current release of <i>MathModelica</i>. All changes are have been made in such a way that it should work the same as the older ModelicaAdditions.MultiBody library. Especially, no changes of equations or algorithms have been made from the original library.
<ul>
<li>
All graphical annotations have been updated to comply with Modelica 3.0.
</li>
<li>
Images available in the documentation have been changed to png format instead of gif format.
</li>
<li>
The following models have been changed so that the correct states are used during simulation:
<ul>
<li>
<b>MultiBody.Examples.Robots.r3.Components.GearType1:</b> Changed parameter stateSelection from <i>Default</i> to to <i>Avoid</i> for spring and Jmotor component.
</li>
<li>
<b>MultiBody.Interfaces.TwoNoTreeFrames:</b> Added start={1,1,1} to the parameter r0a.
</li>
<li>
<b>MultiBody.Joints.FreeMotion:</b> Added stateSelect=StateSelect.Prefer to the variable phi.
</li>
<li>
<b>MultiBody.Joints.Spherical:</b> Added stateSelect=StateSelect.Prefer to the variable phi.
</li>
</ul>
</li>
<li>Added experiment settings for all examples so that they simulate for the amount of time specified in the documentation.
</li>
<li>Removed function calls in calculation of S_rel in <b>MultiBody.Parts.FrameAngles</b> and <b>MultiBody.Parts.FrameRotation</b> due to index reduction problems in current version of <i>MathModelica</i>. Instead the calls are replaced with the equivalent calculations made inside the functions.
</li>
</ul>
 </li>
</ul>

<p><b>Copyright &copy; 2000-2002, DLR.</b>

<p><i>
The ModelicaAdditions.MultiBody package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i>

</HTML>
", revisions=""));
  package CutJoints "Cut-joints for 3D mechanical components"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains cut-joint models.

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

<p><b>Release Notes:</b>
<ul>
<li><i>April 5, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

<p><b>Copyright &copy; 2000-2002, DLR.</b>

<p><i>
The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i>

</HTML>
", revisions=""));
    model ConnectingRod2 "Massless rod between two spherical joints used as Cut-Joint (body can be attached)"
      extends Interfaces.CutJoint;
      parameter SI.Length L=1 "Length of the rod";
      parameter Real na[3]={0,0,1} "orthogonal to y-axis of cut-frame C";
      SI.Force fRod "Constraint force in direction of the rod";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-130.0},{100.0,-70.0}}, textString="%name=%L", fontName="Arial"),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-90.0,-40.0},{-10.0,40.0}}),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-30.0},{-20.0,30.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50.0,-40.0},{-10.0,40.0}}),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{10.0,-40.0},{90.0,40.0}}),Ellipse(visible=true, lineColor={192,192,192}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{20.0,-29.0},{80.0,30.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{10.0,-40.0},{31.0,40.0}}),Rectangle(visible=true, fillColor={255,0,0}, fillPattern=FillPattern.HorizontalCylinder, extent={{-51.0,-4.0},{48.0,6.0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-64.0,15.0},{-35.0,-13.0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{33.0,14.0},{62.0,-14.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-51.0,100.0},{-65.0,70.0},{-35.0,70.0},{-51.0,100.0},{-51.0,100.0}}),Line(visible=true, points={{-50.0,-4.0},{-50.0,70.0}}),Line(visible=true, points={{-61.0,1.0},{18.0,1.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{41.0,0.0},{10.0,15.0},{10.0,-15.0},{41.0,0.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-9.0,-55.0},{31.0,-15.0}}, textString="x", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-110.0,70.0},{-70.0,110.0}}, textString="y", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-6.0,34.0},{33.0,74.0}}, textString="c", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-48.0,-60.0},{36.0,-60.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{46.0,-60.0},{31.0,-54.0},{31.0,-66.0},{46.0,-60.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-20.0,-100.0},{20.0,-65.0}}, textString="L", fontName="Arial"),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-90.0,-40.0},{-10.0,40.0}}),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-31.0},{-20.0,29.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45.0,-40.0},{-10.0,40.0}}),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{10.0,-40.0},{90.0,40.0}}),Ellipse(visible=true, lineColor={192,192,192}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{20.0,-29.0},{80.0,30.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{10.0,-40.0},{31.0,40.0}}),Rectangle(visible=true, fillColor={255,0,0}, fillPattern=FillPattern.HorizontalCylinder, extent={{-51.0,-4.0},{48.0,6.0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-64.0,15.0},{-35.0,-13.0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{33.0,14.0},{62.0,-14.0}}),Line(visible=true, points={{48.0,-72.0},{48.0,0.0}}, color={0,0,255}),Line(visible=true, points={{-50.0,-72.0},{-50.0,0.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-3.0,9.0},{17.0,34.0}}, textString="cut c", fontName="Arial")}), Documentation(info="<html>

<p>
A ConnectingRod2 instance is a rod which has a spherical joint on each of its
two ends. It has 5 degrees of freedom. It has no mass and no inertia and is
used as cut joint to break a kinematic loop of a multibody system. It is
highly recommended to use this cut-joint whenever possible, because this
enhances the efficiency considerably.

<p>
The third cut frame_c is a frame fixed in the rod at the origin of frame_a
(definition of frame_c: x-axis = rod-axis from frame_a to frame_b;
y-axis = orthogonal to x-axis and to vector na which is fixed in frame_a).
At frame_c body objects can be connected to describe the mass and inertia
proporties of the rod. Since there are spherical joints at each end of the
rod, there is an isolated degree of freedom which allows the rotation of the
rod along the rod axis. This movement usually has no influence on the rest of
the multibody system and is of no technical interest. Mathematically, this
degree of freedom is removed by the additional constraint equation that
the y-axis of frame_c is always orthogonal to the pre-defined vector
na which is fixed in frame_a.

<pre>
Parameters:
  L : Length of the rod in [m]
  na: Vector fixed in frame_a (i.e., fixed in the body which is
      connected at frame_a) and resolved with respect to the
      inertial frame in the home position. The y-axis of the rod-fixed
      frame_c is defined to be orthogonal to the x-axis and to
      vector na.
</pre>

<p>
The single constraint equation on position level states, that the distance
between the origins of frame_a and frame_b is equal to the length of the rod.

<p>
As constraint force fRod (= Lagrange multiplier) of the joint the force along the rod axis is used.

</html>", revisions=""));
      Interfaces.Frame_b frame_c(S=Sc, r0=r0c, v=vc, w=wc, a=ac, z=zc, f=-fc, t=-tc) annotation(Placement(visible=true, transformation(origin={-21.0,21.0}, extent={{-15.0,15.0},{15.0,-15.0}}, rotation=90), iconTransformation(origin={-21.0,21.0}, extent={{-15.0,15.0},{15.0,-15.0}}, rotation=90)));
    protected 
      Real Sc[3,3];
      Real r0c[3];
      Real vc[3];
      Real wc[3];
      Real ac[3];
      Real zc[3];
      Real fc[3];
      Real tc[3];
      Real fb_a[3] "cut-force fb resolved in cut a";
      Real b1[3];
      Real bd[3];
      Real bdd[3];
      Real normb;
      Real bb;
      Real nx[3];
      Real ny[3];
      Real nz[3];
      Real S_relc[3,3];
      Real nxd[3];
      Real nyd[3];
      Real nzd[3];
      Real w_relc[3];
      Real nxdd[3];
      Real nydd[3];
      Real nzdd[3];
      Real z_relc[3];
      Real constraintResidue;
      Real constraintResidue_d;
      Real constraintResidue_dd;
      annotation(Documentation(info="
A ConnectingRod2 instance is a rod which has a spherical joint on each of its two ends.
It has 5 degrees of freedom. It has no mass and no inertia and is used as cut
joint to break a kinematic loop of a multibody system. It is highly recommended
to use this cut-joint whenever possible, because this enhances the efficiency
considerably.

The third cut frame_c is a frame fixed in the rod at the origin of frame_a
(definition of frame_c: x-axis = rod-axis from frame_a to frame_b;
y-axis = orthogonal to x-axis and to vector na which is fixed in frame_a).
At frame_c body objects can be connected to describe the mass and inertia
proporties of the rod. Since there are spherical joints at each end of the
rod, there is an isolated degree of freedom which allows the rotation of the
rod along the rod axis. This movement usually has no influence on the rest of
the multibody system and is of no technical interest. Mathematically, this
degree of freedom is removed by the additional constraint equation that
the y-axis of frame_c is always orthogonal to the pre-defined vector
na which is fixed in frame_a.

Parameters:
  L : Length of the rod in [m]
  na: Vector fixed in frame_a (i.e., fixed in the body which is
      connected at frame_a) and resolved with respect to the
      inertial frame in the home position. The y-axis of the rod-fixed
      frame_c is defined to be orthogonal to the x-axis and to
      vector na.

The single constraint equation on position level states, that the
distance between the origins of frame_a and frame_b is equal
to the length of the rod. As constraint force fRod (= Lagrange multiplier)
of the joint the force along the rod axis is used.
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,-70},{100,-130}}, textString="%name=%L", fillColor={0,0,255}),Ellipse(extent={{-90,-40},{-10,40}}, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{-80,-30},{-20,30}}, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{-50,40},{-10,-40}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Ellipse(extent={{10,-40},{90,40}}, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{20,-29},{80,30}}, lineColor={192,192,192}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{10,40},{31,-40}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{-51,6},{48,-4}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={255,0,0}),Ellipse(extent={{-64,15},{-35,-13}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{33,14},{62,-14}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Polygon(points={{-51,100},{-65,70},{-35,70},{-51,100},{-51,100}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(points={{-50,-4},{-50,70}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-61,1},{18,1}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{41,0},{10,15},{10,-15},{41,0}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-9,-15},{31,-55}}, textString="x", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-110,110},{-70,70}}, textString="y", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-6,74},{33,34}}, textString="c", fillColor={128,128,128})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-48,-60},{36,-60}}),Polygon(points={{46,-60},{31,-54},{31,-66},{46,-60}}, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-20,-65},{20,-100}}, textString="L"),Ellipse(extent={{-90,-40},{-10,40}}, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{-80,-31},{-20,29}}, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{-45,40},{-10,-40}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Ellipse(extent={{10,-40},{90,40}}, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{20,-29},{80,30}}, lineColor={192,192,192}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{10,40},{31,-40}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(extent={{-51,6},{48,-4}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={255,0,0}),Ellipse(extent={{-64,15},{-35,-13}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{33,14},{62,-14}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Line(color={0,0,255}, points={{48,-72},{48,0}}),Line(color={0,0,255}, points={{-50,-72},{-50,0}}),Text(lineColor={0,0,255}, extent={{17,9},{-3,34}}, textString="cut c")}));
    equation 
      constraintResidue=(r_rela*r_rela - L*L)/2 "Constraint equations on position, velocity and acceleration level";
      constraintResidue_d=r_rela*v_rela;
      constraintResidue_dd=r_rela*a_rela + v_rela*v_rela;
      constrain(constraintResidue, constraintResidue_d, constraintResidue_dd);
      nx=r_rela/L "Compute relative transformation matrix S_relc (cut a  cut c) and absolute transformation matrix Sc (cut c  inertial system)";
      b1=cross(na, nx);
      normb=sqrt(b1*b1);
      ny=b1/normb;
      nz=cross(nx, ny);
      S_relc=transpose([nx,ny,nz]);
      Sc=Sa*transpose(S_relc);
      nxd=v_rela/L;
      bd=cross(na, nxd)/normb;
      bb=ny*bd;
      nyd=bd - bb*ny;
      nzd=cross(nxd, ny) + cross(nx, nyd);
      w_relc={nz*nyd,nx*nzd,ny*nxd};
      wc=S_relc*wa + w_relc;
      nxdd=a_rela/L;
      bdd=cross(na, nxdd)/normb - bb*bd;
      nydd=bdd - (nyd*bd + ny*bdd)*ny - bb*nyd;
      nzdd=cross(nxdd, ny) + cross(nx, nydd) + 2*cross(nxd, nyd);
      z_relc={nz*nydd + nzd*nyd,nx*nzdd + nxd*nzd,ny*nxdd + nyd*nxd};
      zc=S_relc*za + cross(wc, w_relc) + z_relc;
      r0c=r0a "Compute translational quantities of cut c";
      vc=S_relc*va;
      ac=S_relc*aa;
      fb_a=transpose(S_relc)*{fRod,-tc[3]/L,tc[2]/L};
      fb=S_rel*fb_a;
      fa=fb_a + transpose(S_relc)*fc;
      tb=zeros(3);
      ta=nx*tc[1];
    end ConnectingRod2;

  end CutJoints;

  package Examples "Examples for the 3D mechanical systems library"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains example models to demonstrate the usage of the
ModelicaAdditions.MultiBody package. Open the models and simulate them
according to the provided description in the models.

</HTML>", revisions=""));
    package Loops "Example of mechanical systems with kinematic loops"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<html>

<p>
This package contains multibody models with kinematic loops

</HTML>", revisions=""));
      encapsulated model Engine1
        import MultiBody.CutJoints;
        import MultiBody.Parts;
        import MultiBody.Examples.Loops.Utilities;
        extends Utilities.Engine;
        annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Parts.ShapeBody rodBody(r={L,0,0}, rCM={L/2,0,0}, m=0.5, I33=0.0018, Width=0.02, Height=0.01) annotation(Placement(visible=true, transformation(origin={-6.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        CutJoints.ConnectingRod2 rod(L=L, na={0,0,1}, r_rela(start={-0.2,0,0}, each fixed=false)) annotation(Placement(visible=true, transformation(origin={10.0,10.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        annotation(Documentation(info="<html>

<p>
Use the following settings:<br>
experiment StopTime=0.2 Interval=0.002 Tolerance=1.E-8

<p>
Perform 'simulate' and then see animation in Animation window.

<p>
Plot the following variables:

<pre>
  AngVelDegS: Angular velocity of motor shaft [rev/min]
  x         : position of cylinder [m]
  press     : pressure in cylinder [bar]
</pre>
</html>", revisions=""), experiment(StopTime=0.2, Interval=0.002, Tolerance=1e-08), Commands(file="Engine1.mos" "Simulate and plot x and V"));
      equation 
        connect(crank.frame_b,rod.frame_b) annotation(Line(visible=true, points={{-17.5,10.0},{-0.5,10.0}}, color={0,0,255}));
        connect(rod.frame_a,cyl.frame_b) annotation(Line(visible=true, points={{20.5,10.0},{70.0,10.0},{70.0,-70.0},{60.5,-70.0}}, color={0,0,255}));
        connect(rod.frame_c,rodBody.frame_a) annotation(Line(visible=true, points={{12.1,12.1},{12.0,30.0},{4.5,30.0}}, color={0,0,255}));
      end Engine1;

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
          constant Real PI=Modelica.Constants.pi "Only for compatibility reasons";
          SI.Position x;
          SI.Density dens;
          SI.Pressure press "cylinder pressure";
          SI.Volume V;
          SI.Temperature T;
          SI.Velocity v_rel;
          annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-90.0,-50.0},{90.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-50.0},{-20.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90.0,-10.0},{-40.0,10.0}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{60.0,2.0},{54.0,2.0},{0.0,2.0},{0.0,10.0},{-20.0,0.0},{0.0,-10.0},{0.0,-4.0},{60.0,-4.0},{60.0,2.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,60.0},{100.0,120.0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-90.0,-50.0},{90.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-50.0},{-20.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90.0,-10.0},{-40.0,10.0}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{60.0,2.0},{54.0,2.0},{0.0,2.0},{0.0,10.0},{-20.0,0.0},{0.0,-10.0},{0.0,-4.0},{60.0,-4.0},{60.0,2.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,60.0},{100.0,120.0}}, textString="%name", fontName="Arial")}), Documentation(info="", revisions=""));
        equation 
          x=1 - s_rel/L;
          v_rel=der(s_rel);
          press=if v_rel < 0 then if x < 0.987 then 177.4132*x^4 - 287.2189*x^3 + 151.8252*x^2 - 24.9973*x + 2.4 else 2836360*x^4 - 10569296*x^3 + 14761814*x^2 - 9158505*x + 2129670 else if x > 0.93 then -3929704*x^4 + 14748765*x^3 - 20747000*x^2 + 12964477*x - 3036495 else 145.93*x^4 - 131.707*x^3 + 17.3438*x^2 + 17.9272*x + 2.4;
          f=-100000.0*press*pi*d^2/4;
          V=k0 + k1*(1 - x);
          dens=1/V;
          press*V=k*T;
        end GasForce;

        partial model Engine
          extends Modelica.Icons.Example;
          parameter Real D=0.1;
          parameter Real e=0.05;
          parameter Real L=0.2;
          parameter Real Load=20;
          constant Real pi=Modelica.Constants.pi;
          constant Real PI=Modelica.Constants.pi "Only for compatibility reasons";
          output Real AngVelDegS;
          output Real x;
          output Real press;
          output Real T;
          output Real V;
          output Real dens;
          annotation(Documentation(info="<html>

<p>
Use the following settings:<br>
experiment StopTime=0.2 Interval=0.002 Tolerance=1.E-8

<p>
Perform 'simulate' and then see animation in Animation window.

<p>
Plot the following variables:

<pre>
  AngVelDegS: Angular velocity of motor shaft [rev/min]
  x         : position of cylinder [m]
  press     : pressure in cylinder [bar]
</pre>
</html>", revisions=""));
          MultiBody.Parts.InertialSystem inertial(g=0) annotation(Placement(visible=true, transformation(origin={-70.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          MultiBody.Joints.Revolute r1(startValueFixed=true, qd(start=-157)) annotation(Placement(visible=true, transformation(origin={-40.0,-30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
          Joints.Prismatic cyl(n={-1,0,0}) annotation(Placement(visible=true, transformation(origin={50.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          Parts.FrameTranslation trans(r={sqrt((D/2 + L)^2 - e^2),-e,0}) annotation(Placement(visible=true, transformation(origin={0.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          Parts.ShapeBody piston(r={0.1,0,0}, m=0.3, I33=0.0001, Shape="cylinder", Width=0.05, Height=0.05) annotation(Placement(visible=true, transformation(origin={90.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          Parts.ShapeBody crank(r={D/2,0,0}, Width=0.01, Height=0.01, Material={0,0,1,0.5}) annotation(Placement(visible=true, transformation(origin={-28.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          GasForce gasForce(L=sqrt((L + D/2)^2 - e^2) - sqrt((L - D/2)^2 - e^2), d=0.05) annotation(Placement(visible=true, transformation(origin={50.0,-50.0}, extent={{-6.0,-6.0},{6.0,6.0}}, rotation=0)));
          Modelica.Mechanics.Rotational.Inertia flyWheel(J=0.0025) annotation(Placement(visible=true, transformation(origin={-64.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          Modelica.Mechanics.Rotational.BearingFriction torque(tau_pos=[0,Load]) annotation(Placement(visible=true, transformation(origin={-90.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        equation 
          connect(inertial.frame_b,trans.frame_a) annotation(Line(visible=true, points={{-59.5,-70.0},{-10.5,-70.0}}, color={0,0,255}));
          connect(inertial.frame_b,r1.frame_a) annotation(Line(visible=true, points={{-59.5,-70.0},{-40.0,-70.0},{-40.0,-40.5}}, color={0,0,255}));
          connect(r1.frame_b,crank.frame_a) annotation(Line(visible=true, points={{-40.0,-19.5},{-40.0,10.0},{-38.5,10.0}}, color={0,0,255}));
          connect(flyWheel.flange_b,r1.axis) annotation(Line(visible=true, origin={-50.5,-30.0}, points={{-3.5,0.0},{3.5,0.0}}, color={0,0,255}));
          connect(trans.frame_b,cyl.frame_a) annotation(Line(visible=true, points={{10.5,-70.0},{39.5,-70.0}}, color={0,0,255}));
          connect(cyl.frame_b,piston.frame_a) annotation(Line(visible=true, points={{60.5,-70.0},{79.5,-70.0}}, color={0,0,255}));
          connect(cyl.bearing,gasForce.flange_a) annotation(Line(visible=true, points={{47.0,-64.0},{47.0,-60.0},{40.0,-60.0},{40.0,-50.0},{44.0,-50.0}}, color={0,0,255}));
          connect(cyl.axis,gasForce.flange_b) annotation(Line(visible=true, points={{57.0,-64.0},{57.0,-60.0},{60.0,-60.0},{60.0,-50.0},{56.0,-50.0}}, color={0,0,255}));
          connect(torque.flange_b,flyWheel.flange_a) annotation(Line(visible=true, points={{-80.0,-30.0},{-74.0,-30.0}}, color={0,0,255}));
          AngVelDegS=-r1.qd*60/(2*pi);
          x=gasForce.s_rel;
          press=gasForce.press;
          T=gasForce.T;
          V=gasForce.V;
          dens=gasForce.dens;
        end Engine;

      end Utilities;

    end Loops;

  end Examples;

  package Interfaces "Connectors and partial models for 3D mechanical components"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains connectors and partial models for 3D mechanical
components.

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

<p><b>Release Notes:</b></p>
<ul>
<li><i>April 5, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

<p><b>Copyright &copy; 2000-2002, DLR.</b>

<p><i>
The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i>

</HTML>
", revisions=""));
    connector Frame_a "Frame a of a mechanical element"
      input SI.Position r0[3] "Position vector from inertial system to frame origin, resolved in inertial system";
      Real S[3,3] "Transformation matrix from frame_a to inertial system";
      SI.Velocity v[3] "Absolute velocity of frame origin, resolved in frame_a";
      SI.AngularVelocity w[3] "Absolute angular velocity of frame_a, resolved in frame_a";
      SI.Acceleration a[3] "Absolute acceleration of frame origin, resolved in frame_a";
      SI.AngularAcceleration z[3] "Absolute angular acceleration of frame_a, resolved in frame_a";
      flow SI.Force f[3];
      flow SI.Torque t[3];
      annotation(Documentation(info="<HTML>

<p>
Frame a  of a mechanical element.

<p>
All mechanical components are always connected together at frames.
A frame is a coordinate system in the (mechanical) cut-plane of the
connection point. The variables of the cut-plane are defined
with respect to the corresponding frame_a and have the following meaning:

<pre>
Potential variables:
  S : Rotation matrix describing frame_a with respect to the inertial
      frame, i.e. if ha is vector h resolved in frame_a and h0 is
      vector h resolved in the inertial frame, h0 = S*ha.
  r0: Vector from the origin of the inertial frame to the origin
      of frame_a, resolved in the inertial frame in [m] !!! (note,
      that all other vector quantities are resolved in frame_a!!!).
  v : Absolute (translational) velocity of frame_a, resolved in a,
      in [m/s]:  v = transpose(S)*der(r0)
  w : Absolute angular velocity of frame_a, resolved in a,
      in [rad/s]  :  w = vec(transpose(S)*der(S));  Note, that
                   |   0 -w3  w2 |
         skew(w) = |  w3   0 -w1 | and w=vec(skew(w))
                   | -w2  w1   0 |
  a : Absolute translational acceleration of frame_a - gravity
      acceleration, resolved in a, in [m/s^2]:
          a = transpose(S)*( der(S*v) - ng*g )
      (ng,g are defined in model MultiBody.Parts.InertialSystem).
  z : Absolute angular acceleration of frame_a, resolved in a,
      in [rad/s^2]:  z = transpose(S)*der(S*w)

Flow variables:
  f : Resultant cut-force acting at the origin of frame_a,
      resolved in a, in [N].
  t : Resultant cut-torque with respect to the origin of frame_a,
      resolved in a, in [Nm].
</pre>

</HTML>", revisions=""), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(lineColor={0,0,255}, points={{0,0},{-100,-100},{100,-100},{100,100},{-100,100},{0,0}}, fillPattern=FillPattern.Solid, fillColor={0,0,255})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{0.0,0.0},{-100.0,-100.0},{100.0,-100.0},{100.0,100.0},{-100.0,100.0},{0.0,0.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-220.0},{100.0,-120.0}}, textString="%name", fontName="Arial")}));
    end Frame_a;

    connector Frame_b "Frame b of a mechanical element"
      output SI.Position r0[3] "Position vector from inertial system to frame origin, resolved in inertial system";
      Real S[3,3] "Transformation matrix from frame_a to inertial system";
      SI.Velocity v[3] "Absolute velocity of frame origin, resolved in frame_a";
      SI.AngularVelocity w[3] "Absolute angular velocity of frame_a, resolved in frame_a";
      SI.Acceleration a[3] "Absolute acceleration of frame origin, resolved in frame_a";
      SI.AngularAcceleration z[3] "Absolute angular acceleration of frame_a, resolved in frame_a";
      flow SI.Force f[3];
      flow SI.Torque t[3];
      annotation(Documentation(info="<HTML>

<p>
Frame b  of a mechanical element.

<p>
All mechanical components are always connected together at frames.
A frame is a coordinate system in the (mechanical) cut-plane of the
connection point. The variables of the cut-plane are defined
with respect to the corresponding frame_b and have the following meaning:

<pre>
Potential variables:
  S : Rotation matrix describing frame_b with respect to the inertial
      frame, i.e. if ha is vector h resolved in frame_b and h0 is
      vector h resolved in the inertial frame, h0 = S*ha.
  r0: Vector from the origin of the inertial frame to the origin
      of frame_a, resolved in the inertial frame in [m] !!! (note,
      that all other vector quantities are resolved in frame_a!!!).
  v : Absolute (translational) velocity of frame_a, resolved in a,
      in [m/s]:  v = transpose(S)*der(r0)
  w : Absolute angular velocity of frame_a, resolved in a,
      in [rad/s]  :  w = vec(transpose(S)*der(S));  Note, that
                   |   0 -w3  w2 |
         skew(w) = |  w3   0 -w1 | and w=vec(skew(w))
                   | -w2  w1   0 |
  a : Absolute translational acceleration of frame_b - gravity
      acceleration, resolved in a, in [m/s^2]:
          a = transpose(S)*( der(S*v) - ng*g )
      (ng,g are defined in model MultiBody.Parts.InertialSystem).
  z : Absolute angular acceleration of frame_a, resolved in a,
      in [rad/s^2]:  z = transpose(S)*der(S*w)

Flow variables:
  f : Resultant cut-force acting at the origin of frame_a,
      resolved in a, in [N].
  t : Resultant cut-torque with respect to the origin of frame_a,
      resolved in a, in [Nm].
</pre>

</HTML>", revisions=""), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(lineColor={0,0,255}, points={{-100,-100},{0,-100},{100,0},{0,100},{-100,100},{-100,-100}}, fillPattern=FillPattern.Solid, fillColor={255,255,255})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100.0,-100.0},{0.0,-100.0},{100.0,0.0},{0.0,100.0},{-100.0,100.0},{-100.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-220.0},{100.0,-110.0}}, textString="%name", fontName="Arial")}));
    end Frame_b;

    partial model OneFrame_a "Superclass of elements with ONE mechanical frame_a"
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Frame_a frame_a(S=Sa, r0=r0a, v=va, w=wa, a=aa, z=za, f=fa, t=ta) annotation(Placement(visible=true, transformation(origin={-105.0,0.0}, extent={{-15.0,15.0},{15.0,-15.0}}, rotation=0), iconTransformation(origin={-105.0,0.0}, extent={{-15.0,15.0},{15.0,-15.0}}, rotation=0)));
    protected 
      Real Sa[3,3](start=identity(3));
      SI.Position r0a[3];
      SI.Velocity va[3];
      SI.AngularVelocity wa[3];
      SI.Acceleration aa[3];
      SI.AngularAcceleration za[3];
      SI.Force fa[3];
      SI.Torque ta[3];
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>one</b> mechanical frame,
which is called frame_a.
</p>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end OneFrame_a;

    partial model TwoTreeFrames "Superclass of elements of the spanning tree with TWO frames"
      constant Real pi=Modelica.Constants.pi;
      constant Real PI=Modelica.Constants.pi "Only for compatibility reasons";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>

<p>
Superclass of elements which have <b>two</b> mechanical frames in the spanning
tree, which are called <b>frame_a</b> and <b>frame_b</b>, respectively.

<p>
<b>Important:</b><br>
frame_a of an element should <b>always</b> be connected to a frame_b.<br>
frame_b of an element should <b>always</b> be connected to a frame_a.

</HTML>

", revisions=""));
      Frame_a frame_a(S=Sa, r0=r0a, v=va, w=wa, a=aa, z=za, f=fa, t=ta) annotation(Placement(visible=true, transformation(origin={-105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0), iconTransformation(origin={-105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
      Frame_b frame_b(S=Sb, r0=r0b, v=vb, w=wb, a=ab, z=zb, f=-fb, t=-tb) annotation(Placement(visible=true, transformation(origin={105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0), iconTransformation(origin={105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
    protected 
      Real Sa[3,3](start=identity(3));
      SI.Position r0a[3];
      SI.Velocity va[3];
      SI.AngularVelocity wa[3];
      SI.Acceleration aa[3];
      SI.AngularAcceleration za[3];
      SI.Force fa[3];
      SI.Torque ta[3];
      Real Sb[3,3](start=identity(3));
      SI.Position r0b[3];
      SI.Velocity vb[3];
      SI.AngularVelocity wb[3];
      SI.Acceleration ab[3];
      SI.AngularAcceleration zb[3];
      SI.Force fb[3];
      SI.Torque tb[3];
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> mechanical frames in the
spanning tree, which are called <b>frame_a</b> and
<b>frame_b</b>, respectively.

<p>
<b>Important</b><br>
frame_a of an element should <b>always</b> be connected to a frame_b.<br>
frame_b of an element should <b>always</b> be connected to a frame_a.
</p>
</HTML>

"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end TwoTreeFrames;

    partial model TwoNoTreeFrames "Superclass of elements not part of the spanning tree (two frames)"
      constant Real pi=Modelica.Constants.pi;
      constant Real PI=Modelica.Constants.pi "Only for compatibility reasons";
      Frame_a frame_a(S=Sa, r0=r0a, v=va, w=wa, a=aa, z=za, f=fa, t=ta) annotation(Placement(visible=true, transformation(origin={-105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0), iconTransformation(origin={-105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
      Frame_a frame_b(S=Sb, r0=r0b, v=vb, w=wb, a=ab, z=zb, f=-fb, t=-tb) annotation(Placement(visible=true, transformation(origin={105.0,0.0}, extent={{15.0,-15.0},{-15.0,15.0}}, rotation=0), iconTransformation(origin={105.0,0.0}, extent={{15.0,-15.0},{-15.0,15.0}}, rotation=0)));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-128.0,-55.0},{-89.0,-15.0}}, textString="a", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{91.0,-56.0},{130.0,-16.0}}, textString="b", fontName="Arial")}), Documentation(info="<HTML>

<p>
Superclass of elements which have <b>two</b> mechanical frames, which are
called frame_a and frame_b, respectively. Submodels of the class are not
allowed to be part of the spanning tree.

</HTML>", revisions=""));
    protected 
      Real Sa[3,3](start=identity(3));
      SI.Position r0a[3](start={1,1,1});
      SI.Velocity va[3];
      SI.AngularVelocity wa[3];
      SI.Acceleration aa[3];
      SI.AngularAcceleration za[3];
      SI.Force fa[3];
      SI.Torque ta[3];
      Real Sb[3,3](start=identity(3));
      SI.Position r0b[3];
      SI.Velocity vb[3];
      SI.AngularVelocity wb[3];
      SI.Acceleration ab[3];
      SI.AngularAcceleration zb[3];
      SI.Force fb[3];
      SI.Torque tb[3];
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> mechanical frames,
which are called frame_a and frame_b, respectively.
Submodels of the class are not allowed to be part of the
spanning tree.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-128,-15},{-89,-55}}, textString="a", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{91,-16},{130,-56}}, textString="b", fillColor={128,128,128})}));
    end TwoNoTreeFrames;

    model BodyBase "Inertia and mass properties of a rigid body"
      extends OneFrame_a;
      SI.Mass m;
      SI.Position rCM[3];
      SI.Inertia I[3,3];
      annotation(Documentation(info="<HTML>

<p>
This model should usually not be used directly, because the mass
properties have to be given as terminal variables and not as
parameters. This allows the computation of the mass properties
from other data, as well as the modification of the mass properties
at event points. The following variables have to be computed in
subclasses:

<pre>
  m     : Mass of body in [kg].
  rCM(3): Position vector from the origin of frame_a to the center
          of mass, resolved in frame_a in [m].
  I(3,3): Inertia tensor of the body with respect to the center of mass,
          resolved in frame_a in [kgm^2]. The matrix must be
          symmetric and positiv semi-definit.
</pre>

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,15.0},{0.0,-15.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.Sphere, extent={{0.0,-50.0},{100.0,50.0}}),Text(visible=true, lineColor={0,0,255}, extent={{-100.0,60.0},{100.0,122.0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,15.0},{0.0,-15.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.Sphere, extent={{0.0,-50.0},{100.0,50.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{22.0,-104.0},{82.0,-64.0}}, textString="center of mass", fontName="Arial"),Line(visible=true, points={{-90.0,-10.0},{-90.0,-72.0}}, color={0,0,255}),Line(visible=true, points={{50.0,0.0},{50.0,-72.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-66.0},{50.0,-66.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{36.0,-62.0},{36.0,-70.0},{50.0,-66.0},{36.0,-62.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-50.0,-62.0},{-24.0,-44.0}}, textString="rCM", fontName="Arial")}));
    equation 
      fa=m*(aa + cross(za, rCM) + cross(wa, cross(wa, rCM)));
      ta=I*za + cross(wa, I*wa) + cross(rCM, fa);
    end BodyBase;

    partial model Interact "Superclass of joint, force and sensor elements"
      Real S_rel[3,3];
      SI.Position r_rela[3];
      SI.Velocity v_rela[3];
      SI.AngularVelocity w_rela[3];
      SI.Acceleration a_rela[3];
      SI.AngularAcceleration z_rela[3];
      annotation(Documentation(info="<HTML>

<p>
All relative kinematic quantities between frame_a and frame_b are
defined, i.e., relative position, relative velocity and
relative acceleration (resolved in frame_a).

<p>
For efficiency reasons, these calculations are performed in
subclasses (= the same equations are just solved for different
variables according to the usually needed causality).
The relative quantities, which are defined in this
model, have the following meaning:

<pre>
  S_rel : Rotation matrix relating frame_a and frame_b, i.e. if
          hb is vector h resoved in frame_b and ha is vector h resolved
          in frame_a, hb = S_rel*ha.
  r_rela: Vector from the origin of frame_a to the origin of frame_b,
          resolved in frame_a.
  v_rela: (Translational) velocity of frame_b with respect to frame_a,
          resolved in frame_a: v_rela = der(r_rela)
  w_rela: Angular velocity of frame_b with respect to frame_a,
          resolved in frame_a: w_rela = vec( der(S_rel)'*S_rel )
  a_rela: (Translational) acceleration of frame_b with respect to
          frame_a, resolved in frame_a: a_rela = der( v_rela )
  z_rela: Angular acceleration of frame_b with respect to frame_a,
          resolved in frame_a: z_rela = der( w_rela )
</pre>

<p>
If needed, all of the above quantities can also easily be resolved in
frame_b, according to  Xrelb = S_rel*Xrela . However note, that
v_relb is <b>not</b> der(r_relb)  (v_relb=S_rel*v_rela; r_relb=S_rel*r_rela).

</HTML>", revisions=""), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end Interact;

    partial model Interact2 "Superclass of CutJoint, Force and Sensor classes"
      extends TwoNoTreeFrames;
      extends Interact;
      SI.Velocity vaux[3];
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})), Documentation(info="", revisions=""));
    equation 
      S_rel=transpose(Sb)*Sa;
      r_rela=transpose(Sa)*(r0b - r0a) "relative position vectors";
      vaux=cross(wa, r_rela) "relative velocities";
      v_rela=transpose(S_rel)*vb - va - vaux;
      w_rela=transpose(S_rel)*wb - wa;
      a_rela=transpose(S_rel)*ab - aa - cross(za, r_rela) - cross(wa, vaux + 2*v_rela) "relative accelerations";
      z_rela=transpose(S_rel)*zb - za - cross(wa, w_rela);
    end Interact2;

    partial model TreeJoint "Superclass of joints used in the spanning tree"
      extends TwoTreeFrames;
      extends Interact;
      annotation(Documentation(info="<HTML>

<p>
A joint has two mechanical cuts which may move relative to each other. In
every cut a coordinate system is rigidly attached, called frame_a and frame_b,
correspondingly. It is a massless element in which no energy is stored.
Mathematically, a joint transforms the kinematic properties of frame_a to
frame_b and at the same time transforms the force and torque acting on
frame_b to frame_a.

<p>
A general multibody system with closed kinematic loops is handeled by dividing
the joints into two distinct sets: <b>Tree-Joints</b> and <b>Cut-Joints</b>.
After removal of all of the Cut-Joints, the resulting system must have a
tree-structure. Class TreeJoint is used as a superclass for Tree-Joints.

<p>
The relative motion between the two cut-frames of a Tree-Joint is described
by f (0 <= f <= 6) generalized minimal-coordinates q and their first and
second derivatives qd, qdd. In subclasses of class TreeJoint the relative
kinematic quantities are given as functions of q, qd, qdd, according to the
specific joint type. In class TreeJoint the relationships are provided
between the kinematic and dynamic quantities of frame_a and frame_b and of the relative quantities.

<p>
In order to speedup the generation of the equations, the common equations of
TreeJoint classes are <b>not</b> stored in model TreeJoint, but in the
specific submodel. This has the advantage that special joint properties
(like S_rel=identity(3), i.e., the relative transformation matrix is a
unit matrix) are already utilized and the Modelica translator does not have
to waste time and space to find this out by symbolic formula transformation.
The common equations which could be stored in the TreeJoint
model are given as a comment below.

</HTML>
", revisions=""), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end TreeJoint;

    partial model CutJoint "Superclass of Cut-Joint classes"
      extends Interact2;
      annotation(Documentation(info="<HTML>

<p>
A joint has two mechanical cuts which may move relative to each
other. It is a massless element in which no energy is stored.
Mathematically, a joint transforms the kinematic properties
of frame_a to frame_b and at the same time transforms
the force and torque acting on frame_b to frame_a.

<p>
A general multibody system with closed kinematic loops is handeled
by dividing the joints into two distinct sets: Tree-Joints and
Cut-Joints. After removal of all of the Cut-Joints, the resulting
system must have a tree-structure. Class CutJoint is used as
a superclass for Cut-Joints.

<p>
Subclasses of class CutJoint have to provide the (6-f) constraint
equations on position level, where f are the number of degrees of freedom of the joint.

</HTML>", revisions=""), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
    end CutJoint;

  end Interfaces;

  package Joints "Joints in the spanning tree"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains elements to model ideal joints.

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

<p><b>Release Notes:</b></p>
<ul>
<li><i>April 5, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

<p><b>Copyright &copy; 2000-2002, DLR.</b></p>

<p><i>
The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i>

</HTML>
", revisions=""));
    model Revolute "Revolute joint (1 degree-of-freedom, used in spanning tree)"
      extends Interfaces.TreeJoint;
      parameter Real n[3]={0,0,1} "Axis of rotation resolved in frame_a (= same as in frame_b)";
      parameter Real q0=0 "Rotation angle offset (see info) [deg]";
      parameter Boolean startValueFixed=false "true, if start values of q, qd are fixed";
      SI.Angle q(final fixed=startValueFixed);
      SI.AngularVelocity qd(final fixed=startValueFixed);
      SI.AngularAcceleration qdd;
      SI.Angle qq;
      Real nn[3];
      Real sinq;
      Real cosq;
      annotation(Documentation(info="<HTML>

<p>
Joint where frame_b rotates around axis n which is fixed in frame_a.
The joint axis has an additional flange where it can be
driven with elements of the Modelica.Mechanics.Rotational library.
The relative angle q [rad] and the relative angular velocity
qd [rad/s] are used as state variables.

<p>
The following parameters are used to define the joint:

<pre>
  n : Axis of rotation resolved in frame_a (= same as in frame_b).
      n  must not necessarily be a unit vector. E.g.,
         n = {0, 0, 1} or n = {1, 0, 1}
  q0: Rotation angle offset in [deg].
      If q=q0, frame_a and frame_b are identical.
  startValueFixed: true, if start values of q, qd are fixed.
</pre>

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-60.0},{-30.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30.0,-60.0},{90.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-30.0,-10.0},{10.0,10.0}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{10.0,30.0},{30.0,50.0},{30.0,-50.0},{10.0,-30.0},{10.0,30.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-220.0,-140.0},{220.0,-80.0}}, textString="%name=%n", fontName="Arial"),Line(visible=true, points={{-20.0,70.0},{-50.0,70.0}}),Line(visible=true, points={{-20.0,80.0},{-20.0,60.0}}),Line(visible=true, points={{20.0,80.0},{20.0,60.0}}),Line(visible=true, points={{20.0,70.0},{41.0,70.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-10.0,50.0},{10.0,60.0}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10.0,30.0},{10.0,30.0},{30.0,50.0},{-30.0,50.0},{-10.0,30.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-60.0},{-30.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30.0,-60.0},{90.0,60.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-30.0,-10.0},{10.0,10.0}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{10.0,30.0},{30.0,50.0},{30.0,-50.0},{10.0,-30.0},{10.0,30.0}}),Line(visible=true, points={{-20.0,70.0},{-50.0,70.0}}),Line(visible=true, points={{-20.0,80.0},{-20.0,60.0}}),Line(visible=true, points={{20.0,80.0},{20.0,60.0}}),Line(visible=true, points={{20.0,70.0},{41.0,70.0}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10.0,30.0},{10.0,30.0},{30.0,50.0},{-30.0,50.0},{-10.0,30.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-10.0,50.0},{10.0,60.0}})}));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a axis annotation(Placement(visible=true, transformation(origin={0.0,70.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0), iconTransformation(origin={0.0,70.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b bearing annotation(Placement(visible=true, transformation(origin={-60.0,70.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-60.0,70.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
    equation 
      axis.phi=q;
      bearing.phi=0;
      qd=der(q) "define states";
      qdd=der(qd);
      nn=n/sqrt(n*n) "rotation matrix";
      qq=q - q0*pi/180;
      sinq=sin(qq);
      cosq=cos(qq);
      S_rel=[nn]*transpose([nn]) + (identity(3) - [nn]*transpose([nn]))*cosq - skew(nn)*sinq;
      r_rela=zeros(3) "other kinematic quantities";
      v_rela=zeros(3);
      a_rela=zeros(3);
      w_rela=nn*qd;
      z_rela=nn*qdd;
      Sb=Sa*transpose(S_rel);
      r0b=r0a;
      vb=S_rel*va;
      wb=S_rel*(wa + w_rela);
      ab=S_rel*aa;
      zb=S_rel*(za + z_rela + cross(wa, w_rela));
      fa=transpose(S_rel)*fb;
      ta=transpose(S_rel)*tb;
      axis.tau=nn*tb "d'Alemberts principle";
    end Revolute;

    model Prismatic "Prismatic joint (1 degree-of-freedom, used in spanning tree)"
      extends Interfaces.TreeJoint;
      parameter Real n[3]={1,0,0} "Axis of translation resolved in frame_a (= same as in frame_b)";
      parameter SI.Position q0=0 "Relative distance offset(see info)";
      parameter Boolean startValueFixed=false "true, if start values of q, qd are fixed";
      SI.Position q(final fixed=startValueFixed);
      SI.Velocity qd(final fixed=startValueFixed);
      SI.Acceleration qdd;
      SI.Position qq;
      Real nn[3];
      SI.Velocity vaux[3];
      annotation(Documentation(info="<HTML>

<p>
Joint where frame_b is translated around axis n which is fixed in frame_a.
The joint axis has an additional flange where it can be
driven with elements of the Modelica.Mechanics.Translational library.
The relative distance q [m] and the relative velocity qd [m] are
used as state variables.

<p>
The following parameters are used to define the joint:

<pre>
  n : Axis of translation resolved in frame_a (= same as in frame_b).
      n must not necessarily be a unit vector. E.g.,
         n = {0, 0, 1} or n = {1, 0, 1}
  q0: Relative distance offset in [m].
      (in the direction of n).
      If q=q0, frame_a and frame_b are identical.
  startValueFixed: true, if start values of q, qd are fixed.
</pre>

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{80.0,30.0},{90.0,70.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-90.0,-50.0},{-20.0,40.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-90.0,40.0},{-20.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-20.0,-30.0},{90.0,20.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-20.0,20.0},{90.0,30.0}}),Line(visible=true, points={{-20.0,-50.0},{-20.0,50.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-220.0,-130.0},{220.0,-70.0}}, textString="%name=%n", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-90.0,-50.0},{-20.0,40.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-90.0,40.0},{-20.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-20.0,-30.0},{90.0,20.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-20.0,20.0},{90.0,30.0}}),Line(visible=true, points={{-20.0,-50.0},{-20.0,50.0}}),Rectangle(visible=true, lineColor={160,160,160}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{80.0,70.0},{90.0,30.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{32.0,65.0},{47.0,80.0}}, textString="f", fontName="Arial"),Line(visible=true, points={{30.0,65.0},{60.0,65.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-10.0,68.0},{-20.0,65.0},{-10.0,62.0},{-10.0,68.0}}),Line(visible=true, points={{10.0,65.0},{-20.0,65.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-10.0,65.0},{5.0,80.0}}, textString="f", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{50.0,68.0},{60.0,65.0},{50.0,62.0},{50.0,68.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{50.0,58.0},{60.0,55.0},{50.0,52.0},{50.0,58.0}}),Line(visible=true, points={{-19.0,55.0},{51.0,55.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{5.0,44.0},{36.0,54.0}}, textString="q = axis.s", fontName="Arial")}));
      Modelica.Mechanics.Translational.Interfaces.Flange_a axis annotation(Placement(visible=true, transformation(origin={70.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={70.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
      Modelica.Mechanics.Translational.Interfaces.Flange_b bearing annotation(Placement(visible=true, transformation(origin={-30.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0), iconTransformation(origin={-30.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0)));
    equation 
      axis.s=q;
      bearing.s=0;
      qd=der(q) "define states";
      qdd=der(qd);
      nn=n/sqrt(n*n) "normalize axis vector";
      S_rel=identity(3) "kinematic quantities";
      qq=q - q0;
      r_rela=nn*qq;
      v_rela=nn*qd;
      a_rela=nn*qdd;
      w_rela=zeros(3);
      z_rela=zeros(3);
      Sb=Sa;
      r0b=r0a + Sa*r_rela;
      vaux=cross(wa, r_rela);
      vb=va + v_rela + vaux;
      wb=wa;
      ab=aa + a_rela + cross(za, r_rela) + cross(wa, vaux + 2*v_rela);
      zb=za;
      fa=fb;
      ta=tb + cross(r_rela, fa);
      axis.f=nn*fb "d'Alemberts principle";
    end Prismatic;

  end Joints;

  package Parts "Parts with and without mass for 3D mechanical components"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains the inertial system and elements
which have mass and inertia.

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

<p><b>Release Notes:</b></p>
<ul>
<li><i>April 5, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

<p><b>Copyright &copy; 2000-2002, DLR.</b>

<p><i>
The Modelica package is <b>free</b> software; it can be redistributed and/or
modified under the terms of the <b>Modelica license</b>, see the license
conditions and the accompanying <b>disclaimer</b> in the documentation of
package Modelica in file \"Modelica/package.mo\".
</i>

</HTML>
", revisions=""));
    model InertialSystem "Inertial system"
      parameter SI.Acceleration g=9.81 "Gravity constant";
      parameter Real ng[3]={0,-1,0} "Direction of gravity (gravity = g*ng)";
      parameter String label1="x" "Label of horizontal axis in icon";
      parameter String label2="y" "Label of vertical axis in icon";
      SI.Acceleration gravity[3] "Gravity acceleration vector";
      annotation(Documentation(info="<html>

<p>
An instance of this class defines a coordinate system: the inertial
frame. All parameter vectors and tensors (e.g. position vectors)
are given in the home position of the multibody system with respect
to the inertial frame.

<p>
One instance of class  InertialSystem <b>must</b> always be present for every
multibody model.

<p>
In order to identify the desired axes of the used inertial frame in
the icon, the labels of the two axes can be defined as string parameters.
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, origin={0.0,-0.0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-80.0},{90.0,70.0}}),Line(visible=true, points={{-80.0,-100.0},{-80.0,30.0}}, thickness=0.5),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-80.0,70.0},{-100.0,30.0},{-60.0,30.0},{-80.0,70.0},{-80.0,70.0}}),Line(visible=true, points={{-100.0,-80.0},{50.0,-80.0}}, thickness=0.5),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{90.0,-80.0},{50.0,-60.0},{50.0,-100.0},{90.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,80.0},{100.0,150.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-10.0,-70.0},{50.0,-10.0}}, textString="%label1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-60.0,0.0},{0.0,60.0}}, textString="%label2", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-80.0},{90.0,70.0}}),Line(visible=true, points={{-80.0,-100.0},{-80.0,30.0}}, thickness=0.5),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-80.0,70.0},{-100.0,30.0},{-60.0,30.0},{-80.0,70.0},{-80.0,70.0}}),Line(visible=true, points={{-100.0,-80.0},{50.0,-80.0}}, thickness=0.5),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{90.0,-80.0},{50.0,-60.0},{50.0,-100.0},{90.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,70.0},{100.0,110.0}}, textString="inertial system", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-10.0,-70.0},{50.0,-10.0}}, textString="%label1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-60.0,0.0},{0.0,60.0}}, textString="%label2", fontName="Arial")}));
      Interfaces.Frame_b frame_b annotation(Placement(visible=true, transformation(origin={105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0), iconTransformation(origin={105.0,0.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
    equation 
      gravity=g*ng;
      frame_b.S=identity(3);
      frame_b.r0=zeros(3);
      frame_b.v=zeros(3);
      frame_b.w=zeros(3);
      frame_b.a=-gravity;
      frame_b.z=zeros(3);
    end InertialSystem;

    model FrameTranslation "Fixed translation of frame_b with respect to frame_a"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0,0,0} "Vector from frame_a to frame_b resolved in frame_a";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90.0,0.0},{-90.0,-65.0}}, color={0,0,255}),Line(visible=true, points={{90.0,0.0},{90.0,-65.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-60.0},{80.0,-60.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{80.0,-55.0},{80.0,-65.0},{90.0,-60.0},{80.0,-55.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-22.0,-60.0},{16.0,-36.0}}, textString="r", fontName="Arial"),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-90.0,-5.0},{90.0,5.0}}),Line(visible=true, points={{69.0,29.0},{106.0,29.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}),Line(visible=true, points={{70.0,27.0},{70.0,59.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{92.0,33.0},{106.0,44.0}}, textString="x", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{51.0,54.0},{66.0,66.0}}, textString="y", fontName="Arial"),Line(visible=true, points={{-103.0,29.0},{-66.0,29.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}),Line(visible=true, points={{-102.0,27.0},{-102.0,59.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80.0,33.0},{-66.0,44.0}}, textString="x", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-121.0,54.0},{-106.0,66.0}}, textString="y", fontName="Arial")}), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, origin={8.0,0.0}, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-220.0,-100.0},{220.0,-40.0}}, textString="r=%r", fontName="Arial"),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-90.0,-5.0},{90.0,5.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,41.0},{100.0,101.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>

<p>
Fixed translation of frame_b with respect to frame_a, i.e.,
the frames of connectors a and b are parallel to each other.

<pre>
Parameters:
  r: Position vector from the origin of (connector) frame_a to the origin of
     (connector) frame_b, resolved in frame_a in [m].
</pre>

</html>", revisions=""));
    protected 
      SI.Velocity vaux[3];
      annotation(Documentation(info="
Fixed translation of frame_b with respect to frame_a, i.e.,
the frames of connectors a and b are parallel to each other.

Parameters:
  r: Position vector from the origin of (connector) frame_a to the origin of
     (connector) frame_b, resolved in frame_a in [m].
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-99,-100},{101,-40}}, textString="r=%r", fillColor={0,0,0}),Rectangle(extent={{-90,5},{90,-5}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-101,41},{99,101}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-90,0},{-90,-65}}),Line(color={0,0,255}, points={{90,0},{90,-65}}),Line(color={0,0,255}, points={{-90,-60},{80,-60}}),Polygon(lineColor={0,0,255}, points={{80,-55},{80,-65},{90,-60},{80,-55}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-22,-36},{16,-60}}, textString="r"),Rectangle(extent={{-90,5},{90,-5}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0}),Line(color={0,0,255}, points={{69,29},{106,29}}, arrow={Arrow.None,Arrow.Filled}),Line(color={0,0,255}, points={{70,27},{70,59}}, arrow={Arrow.None,Arrow.Filled}),Text(lineColor={0,0,255}, extent={{92,44},{106,33}}, textString="x"),Text(lineColor={0,0,255}, extent={{51,66},{66,54}}, textString="y"),Line(color={0,0,255}, points={{-103,29},{-66,29}}, arrow={Arrow.None,Arrow.Filled}),Line(color={0,0,255}, points={{-102,27},{-102,59}}, arrow={Arrow.None,Arrow.Filled}),Text(lineColor={0,0,255}, extent={{-80,44},{-66,33}}, textString="x"),Text(lineColor={0,0,255}, extent={{-121,66},{-106,54}}, textString="y")}));
    equation 
      Sb=Sa;
      wb=wa;
      zb=za;
      r0b=r0a + Sa*r;
      vaux=cross(wa, r);
      vb=va + vaux;
      ab=aa + cross(za, r) + cross(wa, vaux);
      fa=fb "Transform the force and torque acting at frame_b to frame_a";
      ta=tb + cross(r, fa);
    end FrameTranslation;

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
      annotation(Documentation(info="<html>

<p>
Rigid body with two frames. All the mass and inertia properties must be
supplied with respect to the center of mass. All parameter vectors
have to be resolved in frame_a in [m].

<pre>
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
</pre>

</html>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-15.0},{-50.0,15.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{50.0,-15.0},{90.0,15.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.Sphere, extent={{-50.0,-50.0},{50.0,50.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,60.0},{100.0,120.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-99.0,-100.0},{101.0,-60.0}}, textString="r=%r", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90.0,10.0},{-90.0,44.0}}, color={0,0,255}),Line(visible=true, points={{90.0,0.0},{90.0,44.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,40.0},{80.0,40.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{80.0,44.0},{80.0,36.0},{90.0,40.0},{80.0,44.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-22.0,40.0},{20.0,68.0}}, textString="r", fontName="Arial"),Line(visible=true, points={{-90.0,-10.0},{-90.0,-90.0}}, color={0,0,255}),Line(visible=true, points={{0.0,-46.0},{0.0,-90.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-84.0},{-10.0,-84.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-10.0,-80.0},{-10.0,-88.0},{0.0,-84.0},{-10.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-60.0,-82.0},{-34.0,-64.0}}, textString="rCM", fontName="Arial")}));
      FrameTranslation frameTranslation(r=r) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-40.0,-20.0},{40.0,20.0}}, rotation=0)));
      Interfaces.BodyBase body annotation(Placement(visible=true, transformation(origin={-0.6667,-46.6666}, extent={{-26.6666,-26.6666},{26.6666,26.6666}}, rotation=0)));
    equation 
      connect(frame_a,body.frame_a) annotation(Line(visible=true, points={{-105.0,0.0},{-60.0,0.0},{-60.0,-46.6666},{-28.6666,-46.6666}}, thickness=0.5));
      connect(frame_b,frameTranslation.frame_b) annotation(Line(visible=true, origin={73.5,0.0}, points={{31.5,0.0},{-31.5,0.0}}, thickness=0.5));
      connect(frame_a,frameTranslation.frame_a) annotation(Line(visible=true, origin={-73.5,0.0}, points={{-31.5,0.0},{31.5,0.0}}, thickness=0.5));
      body.m=m;
      body.rCM=rCM;
      body.I=[I11,I21,I31;I21,I22,I32;I31,I32,I33];
    end Body2;

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
      parameter SI.Position LengthDirection[3]=r - r0 "Vector in length direction, resolved in frame_a";
      parameter SI.Position WidthDirection[3]={0,1,0} "Vector in width direction, resolved in frame_a";
      parameter SI.Length Length=sqrt((r - r0)*(r - r0)) "Length of shape";
      parameter SI.Length Width=0.1 "Width of shape";
      parameter SI.Length Height=0.1 "Height of shape";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      parameter Real Extra=0.0 "Additional parameter for cone and pipe";
      annotation(Documentation(info="<html>

<p>
Rigid body with two cuts and an additional shape used in animation.
All the mass and inertia properties must be supplied with respect
to the center of mass. All parameter vectors are resolved in frame_a
in [m].

<pre>
Parameters:
  r[3]         : Position vector from the origin of frame_a to the origin of
                 frame_b.
  rCM[3]       : Position vector from the origin of frame_a to the center of
                 mass.
  m            : Mass of body in [kg].
  Ixy          : Elements (x,y) of the inertia tensor of the body with
                 respect to the center of mass, resolved in the inertial
                 frame in the home position in [kgm^2]. The following
                 elements can be defined: I11, I22, I33, I21, I31, I32.
                 (Move the inertial from into the center of mass by
                 translation and resolve the inertia tensor in this frame).
  Shape        : Type of visual shape. Predefined shapes are
                 Shape = \"box\"
                         \"sphere\"
                         \"cylinder\"
                         \"cone\"
                         \"pipe\"
                         \"beam\"
                         \"gearwheel\"
                         \"wirebox\"
                 External shapes are specified as DXF-files (only 3DFace is
                 supported). External shapes must be named \"1\", \"2\"  etc.           
                 The corresponding definitions should be in files \"1.dxf\",
                 \"2.dxf\" etc.Since the DXF-files contain color and
                 dimensions for the individual faces, the corresponding
                 information in the model is currently ignored, but the
                 specular coefficient is utilized. The DXF-files must be
                 found in the current directory.
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
                 reflection. What color that is reflected also depends on
                 the color of the light sources. Note, r g, b and specular
                 are given in the range 0 .. 1. Specular=1 gives a metallic
                 appearance.
  Extra        : Additional parameter for cone and pipe.
                 \"pipe\"     : A hollow cylinder. Extra = InnerRadius/Radius
                              of the cylinder.
                 \"gearwheel\": A ring with gear wheel teeth. Extra = number
                              of teeth.
</pre>

</html>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-15.0},{-50.0,15.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={191,95,0}, fillPattern=FillPattern.Solid, points={{-50.0,34.0},{-50.0,-60.0},{0.0,-40.0},{40.0,-60.0},{40.0,36.0},{0.0,12.0},{-50.0,34.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, points={{-50.0,34.0},{-30.0,46.0},{10.0,30.0},{60.0,62.0},{40.0,36.0},{0.0,12.0},{-50.0,34.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, points={{58.0,60.0},{40.0,36.0},{40.0,-60.0},{58.0,-36.0},{58.0,60.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{48.0,-15.0},{90.0,15.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-220.0,60.0},{220.0,120.0}}, textString="%name=%r", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,-60.0}}, textString="%Shape", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Body2 body(r=r, rCM=rCM, m=m, I11=I11, I22=I22, I33=I33, I21=I21, I31=I31, I32=I32) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
      Parts.Shape vis(Shape=Shape, r0=r0, LengthDirection=LengthDirection, WidthDirection=WidthDirection, Length=Length, Width=Width, Height=Height, Material=Material, Extra=Extra) annotation(Placement(visible=true, transformation(origin={1.0,-70.0}, extent={{-30.0,-30.0},{30.0,30.0}}, rotation=0)));
    equation 
      connect(vis.frame_a,frame_a) annotation(Line(visible=true, points={{-30.5,-70.0},{-70.0,-70.0},{-70.0,0.0},{-105.0,0.0}}, color={0,0,255}));
      connect(frame_b,body.frame_b) annotation(Line(visible=true, origin={73.5,0.0}, points={{31.5,0.0},{-31.5,0.0}}, color={0,0,255}));
      connect(frame_a,body.frame_a) annotation(Line(visible=true, origin={-73.5,0.0}, points={{-31.5,0.0},{31.5,0.0}}, color={0,0,255}));
    end ShapeBody;

    model Shape "General animation shape"
      extends Interfaces.OneFrame_a;
      parameter String Shape="box" "Name of shape (see info text)";
      parameter Real r0[3]={0,0,0} "Vector from frame_a to shape origin [m]";
      parameter Real LengthDirection[3]={1,0,0} "Vector in length direction";
      parameter Real WidthDirection[3]={0,1,0} "Vector in width direction";
      parameter Real Length=1 "Length of shape [m]";
      parameter Real Width=0.1 "Width of shape [m]";
      parameter Real Height=0.1 "Height of shape [m]";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      parameter Real Extra=0.0 "Additional parameter for cone and pipe";
      Real nLength[3];
      Real nWidth[3];
      Real nHeight[3];
      annotation(Documentation(info="<html>

<p>
A variety of shapes can be defined for animation.
Parameter vectors are defined with respect to frame_a in [m].

<pre>
Parameters:
  Shape        : Type of visual shape. Predefined shapes are
                 Shape = \"box\"
                         \"sphere\"
                         \"cylinder\"
                         \"cone\"
                         \"pipe\"
                         \"beam\"
                         \"gearwheel\"
                         \"wirebox\"
                 External shapes are specified as DXF-files (only 3DFace is
                 supported). External shapes must be named \"1\", \"2\"  etc.
                 The corresponding definitions should be in files \"1.dxf\",
                 \"2.dxf\" etc.Since the DXF-files contain color and
                 dimensions for the individual faces, the corresponding
                 information in the model is currently ignored, but the
                 specular coefficient is utilized. The DXF-files must be
                 found in the current directory.
  r0[3]        : Position vector from the origin of frame_a to the origin
                 of the visual object.
  LengthDirection[3]: Unit vector in direction of length (will be normalized).
  WidthDirection[3] : Unit vector in direction of width (will be normalized).
  Length       : Length of visual shape in [m].
  Width        : Width of visual shape in [m].
  Height       : Height of visual shape in direction of a vector which is
                 orthogonal to  LengthDirection  and  WidthDirection .
  Material[4]  : = {r, g, b, specular} specifies the color of the shape.
                 [r,g,b] affects the color of diffuse and ambient reflected
                 light. Specular is a coefficient defining white specular
                 reflection. What color that is reflected also depends on
                 the color of the light sources. Note, r g, b and specular                         
                 are given in the range 0 .. 1. Specular=1 gives a metallic
                 appearance.
  Extra        : Additional parameter for cone and pipe.
                 \"pipe\"     : A hollow cylinder. Extra = InnerRadius/Radius
                              of the cylinder.
                 \"gearwheel\": A ring with gear wheel teeth. Extra = number
                              of teeth.
</pre>

<p>
In the class, the unit vectors in direction of the shape axes are computed
and are provided as terminal variables to be used in the calling object:

<pre>
  nLength(3)   : Unit vector in direction of  AxisLength .
  nWidth (3)   : Unit vector orthogonal to  nLength .
  nHeight(3)   : Unit vector orthogonal to  nLength  and  nWidth.
</pre>

</html>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,255,255}, fillColor={191,95,0}, fillPattern=FillPattern.Solid, points={{-90.0,34.0},{-90.0,-60.0},{0.0,-40.0},{60.0,-60.0},{60.0,34.0},{0.0,12.0},{-90.0,34.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-88.0,34.0},{-54.0,46.0},{10.0,30.0},{84.0,56.0},{60.0,32.0},{0.0,12.0},{-88.0,34.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{82.0,54.0},{60.0,32.0},{60.0,-60.0},{82.0,-32.0},{82.0,54.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,60.0},{100.0,120.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,-60.0}}, textString="%Shape", fontName="Arial")}));
      VisualShape vis(Shape=Shape, r0=r0, LengthDirection=LengthDirection, WidthDirection=WidthDirection, Length=Length, Width=Width, Height=Height, Material=Material, Extra=Extra) annotation(extent=[-40,-20;20,40]);
    equation 
      vis.S=Sa;
      vis.r=r0a;
      vis.nLength=nLength;
      vis.nWidth=nWidth;
      vis.nHeight=nHeight;
      fa=zeros(3) "No forces and torques";
      ta=zeros(3);
    end Shape;

  end Parts;

end MultiBody;
model MCVisualShape
  import SI = Modelica.SIunits;
  parameter String shapeType="box" "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring)";
  input SI.Position r[3]={0.0,0.0,0.0} "Position vector from origin of world frame to origin of object frame, resolved in world frame";
  input SI.Position r_shape[3]={0.0,0.0,0.0} "Position vector from origin of object frame to shape origin, resolved in object frame";
  input Real lengthDirection[3]={1.0,0.0,0.0} "Vector in length direction, resolved in object frame";
  input Real widthDirection[3]={0.0,1.0,0.0} "Vector in width direction, resolved in object frame";
  input SI.Length length=0 "Length of visual object";
  input SI.Length width=0 "Width of visual object";
  input SI.Length height=0 "Height of visual object";
  input Real extra=0.0 "Additional size data for some of the shape types";
  input Real color[3]={255.0,0.0,0.0} "Color of shape";
  input Real specularCoefficient=0.7;
  input Real S[3,3] "3 x 3 transformation matrix.";
  Real Sshape[3,3] "local 3 x 3 transformation matrix.";
  output Real rxvisobj[3] "x-axis unit vector of shape, resolved in world frame";
  output Real ryvisobj[3] "y-axis unit vector of shape, resolved in world frame";
  output SI.Position rvisobj[3] "position vector from world frame to shape frame, resolved in world frame";
  Real abs_n_x=sqrt(lengthDirection*lengthDirection);
  Real e_x[3]=noEvent(if abs_n_x < 1e-10 then {1.0,0.0,0.0} else lengthDirection/abs_n_x);
  Real n_z_aux[3]=cross(e_x, widthDirection);
  Real e_y[3]=noEvent(cross(local_normalize(cross(e_x, if n_z_aux*n_z_aux > 1e-06 then widthDirection else if abs(e_x[1]) > 1e-06 then {0,1,0} else {1,0,0})), e_x));
  Real e_z[3]=cross(e_x, e_y);
protected 
  function local_normalize
    input Real iv[3];
    output Real ov[3];
    Real length;
  algorithm 
    length:=sqrt(iv*iv);
    ov:=iv/length;
  end local_normalize;

protected 
  output Real Form;
  output SI.Length size[3] "{length,width,height} of shape";
  output Real Material;
  output Real Extra;
equation 
  Form=(987000 + PackShape(shapeType))*1e+20;
  Material=PackMaterial(color[1]/255.0, color[2]/255.0, color[3]/255.0, specularCoefficient);
  Extra=extra;
  size={length,width,height};
  Sshape=[e_x,e_y,cross(e_x, e_y)];
  rxvisobj=S*e_x;
  ryvisobj=S*e_y;
  rvisobj=r + S*r_shape;
end MCVisualShape;
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

  elseif shape == "spring" then
    packedShape:=111.0;
  else
    packedShape:=200;
  end if;
end PackShape;
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
model VisualShape
  parameter Real r0[3]={0.0,0.0,0.0} "Origin of visual object.";
  parameter Real Length=1 "Length of visual object.";
  parameter Real Width=1 "Width of visual object.";
  parameter Real Height=1 "Height of visual object.";
  parameter Real LengthDirection[3]={1.0,0.0,0.0} "Vector in length direction.";
  parameter Real WidthDirection[3]={0.0,1.0,0.0} "Vector in width direction.";
  parameter String Shape="box" "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring)";
  parameter Real Material[4]={1.0,0.0,0.0,0.5} "Color and specular coefficient.";
  parameter Real Extra=0.0 "Additional size data for some of the shape types";
  input Real S[3,3] "3 x 3 transformation matrix.";
  Real Sshape[3,3] "local 3 x 3 transformation matrix.";
  input Real r[3] "Position of visual object.";
  Real nLength[3];
  Real nWidth[3];
  Real nHeight[3];
  MCVisualShape mcShape(r=r, r_shape=r0, S=S, Sshape=Sshape, color=255*Material[1:3], specularCoefficient=Material[4], length=Length, width=Width, height=Height, lengthDirection=LengthDirection, widthDirection=WidthDirection, shapeType=Shape, extra=Extra);
equation 
  mcShape.e_x=nLength;
  mcShape.e_y=nWidth;
  mcShape.e_z=nHeight;
end VisualShape;
model MultiBody_Examples_Loops_Engine1
  extends MultiBody.Examples.Loops.Engine1;
end MultiBody_Examples_Loops_Engine1;
