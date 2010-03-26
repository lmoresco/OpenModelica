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
    function sin "sine"
      extends baseIcon1;
      input SI.Angle u;
      output Real y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, smooth=true, color={0,0,0}),Text(extent={{12,84},{84,36}}, textString="sin", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{84,0}}, color={192,192,192}),Polygon(points={{100,0},{84,6},{84,-6},{100,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, smooth=true, color={0,0,0}),Text(extent={{-105,72},{-85,88}}, textString="1"),Text(extent={{70,25},{90,5}}, textString="2*pi"),Text(extent={{-105,-72},{-85,-88}}, textString="-1"),Text(extent={{92,-2},{112,-22}}, textString="u", fillColor={160,160,160})}), Documentation(info="<html>
 
</html>"));

      external "C" y=sin(u) ;

    end sin;

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

    partial function baseIcon1 "Basic icon for mathematical function with y-axis on left side"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,80},{-88,80}}, color={192,192,192}),Line(points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Text(extent={{-75,110},{-55,90}}, textString="y", fillColor={160,160,160}),Polygon(points={{-80,100},{-86,84},{-74,84},{-80,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name")}));
    end baseIcon1;

    partial function baseIcon2 "Basic icon for mathematical function with y-axis in middle"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{0,80},{-8,80}}, color={192,192,192}),Line(points={{0,-80},{-8,-80}}, color={192,192,192}),Line(points={{0,-90},{0,84}}, color={192,192,192}),Text(extent={{5,110},{25,90}}, textString="y", fillColor={160,160,160}),Polygon(points={{0,100},{-6,84},{6,84},{0,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name")}));
    end baseIcon2;

  end Math;

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
      block Sine "Generate sine signal"
        parameter Real amplitude=1 "Amplitude of sine wave";
        parameter SIunits.Frequency freqHz=1 "Frequency of sine wave";
        parameter SIunits.Angle phase=0 "Phase of sine wave";
        parameter Real offset=0 "Offset of output signal";
        parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
        extends Interfaces.SO;
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{101,-40},{85,-34},{85,-46},{101,-40}}),Line(visible=true, points={{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.2,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, thickness=0.5, smooth=true),Line(visible=true, points={{-41,-2},{-80,-2}}, thickness=0.5),Text(visible=true, fillColor={160,160,160}, extent={{-128,-11},{-82,7}}, textString="offset"),Line(visible=true, points={{-41,-2},{-41,-40}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, fillColor={160,160,160}, extent={{-60,-61},{-14,-43}}, textString="startTime"),Text(visible=true, fillColor={160,160,160}, extent={{84,-72},{108,-52}}, textString="time"),Text(visible=true, fillColor={160,160,160}, extent={{-74,86},{-33,106}}, textString="y"),Line(visible=true, points={{-9,79},{43,79}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-42,-1},{50,0}}, color={192,192,192}, pattern=LinePattern.Dot),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,80},{30,67},{37,67},{33,80}}),Text(visible=true, fillColor={160,160,160}, extent={{37,39},{83,57}}, textString="amplitude"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,1},{30,14},{36,14},{33,1},{33,1}}),Line(visible=true, points={{33,79},{33,0}}, color={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, smooth=true),Text(visible=true, extent={{-147,-152},{153,-112}}, textString="freqHz=%freqHz")}));
      protected 
        constant Real pi=Modelica.Constants.pi;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,0}),Text(extent={{-147,-152},{153,-112}}, textString="freqHz=%freqHz", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(points={{-80,100},{-86,84},{-74,84},{-80,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(points={{101,-40},{85,-34},{85,-46},{101,-40}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{-41,-2},{-80,-2}}, color={0,0,0}, thickness=0.5),Text(extent={{-128,7},{-82,-11}}, textString="offset", fillColor={160,160,160}),Line(points={{-41,-2},{-41,-40}}, color={192,192,192}, pattern=LinePattern.Dash),Text(extent={{-60,-43},{-14,-61}}, textString="startTime", fillColor={160,160,160}),Text(extent={{84,-52},{108,-72}}, textString="time", fillColor={160,160,160}),Text(extent={{-74,106},{-33,86}}, textString="y", fillColor={160,160,160}),Line(points={{-9,79},{43,79}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-42,-1},{50,0}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{33,80},{30,67},{37,67},{33,80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{37,57},{83,39}}, textString="amplitude", fillColor={160,160,160}),Polygon(points={{33,1},{30,14},{36,14},{33,1},{33,1}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{33,79},{33,0}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None})}), Documentation(info="<html>

</html>"));
      equation 
        y=offset + (if time < startTime then 0 else amplitude*Modelica.Math.sin(2*pi*freqHz*(time - startTime) + phase));
      end Sine;

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
</html>"), Icon(coordinateSystem(extent={{100,-100},{-100,100}})), Diagram(coordinateSystem(extent={{0,0},{446,493}})));
      block Gain "Output the product of a gain value with the input signal"
        parameter Real k=1 "Gain value multiplied with input signal";
      public 
        Interfaces.RealInput u "Input signal connector" annotation(Placement(transformation(x=-120.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-120.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Interfaces.RealOutput y "Output signal connector" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
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
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,-100},{-100,100},{100,0},{-100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(extent={{-150,-140},{150,-100}}, textString="k=%k", fillColor={0,0,0}),Text(extent={{-150,140},{150,100}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,-100},{-100,100},{100,0},{-100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(extent={{-76,38},{0,-34}}, textString="k")}));
      equation 
        y=k*u;
      end Gain;

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

      connector RealInput= input RealSignal "'input Real' as connector" annotation(defaultComponentName="u", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,127}, fillColor={0,0,127})}), Diagram(coordinateSystem(scale=0.2, extent={{-100,-100},{100,100}}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}}, fillPattern=FillPattern.Solid, lineColor={0,0,127}, fillColor={0,0,127}),Text(extent={{-120,105},{100,60}}, textString="%name", fillColor={0,0,127})}), Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));
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

      partial block SISO "Single Input Single Output continuous control block"
        extends BlockIcon;
        RealInput u "Connector of Real input signal" annotation(Placement(transformation(x=-120.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-120.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        RealOutput y "Connector of Real output signal" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        annotation(Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Real output signal.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
      end SISO;

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
    type Area= Real(final quantity="Area", final unit="m2");
    type Time= Real(final quantity="Time", final unit="s");
    type Velocity= Real(final quantity="Velocity", final unit="m/s");
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2");
    type Frequency= Real(final quantity="Frequency", final unit="Hz");
    type ThermodynamicTemperature= Real(final quantity="ThermodynamicTemperature", final unit="K", min=0, displayUnit="degC");
    type Temperature= ThermodynamicTemperature;
    type Entropy= Real(final quantity="Entropy", final unit="J/K");
    type ElectricCurrent= Real(final quantity="ElectricCurrent", final unit="A");
    type Current= ElectricCurrent;
    type ElectricCharge= Real(final quantity="ElectricCharge", final unit="C");
    type ElectricFieldStrength= Real(final quantity="ElectricFieldStrength", final unit="V/m");
    type ElectricPotential= Real(final quantity="ElectricPotential", final unit="V");
    type Voltage= ElectricPotential;
    type Capacitance= Real(final quantity="Capacitance", final unit="F", min=0);
    type Permittivity= Real(final quantity="Permittivity", final unit="F/m", min=0);
    type CurrentDensity= Real(final quantity="CurrentDensity", final unit="A/m2");
    type Inductance= Real(final quantity="Inductance", final unit="H");
    type Resistance= Real(final quantity="Resistance", final unit="Ohm");
    type Conductance= Real(final quantity="Conductance", final unit="S");
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




package BondLib "Modelica library for Bond Graph modeling"
  extends Modelica.Icons.Library;
  annotation(Documentation(info="<html>
The <b>BondLib</b> library is designed as a graphical library for modeling physical systems using the bond graph metaphor.  This library has been created by Prof. Fran&ccedil;ois Cellier and his students.<p>

When modeling systems in this fashion, it is common to hide many connections behind the bondgraphic connectors.  To this end, one first places neighboring connected elements next to each other <br>
<img src=\"Images/BG_Fig1.png\"> <br>
making the connection between the connectors.  The two models are then shifted together, until the two connectors are in the same position on the screen <br>
<img src=\"Images/BG_Fig2.png\"> <br>
thereby hiding the connection from view. <p>

Bond graphs are described in terms of four basic variables: <p>

<ol>
<li> efforts (<b>e</b>), <br>
<li> flows (<b>f</b>), <br>
<li> generalized momentums (<b>p</b>), and <br>
<li> generalized positions (<b>q</b>).
</ol> <p>

The four variables are related to each other in the following fashion: <br>
<img src=\"Images/BG_Fig3.png\"> <p>

Power is always the product of effort and flow: <br>
<b>P = e*f</b> <p>

The three basic OnePort elements of the bond graph methodology are: <p>

<ol>
<li> resistors (<b>R</b>): <b>e = R(f)</b>, <br>
<li> capacitors (<b>C</b>): <b>e = C(q)</b>, and <br>
<li> inductors (<b>I</b>): <b>f = I(p)</b>,
</ol> <p>

where <b>R</b>, <b>C</b>, and <b>I</b> can be arbitrarily non-linear functions operating in the first and third quadrants only. <p>

Bond graphs are domain independent.  The four basic variables of a number of physical domains are summarized below: <br>
<img src=\"Images/BG_Fig4.png\"> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Cellier, F.E. (1992), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/HierarchBG.pdf\">Hierarchical Non-linear
     Bond Graphs: A Unified Methodology for Modeling Complex Physical Systems</a>,\" <i>Simulation</i>, <b>58</b>(4),
     pp. 230-248.
<li> Cellier, F.E. (1995), \"Bond Graphs: The Right Choice for Educating Students in Modeling Continuous-time Physical
     Systems,\" <i>Simulation</i>, <b>64</b>(3), pp. 154-159.
<li> Cellier, F.E. and R.T. McBride (2003), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/icbgm03_bglib.pdf\">Object-oriented
     Modeling of Complex Physical Systems Using the Dymola Bond-graph Library</a>,\" <i>Proc. ICBGM'03,
     6<sup>th</sup> SCS Intl. Conf. on Bond Graph Modeling and Simulation</i>, Orlando, Florida, pp. 157-162.
<li> Cellier, F.E. and A. Nebot (2005), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/modelica2005_cellier.pdf\">The
     Modelica Bond Graph Library</a>,\" <i>Proc. 4<sup>th</sup> Modelica Conference</i>, Hamburg, Germany.
</ol> <p>

<hr>

<b>Main Author:</b> <p>

Prof. Dr. Fran&ccedil;ois E. Cellier <br>
Institut f&uuml;r Computational Science <br>
ETH Z&uuml;rich <br>
ETH Zentrum CAB G82.1 <br>
CH-8092 Z&uuml;rich <br>
Switzerland <p>

Phone: +41(1)632-7474 <br>
Fax: +41(1)632-1374 <br>
Email: <a href=\"mailto:FCellier@Inf.ETHZ.CH\"> FCellier@Inf.ETHZ.CH</a> <br>
URL: <a href=\"http://www.inf.ethz.ch/~fcellier/\"> http://www.inf.ethz.ch/~fcellier/</a> <p>

<hr>

<b>Release Notes:</b> <p>

<ul>
<li>Version 1.0: February 10, 2005 <br>
<li>Version 1.1: June 21, 2005 <br>
<li>Version 1.2: November 21, 2005 <br>
<li>Version 1.3: December 13, 2006 <br>
<li>Version 2.0: July 18, 2007 <br>
<li>Version 2.1: August 2, 2007
<li>Version 2.2: August 30, 2007
</ul> <p>

<hr>

<b>Copyright (C) 2005-2007, Fran&ccedil;ois E. Cellier.</b> <p>

<i>The ModelicaAdditions.BondLib package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i>
</html>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-60,68},{52,46}}, fillColor={0,0,0}, lineThickness=0.5, textString="The bond graph"),Text(lineColor={0,0,255}, extent={{-73.9,15.05},{68,-14}}, fillColor={0,0,0}, lineThickness=0.5, textString="domain independent"),Text(lineColor={0,0,255}, extent={{-55.8,34.1},{54,4}}, fillColor={0,0,0}, lineThickness=0.5, textString="offers a uniform, "),Text(lineColor={0,0,255}, extent={{-47.7,-8.85},{38,-26}}, fillColor={0,0,0}, lineThickness=0.5, textString="interface to"),Text(lineColor={0,0,255}, extent={{-79.6,-19.8},{82,-50}}, fillColor={0,0,0}, lineThickness=0.5, textString="physical system modeling."),Text(lineColor={0,0,255}, extent={{-45.9,51.05},{40,24}}, fillColor={0,0,0}, lineThickness=0.5, textString="methodology")}), uses(Modelica(version="2.2.1")), version="2.2", conversion(from(version="", script="ConvertFromBondLib_.mos"), noneFromVersion="2.0"));
  package Interfaces "Connectors and partial models for Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains the three basic bond graph connectors as well as some partial models that invoke them. <p>

