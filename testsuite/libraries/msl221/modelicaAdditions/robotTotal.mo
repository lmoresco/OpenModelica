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
    package Rotational "Library to model 1-dimensional, rotational mechanical systems"
      package Sensors "Sensors to measure variables in 1D rotational mechanical components"
        model AngleSensor "Ideal sensor to measure the absolute flange angle"
          extends Modelica.Icons.RotationalSensor;
          annotation(Documentation(info="<html>
<p>
Measures the <b>absolute angle phi</b> of a flange in an ideal
way and provides the result as output signal <b>phi</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{70,-70},{120,-30}}, textString="phi", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
          Interfaces.Flange_a flange_a "flange to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Modelica.Blocks.Interfaces.RealOutput phi(redeclare type SignalType= SI.Angle ) "Absolute angle of flange" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          phi=flange_a.phi;
          0=flange_a.tau;
        end AngleSensor;

        model SpeedSensor "Ideal sensor to measure the absolute flange angular velocity"
          extends Modelica.Icons.RotationalSensor;
          annotation(Documentation(info="<html>
<p>
Measures the <b>absolute angular velocity w</b> of a flange in an ideal
way and provides the result as output signal <b>w</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{70,-70},{120,-30}}, textString="w", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
          Interfaces.Flange_a flange_a "flange to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Modelica.Blocks.Interfaces.RealOutput w(redeclare type SignalType= SI.AngularVelocity ) "Absolute angular velocity of flange" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          w=der(flange_a.phi);
          0=flange_a.tau;
        end SpeedSensor;

        extends Modelica.Icons.Library2;
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-56,-61},{-56,-81}}),Line(visible=true, points={{-36,-61},{-36,-81}}),Line(visible=true, points={{-16,-61},{-16,-81}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-76,-81},{64,-1}}),Line(visible=true, points={{4,-61},{4,-81}}),Line(visible=true, points={{24,-61},{24,-81}}),Line(visible=true, points={{44,-61},{44,-81}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-6,-61},{-16,-37},{4,-37},{-6,-61}}),Line(visible=true, points={{-6,-21},{-6,-37}}),Line(visible=true, points={{-76,-21},{-6,-21}}),Line(visible=true, points={{-56,-61},{-56,-81}}),Line(visible=true, points={{-36,-61},{-36,-81}}),Line(visible=true, points={{-16,-61},{-16,-81}})}), Documentation(info="<html>
<p>
This package contains ideal sensor components that provide
the connector variables as signals for further processing with the
Modelica.Blocks library.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end Sensors;

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

        partial model Compliant "Base class for the compliant connection of two rotational 1D flanges"
          SI.Angle phi_rel(start=0) "Relative rotation angle (= flange_b.phi - flange_a.phi)";
          SI.Torque tau "Torque between flanges (= flange_b.tau)";
          annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with a compliant connection of two
rotational 1D flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-torques
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.tau + flange_b.tau = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          phi_rel=flange_b.phi - flange_a.phi;
          flange_b.tau=tau;
          flange_a.tau=-tau;
        end Compliant;

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

      model IdealGear "Ideal gear without inertia"
        extends Interfaces.TwoFlangesAndBearing;
        parameter Real ratio=1 "Transmission ratio (flange_a.phi/flange_b.phi)";
        annotation(Documentation(info="<html>
<p>
This element characterices any type of gear box which is fixed in the
ground and which has one driving shaft and one driven shaft.
The gear is <b>ideal</b>, i.e., it does not have inertia, elasticity, damping
or backlash. If these effects have to be considered, the gear has to be
connected to other elements in an appropriate way.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-40,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{96,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Line(visible=true, points={{-90,-80},{-20,-80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{0,-80},{-20,-75},{-20,-85},{0,-80}}),Text(visible=true, fillColor={128,128,128}, extent={{34,-86},{34,-72}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{70,-20},{70,-70}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-40,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,140},{150,180}}, textString="%name=%ratio", fontName="Arial"),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{70,-20},{70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}})}));
      equation 
        phi_a=ratio*phi_b;
        0=ratio*flange_a.tau + flange_b.tau;
      end IdealGear;

      model SpringDamper "Linear 1D rotational spring and damper in parallel"
        import SI = Modelica.SIunits;
        import Modelica.Mechanics.Rotational.Types.InitRel;
        import Modelica.Blocks.Types.StateSelection;
        parameter Real c(final unit="N.m/rad", final min=0) "Spring constant";
        parameter SI.Angle phi_rel0=0 "Unstretched spring angle";
        parameter Real d(final unit="N.m.s/rad", final min=0)=0 "Damping constant";
        parameter InitRel.Temp initType=Modelica.Mechanics.Rotational.Types.InitRel.NoInit "Type of initialization (defines usage of start values below)" annotation(Dialog(group="Initialization"));
        parameter SI.Angle phi_rel_start=0 "Initial or guess value of relative rotation angle phi_rel" annotation(Dialog(group="Initialization"), Evaluate=false);
        parameter SI.AngularVelocity w_rel_start=0 "Initial or guess value of relative angular velocity w_rel = der(phi_rel)" annotation(Dialog(group="Initialization"), Evaluate=false);
        parameter StateSelection.Temp stateSelection=Modelica.Blocks.Types.StateSelection.Default "Priority to use phi_rel and w_rel as states" annotation(Dialog(tab="Advanced"));
        extends Interfaces.Compliant(phi_rel(start=phi_rel_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always));
        SI.AngularVelocity w_rel(start=w_rel_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always) "Relative angular velocity between flange_b and flange_a";
        annotation(Documentation(info="<html>
<p>
A <b>spring</b> and <b>damper</b> element <b>connected in parallel</b>.
The component can be
connected either between two inertias/gears to describe the shaft elasticity
and damping, or between an inertia/gear and the housing (component Fixed),
to describe a coupling of the element with the housing via a spring/damper.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,32},{-58,32},{-43,2},{-13,62},{17,2},{47,62},{62,32},{80,32}}, thickness=0.5),Line(visible=true, points={{-68,32},{-68,97}}, color={128,128,128}),Line(visible=true, points={{72,32},{72,97}}, color={128,128,128}),Line(visible=true, points={{-68,92},{72,92}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{62,95},{72,92},{62,89},{62,95}}),Text(visible=true, fillColor={0,0,255}, extent={{-20,72},{20,97}}, textString="phi_rel", fontName="Arial"),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-52,-80},{38,-20}}),Line(visible=true, points={{-52,-80},{68,-80}}),Line(visible=true, points={{-52,-20},{68,-20}}),Line(visible=true, points={{38,-50},{80,-50}}),Line(visible=true, points={{-80,-50},{-52,-50}}),Line(visible=true, points={{-80,32},{-80,-50}}),Line(visible=true, points={{80,32},{80,-50}}),Line(visible=true, points={{-96,0},{-80,0}}),Line(visible=true, points={{96,0},{80,0}}),Text(visible=true, fillColor={128,128,128}, extent={{15,-100},{83,-87}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{11,-94},{-9,-89},{-9,-99},{11,-94}}),Line(visible=true, points={{-79,-94},{-8,-94}}, color={128,128,128})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,40},{-60,40},{-45,10},{-15,70},{15,10},{45,70},{60,40},{80,40}}),Line(visible=true, points={{-80,40},{-80,-70}}),Line(visible=true, points={{-80,-70},{-52,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-52,-100},{38,-40}}),Line(visible=true, points={{-52,-40},{68,-40}}),Line(visible=true, points={{-52,-100},{68,-100}}),Line(visible=true, points={{38,-70},{80,-70}}),Line(visible=true, points={{80,40},{80,-70}}),Line(visible=true, points={{-90,0},{-80,0}}),Line(visible=true, points={{80,0},{90,0}}),Text(visible=true, extent={{-101,-147},{98,-107}}, textString="d=%d", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,70},{150,110}}, textString="%name=%c", fontName="Arial")}));
      initial equation 
        if initType == InitRel.SteadyState then
          der(phi_rel)=0;
          der(w_rel)=0;
        elseif initType == InitRel.InitialState then
          phi_rel=phi_rel_start;
          w_rel=w_rel_start;
        elseif initType == InitRel.InitialAngle then
          phi_rel=phi_rel_start;
        elseif initType == InitRel.InitialSpeed then
          w_rel=w_rel_start;
        else
        end if;
      equation 
        w_rel=der(phi_rel);
        tau=c*(phi_rel - phi_rel0) + d*w_rel;
      end SpringDamper;

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

      model RelativeStates "Definition of relative state variables"
        extends Interfaces.TwoFlanges;
        SI.Angle phi_rel(stateSelect=StateSelect.prefer) "relative rotation angle used as state variable";
        SI.AngularVelocity w_rel(stateSelect=StateSelect.prefer) "relative angular velocity used as state variable";
        SI.AngularAcceleration a_rel "relative angular acceleration";
        annotation(Documentation(info="<html>
<p>
Usually, the absolute angle and the absolute angular velocity of
Modelica.Mechanics.Rotational.Inertia models are used as state variables.
In some circumstances, relative quantities are better suited, e.g.,
because it may be easier to supply initial values.
In such cases, model <b>RelativeStates</b> allows the definition of state variables
in the following way:
</p>
<ul>
<li> Connect an instance of this model between two flange connectors.</li>
<li> The <b>relative rotation angle</b> and the <b>relative angular velocity</b>
     between the two connectors are used as <b>state variables</b>.
</ul>
<p>
An example is given in the next figure
</p>
<IMG SRC=\"../Images/relativeStates.png\" ALT=\"relativeStates\">
<p>
Here, the relative angle and the relative angular velocity between
the two inertias are used as state variables. Additionally, the
simulator selects either the absolute angle and absolute angular
velocity of model inertia1 or of model inertia2 as state variables.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,255,255}, fillColor={0,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,-40},{40,40}}, textString="S", fontName="Arial"),Line(visible=true, points={{40,0},{96,0}}, pattern=LinePattern.Dash),Line(visible=true, points={{-100,-10},{-100,-80}}, color={160,160,160}),Line(visible=true, points={{100,-10},{100,-80}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{80,-65},{80,-55},{100,-60},{80,-65}}),Line(visible=true, points={{-100,-60},{80,-60}}, color={160,160,160}),Text(visible=true, extent={{-30,-90},{30,-70}}, textString="w_rel", fontName="Arial"),Line(visible=true, points={{-76,80},{-5,80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{14,80},{-6,85},{-6,75},{14,80}}),Text(visible=true, fillColor={128,128,128}, extent={{18,74},{86,87}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-96,0},{-40,0}}, pattern=LinePattern.Dash)}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,255,255}, fillColor={0,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,-40},{40,40}}, textString="S", fontName="Arial"),Line(visible=true, points={{-92,0},{-42,0}}, pattern=LinePattern.Dot),Line(visible=true, points={{40,0},{90,0}}, pattern=LinePattern.Dot),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-80},{150,-40}}, textString="%name", fontName="Arial")}));
      equation 
        phi_rel=flange_b.phi - flange_a.phi;
        w_rel=der(phi_rel);
        a_rel=der(w_rel);
        flange_a.tau=0;
        flange_b.tau=0;
      end RelativeStates;

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

        package InitRel "Type, constants and menu choices to define initialization of relative rotational quantities"
          extends Modelica.Icons.Enumeration;
          constant Integer NoInit=1 "no initialization (phi_rel_start, w_rel_start are guess values)";
          constant Integer SteadyState=2 "steady state initialization (der(phi_rel)=der(w_rel)=0)";
          constant Integer InitialState=3 "initialization with phi_rel_start, w_rel_start";
          constant Integer InitialAngle=4 "initialization with phi_rel_start";
          constant Integer InitialSpeed=5 "initialization with w_rel_start";
          type Temp "Temporary type of absolute initialization with choices for menus (until enumerations are available)"
            extends Modelica.Icons.TypeInteger(min=1, max=5);
            annotation(Evaluate=true, choices(choice=Modelica.Mechanics.Rotational.Types.Init.NoInit "no initialization (phi_rel_start, w_rel_start are guess values)", choice=Modelica.Mechanics.Rotational.Types.Init.SteadyState "steady state initialization (der(phi)=der(w)=0)", choice=Modelica.Mechanics.Rotational.Types.Init.InitialState "initialization with phi_rel_start, w_rel_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngle "initialization with phi_rel_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeed "initialization with w_rel_start"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          end Temp;

          annotation(Documentation(info="<html>
<p>
Type <b>Init</b> defines initialization of relative rotational
quantities.
</p>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end InitRel;

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

  package Electrical "Library for electrical models (analog, digital, machines, multi-phase)"
    extends Modelica.Icons.Library2;
    annotation(preferedView="info", Documentation(info="<html>
<p>
This library contains electrical components to build up analog and digital circuits,
as well as machines to model electrical motors and generators,
especially three phase induction machines such as an asynchronous motor.
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-29,-27},{3,-13}}),Line(visible=true, points={{37,-58},{62,-58}}),Line(visible=true, points={{36,-49},{61,-49}}),Line(visible=true, points={{-78,-50},{-43,-50}}),Line(visible=true, points={{-67,-55},{-55,-55}}),Line(visible=true, points={{-61,-50},{-61,-20},{-29,-20}}),Line(visible=true, points={{3,-20},{48,-20},{48,-49}}),Line(visible=true, points={{48,-58},{48,-78},{-61,-78},{-61,-55}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        model SignalVoltage "Generic voltage source using the input signal as source voltage"
          SI.Current i "Current flowing from pin p to pin n";
          annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-96,0},{-50,0}}),Line(visible=true, points={{50,0},{96,0}}),Line(visible=true, points={{-50,0},{50,0}}),Line(visible=true, points={{-109,20},{-84,20}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-94,23},{-84,20},{-94,17},{-94,23}}),Line(visible=true, points={{91,20},{116,20}}, color={160,160,160}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-109,25},{-89,45}}, textString="i", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{106,23},{116,20},{106,17},{106,23}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{91,25},{111,45}}, textString="i", fontName="Arial"),Line(visible=true, points={{-119,-5},{-119,5}}, color={160,160,160}),Line(visible=true, points={{-124,0},{-114,0}}, color={160,160,160}),Line(visible=true, points={{116,0},{126,0}}, color={160,160,160})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-90,0},{-50,0}}),Line(visible=true, points={{50,0},{90,0}}),Line(visible=true, points={{-50,0},{50,0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-120},{100,-80}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-120,0},{-20,50}}, textString="+", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{20,0},{120,50}}, textString="-", fontName="Arial")}));
          Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Interfaces.NegativePin n annotation(Placement(visible=true, transformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
          Modelica.Blocks.Interfaces.RealInput v(redeclare type SignalType= SI.Voltage ) "Voltage between pin p and n (= p.v - n.v) as input signal" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
        equation 
          v=p.v - n.v;
          0=p.i + n.i;
          i=p.i;
        end SignalVoltage;

      end Sources;

      package Sensors "Potential, voltage, current, and power sensors"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains potential, voltage, and current sensors.
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        model CurrentSensor "Sensor to measure the current in a branch"
          extends Modelica.Icons.RotationalSensor;
          annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{96,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="A", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255})}));
          Interfaces.PositivePin p "positive pin" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Interfaces.NegativePin n "negative pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Modelica.Blocks.Interfaces.RealOutput i(redeclare type SignalType= SI.Current ) "current in the branch from p to n as output signal" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90)));
        equation 
          p.v=n.v;
          p.i=i;
          n.i=-i;
        end CurrentSensor;

      end Sensors;

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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        connector Pin "Pin of an electrical component"
          SI.Voltage v "Potential at the pin";
          flow SI.Current i "Current flowing into the pin";
          annotation(defaultComponentName="pin", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}})}), Documentation(revisions="<html>
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, fillColor={0,0,255}, extent={{-160,50},{40,110}}, textString="%name", fontName="Arial")}));
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, fillColor={0,0,255}, extent={{-40,50},{160,110}}, textString="%name", fontName="Arial")}));
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-110,20},{-85,20}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-95,23},{-85,20},{-95,17},{-95,23}}),Line(visible=true, points={{90,20},{115,20}}, color={160,160,160}),Line(visible=true, points={{-125,0},{-115,0}}, color={160,160,160}),Line(visible=true, points={{-120,-5},{-120,5}}, color={160,160,160}),Text(visible=true, fillColor={160,160,160}, extent={{-110,25},{-90,45}}, textString="i", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{105,23},{115,20},{105,17},{105,23}}),Line(visible=true, points={{115,0},{125,0}}, color={160,160,160}),Text(visible=true, fillColor={160,160,160}, extent={{90,25},{110,45}}, textString="i", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          PositivePin p "Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          NegativePin n "Negative pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
        equation 
          v=p.v - n.v;
          0=p.i + n.i;
          i=p.i;
        end OnePort;

      end Interfaces;

      package Ideal "Ideal electrical elements such as switches, diode, transformer, operational amplifier"
        extends Modelica.Icons.Library;
        annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains electrical components with idealized behaviour:
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        model IdealOpAmp "Ideal operational amplifier (norator-nullator pair)"
          SI.Voltage v1 "Voltage drop over the left port";
          SI.Voltage v2 "Voltage drop over the right port";
          SI.Current i1 "Current flowing from pos. to neg. pin of the left port";
          SI.Current i2 "Current flowing from pos. to neg. pin of the right port";
          annotation(Documentation(info="<html>
<P>
The ideal OpAmp is a two-port. The left port is fixed to <i>v1=0</i> and <i>i1=0</i>
(nullator). At the right port both any voltage <i>v2</i> and any current <i>i2</i>
are possible (norator).
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-96,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{0,-35},{0,-96}}, color={0,0,255}),Line(visible=true, points={{-55,50},{-45,50}}, color={0,0,255}),Line(visible=true, points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(visible=true, points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,-39},{-90,-19}}, textString="p1.i=0", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{120,3},{110,0},{120,-3},{120,3}}),Line(visible=true, points={{111,0},{136,0}}, color={160,160,160}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{118,2},{135,17}}, textString="i2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,60},{-90,80}}, textString="n1.i=0", fontName="Arial"),Line(visible=true, points={{18,-111},{18,-86}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{21,-101},{18,-111},{15,-101},{21,-101}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{22,-100},{39,-85}}, textString="i2", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,80},{100,100}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-90,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,-35},{0,-91}}, color={0,0,255}),Line(visible=true, points={{-48,32},{-28,32}}, color={0,0,255}),Line(visible=true, points={{-39,-20},{-39,-41}}, color={0,0,255}),Line(visible=true, points={{-50,-31},{-28,-31}}, color={0,0,255})}));
          Interfaces.PositivePin p1 "Positive pin of the left port" annotation(Placement(visible=true, transformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
          Interfaces.NegativePin n1 "Negative pin of the left port" annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
          Interfaces.PositivePin p2 "Positive pin of the right port" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
          Interfaces.NegativePin n2 "Negative pin of the right port" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=90), iconTransformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=90)));
        equation 
          v1=p1.v - n1.v;
          v2=p2.v - n2.v;
          0=p1.i + n1.i;
          0=p2.i + n2.i;
          i1=p1.i;
          i2=p2.i;
          v1=0;
          i1=0;
        end IdealOpAmp;

      end Ideal;

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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-60,50},{60,50}}, color={0,0,255}),Line(visible=true, points={{-40,30},{40,30}}, color={0,0,255}),Line(visible=true, points={{-20,10},{20,10}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,50}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, extent={{-144,-60},{138,0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-60,50},{60,50}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-40,30},{40,30}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-20,10},{20,10}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{0,96},{0,50}}, color={0,0,255}, thickness=0.5),Text(visible=true, extent={{-24,-38},{22,-6}}, textString="p.v=0", fontName="Arial")}));
          Interfaces.Pin p annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,10},{10,-10}}, rotation=90), iconTransformation(origin={0,100}, extent={{-10,10},{10,-10}}, rotation=90)));
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-30},{70,30}}),Line(visible=true, points={{-90,0},{-70,0}}, color={0,0,255}),Line(visible=true, points={{70,0},{90,0}}, color={0,0,255}),Text(visible=true, extent={{-144,-100},{144,-60}}, textString="R=%R", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-144,40},{144,100}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-70,-30},{70,30}}),Line(visible=true, points={{-96,0},{-70,0}}, color={0,0,255}),Line(visible=true, points={{70,0},{96,0}}, color={0,0,255})}));
        equation 
          R*i=v;
        end Resistor;

        model Capacitor "Ideal linear electrical capacitor"
          extends Interfaces.OnePort;
          parameter SI.Capacitance C=1 "Capacitance";
          annotation(Documentation(info="<HTML>
<p>
The linear capacitor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by <i>i = C * dv/dt</i>.
The Capacitance <i>C</i> is allowed to be positive, zero, or negative.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-14,28},{-14,-28}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{14,28},{14,-28}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-90,0},{-14,0}}, color={0,0,255}),Line(visible=true, points={{14,0},{90,0}}, color={0,0,255}),Text(visible=true, extent={{-136,-100},{136,-60}}, textString="C=%C", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-142,40},{140,100}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-20,40},{-20,-40}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{20,40},{20,-40}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-96,0},{-20,0}}, color={0,0,255}),Line(visible=true, points={{20,0},{96,0}}, color={0,0,255})}));
        equation 
          i=C*der(v);
        end Capacitor;

        model Inductor "Ideal linear electrical inductor"
          extends Interfaces.OnePort;
          parameter SI.Inductance L=1 "Inductance";
          annotation(Documentation(info="<HTML>
<P>
The linear inductor connects the branch voltage <i>v</i> with the
branch current <i>i</i> by  <i>v = L * di/dt</i>.
The Inductance <i>L</i> is allowed to be positive, zero, or negative.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-15},{-30,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30,-15},{0,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{0,-15},{30,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{30,-15},{60,15}}, endAngle=180),Line(visible=true, points={{60,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{-96,0},{-60,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-15},{-30,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30,-15},{0,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{0,-15},{30,15}}, endAngle=180),Ellipse(visible=true, lineColor={0,0,255}, extent={{30,-15},{60,15}}, endAngle=180),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-90,0},{-60,0}}, color={0,0,255}),Text(visible=true, extent={{-138,-102},{144,-60}}, textString="L=%L", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-146,38},{148,100}}, textString="%name", fontName="Arial")}));
        equation 
          L*der(i)=v;
        end Inductor;

        model EMF "Electromotoric force (electric/mechanic transformer)"
          parameter Real k(final unit="N.m/A")=1 "Transformation coefficient";
          SI.Voltage v "Voltage drop between the two pins";
          SI.Current i "Current flowing from positive to negative pin";
          SI.AngularVelocity w "Angular velocity of flange_b";
          annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,90},{0,40}}, color={0,0,255}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{100,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Line(visible=true, points={{0,-90},{0,-40}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, extent={{20,-100},{100,-40}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{30,40},{119,100}}, textString="k=%k", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-17,95},{-20,85},{-23,95},{-17,95}}),Line(visible=true, points={{-20,110},{-20,85}}, color={160,160,160}),Text(visible=true, fillColor={160,160,160}, extent={{-40,90},{-30,110}}, textString="i", fontName="Arial"),Line(visible=true, points={{9,75},{19,75}}, color={192,192,192}),Line(visible=true, points={{0,96},{0,40}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-40,-40},{40,40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{96,10}}),Line(visible=true, points={{-20,-110},{-20,-85}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-17,-100},{-20,-110},{-23,-100},{-17,-100}}),Text(visible=true, fillColor={160,160,160}, extent={{-40,-110},{-30,-90}}, textString="i", fontName="Arial"),Line(visible=true, points={{8,-79},{18,-79}}, color={192,192,192}),Line(visible=true, points={{0,-96},{0,-40}}, color={0,0,255}),Line(visible=true, points={{14,80},{14,70}}, color={192,192,192}),Line(visible=true, points={{140,0},{110,0}}),Text(visible=true, extent={{114,-14},{148,-4}}, textString="flange_b.phi", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{140,3},{150,0},{140,-3},{140,3},{140,3}}),Text(visible=true, extent={{112,6},{148,16}}, textString="flange_b.tau", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{120,35},{100,40},{100,30},{120,35}}),Line(visible=true, points={{30,35},{101,35}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{37,46},{105,59}}, textString="rotation axis", fontName="Arial")}), Documentation(info="<HTML>
<p>
EMF transforms electrical energy into rotational mechanical energy.
It is used as basic building block of an electrical motor. The mechanical
connector flange_b can be connected to elements of the
Modelica.Mechanics.Rotational library. flange_b.tau is the cut-torque,
flange_b.phi is the angle at the rotational connection.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"));
          Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
          Interfaces.NegativePin n annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=-90)));
          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        equation 
          v=p.v - n.v;
          0=p.i + n.i;
          i=p.i;
          w=der(flange_b.phi);
          k*w=v;
          flange_b.tau=-k*i;
        end EMF;

      end Basic;

    end Analog;

  end Electrical;

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
      package Extrapolation "Type, constants and menu choices to define the extrapolation of time table interpolation"
        annotation(Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        extends Modelica.Icons.Enumeration;
        constant Integer HoldLastPoint=0 "Hold the last table point outside of the table scope";
        constant Integer LastTwoPoints=1 "Extrapolate linearly through the last two table points outside of the table scope";
        constant Integer Periodic=2 "Repeat the table scope periodically";
        type Temp "Temporary type of Extrapolation with choices for menus (until enumerations are available)"
          extends Modelica.Icons.TypeInteger;
          annotation(choices(choice=Modelica.Blocks.Types.Extrapolation.HoldLastPoint "hold last point (constant extrapolation)", choice=Modelica.Blocks.Types.Extrapolation.LastTwoPoints "last two points (linear extrapolation)", choice=Modelica.Blocks.Types.Extrapolation.Periodic "periodic (repeat table)"), Documentation(info="<html>
<p>
Type of extrapolation in a table.
</p>
 
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>choice</b></td>
      <td><b>Meaning of choice</b></td>
  </tr>
 
  <tr><td>HoldLastPoint</td>
      <td>Hold the last table point outside of the table scope</td>
  </tr>
  <tr><td>LastTwoPoints</td>
      <td>Extrapolate linearly through the last two table points
          outside of the table scope</td>
  </tr>
  <tr><td>Periodic</td>
      <td>Repeat the table scope periodically</td>
  </tr>
</table>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end Temp;

      end Extrapolation;

      package Init "Type, constants and menu choices to define initialization of blocks"
        annotation(Documentation(info="<html>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        extends Modelica.Icons.Enumeration;
        constant Integer NoInit=1 "no initialization (start values are used as guess values with fixed=false)";
        constant Integer SteadyState=2 "steady state initialization (derivatives of states are zero)";
        constant Integer InitialState=3 "initialization with initial states";
        constant Integer InitialOutput=4 "initialization with initial outputs (and steady state of the states if possibles)";
        type Temp "Temporary type of initialization with choices for menus (until enumerations are available)"
          extends Modelica.Icons.TypeInteger(min=1, max=4);
          annotation(Evaluate=true, choices(choice=Modelica.Blocks.Types.Init.NoInit "no initialization (start values are used as guess values with fixed=false)", choice=Modelica.Blocks.Types.Init.SteadyState "steady state initialization (derivatives of states are zero)", choice=Modelica.Blocks.Types.Init.InitialState "initialization with initial states", choice=Modelica.Blocks.Types.Init.InitialOutput "initialization with initial outputs (and steady state of the states if possibles)"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end Temp;

      end Init;

      package Smoothness "Type, constants and menu choices to define the smoothness of table interpolation"
        annotation(Documentation(info="<html>
   
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        extends Modelica.Icons.Enumeration;
        constant Integer LinearSegments=0 "Table points are linearly interpolated";
        constant Integer ContinuousDerivative=1 "Table points are interpolated such that the first derivative is continuous";
        type Temp "Temporary type of Smoothness with choices for menus (until enumerations are available)"
          extends Modelica.Icons.TypeInteger;
          annotation(choices(choice=Modelica.Blocks.Types.Smoothness.LinearSegments "linear segments", choice=Modelica.Blocks.Types.Smoothness.ContinuousDerivative "continuous derivative"), Documentation(info="<html>
<p>
Smoothness of interpolation in a table.
</p>
 
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>choice</b></td>
      <td><b>Meaning of choice</b></td>
  </tr>
 
  <tr><td>LinearSegments</td>
      <td>Table points are linearly interpolated</td>
  </tr>
  <tr><td>ContinuousDerivative</td>
      <td>Table points are interpolated such that the
          first derivative is continuous</td>
  </tr>
</table>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        end Temp;

      end Smoothness;

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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{0,0},{430,-442}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model CombiTimeTable "Table look-up with respect to time and linear/perodic extrapolation methods (data from matrix/file)"
        parameter Boolean tableOnFile=false "true, if table is defined on file or in function usertab" annotation(Dialog(group="table data definition"));
        parameter Real table[:,:]=fill(0.0, 0, 2) "table matrix (time = first column)" annotation(Dialog(group="table data definition", enable=not tableOnFile));
        parameter String tableName="NoName" "table name on file or in function usertab (see docu)" annotation(Dialog(group="table data definition", enable=tableOnFile));
        parameter String fileName="NoName" "file where matrix is stored" annotation(Dialog(group="table data definition", enable=tableOnFile));
        parameter Integer columns[:]=2:size(table, 2) "columns of table to be interpolated" annotation(Dialog(group="table data interpretation"));
        parameter Blocks.Types.Smoothness.Temp smoothness=Blocks.Types.Smoothness.LinearSegments "smoothness of table interpolation" annotation(Dialog(group="table data interpretation"));
        parameter Blocks.Types.Extrapolation.Temp extrapolation=Blocks.Types.Extrapolation.LastTwoPoints "extrapolation of data outside the definition range" annotation(Dialog(group="table data interpretation"));
        parameter Real offset[:]={0} "Offsets of output signals" annotation(Dialog(group="table data interpretation"));
        parameter SI.Time startTime=0 "Output = offset for time < startTime" annotation(Dialog(group="table data interpretation"));
        extends Modelica.Blocks.Interfaces.MO(final nout=max([size(columns, 1);size(offset, 1)]));
        final parameter Real t_min(fixed=false);
        final parameter Real t_max(fixed=false);
        annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-30},{20,90}}),Line(visible=true, points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{20,90},{20,-30}}),Text(visible=true, fillColor={160,160,160}, extent={{-77,-58},{-38,-42}}, textString="offset", fontName="Arial"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}),Line(visible=true, points={{-31,-31},{-31,-70}}, color={192,192,192}),Line(visible=true, points={{-20,-30},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, fillColor={160,160,160}, extent={{-38,-88},{8,-70}}, textString="startTime", fontName="Arial"),Line(visible=true, points={{-20,-30},{-80,-30}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, fillColor={160,160,160}, extent={{-73,78},{-41,93}}, textString="y", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{66,-93},{91,-81}}, textString="time", fontName="Arial"),Text(visible=true, extent={{-19,68},{20,83}}, textString="time", fontName="Arial"),Text(visible=true, extent={{21,68},{50,82}}, textString="y[1]", fontName="Arial"),Line(visible=true, points={{50,90},{50,-30}}),Line(visible=true, points={{80,0},{100,0}}),Text(visible=true, extent={{34,-42},{71,-30}}, textString="columns", fontName="Arial"),Text(visible=true, extent={{51,68},{80,82}}, textString="y[2]", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,0}, fillPattern=FillPattern.Solid, extent={{-48,-50},{2,70}}),Line(visible=true, points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},{52,-20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}})}));
      protected 
        final parameter Real p_offset[nout]=if size(offset, 1) == 1 then ones(nout)*offset[1] else offset;
        Integer tableID;
        function tableTimeInit
          input Real timeIn;
          input Real startTime;
          input Integer ipoType;
          input Integer expoType;
          input String tableName;
          input String fileName;
          input Real table[:,:];
          input Integer colWise;
          output Integer tableID;

          external "C" tableID=omcTableTimeIni(timeIn,startTime,ipoType,expoType,tableName,fileName,table,size(table, 1),size(table, 2),colWise) ;

        end tableTimeInit;

        function tableTimeIpo
          input Integer tableID;
          input Integer icol;
          input Real timeIn;
          output Real value;

          external "C" value=omcTableTimeIpo(tableID,icol,timeIn) ;

        end tableTimeIpo;

        function tableTimeTmin
          input Integer tableID;
          output Real Tmin "minimum time value in table";

          external "C" Tmin=omcTableTimeTmin(tableID) ;

        end tableTimeTmin;

        function tableTimeTmax
          input Integer tableID;
          output Real Tmax "maximum time value in table";

          external "C" Tmax=omcTableTimeTmax(tableID) ;

        end tableTimeTmax;

        annotation(Documentation(info="<HTML>
<p>
This block generates an output signal y[:] by <b>linear interpolation</b> in
a table. The time points and function values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the other columns contain the data to be interpolated.
Via parameter <b>columns</b> it can be defined which columns of the
table are interpolated. If, e.g., columns={2,4}, it is assumed that
2 output signals are present and that the first output is computed
by interpolation of column 2 and the second output is computed
by interpolation of column 4 of the table matrix.
The table interpolation has the following properties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    extrapolation according to the setting of parameter
    <b>extrapolation</b>:
<pre>
  extrapolation = 0: hold the first or last value of the table,
                     if outside of the range.
                = 1: extrapolate through the last or first two
                     points of the table.
                = 2: periodically repeat the table data
                     (periodical function).
</pre></li>
<li>Via parameter <b>smoothness</b> it is defined how the data is interpolated:
<pre>
  smoothness = 0: linear interpolation
             = 1: smooth interpolation with Akima Splines such
                  that der(y) is continuous.
</pre></li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the table values of this row are just returned.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the ordinate value.
    The time instants stored in the table are therefore <b>relative</b>
    to <b>startTime</b>.
    If time &lt; startTime, no interpolation is performed and the offset
    is used as ordinate value for all outputs.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
<li>For special applications it is sometimes needed to know the minimum
    and maximum time instant defined in the table as a parameter. For this
    reason parameters <b>t_min</b> and <b>t_max</b> are provided and can be access from
    the outside of the table object.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]; extrapolation = 1 (default)
If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the output y =  2.5,
    e.g., time = 2.0, the output y =  4.0,
    e.g., time = 5.0, the output y = 23.0 (i.e. extrapolation via last 2 points).
</pre>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and binary file format is possible.
      (the ASCII format is described below).
      It is most convenient to generate the binary file from Matlab
      (Matlab 4 storage format), e.g., by command
<pre>
   save tables.mat tab1 tab2 tab3 -V4
</pre>
      when the three tables tab1, tab2, tab3 should be
      used from the model.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks.</li>
</ol>
<p>
Table definition methods (1) and (3) do <b>not</b> allocate dynamic memory,
and do not access files, whereas method (2) does. Therefore (1) and (3)
are suited for hardware-in-the-loop simulation (e.g. with dSpace hardware).
When the constant \"NO_FILE\" is defined in \"usertab.c\", all parts of the
source code of method (2) are removed by the C-preprocessor, such that
no dynamic memory allocation and no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file need to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(6,2)   # comment line
  0   0
  1   0
  1   1
  2   4
  3   9
  4  16
double tab2(6,2)   # another comment line
  0   0
  2   0
  2   2
  4   8
  6  18
  8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\". Afterwards, the corresponding matrix has to be declared
with type, name and actual dimensions. Finally, in successive
rows of the file, the elements of the matrix have to be given.
Several matrices may be defined one after another.
</p>

</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>March 31, 2001</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Used CombiTableTime as a basis and added the
       arguments <b>extrapolation, columns, startTime</b>.
       This allows periodic function definitions. </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Rectangle(extent={{-48,70},{2,-50}}, lineColor={255,255,255}, fillColor={255,255,0}, fillPattern=FillPattern.Solid),Line(points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},{52,-20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}}, color={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Rectangle(extent={{-20,90},{20,-30}}, lineColor={255,255,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{20,90},{20,-30}}, color={0,0,0}),Text(extent={{-77,-42},{-38,-58}}, textString="offset", fillColor={160,160,160}),Polygon(points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-31,-31},{-31,-70}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-20,-30},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Text(extent={{-38,-70},{8,-88}}, textString="startTime", fillColor={160,160,160}),Line(points={{-20,-30},{-80,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Text(extent={{-73,93},{-41,78}}, fillColor={160,160,160}, textString="y"),Text(extent={{66,-81},{91,-93}}, textString="time", fillColor={160,160,160}),Text(extent={{-19,83},{20,68}}, textString="time", fillColor={0,0,0}),Text(extent={{21,82},{50,68}}, fillColor={0,0,0}, textString="y[1]"),Line(points={{50,90},{50,-30}}, color={0,0,0}),Line(points={{80,0},{100,0}}),Text(extent={{34,-30},{71,-42}}, textString="columns"),Text(extent={{51,82},{80,68}}, fillColor={0,0,0}, textString="y[2]")}));
      equation 
        if tableOnFile then
          assert(tableName <> "NoName", "tableOnFile = true and no table name given");
        end if;
        if not tableOnFile then
          assert(size(table, 1) > 0 and size(table, 2) > 0, "tableOnFile = false and parameter table is an empty matrix");
        end if;
        for i in 1:nout loop
          y[i]=p_offset[i] + tableTimeIpo(tableID, columns[i], time);
        end for;
        when initial() then
          tableID=tableTimeInit(0.0, startTime, smoothness, extrapolation, if not tableOnFile then "NoName" else tableName, if not tableOnFile then "NoName" else fileName, table, 0);
        end when;
      initial equation 
        t_min=tableTimeTmin(tableID);
        t_max=tableTimeTmax(tableID);
      end CombiTimeTable;

    end Sources;

    package Math "Mathematical functions as input/output blocks"
      import Modelica.SIunits;
      import Modelica.Blocks.Interfaces;
      extends Modelica.Icons.Library;
      annotation(preferedView="info", Documentation(info="
<HTML>
<p>
This package contains basic <b>mathematical operations</b>,
such as summation and multiplication, and basic <b>mathematical
functions</b>, such as <b>sqrt</b> and <b>sin</b>, as
input/output blocks. All blocks of this library can be either
connected with continuous blocks or with sampled-data blocks.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New blocks added: RealToInteger, IntegerToReal, Max, Min, Edge, BooleanChange, IntegerChange.</li>
<li><i>August 7, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized (partly based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist).
</li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{0,0},{446,-493}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      block Gain "Output the product of a gain value with the input signal"
        parameter Real k=1 "Gain value multiplied with input signal";
        annotation(Documentation(info="
<HTML>
<p>
This block computes output <i>y</i> as
<i>product</i> of gain <i>k</i> with the
input <i>u</i>:
</p>
<pre>
    y = k * u;
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,191}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,-100},{-100,100},{100,0},{-100,-100}}),Text(visible=true, extent={{-150,-140},{150,-100}}, textString="k=%k", fontName="Arial"),Text(visible=true, extent={{-150,100},{150,140}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,191}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,-100},{-100,100},{100,0},{-100,-100}}),Text(visible=true, extent={{-76,-34},{0,38}}, textString="k", fontName="Arial")}));
        Interfaces.RealInput u "Input signal connector" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
        Interfaces.RealOutput y "Output signal connector" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      equation 
        y=k*u;
      end Gain;

      block Feedback "Output difference between commanded and feedback input"
        annotation(Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as <i>difference</i> of the
commanded input <b>u1</b> and the feedback
input <b>u2</b>:
</p>
<pre>
    <b>y</b> = <b>u1</b> - <b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   n = 2
  results in the following equations:
     y = u1 - u2
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,191}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-20,-20},{20,20}}),Line(visible=true, points={{-60,0},{-20,0}}, color={0,0,191}),Line(visible=true, points={{20,0},{80,0}}, color={0,0,191}),Line(visible=true, points={{0,-20},{0,-60}}, color={0,0,191}),Text(visible=true, extent={{-14,-94},{82,0}}, textString="-", fontName="Arial"),Text(visible=true, extent={{-100,60},{100,110}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-20,-20},{20,20}}),Line(visible=true, points={{-60,0},{-20,0}}),Line(visible=true, points={{20,0},{80,0}}),Line(visible=true, points={{0,-20},{0,-60}}),Text(visible=true, extent={{-12,-84},{84,10}}, textString="-", fontName="Arial")}));
        input Interfaces.RealInput u1 annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-80,0}, extent={{-20,-20},{20,20}}, rotation=0)));
        output Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={90,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={90,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        input Interfaces.RealInput u2 annotation(Placement(visible=true, transformation(origin={0,-80}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-80}, extent={{-20,-20},{20,20}}, rotation=90)));
      equation 
        y=u1 - u2;
      end Feedback;

      block Add "Output the sum of the two inputs"
        extends Interfaces.SI2SO;
        parameter Real k1=+1 "Gain of upper input";
        parameter Real k2=+1 "Gain of lower input";
        annotation(Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
two input signals <b>u1</b> and <b>u2</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3
  results in the following equations:
     y = 2 * u1 - 3 * u2
</pre>
<p><b>Release Notes:</b></p>
<ul>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-98,-92},{7,-52}}, textString="%k2", fontName="Arial"),Text(visible=true, extent={{-100,50},{5,90}}, textString="%k1", fontName="Arial"),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-100,60},{-40,60},{-30,40}}),Ellipse(visible=true, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-100,-60},{-40,-60},{-30,-40}}),Line(visible=true, points={{-15,-25.99},{15,25.99}}),Rectangle(visible=true, lineColor={0,0,191}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{50,0},{100,0}}),Line(visible=true, points={{-100,60},{-74,24},{-44,24}}, color={0,0,191}),Line(visible=true, points={{-100,-60},{-74,-28},{-42,-28}}, color={0,0,191}),Ellipse(visible=true, lineColor={0,0,191}, extent={{-50,-50},{50,50}}),Line(visible=true, points={{50,0},{100,0}}, color={0,0,191}),Text(visible=true, extent={{-38,-34},{38,34}}, textString="+", fontName="Arial"),Text(visible=true, extent={{-100,52},{5,92}}, textString="%k1", fontName="Arial"),Text(visible=true, extent={{-100,-92},{5,-52}}, textString="%k2", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-98,-92},{7,-52}}, textString="%k2", fontName="Arial"),Text(visible=true, extent={{-100,50},{5,90}}, textString="%k1", fontName="Arial"),Line(visible=true, points={{-100,60},{-40,60},{-30,40}}),Ellipse(visible=true, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-100,-60},{-40,-60},{-30,-40}}),Line(visible=true, points={{-15,-25.99},{15,25.99}}),Rectangle(visible=true, lineColor={0,0,191}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{50,0},{100,0}}),Line(visible=true, points={{-100,60},{-74,24},{-44,24}}, color={0,0,191}),Line(visible=true, points={{-100,-60},{-74,-28},{-42,-28}}, color={0,0,191}),Ellipse(visible=true, lineColor={0,0,191}, extent={{-50,-50},{50,50}}),Line(visible=true, points={{50,0},{100,0}}, color={0,0,191}),Text(visible=true, extent={{-38,-34},{38,34}}, textString="+", fontName="Arial"),Text(visible=true, extent={{-100,52},{5,92}}, textString="k1", fontName="Arial"),Text(visible=true, extent={{-100,-92},{5,-52}}, textString="k2", fontName="Arial")}));
      equation 
        y=k1*u1 + k2*u2;
      end Add;

    end Math;

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
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{0,0},{733,-491}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      connector RealSignal "Real port (both input/output possible)"
        replaceable type SignalType= Real annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        extends SignalType;
        annotation(Documentation(info="<html>
<p>
Connector with one signal of type Real (no icon, no input/output prefix).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end RealSignal;

      connector RealInput= input RealSignal "'input Real' as connector" annotation(defaultComponentName="u", Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, points={{0,50},{100,0},{0,-50},{0,50}}),Text(visible=true, fillColor={0,0,127}, extent={{-120,60},{100,105}}, textString="%name", fontName="Arial")}));
      connector RealOutput= output RealSignal "'output Real' as connector" annotation(defaultComponentName="y", Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{0,0},{-100,-50},{-100,50}}),Text(visible=true, fillColor={0,0,127}, extent={{-100,60},{130,140}}, textString="%name", fontName="Arial")}));
      partial block BlockIcon "Basic graphical layout of input/output block"
        annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end BlockIcon;

      partial block MO "Multiple Output continuous control block"
        extends BlockIcon;
        parameter Integer nout(min=1)=1 "Number of outputs";
        annotation(Documentation(info="<html>
<p>
Block has one continuous Real output signal vector.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        RealOutput y[nout] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      end MO;

      partial block SISO "Single Input Single Output continuous control block"
        extends BlockIcon;
        annotation(Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Real output signal.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        RealInput u "Connector of Real input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
        RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      end SISO;

      partial block SI2SO "2 Single Input / 1 Single Output continuous control block"
        extends BlockIcon;
        annotation(Documentation(info="<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        RealInput u1 "Connector of Real input signal 1" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
        RealInput u2 "Connector of Real input signal 2" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
        RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      end SI2SO;

    end Interfaces;

    package Continuous "Continuous control blocks with internal states"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
      extends Modelica.Icons.Library;
      annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains basic <b>continuous</b> input/output blocks
described by differential equations.
</p>

<p>
All blocks of this package can be initialized in different
ways controlled by parameter <b>initType</b>. The possible
values of initType are defined in 
<a href=\"Modelica://Modelica.Blocks.Types.Init\">Modelica.Blocks.Types.Init</a>:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Name</b></td>
      <td><b>Description</b></td></tr>

  <tr><td><b>Init.NoInit</b></td>
      <td>no initialization (start values are used as guess values with fixed=false)</td></tr>

  <tr><td><b>Init.SteadyState</b></td>
      <td>steady state initialization (derivatives of states are zero)</td></tr>

  <tr><td><b>Init.InitialState</b></td>
      <td>Initialization with initial states</td></tr>

  <tr><td><b>Init.InitialOutput</b></td>
      <td>Initialization with initial outputs (and steady state of the states if possibles)</td></tr>
</table>

<p>
For backward compatibility reasons the default of all blocks is
<b>Init.NoInit</b>, with the exception of Integrator and LimIntegrator 
where the default is <b>Init.InitialState</b> (this was the initialization
defined in version 2.2 of the Modelica standard library).
</p>

<p>
In many cases, the most useful initial condition is
<b>Init.SteadyState</b> because initial transients are then no longer
present. The drawback is that in combination with a non-linear
plant, non-linear algebraic equations occur that might be
difficult to solve if appropriate guess values for the
iteration variables are not provided (i.e. start values with fixed=false). 
However, it is often already useful to just initialize
the linear blocks from the Continuous blocks library in SteadyState.
This is uncritical, because only linear algebraic equations occur.
If Init.NoInit is set, then the start values for the states are
interpreted as <b>guess</b> values and are propagated to the
states with fixed=<b>false</b>.
</p>

<p>
Note, initialization with Init.SteadyState is usually difficult 
for a block that contains an integrator
(Integrator, LimIntegrator, PI, PID, LimPID).
This is due to the basic equation of an integrator:
</p>

<pre>
  <b>initial equation</b>
     <b>der</b>(y) = 0;   // Init.SteadyState
  <b>equation</b>
     <b>der</b>(y) = k*u;
</pre>

<p>
The steady state equation leads to the condition that the input to the
integrator is zero. If the input u is already (directly or indirectly) defined
by another initial condition, then the initialization problem is <b>singular</b>
(has none or infinitely many solutions). This situation occurs often
for mechanical systems, where, e.g., u = desiredSpeed - measuredSpeed and
since speed is both a state and a derivative, it is always defined by
Init.InitialState or Init.SteadyState initializtion.
</p>

<p>
In such a case, <b>Init.NoInit</b> has to be selected for the integrator
and an additional initial equation has to be added to the system
to which the integrator is connected. E.g., useful initial conditions
for a 1-dim. rotational inertia controlled by a PI controller are that
<b>angle</b>, <b>speed</b>, and <b>acceleration</b> of the inertia are zero.
</p>

</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      block Integrator "Output the integral of the input signal"
        import Modelica.Blocks.Types.Init;
        parameter Real k=1 "Integrator gain";
        parameter Init.Temp initType=Modelica.Blocks.Types.Init.InitialState "Type of initialization (InitialState and InitialOutput are identical)" annotation(Dialog(group="Initialization"), Evaluate=true);
        parameter Real y_start=0 "Initial or guess value of output (= state)" annotation(Dialog(group="Initialization"));
        extends Interfaces.SISO(y(start=y_start));
        annotation(Documentation(info="<html>
<p>
This blocks computes output <b>y</b> (element-wise) as
<i>integral</i> of the input <b>u</b> multiplied with
the gain <i>k</i>:
</p>
<pre>
         k
     y = - u
         s
</pre>

<p>
It might be difficult to initialize the integrator in steady state.
This is discussed in the description of package
<a href=\"Modelica://Modelica.Blocks.Continuous#info\">Continuous</a>.
</p>

</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,78},{-80,-90}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-90,-80},{82,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80},{68,-72},{68,-88},{90,-80}}),Text(visible=true, fillColor={192,192,192}, extent={{0,-70},{60,-10}}, textString="I", fontName="Arial"),Text(visible=true, extent={{-150,-150},{150,-110}}, textString="k=%k", fontName="Arial"),Line(visible=true, points={{-80,-80},{80,80}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-100,0},{-60,0}}),Line(visible=true, points={{60,0},{100,0}}),Text(visible=true, extent={{-36,2},{32,60}}, textString="k", fontName="Arial"),Text(visible=true, extent={{-32,-58},{36,0}}, textString="s", fontName="Arial"),Line(visible=true, points={{-46,0},{46,0}})}));
      initial equation 
        if initType == Init.SteadyState then
          der(y)=0;
        elseif initType == Init.InitialState or initType == Init.InitialOutput then
          y=y_start;
        else
        end if;
      equation 
        der(y)=k*u;
      end Integrator;

      block FirstOrder "First order transfer function block (= 1 pole)"
        import Modelica.Blocks.Types.Init;
        parameter Real k=1 "Gain";
        parameter SIunits.Time T=1 "Time Constant";
        parameter Init.Temp initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization (InitialState and InitialOutput are identical)" annotation(Dialog(group="Initialization"), Evaluate=true);
        parameter Real y_start=0 "Initial or guess value of output (= state)" annotation(Dialog(group="Initialization"));
        extends Interfaces.SISO(y(start=y_start));
        annotation(Documentation(info="<HTML>
<p>
This blocks defines the transfer function between the input u
and the output y (element-wise) as <i>first order</i> system:
</p>
<pre>
               k
     y = ------------ * u
            T * s + 1
</pre>
<p>
If you would like to be able to change easily between different
transfer functions (FirstOrder, SecondOrder, ... ) by changing
parameters, use the general block <b>TransferFunction</b> instead
and model a first order SISO system with parameters<br>
b = {k}, a = {T, 1}.
</p>
<pre>
Example:
   parameter: k = 0.3, T = 0.4
   results in:
             0.3
      y = ----------- * u
          0.4 s + 1.0
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,78},{-80,-90}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,88},{-80,90}}),Line(visible=true, points={{-90,-80},{82,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80},{68,-72},{68,-88},{90,-80}}),Line(visible=true, points={{-80,-80},{-70,-45.11},{-60,-19.58},{-50,-0.9087},{-40,12.75},{-30,22.75},{-20,30.06},{-10,35.41},{0,39.33},{10,42.19},{20,44.29},{30,45.82},{40,46.94},{50,47.76},{60,48.36},{70,48.8},{80,49.12}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={192,192,192}, extent={{0,-60},{60,0}}, textString="PT1", fontName="Arial"),Text(visible=true, extent={{-150,-150},{150,-110}}, textString="T=%T", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-48,8},{50,52}}, textString="k", fontName="Arial"),Text(visible=true, extent={{-54,-56},{56,-6}}, textString="T s + 1", fontName="Arial"),Line(visible=true, points={{-50,0},{50,0}}),Rectangle(visible=true, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-100,0},{-60,0}}),Line(visible=true, points={{60,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})));
      initial equation 
        if initType == Init.SteadyState then
          der(y)=0;
        elseif initType == Init.InitialState or initType == Init.InitialOutput then
          y=y_start;
        else
        end if;
      equation 
        der(y)=(k*u - y)/T;
      end FirstOrder;

      block TransferFunction "Linear transfer function"
        import Modelica.Blocks.Types.Init;
        extends Interfaces.SISO;
        parameter Real b[:]={1} "Numerator coefficients of transfer function.";
        parameter Real a[:]={1,1} "Denominator coefficients of transfer function.";
        parameter Init.Temp initType=Modelica.Blocks.Types.Init.NoInit "Type of initialization" annotation(Dialog(group="Initialization"), Evaluate=true);
        parameter Real x_start[size(a, 1) - 1]=zeros(nx) "Initial or guess values of states" annotation(Dialog(group="Initialization"));
        parameter Real y_start=0 "Initial value of output (derivatives of y are zero upto nx-1-th derivative)" annotation(Dialog(enable=initType == Init.InitialOutput, group="Initialization"));
        output Real x[size(a, 1) - 1](start=x_start) "State of transfer function from controller canonical form";
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,0},{80,0}}),Text(visible=true, extent={{-90,10},{90,90}}, textString="b(s)", fontName="Arial"),Text(visible=true, extent={{-90,-90},{90,-10}}, textString="a(s)", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{40,0},{-40,0}}),Text(visible=true, extent={{-55,5},{55,55}}, textString="b(s)", fontName="Arial"),Text(visible=true, extent={{-55,-55},{55,-5}}, textString="a(s)", fontName="Arial"),Rectangle(visible=true, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-100,0},{-60,0}}),Line(visible=true, points={{60,0},{100,0}})}));
      protected 
        parameter Integer na=size(a, 1) "Size of Denominator of transfer function.";
        parameter Integer nb(max=na)=size(b, 1) "Size of Numerator of transfer function.";
        parameter Integer nx=size(a, 1) - 1;
        Real x1dot "Derivative of first state of TransferFcn";
        Real xn "Highest order state of TransferFcn";
        annotation(Documentation(info="
<HTML>
<p>
This block defines the transfer function between the input
u and the output y
as (nb = dimension of b, na = dimension of a):
</p>
<pre>
           b[1]*s^[nb-1] + b[2]*s^[nb-2] + ... + b[nb]
   y(s) = --------------------------------------------- * u(s)
           a[1]*s^[na-1] + a[2]*s^[na-2] + ... + a[na]
</pre>
<p>
State variables <b>x</b> are defined according to <b>controller canonical</b>
form. Initial values of the states can be set as start values of <b>x</b>.
<p>
<p>
Example:
</p>
<pre>
     TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>
results in the following transfer function:
</p>
<pre>
        2*s + 4
   y = --------- * u
         s + 3
</pre>
<p><b>Release Notes:</b></p>
<ul>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}),Text(extent={{-90,10},{90,90}}, textString="b(s)"),Text(extent={{-90,-10},{90,-90}}, textString="a(s)")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{40,0},{-40,0}}, color={0,0,0}),Text(extent={{-55,55},{55,5}}, textString="b(s)", fillColor={0,0,0}),Text(extent={{-55,-5},{55,-55}}, textString="a(s)", fillColor={0,0,0}),Rectangle(extent={{-60,60},{60,-60}}),Line(points={{-100,0},{-60,0}}),Line(points={{60,0},{100,0}})}));
      initial equation 
        if initType == Init.SteadyState then
          der(x)=zeros(nx);
        elseif initType == Init.InitialState then
          x=x_start;
        elseif initType == Init.InitialOutput then
          y=y_start;
          der(x[1:nx - 1])=zeros(nx - 1);
        else
        end if;
      equation 
        [der(x);xn]=[x1dot;x];
        [u]=transpose([a])*[x1dot;x];
        [y]=transpose([zeros(na - nb, 1);b])*[x1dot;x];
      end TransferFunction;

    end Continuous;

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
    type Time= Real(final quantity="Time", final unit="s") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type AngularVelocity= Real(final quantity="AngularVelocity", final unit="rad/s", displayUnit="rev/min") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type AngularAcceleration= Real(final quantity="AngularAcceleration", final unit="rad/s2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Velocity= Real(final quantity="Velocity", final unit="m/s") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Mass= Real(quantity="Mass", final unit="kg", min=0) annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type MomentOfInertia= Real(final quantity="MomentOfInertia", final unit="kg.m2") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Inertia= MomentOfInertia annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Force= Real(final quantity="Force", final unit="N") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Torque= Real(final quantity="Torque", final unit="N.m") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type ElectricCurrent= Real(final quantity="ElectricCurrent", final unit="A") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Current= ElectricCurrent annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type ElectricPotential= Real(final quantity="ElectricPotential", final unit="V") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Voltage= ElectricPotential annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Capacitance= Real(final quantity="Capacitance", final unit="F", min=0) annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Inductance= Real(final quantity="Inductance", final unit="H") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    type Resistance= Real(final quantity="Resistance", final unit="Ohm") annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
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

    partial model RotationalSensor "Icon representing rotational measurement device"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}})}));
    end RotationalSensor;

    partial model MotorIcon "Icon for electrical motor"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,0,0}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-50},{30,50}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-100,-90},{-90,-90},{-60,-20},{-10,-20},{20,-90},{30,-90},{30,-100},{-100,-100},{-100,-90}}),Rectangle(visible=true, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{90,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end MotorIcon;

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
  package Examples "Examples for the 3D mechanical systems library"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>

<p>
This package contains example models to demonstrate the usage of the
ModelicaAdditions.MultiBody package. Open the models and simulate them
according to the provided description in the models.

</HTML>", revisions=""));
    package Robots "Examples of robots"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<html>

<p>
This package contains robot models.

</HTML>", revisions=""));
      package r3 "Models of the Manutec r3 robot"
        extends Modelica.Icons.Library;
        annotation(Documentation(info="<HTML>

<p>
This package contains models of the robot r3 of the company Manutec.
It is used to demonstrate in which way complex robot models should
be built up by testing first the components of the model
individually before composing them together. The following models are
available:

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

<pre>
 Tuerk S. (1990): Zur Modellierung der Dynamik von Robotern mit
   rotatorischen Gelenken. Fortschrittberichte VDI, Reihe 8, Nr. 211,
   VDI-Verlag 1990.
</pre>

<p>
The robot model is described in detail in

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

<p><b>Release Notes:</b></p>
<ul>
<li><i>June 20, 2000</i>
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
        encapsulated model robot "Detailled model of Manutec r3 robot with reference path"
          import Modelica.Icons;
          import Modelica.Blocks.Sources.CombiTimeTable;
          import MultiBody.Examples.Robots.r3.Components;
          extends Icons.Example;
          annotation(Documentation(info="<HTML>

<p>
Complete model of Mantuec r3 robot, including controller, motor, gearbox, 3D
mechanics model.

<p>
Simulate for 1.3 seconds.

</HTML>", revisions=""), experiment(StopTime=1.3, Interval=0.01), Commands(file="r3.mos" "Simulate and plot torque"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
          Components.FullRobot robot(q0={-1,0.43,1.57,0,-2,0}) annotation(Placement(visible=true, transformation(origin={35.0,-5.0}, extent={{-65.0,-65.0},{65.0,65.0}}, rotation=0)));
          CombiTimeTable a_ref1(table=[0,30;0.1,30;0.1,0;0.74,0;0.74,-13.96;1.12,-13.96;1.12,28.75;1.2,28.75;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-80.5,-80.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
          CombiTimeTable a_ref2(table=[0,-15;0.1,-15;0.1,0;1.1,0;1.1,15;1.2,15;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-80.5,-50.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
          CombiTimeTable a_ref3(table=[0,30;0.15,30;0.15,-21.56;0.6,-21.56;0.6,0;0.9,0;0.9,17.33;1.2,17.33;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-79.5,-20.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
          CombiTimeTable a_ref4(table=[0,-80;0.04,-80;0.04,0;0.54,0;0.54,71.11;0.63,71.11;0.63,0;1.14,0;1.14,-53.33;1.2,-53.33;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-80.5,10.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
          CombiTimeTable a_ref5(table=[0,105;0.04,105;0.04,0;1.02,0;1.02,-68.33;1.14,-68.33;1.14,66.67;1.2,66.67;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-79.5,40.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
          CombiTimeTable a_ref6(table=[0,-95;0.04,-95;0.04,0;0.54,0;0.54,84.44;0.63,84.44;0.63,0;1.14,0;1.14,-63.33;1.2,-63.33;1.2,0;1.3,0]) annotation(Placement(visible=true, transformation(origin={-80.5,70.0}, extent={{-10.5,-10.0},{10.5,10.0}}, rotation=0)));
        equation 
          connect(a_ref6.y[1],robot.a_ref6) annotation(Line(visible=true, points={{-68.95,70.0},{-50.0,70.0},{-50.0,40.5},{-33.25,40.5}}, color={0,0,255}));
          connect(a_ref5.y[1],robot.a_ref5) annotation(Line(visible=true, points={{-67.95,40.0},{-60.0,40.0},{-60.0,21.0},{-33.25,21.0}}, color={0,0,255}));
          connect(a_ref4.y[1],robot.a_ref4) annotation(Line(visible=true, points={{-68.95,10.0},{-50.0,10.0},{-50.0,1.5},{-33.25,1.5}}, color={0,0,255}));
          connect(a_ref3.y[1],robot.a_ref3) annotation(Line(visible=true, points={{-67.95,-20.0},{-50.0,-20.0},{-50.0,-18.0},{-33.25,-18.0}}, color={0,0,255}));
          connect(a_ref2.y[1],robot.a_ref2) annotation(Line(visible=true, points={{-68.95,-50.0},{-60.0,-50.0},{-60.0,-37.5},{-33.25,-37.5}}, color={0,0,255}));
          connect(a_ref1.y[1],robot.a_ref1) annotation(Line(visible=true, points={{-68.95,-80.0},{-50.0,-80.0},{-50.0,-57.0},{-33.25,-57.0}}, color={0,0,255}));
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
            annotation(Documentation(info="<p>
Models the gearbox used in the first three joints with all its effects,
like elasticity and friction.
<P>
Coulomb friction is approximated by a friction element acting
at the \"motor\"-side. In reality, bearing friction should be
also incorporated at the driven side of the gearbox. However,
this would require considerable more effort for the measurement
of the friction parameters.
<p>
Default values for all parameters are given for joint 1.
<p>
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

", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-10.0},{-60.0,10.0}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-60.0,10.0},{-60.0,20.0},{-40.0,40.0},{-40.0,-40.0},{-60.0,-20.0},{-60.0,10.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40.0,-60.0},{40.0,60.0}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{60.0,20.0},{40.0,40.0},{40.0,-40.0},{60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{60.0,-10.0},{90.0,10.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-60.0,-90.0},{-50.0,-90.0},{-20.0,-30.0},{20.0,-30.0},{48.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-60.0,-100.0},{-60.0,-90.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,68.0},{100.0,128.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-36.0,-30.0},{36.0,40.0}}, textString="1", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{72.0,22.0},{130.0,30.0}}, textString="flange of joint axis", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-124.0,20.0},{-66.0,28.0}}, textString="flange of motor axis", fontName="Arial")}));
            Modelica.Mechanics.Rotational.Inertia Jmotor(J=J, stateSelection=Modelica.Blocks.Types.StateSelection.Avoid) annotation(Placement(visible=true, transformation(origin={-64.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.IdealGear gear(ratio=i) annotation(Placement(visible=true, transformation(origin={60.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.SpringDamper spring(c=c, d=d, stateSelection=Modelica.Blocks.Types.StateSelection.Avoid) annotation(Placement(visible=true, transformation(origin={10.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.RelativeStates relativeStates annotation(Placement(visible=true, transformation(origin={10.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.BearingFriction bearingFriction(tau_pos=[0,Rv0;1,Rv0 + Rv1]) annotation(Placement(visible=true, transformation(origin={-30.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          equation 
            connect(gear.flange_b,flange_b) annotation(Line(visible=true, origin={85.0,0.0}, points={{-15.0,0.0},{15.0,0.0}}, color={0,0,255}));
            connect(Jmotor.flange_a,flange_a) annotation(Line(visible=true, points={{-74.0,0.0},{-100.0,0.0}}, color={0,0,255}));
            connect(Jmotor.flange_b,bearingFriction.flange_a) annotation(Line(visible=true, origin={-47.0,0.0}, points={{-7.0,0.0},{7.0,0.0}}, color={0,0,255}));
            connect(bearingFriction.flange_b,spring.flange_a) annotation(Line(visible=true, origin={-10.0,0.0}, points={{-10.0,0.0},{10.0,0.0}}, color={0,0,255}));
            connect(relativeStates.flange_a,spring.flange_a) annotation(Line(visible=true, points={{0.0,40.0},{-10.0,40.0},{-10.0,0.0},{0.0,0.0}}, color={0,0,255}));
            connect(relativeStates.flange_b,spring.flange_b) annotation(Line(visible=true, points={{20.0,40.0},{30.0,40.0},{30.0,0.0},{20.0,0.0}}, color={0,0,255}));
            connect(spring.flange_b,gear.flange_a) annotation(Line(visible=true, origin={35.0,0.0}, points={{-15.0,0.0},{15.0,0.0}}, color={0,0,255}));
          end GearType1;

          model GearType2 "Motor inertia and gearbox model for r3 joints 4,5,6  "
            extends Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
            parameter SI.Inertia J=0.00016 "moment of inertia of motor";
            parameter Real i=-99 "gear ratio";
            parameter SI.Torque Rv0=21.8 "viscous friction torque at zero velocity";
            parameter Real Rv1=9.8 "viscous friction coefficient in [Nms/rad] (R=Rv0+Rv1*abs(qd))";
            parameter Real peak=26.7/21.8 "peak*Rv0 = maximum static friction torque (peak >= 1)";
            annotation(Documentation(info="<p>
The elasticity and damping in the gearboxes of the outermost
three joints of the robot is neglected.
<p>
Default values for all parameters are given for joint 4.
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-10.0},{-60.0,10.0}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-60.0,10.0},{-60.0,20.0},{-40.0,40.0},{-40.0,-40.0},{-60.0,-20.0},{-60.0,10.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40.0,-60.0},{40.0,60.0}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{60.0,20.0},{40.0,40.0},{40.0,-40.0},{60.0,-20.0},{60.0,20.0}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{60.0,-10.0},{90.0,10.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-60.0,-90.0},{-50.0,-90.0},{-20.0,-30.0},{20.0,-30.0},{48.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-60.0,-100.0},{-60.0,-90.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,68.0},{100.0,128.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-36.0,-30.0},{38.0,40.0}}, textString="2", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            Modelica.Mechanics.Rotational.Inertia Jmotor(J=J) annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.IdealGear gear(ratio=i) annotation(Placement(visible=true, transformation(origin={2.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.BearingFriction bearingFriction(tau_pos=[0,Rv0;1,Rv0 + Rv1], peak=peak) annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          equation 
            connect(Jmotor.flange_b,gear.flange_a) annotation(Line(visible=true, origin={-24.0,0.0}, points={{-16.0,0.0},{16.0,0.0}}, color={0,0,255}));
            connect(bearingFriction.flange_b,flange_b) annotation(Line(visible=true, origin={80.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}, color={0,0,255}));
            connect(gear.flange_b,bearingFriction.flange_a) annotation(Line(visible=true, origin={26.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={0,0,255}));
            connect(Jmotor.flange_a,flange_a) annotation(Line(visible=true, points={{-60.0,0.0},{-100.0,0.0}}, color={0,0,255}));
          end GearType2;

          model Motor "Motor model including current controller of r3 motors "
            extends Modelica.Icons.MotorIcon;
            parameter Real k=1.1616 "gain of motor";
            parameter Real wm=4590 "time constant of motor";
            parameter Real D=0.6 "damping constant of motor";
            annotation(Documentation(info="<p>
Default values are given for the motor of joint 1.
<p>
The input of the motor is the desired current (the actual current is proportional to the torque produced by the motor).
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,60.0},{100.0,120.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{50.0,-10.0},{50.0,-90.0}}, color={0,0,255}),Line(visible=true, points={{80.0,-90.0},{80.0,-10.0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-134.0,18.0},{-104.0,35.0}}, textString="(reference current)", fontName="Arial")}));
            Modelica.Blocks.Interfaces.RealInput i_ref annotation(Placement(visible=true, transformation(origin={-119.5,0.0}, extent={{-19.5,-20.0},{19.5,20.0}}, rotation=0), iconTransformation(origin={-119.5,0.0}, extent={{-19.5,-20.0},{19.5,20.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_motor annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealOutput outPort_w annotation(Placement(visible=true, transformation(origin={50.0,-100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90), iconTransformation(origin={50.0,-100.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=90)));
            Modelica.Blocks.Interfaces.RealOutput outPort_phi annotation(Placement(visible=true, transformation(origin={80.0,-100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90), iconTransformation(origin={80.0,-100.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=90)));
            Modelica.Electrical.Analog.Sources.SignalVoltage Vs annotation(Placement(visible=true, transformation(origin={-76.0,0.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
            Modelica.Electrical.Analog.Ideal.IdealOpAmp diff annotation(Placement(visible=true, transformation(origin={-40.0,25.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Ideal.IdealOpAmp power annotation(Placement(visible=true, transformation(origin={40.0,25.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.EMF emf(k=k) annotation(Placement(visible=true, transformation(origin={70.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Inductor La(L=250/(2*D*wm)) annotation(Placement(visible=true, transformation(origin={70.0,30.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
            Modelica.Electrical.Analog.Basic.Resistor Ra(R=250) annotation(Placement(visible=true, transformation(origin={70.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
            Modelica.Electrical.Analog.Basic.Resistor Rd2(R=100) annotation(Placement(visible=true, transformation(origin={-64.5,30.0}, extent={{-7.5,-8.0},{7.5,8.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Capacitor C(C=0.004*D/wm) annotation(Placement(visible=true, transformation(origin={10.0,46.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Ideal.IdealOpAmp OpI annotation(Placement(visible=true, transformation(origin={10.0,20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Resistor Rd1(R=100) annotation(Placement(visible=true, transformation(origin={-41.5,45.0}, extent={{-7.5,-8.0},{7.5,8.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Resistor Ri(R=10) annotation(Placement(visible=true, transformation(origin={-15.5,25.0}, extent={{-7.5,-8.0},{7.5,8.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Resistor Rp1(R=200) annotation(Placement(visible=true, transformation(origin={38.5,46.0}, extent={{-7.5,-8.0},{7.5,8.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Resistor Rp2(R=50) annotation(Placement(visible=true, transformation(origin={25.0,72.0}, extent={{-7.0,8.0},{7.0,-8.0}}, rotation=90)));
            Modelica.Electrical.Analog.Basic.Resistor Rd4(R=100) annotation(Placement(visible=true, transformation(origin={-33.5,-7.0}, extent={{-7.5,-8.0},{7.5,8.0}}, rotation=0)));
            Modelica.Electrical.Analog.Sources.SignalVoltage hall2 annotation(Placement(visible=true, transformation(origin={-55.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
            Modelica.Electrical.Analog.Basic.Resistor Rd3(R=100) annotation(Placement(visible=true, transformation(origin={-55.0,-22.0}, extent={{-7.0,8.0},{7.0,-8.0}}, rotation=90)));
            Modelica.Electrical.Analog.Basic.Ground g1 annotation(Placement(visible=true, transformation(origin={-76.0,-27.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Ground g2 annotation(Placement(visible=true, transformation(origin={-55.0,-80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Ground g3 annotation(Placement(visible=true, transformation(origin={-10.0,-17.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Sensors.CurrentSensor hall1 annotation(Placement(visible=true, transformation(origin={30.0,-50.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-90)));
            Modelica.Electrical.Analog.Basic.Ground g4 annotation(Placement(visible=true, transformation(origin={30.0,-74.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Electrical.Analog.Basic.Ground g5 annotation(Placement(visible=true, transformation(origin={25.0,93.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
            Modelica.Mechanics.Rotational.Sensors.AngleSensor phi annotation(Placement(visible=true, transformation(origin={90.0,-50.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
            Modelica.Mechanics.Rotational.Sensors.SpeedSensor w annotation(Placement(visible=true, transformation(origin={70.0,-50.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
          equation 
            connect(w.w,outPort_w) annotation(Line(visible=true, points={{70.0,-61.0},{50.0,-61.0},{50.0,-100.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(phi.phi,outPort_phi) annotation(Line(visible=true, points={{90.0,-61.0},{90.0,-80.5},{80.0,-80.5},{80.0,-100.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(Rp1.p,Rp2.p) annotation(Line(visible=true, points={{31.0,46.0},{25.0,46.0},{25.0,65.0}}, color={0,0,255}));
            connect(g5.p,Rp2.n) annotation(Line(visible=true, points={{25.0,83.0},{25.0,79.0}}, color={0,0,255}));
            connect(Vs.v,i_ref) annotation(Line(visible=true, origin={-101.25,0.0}, points={{18.25,0.0},{-18.25,0.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(Rd3.p,hall2.p) annotation(Line(visible=true, points={{-55.0,-29.0},{-55.0,-40.0}}, color={0,0,255}));
            connect(Rd3.n,diff.p1) annotation(Line(visible=true, points={{-55.0,-15.0},{-55.0,20.0},{-50.0,20.0}}, color={0,0,255}));
            connect(Rd3.n,Rd4.p) annotation(Line(visible=true, points={{-55.0,-15.0},{-55.0,-7.0},{-41.0,-7.0}}, color={0,0,255}));
            connect(emf.flange_b,phi.flange_a) annotation(Line(visible=true, points={{80.0,0.0},{80.0,0.0},{80.0,-40.0},{90.0,-40.0},{90.0,-40.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(emf.flange_b,w.flange_a) annotation(Line(visible=true, points={{80.0,0.0},{80.0,0.0},{80.0,-40.0},{70.0,-40.0},{70.0,-40.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(hall1.i,hall2.v) annotation(Line(visible=true, points={{20.0,-50.0},{-48.0,-50.0}}, color={0,0,255}, pattern=LinePattern.Dot));
            connect(emf.n,hall1.p) annotation(Line(visible=true, points={{70.0,-10.0},{70.0,-24.0},{30.0,-24.0},{30.0,-60.0}}, color={0,0,255}));
            connect(hall1.n,g4.p) annotation(Line(visible=true, points={{30.0,-40.0},{30.0,-64.0}}, color={0,0,255}));
            connect(g2.p,hall2.n) annotation(Line(visible=true, points={{-55.0,-70.0},{-55.0,-60.0}}, color={0,0,255}));
            connect(Vs.p,Rd2.p) annotation(Line(visible=true, origin={-74.6667,23.3333}, points={{-1.3333,-13.3333},{-1.3333,6.6667},{2.6667,6.6667}}, color={0,0,255}));
            connect(Vs.n,g1.p) annotation(Line(visible=true, points={{-76.0,-10.0},{-76.0,-17.0}}, color={0,0,255}));
            connect(Ra.n,La.p) annotation(Line(visible=true, points={{70.0,50.0},{70.0,40.0}}, color={0,0,255}));
            connect(power.p2,Ra.p) annotation(Line(visible=true, points={{50.0,25.0},{56.0,25.0},{56.0,80.0},{70.0,80.0},{70.0,70.0}}, color={0,0,255}));
            connect(La.n,emf.p) annotation(Line(visible=true, points={{70.0,20.0},{70.0,10.0}}, color={0,0,255}));
            connect(OpI.p1,diff.n2) annotation(Line(visible=true, points={{0.0,15.0},{-40.0,15.0}}, color={0,0,255}));
            connect(OpI.p1,OpI.n2) annotation(Line(visible=true, points={{0.0,15.0},{0.0,10.0},{10.0,10.0}}, color={0,0,255}));
            connect(OpI.n2,power.n2) annotation(Line(visible=true, points={{10.0,10.0},{10.0,4.0},{40.0,4.0},{40.0,15.0}}, color={0,0,255}));
            connect(flange_motor,emf.flange_b) annotation(Line(visible=true, points={{100.0,0.0},{80.0,0.0}}, thickness=0.5));
            connect(g3.p,OpI.p1) annotation(Line(visible=true, points={{-10.0,-7.0},{-10.0,15.0},{0.0,15.0}}, color={0,0,255}));
            connect(Rd4.n,g3.p) annotation(Line(visible=true, points={{-26.0,-7.0},{-10.0,-7.0}}, color={0,0,255}));
            connect(power.p2,Rp1.n) annotation(Line(visible=true, points={{50.0,25.0},{50.0,46.0},{46.0,46.0}}, color={0,0,255}));
            connect(power.n1,Rp1.p) annotation(Line(visible=true, points={{30.0,30.0},{25.0,30.0},{25.0,46.0},{31.0,46.0}}, color={0,0,255}));
            connect(OpI.n1,C.p) annotation(Line(visible=true, points={{0.0,25.0},{0.0,46.0}}, color={0,0,255}));
            connect(Ri.n,OpI.n1) annotation(Line(visible=true, points={{-8.0,25.0},{0.0,25.0}}, color={0,0,255}));
            connect(diff.p2,Ri.p) annotation(Line(visible=true, points={{-30.0,25.0},{-23.0,25.0}}, color={0,0,255}));
            connect(Rd1.n,diff.p2) annotation(Line(visible=true, points={{-34.0,45.0},{-30.0,45.0},{-30.0,25.0}}, color={0,0,255}));
            connect(diff.n1,Rd1.p) annotation(Line(visible=true, points={{-50.0,30.0},{-54.0,30.0},{-54.0,45.0},{-49.0,45.0}}, color={0,0,255}));
            connect(OpI.p2,power.p1) annotation(Line(visible=true, points={{20.0,20.0},{30.0,20.0}}, color={0,0,255}));
            connect(C.n,OpI.p2) annotation(Line(visible=true, points={{20.0,46.0},{20.0,20.0}}, color={0,0,255}));
            connect(Rd2.n,diff.n1) annotation(Line(visible=true, points={{-57.0,30.0},{-50.0,30.0}}, color={0,0,255}));
          end Motor;

          model Control "Controller model of r3 robot "
            extends Modelica.Blocks.Interfaces.BlockIcon;
            annotation(Documentation(info="<HTML>

<p>
For the robot 6 identical controllers are used. Therefore, this class has no
parameters.

<p>
In reality, the position controller is realized in digital form (components Kv, Kd). For efficiency reasons, this controller part is modelled as
continuous component. By simulation it has been shown, that the difference in
the results is below the plot accuracy.

</HTML>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40.0,28.0},{44.0,70.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-20.0},{44.0,-62.0}}),Line(visible=true, points={{44.0,46.0},{78.0,46.0},{78.0,-42.0},{44.0,-42.0}}, color={0,0,255}),Line(visible=true, points={{-40.0,-42.0},{-76.0,-42.0},{-76.0,48.0},{-40.0,48.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.0,-42.0},{64.0,-32.0},{64.0,-50.0},{44.0,-42.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-40.0,48.0},{-60.0,56.0},{-60.0,40.0},{-40.0,48.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            Modelica.Blocks.Interfaces.RealInput phi_ref annotation(Placement(visible=true, transformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput w_ref annotation(Placement(visible=true, transformation(origin={-120.0,70.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-120.0,70.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput phi annotation(Placement(visible=true, transformation(origin={-80.0,-100.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90), iconTransformation(origin={-80.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90)));
            Modelica.Blocks.Interfaces.RealInput w annotation(Placement(visible=true, transformation(origin={70.0,-100.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90), iconTransformation(origin={70.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=-90)));
            Modelica.Blocks.Interfaces.RealOutput i_ref annotation(Placement(visible=true, transformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.TransferFunction rate2(b={0.00995,1}, a={0.00056,1}) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.Integrator rate3(k=340.8) annotation(Placement(visible=true, transformation(origin={70.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.TransferFunction rate1(b={0.04,1}, a={0.0202,1}) annotation(Placement(visible=true, transformation(origin={26.0,-50.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.FirstOrder tacho1(T=0.0008475, k=0.03) annotation(Placement(visible=true, transformation(origin={80.0,-50.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain Kd(k=0.03) annotation(Placement(visible=true, transformation(origin={-60.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Feedback wSum annotation(Placement(visible=true, transformation(origin={10.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Add sum annotation(Placement(visible=true, transformation(origin={-14.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Feedback pSum annotation(Placement(visible=true, transformation(origin={-80.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain Kv(k=0.3) annotation(Placement(visible=true, transformation(origin={-56.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.TransferFunction tacho2(a={1/(2014*2014),2*0.294/2014,1}) annotation(Placement(visible=true, transformation(origin={53.0,-50.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
          equation 
            connect(tacho1.u,w) annotation(Line(visible=true, points={{92.0,-50.0},{100.0,-50.0},{100.0,-80.0},{70.0,-80.0},{70.0,-100.0}}, color={0,0,255}));
            connect(pSum.u2,phi) annotation(Line(visible=true, origin={-80.0,-54.0}, points={{0.0,46.0},{0.0,-46.0}}, color={0,0,255}));
            connect(pSum.u1,phi_ref) annotation(Line(visible=true, points={{-88.0,0.0},{-120.0,0.0}}, color={0,0,255}));
            connect(Kd.u,w_ref) annotation(Line(visible=true, points={{-72.0,70.0},{-120.0,70.0}}, color={0,0,255}));
            connect(Kv.y,sum.u2) annotation(Line(visible=true, points={{-45.0,0.0},{-40.0,0.0},{-40.0,-6.0},{-26.0,-6.0}}, color={0,0,255}));
            connect(tacho2.y,rate1.u) annotation(Line(visible=true, points={{42.0,-50.0},{38.0,-50.0}}, color={0,0,255}));
            connect(tacho1.y,tacho2.u) annotation(Line(visible=true, points={{69.0,-50.0},{65.0,-50.0}}, color={0,0,255}));
            connect(Kv.u,pSum.y) annotation(Line(visible=true, points={{-68.0,0.0},{-71.0,0.0}}, color={0,0,255}));
            connect(rate1.y,wSum.u2) annotation(Line(visible=true, points={{15.0,-50.0},{10.0,-50.0},{10.0,-8.0}}, color={0,0,255}));
            connect(rate3.y,i_ref) annotation(Line(visible=true, points={{81.0,0.0},{110.0,0.0}}, color={0,0,255}));
            connect(Kd.y,sum.u1) annotation(Line(visible=true, points={{-49.0,70.0},{-34.0,70.0},{-34.0,6.0},{-26.0,6.0}}, color={0,0,255}));
            connect(sum.y,wSum.u1) annotation(Line(visible=true, points={{-3.0,0.0},{2.0,0.0}}, color={0,0,255}));
            connect(wSum.y,rate2.u) annotation(Line(visible=true, points={{19.0,0.0},{28.0,0.0}}, color={0,0,255}));
            connect(rate2.y,rate3.u) annotation(Line(visible=true, points={{51.0,0.0},{58.0,0.0}}, color={0,0,255}));
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
            annotation(Documentation(info="<HTML>

<p>
The axis model consists of the <b>controller</b>, the <b>motor</b> including current
controller and the <b>gearbox</b> including gear elasticity and bearing friction.
The only difference to the axis model of joints 4,5,6 (= model axisType2) is
that elasticity and damping in the gear boxes are not neglected.
The component <b>States</b> is a dummy inertia, i.e., the inertia is zero,
to define that the absolute angle and the absolute angular velocity of the
driven gear flange are used as <b>states</b>.

<p>
The input signal of this component is the desired angular acceleration
of the joint (= reference acceleration). From the acceleration, the
reference position and reference velocity are computed via integration.
The reference input is an acceleration, because the reference signals
have to be \"smooth\" (position has to be differentiable at least 2 times).
Otherwise, the gear elasticity leads to significant oscillations which
are not acceptable.

<p>
Default values of the parameters are given for the axis of joint 1.

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100.0,-40.0},{90.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,50.0},{100.0,110.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-81.0,-32.0},{80.0,32.0}}, textString="1", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            Modelica.Blocks.Interfaces.RealInput inPort_a_ref annotation(Placement(visible=true, transformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            GearType1 r3Gear1(J=J, i=i, c=c, d=cd, Rv0=Rv0, Rv1=Rv1, peak=peak) annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Motor r3Motor(k=k, wm=w, D=D) annotation(Placement(visible=true, transformation(origin={25.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Control r3Control annotation(Placement(visible=true, transformation(origin={-3.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.Integrator integrator1(y_start=w_ref0) annotation(Placement(visible=true, transformation(origin={-84.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.Integrator integrator2(y_start=phi_ref0) annotation(Placement(visible=true, transformation(origin={-56.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain k2(k=i) annotation(Placement(visible=true, transformation(origin={-44.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain k1(k=i) annotation(Placement(visible=true, transformation(origin={-29.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Inertia states(J=0, phi(start=phi_ref0, fixed=true), w(start=w_ref0, fixed=true)) annotation(Placement(visible=true, transformation(origin={75.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          equation 
            connect(states.flange_b,flange) annotation(Line(visible=true, points={{85.0,0.0},{100.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(r3Gear1.flange_b,states.flange_a) annotation(Line(visible=true, points={{60.0,0.0},{65.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(k2.y,r3Control.w_ref) annotation(Line(visible=true, points={{-33.0,30.0},{-24.0,30.0},{-24.0,7.0},{-15.0,7.0}}, color={0,0,255}));
            connect(integrator1.u,inPort_a_ref) annotation(Line(visible=true, points={{-96.0,0.0},{-120.0,0.0}}, color={0,0,255}));
            connect(r3Motor.flange_motor,r3Gear1.flange_a) annotation(Line(visible=true, points={{35.0,0.0},{40.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(integrator1.y,k2.u) annotation(Line(visible=true, points={{-73.0,0.0},{-71.0,0.0},{-71.0,30.0},{-56.0,30.0}}, color={0,0,255}));
            connect(integrator2.y,k1.u) annotation(Line(visible=true, points={{-45.0,0.0},{-41.0,0.0}}, color={0,0,255}));
            connect(r3Control.i_ref,r3Motor.i_ref) annotation(Line(visible=true, points={{8.0,0.0},{13.05,0.0}}, color={0,0,255}));
            connect(integrator1.y,integrator2.u) annotation(Line(visible=true, points={{-73.0,0.0},{-68.0,0.0}}, color={0,0,255}));
            connect(r3Motor.outPort_phi,r3Control.phi) annotation(Line(visible=true, points={{33.0,-10.0},{33.0,-30.0},{-11.0,-30.0},{-11.0,-12.0}}, color={0,0,255}));
            connect(r3Motor.outPort_w,r3Control.w) annotation(Line(visible=true, points={{30.0,-9.9},{30.0,-20.0},{4.0,-20.0},{4.0,-12.0}}, color={0,0,255}));
            connect(k1.y,r3Control.phi_ref) annotation(Line(visible=true, points={{-18.0,0.0},{-15.0,0.0}}, color={0,0,255}));
            a_ref=inPort_a_ref;
            w_ref=integrator1.y;
            phi_ref=integrator2.y;
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
            annotation(Documentation(info="<HTML>

<p>
The axis model consists of the <b>controller</b>, the <b>motor</b> including
current controller and the <b>gearbox</b> including gear elasticity and
bearing friction. The only difference to the axis model of joints 1,2,3 (=
model axisType1) is elasticity and damping in the gear boxes are neglected.
The component <b>States</b> is a dummy inertia, i.e., the inertia is zero,
to define that the absolute angle and the absolute angular velocity of the
driven gear flange are used as <b>states</b>.

<p>
The input signal of this component is the desired angular acceleration of the
joint (= reference acceleration). From the acceleration, the reference
position and reference velocity are computed via integration. The reference
input is an acceleration, because the reference signals have to be \"smooth\"
(position has to be differentiable at least 2 times). Otherwise, the gear
elasticity leads to significant oscillations which are not acceptable.

<p>
Default values of the parameters are given for the axis of joint 1.

</HTML>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100.0,-40.0},{90.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,50.0},{100.0,110.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-81.0,-32.0},{80.0,32.0}}, textString="2", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            Modelica.Blocks.Interfaces.RealInput inPort_a_ref annotation(Placement(visible=true, transformation(origin={-119.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-119.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b flange annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            GearType2 r3Gear2(J=J, i=i, Rv0=Rv0, Rv1=Rv1, peak=peak) annotation(Placement(visible=true, transformation(origin={51.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Motor r3Motor(k=k, wm=w, D=D) annotation(Placement(visible=true, transformation(origin={25.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Control r3Control annotation(Placement(visible=true, transformation(origin={-2.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.Integrator integrator1(y_start=w_ref0) annotation(Placement(visible=true, transformation(origin={-84.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Continuous.Integrator integrator2(y_start=phi_ref0) annotation(Placement(visible=true, transformation(origin={-56.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain k2(k=i) annotation(Placement(visible=true, transformation(origin={-40.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Math.Gain k1(k=i) annotation(Placement(visible=true, transformation(origin={-29.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Inertia states(J=0, phi(start=phi_ref0, fixed=true), w(start=w_ref0, fixed=true)) annotation(Placement(visible=true, transformation(origin={75.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
          equation 
            connect(states.flange_b,flange) annotation(Line(visible=true, points={{85.0,0.0},{100.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(r3Gear2.flange_b,states.flange_a) annotation(Line(visible=true, points={{61.0,0.0},{65.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(integrator1.u,inPort_a_ref) annotation(Line(visible=true, points={{-96.0,0.0},{-119.0,0.0}}, color={0,0,255}));
            connect(k2.y,r3Control.w_ref) annotation(Line(visible=true, points={{-29.0,30.0},{-22.0,30.0},{-22.0,7.0},{-14.0,7.0}}, color={0,0,255}));
            connect(r3Motor.outPort_phi,r3Control.phi) annotation(Line(visible=true, points={{33.0,-10.0},{33.0,-30.0},{-10.0,-30.0},{-10.0,-12.0}}, color={0,0,255}));
            connect(r3Motor.outPort_w,r3Control.w) annotation(Line(visible=true, points={{30.0,-9.9},{30.0,-20.0},{5.0,-20.0},{5.0,-12.0}}, color={0,0,255}));
            connect(integrator1.y,k2.u) annotation(Line(visible=true, points={{-73.0,0.0},{-72.0,0.0},{-72.0,30.0},{-52.0,30.0}}, color={0,0,255}));
            connect(integrator2.y,k1.u) annotation(Line(visible=true, points={{-45.0,0.0},{-41.0,0.0}}, color={0,0,255}));
            connect(k1.y,r3Control.phi_ref) annotation(Line(visible=true, points={{-18.0,0.0},{-14.0,0.0}}, color={0,0,255}));
            connect(r3Motor.flange_motor,r3Gear2.flange_a) annotation(Line(visible=true, points={{35.0,0.0},{41.0,0.0}}, color={128,128,128}, thickness=0.5));
            connect(r3Control.i_ref,r3Motor.i_ref) annotation(Line(visible=true, points={{9.0,0.0},{13.05,0.0}}, color={0,0,255}));
            connect(integrator1.y,integrator2.u) annotation(Line(visible=true, points={{-73.0,0.0},{-68.0,0.0}}, color={0,0,255}));
            a_ref=inPort_a_ref;
            w_ref=integrator1.y;
            phi_ref=integrator2.y;
          end AxisType2;

          model MechanicalStructure "Model of the mechanical part of the r3 robot "
            parameter SI.Length loadSize[3]={0.125,0.05,0.05} "size of (steel) load box";
            SI.Angle q[6] "joint angles";
            SI.AngularVelocity qd[6] "joint speeds";
            SI.AngularAcceleration qdd[6] "joint accelerations";
            SI.Torque tau[6] "joint driving torques";
            annotation(Documentation(info="<HTML>
<p>
This model contains the mechanical components of the r3 robot
(multibody system) including animation information.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-200.0,200.0},{200.0,-200.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,200.0},{200.0,280.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,-190.0},{-140.0,-150.0}}, textString="1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,-70.0},{-140.0,-30.0}}, textString="3", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,-130.0},{-140.0,-90.0}}, textString="2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,50.0},{-140.0,90.0}}, textString="5", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,-12.0},{-140.0,28.0}}, textString="4", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-198.0,110.0},{-138.0,150.0}}, textString="6", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-24.0,-138.0},{-4.0,-118.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,0}, fillPattern=FillPattern.VerticalCylinder, extent={{-4.0,-118.0},{8.0,-18.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-24.0,-130.0},{-4.0,-124.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-24.0,-118.0},{-4.0,-98.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-18.0,-118.0},{-12.0,-98.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-24.0,-38.0},{-4.0,-18.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-18.0,-38.0},{-12.0,-18.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-24.0,-18.0},{-4.0,2.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-24.0,-10.0},{-4.0,-4.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,0}, fillPattern=FillPattern.VerticalCylinder, extent={{-20.0,2.0},{-8.0,82.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-24.0,82.0},{-4.0,102.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-18.0,82.0},{-12.0,102.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-24.0,102.0},{-4.0,122.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-24.0,110.0},{-4.0,116.0}})}), Diagram(coordinateSystem(extent={{-210.0,-220.0},{100.0,200.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1 annotation(Placement(visible=true, transformation(origin={-210.0,-170.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,-170.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2 annotation(Placement(visible=true, transformation(origin={-210.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis3 annotation(Placement(visible=true, transformation(origin={-210.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis4 annotation(Placement(visible=true, transformation(origin={-210.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis5 annotation(Placement(visible=true, transformation(origin={-210.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis6 annotation(Placement(visible=true, transformation(origin={-210.0,130.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-210.0,130.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Parts.InertialSystem inertial annotation(Placement(visible=true, transformation(origin={-90.0,-190.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            MultiBody.Joints.Revolute r1(n={0,1,0}) annotation(Placement(visible=true, transformation(origin={-70.0,-160.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
            Joints.Revolute r2(n={1,0,0}) annotation(Placement(visible=true, transformation(origin={-50.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Joints.Revolute r3(n={1,0,0}) annotation(Placement(visible=true, transformation(origin={-50.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
            MultiBody.Joints.Revolute r4(n={0,1,0}) annotation(Placement(visible=true, transformation(origin={-70.0,10.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
            Joints.Revolute r5(n={1,0,0}) annotation(Placement(visible=true, transformation(origin={-50.0,80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            MultiBody.Joints.Revolute r6(n={0,1,0}) annotation(Placement(visible=true, transformation(origin={-60.0,130.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
            MultiBody.Parts.Shape b0(Shape="cylinder", r0={0,-0.4,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=0.225, Width=0.3, Height=0.3, Material={0,0,1,1}) annotation(Placement(visible=true, transformation(origin={-40.0,-170.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
            MultiBody.Parts.ShapeBody b1(r={0,0,0}, I22=1.16, Shape="box", r0={0,-0.175,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=0.25, Width=0.15, Height=0.2, Material={1,0,0,0.5}) annotation(Placement(visible=true, transformation(origin={-70.0,-130.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
            MultiBody.Parts.ShapeBody b2(r={0,0.5,0}, rCM={0.172,0.205,0}, m=56.5, I11=2.58, I22=0.64, I33=2.73, I21=-0.46, Shape="beam", r0={0.15,0,0}, LengthDirection={0,1,0}, WidthDirection={0,0,1}, Length=0.5, Width=0.2, Height=0.15, Material={1,0.7,0,1}) annotation(Placement(visible=true, transformation(origin={-20.0,-70.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
            MultiBody.Parts.ShapeBody b3(r={0,0,0}, rCM={0.064,-0.034,0}, m=26.4, I11=0.279, I22=0.245, I33=0.413, I21=-0.07, Shape="box", r0={0,-0.075,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=0.15, Width=0.15, Height=0.15, Material={1,0,0,0.5}) annotation(Placement(visible=true, transformation(origin={-90.0,-10.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
            MultiBody.Parts.ShapeBody b4(r={0,0.73,0}, rCM={0,0.32,0}, m=28.7, I11=1.67, I22=0.081, I33=1.67, Shape="cylinder", r0={0,0.075,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=0.73, Width=0.1, Height=0.1, Material={1,0.7,0,1}) annotation(Placement(visible=true, transformation(origin={-70.0,50.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
            MultiBody.Parts.ShapeBody b5(r={0,0,0}, rCM={0,0.023,0}, m=5.2, I11=1.25, I22=0.81, I33=1.53, Shape="box", r0={0,-0.075,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=0.225, Width=0.075, Height=0.1, Material={0,0,1,0.5}) annotation(Placement(visible=true, transformation(origin={-20.0,90.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
            MultiBody.Parts.BoxBody load(r={0,0,0}, r0={0,0.15,0}, LengthDirection={0,1,0}, WidthDirection={1,0,0}, Length=loadSize[1], Width=loadSize[2], Height=loadSize[3], Material={1,0,0,0.5}) annotation(Placement(visible=true, transformation(origin={-60.0,170.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
          equation 
            connect(r1.frame_a,inertial.frame_b) annotation(Line(visible=true, points={{-70.0,-170.5},{-70.0,-190.0},{-79.5,-190.0}}, thickness=0.5));
            connect(r1.frame_b,b1.frame_a) annotation(Line(visible=true, points={{-70.0,-149.5},{-70.0,-140.5}}, thickness=0.5));
            connect(r1.axis,axis1) annotation(Line(visible=true, points={{-77.0,-160.0},{-152.0,-160.0},{-152.0,-170.0},{-210.0,-170.0}}, color={128,128,128}, thickness=0.5));
            connect(b1.frame_b,r2.frame_a) annotation(Line(visible=true, points={{-70.0,-119.5},{-70.0,-100.0},{-60.5,-100.0}}, thickness=0.5));
            connect(inertial.frame_b,b0.frame_a) annotation(Line(visible=true, points={{-79.5,-190.0},{-40.0,-190.0},{-40.0,-180.5}}, thickness=0.5));
            connect(r2.frame_b,b2.frame_a) annotation(Line(visible=true, points={{-39.5,-100.0},{-20.0,-100.0},{-20.0,-80.5}}, thickness=0.5));
            connect(b2.frame_b,r3.frame_a) annotation(Line(visible=true, points={{-20.0,-59.5},{-20.0,-30.0},{-39.5,-30.0}}, thickness=0.5));
            connect(r3.frame_b,b3.frame_a) annotation(Line(visible=true, points={{-60.5,-30.0},{-90.0,-30.0},{-90.0,-20.5}}, thickness=0.5));
            connect(r4.frame_b,b4.frame_a) annotation(Line(visible=true, points={{-70.0,20.5},{-70.0,39.5}}, thickness=0.5));
            connect(r3.frame_b,r4.frame_a) annotation(Line(visible=true, points={{-60.5,-30.0},{-70.0,-30.0},{-70.0,-0.5}}, thickness=0.5));
            connect(r4.axis,axis4) annotation(Line(visible=true, points={{-77.0,10.0},{-152.0,10.0},{-152.0,10.0},{-210.0,10.0}}, color={128,128,128}, thickness=0.5));
            connect(b4.frame_b,r5.frame_a) annotation(Line(visible=true, points={{-70.0,60.5},{-70.0,80.0},{-60.5,80.0}}, thickness=0.5));
            connect(r5.frame_b,b5.frame_a) annotation(Line(visible=true, points={{-39.5,80.0},{-22.0,80.0},{-20.0,79.5}}, thickness=0.5));
            connect(r6.frame_b,load.frame_a) annotation(Line(visible=true, points={{-60.0,140.5},{-60.0,159.5}}, thickness=0.5));
            connect(r5.frame_b,r6.frame_a) annotation(Line(visible=true, points={{-39.5,80.0},{-40.0,90.0},{-40.0,100.0},{-60.0,100.0},{-60.0,119.5}}, thickness=0.5));
            connect(r6.axis,axis6) annotation(Line(visible=true, origin={-138.5,130.0}, points={{71.5,0.0},{-71.5,0.0}}, color={128,128,128}, thickness=0.5));
            connect(r3.axis,axis3) annotation(Line(visible=true, points={{-50.0,-37.0},{-50.0,-50.0},{-210.0,-50.0}}, color={128,128,128}, thickness=0.5));
            connect(r5.axis,axis5) annotation(Line(visible=true, points={{-50.0,87.0},{-50.0,94.0},{-152.0,94.0},{-152.0,70.0},{-210.0,70.0}}, color={128,128,128}, thickness=0.5));
            connect(r2.axis,axis2) annotation(Line(visible=true, points={{-50.0,-93.0},{-50.0,-80.0},{-152.0,-80.0},{-152.0,-110.0},{-210.0,-110.0}}, color={128,128,128}, thickness=0.5));
            q={r1.q,r2.q,r3.q,r4.q,r5.q,r6.q};
            qd=der(q);
            qdd=der(qd);
            tau={r1.axis.tau,r2.axis.tau,r3.axis.tau,r4.axis.tau,r5.axis.tau,r6.axis.tau};
          end MechanicalStructure;

          model FullRobot "Complete model of Manutec r3 robot "
            parameter SI.Angle q0[6] "initial joint angles";
            output SI.Angle q_ref[6] "reference values of joint angles";
            output SI.AngularVelocity qd_ref[6] "reference values of joint speeds";
            output SI.AngularAcceleration qdd_ref[6] "reference values of joint accelerations";
            output SI.Angle eq[6] "control errors of joint angles";
            output SI.AngularVelocity eqd[6] "control errors of joint speeds";
            annotation(Documentation(info="<HTML>

<p>
Complete model of Mantuec r3 robot, including controller, motor, gearbox, 3D
mechanics model. The input connectors <b>a_refX</b> are the <b>reference
accelerations</b>, i.e., the desired accelerations, for the 6 joint axes. Via
parameter <b>q0</b> the initial joint angles are defined.

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100.0,90.0},{100.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,94.0},{100.0,154.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-20.0,56.0},{0.0,73.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-20.0,62.0},{0.0,68.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20.0,41.0},{0.0,56.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-14.0,42.0},{-7.0,56.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,0}, fillPattern=FillPattern.VerticalCylinder, extent={{-16.0,10.0},{-5.0,42.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,0}, fillPattern=FillPattern.VerticalCylinder, extent={{0.0,-69.0},{12.0,-7.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-20.0,-7.0},{0.0,10.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-20.0,-1.0},{0.0,5.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-14.0,-21.0},{-7.0,-7.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20.0,-22.0},{0.0,-7.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-14.0,-22.0},{-7.0,-8.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20.0,-69.0},{0.0,-54.0}}),Rectangle(visible=true, lineColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-14.0,-69.0},{-7.0,-55.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.VerticalCylinder, extent={{-20.0,-85.0},{0.0,-68.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-20.0,-79.0},{0.0,-73.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
            MechanicalStructure mechanics annotation(Placement(visible=true, transformation(origin={30.0,-20.0}, extent={{-70.0,-70.0},{70.0,70.0}}, rotation=0)));
            AxisType1 axis1(phi_ref0=q0[1]) annotation(Placement(visible=true, transformation(origin={-80.0,-80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            AxisType1 axis2(w=5500, i=210, c=8, cd=0.01, Rv0=0.5, Rv1=0.1/130, phi_ref0=q0[2]) annotation(Placement(visible=true, transformation(origin={-80.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            AxisType1 axis3(w=5500, i=60, c=58, cd=0.04, Rv0=0.7, Rv1=0.2/130, phi_ref0=q0[3]) annotation(Placement(visible=true, transformation(origin={-80.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            AxisType2 axis4(phi_ref0=q0[4]) annotation(Placement(visible=true, transformation(origin={-80.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            AxisType2 axis5(k=0.2608, J=0.00018, i=79.2, Rv0=30.1, Rv1=0.03, peak=39.6/30.1, phi_ref0=q0[5]) annotation(Placement(visible=true, transformation(origin={-80.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            AxisType2 axis6(k=0.0842, w=7400, D=0.27, J=4.3e-05, i=-99, Rv0=10.9, Rv1=3.92, peak=16.8/10.9, phi_ref0=q0[6]) annotation(Placement(visible=true, transformation(origin={-80.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref1 annotation(Placement(visible=true, transformation(origin={-105.0,-80.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,-80.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref2 annotation(Placement(visible=true, transformation(origin={-105.0,-50.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,-50.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref3 annotation(Placement(visible=true, transformation(origin={-105.0,-20.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,-20.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref4 annotation(Placement(visible=true, transformation(origin={-105.0,10.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,10.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref5 annotation(Placement(visible=true, transformation(origin={-105.0,40.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,40.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
            Modelica.Blocks.Interfaces.RealInput a_ref6 annotation(Placement(visible=true, transformation(origin={-105.0,70.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-105.0,70.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
          equation 
            connect(axis2.inPort_a_ref,a_ref2) annotation(Line(visible=true, points={{-92.0,-50.0},{-105.0,-50.0}}, color={0,0,255}));
            connect(axis3.inPort_a_ref,a_ref3) annotation(Line(visible=true, points={{-92.0,-20.0},{-105.0,-20.0}}, color={0,0,255}));
            connect(axis4.inPort_a_ref,a_ref4) annotation(Line(visible=true, points={{-91.9,10.0},{-105.0,10.0}}, color={0,0,255}));
            connect(axis5.inPort_a_ref,a_ref5) annotation(Line(visible=true, points={{-91.9,40.0},{-105.0,40.0}}, color={0,0,255}));
            connect(axis6.inPort_a_ref,a_ref6) annotation(Line(visible=true, points={{-91.9,70.0},{-105.0,70.0}}, color={0,0,255}));
            connect(axis1.inPort_a_ref,a_ref1) annotation(Line(visible=true, points={{-92.0,-80.0},{-105.0,-80.0}}, color={0,0,255}));
            connect(axis6.flange,mechanics.axis6) annotation(Line(visible=true, points={{-70.0,70.0},{-53.0,70.0},{-53.0,25.5},{-43.5,25.5}}, thickness=0.5));
            connect(axis5.flange,mechanics.axis5) annotation(Line(visible=true, points={{-70.0,40.0},{-57.0,40.0},{-57.0,4.5},{-43.5,4.5}}, thickness=0.5));
            connect(axis4.flange,mechanics.axis4) annotation(Line(visible=true, points={{-70.0,10.0},{-60.0,10.0},{-60.0,-16.5},{-43.5,-16.5}}, thickness=0.5));
            connect(axis3.flange,mechanics.axis3) annotation(Line(visible=true, points={{-70.0,-20.0},{-60.0,-20.0},{-60.0,-37.5},{-43.5,-37.5}}, thickness=0.5));
            connect(axis2.flange,mechanics.axis2) annotation(Line(visible=true, points={{-70.0,-50.0},{-60.0,-50.0},{-60.0,-58.5},{-43.5,-58.5}}, thickness=0.5));
            connect(axis1.flange,mechanics.axis1) annotation(Line(visible=true, points={{-70.0,-80.0},{-56.75,-80.0},{-56.75,-79.5},{-43.5,-79.5}}, thickness=0.5));
            q_ref={axis1.phi_ref,axis2.phi_ref,axis3.phi_ref,axis4.phi_ref,axis5.phi_ref,axis6.phi_ref};
            qd_ref={axis1.w_ref,axis2.w_ref,axis3.w_ref,axis4.w_ref,axis5.w_ref,axis6.w_ref};
            qdd_ref={a_ref1,a_ref2,a_ref3,a_ref4,a_ref5,a_ref6};
            eq=q_ref - mechanics.q;
            eqd=qd_ref - mechanics.qd;
          end FullRobot;

          annotation(Documentation(info="", revisions=""));
        end Components;

      end r3;

    end Robots;

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

    model BoxBody "Rigid body with box shape (also used for animation)"
      extends Interfaces.TwoTreeFrames;
      parameter SI.Position r[3]={0.1,0,0} "Vector from frame_a to frame_b, resolved in frame_a";
      parameter SI.Position r0[3]={0,0,0} "Vector from frame_a to left box plane, resolved in frame_a";
      parameter SI.Position LengthDirection[3]=r - r0 "Vector in length direction, resolved in frame_a";
      parameter SI.Position WidthDirection[3]={0,1,0} "Vector in width direction, resolved in frame_a";
      parameter SI.Length Length=sqrt((r - r0)*(r - r0)) "Length of box";
      parameter SI.Length Width=0.1 "Width of box";
      parameter SI.Length Height=0.1 "Height of box";
      parameter SI.Length InnerWidth=0 "Width of inner box surface";
      parameter SI.Length InnerHeight=0 "Height of inner box surface";
      parameter Real rho=7.7 "Density of box material [g/cm^3]";
      parameter Real Material[4]={1,0,0,0.5} "Color and specular coefficient";
      SI.Mass mo;
      SI.Mass mi;
      Real Sbox[3,3];
      SI.Length l;
      SI.Length w;
      SI.Length h;
      SI.Length wi;
      SI.Length hi;
      annotation(Documentation(info="<html>

<p>
Rigid body with  box  shape. The mass properties of the body are computed
from the box data. Optionally, the box may be hollow.
The (outer) box shape is automatically used in animation.

<p>
Parameter vectors are defined with respect to frame_a in [m].

<pre>
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
  rho        : Density of material in [g/cm^3], e.g.,
                    steel: 7.7 .. 7.9
                    wood : 0.4 .. 0.8
  Material[4]: = {r, g, b, specular}.
               Color and specular coefficient of the box.
               [r,g,b] affects the color of diffuse and ambient reflected
               light. Specular is a coefficient defining white specular
               reflection. What color that is reflected also depends on the
               color of the light sources. Note, r g, b and specular are
               given in the range 0-1. Specular=1 gives a metallic
               appearance.
</pre>

</html>", revisions=""), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-90.0,-15.0},{-50.0,15.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={191,95,0}, fillPattern=FillPattern.Solid, extent={{-50.0,-45.0},{30.0,35.0}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, points={{-50.0,35.0},{-30.0,55.0},{50.0,55.0},{30.0,35.0},{-50.0,35.0}}),Polygon(visible=true, lineColor={255,255,255}, fillColor={127,127,255}, fillPattern=FillPattern.Solid, points={{50.0,55.0},{50.0,-25.0},{30.0,-45.0},{30.0,35.0},{50.0,55.0}}),Rectangle(visible=true, fillColor={127,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{40.0,-15.0},{90.0,15.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,68.0},{100.0,130.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-99.0,-100.0},{99.0,-60.0}}, textString="r=%r", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      VisualShape box(Shape="box", r0=r0, LengthDirection=LengthDirection, WidthDirection=WidthDirection, Length=Length, Width=Width, Height=Height, Material=Material) annotation(extent=[-20,40;40,100]);
      FrameTranslation frameTranslation(r=r) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-60.0,-30.0},{60.0,30.0}}, rotation=0)));
      Interfaces.BodyBase body annotation(Placement(visible=true, transformation(origin={4.0,-77.0}, extent={{-29.0,-30.0},{29.0,30.0}}, rotation=0)));
    equation 
      connect(frameTranslation.frame_b,frame_b) annotation(Line(visible=true, origin={84.0,0.0}, points={{-21.0,0.0},{21.0,0.0}}, color={0,0,255}));
      connect(frame_a,frameTranslation.frame_a) annotation(Line(visible=true, origin={-84.0,0.0}, points={{-21.0,0.0},{21.0,0.0}}, color={0,0,255}));
      connect(body.frame_a,frame_a) annotation(Line(visible=true, points={{-26.45,-77.0},{-105.0,0.0}}, color={0,0,255}));
      box.S=Sa;
      box.r=r0a;
      box.Sshape=Sbox;
      l=Length;
      w=Width;
      h=Height;
      wi=InnerWidth;
      hi=InnerHeight;
      mo=1000*rho*l*w*h "Mass properties of box";
      mi=1000*rho*l*wi*hi;
      body.m=mo - mi;
      body.rCM=r0 + l/2*box.nLength;
      body.I=Sbox*diagonal({mo*(w*w + h*h) - mi*(wi*wi + hi*hi),mo*(l*l + h*h) - mi*(l*l + hi*hi),mo*(l*l + w*w) - mi*(l*l + wi*wi)}/12)*transpose(Sbox);
    end BoxBody;

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
model MultiBody_Examples_Robots_r3_robot
  extends MultiBody.Examples.Robots.r3.robot;
end MultiBody_Examples_Robots_r3_robot;