The <b>BondCon</b> connector is the basic bi-directional bondgraphic connector that is used always.  The <b>eBondCon</b> and <b>fBondCon</b> connectors are uni-directional connectors that are only used in the definitions of the two causal bonds.
</html>
"));
    connector BondCon "Bi-directional bondgraphic connector"
      Real e "Bondgraphic effort variable";
      Real f "Bondgraphic flow variable";
      Real d "Directional variable";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Documentation(info="<html>
This is the basic bi-directional bondgraphic connector that is used everywhere, except in the definitions of the two causal bonds. <p>

The bondgraphic connector references three variables, two of which are physical variables, whereas the third one is a topological variable.  All three are defined as potential variables. <p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable

 d:  Directional variable indicating the direction of positive power flow
</pre>
</html>
"));
    end BondCon;

    connector eBondCon "Uni-directional bondgraphic connector"
      input Real e "Bondgraphic effort variable";
      output Real f "Bondgraphic flow variable";
      output Real d "Direction variable";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(lineColor={0,0,255}, extent={{-34,34},{38,-28}}, textString="e", fillColor={255,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(lineColor={0,0,255}, extent={{-34,34},{38,-28}}, textString="e", fillColor={255,0,0})}), Documentation(info="<html>
This is one of two uni-directional bondgraphic connectors used in the definitions of the two causal bonds. <p>

The bondgraphic connectors reference three variables, two of which are physical variables, whereas the third one is a topological variable.  All three are defined as potential variables. <p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable (input)

 f:  Bondgraphic flow variable (output)

 d:  Directional variable indicating the direction of positive power flow (output)
</pre>
</html>
"));
    end eBondCon;

    connector fBondCon "Uni-directional bondgraphic connector"
      output Real e "Bondgraphic effort variable";
      input Real f "Bondgraphic flow variable";
      output Real d "Direction variable";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(lineColor={0,0,255}, extent={{-36,38},{36,-34}}, textString="f", fillColor={255,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(lineColor={0,0,255}, extent={{-36,38},{36,-34}}, textString="f", fillColor={255,0,0})}), Documentation(info="<html>
This is one of two uni-directional bondgraphic connectors used in the definitions of the two causal bonds. <p>

The bondgraphic connectors reference three variables, two of which are physical variables, whereas the third one is a topological variable.  All three are defined as potential variables. <p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable (output)

 f:  Bondgraphic flow variable (input)

 d:  Directional variable indicating the direction of positive power flow (output)
</pre>
</html>
"));
    end fBondCon;

    partial model PassiveOnePort "Partial model invoking one bondgraphic connector"
      Real e "Bondgraphic effort";
      Real f "Bondgraphic flow";
      annotation(Diagram, Icon, Documentation(info="<html>
This is a partial model invoking a single bondgraphic connector.  It is used to describe passive OnePort elements.<p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows into the model
</pre>
</html>
"));
      BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e=BondCon1.e;
      f=BondCon1.d*BondCon1.f;
    end PassiveOnePort;

    partial model ModPassiveOnePort "Partial model invoking one bondgraphic connector and one signal connector"
      Real e "Bondgraphic effort";
      Real f "Bondgraphic flow";
      annotation(Documentation(info="<html>
This is a partial model invoking a single bondgraphic connector and a signal connector.  It is used to describe passive modulated OnePort elements.<p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows into the model

 s:  Real-valued signal input used for modulation
</pre>
</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Modelica.Blocks.Interfaces.RealInput s "Signal input" annotation(Placement(visible=true, transformation(x=90, y=0, scale=0.1, flipHorizontal=true, rotation=-360), iconTransformation(x=90, y=0, scale=0.1, flipHorizontal=true, rotation=-360)));
    equation 
      e=BondCon1.e;
      f=BondCon1.d*BondCon1.f;
    end ModPassiveOnePort;

    partial model ActiveOnePort "Partial model invoking one bondgraphic connector"
      Real e "Bondgraphic effort";
      Real f "Bondgraphic flow";
      annotation(Diagram, Icon, Documentation(info="<html>
This is a partial model invoking a single bondgraphic connector.  It is used to describe active OnePort elements.<p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows out of the model
</pre>
</html>
"));
      BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e=BondCon1.e;
      f=-BondCon1.d*BondCon1.f;
    end ActiveOnePort;

    partial model ModActiveOnePort
      Real e "Bondgraphic effort";
      Real f "Bondgraphic flow";
      annotation(Diagram);
      BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Modelica.Blocks.Interfaces.RealInput s "Signal input" annotation(Placement(transformation(x=90.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false), iconTransformation(x=90.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
    equation 
      e=BondCon1.e;
      f=-BondCon1.d*BondCon1.f;
    end ModActiveOnePort;

    partial model TwoPort "Partial model invoking two bondgraphic connectors"
      Real e1 "Bondgraphic primary effort";
      Real f1 "Bondgraphic primary flow";
      Real e2 "Bondgraphic secondary effort";
      Real f2 "Bondgraphic secondary flow";
      annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{42,-44},{68,-50},{42,-56}}, color={0,0,0}),Line(points={{-70,-50},{68,-50}}, color={0,0,0})}), Documentation(info="<html>
This is a partial model invoking two bondgraphic connectors.  It is used to describe directed TwoPort elements.  Positive flow is from inflow to outflow.  The direction of positive flow is indicated by an arrow. <p>

<pre>
Potential variables:

 e1:  Bondgraphic effort variable of inflow

 f1:  Bondgraphic flow variable of inflow, normalized positive for flows into the model

 e2:  Bondgraphic effort variable of outflow

 f2:  Bondgraphic flow variable of outflow, normalized positive for flows out of the model
</pre>

</html>
"));
      BondLib.Interfaces.BondCon BondCon1 "Left bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Right bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e1=BondCon1.e;
      f1=BondCon1.d*BondCon1.f;
      e2=BondCon2.e;
      f2=-BondCon2.d*BondCon2.f;
    end TwoPort;

    partial model TwoPortZero "Partial model invoking two bondgraphic connectors"
      Real e1 "Bondgraphic primary effort";
      Real f1 "Bondgraphic primary flow";
      Real e2 "Bondgraphic secondary effort";
      Real f2 "Bondgraphic secondary flow";
      annotation(Documentation(info="<html>
This is a partial model invoking two bondgraphic connectors.  It is used only for the description of the TwoPort 0-junction. <p>

<pre>
Potential variables:

 e1:  Bondgraphic effort variable of first connector

 f1:  Bondgraphic flow variable of first connector, normalized positive for flows into the model

 e2:  Bondgraphic effort variable of second connector

 f2:  Bondgraphic flow variable of second connector, normalized positive for flows into the model
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e1=BondCon1.e;
      f1=BondCon1.d*BondCon1.f;
      e2=BondCon2.e;
      f2=BondCon2.d*BondCon2.f;
    end TwoPortZero;

    partial model ModTwoPort "Partial model invoking two bondgraphic connectors and one signal connector"
      Real e1 "Bondgraphic primary effort";
      Real f1 "Bondgraphic primary flow";
      Real e2 "Bondgraphic secondary effort";
      Real f2 "Bondgraphic secondary flow";
      annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-70,-50},{68,-50}}, color={0,0,0}),Line(points={{42,-44},{68,-50},{42,-56}}, color={0,0,0})}), Documentation(info="<html>
This is a partial model invoking two bondgraphic connectors and a signal connector.  It is used to describe modulated directed TwoPort elements.  Positive flow is from inflow to outflow.  The direction of positive flow is indicated by an arrow. <p>

<pre>
Potential variables:

 e1:  Bondgraphic effort variable of inflow

 f1:  Bondgraphic flow variable of inflow, normalized positive for flows into the model

 e2:  Bondgraphic effort variable of outflow

 f2:  Bondgraphic flow variable of outflow, normalized positive for flows out of the model

 s:   Real-valued signal input used for modulation
</pre>

</html>
"));
      BondLib.Interfaces.BondCon BondCon1 "Left bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Right bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Modelica.Blocks.Interfaces.RealInput s "Signal input" annotation(Placement(transformation(x=0.0, y=-90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0), iconTransformation(x=0.0, y=-90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
    equation 
      e1=BondCon1.e;
      f1=BondCon1.d*BondCon1.f;
      e2=BondCon2.e;
      f2=-BondCon2.d*BondCon2.f;
    end ModTwoPort;

    partial model ThreePortZero "Partial model invoking three bondgraphic connectors"
      Real e[3] "Bondgraphic effort vector";
      Real f[3] "Bondgraphic flow vector";
      annotation(Documentation(info="<html>
This is a partial model invoking three bondgraphic connectors.  It is used only for the description of the ThreePort 0-junction. <p>

<pre>
Potential variables:

 e[3]:  Vector of bondgraphic effort variables of connectors

 f[3]:  Vector of bondgraphic flow variables of connectors, normalized positive for flows into the model
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon3 "Third bond graph connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e[1]=BondCon1.e;
      f[1]=BondCon1.d*BondCon1.f;
      e[2]=BondCon2.e;
      f[2]=BondCon2.d*BondCon2.f;
      e[3]=BondCon3.e;
      f[3]=BondCon3.d*BondCon3.f;
    end ThreePortZero;

    partial model ThreePortOne "Partial model invoking three bondgraphic connectors"
      Real e[3] "Bondgraphic effort vector";
      Real f[3] "Bondgraphic flow vector";
      annotation(Documentation(info="<html>
This is a partial model invoking three bondgraphic connectors.  It is used only for the description of the ThreePort 1-junction. <p>

<pre>
Potential variables:

 e[3]:  Vector of bondgraphic effort variables of connectors, normalized positive for flows into the model

 f[3]:  Vector of bondgraphic flow variables of connectors
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon3 "Third bond graph connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e[1]=BondCon1.d*BondCon1.e;
      f[1]=BondCon1.f;
      e[2]=BondCon2.d*BondCon2.e;
      f[2]=BondCon2.f;
      e[3]=BondCon3.d*BondCon3.e;
      f[3]=BondCon3.f;
    end ThreePortOne;

    partial model FourPortZero "Partial model invoking four bondgraphic connectors"
      Real e[4] "Bondgraphic effort vector";
      Real f[4] "Bondgraphic flow vector";
      annotation(Documentation(info="<html>
This is a partial model invoking four bondgraphic connectors.  It is used only for the description of the FourPort 0-junction. <p>

<pre>
Potential variables:

 e[4]:  Vector of bondgraphic effort variables of connectors

 f[4]:  Vector of bondgraphic flow variables of connectors, normalized positive for flows into the model
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon3 "Third bond graph connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon4 "Fourth bond graph connector" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e[1]=BondCon1.e;
      f[1]=BondCon1.d*BondCon1.f;
      e[2]=BondCon2.e;
      f[2]=BondCon2.d*BondCon2.f;
      e[3]=BondCon3.e;
      f[3]=BondCon3.d*BondCon3.f;
      e[4]=BondCon4.e;
      f[4]=BondCon4.d*BondCon4.f;
    end FourPortZero;

    partial model FourPortOne "Partial model invoking four bondgraphic connectors"
      Real e[4] "Bondgraphic effort vector";
      Real f[4] "Bondgraphic flow vector";
      annotation(Documentation(info="<html>
This is a partial model invoking four bondgraphic connectors.  It is used only for the description of the FourPort 1-junction. <p>

<pre>
Potential variables:

 e[4]:  Vector of bondgraphic effort variables of connectors, normalized positive for flows into the model

 f[4]:  Vector of bondgraphic flow variables of connectors
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon3 "Third bond graph connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon4 "Fourth bond graph connector" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e[1]=BondCon1.d*BondCon1.e;
      f[1]=BondCon1.f;
      e[2]=BondCon2.d*BondCon2.e;
      f[2]=BondCon2.f;
      e[3]=BondCon3.d*BondCon3.e;
      f[3]=BondCon3.f;
      e[4]=BondCon4.d*BondCon4.e;
      f[4]=BondCon4.f;
    end FourPortOne;

    partial model FivePortZero "Partial model invoking five bondgraphic connectors"
      Real e[5] "Bondgraphic effort vector";
      Real f[5] "Bondgraphic flow vector";
      annotation(Documentation(info="<html>
This is a partial model invoking five bondgraphic connectors.  It is used only for the description of the FivePort 0-junction. <p>

<pre>
Potential variables:

 e[5]:  Vector of bondgraphic effort variables of connectors

 f[5]:  Vector of bondgraphic flow variables of connectors, normalized positive for flows into the model
</pre>

</html>
"), Diagram);
      BondLib.Interfaces.BondCon BondCon1 "First bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon2 "Second bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon3 "Third bond graph connector" annotation(Placement(transformation(x=-40.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-40.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon4 "Fourth bond graph connector" annotation(Placement(transformation(x=40.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=40.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      BondLib.Interfaces.BondCon BondCon5 "Fifth bond graph connector" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e[1]=BondCon1.e;
      f[1]=BondCon1.d*BondCon1.f;
      e[2]=BondCon2.e;
      f[2]=BondCon2.d*BondCon2.f;
      e[3]=BondCon3.e;
      f[3]=BondCon3.d*BondCon3.f;
      e[4]=BondCon4.e;
      f[4]=BondCon4.d*BondCon4.f;
      e[5]=BondCon5.e;
      f[5]=BondCon5.d*BondCon5.f;
    end FivePortZero;

  end Interfaces;

  package Bonds "Bonds of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains models of the three bonds of the Modelica bond graph library.  The <b>Bond</b> model describes the a-causal bonds, whereas the <b>eBond</b> and <b>fBond</b> blocks describe the two causal bonds. <p>

Although it is possible to work with a-causal bonds throughout, it is recommended to use causal bonds whenever possible. <p>

Bonds must be connected to either elements or junctions.  It is illegal to connect two bonds in series.
</html>
"));
    model Bond "The a-causal bond model of the bond graph library"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-40,-8},{20,-40}}, textString="f", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-40,40},{18,10}}, textString="e", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-70,-4},{72,-42}}, textString="%name", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the general a-causal bond of the Modelica bond graph library. <p>

The model invokes two general bond connectors.  It does so directly, i.e., without inheriting them from one of the TwoPort partial models. <p>

The Model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>
"));
      Interfaces.BondCon BondCon1 "Left bond graph connector" annotation(Placement(transformation(x=-98.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-98.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Interfaces.BondCon BondCon2 "Right bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      BondCon2.e=BondCon1.e;
      BondCon2.f=BondCon1.f;
      BondCon1.d=-1;
      BondCon2.d=+1;
    end Bond;

    block eBond "One of two causal bond models of the bond graph library"
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Line(points={{-80,40},{-80,-40}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-68,-4},{64,-42}}, textString="%name", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Line(points={{-80,40},{-80,-40}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-38,42},{20,12}}, textString="e", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-40,-8},{20,-40}}, textString="f", fillColor={0,0,0}),Line(points={{4,-24},{34,-24}}, color={0,0,0}, thickness=0.5, arrow={Arrow.None,Arrow.Filled}),Line(points={{-24,24},{-56,24}}, color={0,0,0}, thickness=0.5, arrow={Arrow.None,Arrow.Filled})}), Documentation(info="<html>
This is the model of one of two causal bonds of the Modelica bond graph library. <p>

The model invokes one <b>fBond</b> and one <b>eBond</b> connector.  The <b>fBond</b> connector is used at the inflow, i.e., where the flow variable is being computed, whereas the <b>eBond</b> connector is used at the outflow, i.e., where the effort variable is being computed. Thus, the causality stroke of this causal bond is at the inflow. <p>

The model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>
"));
      Interfaces.fBondCon fBondCon1 "Left bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Interfaces.eBondCon eBondCon1 "Right bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      fBondCon1.e=eBondCon1.e;
      eBondCon1.f=fBondCon1.f;
      fBondCon1.d=-1;
      eBondCon1.d=+1;
    end eBond;

    block fBond "One of two causal bond models of the bond graph library"
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-40,-8},{20,-40}}, textString="f", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-38,42},{20,12}}, textString="e", fillColor={0,0,0}),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Line(points={{80,40},{80,-40}}, color={0,0,0}, thickness=0.5),Line(points={{-22,-24},{-54,-24}}, color={0,0,0}, thickness=0.5, arrow={Arrow.None,Arrow.Filled}),Line(points={{2,26},{32,26}}, color={0,0,0}, thickness=0.5, arrow={Arrow.None,Arrow.Filled})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{80,0},{40,40}}, color={0,0,0}, thickness=0.5),Line(points={{80,40},{80,-40}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-66,-4},{62,-44}}, textString="%name", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of one of two causal bonds of the Modelica bond graph library. <p>

The model invokes one <b>eBond</b> and one <b>fBond</b> connector.  The <b>eBond</b> connector is used at the inflow, i.e., where the effort variable is being computed, whereas the <b>fBond</b> connector is used at the outflow, i.e., where the flow variable is being computed. Thus, the causality stroke of this causal bond is at the outflow. <p>

The model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>
"));
      Interfaces.eBondCon eBondCon1 "Left bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Interfaces.fBondCon fBondCon1 "Right bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      fBondCon1.e=eBondCon1.e;
      eBondCon1.f=fBondCon1.f;
      eBondCon1.d=-1;
      fBondCon1.d=+1;
    end fBond;

  end Bonds;

  package Junctions "Junctions of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains models of the different junctions of the Modelica bond graph library.  The library distinguishes explicitly between junctions with 2, 3, 4, 5, and 6 connectors.  If more than 6 connectors are needed, the junction needs to be split.  Since neighboring same-sex junctions can always be treated logically like a single junction, it is possible to construct junctions with arbitrarily many connectors.<p>

Junctions must be connected to bonds.  It is illegal to connect junctions to either modeling elements or other junctions directly.  If junctions are being split, a bond must be placed between them.
</html>
"));
    model J0p2 "Model of TwoPort 0-junction"
      extends Interfaces.TwoPortZero;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the TwoPort 0-junction.  It has one causality stroke.
</html>
"));
    equation 
      e2=e1;
      f1 + f2=0;
    end J0p2;

    model J0p3 "Model of ThreePort 0-junction"
      extends Interfaces.ThreePortZero;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the ThreePort 0-junction.  It has one causality stroke.
</html>
"));
    equation 
      e[2:3]=e[1:2];
      sum(f)=0;
    end J0p3;

    model J0p4 "Model of FourPort 0-junction"
      extends Interfaces.FourPortZero;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the FourPort 0-junction.  It has one causality stroke.
</html>
"));
    equation 
      e[2:4]=e[1:3];
      sum(f)=0;
    end J0p4;

    model J0p5 "Model of FivePort 0-junction"
      extends Interfaces.FivePortZero;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="0", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the FivePort 0-junction.  It has one causality stroke.
</html>
"));
    equation 
      e[2:5]=e[1:4];
      sum(f)=0;
    end J0p5;

    model J1p3 "Model of ThreePort 1-junction"
      extends Interfaces.ThreePortOne;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="1", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="1", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the ThreePort 1-junction.  It has two causality strokes.
</html>
"));
    equation 
      f[2:3]=f[1:2];
      sum(e)=0;
    end J1p3;

    model J1p4 "Model of FourPort 1-junction"
      extends Interfaces.FourPortOne;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="1", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="1", fillColor={0,0,0})}), Documentation(info="<html>
This is the model of the FourPort 1-junction.  It has three causality strokes.
</html>
"));
    equation 
      f[2:4]=f[1:3];
      sum(e)=0;
    end J1p4;

  end Junctions;

  package Semiconductors "Bondgraphic description of semiconductor elements"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains bond graph models of electronic semiconductors using the standard bond graph interface.
</html>
"));
    package Utilities "Utility models for bond graph semiconductor package"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used inside some of the semiconductor bond graph models.
</html>
"));
      model mC2 "Bondgraphic modulated capacitor element"
        extends Interfaces.ModPassiveOnePort;
        Real C "Bondgraphic Capacitance";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-66,78},{54,-82}}, fillColor={0,0,0}, textString="mC"),Text(lineColor={0,0,255}, extent={{-72,80},{68,40}}, textString="%name"),Text(lineColor={0,0,255}, extent={{50,-2},{80,-54}}, fillColor={0,0,0}, textString="2")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{50,-2},{80,-54}}, fillColor={0,0,0}, textString="2"),Text(lineColor={0,0,255}, extent={{-66,78},{54,-82}}, fillColor={0,0,0}, textString="mC")}), Documentation(info="<html>
This is an alternative model to the <b>mC</b> modulated capacitance model of the bond graph library.  This model is physically dubious.  Modelers are advised to always use the <b>mC</b> model, never the <b>mC2</b> model.  However, since this is the model that is being used in the Ebers-Moll description of bipolar transistors, it is being reproduced here.  However, it is hidden under utilities to discourage modelers from using it. <p>

<hr> <p>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows into the model

 C:  Capacitance (modulated input signal)
</pre> <p>

<hr> <p>

Equations: <p>

<b>f = C*der(e)</b>
</html>
"));
      equation 
        C=s;
        f=C*der(e);
      end mC2;

    end Utilities;

  end Semiconductors;

  package Sensors "Sensors (detectors) of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
Sensors (detectors) are not among the standard bond graph elements advertized regularly in the bond graph literature.  Yet, they are very useful elements indeed, as they enable the modeler to convert bond graph variables to signal variables.  This is useful for modeling blocks of block diagrams internally by bond graphs.  It is also useful for extracting bond graph variables needed for the modeling of so-called \"activated bonds,\" bond graph elements that are internally modulated by variables extracted elsewhere in the bond graph. <p>

This package contains four types of detectors: <p>

<ol>
<li> effort detectors (<b>De</b>), <br>
<li> flow detectors (<b>Df</b>), <br>
<li> detectors of generalized momentums (<b>Dp</b>), and <br>
<li> detectors of generalized positions (<b>Dq</b>).
</ol> <p>
</html>
"));
    model De "Effort sensor of the Modelica bond graph library"
      extends Interfaces.PassiveOnePort;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="De", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="De", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name")}), Documentation(info="<html>
The effort sensor (detector) senses the common effort of a 0-junction.  Thus, effort sensors must always be connected to 0-junctions via a bond. <p>

An effort sensor does not affect the behavior of the system at all.  This is accomplished by setting the flow into the sensor equal to zero.  Thus, an effort sensor is in its effects identical with a flow source of zero flow. <p>

The effort sensor is a passive OnePort element.  It inherits the effort and flow variables from the passive OnePort.  The effort sensor has an additional output signal, through which it transmits the effort value. <p>

Since the effort sensor computes the flow (by setting it equal to zero), it has a causality stroke at the sensor element.

<hr>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows into the model
</pre> <p>

<hr> <p>

Equations: <p>

<b>f = 0</b>
</html>
"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1 "Connector of Real output signal" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      OutPort1=e;
      f=0;
    end De;

    model Df "Flow sensor of the Modelica bond graph library"
      extends Interfaces.PassiveOnePort;
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Df", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Df", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name")}), Documentation(info="<html>
The flow sensor (detector) senses the common flow of a 1-junction.  Thus, flow sensors must always be connected to 1-junctions via a bond. <p>

A flow sensor does not affect the behavior of the system at all.  This is accomplished by setting the effort at the sensor equal to zero.  Thus, a flow sensor is in its effects identical with an effort source of zero effort. <p>

The flow sensor is a passive OnePort element.  It inherits the effort and flow variables from the passive OnePort.  The flow sensor has an additional output signal, through which it transmits the flow value. <p>

Since the flow sensor computes the effort (by setting it equal to zero), it has a causality stroke away from the sensor element.

<hr>

<pre>
Potential variables:

 e:  Bondgraphic effort variable

 f:  Bondgraphic flow variable, normalized positive for flows into the model
</pre> <p>

<hr> <p>

Equations: <p>

<b>e = 0</b>
</html>
"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1 "Connector of Real output signal" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      OutPort1=f;
      e=0;
    end Df;

  end Sensors;

  package Sources "Sources of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains a collection of effort sources (<b>Se</b>) and flow sources (<b>Sf</b>). <p>

As of now, only the most common types of sources are being provided.  These are: <p>

<ol>
<li> constant sources, <br>
<li> modulated sources, and <br>
<li> sinusoidal sources.
</ol><p>

Other types of sources, such as rectangular sources can easily be constructed using the electrical library as a model.
</html>

"));
    model Se "Constant effort source of the Modelica bond graph library"
      extends Interfaces.ActiveOnePort;
      parameter Real e0=1 "Bondgraphic Effort Source";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Se", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Se", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name"),Text(lineColor={0,0,255}, extent={{-70,-50},{70,-90}}, textString="e0=%e0")}), Documentation(info="<html>
The constant effort source is an active OnePort element.  It inherits the effort and flow variables from the active OnePort.  The constant effort to be generated is modeled as a parameter. <p>

The effort source has its causality stroke away from the source. <p>

<hr>

<pre>
Potential variables:

 e:   Bondgraphic effort variable

 f:   Bondgraphic flow variable, normalized positive for flows out of the model


Parameters:

 e0:  Constant effort to be generated (default value = 1)
</pre> <p>

<hr> <p>

Equations: <p>

<b>e = e0</b>
</html>
"));
    equation 
      e=e0;
    end Se;

    model mSe "Modulated effort source of the Modelica bond graph library"
      extends Interfaces.ModActiveOnePort;
      Real e0 "Bondgraphic Effort Source";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="mSe", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="mSe", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name")}), Documentation(info="<html>
The modulated effort source is a modulated active OnePort element.  It inherits the effort and flow variables from the modulated active OnePort.  The modulated effort to be generated is modeled as a real-valued variable. <p>

Modulated sources are commonly used to model actuators of control systems.  They are the most common and convenient way for converting signal variables to bondgraphic variables, thereby allowing individual blocks of a block diagram, e.g. describing a control system, to be modeled internally using bond graphs. <p>

The effort source has its causality stroke away from the source. <p>

<hr>

<pre>
Potential variables:

 e:   Bondgraphic effort variable

 f:   Bondgraphic flow variable, normalized positive for flows out of the model

 e0:  Effort to be generated (modulated input signal)
</pre> <p>

<hr> <p>

Equations: <p>

<b>e = e0</b>
</html>
"));
    equation 
      e0=s;
      e=e0;
    end mSe;

    model sinSe "Sinusoidal effort source of the Modelica bond graph library"
      extends Interfaces.ActiveOnePort;
      parameter Real e0=1 "Amplitude of sine wave";
      parameter Modelica.SIunits.Angle phase=0 "Phase of sine wave";
      parameter Modelica.SIunits.Frequency freqHz=1 "Frequency of sine wave";
      parameter Real offset=0 "Offset of sine wave";
      parameter Modelica.SIunits.Time startTime=0 "Start time of sine wave";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(points={{-80,100},{-86,84},{-74,84},{-80,100}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(points={{101,-40},{85,-34},{85,-46},{101,-40}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{-41,-2},{-80,-2}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-106,-11},{-60,-29}}, textString="offset", fillColor={160,160,160}),Line(points={{-41,-2},{-41,-40}}, color={192,192,192}, pattern=LinePattern.Dash),Text(lineColor={0,0,255}, extent={{-60,-43},{-14,-61}}, textString="startTime", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{84,-52},{108,-72}}, textString="time", fillColor={160,160,160}),Line(points={{-9,79},{43,79}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-42,-1},{50,0}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{33,80},{30,67},{37,67},{33,80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{33,1},{30,14},{36,14},{33,1},{33,1}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{33,79},{33,0}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Text(lineColor={0,0,255}, extent={{-88,100},{-44,80}}, textString="e", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{32,52},{72,34}}, textString="e0", fillColor={160,160,160})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Se", fillColor={0,0,0}),Line(points={{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}}, color={192,192,192}),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name")}), Documentation(info="<html>
The sinusoidal effort source is an active OnePort element.  It inherits the effort and flow variables from the active OnePort.  The sinusoidal effort to be generated is modeled as a set of five parameters. <p>

The effort source has its causality stroke away from the source. <p>

<hr>

<pre>
Potential variables:

 e:          Bondgraphic effort variable

 f:          Bondgraphic flow variable, normalized positive for flows out of the model


Parameters:

 e0:         Amplitude of sine wave to be generated (default value = 1)

 phase:      Phase of sine wave to be generated (default value = 0)

 freqHz:     Frequency of sine wave to be generated (default value = 1)

 offset:     Offset of sine wave to be generated (default value = 0)

 startTime:  Start time of sine wave to be generated (default value = 0)
</pre> <p>

<hr> <p>

Equations: <p>

<b>e = offset + e0*sin(2*pi*freqHz*(time - startTime))</b>
</html>
"));
      Modelica.Blocks.Sources.Sine Sine1(amplitude=e0, freqHz=freqHz, offset=offset, phase=phase, startTime=startTime) annotation(Placement(transformation(x=80.0, y=76.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e=Sine1.y;
    end sinSe;

    model mSf_int "Internal modulated flow source of the bond graph library"
      extends Interfaces.ModTwoPort;
      Real f0 "Bondgraphic Flow Source";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-62,80},{58,-80}}, fillColor={0,0,0}, textString="mSf"),Text(lineColor={0,0,255}, extent={{-70,90},{70,50}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-62,80},{58,-80}}, fillColor={0,0,0}, textString="mSf")}), Documentation(info="<html>
The modulated internal flow source is a modulated directed TwoPort element.  It inherits the effort and flow variables from the modulated directed TwoPort.  The modulated flow to be generated is modeled as a real-valued variable. <p>

The modulated internal flow source is a modulated flow source on its secondary side.  The primary side provides the power needed by the flow source.  This element can e.g. be used to model a DC current supply together with the power cable that draws the required energy from the grid. <p>

The flow source has its secondary causality stroke away from the source.  Its primary causality stroke is free. <p>

<hr>

<pre>
Potential variables:

 e1:  Bondgraphic effort variable of inflow

 f1:  Bondgraphic flow variable of inflow, normalized positive for flows into the model

 e2:  Bondgraphic effort variable of outflow

 f2:  Bondgraphic flow variable of outflow, normalized positive for flows out of the model

 f0:  Flow to be generated (modulated input signal)
</pre> <p>

<hr> <p>

Equations: <p>

<b>f2 = f0</b> <br>
<b>e1*f1 = e2*f2</b>
</html>
"));
    equation 
      f0=s;
      f2=f0;
      e1*f1=e2*f2;
    end mSf_int;

  end Sources;

  package Spice "Spice-style semiconductor models"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains Spice-style models of electronic circuit elements built in bond graph technology.  The library implements facets of a dialect of <b>HSpice</b>, called <b>BBSpice</b>, further developed from HSpice at <i>Burr Brown, Inc.</i> in Tucson Arizona, a company that has meanwhile been acquired by <i>Texas Instruments, Inc.</i> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, Chapter 6.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
    package Interfaces "Interfaces for Spice-style electronic circuit models"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some common interfaces for Spice-style electronic circuit models.
</html>
"));
      partial model SpiceTwoPort "Special twoPort element used by Spice models"
        extends BondLib.Interfaces.TwoPort;
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        Modelica.SIunits.Temperature DTemp "Difference between circuit temperature and reference temperature";
        Real DTempSq "Square of DTemp";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{24,-4},{92,-34}}, textString="Spice", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-40,86},{40,56}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{24,-4},{92,-34}}, textString="Spice", fillColor={0,0,0})}));
      equation 
        DTemp=e2 - Tnom;
        DTempSq=DTemp*DTemp;
      end SpiceTwoPort;

    end Interfaces;

    model RS "Spice-style resistor model"
      extends Interfaces.SpiceTwoPort;
      parameter Modelica.SIunits.Resistance R=1 "Resistance at reference temperature";
      parameter Real TR1(unit="1/K")=0 "Linear temperature coefficient";
      parameter Real TR2(unit="1/K2")=0 "Quadratic temperature coefficient";
      parameter Real Area=1 "Relative area occupied by resistor";
      Modelica.SIunits.Resistance Rval "Resistance value at circuit temperature";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, textString="RS", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-72,-58},{66,-86}}, textString="R=%R")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, textString="RS", fillColor={0,0,0})}), Documentation(info="<html>
The Spice-style resistor has a reference resistance value computed at the reference temperature, <b>Tnom</b>, and for a relative area of <b>Area=1</b>.  It changes its value as a function of the circuit temperature and the relative area occupied by the resistor. <p>

<hr> <p>

<pre>
Parameters:

 R:     Reference resistance (default value = 1 Ohm)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TR1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TR2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)

 Area:  Relative area occupied by resistor (default value = 1)
</pre> <p>

<hr> <p>

Equations: <p>

<b>DTemp = e2 - Tnom</b> <br>
<b>Rval = R*(1 + TR1*DTemp + TR2*DTemp*DTemp)/Area</b> <br>
<b>e1 = Rval*f1</b> <br>
<b>f2 = (e1/e2)*f1</b>
</html>
"));
    equation 
      if R > 0 then
        Rval=R*(1 + TR1*DTemp + TR2*DTempSq)/Area;

      else
        Rval=0;
      end if;
      e1=Rval*f1;
      e1*f1=e2*f2;
    end RS;

    model CS "Spice-style capacitor model"
      extends Interfaces.SpiceTwoPort;
      parameter Modelica.SIunits.Capacitance C=1 "Capacitance at reference temperature";
      parameter Real TC1(unit="1/K")=0 "Linear temperature coefficient";
      parameter Real TC2(unit="1/K2")=0 "Quadratic temperature coefficient";
      parameter Real Area=1 "Relative area occupied by capacitor";
      Modelica.SIunits.Capacitance Cval "Capacitance value at circuit temperature";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-84,76},{26,-80}}, fillColor={0,0,0}, textString="CS"),Text(lineColor={0,0,255}, extent={{-62,-58},{48,-86}}, textString="C=%C")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-84,76},{26,-80}}, fillColor={0,0,0}, textString="CS")}), Documentation(info="<html>
The Spice-style capacitor has a reference capacitance value computed at the reference temperature, <b>Tnom</b>, and for a relative area of <b>Area=1</b>.  It changes its value as a function of the circuit temperature and the relative area occupied by the capacitor. <p>

<hr> <p>

<pre>
Parameters:

 C:     Reference capacitance (default value = 1 F)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TC1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TC2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)

 Area:  Relative area occupied by capacitor (default value = 1)
</pre> <p>

<hr> <p>

Equations: <p>

<b>DTemp = e2 - Tnom</b> <br>
<b>Cval = C*(1 + TC1*DTemp + TC2*DTemp*DTemp)*Area</b> <br>
<b>q1 = Cval*e1</b> <br>
<b>der(q1) = f1</b> <br>
<b>f2 = 0</b>
</html>
"));
    equation 
      if C > 0 then
        Cval=C*(1 + TC1*DTemp + TC2*DTempSq)*Area;

      else
        Cval=0;
      end if;
      f1=Cval*der(e1);
      f2=0;
    end CS;

    model LS "Spice-style inductor model"
      extends Interfaces.SpiceTwoPort;
      parameter Modelica.SIunits.Inductance L=1 "Inductance at reference temperature";
      parameter Real TL1(unit="1/K")=0 "Linear temperature coefficient";
      parameter Real TL2(unit="1/K2")=0 "Quadratic temperature coefficient";
      Modelica.SIunits.Inductance Lval "Inductance value at circuit temperature";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, fillColor={0,0,0}, textString="LS"),Text(lineColor={0,0,255}, extent={{-74,-58},{70,-88}}, textString="L=%L")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, fillColor={0,0,0}, textString="LS")}), Documentation(info="<html>
The Spice-style inductor has a reference inductance value computed at the reference temperature, <b>Tnom</b>.  It changes its value as a function of the circuit temperature. <p>

<hr> <p>

<pre>
Parameters:

 L:     Reference inductance (default value = 1 H)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TL1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TL2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)
</pre> <p>

<hr> <p>

Equations: <p>

<b>DTemp = e2 - Tnom</b> <br>
<b>Lval = L*(1 + TL1*DTemp + TL2*DTemp*DTemp)</b> <br>
<b>p1 = Lval*f1</b> <br>
<b>der(p1) = e1</b> <br>
<b>f2 = 0</b>
</html>
"));
    equation 
      if L > 0 then
        Lval=L*(1 + TL1*DTemp + TL2*DTempSq);

      else
        Lval=0;
      end if;
      e1=Lval*der(f1);
      f2=0;
    end LS;

    model DS "Spice-style diode model used inside the bipolar transistor models"
      extends BondLib.Interfaces.TwoPort;
      constant Real inf=Modelica.Constants.inf;
      constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
      constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
      parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
      parameter Integer Level(min=1, max=3)=1 "DIODE modeling level (check documentation window for details)";
      parameter Real Area(min=Modelica.Constants.small)=1 "Relative device area" annotation(Dialog(enable=Level == 1));
      parameter Modelica.SIunits.Length TOX(min=Modelica.Constants.small)=1e-07 "Thin oxide thickness" annotation(Dialog(group="Process parameters"));
      parameter Modelica.SIunits.Voltage PB(min=0)=0.8 "Built-in junction potential at reference temperature" annotation(Dialog(group="Electrical parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Voltage BV(min=0)=0 "Reverse breakdown voltage at reference temperature" annotation(Dialog(group="Electrical parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Current IBV(min=0)=0 "Reverse breakdown current" annotation(Dialog(group="Electrical parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Voltage PHP(min=0)=0.8 "Built-in perimeter potential at reference temperature" annotation(Dialog(group="Electrical parameters", enable=Level == 1 or Level == 3));
      parameter Real N=1 "Current emission coefficient" annotation(Dialog(group="Electrical parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Current IS(min=Modelica.Constants.small)=1e-14 "Saturation current at reference temperature" annotation(Dialog(group="Electrical parameters", enable=Level == 1));
      parameter Modelica.SIunits.Current ISW(min=0)=0 "Saturation current of perimeter at reference temperature" annotation(Dialog(group="Electrical parameters", enable=Level == 1));
      parameter Real PJ(min=0)=1 "Relative perimeter width" annotation(Dialog(group="Electrical parameters", enable=Level == 1));
      parameter Modelica.SIunits.Current IKF(min=Modelica.Constants.small)=inf "Forward knee current" annotation(Dialog(group="High current beta degradation effect", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Current IKR(min=Modelica.Constants.small)=inf "Reverse knee current" annotation(Dialog(group="High current beta degradation effect", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Resistance RS(min=0)=0 "Resistance at reference temperature" annotation(Dialog(group="Parasitic resistor parameters"));
      parameter Modelica.SIunits.Capacitance CJ(min=0)=5e-13 "Zero-bias bulk capacitance at reference temperature" annotation(Dialog(group="Junction capacitance parameters", enable=Level == 1));
      parameter Real MJ(min=0.1, max=0.9)=0.33 "Bulk junction grading coefficient" annotation(Dialog(group="Junction capacitance parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Capacitance CJSW(min=0)=5e-13 "Zero-bias perimeter capacitance at reference temperature" annotation(Dialog(group="Junction capacitance parameters", enable=Level == 1));
      parameter Real MJSW(min=0.1, max=0.9)=0.33 "Perimeter capacitance grading coefficient" annotation(Dialog(group="Junction capacitance parameters", enable=Level == 1 or Level == 3));
      parameter Real FC(min=0, max=0.95)=0.5 "Forward-bias depletion capacitance coefficient" annotation(Dialog(group="Junction capacitance parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Time TT(min=0)=0 "Transit time at reference temperature" annotation(Dialog(group="Transit time parameters", enable=Level == 1 or Level == 3));
      parameter Real TRS(unit="1/K")=0 "Linear temperature coefficient of resistance" annotation(Dialog(group="Temperature compensation parameters"));
      parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of breakdown voltage" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
      parameter Real TTT1(unit="1/K")=0 "Linear temperature coefficient of transit time" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
      parameter Real TTT2(unit="1/K2")=0 "Quadratic temperature coefficient of transit time" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
      parameter Real XTI(min=0)=3 "Saturation current temperature exponent" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Voltage EG(min=0.1)=1.11 "Energy gap at 0K (EG=1.11: Si, EG=0.73: Schottky barrier diode, EG=0.71: Ge)" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
      parameter Integer M(min=1)=1 "Diode multiplier" annotation(Dialog(tab="Level=2", enable=Level > 1));
      parameter Modelica.SIunits.Length L(min=0)=0 "Diode length" annotation(Dialog(tab="Level=2", group="Geometric parameters", enable=Level > 1));
      parameter Modelica.SIunits.Length W(min=0)=0 "Diode width" annotation(Dialog(tab="Level=2", group="Geometric parameters", enable=Level > 1));
      parameter Real JF(min=0, unit="A/V2")=0 "Forward Fowler-Nordheim current coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2));
      parameter Real JR(min=0, unit="A/V2")=0 "Reverse Fowler-Nordheim current coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2));
      parameter Modelica.SIunits.ElectricFieldStrength EF(min=0)=0 "Forward Fowler-Nordheim critical electrical field" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2));
      parameter Modelica.SIunits.ElectricFieldStrength ER(min=0)=0 "Reverse Fowler-Nordheim critical electrical field" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2));
      parameter Modelica.SIunits.Length LP(min=0)=0 "Polysilicon length" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length WP(min=0)=0 "Polysilicon width" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length XP(min=0)=0 "Widening of polysilicon due to masking and etching" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length XOI(min=0)=0 "Polysilicon thickness" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length LM(min=0)=0 "Metal length" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length WM(min=0)=0 "Metal width" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length XM(min=0)=0 "Widening of metal due to masking and etching" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.Length XOM(min=0)=0 "Metal thickness" annotation(Dialog(tab="Level=3", group="Geometric parameters", enable=Level == 3));
      parameter Modelica.SIunits.CurrentDensity JS(min=Modelica.Constants.small)=0.0001 "Saturation current density at reference temperature" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
      parameter Real JSW(unit="A/m", min=0)=0 "Saturation current density of perimeter at reference temperature" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
      parameter Real CJ2(min=Modelica.Constants.small, unit="F/m2")=0.0001 "Zero-bias bulk capacitance per square meter at reference temperature" annotation(Dialog(tab="Level=3", group="Junction capacitance parameters", enable=Level == 3));
      parameter Real CJSW2(min=0, unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature" annotation(Dialog(tab="Level=3", group="Junction capacitance parameters", enable=Level == 3));
      parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level == 1 or Level == 3));
      parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level == 1 or Level == 3));
      parameter Modelica.SIunits.Conductance GminDC(min=Modelica.Constants.small)=1e-16 "Leakage conductance" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level == 1 or Level == 3));
    protected 
      parameter Modelica.SIunits.Area AREAeff=W*L*M;
      parameter Modelica.SIunits.Length PJeff=2*(W + L)*M;
      parameter Modelica.SIunits.Voltage Vt=k*Tnom/q;
      parameter Modelica.SIunits.Current ISeff=if Level == 1 then Area*IS + PJ*ISW else if Level == 3 then AREAeff*JS + PJeff*JSW else 0;
      parameter Modelica.SIunits.Current Ibreak=-ISeff*(exp(-BV/(N*Vt)) - 1);
      parameter Modelica.SIunits.Current IBVval=if IBV < Ibreak then Ibreak else IBV;
      parameter Modelica.SIunits.Voltage BVval=if BV > 0 then BVval - N*Vt*log(IBVval/Ibreak) else 0;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, fillColor={0,0,0}, textString="DS"),Text(lineColor={0,0,255}, extent={{8,-10},{108,-38}}, textString="Spice", fillColor={0,0,0})}), Diagram, Documentation(info="<html>
The Spice-style diode offers three modeling levels [1].  The <b>Level=1</b> model characterizes a junction diode by its electrical properties.  This model is similar to the models of the junction diodes used within the BJT and MOSFET models, but it is more accurate.  In particular, it includes a description of avalanche breakdown behavior.  The <b>Level=3</b> model is similar to the <b>Level=1</b> model, but here, the diode is characterized by its physical parameters, such as length and width of the junction.  Also, this model is yet more accurate as it allows the modeler to specify a polysilicon and a metal layer, in which case the additional capacitances associated with these layers will be computed as well.  The <b>Level=2</b> model is an entirely different device.  It represents essentially a non-linear resistor with a quadratic characteristic on both sides.  Thus, the Fowler-Nordheim diode is a symmetric device. <p>
 
<hr> <p>
 
<pre>
<b>Parameters:</b>
 
 <font color=red><b>Level:   DIODE modeling level (default value = 1)
            Level=1: Non-geometric junction diode
            Level=2: Fowler-Nordheim diode
            Level=3: Geometric junction diode</b></font>
 
 Area:    Relative area occupied by the diode (default value = 1) <font color=red>Level 1</font>
 
 
<b>Process Parameters:</b>
 
 TOX:     Thin oxide thickness (default value = 1e-7 m) <font color=red>Levels 1-3</font>
 
 
<b>Basic Electrical Parameters:</b>
 
 PB:      Built-in junction potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 1,3</font>
 
 BV:      Reverse breakdown voltage at reference temperature (default value = 0 Volt) <font color=red>Levels 1,3</font>
            <font color=blue><b>BV must be specified as a positive number.  A value of 0 indicates that the breakdown voltage is infinite.</b></font>
 
 IBV:     Reverse breakdown current (default value = 0 Amp) <font color=red>Levels 1,3</font>
            <font color=blue><b>IBV must be specified as a positive number.  A value of 0 indicates that the breakdown voltage is infinite.
            Either BV or IBV (the diodic current at breakdown) can be specified.  If both are specified and
            the values are inconsistent with each other, they will be suitably adjusted to match.</b></font>
 
 PHP:     Built-in perimeter potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 1,3</font>
 
 N:       Current emission coefficient (default value = 1) <font color=red>Levels 1,3</font>
 
 IS:      Saturation current at reference temperature (default value = 1e-14 Amp) <font color=red>Level 1</font>
 
 ISW:     Saturation current of perimeter at reference temperature (default value = 0 Amp) <font color=red>Level 1</font>
 
 PJ:      Relative perimeter width (default value = 1) <font color=red>Level 1</font>
 
 
<b>High Current Beta Degradation Effect Parameters:</b>
 
 IKF:     Forward knee current (default value = &infin; Amp) <font color=red>Levels 1,3</font>
 
 IKR:     Reverse knee current (default value = &infin; Amp) <font color=red>Levels 1,3</font>
 
 
<b>Parasitic Resistor Parameters:</b>
 
 RS:      Resistance at reference temperature (default value = 0 Ohm) <font color=red>Levels 1-3</font>
 
 
<b>Junction Capacitance Parameters:</b>
 
 CJ:      Zero-bias bulk capacitance at reference temperature (default value = 0.5e-12 F) <font color=red>Level 1</font>
 
 MJ:      Bulk junction grading coefficient (default value = 0.33) <font color=red>Levels 1,3</font>
 
 CJSW:    Zero-bias perimeter capacitance at reference temperature (default value = 0.5e-12 F) <font color=red>Level 1</font>
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33) <font color=red>Levels 1,3</font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5) <font color=red>Levels 1,3</font>
 
 
<b>Transit Time Parameters:</b>
 
 TT:      Transit time at reference temperature (default value = 0 sec) <font color=red>Levels 1,3</font>
 
 
<b>Temperature Compensation Parameters:</b>
 
 TRS:     Linear temperature coefficient of resistance (default value = 0 1/K) <font color=red>Levels 1-3</font>
 
 TCV:     Linear temperature coefficient of breakdown voltage (default value = 0 V/K) <font color=red>Levels 1,3</font>
 
 TTT1:    Linear temperature coefficient of transit time (default value = 0 1/K) <font color=red>Levels 1,3</font>
 
 TTT2:    Quadratic temperature coefficient of transit time (default value = 0 1/K2) <font color=red>Levels 1,3</font>
 
 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 1-3</font>
 
 XTI:     Temperature exponent of saturation current (default value = 3) <font color=red>Levels 1,3</font>
            <font color=blue><b>XTI = 3 for <i>pn</i>-junction
            XTI = 2 for Schottky barrier diode</b></font>
 
 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt) <font color=red>Levels 1,3</font>
            <font color=blue><b>EG = 1.11 for Si
            EG = 0.73 for Schottky barrier diode
            EG = 0.71 for Ge</b></font>
 
 
<b>Level=2 General Parameters:</b>
 
 M:       Diode multiplier (default value = 1) <font color=red>Levels 2,3</font>
 
 
<b>Level=2 Geometric Parameters:</b>
 
 L:       Diode length (default value = 0 m) <font color=red>Levels 2,3</font>
 
 W:       Diode width (default value = 0 m) <font color=red>Levels 2,3</font>
 
 
<b>Level=2 Electrical Parameters:</b>
 
 JF:       Forward Fowler-Nordheim current coefficient (default value = 0 A/V<sup>2</sup>) <font color=red>Level 2</font>
 
 JR:       Reverse Fowler-Nordheim current coefficient (default value = 0 A/V<sup>2</sup>) <font color=red>Level 2</font>
 
 EF:       Forward Fowler-Nordheim critical electrical field (default value = 0 V/m) <font color=red>Level 2</font>
 
 ER:       Reverse Fowler-Nordheim critical electrical field (default value = 0 V/m) <font color=red>Level 2</font>
 
 
<b>Level=3 Geometric Parameters:</b>
 
 LP:       Polysilicon length (default value = 0 m) <font color=red>Level 3</font>
 
 WP:       Polysilicon width (default value = 0 m) <font color=red>Level 3</font>
 
 XP:       Widening of polysilicon due to masking and etching (default value = 0 m) <font color=red>Level 3</font>
 
 XOI:      Polysilicon thickness (default value = 0 m) <font color=red>Level 3</font>
 
 LM:       Metal length (default value = 0 m) <font color=red>Level 3</font>
 
 WM:       Metal width (default value = 0 m) <font color=red>Level 3</font>
 
 XM:       Widening of metal due to masking and etching (default value = 0 m) <font color=red>Level 3</font>
 
 XOM:      Metal thickness (default value = 0 m) <font color=red>Level 3</font>
 
 
<b>Level=3 Electrical Parameters:</b>
 
 JS:      Saturation current density at reference temperature (default value = 1e-4 Amp/m<sup>2</sup>) <font color=red>Level 3</font>
 
 JSW:     Saturation current density of perimeter at reference temperature (default value = 0 Amp/m<sup>2</sup>) <font color=red>Level 3</font>
 
 
<b>Level=2 Junction Capacitance Parameters:</b>
 
 CJ2:     Zero-bias bulk capacitance per meter square at reference temperature (default value = 1e-4 F/m<sup>2</sup>) <font color=red>Level 3</font>
 
 CJSW2:   Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m) <font color=red>Level 3</font>
 
 
<b>Numerical Parameters:</b>
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1,3</font>
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1,3</font>
 
 GminDC:  Leakage conductance (default value = 1e-16 mho) <font color=red>Levels 1,3</font>
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
    public 
      Junctions.J0p2 J0p2_1 annotation(Placement(transformation(x=-80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J0p5 J0p5_1 annotation(Placement(transformation(x=80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Bonds.Bond B1 annotation(Placement(transformation(x=-60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=-40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Bonds.Bond B2 annotation(Placement(transformation(x=-20.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J0p4 J0p4_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Bonds.fBond B4 annotation(Placement(transformation(x=60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
      Bonds.eBond B3 annotation(Placement(transformation(x=20.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
      Bonds.Bond B5 annotation(Placement(transformation(x=-40.0, y=-20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
      Bonds.eBond B6 annotation(Placement(transformation(x=-40.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
      Bonds.Bond B7 annotation(Placement(transformation(x=0.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      Utilities.CjD CjD1(Level=Level, Tnom=Tnom, IS=IS, N=N, TT=TT, CJ=CJ, PB=PB, MJ=MJ, EG=EG, XTI=XTI, FC=FC, BV=BVval, IBV=IBVval, TCV=TCV, TTT1=TTT1, TTT2=TTT2, ISW=ISW, CJSW=CJSW, PHP=PHP, MJSW=MJSW, TOX=TOX, GminDC=GminDC, Area=Area, PJ=PJ, EMin=EMin, EMax=EMax, L=L, W=W, M=M, JS=JS, CJ2=CJ2, JSW=JSW, CJSW2=CJSW2, LP=LP, WP=WP, XP=XP, XOI=XOI, LM=LM, WM=WM, XM=XM, XOM=XOM, JF=JF, JR=JR, EF=EF, ER=ER) annotation(Placement(transformation(x=0.0, y=50.0, scale=0.1, aspectRatio=2.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
      Utilities.ID0 ID0(Level=Level, N=N, IKF=IKF, IKR=IKR) annotation(Placement(transformation(x=30.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
      Bonds.eBond B8 annotation(Placement(transformation(x=0.0, y=80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      Modelica.Blocks.Math.Gain Gain1(k=-1) annotation(Placement(transformation(x=56.0, y=50.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Bonds.fBond B9 annotation(Placement(transformation(x=80.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      Sensors.De Tdev annotation(Placement(transformation(x=80.0, y=40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      Bonds.fBond B10 annotation(Placement(transformation(x=0.0, y=-20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
      Sensors.De vd annotation(Placement(transformation(x=0.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
      BondLib.Spice.RS RS1(Tnom=Tnom, R=RS, TR1=TRS, TR2=0, Area=Area) annotation(Placement(transformation(x=-40.0, y=-50.0, scale=0.1, aspectRatio=2.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
      BondLib.Sources.mSf_int mSf_int1 annotation(Placement(transformation(x=40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
    equation 
      connect(J0p2_1.BondCon1,BondCon1) annotation(Line(points={{-90,0},{-100,0}}, color={192,192,192}));
      connect(J0p5_1.BondCon2,BondCon2) annotation(Line(points={{90,0},{100,0}}, color={192,192,192}));
      connect(B1.BondCon1,J0p2_1.BondCon2) annotation(Line(points={{-69.8,0},{-70,0}}, color={192,192,192}));
      connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-50,0},{-50,0}}, color={192,192,192}));
      connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{-30,0},{-29.8,0}}, color={192,192,192}));
      connect(B2.BondCon2,J0p4_1.BondCon1) annotation(Line(points={{-10,0},{-10,0}}, color={192,192,192}));
      connect(J0p4_1.BondCon2,B3.eBondCon1) annotation(Line(points={{10,0},{15,0},{15,1.22461e-15},{10,1.22461e-15}}, color={192,192,192}));
      connect(B4.eBondCon1,J0p5_1.BondCon1) annotation(Line(points={{70,-1.22461e-15},{70,0}}, color={192,192,192}));
      connect(B5.BondCon1,J1p3_1.BondCon3) annotation(Line(points={{-40,-10.2},{-40,-10}}, color={192,192,192}));
      connect(B7.BondCon1,J0p4_1.BondCon4) annotation(Line(points={{-6.00057e-16,10.2},{-6.00057e-16,17.1},{0,17.1},{0,10}}, color={192,192,192}));
      connect(CjD1.BondCon1,B7.BondCon2) annotation(Line(points={{6.12303e-16,30},{6.12303e-16,30}}, color={192,192,192}));
      connect(CjD1.id,ID0.u) annotation(Line(points={{10,50},{18,50}}, color={0,0,191}));
      connect(B8.fBondCon1,CjD1.BondCon2) annotation(Line(points={{-6.12303e-16,70},{-6.12303e-16,70}}, color={192,192,192}));
      connect(Gain1.u,ID0.y) annotation(Line(points={{48.8,50},{41,50}}, color={0,0,191}));
      connect(B9.eBondCon1,J0p5_1.BondCon5) annotation(Line(points={{80,10},{80,10}}, color={192,192,192}));
      connect(Tdev.BondCon1,B9.fBondCon1) annotation(Line(points={{80,30},{80,30}}, color={192,192,192}));
      connect(Tdev.OutPort1,ID0.Tdev) annotation(Line(points={{80,51},{80,70},{30,70},{30,60}}, color={0,0,191}));
      connect(B10.eBondCon1,J0p4_1.BondCon3) annotation(Line(points={{1.83691e-15,-10},{0,-10}}, color={192,192,192}));
      connect(vd.BondCon1,B10.fBondCon1) annotation(Line(points={{1.83691e-15,-30},{-1.83691e-15,-30}}, color={192,192,192}));
      connect(vd.OutPort1,ID0.v) annotation(Line(points={{-2.0206e-15,-51},{-2.0206e-15,-60},{20,-60},{20,20},{30,20},{30,40}}, color={0,0,191}));
      connect(B6.eBondCon1,J0p5_1.BondCon3) annotation(Line(points={{-40,-90},{-40,-96},{76,-96},{76,-10}}, color={192,192,192}));
      connect(B8.eBondCon1,J0p5_1.BondCon4) annotation(Line(points={{6.12303e-16,90},{0,90},{0,94},{110,94},{110,-20},{84,-20},{84,-10}}, color={192,192,192}));
      connect(RS1.BondCon1,B5.BondCon2) annotation(Line(points={{-40,-30},{-40,-30}}, color={192,192,192}));
      connect(RS1.BondCon2,B6.fBondCon1) annotation(Line(points={{-40,-70},{-40,-70}}, color={192,192,192}));
      connect(B3.fBondCon1,mSf_int1.BondCon2) annotation(Line(points={{30,-1.22461e-15},{30,0}}, color={192,192,192}));
      connect(B4.fBondCon1,mSf_int1.BondCon1) annotation(Line(points={{50,1.22461e-15},{50,0}}, color={192,192,192}));
      connect(Gain1.y,mSf_int1.s) annotation(Line(points={{62.6,50},{66,50},{66,20},{40,20},{40,9}}, color={0,0,191}));
    end DS;

    package Utilities "Utility models of Spice circuit element models"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used within the Spice-style circuit element models.
</html>
"));
      model Gj "Spice-style leakage conductance model"
        extends BondLib.Interfaces.PassiveOnePort;
        parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
        parameter Real Area=1 "Relative area occupied by device";
        parameter Integer Level=2 "Transistor modeling level (Ebers-Moll = 1; Gummel-Poon = 2)";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-84,64},{12,-68}}, fillColor={0,0,0}, textString="Gj"),Text(lineColor={0,0,255}, extent={{0,-6},{84,-34}}, textString="Spice", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-68,92},{72,52}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-84,64},{12,-68}}, fillColor={0,0,0}, textString="Gj"),Text(lineColor={0,0,255}, extent={{0,-6},{84,-34}}, textString="Spice", fillColor={0,0,0})}), Documentation(info="<html>
The Spice-style leakage conductance model is a conductor element without temperature variation.  The <b>Level</b> parameter is used to acknowledge the additional <b>Area</b> parameter of the Gummel-Poon transistor model. No heat port is needed here, as the model is used only as a mathematical construct to compute the currents of the non-linear current sources. The heat generation is accounted for in the non-linear sources. <p>

<hr> <p>

<pre>
Parameters:

 GminDC:   Leakage conductance (default value = 1e-16 Mho)

 Area:     Relative area occupied by resistor (default value = 1)

 Level:    Transistor modeling level (Ebers-Moll = 1; Gummel-Poon = 2) (default value = 2)
</pre> <p>

<hr> <p>

Equations: <p>

<b>f = Area*GminDC*e</b>
</html>
"));
      equation 
        if Level == 2 then
          f=Area*GminDC*e;

        else
          f=GminDC*e;
        end if;
      end Gj;

      block nlCD "Non-linear capacitance computation of DIODE"
        extends Modelica.Blocks.Interfaces.SISO;
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Real kox=3.9 "Dielectric constant of SiO2";
        parameter Integer Level=1 "DIODE modeling level (check documentation window for details)";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Real Area=1 "Relative device area";
        parameter Real PJ=1 "Relative perimeter width";
        parameter Integer M=1 "Diode multiplier";
        parameter Modelica.SIunits.Current IS=1e-14 "Saturation current at reference temperature";
        parameter Modelica.SIunits.CurrentDensity JS=0.0001 "Saturation current density at reference temperature";
        parameter Real N=1 "Current emission coefficient";
        parameter Modelica.SIunits.Time TT=0 "Transit time at reference temperature";
        parameter Modelica.SIunits.Voltage PB=0.8 "Built-in junction potential at reference temperature";
        parameter Modelica.SIunits.Voltage PHP=0.8 "Built-in perimeter potential at reference temperature";
        parameter Modelica.SIunits.Capacitance CJ=5e-13 "Zero-bias bulk capacitance at reference temperature";
        parameter Real CJ2(unit="F/m2")=0.0001 "Zero-bias bulk capacitance per square meter at reference temperature";
        parameter Real MJ=0.33 "Bulk junction grading coefficient";
        parameter Modelica.SIunits.Capacitance CJSW=5e-13 "Zero-bias perimeter capacitance at reference temperature";
        parameter Real CJSW2(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
        parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
        parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
        parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        parameter Real XTI=3 "Saturation current temperature exponent";
        parameter Real TTT1(unit="1/K")=0 "Linear temperature coefficient of transit time";
        parameter Real TTT2(unit="1/K2")=0 "Quadratic temperature coefficient of transit time";
        parameter Modelica.SIunits.Current ISW=0 "Saturation current of periphery at reference temperature";
        parameter Real JSW(unit="A/m")=0 "Saturation current density of periphery at reference temperature";
        parameter Modelica.SIunits.Length TOX=1e-07 "Thin oxide thickness";
        parameter Modelica.SIunits.Length L=0 "Diode length";
        parameter Modelica.SIunits.Length W=0 "Diode width";
        parameter Modelica.SIunits.Length LP=0 "Polysilicon length";
        parameter Modelica.SIunits.Length WP=0 "Polysilicon width";
        parameter Modelica.SIunits.Length XP=0 "Widening of polysilicon due to masking and etching";
        parameter Modelica.SIunits.Length XOI=0 "Polysilicon thickness";
        parameter Modelica.SIunits.Length LM=0 "Metal length";
        parameter Modelica.SIunits.Length WM=0 "Metal width";
        parameter Modelica.SIunits.Length XM=0 "Widening of metal due to masking and etching";
        parameter Modelica.SIunits.Length XOM=0 "Metal thickness";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=-5.32907e-15, y=-120, scale=0.2, rotation=-270)));
      protected 
        parameter Modelica.SIunits.Permittivity eox=kox*e0 "Permittivity of SiO2";
        parameter Modelica.SIunits.Area AREAeff=W*L*M;
        parameter Modelica.SIunits.Length PJeff=2*(W + L)*M;
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Modelica.SIunits.Temperature DTemp "Difference between circuit temperature and reference temperature";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Current ISval "Saturation current at device temperature";
        Modelica.SIunits.Current ISeff "Effective saturation current";
        Modelica.SIunits.CurrentDensity JSval "Saturation current density at device temperature";
        Modelica.SIunits.Current ISWval "Saturation current of periphery at device temperature";
        Real JSWval(unit="A/m") "Saturation current density of periphery at device temperature";
        Modelica.SIunits.Voltage PBval "Built-in junction potential at device temperature";
        Modelica.SIunits.Voltage PHPval "Built-in perimeter potential at device temperature";
        Modelica.SIunits.Capacitance CJval "Zero-bias bulk capacitance at device temperature";
        Real CJ2val(unit="F/m2") "Zero-bias bulk capacitance per square meter at device temperature";
        Modelica.SIunits.Capacitance CJSWval "Zero-bias perimeter capacitance at device temperature";
        Real CJSW2val(unit="F/m") "Zero-bias perimeter capacitance per meter at device temperature";
        Modelica.SIunits.Time TTval "Transit time at device temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage EGnom "Energy gap at reference temperature";
        Modelica.SIunits.Voltage v "Voltage across capacitance";
        Modelica.SIunits.Capacitance Cval "Non-linear junction capacitance value";
        Modelica.SIunits.Capacitance Cdiff "Diffusion capacitance at device temperature";
        Modelica.SIunits.Capacitance Cbulk "Bulk capacitance at device temperature";
        Real Cbulk2(unit="F/m2") "Bulk capacitance per square meter at device temperature";
        Modelica.SIunits.Capacitance Cperi "Perimeter capacitance at device temperature";
        Real Cperi2(unit="F/m") "Perimeter capacitance per meter at device temperature";
        Modelica.SIunits.Capacitance Cpoly "Polysilicon capacitance";
        Modelica.SIunits.Capacitance Cmetal "Metal capacitance";
        Real et;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-74,70},{80,-58}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-78,-42},{86,-66}}, fillColor={0,0,0}, textString="DIODE")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-74,70},{80,-58}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-78,-42},{86,-66}}, fillColor={0,0,0}, textString="DIODE")}));
      equation 
        v=u;
        Vt=k*Tdev/q;
        et=v/(N*Vt);
        DTemp=Tdev - Tnom;
        RTemp=Tdev/Tnom;
        EGval=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        EGnom=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        ISval=IS*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        JSval=JS*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        ISWval=ISW*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        JSWval=JSW*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        ISeff=if Level == 1 then Area*ISval + PJ*ISWval else if Level == 3 then AREAeff*JSval + PJeff*JSWval else 0;
        PBval=PB*RTemp + EGval - EGnom*RTemp - 3*Vt*log(RTemp);
        PHPval=PHP*RTemp + EGval - EGnom*RTemp - 3*Vt*log(RTemp);
        CJval=CJ*(1 + MJ*(1 - PBval/PB + 0.0004*DTemp));
        CJ2val=CJ2*(1 + MJ*(1 - PBval/PB + 0.0004*DTemp));
        CJSWval=CJSW*(1 + MJSW*(1 - PHPval/PHP + 0.0004*DTemp));
        CJSW2val=CJSW2*(1 + MJSW*(1 - PHPval/PHP + 0.0004*DTemp));
        TTval=TT*(1 + TTT1*DTemp + TTT2*DTemp*DTemp);
        if Level == 1 then
          Cdiff=TTval*(GminDC + Area*ISeff/(N*Vt)*(if et < EMin then ExMin*(et - EMin + 1) else if et > EMax then ExMax*(et - EMax + 1) else exp(et)));
          Cbulk=CJval*(if v > FC*PBval then (1 - FC*(1 + MJ) + MJ*v/PBval)/(1 - FC)^(1 + MJ) else 1/noEvent(abs(1 - v/PBval)^MJ));
          Cbulk2=0;
          Cperi=CJSWval*(if v > FC*PHPval then (1 - FC*(1 + MJSW) + MJSW*v/PHPval)/(1 - FC)^(1 + MJSW) else 1/noEvent(abs(1 - v/PHPval)^MJSW));
          Cperi2=0;
          Cpoly=0;
          Cmetal=0;
          Cval=Cdiff + Area*Cbulk + PJ*Cperi;

        elseif Level == 3 then
          Cdiff=TTval*(GminDC + AREAeff*JSval/(N*Vt)*(if et < EMin then ExMin*(et - EMin + 1) else if et > EMax then ExMax*(et - EMax + 1) else exp(et)));
          Cbulk=0;
          Cbulk2=CJ2val*(if v > FC*PBval then (1 - FC*(1 + MJ) + MJ*v/PBval)/(1 - FC)^(1 + MJ) else 1/noEvent(abs(1 - v/PBval)^MJ));
          Cperi=0;
          Cperi2=CJSW2val*(if v > FC*PHPval then (1 - FC*(1 + MJSW) + MJSW*v/PHPval)/(1 - FC)^(1 + MJSW) else 1/noEvent(abs(1 - v/PHPval)^MJSW));
          Cpoly=eox*(WP + XP)*(LP + XP)*M/XOI;
          Cmetal=eox*(WM + XM)*(LM + XM)*M/XOM;
          Cval=Cdiff + AREAeff*Cbulk2 + PJeff*Cperi2 + Cpoly + Cmetal;


        else
          Cdiff=0;
          Cbulk=0;
          Cbulk2=0;
          Cperi=0;
          Cperi2=0;
          Cpoly=0;
          Cmetal=0;
          Cval=AREAeff*eox/TOX;
        end if;
        y=Cval;
      end nlCD;

      block ID0 "Injected current of DIODE"
        extends Modelica.Blocks.Interfaces.SISO;
        constant Real inf=Modelica.Constants.inf;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        parameter Integer Level=1 "DIODE modeling level (check documentation window for details)";
        parameter Real N=1 "Current emission coefficient";
        parameter Modelica.SIunits.Current IKF "Forward knee current";
        parameter Modelica.SIunits.Current IKR "Reverse knee current";
        output Modelica.SIunits.Voltage Vt "Thermal voltage";
        output Modelica.SIunits.Current IDstar "Diodic current";
        output Modelica.SIunits.Current ID "Adjusted diodic current";
        output Modelica.SIunits.Current IK "Knee current";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-50,36},{50,8}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-36,6},{36,-10}}, fillColor={0,0,255}, textString="of a DIODE")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-50,36},{50,8}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-36,6},{36,-10}}, fillColor={0,0,255}, textString="of a DIODE")}));
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=-15, y=-125, scale=0.25, rotation=-270)));
        Modelica.Blocks.Interfaces.RealInput v(redeclare type SignalType= Modelica.SIunits.Voltage ) "Diode voltage" annotation(Placement(visible=true, transformation(x=0, y=110, scale=0.1, rotation=-450), iconTransformation(x=-6.88864, y=123.111, scale=0.231114, rotation=-450)));
      equation 
        Vt=k*Tdev/q;
        IDstar=u;
        IK=if v > -5*N*Vt then IKF else if v > -10*N*Vt then (IKF - IKR)*v/(5*N*Vt) + 2*IKF - IKR else IKR;
        if Level == 2 or IKF == inf or IKR == inf then
          ID=IDstar;

        else
          ID=IDstar/(1 + sqrt(IDstar/IK));
        end if;
        y=ID;
      end ID0;

      model CjD "Spice-style capacitor model for diodes"
        extends BondLib.Interfaces.TwoPort;
        parameter Integer Level=1 "DIODE modeling level (check documentation window for details)";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Current IS=1e-14 "Saturation current at reference temperature";
        parameter Real N=1 "Current emission coefficient";
        parameter Modelica.SIunits.Time TT=0 "Transit time at reference temperature";
        parameter Modelica.SIunits.Capacitance CJ=5e-13 "Zero-bias bulk capacitance at reference temperature";
        parameter Modelica.SIunits.Voltage PB=0.8 "Built-in junction potential at reference temperature";
        parameter Real MJ=0.33 "Bulk junction grading coefficient";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        parameter Real XTI=3 "Saturation current temperature exponent";
        parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
        parameter Modelica.SIunits.Voltage BV=0 "Reverse breakdown voltage at reference temperature";
        parameter Modelica.SIunits.Current IBV=0 "Reverse breakdown current";
        parameter Real TCV(unit="V/K")=0 "Temperature coefficient of breakdown voltage";
        parameter Real TTT1(unit="1/K")=0 "Linear temperature coefficient of transit time";
        parameter Real TTT2(unit="1/K2")=0 "Quadratic temperature coefficient of transit time";
        parameter Modelica.SIunits.Current ISW=0 "Saturation current of periphery at reference temperature";
        parameter Modelica.SIunits.Capacitance CJSW=5e-13 "Zero-bias perimeter capacitance at reference temperature";
        parameter Modelica.SIunits.Voltage PHP=0.8 "Built-in perimeter potential at reference temperature";
        parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
        parameter Modelica.SIunits.Length TOX=1e-07 "Thin oxide thickness";
        parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
        parameter Real Area=1 "Relative device area";
        parameter Real PJ=1 "Relative perimeter width";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        parameter Modelica.SIunits.Length L=0 "Diode length";
        parameter Modelica.SIunits.Length W=0 "Diode width";
        parameter Integer M=1 "Diode multiplier";
        parameter Modelica.SIunits.CurrentDensity JS=0.0001 "Saturation current density at reference temperature";
        parameter Real CJ2(unit="F/m2")=0.0001 "Zero-bias bulk capacitance per square meter at reference temperature";
        parameter Real JSW(unit="A/m")=0 "Saturation current density of periphery at reference temperature";
        parameter Real CJSW2(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
        parameter Modelica.SIunits.Length LP=0 "Polysilicon length";
        parameter Modelica.SIunits.Length WP=0 "Polysilicon width";
        parameter Modelica.SIunits.Length XP=0 "Widening of polysilicon due to masking and etching";
        parameter Modelica.SIunits.Length XOI=0 "Polysilicon thickness";
        parameter Modelica.SIunits.Length LM=0 "Metal length";
        parameter Modelica.SIunits.Length WM=0 "Metal width";
        parameter Modelica.SIunits.Length XM=0 "Widening of metal due to masking and etching";
        parameter Modelica.SIunits.Length XOM=0 "Metal thickness";
        parameter Real JF(unit="A/V2")=0 "Forward FN current coefficient";
        parameter Real JR(unit="A/V2")=0 "Reverse FN current coefficient";
        parameter Modelica.SIunits.ElectricFieldStrength EF=0 "Forward critical electrical field";
        parameter Modelica.SIunits.ElectricFieldStrength ER=0 "Reverse critical electrical field";
        Modelica.Blocks.Interfaces.RealOutput id(redeclare type SignalType= Modelica.SIunits.Current ) "Diode current" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
        BondLib.Junctions.J0p3 J0p3_1 annotation(Placement(transformation(x=-80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
        BondLib.Bonds.fBond B1 annotation(Placement(transformation(x=-60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        BondLib.Sensors.De vbi annotation(Placement(transformation(x=-40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        BondLib.Sources.mSe Vbi annotation(Placement(transformation(x=-10.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
        BondLib.Bonds.fBond B3 annotation(Placement(transformation(x=10.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        BondLib.Junctions.J0p3 J0p3_2 annotation(Placement(transformation(x=30.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
        BondLib.Bonds.fBond B6 annotation(Placement(transformation(x=50.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=0.0)));
        BondLib.Bonds.fBond B7 annotation(Placement(transformation(x=10.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
        BondLib.Junctions.J0p3 J0p3_3 annotation(Placement(transformation(x=80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        BondLib.Spice.Utilities.Gj Gj1(GminDC=GminDC, Area=Area, Level=Level) annotation(Placement(transformation(x=-14.0, y=-40.0, scale=0.14, aspectRatio=0.714285714285714, flipHorizontal=true, flipVertical=false)));
        BondLib.Semiconductors.Utilities.mC2 Cj1 annotation(Placement(transformation(x=-60.0, y=40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=0.0)));
        BondLib.Spice.Utilities.nlCD nlC1(Level=Level, Tnom=Tnom, Area=Area, PJ=PJ, M=M, IS=IS, JS=JS, N=N, TT=TT, PB=PB, PHP=PHP, CJ=CJ, CJ2=CJ2, MJ=MJ, CJSW=CJSW, CJSW2=CJSW2, MJSW=MJSW, FC=FC, GminDC=GminDC, EG=EG, XTI=XTI, TTT1=TTT1, TTT2=TTT2, ISW=ISW, JSW=JSW, TOX=TOX, L=L, W=W, LP=LP, WP=WP, XP=XP, XOI=XOI, LM=LM, WM=WM, XM=XM, XOM=XOM, EMin=EMin, EMax=EMax) annotation(Placement(transformation(x=-30.0, y=40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
        BondLib.Spice.Utilities.DjD DjD1(Tnom=Tnom, Level=Level, IS=IS, N=N, EG=EG, XTI=XTI, BV=BV, IBV=IBV, TCV=TCV, ISW=ISW, TOX=TOX, Area=Area, PJ=PJ, EMin=EMin, EMax=EMax, L=L, W=W, M=M, JS=JS, JSW=JSW, JF=JF, JR=JR, EF=EF, ER=ER) annotation(Placement(transformation(x=80.0, y=-40.0, scale=0.2, aspectRatio=0.6, flipHorizontal=false, flipVertical=false)));
        BondLib.Sensors.De Tdev annotation(Placement(visible=true, transformation(x=60, y=40, scale=0.1, rotation=-270)));
        BondLib.Bonds.fBond B8 annotation(Placement(visible=true, transformation(x=60, y=20, scale=0.1, rotation=-270)));
        BondLib.Bonds.fBond B5 annotation(Placement(visible=true, transformation(x=30, y=-20, scale=0.1, rotation=-450)));
        BondLib.Sensors.Df id1 annotation(Placement(visible=true, transformation(x=30, y=40, scale=0.1, rotation=-270)));
        BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=30, y=20, scale=0.1, rotation=-270)));
        Bonds.eBond B9 annotation(Placement(visible=true, transformation(x=100, y=-26, scale=0.1, rotation=-270)));
        BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(visible=true, transformation(x=30, y=0, scale=0.1, rotation=-90)));
        BondLib.Bonds.eBond B2 annotation(Placement(visible=true, transformation(x=-80, y=20, scale=0.1, rotation=-270)));
      equation 
        connect(Cj1.BondCon1,B2.eBondCon1) annotation(Line(visible=true, points={{-70,40},{-80,40},{-80,30}}, color={192,192,192}));
        connect(B2.fBondCon1,J0p3_1.BondCon3) annotation(Line(visible=true, points={{-80,10},{-80,10}}, color={192,192,192}));
        connect(B5.eBondCon1,J1p3_1.BondCon2) annotation(Line(visible=true, points={{30,-10},{30,-10}}, color={192,192,192}));
        connect(J1p3_1.BondCon1,B4.fBondCon1) annotation(Line(visible=true, points={{30,10},{30,10}}, color={192,192,192}));
        connect(J1p3_1.BondCon3,B3.fBondCon1) annotation(Line(visible=true, points={{20,0},{20,0}}, color={192,192,192}));
        connect(B9.eBondCon1,J0p3_3.BondCon3) annotation(Line(visible=true, points={{100,-16},{100,-14},{80,-14},{80,-10}}, color={192,192,192}));
        connect(B9.fBondCon1,DjD1.BondCon2) annotation(Line(visible=true, points={{100,-36},{100,-40}}, color={192,192,192}));
        connect(id1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{30,30},{30,30}}, color={192,192,192}));
        connect(id1.OutPort1,id) annotation(Line(visible=true, points={{30,51},{30,80},{0,80},{0,100}}, color={0,0,191}));
        connect(B5.fBondCon1,J0p3_2.BondCon3) annotation(Line(visible=true, points={{30,-30},{30,-30}}, color={192,192,192}));
        connect(J0p3_3.BondCon1,B8.eBondCon1) annotation(Line(visible=true, points={{70,0},{60,0},{60,10}}, color={192,192,192}));
        connect(Tdev.BondCon1,B8.fBondCon1) annotation(Line(visible=true, points={{60,30},{60,30}}, color={192,192,192}));
        connect(Tdev.OutPort1,nlC1.Tdev) annotation(Line(visible=true, points={{60,51},{60,60},{-30,60},{-30,50}}, color={0,0,191}));
        connect(vbi.BondCon1,B1.fBondCon1) annotation(Line(points={{-50,0},{-50,0}}, color={192,192,192}));
        connect(Vbi.BondCon1,B3.eBondCon1) annotation(Line(points={{0,0},{0,0}}, color={192,192,192}));
        connect(J0p3_2.BondCon2,B6.eBondCon1) annotation(Line(points={{40,-40},{40,-40}}, color={192,192,192}));
        connect(B7.eBondCon1,J0p3_2.BondCon1) annotation(Line(points={{20,-40},{20,-40}}, color={192,192,192}));
        connect(Gj1.BondCon1,B7.fBondCon1) annotation(Line(points={{0,-40},{0,-40}}, color={192,192,192}));
        annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-72,90},{68,50}}, textString="%name"),Text(lineColor={0,0,255}, extent={{-84,78},{26,-78}}, fillColor={0,0,0}, textString="CjD"),Text(lineColor={0,0,255}, extent={{12,-2},{100,-30}}, textString="Spice", fillColor={0,0,0})}), Documentation(info="<html>
The Spice-style junction capacitance for DIODEs computes the depletion and diffusion capacitance value of a junction used in a DIODE.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the junction capacitance at all, but rather compute the electric charge stored in the junction directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the junction capacitance, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>

This particular model uses the capacitance formulae advocated in [2]. <p>

<hr> <p>

<pre>
Parameters:

 <font color=red><b>Level:   DIODE modeling level (default value = 1)
            Level=1: Non-geometric junction diode
            Level=2: Fowler-Nordheim diode
            Level=3: Geometric junction diode</b></font>

 Tnom:    Reference temperature (default value = 300.15 K)

 IS:      Saturation current at reference temperature (default value = 1e-14 Amp)

 N:       Current mission coefficient (default value = 1)

 TT:      Transit time at reference temperature (default value = 0 sec)

 CJ:      Zero-bias bulk capacitance at reference temperature (default value = 0.5e-12 F)

 PB:      Built-in junction potential at reference temperature (default value = 0.8 Volt)

 MJ:      Bulk junction grading coefficient (default value = 0.33)

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt)

 XTI:     Temperature exponent of saturation current (default value = 3)

 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)

 BV:      Reverse breakdown voltage at reference temperature (default value = 0 Volt)

 IBV:     Reverse breakdown current (default value = 0 Amp)

 TCV:     Linear temperature coefficient of breakdown voltage (default value = 0 V/K)

 TTT1:    Linear temperature coefficient of transit time (default value = 0 s/K)
 
 TTT2:    Quadratic temperature coefficient of transit time (default value = 0 s/K2)

 ISW:     Saturation current of perimeter at reference temperature (default value = 0 Amp)

 CJSW:    Zero-bias perimeter capacitance at reference temperature (default value = 0.5e-12 F)

 PHP:     Built-in perimeter potential at reference temperature (default value = 0.8 Volt)

 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33)

 TOX:     Thin oxide thickness (default value = 1e-7 m)

 GminDC:  Leakage conductance (default value = 1e-16 mho)

 Area:    Relative area occupied by the diode (default value = 1)

 PJ:      Relative perimeter width (default value = 1)

 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)

 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)

 L:       Diode length (default value = 0 m)

 W:       Diode width (default value = 0 m)

 M:       Diode multiplier (default value = 1)

 JS:      Saturation current density at reference temperature (default value = 1e-4 Amp/m<sup>2</sup>)

 CJ2:     Zero-bias bulk capacitance per meter square at reference temperature (default value = 1e-4 F/m<sup>2</sup>)

 JSW:     Saturation current density of perimeter at reference temperature (default value = 0 Amp/m<sup>2</sup>)

 CJSW2:   Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m)

 LP:       Polysilicon length (default value = 0 m)

 WP:       Polysilicon width (default value = 0 m)

 XP:       Widening of polysilicon due to masking and etching (default value = 0 m)

 XOI:      Polysilicon thickness (default value = 0 m)

 LM:       Metal length (default value = 0 m)

 WM:       Metal width (default value = 0 m)

 XM:       Widening of metal due to masking and etching (default value = 0 m)

 XOM:      Metal thickness (default value = 0 m)

 JF:       Forward Fowler-Nordheim current coefficient (default value = 0 A/V2)

 JR:       Reverse Fowler-Nordheim current coefficient (default value = 0 A/V2)

 EF:       Forward Fowler-Nordheim critical electrical field (default value = 0 V/m)

 ER:       Reverse Fowler-Nordheim critical electrical field (default value = 0 V/m)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.200.
</ol>
</html>
"));
        connect(J0p3_3.BondCon2,BondCon2) annotation(Line(points={{90,0},{100,0}}, color={192,192,192}));
        connect(J0p3_1.BondCon1,BondCon1) annotation(Line(points={{-90,0},{-100,0}}, color={192,192,192}));
        connect(B1.eBondCon1,J0p3_1.BondCon2) annotation(Line(points={{-70,0},{-70,0}}, color={192,192,192}));
        connect(vbi.OutPort1,nlC1.u) annotation(Line(points={{-29,0},{-24,0},{-24,20},{-10,20},{-10,40},{-18,40}}, color={0,0,191}));
        connect(DjD1.BondCon1,B6.fBondCon1) annotation(Line(points={{60,-40},{60,-40}}, color={192,192,192}));
        connect(Vbi.s,vbi.OutPort1) annotation(Line(points={{-19,0},{-29,0}}, color={0,0,191}));
        connect(nlC1.y,Cj1.s) annotation(Line(points={{-41,40},{-51,40}}, color={0,0,191}));
      end CjD;

      model DjD "Spice-style DIODE model"
        extends Interfaces.SpiceTwoPort;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        parameter Integer Level=1 "DIODE modeling level (check documentation window for details)";
        parameter Modelica.SIunits.Current IS=1e-14 "Saturation current at reference temperature";
        parameter Real N=1 "Current emission coefficient";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        parameter Real XTI=3 "Saturation current temperature exponent";
        parameter Modelica.SIunits.Voltage BV=0 "Reverse breakdown voltage at reference temperature";
        parameter Modelica.SIunits.Current IBV=0 "Reverse breakdown current";
        parameter Real TCV(unit="V/K")=0 "Temperature coefficient of breakdown voltage";
        parameter Modelica.SIunits.Current ISW=0 "Saturation current of periphery at reference temperature";
        parameter Modelica.SIunits.Length TOX=1e-07 "Thin oxide thickness";
        parameter Real Area=1 "Relative device area";
        parameter Real PJ=0 "Relative perimeter width";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        parameter Modelica.SIunits.Length L=0 "Diode length";
        parameter Modelica.SIunits.Length W=0 "Diode width";
        parameter Integer M=1 "Diode multiplier";
        parameter Modelica.SIunits.CurrentDensity JS=0.0001 "Saturation current density at reference temperature";
        parameter Real JSW(unit="A/m")=0 "Saturation current density of periphery at reference temperature";
        parameter Real JF(unit="A/V2")=0 "Forward FN current coefficient";
        parameter Real JR(unit="A/V2")=0 "Reverse FN current coefficient";
        parameter Modelica.SIunits.ElectricFieldStrength EF=0 "Forward critical electrical field";
        parameter Modelica.SIunits.ElectricFieldStrength ER=0 "Reverse critical electrical field";
      protected 
        parameter Modelica.SIunits.Voltage Vp=TOX*EF/(6*log(10));
        parameter Modelica.SIunits.Voltage Vm=-TOX*ER/(6*log(10));
        parameter Modelica.SIunits.Area AREAeff=W*L*M;
        parameter Modelica.SIunits.Length PJeff=2*(W + L)*M;
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Current ISval "Saturation current at device temperature";
        Modelica.SIunits.Current ISeff "Effective saturation current";
        Modelica.SIunits.CurrentDensity JSval "Saturation current density at device temperature";
        Modelica.SIunits.Current ISWval "Saturation current of periphery at device temperature";
        Real JSWval(unit="A/m") "Saturation current density of periphery at device temperature";
        Modelica.SIunits.Voltage EGnom "Activation energy at reference temperature";
        Modelica.SIunits.Voltage BVval "Reverse breakdown voltage at device temperature";
        Modelica.SIunits.Voltage BVeff "Effective reverse breakdown voltage";
        Modelica.SIunits.Current IBVval "Effective reverse breakdown current";
        Modelica.SIunits.Current Ibreak;
        Modelica.SIunits.Current f1a;
        Modelica.SIunits.Current f1b;
        Real Eq(unit="V2/m2");
        Real et;
        Real et2;
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{4,82},{14,72}}, fillColor={128,128,128}, textString="f"),Line(points={{-80,-4},{-28,-4},{-6,-2},{0,0}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-66,-6},{-36,-14}}, fillColor={128,128,128}, textString="blocking"),Line(points={{0,0},{6,10},{12,28},{16,66}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{70,-4},{80,-14}}, fillColor={128,128,128}, textString="e"),Text(lineColor={0,0,255}, extent={{16,50},{48,42}}, fillColor={128,128,128}, textString="conducting"),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-86,80},{28,-82}}, fillColor={0,0,0}, textString="DjD")}), Documentation(info="<html>
This model computes the diodic current of a Spice-style DIODE model.  Spice offers three modeling levels for DIODEs that differ in the formulae they use to compute the diodic current [1].  The <b>Level=1</b> model and the <b>Level=3</b> model represent junction diodes, whereas the <b>Level=2</b> model represents a Fowler-Nordheim diode, essentially a non-linear resistor with a quadratic conductance characteristic. <p>

<hr> <p>

<pre>
Parameters:

 <font color=red><b>Level:   DIODE modeling level (default value = 1)
            Level=1: Non-geometric junction diode
            Level=2: Fowler-Nordheim diode
            Level=3: Geometric junction diode</b></font>

 Tnom:    Reference temperature (default value = 300.15 K)

 IS:      Saturation current at reference temperature (default value = 1e-14 Amp)

 N:       Current mission coefficient (default value = 1)

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt)

 XTI:     Temperature exponent of saturation current (default value = 3)

 BV:      Reverse breakdown voltage at reference temperature (default value = 0 Volt)

 IBV:     Reverse breakdown current (default value = 0 Amp)

 TCV:     Linear temperature coefficient of breakdown voltage (default value = 0 V/K)

 ISW:     Saturation current of perimeter at reference temperature (default value = 0 Amp)

 TOX:     Thin oxide thickness (default value = 1e-7 m)

 Area:    Relative area occupied by the diode (default value = 1)

 PJ:      Relative perimeter width (default value = 1)

 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)

 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)

 L:       Diode length (default value = 0 m)

 W:       Diode width (default value = 0 m)

 M:       Diode multiplier (default value = 1)

 JS:      Saturation current density at reference temperature (default value = 1e-4 Amp/m<sup>2</sup>)

 JSW:     Saturation current density of perimeter at reference temperature (default value = 0 Amp/m<sup>2</sup>)

 JF:       Forward Fowler-Nordheim current coefficient (default value = 0 A/V2)

 JR:       Reverse Fowler-Nordheim current coefficient (default value = 0 A/V2)

 EF:       Forward Fowler-Nordheim critical electrical field (default value = 0 V/m)

 ER:       Reverse Fowler-Nordheim critical electrical field (default value = 0 V/m)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.200.
</ol>
</html>
"));
      equation 
        Vt=k*e2/q;
        RTemp=e2/Tnom;
        EGnom=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        ISval=IS*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        JSval=JS*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        ISWval=ISW*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        JSWval=JSW*exp((RTemp - 1)*EGnom/(N*Vt) + XTI/N*log(RTemp));
        ISeff=if Level == 1 then Area*ISval + PJ*ISWval else if Level == 3 then AREAeff*JSval + PJeff*JSWval else 0;
        BVval=if BV > 0 then BV - TCV*DTemp else 0;
        Ibreak=-ISeff*(exp(-BV/(N*Vt)) - 1);
        IBVval=if IBV < Ibreak then Ibreak else IBV;
        BVeff=if noEvent(BV > 0) then BVval + N*Vt*log(IBVval/Ibreak) else 0;
        et=e1/(N*Vt);
        et2=-(BVeff + e1)/(N*Vt);
        Eq=(e1/TOX)^2;
        if Level == 1 or Level == 3 then
          f1a=ISeff*(if noEvent(et < EMin) then ExMin*(et - EMin + 1) - 1 else if noEvent(et > EMax) then ExMax*(et - EMax + 1) - 1 else exp(et) - 1);
          f1b=ISeff*(if noEvent(et2 < EMin) then ExMin*(et2 - EMin + 1) - 1 else if noEvent(et2 > EMax) then ExMax*(et2 - EMax + 1) - 1 else exp(et2) - 1);
          f1=if BV > 0 then f1a - f1b - IBVval/2 else f1a;

        else
          f1a=0;
          f1b=0;
          f1=if e1 > Vp then AREAeff*JF*Eq*exp(-TOX*EF/e1) else if e1 > 0 then AREAeff*JF*Eq*1e-06/Vp*e1 else if e1 > Vm then -AREAeff*JR*Eq*1e-06/Vm*e1 else -AREAeff*JR*Eq*exp(TOX*ER/e1);
        end if;
        f2=0;
      end DjD;

    end Utilities;

  end Spice;

  package Examples "Examples of use of bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,71},{65,-49}}, textString="Sample", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0}),Text(lineColor={0,0,255}, extent={{-97,23},{78,-98}}, textString="Programs", fillColor={0,0,0})}), Documentation(info="<html>
This package contains a number of examples demonstrating the use of the bond graph library: <p>

<ol>
<li> a simple bond graph of an electrical circuit,
<li> the same circuit modeled using the electrical library built in bond graph technology,
<li> a hydraulic control system,
<li> a thermal building model,
<li> a thermal model of Biosphere 2,
<li> a set of models testing <font color=red size=5><b><i>ModelicaSpice</i></b></font>.
</ol>
</html>
"));
    package ModelicaSpice "A set of examples demonstrating the use of Modelica-Spice"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-57.85,54.65},{54,26}}, fillColor={0,0,0}, lineThickness=0.5, textString="A set of examples"),Text(lineColor={0,0,255}, extent={{-76,36},{74,4}}, fillColor={0,0,0}, lineThickness=0.5, textString="demonstrating the use of"),Text(lineColor={0,0,255}, extent={{-73.55,11.95},{76,-34}}, textString="Modelica-Spice", fillColor={191,0,0}, lineThickness=0.5)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-57.85,54.65},{54,26}}, fillColor={0,0,0}, lineThickness=0.5, textString="A set of examples"),Text(lineColor={0,0,255}, extent={{-78,36},{72,4}}, fillColor={0,0,0}, lineThickness=0.5, textString="demonstrating the use of"),Text(lineColor={0,0,255}, extent={{-75.55,11.95},{74,-34}}, textString="Modelica-Spice", fillColor={191,0,0}, lineThickness=0.5)}), Documentation(info="<html>
This package contains a set of examples demonstrating the use of <font color=red size=5><b><i>Modelica-Spice</i></b></font>. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li>Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York.
<li>Hild, D.R. and F.E. Cellier (1994), \"Object-oriented electronic circuit modeling using Dymola,\"
    <i>Proc. OOS'94, SCS Object Oriented Simulation Conference</i>, Tempe, AZ, pp.68-75.
<li>Hild, D.R. (1993), <i>Circuit Modeling in Dymola</i>, MS Thesis, Dept. of Electr. &amp; Comp. Engr.,
    University of Arizona, Tucson.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
<li>Schweisguth, M.C. and F.E. Cellier (1999), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/BJT.pdf\">A
    bond graph model of the bipolar junction transistor</a>,\" <i>Proc. SCS Intl. Conf. on Bond Graph Modeling</i>,
    San Francisco, CA, pp.344-349.
<li>Schweisguth, M.C. (1997), <a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/schweisguth_ms.pdf\"><i>Semiconductor
    Modeling with Bondgraphs</i></a>, MS Thesis, Dept. of Electr. &amp; Comp. Engr., University of Arizona, Tucson.
</ol> 
</html>
"));
      model OneWayRectifierBG "One-way rectifier circuit in bond graph interface"
        output Modelica.SIunits.Voltage vout "Output voltage";
        Sources.sinSe V0(e0=10, phase=0, freqHz=1000, offset=0, startTime=0) annotation(Placement(transformation(x=-80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
        Bonds.fBond B1 annotation(Placement(transformation(x=-60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-33.85,54.65},{36,26}}, fillColor={0,0,0}, lineThickness=0.5, textString="One-way"),Text(lineColor={0,0,255}, extent={{-58,32},{58,-2}}, fillColor={0,0,0}, lineThickness=0.5, textString="rectifier circuit"),Text(lineColor={0,0,255}, extent={{-96,8},{94,-30}}, fillColor={0,0,0}, lineThickness=0.5, textString="using Spice-style diode"),Text(lineColor={0,0,255}, extent={{-96,-20},{94,-58}}, fillColor={0,0,0}, lineThickness=0.5, textString="in bond graph interface")}), Documentation(info="<html>
This circuit demonstrates the use of the Spice-style DIODE model in a simple one-way rectifier circuit. This is the same model as the one called <b>OneWayRectifier</b>.  However, this circuit uses the bond graph interface instead of the circuit diagram interface. <p>

Simulate the model across 0.005 seconds and plot the output voltage.
</html>
"), experiment(StopTime=0.005), experimentSetupOutput);
        Junctions.J1p4 J1p4_1 annotation(Placement(transformation(x=-40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Bonds.eBond B6 annotation(Placement(transformation(x=-20.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=0.0)));
        Junctions.J0p4 J0p4_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Bonds.fBond B11 annotation(Placement(transformation(x=20.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Sensors.De Vout annotation(Placement(transformation(x=40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Junctions.J0p5 J0p5_1 annotation(Placement(transformation(x=30.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Bonds.fBond B12 annotation(Placement(transformation(x=50.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
        Sources.Se Tdev(e0=300.15) annotation(Placement(transformation(x=75.0, y=-50.0, scale=0.15, aspectRatio=0.8, flipHorizontal=false, flipVertical=false)));
        Bonds.eBond B3 annotation(Placement(visible=true, transformation(x=-40, y=80, scale=0.1, rotation=-270)));
        Bonds.eBond B8 annotation(Placement(visible=true, transformation(x=0, y=80, scale=0.1, rotation=-270)));
        Spice.DS DS1(Level=1, Tnom=300.15, IS=1e-14, RS=5, N=1, TT=1e-09, CJ=5e-13, PB=0.75, MJ=0.33, EG=1.11, XTI=3, FC=0.5, BV=0, IBV=0, TRS=0.005, TCV=0, TTT1=0, TTT2=0, ISW=0, CJSW=0, PHP=0.75, MJSW=0.33, TOX=1e-07, GminDC=1e-16, Area=1, PJ=1, EMin=-100, EMax=40) annotation(Placement(visible=true, transformation(x=-40, y=-50, scale=0.1, aspectRatio=2, rotation=-90)));
        Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=-40, y=-20, scale=0.1, rotation=-450)));
        Bonds.eBond B10 annotation(Placement(visible=true, transformation(x=0, y=-80, scale=0.1, rotation=-450)));
        Spice.RS R1(Tnom=300.15, R=125, TR1=0.005, TR2=0.005, Area=1) annotation(Placement(visible=true, transformation(x=0, y=-50, scale=0.1, aspectRatio=2, rotation=-90)));
        Spice.LS L1(Tnom=300.15, L=0.015, TL1=0, TL2=0) annotation(Placement(visible=true, transformation(x=-40, y=50, scale=0.1, aspectRatio=2, rotation=-270)));
        Bonds.fBond B9 annotation(Placement(visible=true, transformation(x=0, y=-20, scale=0.1, rotation=-90)));
        Bonds.fBond B2 annotation(Placement(visible=true, transformation(x=-40, y=20, scale=0.1, rotation=-270)));
        Spice.CS C1(Tnom=300.15, C=5e-05, TC1=0, TC2=0, Area=1) annotation(Placement(visible=true, transformation(x=0, y=50, scale=0.1, aspectRatio=2, rotation=-270)));
        Bonds.eBond B7 annotation(Placement(visible=true, transformation(x=0, y=20, scale=0.1, rotation=-270)));
        Bonds.eBond B5 annotation(Placement(visible=true, transformation(x=-40, y=-80, scale=0.1, rotation=-450)));
      equation 
        connect(B5.eBondCon1,J0p5_1.BondCon4) annotation(Line(visible=true, points={{-40,-90},{-40,-96},{34,-96},{34,-60}}, color={192,192,192}));
        connect(DS1.BondCon2,B5.fBondCon1) annotation(Line(visible=true, points={{-40,-60},{-40,-70}}, color={192,192,192}));
        connect(C1.BondCon1,B7.eBondCon1) annotation(Line(visible=true, points={{0,40},{0,30}}, color={192,192,192}));
        connect(B7.fBondCon1,J0p4_1.BondCon4) annotation(Line(visible=true, points={{0,10},{0,10}}, color={192,192,192}));
        connect(B8.fBondCon1,C1.BondCon2) annotation(Line(visible=true, points={{0,70},{0,60}}, color={192,192,192}));
        connect(L1.BondCon1,B2.fBondCon1) annotation(Line(visible=true, points={{-40,40},{-40,30}}, color={192,192,192}));
        connect(B2.eBondCon1,J1p4_1.BondCon4) annotation(Line(visible=true, points={{-40,10},{-40,10}}, color={192,192,192}));
        connect(B9.fBondCon1,R1.BondCon1) annotation(Line(visible=true, points={{0,-30},{0,-40}}, color={192,192,192}));
        connect(J0p4_1.BondCon3,B9.eBondCon1) annotation(Line(visible=true, points={{0,-10},{0,-10}}, color={192,192,192}));
        connect(B3.fBondCon1,L1.BondCon2) annotation(Line(visible=true, points={{-40,70},{-40,60}}, color={192,192,192}));
        connect(R1.BondCon2,B10.fBondCon1) annotation(Line(visible=true, points={{0,-60},{-3.06152e-15,-70}}, color={192,192,192}));
        connect(B10.eBondCon1,J0p5_1.BondCon3) annotation(Line(visible=true, points={{3.06152e-15,-90},{-1.83691e-15,-94},{26,-94},{26,-60}}, color={192,192,192}));
        connect(DS1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{-40,-40},{-40,-30}}, color={192,192,192}));
        connect(J1p4_1.BondCon3,B4.fBondCon1) annotation(Line(visible=true, points={{-40,-10},{-40,-10}}, color={192,192,192}));
        connect(B8.eBondCon1,J0p5_1.BondCon1) annotation(Line(visible=true, points={{0,90},{6.12303e-16,94},{60,94},{60,-30},{20,-30},{20,-50}}, color={192,192,192}));
        connect(B3.eBondCon1,J0p5_1.BondCon5) annotation(Line(visible=true, points={{-40,90},{-40,96},{62,96},{62,-32},{30,-32},{30,-40}}, color={192,192,192}));
        vout=Vout.e;
        connect(B1.eBondCon1,V0.BondCon1) annotation(Line(points={{-70,0},{-70,0}}, color={192,192,192}));
        connect(J1p4_1.BondCon1,B1.fBondCon1) annotation(Line(points={{-50,0},{-50,0}}, color={192,192,192}));
        connect(J1p4_1.BondCon2,B6.fBondCon1) annotation(Line(points={{-30,0},{-30,0}}, color={192,192,192}));
        connect(B6.eBondCon1,J0p4_1.BondCon1) annotation(Line(points={{-10,0},{-10,0}}, color={192,192,192}));
        connect(J0p4_1.BondCon2,B11.eBondCon1) annotation(Line(points={{10,0},{10,0}}, color={192,192,192}));
        connect(B11.fBondCon1,Vout.BondCon1) annotation(Line(points={{30,0},{30,0}}, color={192,192,192}));
        connect(J0p5_1.BondCon2,B12.fBondCon1) annotation(Line(points={{40,-50},{40,-50}}, color={192,192,192}));
        connect(B12.eBondCon1,Tdev.BondCon1) annotation(Line(points={{60,-50},{60,-50}}, color={192,192,192}));
      end OneWayRectifierBG;

    end ModelicaSpice;

  end Examples;

end BondLib;




model BondLib_Examples_ModelicaSpice_OneWayRectifierBG
  extends BondLib.Examples.ModelicaSpice.OneWayRectifierBG;
end BondLib_Examples_ModelicaSpice_OneWayRectifierBG;



