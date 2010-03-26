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
  package Thermal "Library to model thermal systems (heat transfer, simple thermo-fluid pipe flow)"
    extends Modelica.Icons.Library;
    annotation(Documentation(info="<html>
<p>
This package contains libraries to model heat transfer
and fluid heat flow.
</p>
</html>"));
    package HeatTransfer "1-dimensional heat transfer with lumped elements"
      import Modelica.SIunits.Conversions.*;
      import SI = Modelica.SIunits;
      import NonSI = Modelica.SIunits.Conversions.NonSIunits;
      extends Modelica.Icons.Library2;
      annotation(version="1.1", versionDate="2005-06-13", preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-54,-6},{-61,-7},{-75,-15},{-79,-24},{-80,-34},{-78,-42},{-73,-49},{-64,-51},{-57,-51},{-47,-50},{-41,-43},{-38,-35},{-40,-27},{-40,-20},{-42,-13},{-47,-7},{-54,-5},{-54,-6}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={192,192,192}),Polygon(points={{-75,-15},{-79,-25},{-80,-34},{-78,-42},{-72,-49},{-64,-51},{-57,-51},{-47,-50},{-57,-47},{-65,-45},{-71,-40},{-74,-33},{-76,-23},{-75,-15},{-75,-15}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160}),Polygon(points={{39,-6},{32,-7},{18,-15},{14,-24},{13,-34},{15,-42},{20,-49},{29,-51},{36,-51},{46,-50},{52,-43},{55,-35},{53,-27},{53,-20},{51,-13},{46,-7},{39,-5},{39,-6}}, fillPattern=FillPattern.Solid, lineColor={160,160,160}, fillColor={192,192,192}),Polygon(points={{18,-15},{14,-25},{13,-34},{15,-42},{21,-49},{29,-51},{36,-51},{46,-50},{36,-47},{28,-45},{22,-40},{19,-33},{17,-23},{18,-15},{18,-15}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160}),Polygon(points={{-9,-23},{-9,-10},{18,-17},{-9,-23}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid),Line(points={{-41,-17},{-9,-17}}, color={191,0,0}, thickness=0.5),Line(points={{-17,-40},{15,-40}}, color={191,0,0}, thickness=0.5),Polygon(points={{-17,-46},{-17,-34},{-40,-40},{-17,-46}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid)}), Documentation(info="<HTML>
<p>
This package contains components to model <b>1-dimensional heat transfer</b>
with lumped elements. This allows especially to model heat transfer in
machines provided the parameters of the lumped elements, such as
the heat capacity of a part, can be determined by measurements
(due to the complex geometries and many materials used in machines,
calculating the lumped element parameters from some basic analytic
formulas is usually not possible).
</p>
<p>
Example models how to use this library are given in subpackage <b>Examples</b>.<br>
For a first simple example, see <b>Examples.TwoMasses</b> where two masses
with different initial temperatures are getting in contact to each
other and arriving after some time at a common temperature.<br>
<b>Examples.ControlledTemperature</b> shows how to hold a temperature 
within desired limits by switching on and off an electric resistor.<br>
A more realistic example is provided in <b>Examples.Motor</b> where the
heating of an electrical motor is modelled, see the following screen shot
of this example:
</p>
<img src=\"../Images/driveWithHeatTransfer.png\" ALT=\"driveWithHeatTransfer\">
<p>
The <b>filled</b> and <b>non-filled red squares</b> at the left and
right side of a component represent <b>thermal ports</b> (connector HeatPort).
Drawing a line between such squares means that they are thermally connected.
The variables of a HeatPort connector are the temperature <b>T</b> at the port
and the heat flow rate <b>Q_flow</b> flowing into the component (if Q_flow is positive,
the heat flows into the element, otherwise it flows out of the element):
</p>
<pre>   Modelica.SIunits.Temperature  T  \"absolute temperature at port in Kelvin\";
   Modelica.SIunits.HeatFlowRate Q_flow  \"flow rate at the port in Watt\";
</pre>
<p>
Note, that all temperatures of this package, including initial conditions,
are given in Kelvin. For convenience, in subpackages <b>HeatTransfer.Celsius</b>,
 <b>HeatTransfer.Fahrenheit</b> and <b>HeatTransfer.Rankine</b> components are provided such that source and
sensor information is available in degree Celsius, degree Fahrenheit, or degree Rankine,
respectively. Additionally, in package <b>SIunits.Conversions</b> conversion
functions between the units Kelvin and Celsius, Fahrenheit, Rankine are
provided. These functions may be used in the following way:
</p>
<pre>  <b>import</b> SI=Modelica.SIunits;
  <b>import</b> Modelica.SIunits.Conversions.*;
     ...
  <b>parameter</b> SI.Temperature T = from_degC(25);  // convert 25 degree Celsius to Kelvin
</pre>

<p>
There are several other components available, such as AxialConduction (discretized PDE in
axial direction), which have been temporarily removed from this library. The reason is that
these components reference material properties, such as thermal conductivity, and currently
the Modelica design group is discussing a general scheme to describe material properties.
</p>
<p>
For technical details in the design of this library, see the following reference:<br>
<b>Michael Tiller (2001)</b>: <a href=\"http://www.amazon.de\">
Introduction to Physical Modeling with Modelica</a>.
Kluwer Academic Publishers Boston.
</p>
<p>
<b>Acknowledgements:</b><br>
Several helpful remarks from the following persons are acknowledged:
John Batteh, Ford Motors, Dearborn, U.S.A;
<a href=\"http://www.haumer.at/\">Anton Haumer</a>, Technical Consulting & Electrical Engineering, Austria;
Ludwig Marvan, VA TECH ELIN EBG Elektronik GmbH, Wien, Austria;
Hans Olsson, Dynasim AB, Sweden;
Hubertus Tummescheit, Lund Institute of Technology, Lund, Sweden.
</p>
<p><b>Copyright &copy; 2001-2006, Modelica Association, Michael Tiller and DLR.</b></p>
<p><i>
This Modelica package is free software; it can be redistributed and/or modified
under the terms of the Modelica license, see the license conditions
and the accompanying disclaimer in the documentation of package
Modelica in file \"Modelica/package.mo\".
</i></p>
</HTML>
", revisions="<html>
<ul>
<li><i>July 15, 2002</i>
       by Michael Tiller, <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Nikolaus.Schuermann/\">Nikolaus Sch&uuml;rmann</a>:<br>
       Implemented.
</li>
<li><i>June 13, 2005</i>
       by <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
       Refined placing of connectors (cosmetic).<br>
       Refined all Examples; removed Examples.FrequencyInverter, introducing Examples.Motor<br>
       Introduced temperature dependent correction (1 + alpha*(T - T_ref)) in Fixed/PrescribedHeatFlow<br>
</li>
</ul>
</html>"));
      package Interfaces "Connectors and partial models"
        extends Modelica.Icons.Library2;
        partial connector HeatPort "Thermal port for 1-dim. heat transfer"
          SI.Temperature T "Port temperature";
          flow SI.HeatFlowRate Q_flow "Heat flow rate (positive if flowing from outside into the component)";
          annotation(Documentation(info="<html>
  
</html>"));
        end HeatPort;

        connector HeatPort_a "Thermal port for 1-dim. heat transfer (filled rectangular icon)"
          extends HeatPort;
          annotation(defaultComponentName="port_a", Documentation(info="<HTML>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>   
   T       Temperature in [Kelvin].
   Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={191,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,120},{100,60}}, textString="%name", fillColor={191,0,0})}));
        end HeatPort_a;

        connector HeatPort_b "Thermal port for 1-dim. heat transfer (unfilled rectangular icon)"
          extends HeatPort;
          annotation(defaultComponentName="port_b", Documentation(info="<HTML>
<p>This connector is used for 1-dimensional heat flow between components.
The variables in the connector are:</p>
<pre>
   T       Temperature in [Kelvin].
   Q_flow  Heat flow rate in [Watt].
</pre>
<p>According to the Modelica sign convention, a <b>positive</b> heat flow
rate <b>Q_flow</b> is considered to flow <b>into</b> a component. This
convention has to be used whenever this connector is used in a model
class.</p>
<p>Note, that the two connector classes <b>HeatPort_a</b> and
<b>HeatPort_b</b> are identical with the only exception of the different
<b>icon layout</b>.</p></HTML>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-100,120},{120,60}}, textString="%name", fillColor={191,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={255,255,255})}));
        end HeatPort_b;

        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,10},{40,-90}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={191,0,0})}), Documentation(info="<html>
  
</html>"));
      end Interfaces;

      model TemperatureSensor "Absolute temperature sensor in Kelvin"
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-20,-98},{20,-60}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={191,0,0}),Rectangle(extent={{-12,40},{12,-68}}, fillPattern=FillPattern.Solid, lineColor={191,0,0}, fillColor={191,0,0}),Line(color={0,0,255}, points={{12,0},{90,0}}),Line(points={{-94,0},{-14,0}}, color={191,0,0}),Polygon(points={{-12,40},{-12,80},{-10,86},{-6,88},{0,90},{6,88},{10,86},{12,80},{12,40},{-12,40}}, lineColor={0,0,0}, lineThickness=0.5),Line(points={{-12,40},{-12,-64}}, color={0,0,0}, thickness=0.5),Line(points={{12,40},{12,-64}}, color={0,0,0}, thickness=0.5),Line(points={{-40,-20},{-12,-20}}, color={0,0,0}),Line(points={{-40,20},{-12,20}}, color={0,0,0}),Line(points={{-40,60},{-12,60}}, color={0,0,0}),Text(lineColor={0,0,255}, extent={{102,-28},{60,-78}}, textString="K", fillColor={0,0,0})}), Documentation(info="<HTML>
<p>
This is an ideal absolute temperature sensor which returns
the temperature of the connected port in Kelvin as an output
signal.  The sensor itself has no thermal interaction with
whatever it is connected to.  Furthermore, no
thermocouple-like lags are associated with this
sensor model.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(visible=true, fillColor={191,0,0}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20,-98},{20,-60}}),Rectangle(visible=true, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, extent={{-12,-68},{12,40}}),Line(visible=true, points={{12,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-90,0},{-12,0}}, color={191,0,0}),Polygon(visible=true, lineThickness=0.5, points={{-12,40},{-12,80},{-10,86},{-6,88},{0,90},{6,88},{10,86},{12,80},{12,40},{-12,40}}),Line(visible=true, points={{-12,40},{-12,-64}}, thickness=0.5),Line(visible=true, points={{12,40},{12,-64}}, thickness=0.5),Line(visible=true, points={{-40,-20},{-12,-20}}),Line(visible=true, points={{-40,20},{-12,20}}),Line(visible=true, points={{-40,60},{-12,60}}),Text(visible=true, lineColor={0,0,255}, extent={{26,-120},{126,-20}}, textString="K"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-132,84},{108,144}}, textString="%name")}));
        Modelica.Blocks.Interfaces.RealOutput T(redeclare type SignalType= SI.Temperature ) annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Interfaces.HeatPort_a port annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      equation 
        T=port.T;
        port.Q_flow=0;
      end TemperatureSensor;

    end HeatTransfer;

  end Thermal;

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

    function atan "inverse tangent"
      extends baseIcon2;
      input Real u;
      output SI.Angle y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,8},{68,-8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-52.7,-75.2},{-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},{-14.1,-45.8},{-10.1,-36.4},{-6.03,-23.9},{-1.21,-5.06},{5.23,21},{9.25,34.1},{13.3,44.2},{18.1,52.9},{24.5,60.8},{33.4,67.6},{47,73.6},{69.5,78.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-86,68},{-14,20}}, textString="atan", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,0},{84,0}}, color={192,192,192}),Polygon(points={{100,0},{84,6},{84,-6},{100,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-52.7,-75.2},{-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},{-14.1,-45.8},{-10.1,-36.4},{-6.03,-23.9},{-1.21,-5.06},{5.23,21},{9.25,34.1},{13.3,44.2},{18.1,52.9},{24.5,60.8},{33.4,67.6},{47,73.6},{69.5,78.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-32,91},{-12,71}}, textString="1.4"),Text(extent={{-32,-71},{-12,-91}}, textString="-1.4"),Text(extent={{73,26},{93,10}}, textString=" 5.8"),Text(extent={{-103,20},{-83,4}}, textString="-5.8"),Text(extent={{92,-2},{112,-22}}, textString="u", fillColor={160,160,160})}), Documentation(info="<html>
  
</html>"));

      external "C" y=atan(u) ;

    end atan;

    function exp "exponential, base e"
      extends baseIcon2;
      input Real u;
      output Real y;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,-80.3976},{68,-80.3976}}, color={192,192,192}),Polygon(points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-86,50},{-14,2}}, textString="exp", fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-100,-80.3976},{84,-80.3976}}, color={192,192,192}),Polygon(points={{100,-80.3976},{84,-74.3976},{84,-86.3976},{100,-80.3976}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}, smooth=true, color={0,0,0}),Text(extent={{-31,72},{-11,88}}, textString="20"),Text(extent={{-92,-83},{-72,-103}}, textString="-3"),Text(extent={{70,-83},{90,-103}}, textString="3"),Text(extent={{-18,-53},{2,-73}}, textString="1"),Text(extent={{96,-82},{116,-102}}, textString="u", fillColor={160,160,160})}));

      external "C" y=exp(u) ;

    end exp;

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

      end Interfaces;

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
      block Ramp "Generate ramp signal"
        parameter Real height=1 "Height of ramps";
        parameter Real duration(min=Modelica.Constants.small)=2 "Durations of ramp";
        parameter Real offset=0 "Offset of output signal";
        parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
        extends Interfaces.SO;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,-70},{-40,-70},{31,38}}, color={0,0,0}),Text(extent={{-150,-150},{150,-110}}, textString="duration=%duration", fillColor={0,0,0}),Line(points={{31,38},{86,38}}, color={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-80,-20},{-20,-20},{50,50}}, color={0,0,0}, thickness=0.5),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-40,-20},{-42,-30},{-37,-30},{-40,-20}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-40,-20},{-40,-70}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-80,-33},{-41,-49}}, textString="offset", fillColor={160,160,160}),Text(extent={{-40,-70},{6,-88}}, textString="startTime", fillColor={160,160,160}),Text(extent={{-66,92},{-25,72}}, textString="y", fillColor={160,160,160}),Text(extent={{70,-80},{94,-100}}, textString="time", fillColor={160,160,160}),Line(points={{-20,-20},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-19,-20},{50,-20}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{50,50},{101,50}}, color={0,0,0}, thickness=0.5),Line(points={{50,50},{50,-20}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{50,-20},{42,-18},{42,-22},{50,-20}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{50,50},{48,40},{53,40},{50,50}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{53,25},{82,7}}, textString="height", fillColor={160,160,160}),Text(extent={{0,-17},{35,-37}}, textString="duration", fillColor={160,160,160})}), Documentation(info="<html>

</html>"));
      equation 
        y=offset + (if time < startTime then 0 else if time < startTime + duration then (time - startTime)*height/duration else height);
      end Ramp;

      block Trapezoid "Generate trapezoidal signal of type Real"
        parameter Real amplitude=1 "Amplitude of trapezoid";
        parameter SIunits.Time rising(final min=0)=0 "Rising duration of trapezoid";
        parameter SIunits.Time width(final min=0)=0.5 "Width duration of trapezoid";
        parameter SIunits.Time falling(final min=0)=0 "Falling duration of trapezoid";
        parameter SIunits.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
        parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
        parameter Real offset=0 "Offset of output signal";
        parameter SIunits.Time startTime=0 "Output = offset for time < startTime";
        extends Interfaces.SO;
      protected 
        parameter SIunits.Time T_rising=rising "End time of rising phase within one period";
        parameter SIunits.Time T_width=T_rising + width "End time of width phase within one period";
        parameter SIunits.Time T_falling=T_width + falling "End time of falling phase within one period";
        SIunits.Time T0(final start=startTime) "Start time of current period";
        Integer counter(start=nperiod) "Period counter";
        Integer counter2(start=nperiod);
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-147,-152},{153,-112}}, textString="period=%period", fillColor={0,0,0}),Line(points={{-81,-70},{-60,-70},{-30,40},{9,40},{39,-70},{61,-70},{90,40}}, color={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,90},{-88,68},{-72,68},{-80,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,68},{-80,-80}}, color={192,192,192}),Line(points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(points={{90,-70},{68,-62},{68,-78},{90,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-45,-31},{-45,-70}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-86,-43},{-43,-55}}, textString="offset", fillColor={160,160,160}),Text(extent={{-47,-69},{-1,-87}}, textString="startTime", fillColor={160,160,160}),Text(extent={{-76,99},{-35,79}}, textString="y", fillColor={160,160,160}),Text(extent={{70,-80},{94,-100}}, textString="time", fillColor={160,160,160}),Line(points={{-29,82},{-30,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-10,59},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{20,59},{20,39}}, color={160,160,160}, pattern=LinePattern.Dash),Line(points={{40,59},{40,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-20,76},{61,76}}, color={192,192,192}),Line(points={{-29,56},{40,56}}, color={192,192,192}),Text(extent={{-2,86},{25,77}}, textString="period", fillColor={160,160,160}),Text(extent={{-8,70},{21,60}}, textString="width", fillColor={160,160,160}),Line(points={{-42,40},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-39,40},{-39,-19}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Text(extent={{-77,14},{-40,0}}, textString="amplitude", fillColor={160,160,160}),Polygon(points={{-29,56},{-22,58},{-22,54},{-29,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-10,56},{-17,58},{-17,54},{-10,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-29,76},{-20,78},{-20,74},{-29,76}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{61,76},{53,78},{53,74},{61,76}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,-30},{-30,-30},{-10,40},{20,40},{40,-30},{60,-30},{80,40},{100,40}}, color={0,0,0}, thickness=0.5),Polygon(points={{-39,40},{-41,29},{-37,29},{-39,40}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-39,-29},{-41,-19},{-37,-19},{-39,-29},{-39,-29}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{61,84},{60,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{39,56},{32,58},{32,54},{39,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{20,56},{27,58},{27,54},{20,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{20,56},{13,58},{13,54},{20,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-12,56},{-5,58},{-5,54},{-12,56}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(extent={{-34,70},{-5,60}}, textString="rising", fillColor={160,160,160}),Text(extent={{16,70},{45,60}}, textString="falling", fillColor={160,160,160})}), Documentation(info="<html>

</html>"));
      equation 
        when pre(counter2) <> 0 and sample(startTime, period) then
          T0=time;
          counter2=pre(counter);
          counter=pre(counter) - (if pre(counter) > 0 then 1 else 0);
        end when;
        y=offset + (if time < startTime or counter2 == 0 or time >= T0 + T_falling then 0 else if time < T0 + T_rising then (time - T0)*amplitude/T_rising else if time < T0 + T_width then amplitude else (T0 + T_falling - time)*amplitude/(T_falling - T_width));
      end Trapezoid;

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

      connector BooleanSignal= Boolean "Boolean port (both input/output possible)" annotation(Documentation(info="<html>
<p>
Connector with one signal of type Boolean (no icon, no input/output prefix).
</p>
</html>"));
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
      connector BooleanInput= input BooleanSignal "'input Boolean' as connector" annotation(defaultComponentName="u", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={255,0,255}, fillColor={255,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{0,50},{100,0},{0,-50},{0,50}}, fillPattern=FillPattern.Solid, lineColor={255,0,255}, fillColor={255,0,255}),Text(extent={{-120,105},{100,60}}, textString="%name", fillColor={255,0,255})}), Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
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

      partial block SI2SO "2 Single Input / 1 Single Output continuous control block"
        extends BlockIcon;
        RealInput u1 "Connector of Real input signal 1" annotation(Placement(transformation(x=-120.0, y=60.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-120.0, y=60.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        RealInput u2 "Connector of Real input signal 2" annotation(Placement(transformation(x=-120.0, y=-60.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-120.0, y=-60.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        RealOutput y "Connector of Real output signal" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        annotation(Documentation(info="<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"), Diagram);
      end SI2SO;

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
    type Power= Real(final quantity="Power", final unit="W");
    type ThermodynamicTemperature= Real(final quantity="ThermodynamicTemperature", final unit="K", min=0, displayUnit="degC");
    type Temperature= ThermodynamicTemperature;
    type HeatFlowRate= Real(final quantity="Power", final unit="W");
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
    type Transconductance= Real(final quantity="Transconductance", final unit="A/(V*V)");
    type InversePotential= Real(final quantity="InversePotential", final unit="1/V");
    type ElectronNumberDensity= Real(final quantity="ElectronNumberDensity", final unit="m-3");
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

    type TypeReal "Icon for a Real type"
      extends Real;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={192,192,192}),Text(extent={{-94,94},{94,-94}}, fillColor={0,0,0}, textString="R")}));
    end TypeReal;

    type TypeInteger "Icon for an Integer type"
      extends Integer;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={192,192,192}),Text(extent={{-94,94},{94,-94}}, fillColor={0,0,0}, textString="I")}));
    end TypeInteger;

    type TypeBoolean "Icon for a Boolean type"
      extends Boolean;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={192,192,192}),Text(extent={{-94,94},{94,-94}}, fillColor={0,0,0}, textString="B")}));
    end TypeBoolean;

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

    model Pbond "Power flow sensor"
      extends Bonds.Bond;
      Modelica.Blocks.Interfaces.RealOutput P(redeclare type SignalType= Modelica.SIunits.Power ) "Power" annotation(Placement(transformation(x=0.0, y=90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=0.0, y=90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
    equation 
      P=BondCon1.e*BondCon1.f;
      annotation(Documentation(info="<html>
The non-directed power flow sensor is built as an acausal bond with an additional signal output that makes available the power flowing through the bond in the direction of the harpoon.
</html>
"), Diagram);
    end Pbond;

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

    model rampSe "Ramp effort source of the Modelica bond graph library"
      extends Interfaces.ActiveOnePort;
      parameter Real e0=1 "Height of ramp";
      parameter Modelica.SIunits.Time duration=2 "Duration of ramp";
      parameter Real offset=0 "Offset of ramp";
      parameter Modelica.SIunits.Time startTime=0 "Start time of ramp";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,70},{60,-90}}, textString="Se", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,100},{70,60}}, textString="%name"),Line(points={{-80,-70},{-50,-70},{50,50},{80,50}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,80},{-88,58},{-72,58},{-80,80}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-30},{-20,-30},{50,40}}, color={0,0,0}, thickness=0.5),Line(points={{-90,-80},{82,-80}}, color={192,192,192}),Polygon(points={{90,-80},{68,-72},{68,-88},{90,-80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-40,-30},{-42,-40},{-37,-40},{-40,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-40,-30},{-40,-80}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-40,-80},{-43,-70},{-38,-70},{-40,-80},{-40,-80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-80,-43},{-41,-59}}, textString="offset", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-40,-80},{6,-98}}, textString="startTime", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-83,83},{-38,58}}, fillColor={160,160,160}, textString="e"),Text(lineColor={0,0,255}, extent={{70,-86},{94,-106}}, textString="time", fillColor={160,160,160}),Line(points={{-20,-30},{-20,-80}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-19,-30},{50,-30}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{50,40},{101,40}}, color={0,0,0}, thickness=0.5),Line(points={{50,40},{50,-30}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{50,-30},{42,-28},{42,-32},{50,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-20,-30},{-11,-28},{-11,-32},{-20,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{50,40},{48,30},{53,30},{50,40}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{50,-30},{47,-20},{52,-20},{50,-30},{50,-30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{53,15},{82,-3}}, fillColor={160,160,160}, textString="e0"),Text(lineColor={0,0,255}, extent={{0,-27},{35,-47}}, textString="duration", fillColor={160,160,160})}), Documentation(info="<html>
The ramp effort source is an active OnePort element.  It inherits the effort and flow variables from the active OnePort.  The ramp effort to be generated is modeled as a set of four parameters. <p>

The effort source has its causality stroke away from the source. <p>

<hr>

<pre>
Potential variables:

 e:          Bondgraphic effort variable

 f:          Bondgraphic flow variable, normalized positive for flows out of the model


Parameters:

 e0:         Height of ramp to be generated (default value = 1)

 duration:   Duration of ramp to be generated (default value = 2)

 offset:     Offset of ramp to be generated (default value = 0)

 startTime:  Start time of ramp to be generated (default value = 0)
</pre> <p>

<hr> <p>

Equations: <p>

<b>e = offset + (if time &lt; startTime then 0 else if time &lt; (startTime + duration)
                 then (time - startTime)*e0/duration else e0);</b>
</html>
"));
      Modelica.Blocks.Sources.Ramp Ramp1(height=e0, duration=duration, offset=offset, startTime=startTime) annotation(Placement(transformation(x=79.0, y=77.0, scale=0.11, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e=Ramp1.y;
    end rampSe;

    model trapSe "Trapezoidal effort source of the Modelica bond graph library"
      extends Interfaces.ActiveOnePort;
      parameter Real e0=1 "Amplitude of trapezoidal function";
      parameter Modelica.SIunits.Time rising(final min=0)=0 "Rising duration of trapezoid";
      parameter Modelica.SIunits.Time width(final min=0)=0.5 "Width duration of trapezoid";
      parameter Modelica.SIunits.Time falling(final min=0)=0 "Falling duration of trapezoid";
      parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
      parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
      parameter Real offset=0 "Offset of trapezoidal function";
      parameter Modelica.SIunits.Time startTime=0 "Start time of trapezoidal function";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-56,78},{64,-82}}, textString="Se", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-64,104},{76,64}}, textString="%name"),Line(points={{-79,-78},{-58,-78},{-28,62},{3,62},{32,-78},{53,-78},{82,62}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-80,80},{-88,58},{-72,58},{-80,80}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,58},{-80,-90}}, color={192,192,192}),Line(points={{-90,-80},{82,-80}}, color={192,192,192}),Polygon(points={{90,-80},{68,-72},{68,-88},{90,-80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-45,-40},{-47,-51},{-43,-51},{-45,-40}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-45,-41},{-45,-80}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Polygon(points={{-45,-80},{-47,-70},{-43,-70},{-45,-80},{-45,-80}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-86,-53},{-43,-65}}, textString="offset", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-47,-79},{-1,-97}}, textString="startTime", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{76,-84},{100,-104}}, textString="time", fillColor={160,160,160}),Line(points={{-30,71},{-30,-80}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-10,49},{-10,30}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{20,49},{20,29}}, color={160,160,160}, pattern=LinePattern.Dash),Line(points={{40,49},{40,-40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-29,46},{40,46}}, color={192,192,192}),Text(lineColor={0,0,255}, extent={{-8,60},{21,50}}, textString="width", fillColor={160,160,160}),Line(points={{-42,30},{-10,30}}, color={192,192,192}, pattern=LinePattern.Dash),Line(points={{-39,30},{-39,-29}}, color={192,192,192}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Text(lineColor={0,0,255}, extent={{-67,6},{-30,-8}}, fillColor={160,160,160}, textString="e0"),Polygon(points={{-29,46},{-22,48},{-22,44},{-29,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-10,46},{-17,48},{-17,44},{-10,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{-80,-40},{-30,-40},{-9,36},{21,36},{40,-40},{60,-40},{80,36},{100,36}}, color={0,0,0}, thickness=0.5),Polygon(points={{-39,30},{-41,19},{-37,19},{-39,30}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-39,-39},{-41,-29},{-37,-29},{-39,-39},{-39,-39}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Line(points={{60,71},{60,-40}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(points={{39,46},{32,48},{32,44},{39,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{20,46},{27,48},{27,44},{20,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{20,46},{13,48},{13,44},{20,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{-12,46},{-5,48},{-5,44},{-12,46}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-34,60},{-5,50}}, textString="rising", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{16,60},{45,50}}, textString="falling", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-75,85},{-46,62}}, fillColor={160,160,160}, textString="e"),Line(points={{-20,66},{61,66}}, color={192,192,192}),Polygon(points={{-29,66},{-20,68},{-20,64},{-29,66}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Polygon(points={{61,66},{53,68},{53,64},{61,66}}, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-2,76},{25,67}}, textString="period", fillColor={160,160,160})}), Documentation(info="<html>
The trapezoidal effort source is an active OnePort element.  It inherits the effort and flow variables from the active OnePort.  The trapezoidal effort to be generated is modeled as a set of eight parameters. <p>

The effort source has its causality stroke away from the source. <p>

<hr>

<pre>
Potential variables:

 e:          Bondgraphic effort variable

 f:          Bondgraphic flow variable, normalized positive for flows out of the model


Parameters:

 e0:         Amplitude of trapezoid to be generated (default value = 1)

 rising:     Length of rising time of trapezoid to be generated (default value = 0)

 width :     Length of on state of trapezoid to be generated (default value = 0.5)

 falling:    Length of falling time of trapezoid to be generated (default value = 0)

 period:     Length of period of trapezoid to be generated (default value = 1)

 nperiod:    Number of periods of trapezoid to be generated
             an infinite number of periods is being generated if nperiod &lt; 0 (default value = -1)

 offset:     Offset of trapezoid to be generated (default value = 0)

 startTime:  Start time of trapezoid to be generated (default value = 0)
</pre> <p>

<hr> <p>

Equations: <p>

<b>when pre(counter2) &lt;&gt; 0 and sample(startTime, period) then</b> <br>
<b>T0 = time</b> <br>
<b>counter2 = pre(counter)</b> <br>
<b>counter = pre(counter) - (if pre(counter) &gt; 0 then 1 else 0)</b> <br>
<b>end when</b> <br>
<b>e = offset + (if (time &lt; startTime or counter2 == 0 or time &gt;= T0 +
    T_falling) then 0 else if (time &lt; T0 + T_rising) then (time - T0)*e0/T_rising
    else if (time &lt; T0 + T_width) then e0 else 
    (T0 + T_falling - time)*e0/(T_falling - T_width))</b>
</html>
"));
      Modelica.Blocks.Sources.Trapezoid Trapezoid1(amplitude=e0, rising=rising, width=width, falling=falling, period=period, nperiod=nperiod, offset=offset, startTime=startTime) annotation(Placement(transformation(x=79.0, y=77.0, scale=0.11, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
    equation 
      e=Trapezoid1.y;
    end trapSe;

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

    package Utilities "Utility models of Spice circuit element models"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used within the Spice-style circuit element models.
</html>
"));
      function MOSeq1 "Computation of injected drain-source current for Levels = 0,1"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Integer Type "Type=1 for NMOS; Type=-1 for PMOS";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VFB "Flat band voltage at reference temperature";
        input Modelica.SIunits.Transconductance KP "Transconductance parameter at reference temperature";
        input Real GAMMA(unit="V^0.5") "Body-effect parameter";
        input Modelica.SIunits.Voltage PHI "Surface inversion potential at reference temperature";
        input Modelica.SIunits.InversePotential LAMBDA "Channel length modulation";
        input Modelica.SIunits.Length L "Effective hannel length";
        input Modelica.SIunits.Length W "Effective channel width";
        input Modelica.SIunits.Voltage EG "Energy gap for temperature effect on saturation current at 0 K";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage Vfb "Flat band voltage at device temperature";
        output Modelica.SIunits.Voltage Vth "Threshold voltage";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
      protected 
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA "Transconductance at device temperature";
        Modelica.SIunits.Transconductance Beta "Adjusted transconductance at device temperature";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Real PHIroot(unit="V^0.5");
        Real Sarg(unit="V^0.5");
        Modelica.SIunits.Voltage Vgst "vgs - vth";
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-56,-18},{36,-46}}, fillColor={191,0,0}, textString="Levels = 0,1"),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-56,-18},{36,-46}}, fillColor={191,0,0}, textString="Levels = 0,1")}), Documentation(info="<html>
This function implements a Spice-style <b>Level-1</b> model of the current flowing between drain and source of a MOSFET in accrodance with the theory of Shichman and Hodges [1].  It is a simple model that computes the current in its linear and saturation regions only.  No channel modulation effects are considered, and the current is set equal to zero in the subthreshold region of the device. <p>

The current injection model is identical for Modelica-Spice <b>Level-0</b> and <b>Level-1</b>. <p>

The model comments the equations by providing the corresponding equation numbers from [2]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 vbs:     Bulk-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 LAMBDA:  Channel length modulation  (default value = 0 1/Volt)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt)


Output variables:

 isd0:    Drain-source current (Amp)

 Vfb:     Flat band voltage at device temperature (Volt)

 Vth:     Threshold voltage (Volt)

 vdsat:   Saturation voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li>Shichman, H. and D.A. Hodges (1968), \"Modeling and Simulation of Insulated-Gate Field-Effector Transistor Switching Circuits,\" <i>IEEE J. Solid-State Circuits</i>, <b>3</b>(3), pp. 285-289.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
      algorithm 
        RTemp:=Tdev/Tnom;
        facTemp:=RTemp*sqrt(RTemp);
        Vt:=k*Tdev/q;
        EGref:=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval:=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        PHIval:=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb:=VFB + Type*(PHIval - PHI)/2 + (EGref - EGval)/2;
        KPval:=KP/facTemp;
        BETA:=KPval*W/L;
        PHIroot:=sqrt(PHIval);
        Sarg:=if vbs <= 0 then sqrt(PHIval - vbs) else max({0,PHIroot - vbs/(2*PHIroot)});
        Vth:=Vfb + Type*(PHIval + GAMMA*Sarg);
        Vgst:=vgs - Type*Vth;
        vdsat:=if Vgst > 0 then Vgst else 0;
        Beta:=BETA*(1 + LAMBDA*vds);
        cdlin:=vds*(Vgst - vds/2);
        cdsat:=Vgst*Vgst/2;
        ids0:=sig*Beta*(if Vgst > 0 and vds <= vdsat then cdlin else if Vgst > 0 and vds > vdsat then cdsat else 0);
      end MOSeq1;

      function MOSeq2 "Computation of injected drain-source current for Level=2"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Integer Level=2 "Level of MOS model";
        input Integer Type "Type=1 for NMOS; Type=-1 for PMOS";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VFB "Flat band voltage at reference temperature";
        input Modelica.SIunits.Transconductance KP "Transconductance parameter at reference temperature";
        input Real GAMMA(unit="V^0.5") "Body-effect parameter";
        input Modelica.SIunits.Voltage PHI "Surface inversion potential at reference temperature";
        input Modelica.SIunits.InversePotential LAMBDA "Channel length modulation";
        input Real COX(unit="F/m2") "Specific capacitance of SiO2";
        input Real NFS(unit="1/m2") "Surface fast state density";
        input Real NEFF "Total channel charge coefficient";
        input Modelica.SIunits.Length XJ "Metallurgical junction depth";
        input Modelica.SIunits.Length L "Effective hannel length";
        input Modelica.SIunits.Length W "Effective channel width";
        input Real XD(unit="m/V^0.5") "Depletion factor";
        input Real U0(unit="m2/(V.s)") "Surface mobility at reference temperature";
        input Real UEXP "Exponential coefficient for mobility";
        input Real UTRA "Transverse field coefficient";
        input Modelica.SIunits.Velocity VMAX "Maximum drift velocity of carriers";
        input Modelica.SIunits.ElectricFieldStrength ECRIT "Critical electric field for pinch-off";
        input Real DELTA "Width effect on threshold voltage";
        input Modelica.SIunits.Voltage VBP "Gate to channel critical voltage";
        input Modelica.SIunits.Voltage PB "Built-in potential at reference temperature";
        input Modelica.SIunits.Voltage EG "Energy gap for temperature effect on saturation current at 0 K";
        input Real EMin "if x < EMin, the exp(x) function is linearized";
        input Real EMax "if x > EMax, the exp(x) function is linearized";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage Vfb "Effective flat band voltage at device temperature";
        output Modelica.SIunits.Voltage Vth "Threshold voltage";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
        output Modelica.SIunits.Voltage vdsat1 "Adjusted saturation voltage";
        output Modelica.SIunits.Voltage vpof "Pinch-off voltage";
      protected 
        constant Real pi=Modelica.Constants.pi;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real ks=11.8 "Dielectric constant of Si";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Integer Scat1[4]={1,-1,1,-1} "First scattering vector";
        constant Integer Scat2[4]={1,1,-1,-1} "Second scattering vector";
        parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of silicon";
        parameter Real Fn=if Level == 2 then es*DELTA*pi/(2*COX*W) else 0;
        parameter Real Fn2=1 + Fn;
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Voltage Von "Adjusted threshold voltage";
        Modelica.SIunits.Voltage Vgst "vgs - vth";
        Modelica.SIunits.Voltage VGSval "Effective vgs";
        Modelica.SIunits.Voltage VDSAT "Initial saturation voltage";
        Modelica.SIunits.Voltage VDSATval "Adjusted saturation voltage";
        Modelica.SIunits.Voltage vdson "Subthreshold voltage";
        Modelica.SIunits.Current ids "Injected drain-source current";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Real cdson(unit="V2") "Subthreshold region current coefficient";
        Real cdsub(unit="V2") "Subthreshold region current factor";
        Real GAMMAval(unit="V^0.5") "Adjusted body effect parameter";
        Real GAMMAmod(unit="V^0.5") "Modified body effect parameter";
        Real DGAMMA(unit="1/V^0.5") "der(GAMMAval,vbs)";
        Real et "Subthreshold voltage coefficient";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA;
        Real Ueff(unit="m2/(V.s)") "Effective surface mobility at reference temperature";
        Modelica.SIunits.Length WS "Source depletion region width";
        Modelica.SIunits.Length WD "Drain depletion region width";
        Modelica.SIunits.Length WB "Punch-through width";
        Modelica.SIunits.Length Leff "Modulated channel length";
        Modelica.SIunits.Length LEFFval "Effective channel length";
        Modelica.SIunits.Length LD "Channel length modulation";
        Modelica.SIunits.InversePotential LAMBDAval "Effective channel length modulation";
        Real CB "Specific capacitance of depleted region";
        Real N "Intrinsic carrier concentration at device temperature";
        Modelica.SIunits.Voltage Vgamma;
        Modelica.SIunits.Voltage Vden;
        Modelica.SIunits.Voltage Vdiff;
        Modelica.SIunits.Voltage Vdiff2;
        Modelica.SIunits.Voltage Vdiff3;
        Modelica.SIunits.Voltage Vdiff4;
        Modelica.SIunits.Voltage Vdiff5;
        Modelica.SIunits.Voltage V1;
        Modelica.SIunits.Voltage V2;
        Modelica.SIunits.Voltage Vd;
        Modelica.SIunits.Voltage X1b;
        Modelica.SIunits.Voltage X2a;
        Modelica.SIunits.Voltage X4;
        Modelica.SIunits.Voltage X5b;
        Modelica.SIunits.Voltage X6b[4];
        Modelica.SIunits.Voltage X7;
        Modelica.SIunits.Voltage VQChan;
        Real VSq(unit="V2");
        Real X1d(unit="V2");
        Real X2b(unit="V2");
        Real X9[8](unit="V2");
        Real X2c(unit="V3");
        Real X3(unit="V3");
        Real Psq(unit="V3");
        Real P(unit="V6");
        Real Pabs(unit="V6");
        Real PHIroot(unit="V^0.5");
        Real Sarg(unit="V^0.5");
        Real Barg(unit="V^0.5");
        Real BARGsat(unit="V^0.5");
        Real gdsat(unit="V^0.5");
        Real LV(unit="V^0.5");
        Real LS(unit="V^0.5");
        Real X1a(unit="V^0.5");
        Real X5a(unit="V^0.5");
        Real X6a[4](unit="V^0.5");
        Real X8[8](unit="V^0.5");
        Real PHI3(unit="V^1.5");
        Real BS3(unit="V^1.5");
        Real BS3sat(unit="V^1.5");
        Real BS3eff(unit="V^1.5");
        Real X1c(unit="V^1.5");
        Real DSarg(unit="1/V^0.5") "der(Sarg,vbs)";
        Real DBarg(unit="1/V^0.5") "der(Barg,vbs)";
        Real Lfact(unit="1/V^1.5");
        Modelica.SIunits.Length DeltaL;
        Modelica.SIunits.Transconductance BETAval;
        Real DV(unit="m/V^0.5");
        Real WSfac;
        Real WDfac;
        Real Ufact;
        Real Lfact2;
        Real LFACTval;
        Integer icnt;
        Integer jcnt;
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-52,-20},{20,-40}}, fillColor={191,0,0}, textString="Level = 2"),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-52,-20},{20,-40}}, fillColor={191,0,0}, textString="Level = 2"),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0})}), Documentation(info="<html>
This function implements a Spice-style <b>Level-2</b> model of the current flowing between drain and source of a MOSFET.  It is one of the most complex models currently available that computes the current in its linear, saturation, and subthreshold regions.  Various channel modulation effects are also considered.  The saturation voltage is computed either in accordance with the Grove-Frohman model [1,2] or using Baum's theory of scattering velocity saturation [3]. <p>

The model simulates very slowly, and is probably not useful except for simulating across a single switching event. <p>

The model comments the equations by providing the corresponding equation numbers from [4]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 vbs:     Bulk-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 LAMBDA:  Channel length modulation  (default value = 0 1/Volt)

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)

 NEFF:    Total channel charge coefficient (default value = 1)

 XJ:      Metallurgical junction depth (default value = 0 m)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)

 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s))

 UEXP:    Exponential coefficient for mobility (default value = 0)

 UTRA:    Transverse field coefficient (default value = 0)

 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s)
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation</b></font>

 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m)

 DELTA:   Width effect on threshold voltage (default value = 0)

 VBP:     Gate to channel critical voltage (default value = 0 Volt)

 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt)

 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1-3</font>

 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1-3</font>


Output variables:

 isd0:    Drain-source current (Amp)

 Vfb:     Flat band voltage at device temperature (Volt)

 Vth:     Threshold voltage (Volt)

 vdsat:   Saturation voltage (Volt)

 vdsat1:  Adjusted saturation voltage (Volt)

 vpof:    Pinch-off voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li>Frohman-Bentchkowsky, D. (1968), \"On the Effect of Mobility Variation on MOS Device Characteristics,\" <i>Proc. IEEE</i>, <b>56</b>, pp.217-218.
<li>Frohman-Bentchkowsky, D. and A.S. Grove (1969), \"Conductance of MOS Transistors in Saturation,\" <i>IEEE Trans. Electron Devices</i>, <b>ED-16</b>, pp. 108-113.
<li>Baum, G. and H. Beneking (1970), \"Drift Velocity Saturation in MOS Transistors,\" <i>IEEE Trans. Electron Devices</i>, <b>ED-17</b>, pp. 481-482.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
      algorithm 
        RTemp:=Tdev/Tnom;
        facTemp:=RTemp*sqrt(RTemp);
        Vt:=k*Tdev/q;
        EGref:=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval:=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        PHIval:=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb:=VFB + Type*(PHIval - PHI)/2 + (EGref - EGval)/2;
        KPval:=KP/facTemp;
        BETA:=KPval*W/L;
        PHIroot:=sqrt(PHIval);
        PHI3:=PHIval*PHIroot;
        Sarg:=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
        DSarg:=if vbs <= 0 then -0.5/Sarg else -0.5*Sarg*Sarg/PHI3;
        Barg:=if vbs < vds then sqrt(PHIval + vds - vbs) else PHIroot/(1 + (vbs - vds)/(2*PHIval));
        DBarg:=if vbs < vds then -0.5/Barg else -0.5*Barg*Barg/PHI3;
        BS3:=Barg^3 - Sarg^3;
        WS:=XD*Sarg;
        WD:=XD*Barg;
        WSfac:=if XJ > 0 and Level == 2 then sqrt(1 + 2*WS/XJ) else 1;
        WDfac:=if XJ > 0 and Level == 2 then sqrt(1 + 2*WD/XJ) else 1;
        GAMMAval:=GAMMA*(if XJ > 0 then 1 - XJ*(WSfac + WDfac - 2)/(2*L) else 1);
        DGAMMA:=GAMMA*(if XJ > 0 then -XD*(DSarg/WSfac + DBarg/WDfac)/(2*L) else 0);
        CB:=Fn - GAMMAval*DSarg - DGAMMA*Sarg;
        N:=if NFS > 0 then 1 + q*NFS/COX + CB else 1;
        Vth:=Vfb + Type*(PHIval + (GAMMA - GAMMAval)*sqrt(PHIval) + GAMMAval*Sarg + Fn*Sarg*Sarg/2);
        Von:=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;
        Vgst:=vgs - Von;
        Vden:=vgs - Type*Vth;
        Ufact:=if Vden > VBP then exp(UEXP*log(VBP/Vden)) else 1;
        Ueff:=Ufact*U0;
        GAMMAmod:=GAMMAval/Fn2;
        Vgamma:=GAMMAmod*GAMMAmod;
        if GAMMAmod > 0 then 
          VGSval:=if NFS > 0 then max({vgs,Von}) else vgs;
          Vdiff:=(VGSval - Type*Vfb - PHIval)/Fn2;
          Vdiff2:=Vdiff + PHIval - vbs;
          if Vdiff2 > 0 then 
            Vdiff3:=VGSval - Type*Vfb - PHIval + 0.5*GAMMAval^2*(1 - sqrt(1 + 4/GAMMAval^2*(VGSval - Type*Vfb - vbs)));
            VDSAT:=if Vdiff3 > 0 then Vdiff3 else 0;
            VSq:=Vgamma*(vds + PHIval - vbs)/Fn2^2;
            vpof:=if VSq < 0 then Type*Vth else Type*Vfb + Fn2*(vds + sqrt(VSq));
            Vdiff3:=(vpof - Type*Vfb - PHIval)/Fn2;
            Vdiff4:=(vpof - Type*Vfb - PHIval)/Fn2 + PHIval - vbs;
            Vdiff5:=Vdiff3 + Vgamma*(1 - sqrt(1 + 2*Vdiff4/Vgamma));
            vdsat1:=if Vdiff4 > 0 and Vdiff5 > 0 then Vdiff5 else 0;
          else           VDSAT:=0;
          vpof:=Type*Vth;
          vdsat1:=0;
          end if;
        else         VGSval:=vgs;
        VDSAT:=if Vdiff > 0 then Vdiff else 0;
        vpof:=if Fn2*vds + Type*Vfb > 0 then Fn2*vds + Type*Vfb else 0;
        vdsat1:=if (vpof - Type*Vfb)/Fn2 > 0 then (vpof - Type*Vfb)/Fn2 else 0;
        end if;
        VDSATval:=if ECRIT > 0 then VDSAT + ECRIT*L - sqrt(VDSAT*VDSAT + (ECRIT*L)^2) else VDSAT;
        if VMAX > 0 then 
          V1:=(VGSval - Type*Vfb)/Fn2 + PHIval - vbs;
          V2:=PHIval - vbs;
          Vd:=VMAX*L/Ueff;
          X1a:=4*GAMMAmod/3;
          X1b:=-2*(V1 + Vd);
          X1c:=-2*GAMMAmod*Vd;
          X1d:=2*V1*(V2 + Vd) - V2*V2 - X1a*Sarg^3;
          X2a:=-X1b;
          X2b:=X1a*X1c - 4*X1d;
          X2c:=-X1d*(X1a*X1a - 4*X1b) - X1c*X1c;
          X3:=2*X2a^3/27 - X2a*X2b/3 + X2c;
          P:=X3*X3/4 + (X2b - X2a*X2a/3)^3/27;
          Pabs:=if P > 0 then P else -P;
          Psq:=sqrt(Pabs);
          X4:=(if P < 0 then 2*exp(log(sqrt(X3*X3/4 + Pabs))/3)*cos(Modelica.Math.atan(-2*Psq/X3)/3) else exp(log(abs(-X3/2 + Psq))/3) + exp(log(abs(-X3/2 - Psq))/3)) - X2a/3;
          X5a:=sqrt(X1a*X1a/4 + X4 - X1b);
          X5b:=sqrt(X4*X4/4 - X1d);
          icnt:=0;
          for i in 1:4 loop
                      X6a[i]:=X1a/2 + Scat1[i]*X5a;
            X6b[i]:=X4/2 + Scat2[i]*X5b;
            X7:=X6a[i]*X6a[i]/4 - X6b[i];
            if X7 >= 0 then 
              icnt:=icnt + 1;
              X8[icnt]:=-X6a[i]/2 + sqrt(X7);
              icnt:=icnt + 1;
              X8[icnt]:=-X6a[i]/2 - sqrt(X7);
            end if;
          end for;
          jcnt:=0;
          for i in 1:icnt loop
                      if X8[i] > 0 then 
              X9[i]:=X1d + X8[i]*(X1c + X8[i]*(X1b + X8[i]*(X1a + X8[i])));
              gdsat:=0;
              if abs(X9[i]) < 1e-06 then 
                jcnt:=jcnt + 1;
                if jcnt < 2 or X8[i] <= gdsat then 
                  gdsat:=X8[i];
                end if;
              end if;
            end if;
          end for;
          vdsat:=if jcnt > 0 then gdsat*gdsat + vbs - PHIval else VDSATval;
        else         vdsat:=VDSATval;
        end if;
        if vds > 0 then 
          BARGsat:=if vbs < vdsat then sqrt(PHIval + vdsat - vbs) else PHIroot/(1 + (vbs - vdsat)/(2*PHIval));
          BS3sat:=BARGsat^3 - Sarg^3;
          if LAMBDA == 0 then 
            if VMAX == 0 then 
              Lfact:=XD/(L*vds);
              Vdiff3:=(vds - vdsat)/4;
              LAMBDAval:=Lfact*sqrt(Vdiff3 + sqrt(1 + Vdiff3*Vdiff3));
            else             DV:=XD/sqrt(NEFF);
            LV:=VMAX*DV/(2*Ueff);
            VQChan:=Vdiff - vdsat - GAMMAval*BARGsat;
            LS:=sqrt(LV*LV + (if vds > vdsat then vds - vdsat else 0));
            Lfact:=DV/(L*vds);
            LAMBDAval:=Lfact*(LS - LV);
            end if;
          else           LAMBDAval:=LAMBDA;
          end if;
        else         BS3sat:=BS3;
        end if;
        BS3eff:=if Vgst <= 0 and vdsat > 0 then BS3sat else BS3;
        WB:=XD*sqrt(PB);
        LD:=L - WB;
        Lfact2:=1 - LAMBDAval*vds;
        Leff:=Lfact2*L;
        DeltaL:=LAMBDAval*vds*L;
        if Leff < WB then 
          LEFFval:=WB/(1 + (DeltaL - LD)/WB);
          LFACTval:=LEFFval/L;
        else         LEFFval:=Leff;
        LFACTval:=Lfact2;
        end if;
        BETAval:=BETA*Ufact/LFACTval;
        cdlin:=vds*(vgs - Type*Vfb - PHIval - Fn2*vds/2) - 2*GAMMAval*BS3eff/3;
        cdsat:=vdsat*(vgs - Type*Vfb - PHIval - Fn2*vdsat/2) - 2*GAMMAval*BS3sat/3;
        vdson:=if vdsat < vds then vdsat else vds;
        cdson:=vdson*(Von - Type*Vfb - PHIval - Fn2*vdson/2) - 2*GAMMAval*BS3eff/3;
        et:=(vgs - Von)/(N*Vt);
        cdsub:=cdson*(if et < EMin then ExMin*(et - EMin + 1) else if et > EMax then ExMax*(et - EMax + 1) else exp(et));
        ids:=sig*BETAval*(if Vgst > 0 and vds <= vdsat then cdlin else if Vgst > 0 and vds > vdsat then cdsat else if Vgst <= 0 and vdsat > 0 then cdsub else 0);
        ids0:=if vds > 1e-08 then ids else 0;
      end MOSeq2;

      function MOSeq3 "Computation of injected drain-source current for Level=3"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Integer Type "Type=1 for NMOS; Type=-1 for PMOS";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VFB "Flat band voltage at reference temperature";
        input Modelica.SIunits.Transconductance KP "Transconductance parameter at reference temperature";
        input Real GAMMA(unit="V^0.5") "Body-effect parameter";
        input Modelica.SIunits.Voltage PHI "Surface inversion potential at reference temperature";
        input Real COX(unit="F/m2") "Specific capacitance of SiO2";
        input Real NFS(unit="1/m2") "Surface fast state density";
        input Modelica.SIunits.Length XJ "Metallurgical junction depth";
        input Modelica.SIunits.Length L "Effective hannel length";
        input Modelica.SIunits.Length W "Effective channel width";
        input Modelica.SIunits.Length LD "Lateral diffusion";
        input Real XD(unit="m/V^0.5") "Depletion factor";
        input Real U0(unit="m2/(V.s)") "Surface mobility at reference temperature";
        input Modelica.SIunits.Velocity VMAX "Maximum drift velocity of carriers";
        input Real DELTA "Width effect on threshold voltage";
        input Real KAPPA "Saturation field factor";
        input Real ETA "Static feedback on threshold voltage";
        input Modelica.SIunits.InversePotential THETA "Mobility modulation";
        input Modelica.SIunits.Voltage EG "Energy gap for temperature effect on saturation current at 0 K";
        input Real EMin "if x < EMin, the exp(x) function is linearized";
        input Real EMax "if x > EMax, the exp(x) function is linearized";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage Vfb "Effective flat band voltage at device temperature";
        output Modelica.SIunits.Voltage Vth "Threshold voltage";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
        output Modelica.SIunits.Voltage vpof "Pinch-off voltage";
      protected 
        constant Real pi=Modelica.Constants.pi;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real ks=11.8 "Dielectric constant of Si";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Real c0=0.0631353;
        constant Real c1=0.8013292;
        constant Real c2=-0.01110777;
        parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of silicon";
        Real Fn=es*DELTA*pi/(2*COX*W) "Working function";
        Real SIGMA=8.15e-22*ETA/(COX*L^3) "Static feedback on threshold voltage";
        Real ExMin=exp(EMin);
        Real ExMax=exp(EMax);
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Voltage Von "Adjusted threshold voltage";
        Modelica.SIunits.Voltage Vgst "vgs - vth";
        Modelica.SIunits.Current idlin "Linear current";
        Modelica.SIunits.Current idsat "Saturation current";
        Modelica.SIunits.Current ids "Drain-source current";
        Modelica.SIunits.Conductance gdsat "Saturation region conductance";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Real cdsub(unit="V2") "Subthreshold region current factor";
        Real et "Subthreshold voltage coefficient";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA "Transconductance at device temperature";
        Modelica.SIunits.Transconductance BETAval "Adjusted transconductance at device temperature";
        Modelica.SIunits.Transconductance BETAeff "Adjusted transconductance at device temperature";
        Modelica.SIunits.Transconductance Beta "Final transconductance at device temperature";
        Real LAMBDAval "Channel length modulation";
        Modelica.SIunits.Length Wp "Width of depleted region in flat source junction";
        Modelica.SIunits.Length Wc "Width of depleted region in source substrate junction";
        Real WpXJ "WP/XJ";
        Real WcXJ "WC/XJ";
        Real Us(unit="m2/(V.s)") "Dependence of mobility on gate electric field";
        Real CB "Specific capacitance of depleted region";
        Real N "Intrinsic carrier concentration at device temperature";
        Modelica.SIunits.ElectricFieldStrength Ep "Lateral field at channel pinch-off";
        Real Fs "Short channel working function";
        Real FB "Body effect working function";
        Modelica.SIunits.Voltage Vbody;
        Modelica.SIunits.Voltage vgsx;
        Modelica.SIunits.Voltage vdsx;
        Modelica.SIunits.Voltage Va;
        Modelica.SIunits.Voltage Vb;
        Modelica.SIunits.Length DL;
        Modelica.SIunits.Length DLval;
        Modelica.SIunits.Length DLfac;
        Real ALPHA(unit="m2/V");
        Real Sarg(unit="V^0.5");
        Real Lfact;
        Real Fd;
        Real FG;
        annotation(Documentation(info="<html>
This function implements a Spice-style <b>Level-3</b> model of the current flowing between drain and source of a MOSFET.  It is is an empirical model that computes the current in its linear, saturation, and weak inversion regions.  Various channel modulation effects are also considered. <p>

The model offers a compromise between the much more sophisticated <b>Level-2</b> model that, however, simulates very slowly, and the often too simple <b>Level-1</b> model that doesn't allow many questions to be answered, such as what is the highest possible switching frequency reachable, how much power is being dissipated at high frequency operation, what is the amount of substrate cross-talk, etc. <p>

The model comments the equations by providing the corresponding equation numbers from [1]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 vbs:     Bulk-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)

 XJ:      Metallurgical junction depth (default value = 0 m)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 LD:      Lateral diffusion (default value = 0 m)

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)

 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s))

 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s)

 DELTA:   Width effect on threshold voltage (default value = 0)

 KAPPA:   Saturation field factor (default value = 0.2)

 ETA:     Static feedback on threshold voltage (default value = 0)

 THETA:   Mobility modulation (default value = 0 1/Volt)

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt)

 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1-3</font>

 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1-3</font>


Output variables:

 isd0:    Drain-source current (Amp)

 Vfb:     Flat band voltage at device temperature (Volt)

 Vth:     Threshold voltage (Volt)

 vdsat:   Saturation voltage (Volt)

 vpof:    Pinch-off voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-52,-20},{20,-40}}, fillColor={191,0,0}, textString="Level = 3"),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-52,-20},{20,-40}}, fillColor={191,0,0}, textString="Level = 3"),Text(lineColor={0,0,255}, extent={{-70,8},{50,-22}}, textString="of a MOS transistor", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0})}));
      algorithm 
        RTemp:=Tdev/Tnom;
        facTemp:=RTemp*sqrt(RTemp);
        Vt:=k*Tdev/q;
        EGref:=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval:=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        PHIval:=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb:=VFB + Type*((PHIval - PHI)/2 + (EGref - EGval)/2);
        KPval:=KP/facTemp;
        BETA:=KPval*W/L;
        Sarg:=if vbs <= 0 then sqrt(PHIval - vbs) else sqrt(PHIval)/(1 + vbs/(2*PHIval));
        if XJ > 0 then 
          Wp:=Sarg*XD;
          WpXJ:=Wp/XJ;
          WcXJ:=c0 + c1*WpXJ + c2*WpXJ*WpXJ;
          Wc:=WcXJ*XJ;
          Fs:=1 - ((LD + Wc)*sqrt(1 - (Wp/(XJ + Wp))^2) - LD)/L;
        else         Fs:=1;
        end if;
        FB:=Fn + (if noEvent(Sarg > 0) then GAMMA*Fs/(4*Sarg) else 0);
        Vbody:=GAMMA*Fs*Sarg + Fn*Sarg*Sarg;
        Vth:=Vfb + Type*(PHIval - SIGMA*vds + Vbody);
        if NFS > 0 then 
          CB:=if noEvent(Vbody > 0 and Sarg > 0) then Vbody/(2*Sarg*Sarg) else 0;
          N:=1 + q*NFS/COX + CB;
          Von:=Type*Vth + N*Vt;
        else         N:=1;
        Von:=Type*Vth;
        end if;
        Vgst:=vgs - Von;
        vgsx:=if vgs > Von then vgs else Von;
        FG:=1/(1 + THETA*(vgsx - Type*Vth));
        Us:=FG*U0;
        BETAval:=FG*BETA;
        Va:=(vgsx - Type*Vth)/(1 + FB);
        Vb:=VMAX*L/Us;
        vdsat:=if VMAX > 0 then Va + Vb - sqrt(Va*Va + Vb*Vb) else Va;
        vpof:=Va;
        vdsx:=if vds < vdsat then vds else vdsat;
        Fd:=if vdsx > 0 and VMAX > 0 then 1/(1 + vdsx/Vb) else 1;
        BETAeff:=Fd*BETAval;
        cdlin:=vdsx*(vgsx - Type*Vth - (1 + FB)*vdsx/2);
        idlin:=BETAeff*cdlin;
        if vds > vdsat then 
          if VMAX > 0 then 
            idsat:=idlin;
            gdsat:=idsat*(1 - Fd)/Vb;
            Ep:=idsat/(gdsat*L);
            ALPHA:=XD*XD;
            DLfac:=Ep*ALPHA/2;
            DL:=sqrt(DLfac*DLfac + KAPPA*ALPHA*(vds - vdsat)) - DLfac;
          else           DL:=sqrt(KAPPA*ALPHA*(vds - vdsat));
          end if;
        else         DL:=0;
        end if;
        DLval:=if DL > 0.5*L then L - L*L/(4*DL) else DL;
        LAMBDAval:=DLval/L;
        Lfact:=1/(1 - LAMBDAval);
        Beta:=Lfact*BETAeff;
        cdsat:=cdlin;
        et:=(vgs - Von)/(N*Vt);
        cdsub:=cdlin*(if et < EMin then ExMin*(et - EMin + 1) else if et > EMax then ExMax*(et - EMax + 1) else exp(et));
        ids:=sig*Beta*(if vdsx > 0 and vds <= vdsat then cdlin else if vdsx > 0 and vds > vdsat and Vgst >= 0 then cdsat else if vdsx > 0 and vds > vdsat and Vgst < 0 then cdsub else 0);
        ids0:=if NFS == 0 and Vgst <= 0 then 0 else ids;
      end MOSeq3;

      block nlCM "Non-linear junction capacitance computation of MOSFET"
        extends Modelica.Blocks.Interfaces.SISO;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        parameter Integer Level=3 "MOSFET modeling level (check documentation window for details)";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
        parameter Real CJ(unit="F/m2")=0.0001 "Zero-bias bulk capacitance per square meter at reference temperature";
        parameter Real MJ=0.33 "Bulk junction grading coefficient";
        parameter Real CJSW(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
        parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
        parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
        parameter Modelica.SIunits.Area A=0 "Diffusion area";
        parameter Modelica.SIunits.Length P=0 "Perimeter width";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-78,72},{76,-56}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-82,-40},{82,-64}}, fillColor={0,0,0}, textString="MOSFET")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-78,72},{76,-56}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-82,-40},{82,-64}}, fillColor={0,0,0}, textString="MOSFET")}));
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=1.77636e-15, y=-120, scale=0.2, rotation=-270)));
      protected 
        Modelica.SIunits.Temperature DTemp "Difference between circuit temperature and reference temperature";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage PBval "Built-in potential at device temperature";
        Real CJval(unit="F/m2") "Zero-bias bulk capacitance per square meter at device temperature";
        Real CJSWval(unit="F/m") "Zero-bias perimeter capacitance per meter at device temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage EGnom "Energy gap at reference temperature";
        Modelica.SIunits.Voltage v "Voltage across capacitance";
        Modelica.SIunits.Capacitance Cval "Non-linear junction capacitance value";
        Real Cbulk(unit="F/m2") "Bulk capacitance per square meter at device temperature";
        Real Cperi(unit="F/m") "Perimeter capacitance per meter at device temperature";
      equation 
        v=u;
        Vt=k*Tdev/q;
        DTemp=Tdev - Tnom;
        RTemp=Tdev/Tnom;
        EGval=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        EGnom=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        PBval=PB*RTemp + EGval - EGnom*RTemp - 3*Vt*log(RTemp);
        CJval=CJ*(1 + MJ*(1 - PBval/PB + 0.0004*DTemp));
        CJSWval=CJSW*(1 + MJSW*(1 - PBval/PB + 0.0004*DTemp));
        if Level == 0 then
          Cbulk=0;
          Cperi=0;
          Cval=1e-16;

        else
          Cbulk=CJval*(if v > FC*PBval then (1 - FC*(1 + MJ) + MJ*v/PBval)/(1 - FC)^(1 + MJ) else 1/noEvent(abs(1 - v/PBval)^MJ));
          Cperi=CJSWval*(if v > FC*PBval then (1 - FC*(1 + MJSW) + MJSW*v/PBval)/(1 - FC)^(1 + MJSW) else 1/noEvent(abs(1 - v/PBval)^MJSW));
          Cval=if A*Cbulk + P*Cperi > 0 then A*Cbulk + P*Cperi else 1e-16;
        end if;
        y=Cval;
      end nlCM;

      block IDS0 "Injected current between drain and source"
        extends Modelica.Blocks.Interfaces.SI2SO;
        parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
        parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage";
        parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
        parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
        parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
        parameter Modelica.SIunits.InversePotential LAMBDA=0 "Channel length modulation";
        parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
        parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
        parameter Real NEFF=1 "Total channel charge coefficient";
        parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
        parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
        parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
        parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
        parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
        parameter Real U0(unit="m2/(V.s)")=0.06 "Surface mobility at reference temperature";
        parameter Real UEXP=0 "Exponential coefficient for mobility";
        parameter Real UTRA=0 "Transverse field coefficient";
        parameter Modelica.SIunits.Velocity VMAX=0 "Maximum drift velocity of carriers";
        parameter Modelica.SIunits.ElectricFieldStrength ECRIT=0 "Critical electric field for pinch-off";
        parameter Real DELTA=0 "Width effect on threshold voltage";
        parameter Real KAPPA=0.2 "Saturation field factor";
        parameter Real ETA=0 "Static feedback on threshold voltage";
        parameter Modelica.SIunits.InversePotential THETA=0 "Mobility modulation";
        parameter Modelica.SIunits.Voltage VBP=0 "Gate to channel critical voltage";
        parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        output Modelica.SIunits.Voltage vds "Drain-source voltage";
        output Modelica.SIunits.Voltage vgs "Gate-source voltage";
        output Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        output Modelica.SIunits.Current ids "Injected drain-source current";
        output Modelica.SIunits.Voltage Vfb "Flat band voltage";
        output Modelica.SIunits.Voltage Vth "Threshold voltage";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
        output Modelica.SIunits.Voltage vdsat1 "Adjusted saturation voltage";
        output Modelica.SIunits.Voltage vpof "Punch-through voltage";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-8,88},{12,76}}, fillColor={0,0,255}, textString="vbs"),Text(lineColor={0,0,255}, extent={{-96,66},{-76,54}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{-96,-54},{-76,-66}}, fillColor={0,0,255}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-10,-78},{10,-90}}, fillColor={0,0,255}, textString="Tdev"),Text(lineColor={0,0,255}, extent={{-80,26},{84,-14}}, fillColor={0,0,255}, textString="between drain and source"),Text(lineColor={0,0,255}, extent={{-50,40},{50,12}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-58,-2},{62,-32}}, fillColor={0,0,255}, textString="of a MOS transistor")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-8,88},{12,76}}, fillColor={0,0,255}, textString="vbs"),Text(lineColor={0,0,255}, extent={{-96,66},{-76,54}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{-96,-54},{-76,-66}}, fillColor={0,0,255}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-10,-78},{10,-90}}, fillColor={0,0,255}, textString="Tdev"),Text(lineColor={0,0,255}, extent={{-50,40},{50,12}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-80,26},{84,-14}}, fillColor={0,0,255}, textString="between drain and source"),Text(lineColor={0,0,255}, extent={{-58,-2},{62,-32}}, fillColor={0,0,255}, textString="of a MOS transistor")}), Documentation(info="<html>
The <b>IDS0</b> block computes the drain-source current of a MOSFET.  Depending on the modeling level, a different algorithm is being used.  The equations for each of these algorithms are programmed in functions, called <b>MOSeq1</b> .. <b>MOSeq3</b> that implement the particular model in question.  These functions have been carefully documented to make it easier on future developers to add additional models of their own by providing corresponding <b>MOSeq_i</b> functions. <p>

<hr> <p>

<pre>
Parameters:

 <font color=red><b>Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model</b></font>

 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 0-4</font>

 VFB:     Flat band voltage (default value = 0 Volt) <font color=red>Levels 0-4</font>

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>) <font color=red>Levels 0-4</font>

 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>) <font color=red>Levels 0-4</font>

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt) <font color=red>Levels 0-4</font>

 LAMBDA:  Channel length modulation  (default value = 0 1/Volt) <font color=red>Levels 0-4</font>

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>) <font color=red>Levels 2-4</font>

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>) <font color=red>Levels 2-4</font>

 NEFF:    Total channel charge coefficient (default value = 1) <font color=red>Levels 2,4</font>

 XJ:      Metallurgical junction depth (default value = 0 m) <font color=red>Levels 2-4</font>

 L:       Channel length (default value = 1e-4 m) <font color=red>Levels 0-4</font>

 W:       Channel width (default value = 1e-4 m) <font color=red>Levels 0-4</font>

 LD:      Lateral diffusion (default value = 0 m) <font color=red>Level 3</font>

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>) <font color=red>Levels 2-4</font>

 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s)) <font color=red>Levels 2-4</font>

 UEXP:    Exponential coefficient for mobility (default value = 0) <font color=red>Levels 2,4</font>

 UTRA:    Transverse field coefficient (default value = 0) <font color=red>Levels 2,4</font>

 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s) <font color=red>Levels 2-4</font>
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation (Levels 2,4)</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation (Levels 2,4)</b></font>

 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m) <font color=red>Levels 2,4</font>

 DELTA:   Width effect on threshold voltage (default value = 0) <font color=red>Levels 2-4</font>

 KAPPA:   Saturation field factor (default value = 0.2) <font color=red>Level 3</font>

 ETA:     Static feedback on threshold voltage (default value = 0) <font color=red>Level 3</font>

 THETA:   Mobility modulation (default value = 0 1/Volt) <font color=red>Level 3</font>

 VBP:     Gate to channel critical voltage (default value = 0 Volt) <font color=red>Levels 2,4</font>

 PB:      Built-in potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 2,4</font>

 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt) <font color=red>Levels 0-4</font>

 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 2-4</font>

 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 2-4</font>
</pre>
</html>

"));
        Modelica.Blocks.Interfaces.RealOutput y1[5] "Connector of Real output signals" annotation(Placement(transformation(x=110.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=3.38542, y=-120, scale=0.2, rotation=-270)));
        Modelica.Blocks.Interfaces.RealInput u3 "Connector of Real input signal 3" annotation(Placement(visible=true, transformation(x=0, y=110, scale=0.1, rotation=-90), iconTransformation(x=2.55828, y=117.442, scale=0.174417, rotation=-90)));
      protected 
        Real sig "sign(vds)";
      equation 
        if noEvent(u1 > 0) then
          sig=1;
          vds=u1;
          vgs=u2;
          vbs=u3;

        else
          sig=-1;
          vds=-u1;
          vgs=u2 - u1;
          vbs=u3 - u1;
        end if;
        if Level == 0 or Level == 1 then
          (ids,Vfb,Vth,vdsat)=MOSeq1(vds=vds, vgs=vgs, vbs=vbs, Tdev=Tdev, sig=sig, Type=Type, Tnom=Tnom, VFB=VFB, KP=KP, GAMMA=GAMMA, PHI=PHI, LAMBDA=LAMBDA, L=L, W=W, EG=EG);
          vdsat1=0;
          vpof=0;

        elseif Level == 2 or Level == 4 then
          (ids,Vfb,Vth,vdsat,vdsat1,vpof)=MOSeq2(vds=vds, vgs=vgs, vbs=vbs, Tdev=Tdev, sig=sig, Level=Level, Type=Type, Tnom=Tnom, VFB=VFB, KP=KP, GAMMA=GAMMA, PHI=PHI, LAMBDA=LAMBDA, COX=COX, NFS=NFS, NEFF=NEFF, XJ=XJ, L=L, W=W, XD=XD, U0=U0, UEXP=UEXP, UTRA=UTRA, VMAX=VMAX, ECRIT=ECRIT, DELTA=DELTA, VBP=VBP, PB=PB, EG=EG, EMin=EMin, EMax=EMax);


        elseif Level == 3 then
          (ids,Vfb,Vth,vdsat,vpof)=MOSeq3(vds=vds, vgs=vgs, vbs=vbs, Tdev=Tdev, sig=sig, Type=Type, Tnom=Tnom, VFB=VFB, KP=KP, GAMMA=GAMMA, PHI=PHI, COX=COX, NFS=NFS, XJ=XJ, L=L, W=W, LD=LD, XD=XD, U0=U0, VMAX=VMAX, DELTA=DELTA, KAPPA=KAPPA, ETA=ETA, THETA=THETA, EG=EG, EMin=EMin, EMax=EMax);
          vdsat1=0;


        else
        end if;
        y=ids;
        y1[1]=Vfb;
        y1[2]=Vth;
        y1[3]=vdsat;
        y1[4]=vdsat1;
        y1[5]=vpof;
      end IDS0;

      model RM "Spice-style resistor model for MOSFETs"
        extends Interfaces.SpiceTwoPort;
        parameter Modelica.SIunits.Resistance R=0 "Resistance at reference temperature";
        parameter Real TR1(unit="1/K")=0 "Linear temperature coefficient";
        parameter Real TR2(unit="1/K2")=0 "Quadratic temperature coefficient";
        Modelica.SIunits.Resistance Rval "Resistance value at circuit temperature";
        parameter Integer Level=3 "MOSFET modeling level (check documentation window for details)";
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, textString="RS", fillColor={0,0,0})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-82,76},{28,-80}}, textString="RS", fillColor={0,0,0})}), Documentation(info="<html>
This is the regular Spice-style resistive source <b>RS</b> model, except that it looks at the modeling level.  If the level is equal to 0, the resistance is set equal to zero.
</html>
"));
      equation 
        if Level == 0 or not R > 0 then
          Rval=0;

        else
          Rval=R*(1 + TR1*DTemp + TR2*DTempSq);
        end if;
        e1=Rval*f1;
        e1*f1=e2*f2;
      end RM;

      model Cgb "Spice-style gate capacitance between gate and bulk of MOSFETs"
        extends Interfaces.SpiceTwoPort;
        constant Real pi=Modelica.Constants.pi;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Modelica.SIunits.ElectronNumberDensity ni=1.45e+16 "Intrinsic carrier concentration";
        constant Real ks=11.8 "Dielectric constant of Si";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Real c0=0.0631353;
        constant Real c1=0.8013292;
        constant Real c2=-0.01110777;
        parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
        parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
        parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
        parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
        parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
        parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
        parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
        parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
        parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
        parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
        parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
        parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
        parameter Real XQC=0 "Coefficient of channel charge share";
        parameter Real DELTA=0 "Width effect on threshold voltage";
        parameter Real ETA=0 "Static feedback on threshold voltage";
        parameter Real CGB0(unit="F/m")=1e-12 "Gate-bulk overlap capacitance per meter";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        Modelica.SIunits.Voltage vds "Drain-source voltage";
        Modelica.SIunits.Voltage vgs "Gate-source voltage";
        Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Voltage Vfb "Flat band voltage at device temperature";
        Modelica.SIunits.Voltage Vth "Threshold voltage";
        Modelica.SIunits.Voltage Von "Adjusted threshold voltage";
        Modelica.SIunits.Capacitance Cval "Gate capacitance between gate and bulk";
        Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(visible=true, transformation(x=0, y=110, scale=0.1, rotation=-450), iconTransformation(x=0, y=100, scale=0.1, rotation=-450)));
        Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" annotation(Placement(visible=true, transformation(x=-60, y=-110, scale=0.1, rotation=-270), iconTransformation(x=-60, y=-100, scale=0.1, rotation=-270)));
        Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 2" annotation(Placement(visible=true, transformation(x=60, y=-110, scale=0.1, rotation=-270), iconTransformation(x=60, y=-100, scale=0.1, rotation=-270)));
      protected 
        parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of Si";
        parameter Modelica.SIunits.Capacitance COXval=W*L*COX "Capacitance of SiO2 layer";
        parameter Real SIGMA=8.15e-22*ETA/(COX*L^3);
        parameter Real Fn=es*DELTA*pi/(2*COX*W);
        Real sig "sign(vds)";
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Length WD "Width of drain depletion region";
        Modelica.SIunits.Length WS "Width of source depletion region";
        Modelica.SIunits.Length Wp "Width of depleted region in flat source junction";
        Modelica.SIunits.Length Wc "Width of depleted region in source substrate junction";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA "Transconductance at device temperature";
        Real CB "Specific capacitance of depletion area";
        Real N "Current emission coefficient";
        Real GAMMAval(unit="V^0.5") "Adjusted body effect parameter";
        Real Fs "Short channel working function";
        Modelica.SIunits.Voltage Vbody;
        Real PHIroot(unit="V^0.5");
        Real Sarg(unit="V^0.5");
        Real Barg(unit="V^0.5");
        Real PHI3(unit="V^1.5");
        Real DSarg(unit="1/V^0.5") "der(Sarg,vbs)";
        Real DBarg(unit="1/V^0.5") "der(Barg,vbs)";
        Real DGAMMA(unit="1/V^0.5") "der(GAMMAval,vbs)";
        Real WSfac;
        Real WDfac;
        Real WpXJ "WP/XJ";
        Real WcXJ "WC/XJ";
      equation 
        RTemp=e2/Tnom;
        facTemp=RTemp*sqrt(RTemp);
        Vt=k*e2/q;
        EGref=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval=EG - GapC1*e2*e2/(e2 + GapC2);
        PHIval=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb=VFB + Type*((PHIval - PHI)/2 + (EGref - EGval)/2);
        KPval=KP/facTemp;
        BETA=KPval*W/L;
        if noEvent(u1 > 0) then
          sig=1;
          vds=u1;
          vgs=e1 + u2;
          vbs=u2;

        else
          sig=-1;
          vds=-u1;
          vgs=e1 - u1 + u2;
          vbs=u2 - u1;
        end if;
        PHIroot=sqrt(PHIval);
        PHI3=PHIval*PHIroot;
        if Level == 0 then
          Sarg=0;
          DSarg=0;
          Barg=0;
          DBarg=0;

        elseif Level == 1 then
          Sarg=if noEvent(vbs <= 0) then sqrt(PHIval - vbs) else max({0,PHIroot - vbs/(2*PHIroot)});
          DSarg=0;
          Barg=0;
          DBarg=0;


        elseif Level == 2 or Level == 4 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=if vbs <= 0 then -0.5/Sarg else -0.5*Sarg*Sarg/PHI3;
          Barg=if vbs < vds then sqrt(PHIval + vds - vbs) else PHIroot/(1 + (vbs - vds)/(2*PHIval));
          DBarg=if vbs < vds then -0.5/Barg else -0.5*Barg*Barg/PHI3;


        elseif Level == 3 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=0;
          Barg=0;
          DBarg=0;


        else
        end if;
        WS=XD*Sarg;
        WD=XD*Barg;
        WSfac=if XJ > 0 then sqrt(1 + 2*WS/XJ) else 0;
        WDfac=if XJ > 0 then sqrt(1 + 2*WD/XJ) else 0;
        GAMMAval=GAMMA*(if XJ > 0 then 1 - 0.5*XJ*(WSfac + WDfac - 2)/L else 1);
        DGAMMA=GAMMA*(if XJ > 0 then -0.5*XD*(DSarg/WSfac + DBarg/WDfac)/L else 0);
        Wp=Sarg*XD;
        WpXJ=if XJ > 0 then Wp/XJ else 0;
        WcXJ=c0 + c1*WpXJ + c2*WpXJ*WpXJ;
        Wc=WcXJ*XJ;
        Fs=if XJ > 0 then 1 - ((LD + Wc)*sqrt(1 - (Wp/(XJ + Wp))^2) - LD)/L else 1;
        Vbody=GAMMA*Fs*Sarg + Fn*Sarg*Sarg;
        if Level == 0 then
          Vth=0;
          CB=0;
          N=0;
          Von=0;

        elseif Level == 1 then
          Vth=Vfb + Type*(PHIval + GAMMA*Sarg);
          CB=0;
          N=0;
          Von=Type*Vth;


        elseif Level == 2 or Level == 4 then
          Vth=Vfb + Type*(PHIval + (GAMMA - GAMMAval)*sqrt(PHIval) + GAMMAval*Sarg + Fn*Sarg*Sarg/2);
          CB=Fn - GAMMAval*DSarg - DGAMMA*Sarg;
          N=if NFS > 0 then 1 + q*NFS/COX + CB else 1;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        elseif Level == 3 then
          Vth=Vfb + Type*(PHIval - SIGMA*vds + Vbody);
          CB=if noEvent(Vbody > 0 and Sarg > 0) then Vbody/(2*Sarg*Sarg) else 0;
          N=1 + q*NFS/COX + CB;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        else
        end if;
        if Level == 0 or not CGB0 > 0 then
          Cval=1e-16;

        else
          Cval=L*CGB0 + (if noEvent(vgs < Von - PHIval) then COXval else if noEvent(vgs >= Von - PHIval and vgs < Von) then COXval*(Von - vgs)/PHIval else 0);
        end if;
        f1=Cval*der(e1);
        f2=0;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,70},{26,-76}}, fillColor={0,0,0}, textString="Cgb"),Text(lineColor={0,0,255}, extent={{-70,-76},{-50,-88}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{50,-76},{70,-88}}, fillColor={0,0,255}, textString="vbs")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,72},{26,-74}}, fillColor={0,0,0}, textString="Cgb")}), Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>

This particular model uses the space charge formula advocated in [2]. <p>

<hr> <p>

<pre>
Parameters:

 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)

 XJ:      Metallurgical junction depth (default value = 0 m)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 LD:      Lateral diffusion (default value = 0 m)

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)

 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>

 DELTA:   Width effect on threshold voltage (default value = 0)

 ETA:     Static feedback on threshold voltage (default value = 1)

 CGB0:    Gate-bulk overlap capacitance per meter (default value = 1e-12 F/m)

 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"));
      end Cgb;

      model Cgs "Spice-style gate capacitance between gate and source of MOSFETs"
        extends Interfaces.SpiceTwoPort;
        constant Real pi=Modelica.Constants.pi;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Modelica.SIunits.ElectronNumberDensity ni=1.45e+16 "Intrinsic carrier concentration";
        constant Real ks=11.8 "Dielectric constant of Si";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Real c0=0.0631353;
        constant Real c1=0.8013292;
        constant Real c2=-0.01110777;
        parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
        parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
        parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
        parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
        parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
        parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
        parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
        parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
        parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
        parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
        parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
        parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
        parameter Real XQC=0 "Coefficient of channel charge share";
        parameter Real DELTA=0 "Width effect on threshold voltage";
        parameter Real ETA=0 "Static feedback on threshold voltage";
        parameter Real CGS0(unit="F/m")=1e-12 "Gate-source overlap capacitance per meter";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        Modelica.SIunits.Voltage vds "Drain-source voltage";
        Modelica.SIunits.Voltage vgs "Gate-source voltage";
        Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Voltage Vfb "Flat band voltage at device temperature";
        Modelica.SIunits.Voltage Vth "Threshold voltage";
        Modelica.SIunits.Voltage Von "Adjusted threshold voltage";
        Modelica.SIunits.Capacitance Cval "Gate capacitance between gate and bulk";
      protected 
        parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of Si";
        parameter Modelica.SIunits.Capacitance COXval=W*L*COX "Capacitance of SiO2 layer";
        parameter Real SIGMA=8.15e-22*ETA/(COX*L^3);
        parameter Real Fn=es*DELTA*pi/(2*COX*W);
        Real sig "sign(vds)";
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Length WD "Width of drain depletion region";
        Modelica.SIunits.Length WS "Width of source depletion region";
        Modelica.SIunits.Length Wp "Width of depleted region in flat source junction";
        Modelica.SIunits.Length Wc "Width of depleted region in source substrate junction";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA "Transconductance at device temperature";
        Real CB "Specific capacitance of depletion area";
        Real N "Current emission coefficient";
        Real GAMMAval(unit="V^0.5") "Adjusted body effect parameter";
        Real Fs "Short channel working function";
        Modelica.SIunits.Voltage Vbody;
        Real PHIroot(unit="V^0.5");
        Real Sarg(unit="V^0.5");
        Real Barg(unit="V^0.5");
        Real PHI3(unit="V^1.5");
        Real DSarg(unit="1/V^0.5") "der(Sarg,vbs)";
        Real DBarg(unit="1/V^0.5") "der(Barg,vbs)";
        Real DGAMMA(unit="1/V^0.5") "der(GAMMAval,vbs)";
        Real WSfac;
        Real WDfac;
        Real WpXJ "WP/XJ";
        Real WcXJ "WC/XJ";
      public 
        Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" annotation(Placement(transformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      public 
        Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 2" annotation(Placement(transformation(x=60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,70},{26,-76}}, fillColor={0,0,0}, textString="Cgs"),Text(lineColor={0,0,255}, extent={{-70,-76},{-50,-88}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{50,-76},{70,-88}}, fillColor={0,0,255}, textString="vbs")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,70},{26,-76}}, fillColor={0,0,0}, textString="Cgs")}), Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>

This particular model uses the space charge formula advocated in [2]. <p>

<hr> <p>

<pre>
Parameters:

 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)

 XJ:      Metallurgical junction depth (default value = 0 m)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 LD:      Lateral diffusion (default value = 0 m)

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)

 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>

 DELTA:   Width effect on threshold voltage (default value = 0)

 ETA:     Static feedback on threshold voltage (default value = 1)

 CGS0:    Gate-source overlap capacitance per meter (default value = 1e-12 F/m)

 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"));
        Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
      equation 
        RTemp=e2/Tnom;
        facTemp=RTemp*sqrt(RTemp);
        Vt=k*e2/q;
        EGref=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval=EG - GapC1*e2*e2/(e2 + GapC2);
        PHIval=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb=VFB + Type*((PHIval - PHI)/2 + (EGref - EGval)/2);
        KPval=KP/facTemp;
        BETA=KPval*W/L;
        if noEvent(u1 > 0) then
          sig=1;
          vds=u1;
          vgs=e1 + u2;
          vbs=u2;

        else
          sig=-1;
          vds=-u1;
          vgs=e1 - u1;
          vbs=u2 - u1;
        end if;
        PHIroot=sqrt(PHIval);
        PHI3=PHIval*PHIroot;
        if Level == 0 then
          Sarg=0;
          DSarg=0;
          Barg=0;
          DBarg=0;

        elseif Level == 1 then
          Sarg=if noEvent(vbs <= 0) then sqrt(PHIval - vbs) else max({0,PHIroot - vbs/(2*PHIroot)});
          DSarg=0;
          Barg=0;
          DBarg=0;


        elseif Level == 2 or Level == 4 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=if vbs <= 0 then -0.5/Sarg else -0.5*Sarg*Sarg/PHI3;
          Barg=if vbs < vds then sqrt(PHIval + vds - vbs) else PHIroot/(1 + (vbs - vds)/(2*PHIval));
          DBarg=if vbs < vds then -0.5/Barg else -0.5*Barg*Barg/PHI3;


        elseif Level == 3 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=0;
          Barg=0;
          DBarg=0;


        else
        end if;
        WS=XD*Sarg;
        WD=XD*Barg;
        WSfac=if XJ > 0 then sqrt(1 + 2*WS/XJ) else 0;
        WDfac=if XJ > 0 then sqrt(1 + 2*WD/XJ) else 0;
        GAMMAval=GAMMA*(if XJ > 0 then 1 - 0.5*XJ*(WSfac + WDfac - 2)/L else 1);
        DGAMMA=GAMMA*(if XJ > 0 then -0.5*XD*(DSarg/WSfac + DBarg/WDfac)/L else 0);
        Wp=Sarg*XD;
        WpXJ=if XJ > 0 then Wp/XJ else 0;
        WcXJ=c0 + c1*WpXJ + c2*WpXJ*WpXJ;
        Wc=WcXJ*XJ;
        Fs=if XJ > 0 then 1 - ((LD + Wc)*sqrt(1 - (Wp/(XJ + Wp))^2) - LD)/L else 1;
        Vbody=GAMMA*Fs*Sarg + Fn*Sarg*Sarg;
        if Level == 0 then
          Vth=0;
          CB=0;
          N=0;
          Von=0;

        elseif Level == 1 then
          Vth=Vfb + Type*(PHIval + GAMMA*Sarg);
          CB=0;
          N=0;
          Von=Type*Vth;


        elseif Level == 2 or Level == 4 then
          Vth=Vfb + Type*(PHIval + (GAMMA - GAMMAval)*sqrt(PHIval) + GAMMAval*Sarg + Fn*Sarg*Sarg/2);
          CB=Fn - GAMMAval*DSarg - DGAMMA*Sarg;
          N=if NFS > 0 then 1 + q*NFS/COX + CB else 1;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        elseif Level == 3 then
          Vth=Vfb + Type*(PHIval - SIGMA*vds + Vbody);
          CB=if noEvent(Vbody > 0 and Sarg > 0) then Vbody/(2*Sarg*Sarg) else 0;
          N=1 + q*NFS/COX + CB;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        else
        end if;
        if Level == 0 or not CGS0 > 0 then
          Cval=1e-16;

        else
          if noEvent(sig > 0) then
            Cval=W*CGS0 + (if noEvent(vgs < Von - PHIval) then 0 else if noEvent(vgs >= Von - PHIval and vgs < Von) then 2*COXval*(1 - (Von - vgs)/PHIval)/3 else if noEvent(vgs >= Von) and noEvent(vgs < Von + vds) then 2*COXval/3 else 2*COXval*(1 - ((vgs - vds - Von)/(2*(vgs - Von) - vds))^2)/3);

          else
            Cval=W*CGS0 + (if noEvent(vgs < Von + vds) then 0 else 2*COXval*(1 - ((vgs - Von)/(2*(vgs - Von) - vds))^2)/3);
          end if;
        end if;
        f1=Cval*der(e1);
        f2=0;
      end Cgs;

      model Cgd "Spice-style gate capacitance between gate and drain of MOSFETs"
        extends Interfaces.SpiceTwoPort;
        constant Real pi=Modelica.Constants.pi;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Modelica.SIunits.ElectronNumberDensity ni=1.45e+16 "Intrinsic carrier concentration";
        constant Real ks=11.8 "Dielectric constant of Si";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        constant Real c0=0.0631353;
        constant Real c1=0.8013292;
        constant Real c2=-0.01110777;
        parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
        parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
        parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
        parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
        parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
        parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
        parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
        parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
        parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
        parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
        parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
        parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
        parameter Real XQC=0 "Coefficient of channel charge share";
        parameter Real DELTA=0 "Width effect on threshold voltage";
        parameter Real ETA=0 "Static feedback on threshold voltage";
        parameter Real CGD0(unit="F/m")=1e-12 "Gate-drain overlap capacitance per meter";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
        Modelica.SIunits.Voltage vds "Drain-source voltage";
        Modelica.SIunits.Voltage vgs "Gate-source voltage";
        Modelica.SIunits.Voltage vbs "Bulk-source voltage";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Voltage EGref "Energy gap at reference temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage PHIval "Surface inversion potential at device temperature";
        Modelica.SIunits.Voltage Vfb "Flat band voltage at device temperature";
        Modelica.SIunits.Voltage Vth "Threshold voltage";
        Modelica.SIunits.Voltage Von "Adjusted threshold voltage";
        Modelica.SIunits.Capacitance Cval "Gate capacitance between gate and bulk";
      protected 
        parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of Si";
        parameter Modelica.SIunits.Capacitance COXval=W*L*COX "Capacitance of SiO2 layer";
        parameter Real SIGMA=8.15e-22*ETA/(COX*L^3);
        parameter Real Fn=es*DELTA*pi/(2*COX*W);
        Real sig "sign(vds)";
        Real RTemp "Temperature quotient";
        Real facTemp "Temperature coefficient";
        Modelica.SIunits.Length WD "Width of drain depletion region";
        Modelica.SIunits.Length WS "Width of source depletion region";
        Modelica.SIunits.Length Wp "Width of depleted region in flat source junction";
        Modelica.SIunits.Length Wc "Width of depleted region in source substrate junction";
        Modelica.SIunits.Transconductance KPval "Transconductance parameter at device temperature";
        Modelica.SIunits.Transconductance BETA "Transconductance at device temperature";
        Real CB "Specific capacitance of depletion area";
        Real N "Current emission coefficient";
        Real GAMMAval(unit="V^0.5") "Adjusted body effect parameter";
        Real Fs "Short channel working function";
        Modelica.SIunits.Voltage Vbody;
        Real PHIroot(unit="V^0.5");
        Real Sarg(unit="V^0.5");
        Real Barg(unit="V^0.5");
        Real PHI3(unit="V^1.5");
        Real DSarg(unit="1/V^0.5") "der(Sarg,vbs)";
        Real DBarg(unit="1/V^0.5") "der(Barg,vbs)";
        Real DGAMMA(unit="1/V^0.5") "der(GAMMAval,vbs)";
        Real WSfac;
        Real WDfac;
        Real WpXJ "WP/XJ";
        Real WcXJ "WC/XJ";
        annotation(Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>

This particular model uses the space charge formula advocated in [2]. <p>

<hr> <p>

<pre>
Parameters:

 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model

 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS

 Tnom:    Reference temperature (default value = 300.15 K)

 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)

 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)

 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)

 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)

 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)

 XJ:      Metallurgical junction depth (default value = 0 m)

 L:       Channel length (default value = 1e-4 m)

 W:       Channel width (default value = 1e-4 m)

 LD:      Lateral diffusion (default value = 0 m)

 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)

 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>

 DELTA:   Width effect on threshold voltage (default value = 0)

 ETA:     Static feedback on threshold voltage (default value = 1)

 CGD0:    Gate-drain overlap capacitance per meter (default value = 1e-12 F/m)

 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,70},{26,-76}}, fillColor={0,0,0}, textString="Cgd"),Text(lineColor={0,0,255}, extent={{-70,-76},{-50,-88}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{50,-76},{70,-88}}, fillColor={0,0,255}, textString="vbs")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,70},{26,-76}}, fillColor={0,0,0}, textString="Cgd")}));
      public 
        Modelica.Blocks.Interfaces.RealInput u1 "Connector of Real input signal 1" annotation(Placement(transformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
      public 
        Modelica.Blocks.Interfaces.RealInput u2 "Connector of Real input signal 2" annotation(Placement(transformation(x=60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
        Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
      equation 
        RTemp=e2/Tnom;
        facTemp=RTemp*sqrt(RTemp);
        Vt=k*e2/q;
        EGref=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        EGval=EG - GapC1*e2*e2/(e2 + GapC2);
        PHIval=RTemp*PHI + EGval - RTemp*EGref - 3*Vt*log(RTemp);
        Vfb=VFB + Type*((PHIval - PHI)/2 + (EGref - EGval)/2);
        KPval=KP/facTemp;
        BETA=KPval*W/L;
        if noEvent(u1 > 0) then
          sig=1;
          vds=u1;
          vgs=e1 + u1;
          vbs=u2;

        else
          sig=-1;
          vds=-u1;
          vgs=e1 - u1 + u2;
          vbs=u2 - u1;
        end if;
        PHIroot=sqrt(PHIval);
        PHI3=PHIval*PHIroot;
        if Level == 0 then
          Sarg=0;
          DSarg=0;
          Barg=0;
          DBarg=0;

        elseif Level == 1 then
          Sarg=if noEvent(vbs <= 0) then sqrt(PHIval - vbs) else max({0,PHIroot - vbs/(2*PHIroot)});
          DSarg=0;
          Barg=0;
          DBarg=0;


        elseif Level == 2 or Level == 4 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=if vbs <= 0 then -0.5/Sarg else -0.5*Sarg*Sarg/PHI3;
          Barg=if vbs < vds then sqrt(PHIval + vds - vbs) else PHIroot/(1 + (vbs - vds)/(2*PHIval));
          DBarg=if vbs < vds then -0.5/Barg else -0.5*Barg*Barg/PHI3;


        elseif Level == 3 then
          Sarg=if vbs <= 0 then sqrt(PHIval - vbs) else PHIroot/(1 + vbs/(2*PHIval));
          DSarg=0;
          Barg=0;
          DBarg=0;


        else
        end if;
        WS=XD*Sarg;
        WD=XD*Barg;
        WSfac=if XJ > 0 then sqrt(1 + 2*WS/XJ) else 0;
        WDfac=if XJ > 0 then sqrt(1 + 2*WD/XJ) else 0;
        GAMMAval=GAMMA*(if XJ > 0 then 1 - 0.5*XJ*(WSfac + WDfac - 2)/L else 1);
        DGAMMA=GAMMA*(if XJ > 0 then -0.5*XD*(DSarg/WSfac + DBarg/WDfac)/L else 0);
        Wp=Sarg*XD;
        WpXJ=if XJ > 0 then Wp/XJ else 0;
        WcXJ=c0 + c1*WpXJ + c2*WpXJ*WpXJ;
        Wc=WcXJ*XJ;
        Fs=if XJ > 0 then 1 - ((LD + Wc)*sqrt(1 - (Wp/(XJ + Wp))^2) - LD)/L else 1;
        Vbody=GAMMA*Fs*Sarg + Fn*Sarg*Sarg;
        if Level == 0 then
          Vth=0;
          CB=0;
          N=0;
          Von=0;

        elseif Level == 1 then
          Vth=Vfb + Type*(PHIval + GAMMA*Sarg);
          CB=0;
          N=0;
          Von=Type*Vth;


        elseif Level == 2 or Level == 4 then
          Vth=Vfb + Type*(PHIval + (GAMMA - GAMMAval)*sqrt(PHIval) + GAMMAval*Sarg + Fn*Sarg*Sarg/2);
          CB=Fn - GAMMAval*DSarg - DGAMMA*Sarg;
          N=if NFS > 0 then 1 + q*NFS/COX + CB else 1;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        elseif Level == 3 then
          Vth=Vfb + Type*(PHIval - SIGMA*vds + Vbody);
          CB=if noEvent(Vbody > 0 and Sarg > 0) then Vbody/(2*Sarg*Sarg) else 0;
          N=1 + q*NFS/COX + CB;
          Von=if NFS > 0 then Type*Vth + N*Vt else Type*Vth;


        else
        end if;
        if Level == 0 or not CGD0 > 0 then
          Cval=1e-16;

        else
          if noEvent(sig > 0) then
            Cval=W*CGD0 + (if noEvent(vgs < Von + vds) then 0 else 2*COXval*(1 - ((vgs - Von)/(2*(vgs - Von) - vds))^2)/3);

          else
            Cval=W*CGD0 + (if noEvent(vgs < Von - PHIval) then 0 else if noEvent(vgs >= Von - PHIval and vgs < Von) then 2*COXval*(1 - (Von - vgs)/PHIval)/3 else if noEvent(vgs >= Von) and noEvent(vgs < Von + vds) then 2*COXval/3 else 2*COXval*(1 - ((vgs - vds - Von)/(2*(vgs - Von) - vds))^2)/3);
          end if;
        end if;
        f1=Cval*der(e1);
        f2=0;
      end Cgd;

      model DjM "Spice-style junction diode model for MOSFETs"
        extends Interfaces.SpiceTwoPort;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        parameter Integer Level=3 "MOSFET modeling level (check documentation window for details)";
        parameter Modelica.SIunits.Current IS=0 "Saturation current at reference temperature";
        parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Current ISval "Saturation current at device temperature";
        Modelica.SIunits.Voltage EGnom "Activation energy at reference temperature";
        Modelica.SIunits.Voltage EGval "Activation energy at device temperature";
      protected 
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Real RTemp "Temperature quotient";
        Real et;
        annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{4,82},{14,72}}, fillColor={128,128,128}, textString="f"),Text(lineColor={0,0,255}, extent={{70,-4},{80,-14}}, fillColor={128,128,128}, textString="e"),Line(points={{-80,-4},{-28,-4},{-6,-2},{0,0}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-66,-6},{-36,-14}}, fillColor={128,128,128}, textString="blocking"),Text(lineColor={0,0,255}, extent={{16,50},{48,42}}, fillColor={128,128,128}, textString="conducting"),Line(points={{0,0},{6,10},{12,28},{16,66}}, color={0,0,0}, thickness=0.5)}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-86,78},{28,-84}}, fillColor={0,0,0}, textString="DjM")}), Documentation(info="<html>
The Spice-style MOSFET junction diode is a regular exponential diode. A separate model was needed to implement the <b>Level</b> parameter of the MOSFET models. <p>

<hr> <p>

<pre>
Parameters:

 Level:  MOSFET modeling level (default value = 3)
           Level=0: Static injection model
           Level=1: Shichman-Hodges model
           Level=2: Grove-Frohman model
           Level=3: Empirical model
           Level=4: Simplified Grove-Frohman model

 IS:     Transport saturation current (default value = 0 Amp)

 EG:     Energy gap for temperature effect on saturation current (default value = 1.11 Volt)

 EMin:   if x &lt; EMin, the exp(x) function is linearized (default value = -100)

 EMax:   if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre>
</html>
"));
      equation 
        Vt=k*e2/q;
        RTemp=e2/Tnom;
        EGval=EG - GapC1*e2*e2/(e2 + GapC2);
        EGnom=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        ISval=IS*exp((EGval - EGnom*RTemp)/Vt);
        et=e1/Vt;
        if Level == 0 then
          f1=0;

        else
          f1=ISval*(if noEvent(et < EMin) then ExMin*(et - EMin + 1) - 1 else if noEvent(et > EMax) then ExMax*(et - EMax + 1) - 1 else exp(et) - 1);
        end if;
        e2*f2=e1*f1;
      end DjM;

    end Utilities;

  end Spice;

  package Switches "Switches of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains a collecion of switching elements for the Modelica bond graph library. <p>

Switches change their computational causality as a function of the switch position.  For this reason, switches must always be attached to a-causal bonds. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E., M. Otter, and H. Elmqvist (1995), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/VarStruc.pdf\">Bond
     Graph Modeling of Variable Structure Systems</a>,\" <i>Proc. ICBGM'95, 2<sup>nd</sup> SCS Intl. Conf. on Bond Graph
     Modeling and Simulation</i>, Las Vegas, Nevada, pp. 49-55.
<li> Krebs, M. (1997), <i><a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/krebs_ms.pdf\">Modeling of Conditional
     Index Changes</a></i>, MS Thesis, Dept. of Electr. & Comp. Engr., University of Arizona, Tucson, AZ. 
</ol>
</html>
"));
    model Sw "Generic switch element of the Modelica bond graph library"
      extends Interfaces.PassiveOnePort;
      Boolean open "Switch position";
      annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-86,0},{74,0}}, color={128,128,128}),Polygon(points={{64,4},{74,0},{64,-4},{64,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-6,80},{-6,-80}}, color={128,128,128}),Polygon(points={{-10,70},{-6,80},{-2,70},{-10,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{0,80},{10,70}}, fillColor={128,128,128}, textString="f"),Text(lineColor={0,0,255}, extent={{64,-4},{74,-14}}, fillColor={128,128,128}, textString="e"),Line(points={{-82,0},{-26,0},{16,0},{60,0}}, color={0,0,0}, thickness=0.5),Ellipse(extent={{-8,2},{-4,-2}}, lineColor={0,0,0}, pattern=LinePattern.Dot, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-6,-44},{16,-52}}, fillColor={128,128,128}, textString="closed"),Text(lineColor={0,0,255}, extent={{20,10},{42,2}}, fillColor={128,128,128}, textString="open"),Text(lineColor={0,0,255}, extent={{-6,0},{14,-10}}, fillColor={128,128,128}, textString="s=0"),Line(points={{-6,-74},{-6,-18},{-6,16},{-6,62}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-6,38},{16,30}}, fillColor={128,128,128}, textString="closed"),Text(lineColor={0,0,255}, extent={{-60,10},{-38,2}}, fillColor={128,128,128}, textString="open")}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-60,80},{60,-80}}, textString="Sw", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,80},{70,40}}, textString="%name")}), Documentation(info="<html>
The generic switch element is a passive OnePort element.  It inherits the effort and flow variables from the passive OnePort.  The switch has an additional modulating Boolean input signal modeling the switch position.  If the modulating input signal has a value of <b>true</b>, the switch is considered <b>open</b>. <p>

The causality of the switch element must be free, i.e., the switch element must be placed inside an algebraic loop. <p>

<hr>

<pre>
Potential variables:

 e:     Bondgraphic effort variable

 f:     Bondgraphic flow variable, normalized positive for flows into the model

 open:  Boolean variable denoting the switch position (modulation input signal)
</pre> <p>

<hr> <p>

Equations: <p>

<b>0 = if open then f else e</b>
</html>
"));
      Modelica.Blocks.Interfaces.BooleanInput BooleanInPort1 "Boolean input signal (true if switch is open)" annotation(Placement(transformation(x=90.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false), iconTransformation(x=90.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
    equation 
      open=BooleanInPort1;
      0=if open then f else e;
    end Sw;

    model Sw3 "Switching between two branches if one is unconnected"
      Interfaces.BondCon p "Positive bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Interfaces.BondCon n2 "Second negative bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Interfaces.BondCon n1 "First negative bond graph connector" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Modelica.Blocks.Interfaces.BooleanInput control "true => p--n2 connected, false => p--n1 connected" annotation(Placement(visible=true, transformation(x=0, y=120, scale=0.2, rotation=-90), iconTransformation(x=0, y=100, scale=0.2, rotation=-90)));
    protected 
      Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
      Bonds.Bond B1 annotation(Placement(transformation(x=-20.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Bonds.Bond B2 annotation(Placement(transformation(x=20.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J0p3 J0p3_1 annotation(Placement(transformation(x=-40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=180.0)));
      Bonds.Bond B4 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J0p2 j0p2_1 annotation(Placement(transformation(x=40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      Junctions.J0p2 j0p2_2 annotation(Placement(transformation(x=40.0, y=20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
      annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-64,80},{56,-80}}, textString="Sw", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-70,-46},{70,-86}}, textString="%name"),Ellipse(extent={{-44,4},{-36,-4}}, lineColor={160,160,160}),Line(points={{-94,0},{-44,0}}, color={160,160,160}),Line(points={{-37,2},{40,50}}, color={160,160,160}),Line(points={{40,50},{94,50}}, color={160,160,160}),Line(points={{40,0},{94,0}}, color={160,160,160}),Line(points={{0,25},{0,80}}, color={255,0,255}),Text(lineColor={0,0,255}, extent={{-92,2},{-72,24}}, textString="p", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{68,-2},{88,20}}, textString="n2", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{68,48},{88,70}}, textString="n1", fillColor={160,160,160})}), Documentation(info="<html>
This is a special switch used to check whether anything is connected from the outside to the connector n2.
If this is the case, the switch should be in the p-n2 position.
If this is not the case, the switch should be in the p-n1 position. <p>

This commuting switch must be used instead of the corresponding <b>Sw4</b> commuting switch, because Dymola
sets by default the flow of an unconnected terminal to zero.  Hence we must not set it to zero once more
externally. <p>

<hr>

<pre>
Bond graph connectors:

 p:           Positive connector

 n1:          First negative connector

 n2:          Second negative connector


Control variables:

 control:     Boolean variable denoting the switch position (modulation signal)
</pre> <p>

<hr> <p>

Logic: <p>

<b>contol = true:   p-n2 is connected</b> <br>
<b>contol = false:  p-n1 is connected</b>
</html>"));
      Sw Sw1 annotation(Placement(visible=true, transformation(x=0, y=60, scale=0.1, rotation=-270)));
      Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=40, scale=0.1, rotation=-270)));
    equation 
      connect(Sw1.BooleanInPort1,control) annotation(Line(visible=true, points={{0,69},{5.51073e-16,75.5},{0,75.5},{0,120}}, color={255,0,255}));
      connect(Sw1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{0,50},{0,50}}, color={192,192,192}));
      connect(B3.BondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,30.2},{0,30},{0,30}}, color={192,192,192}));
      connect(J0p3_1.BondCon1,B4.BondCon1) annotation(Line(points={{-30,1.22461e-15},{-30,0},{-9.8,0}}, color={192,192,192}));
      connect(J0p3_1.BondCon2,p) annotation(Line(points={{-50,-1.22461e-15},{-84,-1.22461e-15},{-84,0},{-100,0}}, color={192,192,192}));
      connect(B2.BondCon1,J1p3_1.BondCon2) annotation(Line(points={{10.2,20},{10,20}}, color={192,192,192}));
      connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-10,20},{-10,20}}, color={192,192,192}));
      connect(J0p3_1.BondCon3,B1.BondCon1) annotation(Line(points={{-40,10},{-40,20},{-29.8,20}}, color={192,192,192}));
      connect(j0p2_1.BondCon2,n2) annotation(Line(points={{50,0},{100,0}}, color={192,192,192}));
      connect(j0p2_2.BondCon1,B2.BondCon2) annotation(Line(points={{30,20},{30,20}}, color={192,192,192}));
      connect(j0p2_2.BondCon2,n1) annotation(Line(points={{50,20},{60,20},{60,50},{100,50}}, color={192,192,192}));
      connect(B4.BondCon2,j0p2_1.BondCon1) annotation(Line(points={{10,0},{30,0}}, color={192,192,192}));
    end Sw3;

  end Switches;

  package Thermal "Thermal models of Modelica bond graph library"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains a number of modeling elements that are used in thermal modeling without convective heat flows, such as in the thermal modeling of buildings. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Nebot, A., F.E. Cellier, and F. Mugica (1999), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/ecoeng_bio2.pdf\">Simulation
     of Heat and Humidity Budget of Biosphere 2 without its Air Conditioning</a>,\" <i>Ecological Engineering</i>,
     <b>13</b>, pp. 333-356.
<li> Weiner, M., and F.E. Cellier (1993), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Publikationen/Weiner.pdf\">Modeling
     and Simulation of a Solar Energy System by Use of Bond Graphs</a>,\" <i>Proc. SCS 1<sup>st</sup> Intl. Conf. on Bond
     Graph Modeling</i>, San Diego, California, pp.301-306. 
</ol>
</html>"));
    package HeatTransfer "1-dimensional heat transfer with lumped elements"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-116,124},{124,75}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a partial reimplementation of the HeatTransfer library that forms part of the Modelica standard library using bond graph technology.
</html>"));
      package Interfaces "Interface models of the heat transfer library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-118,112},{122,63}}, textString="%name", fillColor={255,0,0}),Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,191,0})}), Documentation(info="<html>
Sublibrary of interface models: connectors, wrapper models, and partial models that are being used by the heat transfer library.
</html>"));
        model Heat2BG "Heat to bond graph conversion"
          BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Thermal connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        equation 
          BondCon1.e=port_a.T;
          BondCon1.e*BondCon1.f=port_a.Q_flow;
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={255,0,0}),Line(points={{80,80},{80,-80},{-80,-80}}, color={160,160,160}),Line(points={{94,0},{80,0}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{4,-14},{70,-64}}, textString="BG", fillColor={160,160,160}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255}),Line(points={{-80,0},{-90,0}}, color={255,0,0}),Text(lineColor={0,0,255}, extent={{-66,68},{10,18}}, textString="Heat", fillColor={255,127,127})}), Documentation(info="<html>
This model converts a heat signal to a bondgraphic power signal.
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={255,0,0}),Line(points={{80,80},{80,-80},{-80,-80}}, color={160,160,160}),Line(points={{94,0},{80,0}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{4,-14},{70,-64}}, textString="BG", fillColor={160,160,160}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255}),Line(points={{-80,0},{-90,0}}, color={255,0,0}),Text(lineColor={0,0,255}, extent={{-66,68},{10,18}}, textString="Heat", fillColor={255,127,127})}));
        end Heat2BG;

        model BG2Heat "Bond graph to heat conversion"
          BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b "Thermal connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        equation 
          BondCon1.e=port_b.T;
          BondCon1.e*BondCon1.f=-port_b.Q_flow;
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={160,160,160}),Line(points={{-94,0},{-80,0}}, color={160,160,160}),Line(points={{80,80},{80,-80},{-80,-80}}, color={191,0,0}),Line(points={{90,0},{80,0}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-64,70},{2,20}}, textString="BG", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-8,-16},{68,-66}}, textString="Heat", fillColor={255,127,127}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={160,160,160}),Line(points={{-94,0},{-80,0}}, color={160,160,160}),Line(points={{80,80},{80,-80},{-80,-80}}, color={191,0,0}),Line(points={{90,0},{80,0}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-64,70},{2,20}}, textString="BG", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-8,-16},{68,-66}}, textString="Heat", fillColor={255,127,127}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255})}), Documentation(info="<html>
This model converts a bondgraphic power signal to a heat signal.
</html>"));
        end BG2Heat;

        partial model OnePort "OnePort partial model of heat transfer library"
          Modelica.SIunits.HeatFlowRate Q_flow "Heat flow rate from port_a -> port_b";
          Modelica.SIunits.Temperature dT "port_a.T - port_b.T";
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a "Left thermal connector" annotation(Placement(transformation(x=-110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b "Right thermal connector" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        equation 
          dT=port_a.T - port_b.T;
          Q_flow=port_a.Q_flow;
          annotation(Icon, Diagram);
        end OnePort;

        partial model FixedTemp "Generic fixed temperature boundary condition"
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{101,-100}}, lineColor={0,0,0}, fillColor={159,159,223}, fillPattern=FillPattern.Backward),Line(points={{-92,0},{66,0}}, color={191,0,0}, thickness=0.5),Polygon(points={{60,-20},{60,20},{100,0},{60,-20}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-123,160},{117,100}}, textString="%name"),Text(lineColor={0,0,255}, extent={{-121,-107},{119,-153}}, textString="T=%T", fillColor={0,0,0})}), Diagram, Documentation(info="<html>
Generic temperature source.
</html>"));
        protected 
          BG2Heat BG2Heat1 annotation(Placement(transformation(x=60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sources.mSe Tabs annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Bonds.fBond B1 annotation(Placement(transformation(x=20.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        public 
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port "Thermal connector" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        equation 
          connect(B1.fBondCon1,BG2Heat1.BondCon1) annotation(Line(points={{30,0},{50,0}}, color={192,192,192}));
          connect(B1.eBondCon1,Tabs.BondCon1) annotation(Line(points={{10,0},{10,0}}, color={192,192,192}));
          connect(BG2Heat1.port_b,port) annotation(Line(points={{70,0},{110,0}}, color={191,0,0}));
        end FixedTemp;

      end Interfaces;

      package Sensors "Sensors of the heat transfer library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,118},{120,69}}, textString="%name", fillColor={255,0,0}),Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255})}), Documentation(info="<html>
Sensor elements of the heat transfer library.
</html>"));
        model HeatFlowSensor "Heat flow rate sensor"
          extends Interfaces.OnePort;
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-70,70},{70,-70}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Line(points={{0,70},{0,40}}, color={0,0,0}),Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{-5,5},{5,-5}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{33,-58},{88,-116}}, textString="Q_flow", fillColor={0,0,0}),Line(points={{70,0},{100,0}}, color={191,0,0}),Line(color={0,0,255}, points={{0,-70},{0,-90}}),Text(lineColor={0,0,255}, extent={{-120,144},{120,84}}, textString="%name"),Line(points={{-100,0},{-70,0}}, color={191,0,0})}), Diagram, Documentation(info="<html>
Heat flow sensor.  From a bond graph perspective, the heat flow is the power flowing through a bond.
This is being measured using a power bond sensor.
</html>"));
          Modelica.Blocks.Interfaces.RealOutput Q_flow1(redeclare type SignalType= Modelica.SIunits.HeatFlowRate ) "Heat flow from port_a to port_b" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-450), iconTransformation(x=0, y=-100, scale=0.1, rotation=-450)));
        protected 
          Interfaces.Heat2BG Heat2BG1 annotation(Placement(transformation(x=-60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Interfaces.BG2Heat BG2Heat1 annotation(Placement(transformation(x=60.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sensors.Pbond B1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        equation 
          connect(B1.P,Q_flow1) annotation(Line(visible=true, points={{0,9},{0,20},{30,20},{30,-40},{0,-40},{0,-110}}, color={0,0,191}));
          connect(Heat2BG1.port_a,port_a) annotation(Line(points={{-70,0},{-110,0}}, color={191,0,0}));
          connect(BG2Heat1.port_b,port_b) annotation(Line(points={{70,0},{110,0}}, color={191,0,0}));
          connect(Heat2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-50,0},{-9.8,0}}, color={192,192,192}));
          connect(B1.BondCon2,BG2Heat1.BondCon1) annotation(Line(points={{10,0},{50,0}}, color={192,192,192}));
        end HeatFlowSensor;

      end Sensors;

      package Sources "Sources of the heat transfer library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,118},{120,69}}, textString="%name", fillColor={255,0,0}),Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255})}), Documentation(info="<html>
Source elements of the heat transfer library.
</html>"));
        model FixedTemperature "Fixed temperature boundary condition in Kelvin"
          extends Interfaces.FixedTemp;
          parameter Modelica.SIunits.Temperature T=298.15 "Fixed temperature at port";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{0,0},{-100,-100}}, textString="K", fillColor={0,0,0})}), Documentation(info="<html>
Absolute temperature source (in Kelvin).
</html>"));
        equation 
          Tabs.s=T;
        end FixedTemperature;

      end Sources;

      package Switches "Heat switches"
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,118},{120,69}}, textString="%name", fillColor={255,0,0}),Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255})}), Documentation(info="<html>
Switches of the heat transfer library.
</html>"));
        model HeatBranch "Branching of heat depending on a whether port n2 is connected"
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a p "Positive thermal connector" annotation(Placement(transformation(x=-110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b n1 "First negative thermal connector" annotation(Placement(transformation(x=110.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b n2 "Second negative thermal connector" annotation(Placement(transformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=110.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Blocks.Interfaces.BooleanInput control "true => p--n2 connected, false => p--n1 connected" annotation(Placement(visible=true, transformation(x=0, y=100, scale=0.2, rotation=-90), iconTransformation(x=0, y=100, scale=0.2, rotation=90)));
        protected 
          BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=-30.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=30.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Bonds.Bond B3 annotation(Placement(transformation(x=30.0, y=10.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Thermal.HeatTransfer.Interfaces.Heat2BG Heat2BG1 annotation(Placement(transformation(x=-70.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(transformation(x=70.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat2 annotation(Placement(transformation(x=70.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Switches.Sw3 Sw1 annotation(Placement(visible=true, transformation(x=0, y=0, scale=0.2)));
        equation 
          connect(Sw1.n1,B3.BondCon1) annotation(Line(visible=true, points={{20,10},{20.2,10}}, color={192,192,192}));
          connect(Sw1.n2,B2.BondCon1) annotation(Line(visible=true, points={{20,0},{20.2,0}}, color={192,192,192}));
          connect(B1.BondCon2,Sw1.p) annotation(Line(visible=true, points={{-20,0},{-20,0}}, color={192,192,192}));
          connect(Sw1.control,control) annotation(Line(visible=true, points={{0,20},{0,120}}, color={255,0,255}));
          annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-44,4},{-36,-4}}, lineColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-80,0},{-60,22}}, textString="p", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{60,50},{80,72}}, textString="n1", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{60,0},{80,22}}, textString="n2", fillColor={191,0,0}),Line(points={{-100,0},{-44,0}}, color={191,0,0}),Line(points={{-37,2},{40,50}}, color={191,0,0}),Line(points={{40,50},{100,50}}, color={191,0,0}),Line(points={{40,0},{100,0}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Line(points={{0,25},{0,80}}, color={255,0,255})}), Documentation(info="<html>
This is a special heating switch used to check whether anything is connected from the outside to the connector n2.
If this is the case, the switch should be in the p-n2 position.
If this is not the case, the switch should be in the p-n1 position.
</html>"));
          connect(Heat2BG1.port_a,p) annotation(Line(points={{-80,0},{-110,0}}, color={191,0,0}));
          connect(Heat2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-60,0},{-39.8,0}}, color={192,192,192}));
          connect(BG2Heat1.port_b,n1) annotation(Line(points={{80,50},{110,50}}, color={191,0,0}));
          connect(BG2Heat1.BondCon1,B3.BondCon2) annotation(Line(points={{60,50},{50,50},{50,10},{40,10}}, color={192,192,192}));
          connect(BG2Heat2.port_b,n2) annotation(Line(points={{80,0},{110,0}}, color={191,0,0}));
          connect(BG2Heat2.BondCon1,B2.BondCon2) annotation(Line(points={{60,0},{40,0}}, color={192,192,192}));
        end HeatBranch;

      end Switches;

    end HeatTransfer;

  end Thermal;

  package Electrical "Electrical circuit diagrams built from bond graphs"
    annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a partial reimplementation of the standard electrical Modelica library using bond graph technology.
</html>
"));
    package Analog "Analog electircal circuits built from bond graph technology"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,120},{120,71}}, textString="%name", fillColor={255,0,0}),Rectangle(lineColor={0,0,255}, extent={{-100,-98},{80,52}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,52},{-80,72},{100,72},{80,52},{-100,52}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,72},{100,-78},{80,-98},{80,52},{100,72}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,37},{65,-83}}, textString="Library", fillColor={0,0,255})}), Documentation(info="<html>
This package offers a partial reimplementation of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
      package Interfaces "Interfaces of the analog electrical library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-118,112},{122,63}}, textString="%name", fillColor={255,0,0}),Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,191,0})}), Documentation(info="<html>
This package provides some interface models for the analog electrical library built in bond graph technology.
</html>
"));
        model El2BG "Electrical to bond graph conversion"
          Modelica.Electrical.Analog.Interfaces.PositivePin p "Electrical connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-80,-80},{-80,80},{80,80},{-80,-80}}),Line(points={{80,80},{80,-80},{-80,-80}}, color={160,160,160}),Line(points={{94,0},{80,0}}, color={160,160,160}),Line(points={{-90,0},{-80,0}}, color={127,0,255}),Text(lineColor={0,0,255}, extent={{-64,56},{0,12}}, textString="El", fillColor={127,127,255}),Text(lineColor={0,0,255}, extent={{4,-14},{70,-64}}, textString="BG", fillColor={160,160,160}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-80,-80},{-80,80},{80,80},{-80,-80}}),Line(points={{80,80},{80,-80},{-80,-80}}, color={160,160,160}),Line(points={{94,0},{80,0}}, color={160,160,160}),Line(points={{-96,0},{-80,0}}, color={127,0,255}),Text(lineColor={0,0,255}, extent={{-64,56},{0,12}}, textString="El", fillColor={127,127,255}),Text(lineColor={0,0,255}, extent={{4,-14},{70,-64}}, textString="BG", fillColor={160,160,160}),Line(points={{-50,0},{52,0}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{52,0},{40,-10}}, color={0,0,255})}), Documentation(info="<html>
This model converts an electrical wire to a bondgraphic power signal.
</html>
"));
        equation 
          BondCon1.e=p.v;
          BondCon1.f=p.i;
        end El2BG;

        model BG2El "Bond graph to electrical conversion"
          Modelica.Electrical.Analog.Interfaces.NegativePin n "Electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Interfaces.BondCon BondCon1 "Bond graph connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={160,160,160}),Line(points={{-94,0},{-80,0}}, color={160,160,160}),Line(color={0,0,255}, points={{80,80},{80,-80},{-80,-80}}),Line(color={0,0,255}, points={{96,0},{80,0}}),Text(lineColor={0,0,255}, extent={{-64,70},{2,20}}, textString="BG", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{0,-16},{64,-60}}, textString="El", fillColor={127,127,255}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,-80},{-80,80},{80,80},{-80,-80}}, color={160,160,160}),Line(points={{-94,0},{-80,0}}, color={160,160,160}),Line(color={0,0,255}, points={{80,80},{80,-80},{-80,-80}}),Line(color={0,0,255}, points={{90,0},{80,0}}),Text(lineColor={0,0,255}, extent={{-64,70},{2,20}}, textString="BG", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{0,-16},{64,-60}}, textString="El", fillColor={127,127,255}),Line(points={{52,0},{40,-10}}, color={0,0,255}),Line(points={{52,0},{40,10}}, color={0,0,255}),Line(points={{-50,0},{52,0}}, color={0,0,255})}), Documentation(info="<html>
This model converts a bondgraphic power signal to an electrical wire.
</html>
"));
        equation 
          BondCon1.e=n.v;
          BondCon1.f=-n.i;
        end BG2El;

        partial model OnePort "OnePort partial model of analog electrical library"
          Modelica.SIunits.Voltage v "Voltage drop between the two pins";
          Modelica.SIunits.Current i "Current flowing from pin p to pin n";
          Modelica.Electrical.Analog.Interfaces.PositivePin p "Left electrical connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n "Right electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon, Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-110,18},{-85,18}}, color={160,160,160}),Polygon(points={{-95,21},{-85,18},{-95,15},{-95,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{90,18},{115,18}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-114,17},{-94,37}}, textString="i", fillColor={160,160,160}),Polygon(points={{105,21},{115,18},{105,15},{105,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{98,39},{118,19}}, textString="i", fillColor={160,160,160}),Line(points={{-127,0},{-117,0}}, color={160,160,160}),Line(points={{-122,-5},{-122,5}}, color={160,160,160}),Line(points={{117,0},{127,0}}, color={160,160,160})}));
        equation 
          v=p.v - n.v;
          i=p.i;
        end OnePort;

        partial model OnePortV "OnePort partial model of analog electrical library for capacitors"
          parameter Modelica.SIunits.Voltage u0=0 "Initial voltage across capacitor";
          parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
          Modelica.SIunits.Voltage v(start=u0, stateSelect=if enforceStates then StateSelect.prefer else StateSelect.default) "Voltage drop between the two pins";
          Modelica.SIunits.Current i "Current flowing from pin p to pin n";
          Modelica.Electrical.Analog.Interfaces.PositivePin p "Left electrical connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n "Right electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon, Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-110,18},{-85,18}}, color={160,160,160}),Polygon(points={{-95,21},{-85,18},{-95,15},{-95,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{90,18},{115,18}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-114,17},{-94,37}}, textString="i", fillColor={160,160,160}),Polygon(points={{105,21},{115,18},{105,15},{105,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{98,39},{118,19}}, textString="i", fillColor={160,160,160}),Line(points={{-127,0},{-117,0}}, color={160,160,160}),Line(points={{-122,-5},{-122,5}}, color={160,160,160}),Line(points={{117,0},{127,0}}, color={160,160,160})}));
        equation 
          v=p.v - n.v;
          i=p.i;
        end OnePortV;

        partial model OnePortI "OnePort partial model of analog electrical library for inductors"
          parameter Modelica.SIunits.Current i0=0 "Initial current across inductor";
          parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
          Modelica.SIunits.Voltage v "Voltage drop between the two pins";
          Modelica.SIunits.Current i(start=i0, stateSelect=if enforceStates then StateSelect.prefer else StateSelect.default) "Current flowing from pin p to pin n";
          Modelica.Electrical.Analog.Interfaces.PositivePin p "Left electrical connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n "Right electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon, Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-110,18},{-85,18}}, color={160,160,160}),Polygon(points={{-95,21},{-85,18},{-95,15},{-95,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{90,18},{115,18}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-114,17},{-94,37}}, textString="i", fillColor={160,160,160}),Polygon(points={{105,21},{115,18},{105,15},{105,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{98,39},{118,19}}, textString="i", fillColor={160,160,160}),Line(points={{-127,0},{-117,0}}, color={160,160,160}),Line(points={{-122,-5},{-122,5}}, color={160,160,160}),Line(points={{117,0},{127,0}}, color={160,160,160})}));
        equation 
          v=p.v - n.v;
          i=p.i;
        end OnePortI;

        partial model ModOnePortV "Modulated OnePort partial model of analog electrical library for capacitors"
          parameter Real u0=0 "Initial voltage across capacitor";
          parameter Boolean enforceStates=true "use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
          Modelica.SIunits.Voltage v(start=u0, stateSelect=if enforceStates then StateSelect.prefer else StateSelect.default) "Voltage drop between the two pins";
          Modelica.SIunits.Current i "Current flowing from pin p to pin n";
          Modelica.Electrical.Analog.Interfaces.PositivePin p "Left electrical connector" annotation(Placement(transformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n "Right electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon, Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-112,18},{-87,18}}, color={160,160,160}),Polygon(points={{-97,21},{-87,18},{-97,15},{-97,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{88,18},{113,18}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-116,17},{-96,37}}, textString="i", fillColor={160,160,160}),Polygon(points={{103,21},{113,18},{103,15},{103,21}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{96,39},{116,19}}, textString="i", fillColor={160,160,160}),Line(points={{-123,0},{-113,0}}, color={160,160,160}),Line(points={{-118,-5},{-118,5}}, color={160,160,160}),Line(points={{115,0},{125,0}}, color={160,160,160})}));
          Modelica.Blocks.Interfaces.RealInput u "Modulation signal" annotation(Placement(visible=true, transformation(x=0, y=90, scale=0.1, rotation=-90), iconTransformation(x=0, y=90, scale=0.1, rotation=-90)));
        equation 
          v=p.v - n.v;
          i=p.i;
        end ModOnePortV;

      end Interfaces;

      package Basic "Basic elements of the analog electrical library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-120,114},{120,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a partial reimplementation of the <i>Basic</i> package of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
        model Ground "Electrical ground"
          Modelica.Electrical.Analog.Interfaces.Pin p "Electrical connector" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-60,40},{60,40}}),Line(color={0,0,255}, points={{-40,20},{40,20}}),Line(color={0,0,255}, points={{-20,0},{20,0}}),Line(color={0,0,255}, points={{0,90},{0,40}}),Text(lineColor={0,0,255}, extent={{-100,-78},{100,-20}}, textString="%name")}), Diagram, Documentation(info="<html>
The electrical ground is modeled as an effort source injecting zero effort.
</html>
"));
        protected 
          BondLib.Bonds.fBond B1 annotation(Placement(visible=true, transformation(x=0, y=0, scale=0.2, rotation=-270)));
          BondLib.Sources.Se V0(e0=0) annotation(Placement(visible=true, transformation(x=0, y=-40, scale=0.2, rotation=-90)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(visible=true, transformation(x=0, y=40, scale=0.2, rotation=-90)));
        equation 
          connect(El2BG1.p,p) annotation(Line(visible=true, points={{0,60},{0,60},{0,100}}, color={0,0,255}));
          connect(El2BG1.BondCon1,B1.fBondCon1) annotation(Line(visible=true, points={{0,20},{0,20}}, color={192,192,192}));
          connect(B1.eBondCon1,V0.BondCon1) annotation(Line(visible=true, points={{0,-20},{0,-20}}, color={192,192,192}));
        end Ground;

      end Basic;

      package Semiconductors "Semiconductor models of the analog electrical library"
        package Utilities "Utilities for semiconductor models of analog electrical library"
          annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used inside some of the semiconductor models of the analog electrical library built from bond graph technology.
</html>
"));
          model VariableCapacitor2 "Modulated electrical capacitor"
            extends Interfaces.ModOnePortV;
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(color={0,0,255}, points={{14,0},{90,0}}),Line(points={{0,80},{0,28}}, color={0,0,255}),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-134,-96},{136,-36}}, textString="%name")}), Diagram, Documentation(info="<html>
This modulated capacitor is built in bondgraphic technology from a bond graph <b>mC2</b> element, a 1-junction, and three bonds.  A-causal bonds must be used here, because the causality depends on the embedding of the capacitor in its environment. <p>

It is not recommended to use this model.  The regular <b>VariableCapacitor</b> model should be used always.  For this reason, this model has been hidden inside the Utilities package.  However, since the Ebers-Moll bipolar transistor models make use of this model, it had to be constructed. <p>

<hr>

<pre>
Potential variables:

 C:  Capacitance (modulation input signal)
</pre>
</html>
"));
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=24, scale=0.12, rotation=-270)));
            BondLib.Semiconductors.Utilities.mC2 mC1(e(start=u0)) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
          equation 
            connect(u,mC1.s) annotation(Line(visible=true, points={{0,90},{0,74.4},{0,58.8},{0,58.8}}, color={0,0,191}));
            connect(B3.BondCon2,mC1.BondCon1) annotation(Line(visible=true, points={{0,36},{0,36}}, color={192,192,192}));
            connect(B3.BondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,12.24},{-7.20069e-16,12.12},{0,12.12},{0,12}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,0},{-12,0}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,0},{12.26,0}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,1.77636e-15},{-38,0},{-37.74,0}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,0},{38,1.77636e-15}}, color={192,192,192}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-79,1.77636e-15},{-79,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
          end VariableCapacitor2;

        end Utilities;

        annotation(preferedView="info", Documentation(info="<html>
This package offers a partial reimplementation of the <i>Semiconductors</i> package of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
      end Semiconductors;

      package Sensors "Sensors of analog electrical library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a reimplementation of the <i>Sensors</i> package of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
        model VoltageSensor "Sensor of electrical voltage"
          extends Interfaces.OnePort;
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-70,70},{70,-70}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Line(points={{0,70},{0,40}}, color={0,0,0}),Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{-5,5},{5,-5}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-29,-11},{30,-70}}, textString="V", fillColor={0,0,0}),Line(points={{-70,0},{-90,0}}, color={0,0,0}),Line(points={{70,0},{90,0}}, color={0,0,0}),Line(color={0,0,255}, points={{0,-90},{0,-70}}),Text(lineColor={0,0,255}, extent={{-150,72},{150,112}}, textString="%name")}), Diagram, Documentation(info="<html>
Sensor of electrical voltage built in bond graph technology using an effort sensor.
</html>
"));
          Modelica.Blocks.Interfaces.RealOutput V(redeclare type SignalType= Modelica.SIunits.Voltage ) "Voltage sensor" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-90), iconTransformation(x=0, y=-100, scale=0.1, rotation=-90)));
        protected 
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
          Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
          Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
          BondLib.Sensors.De De1 annotation(Placement(visible=true, transformation(x=0, y=-48, scale=0.12, rotation=-90)));
          Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=-24, scale=0.12, rotation=-450)));
        equation 
          connect(De1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{0,-36},{3.67382e-15,-36}}, color={192,192,192}));
          connect(B3.BondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{-3.60034e-15,-12.24},{2.16021e-15,-18.12},{0,-18.12},{0,-12}}, color={192,192,192}));
          connect(De1.OutPort1,V) annotation(Line(visible=true, points={{0,-61.2},{8.0824e-16,-74.6},{0,-74.6},{0,-110}}, color={0,0,191}));
          connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,0},{-12,0}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,0},{12.26,0}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,1.77636e-15},{-38,0},{-37.74,0}}, color={192,192,192}));
          connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,0},{38,1.77636e-15}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
        end VoltageSensor;

      end Sensors;

      package Sources "Sources of analog electrical library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a reimplementation of the <i>Sources</i> package of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
        model RampVoltage "Ramp voltage source of analog electrical library"
          extends Interfaces.OnePort;
          parameter Modelica.SIunits.Voltage V=1 "Height of ramp";
          parameter Modelica.SIunits.Time duration(min=Modelica.Constants.small)=2 "Duration of ramp";
          parameter Modelica.SIunits.Voltage offset=0 "Voltage offset";
          parameter Modelica.SIunits.Time startTime=0 "Time offset";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,50},{-20,0}}, fillColor={0,0,255}, textString="+"),Ellipse(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{20,50},{120,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-150,80},{150,120}}, textString="%name"),Line(points={{-80,-60},{-50,-60},{50,60},{80,60}}, color={192,192,192}),Line(points={{-90,0},{90,0}}, color={0,0,0})}), Diagram, Documentation(info="<html>
The ramp voltage source is built in bondgraphic technology from a bond graph <b>rampSe</b> element, a 1-junction, and three bonds.  A-causal bonds must be used except at the source, because the causality depends on the embedding of the voltage source in its environment. <p>

<hr>

<pre>
Parameters:

 V:          Height of source voltage ramp (default value = 1 Volt)

 duration:   Duration of source voltage ramp (default value = 2 sec)

 offset:     Offset of ramp to be generated (default value = 0 Volt)

 startTime:  Start time of ramp to be generated (default value = 0 sec)
</pre>
</html>
"));
        protected 
          Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
          Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          BondLib.Sources.rampSe V1(e0=V, duration=duration, offset=offset, startTime=startTime) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
          Bonds.fBond B3 annotation(Placement(visible=true, transformation(x=0, y=24, scale=0.12, rotation=-90)));
        equation 
          connect(B3.eBondCon1,V1.BondCon1) annotation(Line(visible=true, points={{0,36},{0,36}}, color={192,192,192}));
          connect(B3.fBondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,12},{0,12}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,0},{12,1.46953e-15}}, color={192,192,192}));
          connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,1.77636e-15},{38,-1.44014e-15},{37.74,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,1.77636e-15},{-38,1.46953e-15}}, color={192,192,192}));
          connect(J1p3_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,0},{-12.13,0},{-12.13,-1.44014e-15},{-12.26,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-78,1.77636e-15},{-78,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
        end RampVoltage;

        model TrapezoidVoltage "Trapezoidal voltage source of analog electrical library"
          extends Interfaces.OnePort;
          parameter Modelica.SIunits.Voltage V=1 "Amplitude of trapezoidal function";
          parameter Modelica.SIunits.Time rising(final min=0)=0 "Rising duration of trapezoid";
          parameter Modelica.SIunits.Time width(final min=0)=0.5 "Width duration of trapezoid";
          parameter Modelica.SIunits.Time falling(final min=0)=0 "Falling duration of trapezoid";
          parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
          parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
          parameter Modelica.SIunits.Voltage offset=0 "Voltage offset";
          parameter Modelica.SIunits.Time startTime=0 "Time offset";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,50},{-20,0}}, fillColor={0,0,255}, textString="+"),Ellipse(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{20,50},{120,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-150,80},{150,120}}, textString="%name"),Line(points={{-90,0},{90,0}}, color={0,0,0}),Line(points={{-81,-70},{-60,-70},{-30,70},{1,70},{30,-70},{51,-70},{80,70}}, color={192,192,192})}), Diagram, Documentation(info="<html>
The trapezoidal voltage source is built in bondgraphic technology from a bond graph <b>trapSe</b> element, a 1-junction, and three bonds.  A-causal bonds must be used except at the source, because the causality depends on the embedding of the voltage source in its environment. <p>

<hr>

<pre>
Parameters:

 V:          Amplitude of source voltage trapezoid (default value = 1 Volt)

 rising:     Length of rising time of trapezoid to be generated (default value = 0 sec)

 width :     Length of on state of trapezoid to be generated (default value = 0.5 sec)

 falling:    Length of falling time of trapezoid to be generated (default value = 0 sec)

 period:     Length of period of trapezoid to be generated (default value = 1 sec)

 nperiod:    Number of periods of trapezoid to be generated
             an infinite number of periods is being generated if nperiod &lt; 0 (default value = -1)

 offset:     Offset of trapezoid to be generated (default value = 0 Volt)

 startTime:  Start time of trapezoid to be generated (default value = 0 sec)
</pre>
</html>
"));
        protected 
          Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
          Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          BondLib.Sources.trapSe V1(e0=V, rising=rising, width=width, falling=falling, period=period, nperiod=nperiod, offset=offset, startTime=startTime) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
          Bonds.fBond B3 annotation(Placement(visible=true, transformation(x=0, y=24, scale=0.12, rotation=-90)));
        equation 
          connect(B3.eBondCon1,V1.BondCon1) annotation(Line(visible=true, points={{0,36},{0,36}}, color={192,192,192}));
          connect(B3.fBondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,12},{0,12}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,0},{12,1.46953e-15}}, color={192,192,192}));
          connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,1.77636e-15},{38,-1.44014e-15},{37.74,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,1.77636e-15},{-38,1.46953e-15}}, color={192,192,192}));
          connect(J1p3_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,0},{-12.13,0},{-12.13,-1.44014e-15},{-12.26,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
        end TrapezoidVoltage;

      end Sources;

      package Spice "Spice-style models of electronic circuits"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains Spice-style models of electronic circuit elements.  The library implements facets of a dialect of <b>HSpice</b>, called <b>BBSpice</b>, further developed from HSpice at <i>Burr Brown, Inc.</i> in Tucson Arizona, a company that has meanwhile been acquired by <i>Texas Instruments, Inc.</i>  The semiconductor models are further decomposed into equivalent circuits at the graphic circuit diagram layer to make the models more easily understandable. <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, Chapter 6.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
        package Interfaces "Common interfaces of Spice-style models"
          annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-118,112},{122,63}}, textString="%name", fillColor={255,0,0}),Rectangle(extent={{-100,-100},{80,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={0,191,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,191,0})}), Documentation(info="<html>
This package contains common interfaces of Spice-style electronic circuit element models.
</html>
"));
          partial model SpiceTwoPort "TwoPort interface for Spice-style models"
            extends BondLib.Electrical.Analog.Interfaces.OnePort;
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-40,86},{40,56}}, textString="%name")}), Documentation(info="<html>
All Spice-style OnePorts must have an additional HeatPort, even capacitors and inductors.  The reason is that they need the current circuit temperature, which they import through the HeatPort.
</html>
"), Diagram);
          end SpiceTwoPort;

          partial model SpiceTwoPortV "TwoPort interface for Spice-style models"
            extends BondLib.Electrical.Analog.Interfaces.OnePortV;
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-40,86},{40,56}}, textString="%name")}), Documentation(info="<html>
All Spice-style OnePorts must have an additional HeatPort, even capacitors and inductors.  The reason is that they need the current circuit temperature, which they import through the HeatPort.
</html>
"), Diagram);
          end SpiceTwoPortV;

          partial model SpiceTwoPortI "TwoPort interface for Spice-style models"
            extends BondLib.Electrical.Analog.Interfaces.OnePortI;
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-40,86},{40,56}}, textString="%name")}), Documentation(info="<html>
All Spice-style OnePorts must have an additional HeatPort, even capacitors and inductors.  The reason is that they need the current circuit temperature, which they import through the HeatPort.
</html>
"), Diagram);
          end SpiceTwoPortI;

        end Interfaces;

        model R "Spice-style resistor of the analog electrical library"
          extends Interfaces.SpiceTwoPort;
          parameter Modelica.SIunits.Resistance R=1 "Resistance at reference temperature";
          parameter Real TR1(unit="1/K")=0 "Linear temperature coefficient";
          parameter Real TR2(unit="1/K2")=0 "Quadratic temperature coefficient";
          parameter Real Area=1 "Relative area occupied by resistor";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(color={0,0,255}, points={{-90,0},{-70,0}}),Line(color={0,0,255}, points={{70,0},{90,0}}),Line(points={{0,-30},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,-32},{100,-94}}, textString="R=%R", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,0},{-40,-20}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{-60,0},{-40,-20}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{-40,-10},{-30,-10}}, color={255,127,255}),Line(points={{-30,-10},{-30,-30}}, color={255,127,255}),Line(points={{-30,-30},{-14,-30}}, color={255,127,255})}), Documentation(info="<html>
The Spice-style resistor has a reference resistance value computed at the reference temperature, <b>Tnom</b>, and for a relative area of <b>Area=1</b>.  It changes its value as a function of the circuit temperature and the relative area occupied by the resistor. <p>

The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>

<hr> <p>

<pre>
Parameters:

 R:     Reference resistance (default value = 1 Ohm)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TR1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TR2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)

 Area:  Relative area occupied by resistor (default value = 1)
</pre> <p>
</html>
"));
        protected 
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B1 annotation(Placement(transformation(x=-20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B2 annotation(Placement(transformation(x=20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B3 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.fBond B6 annotation(Placement(transformation(x=-30.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sources.Se T_nom(e0=Tnom) annotation(Placement(transformation(x=-50.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Spice.RS R1(Tnom=Tnom, R=R, TR1=TR1, TR2=TR2, Area=Area) annotation(Placement(visible=true, transformation(x=0, y=15, scale=0.1, aspectRatio=1.5, rotation=-90)));
          BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-10, scale=0.1, rotation=-90)));
          Switches.Sw3 Sw1 annotation(Placement(visible=true, transformation(x=0, y=-30, scale=0.1, flipHorizontal=true, rotation=90)));
          BondLib.Bonds.eBond B5 annotation(Placement(visible=true, transformation(x=0, y=-50, scale=0.1, rotation=-90)));
          Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-70, scale=0.1, rotation=-90)));
        equation 
          connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{0,-80},{0,-100}}, color={191,0,0}));
          connect(B5.eBondCon1,BG2Heat1.BondCon1) annotation(Line(visible=true, points={{0,-60},{0,-60}}, color={192,192,192}));
          connect(B5.fBondCon1,Sw1.n2) annotation(Line(visible=true, points={{0,-40},{0,-40}}, color={192,192,192}));
          connect(Sw1.n1,B6.fBondCon1) annotation(Line(visible=true, points={{-5,-40},{-10,-40},{-10,-50},{-20,-50}}, color={192,192,192}));
          connect(Sw1.p,B4.eBondCon1) annotation(Line(visible=true, points={{0,-20},{0,-20}}, color={192,192,192}));
          connect(R1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{0,5},{0,0}}, color={192,192,192}));
          connect(B3.BondCon2,R1.BondCon1) annotation(Line(visible=true, points={{0,50},{0,25}}, color={192,192,192}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-10,60},{-10,60}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{10,60},{10.2,60}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-40,60},{-29.8,60}}, color={192,192,192}));
          connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{30,60},{40,60}}, color={192,192,192}));
          connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(points={{0,50},{0,49.8},{1.80017e-15,49.8}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-60,60},{-80,60},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{60,60},{80,60},{80,0},{100,0}}, color={0,0,255}));
          connect(T_nom.BondCon1,B6.eBondCon1) annotation(Line(points={{-40,-50},{-40,-50}}, color={192,192,192}));
        end R;

        model C "Spice-style capacitor of the analog electrical library"
          extends Interfaces.SpiceTwoPortV;
          parameter Modelica.SIunits.Capacitance C=1 "Capacitance at reference temperature";
          parameter Real TC1(unit="1/K")=0 "Linear temperature coefficient";
          parameter Real TC2(unit="1/K2")=0 "Quadratic temperature coefficient";
          parameter Real Area=1 "Relative area occupied by capacitor";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,-34},{100,-94}}, textString="C=%C", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,0},{-40,-20}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{-60,0},{-40,-20}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{-40,-10},{-30,-10}}, color={255,127,255}),Line(points={{-30,-10},{-30,-30}}, color={255,127,255}),Line(points={{-30,-30},{-14,-30}}, color={255,127,255})}), Documentation(info="<html>
The Spice-style capacitor has a reference capacitance value computed at the reference temperature, <b>Tnom</b>, and for a relative area of <b>Area=1</b>.  It changes its value as a function of the circuit temperature and the relative area occupied by the capacitor. <p>

Although the capacitor does not produce any heat (heat flow = 0), it requires a heat port, because it imports the current device temperature through that port. <p>

The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>

<hr> <p>

<pre>
Parameters:

 C:     Reference capacitance (default value = 1 F)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TC1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TC2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)

 Area:  Relative area occupied by capacitor (default value = 1)


<b>Compiler Parameters:</b>

 enforceStates:  State selector (default value = true)
                   <font color=blue><b>enforceStates = true:   Use (external) capacitive voltage as state variable
                   enforceStates = false:  Use (internal) bond graph effort as state variable</b></font>
</pre> <p>
</html>
"));
        protected 
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B1 annotation(Placement(transformation(x=-20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B2 annotation(Placement(transformation(x=20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Bonds.fBond B6 annotation(Placement(transformation(x=-30.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sources.Se T_nom(e0=Tnom) annotation(Placement(transformation(x=-50.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=40, scale=0.1, rotation=-450)));
          BondLib.Spice.CS C1(Tnom=Tnom, C=C, TC1=TC1, TC2=TC2, Area=Area, e1(start=u0)) annotation(Placement(visible=true, transformation(x=0, y=15, scale=0.1, aspectRatio=1.5, rotation=-90)));
          BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-10, scale=0.1, rotation=-90)));
          BondLib.Switches.Sw3 Sw1 annotation(Placement(visible=true, transformation(x=0, y=-30, scale=0.1, flipHorizontal=true, rotation=-270)));
          BondLib.Bonds.eBond B5 annotation(Placement(visible=true, transformation(x=0, y=-50, scale=0.1, rotation=-90)));
          BondLib.Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-70, scale=0.1, rotation=-90)));
        equation 
          connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{6.12303e-16,-86},{0,-86},{0,-100}}, color={191,0,0}));
          connect(B5.eBondCon1,BG2Heat1.BondCon1) annotation(Line(visible=true, points={{0,-60},{0,-60}}, color={192,192,192}));
          connect(B5.fBondCon1,Sw1.n2) annotation(Line(visible=true, points={{0,-40},{0,-40}}, color={192,192,192}));
          connect(Sw1.n1,B6.fBondCon1) annotation(Line(visible=true, points={{-5,-40},{-10,-40},{-10,-50},{-20,-50}}, color={192,192,192}));
          connect(Sw1.p,B4.eBondCon1) annotation(Line(visible=true, points={{0,-20},{0,-20}}, color={192,192,192}));
          connect(C1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{0,5},{0,0}}, color={192,192,192}));
          connect(C1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{0,25},{3.06152e-15,30}}, color={192,192,192}));
          connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,50},{0,49.8},{-3.00029e-15,49.8}}, color={192,192,192}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-10,60},{-10,60}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{10,60},{10.2,60}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-40,60},{-29.8,60}}, color={192,192,192}));
          connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{30,60},{40,60}}, color={192,192,192}));
          connect(T_nom.BondCon1,B6.eBondCon1) annotation(Line(points={{-40,-50},{-40,-50}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-60,60},{-80,60},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{60,60},{80,60},{80,0},{100,0}}, color={0,0,255}));
        end C;

        model L "Spice-style inductor of the analog electrical library"
          extends Interfaces.SpiceTwoPortI;
          parameter Modelica.SIunits.Inductance L=1 "Inductance at reference temperature";
          parameter Real TL1(unit="1/K")=0 "Linear temperature coefficient";
          parameter Real TL2(unit="1/K2")=0 "Quadratic temperature coefficient";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{-90,0},{-60,0}}),Ellipse(lineColor={0,0,255}, extent={{-60,-15},{-30,15}}),Ellipse(lineColor={0,0,255}, extent={{-30,-15},{0,15}}),Ellipse(lineColor={0,0,255}, extent={{0,-15},{30,15}}),Ellipse(lineColor={0,0,255}, extent={{30,-15},{60,15}}),Line(color={0,0,255}, points={{60,0},{90,0}}),Rectangle(extent={{-60,-28},{60,0}}, fillPattern=FillPattern.Solid, lineColor={255,255,255}, fillColor={255,255,255}),Line(points={{0,0},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,-30},{100,-90}}, textString="L=%L", fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,0},{-40,-20}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{-60,0},{-40,-20}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{-40,-10},{-30,-10}}, color={255,127,255}),Line(points={{-30,-10},{-30,-30}}, color={255,127,255}),Line(points={{-30,-30},{-14,-30}}, color={255,127,255})}), Documentation(info="<html>
The Spice-style inductor has a reference inductance value computed at the reference temperature, <b>Tnom</b>.  It changes its value as a function of the circuit temperature. <p>

Although the inductor does not produce any heat (heat flow = 0), it requires a heat port, because it imports the current device temperature through that port. <p>

The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>

<hr> <p>

<pre>
Parameters:

 L:     Reference inductance (default value = 1 H)

 Tnom:  Reference temperature (default value = 300.15 <sup>o</sup>K)

 TL1:   Linear temperature variation coefficient (default value = 0 1/<sup>o</sup>K)

 TL2:   Quadratic temperature variation coefficient (default value = 0 1/<sup>o</sup>K<sup>2</sup>)


<b>Compiler Parameters:</b>

 enforceStates:  State selector (default value = true)
                   <font color=blue><b>enforceStates = true:   Use (external) inductive current as state variable
                   enforceStates = false:  Use (internal) bond graph flow as state variable</b></font>
</pre> <p>

</html>
"));
        protected 
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B1 annotation(Placement(transformation(x=-20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B2 annotation(Placement(transformation(x=20.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B3 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=50.0, y=60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Bonds.fBond B6 annotation(Placement(transformation(x=-30.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sources.Se T_nom(e0=Tnom) annotation(Placement(transformation(x=-50.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Spice.LS L1(Tnom=Tnom, L=L, TL1=TL1, TL2=TL2, f1(start=i0)) annotation(Placement(visible=true, transformation(x=0, y=15, scale=0.1, aspectRatio=1.5, rotation=-90)));
          BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-10, scale=0.1, rotation=-90)));
          BondLib.Switches.Sw3 Sw1 annotation(Placement(visible=true, transformation(x=0, y=-30, scale=0.1, flipHorizontal=true, rotation=-270)));
          BondLib.Bonds.eBond B5 annotation(Placement(visible=true, transformation(x=0, y=-50, scale=0.1, rotation=-90)));
          BondLib.Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-70, scale=0.1, rotation=-90)));
        equation 
          connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{6.12303e-16,-85},{0,-85},{0,-100}}, color={191,0,0}));
          connect(B5.eBondCon1,BG2Heat1.BondCon1) annotation(Line(visible=true, points={{0,-60},{0,-60}}, color={192,192,192}));
          connect(B5.fBondCon1,Sw1.n2) annotation(Line(visible=true, points={{0,-40},{0,-40}}, color={192,192,192}));
          connect(Sw1.n1,B6.fBondCon1) annotation(Line(visible=true, points={{-5,-40},{-10,-40},{-10,-50},{-20,-50}}, color={192,192,192}));
          connect(Sw1.p,B4.eBondCon1) annotation(Line(visible=true, points={{0,-20},{0,-20}}, color={192,192,192}));
          connect(L1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{0,5},{0,0}}, color={192,192,192}));
          connect(L1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{0,25},{0,50}}, color={192,192,192}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-10,60},{-10,60}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{10,60},{10.2,60}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-40,60},{-29.8,60}}, color={192,192,192}));
          connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{30,60},{40,60}}, color={192,192,192}));
          connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(points={{0,50},{0,49.8},{1.80017e-15,49.8}}, color={192,192,192}));
          connect(T_nom.BondCon1,B6.eBondCon1) annotation(Line(points={{-40,-50},{-40,-50}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-60,60},{-80,60},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{60,60},{80,60},{80,0},{100,0}}, color={0,0,255}));
        end L;

        model Mn "Spice-style NMOS transistor"
          constant Real pi=Modelica.Constants.pi;
          constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
          constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
          constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
          constant Modelica.SIunits.ElectronNumberDensity ni=1.45e+16 "Intrinsic carrier concentration at 300 K";
          constant Real kox=3.9 "Dielectric constant of SiO2";
          constant Real ks=11.8 "Dielectric constant of Si";
          constant Real GapC1(unit="V/K")=0.000702 "Sze's first bandgap correction factor Silicon";
          constant Modelica.SIunits.Temperature GapC2=1108.0 "Sze's second bandgap correction factor Silicon";
          constant Modelica.SIunits.Voltage Fn0=3.25 "Work function constant for computation of flat band voltage";
          constant Real TOXdef=1e-07 "Default oxide thickness";
          parameter Types.MOSFETlevel Level=1 "Level of MOSFET model" annotation(Evaluate=true);
          parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length" annotation(Dialog(group="Geometric parameters"));
          parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width" annotation(Dialog(group="Geometric parameters"));
          parameter Types.MOSFETgateType TPG=1 "Type of gate material" annotation(Dialog(group="Process parameters"));
          parameter Modelica.SIunits.Length TOX=TOXdef "Thin oxide thickness" annotation(Dialog(group="Process parameters"));
          parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2" annotation(Dialog(group="Process parameters"));
          parameter Modelica.SIunits.ElectronNumberDensity NSUB=0 "Substrate doping" annotation(Dialog(group="Process parameters"));
          parameter Real U0(unit="m2/(V.s)")=0 "Surface mobility at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Voltage VT0=0 "Zero-bias threshold voltage (VT0>0: enhancement type, VT0<0: depletion type)" annotation(Dialog(group="Electrical parameters", enable=Level == 0 or Level == 1));
          parameter Modelica.SIunits.InversePotential LAMBDA(min=0)=0 "Channel length modulation" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Length LD(min=0)=0 "Lateral diffusion" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Length WD(min=0)=0 "Width diffusion" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Real NSS(unit="1/m2")=0 "Surface state density" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.Area AD=0 "Drain diffusion area" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length PD=0 "Drain perimeter width" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Area AS=0 "Source diffusion area" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length PS=0 "Source perimeter width" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Current ISD(min=0)=0 "Drain junction saturation current at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Current ISS(min=0)=0 "Source junction saturation current at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.CurrentDensity JS(min=0)=0 "Saturation current density at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Voltage PB(min=0.2)=0.8 "Built-in potential at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Resistance RD(min=0)=0.1 "Drain Ohmic resistance" annotation(Dialog(tab="Level=1", group="Parasitic resistance parameters", enable=Level > 0));
          parameter Modelica.SIunits.Resistance RS(min=0)=0.1 "Source Ohmic resistance" annotation(Dialog(tab="Level=1", group="Parasitic resistance parameters", enable=Level > 0));
          parameter Real CJ(unit="F/m2", min=0)=0 "Zero-bias bulk capacitance per square meter at reference temperature" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real MJ(min=0.3, max=0.5)=0.33 "Bulk junction grading coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CJSW(unit="F/m", min=0)=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real MJSW(min=0.3, max=0.5)=0.33 "Perimeter capacitance grading coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real FC(min=0, max=0.95)=0.5 "Forward-bias depletion capacitance coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGB0(unit="F/m", min=0)=0 "Gate-bulk overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGD0(unit="F/m", min=0)=0 "Gate-drain overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGS0(unit="F/m", min=0)=0 "Gate-source overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real TRD1(unit="1/K")=0 "Linear temperature coefficient of drain resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRD2(unit="1/K2")=0 "Quadratic temperature coefficient of drain resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRS1(unit="1/K")=0 "Linear temperature coefficient of source resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRS2(unit="1/K2")=0 "Quadratic temperature coefficient of source resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth" annotation(Dialog(tab="Level=2", group="Process parameters", enable=Level > 1));
          parameter Modelica.SIunits.ElectricFieldStrength UCRIT=1000000.0 "Critical electric field for mobility" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real UEXP=0 "Exponential coefficient for mobility" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real UTRA(min=0, max=0.5)=0 "Transverse field coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Modelica.SIunits.ElectricFieldStrength ECRIT=0 "Critical electric field for pinch-off" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real DELTA=0 "Width effect on threshold voltage" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Modelica.SIunits.Velocity VMAX=0 "Maximum drift velocity of carriers (VMAX=0: Frohman-Grove model, VMAX>0: Baum-Beneking model)" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real NFS(unit="1/m2")=0 "Surface fast state density" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real NEFF(min=Modelica.Constants.small)=1 "Total channel charge coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real XQC=0 "Coefficient of channel charge share (XQC<=0.5: Ward-Dutton model, XQC>0.5: Meyer model)" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real KAPPA(min=Modelica.Constants.small)=0.2 "Saturation field factor" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Real ETA=0 "Static feedback on threshold voltage" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Modelica.SIunits.InversePotential THETA=0 "Mobility modulation" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level > 0));
          parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Conductance GminDC=1e-12 "Leakage conductance" annotation(Dialog(tab="Advanced", group="Numerical parameters"));
          parameter Types.EnforceCapacitor enforceStates=true "State selector" annotation(Dialog(tab="Advanced", group="Compiler parameters"));
          Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
          Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name"),Line(color={0,0,255}, points={{-90,-50},{-10,-50}}),Line(color={0,0,255}, points={{-10,-50},{-10,50}}),Line(color={0,0,255}, points={{10,70},{10,29}}),Line(color={0,0,255}, points={{10,20},{10,-21}}),Line(color={0,0,255}, points={{10,-30},{10,-71}}),Line(color={0,0,255}, points={{10,50},{91,50}}),Line(color={0,0,255}, points={{10,0},{90,0}}),Line(color={0,0,255}, points={{10,-50},{90,-50}}),Polygon(lineColor={0,0,255}, points={{40,0},{60,5},{60,-5},{40,0}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-50}}, color={191,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-2,-58},{2,-62}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-54,-34},{-40,-40}}, textString="vbs", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{-54,68},{-40,62}}, textString="vbs", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{-16,94},{-2,88}}, textString="vbs", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{20,96},{34,90}}, fillColor={128,128,128}, textString="vds"),Text(lineColor={0,0,255}, extent={{-30,68},{-16,62}}, fillColor={128,128,128}, textString="vds"),Text(lineColor={0,0,255}, extent={{-30,-34},{-16,-40}}, fillColor={128,128,128}, textString="vds"),Ellipse(extent={{78,2},{82,-2}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255}),Rectangle(extent={{20,-66},{40,-86}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{20,-66},{40,-86}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{14,-76},{20,-76}}, color={255,127,255})}), Documentation(info="<html>
The Spice-style n-channel MOSFET model contains the internal MOSFET plus the three external gate capacitances and the drain and source resistances. <p>
 
The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>
 
<hr> <p>
 
<pre>
<b>Parameters:</b>
 
 <font color=red><b>Level:   MOSFET modeling level (default value = 1)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model</b></font>
 
 
<b>Basic Geometric Parameters:</b>
 
 L:       Channel length (default value = 1e-4 m) <font color=red>Levels 0-4</font>
 
 W:       Channel width (default value = 1e-4 m) <font color=red>Levels 0-4</font>
 
 
<b>Basic Process Parameters:</b>
 
 TPG:     Type of gate material (default value = 1) <font color=red>Levels 0-4</font>
            <font color=blue><b>TPG = 0:  Aluminum gate</b></font>
            <font color=blue><b>TPG = 1:  Polysilicon gate</b></font>
 
 TOX:     Thin oxide thickness (default value = 1e-7 m) <font color=red>Levels 0-4</font>
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 NSUB:    Substrate doping (default value = 0 1/m<sup>3</sup>) <font color=red>Levels 0-4</font>
 
 
<b>Basic Electrical Parameters:</b>
 
 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s)) <font color=red>Levels 0-4</font>
 
 VT0:     Zero-bias threshold voltage (default value = 0 Volt) <font color=red>Levels 0,1</font>
            <font color=blue><b>VT0 &gt; 0 for enhancement MOSFET
            VT0 &lt; 0 for depletion MOSFET</b></font>
 
 LAMBDA:  Channel length modulation  (default value = 0 1/Volt) <font color=red>Levels 0-4</font>
 
 LD:      Lateral diffusion (default value = 0 m) <font color=red>Levels 0-4</font>
 
 WD:      Width diffusion (default value = 0 m) <font color=red>Levels 0-4</font>
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>) <font color=red>Levels 0-4</font>
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt) <font color=red>Levels 0-4</font>
 
 NSS:     Surface state density (default value = 0 1/m<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 
<b>Basic Temperature Compensation Parameters:</b>
 
 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 0-4</font>
 
 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt) <font color=red>Levels 0-4</font>
 
 
<b>Level=1 Electrical Parameters:</b>
 
 AD:      Drain diffusion area (default value = 0 m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PD:      Drain perimeter width (default value = 0 m) <font color=red>Levels 1-4</font>
 
 AS:      Source diffusion area (default value = 0 m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PS:      Source perimeter width (default value = 0 m) <font color=red>Levels 1-4</font>
 
 ISD:     Drain junction saturation current at reference temperature (default value = 0 Amp) <font color=red>Levels 1-4</font>
 
 ISS:     Source junction saturation current at reference temperature (default value = 0 Amp) <font color=red>Levels 1-4</font>
 
 JS:      Transport saturation current density (default value = 0 Amp/m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Parasitic Resistor Parameters:</b>
 
 RD:      Drain Ohmic resistance (default value = 1 Ohm) <font color=red>Levels 1-4</font>
 
 RS:      Source Ohmic resistance (default value = 1 Ohm) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Junction Capacitance Parameters:</b>
 
 CJ:      Zero-bias bulk capacitance per square meter at reference temperature (default value = 0 F/m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 MJ:      Bulk junction grading coefficient (default value = 0.33) <font color=red>Levels 1-4</font>
 
 CJSW:    Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m) <font color=red>Levels 1-4</font>
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33) <font color=red>Levels 1-4</font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5) <font color=red>Levels 1-4</font>
 
 CGB0:    Gate-bulk overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 CGD0:    Gate-drain overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 CGS0:    Gate-source overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Temperature Compensation Parameters:</b>
 
 TRD1:    Linear temperature coefficient of drain resistance (default value = 0 1/K) <font color=red>Levels 1-4</font>
 
 TRD2:    Quadratic temperature coefficient of drain resistance (default value = 0 1/K<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 TRS1:    Linear temperature coefficient of source resistance (default value = 0 1/K) <font color=red>Levels 1-4</font>
 
 TRS2:    Quadratic temperature coefficient of source resistance (default value = 0 1/K<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 
<b>Level=2 Process Parameters:</b>
 
 XJ:      Metallurgical Junction Depth (default value = 0 m) <font color=red>Levels 2-4</font>
 
 
<b>Level=2 Electrical Parameters:</b>
 
 UCRIT:   Critical electric field for mobility (default value = 1e6 V/m) <font color=red>Levels 2,4</font>
 
 UEXP:    Exponential coefficient for mobility (default value = 0) <font color=red>Levels 2,4</font>
 
 UTRA:    Transverse field coefficient (default value = 0) <font color=red>Levels 2,4</font>
 
 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m) <font color=red>Levels 2,4</font>
 
 DELTA:   Width effect on threshold voltage (default value = 0) <font color=red>Levels 2-4</font>
 
 
 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s) <font color=red>Levels 2-4</font>
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation (Levels 2,4)</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation (Levels 2,4)</b></font>
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>) <font color=red>Levels 2-4</font>
 
 NEFF:    Total channel charge coefficient (default value = 1) <font color=red>Levels 2,4</font>
 
 XQC:     Coefficient of channel charge share (default value = 0) <font color=red>Levels 2-4</font>
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 
<b>Level=3 Electrical Parameters:</b>
 
 KAPPA:   Saturation field factor (default value = 0.2) <font color=red>Level 3</font>
 
 ETA:     Static feedback on threshold voltage (default value = 0) <font color=red>Level 3</font>
 
 THETA:   Mobility modulation (default value = 0 1/Volt) <font color=red>Level 3</font>
 
 
<b>Numerical Parameters:</b>
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1-4</font>
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1-4</font>
 
 GminDC:  Leakage conductance (default value = 1e-12 mho) <font color=red>Levels 0-4</font>
 
 
<b>Compiler Parameters:</b>
 
 enforceStates:  State selector (default value = true) <font color=red>Levels 0-4</font>
                   <font color=blue><b>enforceStates = true:   Use (external) capacitive voltages as state variables
                   enforceStates = false:  Use (internal) bond graph efforts as state variables</b></font>
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
          Utilities.Mni Mni(Tnom=Tnom, PHI=PHIeff, NSS=NSS, NFS=NFS, NEFF=NEFF, TPG=TPG, UEXP=UEXP, UTRA=UTRA, VMAX=VMAX, THETA=THETA, PB=PB, MJ=MJ, MJSW=MJSW, FC=FC, GminDC=GminDC, Level=Level, EMin=EMin, EMax=EMax, GAMMA=GAMMAeff, KP=KPeff, ISD=ISDeff, ISS=ISSeff, VT0=VT0eff, LAMBDA=LAMBDAeff, TOX=TOXeff, NSUB=NSUBeff, LD=LDeff, U0=U0eff, CJ=CJeff, EG=EGeff, L=Leff, W=Weff, COX=COXeff, VFB=VFBeff, XJ=XJ, AD=AD, PD=PD, AS=AS, PS=PS, CJSW=CJSW, XD=XD, UCRIT=UCRIT, VBP=VBP, XQC=XQC, ECRIT=ECRIT, Type=1, KAPPA=KAPPA, DELTA=DELTA, ETA=ETA, enforceStates=enforceStates) annotation(Placement(transformation(x=0.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Utilities.Cgs Cgs1(Tnom=Tnom, Level=Level, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGS0=CGS0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, DELTA=DELTA, ETA=ETA, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, XQC=XQC, Type=1, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=-30.0, y=-50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Utilities.Cgd Cgd1(Tnom=Tnom, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGD0=CGD0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, XQC=XQC, DELTA=DELTA, ETA=ETA, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, Level=Level, Type=1, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=-30.0, y=50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Utilities.Cgb Cgb1(Tnom=Tnom, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGB0=CGB0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, XQC=XQC, DELTA=DELTA, ETA=ETA, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, Level=Level, Type=1, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=10.0, y=80.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Sensors.VoltageSensor Vds annotation(Placement(transformation(x=118.0, y=2.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
          Sensors.VoltageSensor Vbs annotation(Placement(transformation(x=80.0, y=-24.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true, rotation=-90.0)));
          Utilities.RM Rd(Tnom=Tnom, R=RD, TR1=TRD1, TR2=TRD2, Level=Level) annotation(Placement(transformation(x=50.0, y=50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Utilities.RM Rs(Tnom=Tnom, Level=Level, R=RS, TR1=TRS1, TR2=TRS2) annotation(Placement(transformation(x=48.0, y=-50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Sources.FixedTemperature T_nom(T=Tnom) annotation(Placement(transformation(x=70.0, y=-90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          Thermal.HeatTransfer.Switches.HeatBranch Sw1 annotation(Placement(visible=true, transformation(x=0, y=-76, scale=0.1, rotation=-90)));
        protected 
          parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
          parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of silicon";
          parameter Modelica.SIunits.Permittivity eox=kox*e0 "Permittivity of SiO2";
          parameter Modelica.SIunits.Length LDeff=LD;
          parameter Modelica.SIunits.Length Leff=L - 2*LDeff;
          parameter Modelica.SIunits.Length Weff=W - 2*WD;
          parameter Modelica.SIunits.Length TOXeff=if TOX == TOXdef and COX > 0 then eox/COX else TOX;
          parameter Real COXeff(unit="F/m2")=if COX > 0 then COX else eox/TOX;
          parameter Real CGB0eff(unit="F/m")=CGB0;
          parameter Real CGD0eff(unit="F/m")=CGD0;
          parameter Real CGS0eff(unit="F/m")=CGS0;
          parameter Real U0def(unit="m2/(V.s)")=0.06;
          parameter Real U0tmp(unit="m2/(V.s)")=if KP == 0 and U0 == 0 then U0def else U0;
          parameter Modelica.SIunits.Transconductance KPeff=if KP > 0 then KP else U0tmp*COXeff;
          parameter Real U0eff(unit="m2/(V.s)")=if KP > 0 and U0 == 0 then KP/COXeff else U0tmp;
          parameter Real GAMMAtmp(unit="V^0.5")=if GAMMA == 0 and NSUB == 0 then 0.35 else GAMMA;
          parameter Modelica.SIunits.ElectronNumberDensity NSUBeff=if NSUB > 0 then NSUB else (GAMMAtmp*COXeff)^2/(2*es*q);
          parameter Real GAMMAeff(unit="V^0.5")=if GAMMA == 0 and NSUB > 0 then sqrt(2*es*q*NSUB)/COXeff else GAMMAtmp;
          parameter Modelica.SIunits.InversePotential LAMBDAeff=if LAMBDA > 0 then LAMBDA else if Level <> 2 then sqrt(2*es/(q*NSUBeff)) else LAMBDA;
          parameter Modelica.SIunits.Voltage EGref=EG - GapC1*Tnom*Tnom/(Tnom + GapC2) "Energy gap for temperature effect on saturation current at reference temperature";
          parameter Modelica.SIunits.ElectronNumberDensity XNI=ni*(Tnom/300)^1.5*exp(EGref*q/(2*k)*(1/300 - 1/Tnom)) "Intrinsic carrier concentration at reference temperature";
          parameter Modelica.SIunits.Voltage VTref=k*Tnom/q "Thermal voltage at reference temperature";
          parameter Modelica.SIunits.Voltage PHIeff=if PHI > 0 then PHI else if NSUB > 0 then max({2*VTref*log(NSUB/XNI),0.1}) else 0.6;
          parameter Modelica.SIunits.Voltage FermiG=Type*TPG*EGref/2;
          parameter Modelica.SIunits.Voltage Fn1=if TPG == 0 then 3.2 else Fn0 + EGref/2 - FermiG;
          parameter Modelica.SIunits.Voltage FermiS=Type*PHIeff/2;
          parameter Modelica.SIunits.Voltage Fn2=Fn1 - Fn0 - EGref/2 - FermiS;
          parameter Modelica.SIunits.Voltage VFB=Fn2 - NSS*q/COXeff;
          parameter Modelica.SIunits.Voltage Vcorr=Type*(GAMMAeff*sqrt(PHIeff) + PHIeff);
          parameter Modelica.SIunits.Voltage VT0eff=if Type*VT0 > 0 then VT0 else VFB + Vcorr;
          parameter Modelica.SIunits.Voltage VFBeff=if Type*VT0 > 0 then VT0 - Vcorr else VFB;
          parameter Real XD(unit="m/V^0.5")=sqrt(2*es/(q*NSUBeff)) "Depletion factor";
          parameter Real CJeff(unit="F/m2")=if CJ > 0 then CJ else sqrt(es*q*NSUBeff/(2*PB));
          parameter Modelica.SIunits.Voltage EGeff=if Level == 3 and EG == 0 then 0.2 else EGref;
          parameter Modelica.SIunits.Voltage VBP=UCRIT*es/COXeff "Gate to channel critical voltage";
          parameter Modelica.SIunits.Current ISDeff=if ISD > 0 then ISD else if AD*JS > 0 then AD*JS else 1e-15;
          parameter Modelica.SIunits.Current ISSeff=if ISS > 0 then ISS else if AS*JS > 0 then AS*JS else 1e-15;
        algorithm 
          assert(NSUBeff > XNI, "NSUB must be larger than intrinsic carrier concentration");
          assert(LAMBDAeff < 0.2, "LAMBDA value too large, leads to numerical instability");
          assert(Leff > 0, "The effective channel length must be larger than zero");
        equation 
          connect(Sw1.p,Cgs1.heatPort) annotation(Line(visible=true, points={{0,-65},{-6.73533e-16,-60},{-30,-60}}, color={191,0,0}));
          connect(Sw1.n2,heatPort) annotation(Line(visible=true, points={{0,-87},{6.73533e-16,-89.5},{0,-89.5},{0,-100}}, color={191,0,0}));
          connect(Sw1.n1,T_nom.port) annotation(Line(visible=true, points={{5,-87},{12,-87},{12,-90},{59,-90}}, color={191,0,0}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(Mni.B,B) annotation(Line(points={{20,0},{100,0}}, color={0,0,255}));
          connect(G,Mni.G) annotation(Line(points={{-100,-50},{-60,-50},{-60,-10},{-20,-10}}, color={0,0,255}));
          connect(Cgs1.p,G) annotation(Line(points={{-50,-50},{-100,-50}}, color={0,0,255}));
          connect(Cgd1.p,G) annotation(Line(points={{-50,50},{-60,50},{-60,-50},{-100,-50}}, color={0,0,255}));
          connect(Cgb1.p,Cgd1.p) annotation(Line(points={{-10,80},{-60,80},{-60,50},{-50,50}}, color={0,0,255}));
          connect(Cgb1.n,B) annotation(Line(points={{30,80},{80,80},{80,0},{100,0}}, color={0,0,255}));
          connect(Vds.p,D) annotation(Line(points={{118,12},{118,50},{100,50}}, color={0,0,255}));
          connect(S,Vds.n) annotation(Line(points={{100,-50},{118,-50},{118,-8}}, color={0,0,255}));
          connect(Vds.V,Cgb1.vds) annotation(Line(points={{128,2},{132,2},{132,96},{22,96},{22,90}}, color={0,0,191}));
          connect(Cgb1.vds,Cgd1.vds) annotation(Line(points={{22,90},{22,96},{-18,96},{-18,60}}, color={0,0,191}));
          connect(Cgd1.vds,Cgs1.vds) annotation(Line(points={{-18,60},{-18,70},{-14,70},{-14,-28},{-18,-28},{-18,-40}}, color={0,0,191}));
          connect(Vbs.n,S) annotation(Line(points={{80,-34},{80,-50},{100,-50}}, color={0,0,255}));
          connect(Vbs.p,B) annotation(Line(points={{80,-14},{80,0},{100,0}}, color={0,0,255}));
          connect(Vbs.V,Cgs1.vbs) annotation(Line(points={{70,-24},{-42,-24},{-42,-40}}, color={0,0,191}));
          connect(Cgs1.vbs,Cgd1.vbs) annotation(Line(points={{-42,-40},{-42,26},{-56,26},{-56,70},{-42,70},{-42,60}}, color={0,0,191}));
          connect(Cgd1.vbs,Cgb1.vbs) annotation(Line(points={{-42,60},{-42,94},{-2,94},{-2,90}}, color={0,0,191}));
          connect(Rd.n,D) annotation(Line(points={{70,50},{100,50}}, color={0,0,255}));
          connect(Rd.p,Cgd1.n) annotation(Line(points={{30,50},{-10,50}}, color={0,0,255}));
          connect(Rd.p,Mni.D) annotation(Line(points={{30,50},{20,50},{20,10}}, color={0,0,255}));
          connect(Rs.n,S) annotation(Line(points={{68,-50},{100,-50}}, color={0,0,255}));
          connect(Rs.p,Cgs1.n) annotation(Line(points={{28,-50},{-10,-50}}, color={0,0,255}));
          connect(Rs.p,Mni.S) annotation(Line(points={{28,-50},{20,-50},{20,-10}}, color={0,0,255}));
          connect(Rd.heatPort,Mni.heatPort) annotation(Line(points={{50,40},{50,-20},{0,-20}}, color={191,0,0}));
          connect(Rd.heatPort,Cgd1.heatPort) annotation(Line(points={{50,40},{-30,40}}, color={191,0,0}));
          connect(Cgb1.heatPort,Rd.heatPort) annotation(Line(points={{10,70},{10,40},{50,40}}, color={191,0,0}));
          connect(Mni.y1,Cgb1.u) annotation(Line(points={{10,22},{10,32},{-2,32},{-2,70}}, color={0,0,191}));
          connect(Mni.y1,Cgd1.u) annotation(Line(points={{10,22},{10,32},{-42,32},{-42,40}}, color={0,0,191}));
          connect(Mni.y1,Cgs1.u) annotation(Line(points={{10,22},{10,32},{-70,32},{-70,-70},{-42,-70},{-42,-60}}, color={0,0,191}));
          connect(Cgs1.heatPort,Mni.heatPort) annotation(Line(points={{-30,-60},{0,-60},{0,-20}}, color={191,0,0}));
          connect(Mni.heatPort,Rs.heatPort) annotation(Line(points={{0,-20},{0,-60},{48,-60}}, color={191,0,0}));
        end Mn;

        model Mp "Spice-style PMOS transistor"
          constant Real pi=Modelica.Constants.pi;
          constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
          constant Modelica.SIunits.Permittivity e0=Modelica.Constants.epsilon_0 "Permittivity of free space";
          constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
          constant Modelica.SIunits.ElectronNumberDensity ni=1.45e+16 "Intrinsic carrier concentration at 300 K";
          constant Real kox=3.9 "Dielectric constant of SiO2";
          constant Real ks=11.8 "Dielectric constant of Si";
          constant Real GapC1(unit="V/K")=0.000702 "Sze's first bandgap correction factor Silicon";
          constant Modelica.SIunits.Temperature GapC2=1108.0 "Sze's second bandgap correction factor Silicon";
          constant Modelica.SIunits.Voltage Fn0=3.25 "Work function constant for computation of flat band voltage";
          constant Real TOXdef=1e-07 "Default oxide thickness";
          parameter Types.MOSFETlevel Level=1 "Level of MOSFET model" annotation(Evaluate=true);
          parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length" annotation(Dialog(group="Geometric parameters"));
          parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width" annotation(Dialog(group="Geometric parameters"));
          parameter Types.MOSFETgateType TPG=1 "Type of gate material" annotation(Dialog(group="Process parameters"));
          parameter Modelica.SIunits.Length TOX=TOXdef "Thin oxide thickness" annotation(Dialog(group="Process parameters"));
          parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2" annotation(Dialog(group="Process parameters"));
          parameter Modelica.SIunits.ElectronNumberDensity NSUB=0 "Substrate doping" annotation(Dialog(group="Process parameters"));
          parameter Real U0(unit="m2/(V.s)")=0 "Surface mobility at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Voltage VT0=0 "Zero-bias threshold voltage (VT0<0: enhancement type, VT0>0: depletion type)" annotation(Dialog(group="Electrical parameters", enable=Level == 0 or Level == 1));
          parameter Modelica.SIunits.InversePotential LAMBDA(min=0)=0 "Channel length modulation" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Length LD(min=0)=0 "Lateral diffusion" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Length WD(min=0)=0 "Width diffusion" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Real NSS(unit="1/m2")=0 "Surface state density" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.Area AD=0 "Drain diffusion area" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length PD=0 "Drain perimeter width" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Area AS=0 "Source diffusion area" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length PS=0 "Source perimeter width" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Current ISD(min=0)=0 "Drain junction saturation current at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Current ISS(min=0)=0 "Source junction saturation current at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.CurrentDensity JS(min=0)=0 "Saturation current density at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Voltage PB(min=0.2)=0.8 "Built-in potential at reference temperature" annotation(Dialog(tab="Level=1", group="Electrical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Resistance RD(min=0)=0.1 "Drain Ohmic resistance" annotation(Dialog(tab="Level=1", group="Parasitic resistance parameters", enable=Level > 0));
          parameter Modelica.SIunits.Resistance RS(min=0)=0.1 "Source Ohmic resistance" annotation(Dialog(tab="Level=1", group="Parasitic resistance parameters", enable=Level > 0));
          parameter Real CJ(unit="F/m2", min=0)=0 "Zero-bias bulk capacitance per square meter at reference temperature" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real MJ(min=0.3, max=0.5)=0.33 "Bulk junction grading coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CJSW(unit="F/m", min=0)=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real MJSW(min=0.3, max=0.5)=0.33 "Perimeter capacitance grading coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real FC(min=0, max=0.95)=0.5 "Forward-bias depletion capacitance coefficient" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGB0(unit="F/m", min=0)=0 "Gate-bulk overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGD0(unit="F/m", min=0)=0 "Gate-drain overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real CGS0(unit="F/m", min=0)=0 "Gate-source overlap capacitance per meter" annotation(Dialog(tab="Level=1", group="Junction capacitance parameters", enable=Level > 0));
          parameter Real TRD1(unit="1/K")=0 "Linear temperature coefficient of drain resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRD2(unit="1/K2")=0 "Quadratic temperature coefficient of drain resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRS1(unit="1/K")=0 "Linear temperature coefficient of source resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Real TRS2(unit="1/K2")=0 "Quadratic temperature coefficient of source resistance" annotation(Dialog(tab="Level=1", group="Temperature compensation parameters", enable=Level > 0));
          parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth" annotation(Dialog(tab="Level=2", group="Process parameters", enable=Level > 1));
          parameter Modelica.SIunits.ElectricFieldStrength UCRIT=1000000.0 "Critical electric field for mobility" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real UEXP=0 "Exponential coefficient for mobility" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real UTRA(min=0, max=0.5)=0 "Transverse field coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Modelica.SIunits.ElectricFieldStrength ECRIT=0 "Critical electric field for pinch-off" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2 or Level == 4));
          parameter Real DELTA=0 "Width effect on threshold voltage" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Modelica.SIunits.Velocity VMAX=0 "Maximum drift velocity of carriers (VMAX=0: Frohman-Grove model, VMAX>0: Baum-Beneking model)" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real NFS(unit="1/m2")=0 "Surface fast state density" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real NEFF(min=Modelica.Constants.small)=1 "Total channel charge coefficient" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real XQC=0 "Coefficient of channel charge share (XQC<=0.5: Ward-Dutton model, XQC>0.5: Meyer model)" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level > 1));
          parameter Real KAPPA(min=Modelica.Constants.small)=0.2 "Saturation field factor" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Real ETA=0 "Static feedback on threshold voltage" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Modelica.SIunits.InversePotential THETA=0 "Mobility modulation" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level > 0));
          parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters", enable=Level > 0));
          parameter Modelica.SIunits.Conductance GminDC=1e-12 "Leakage conductance" annotation(Dialog(tab="Advanced", group="Numerical parameters"));
          parameter Types.EnforceCapacitor enforceStates=true "State selector" annotation(Dialog(tab="Advanced", group="Compiler parameters"));
          Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
          Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
          Utilities.Cgs Csg1(Tnom=Tnom, Level=Level, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGS0=CGS0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, XQC=XQC, DELTA=DELTA, ETA=ETA, Type=Type, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=-30.0, y=-40.0, scale=0.2, aspectRatio=0.5, flipHorizontal=true, flipVertical=false)));
          Utilities.Cgd Cdg1(Tnom=Tnom, Level=Level, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGD0=CGD0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, XQC=XQC, DELTA=DELTA, ETA=ETA, Type=Type, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=-30.0, y=50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=true, flipVertical=false)));
          Utilities.Cgb Cbg1(Tnom=Tnom, Level=Level, PHI=PHIeff, GAMMA=GAMMAeff, LD=LDeff, CGB0=CGB0eff, EG=EGeff, L=Leff, W=Weff, XJ=XJ, XQC=XQC, DELTA=DELTA, ETA=ETA, Type=Type, VFB=VFBeff, KP=KPeff, COX=COXeff, NFS=NFS, XD=XD, enforceStates=enforceStates, u0=0) annotation(Placement(transformation(x=10.0, y=80.0, scale=0.2, aspectRatio=0.5, flipHorizontal=true, flipVertical=false)));
          Sensors.VoltageSensor Vsb annotation(Placement(transformation(x=80.0, y=-24.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
          Utilities.RM Rd(Tnom=Tnom, R=RD, TR1=TRD1, TR2=TRD2, Level=Level) annotation(Placement(transformation(x=50.0, y=50.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          Utilities.RM Rs(Tnom=Tnom, Level=Level, R=RS, TR1=TRS1, TR2=TRS2) annotation(Placement(transformation(x=48.0, y=-40.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-2,-58},{2,-62}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{20,96},{34,90}}, fillColor={128,128,128}, textString="vsb"),Text(lineColor={0,0,255}, extent={{-14,96},{0,90}}, fillColor={128,128,128}, textString="vsd"),Ellipse(extent={{78,2},{82,-2}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-20,66},{-6,60}}, fillColor={128,128,128}, textString="vsb"),Text(lineColor={0,0,255}, extent={{-54,66},{-40,60}}, fillColor={128,128,128}, textString="vsd"),Text(lineColor={0,0,255}, extent={{-18,-24},{-4,-30}}, fillColor={128,128,128}, textString="vsb"),Text(lineColor={0,0,255}, extent={{-56,-24},{-42,-30}}, fillColor={128,128,128}, textString="vsd"),Rectangle(extent={{20,-66},{40,-86}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{20,-66},{40,-86}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{14,-76},{20,-76}}, color={255,127,255})}), Documentation(info="<html>
The Spice-style p-channel MOSFET model contains the internal MOSFET plus the three external gate capacitances and the drain and source resistances. <p>
 
The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>
 
<hr> <p>
 
<pre>
<b>Parameters:</b>
 
 <font color=red><b>Level:   MOSFET modeling level (default value = 1)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model</b></font>
 
 
<b>Basic Geometric Parameters:</b>
 
 L:       Channel length (default value = 1e-4 m) <font color=red>Levels 0-4</font>
 
 W:       Channel width (default value = 1e-4 m) <font color=red>Levels 0-4</font>
 
 
<b>Basic Process Parameters:</b>
 
 TPG:     Type of gate material (default value = 1) <font color=red>Levels 0-4</font>
            <font color=blue><b>TPG = 0:  Aluminum gate</b></font>
            <font color=blue><b>TPG = 1:  Polysilicon gate</b></font>
 
 TOX:     Thin oxide thickness (default value = 1e-7 m) <font color=red>Levels 0-4</font>
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 NSUB:    Substrate doping (default value = 0 1/m<sup>3</sup>) <font color=red>Levels 0-4</font>
 
 
<b>Basic Electrical Parameters:</b>
 
 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s)) <font color=red>Levels 0-4</font>
 
 VT0:     Zero-bias threshold voltage (default value = 0 Volt) <font color=red>Levels 0,1</font>
            <font color=blue><b>VT0 &lt; 0 for enhancement MOSFET
            VT0 &gt; 0 for depletion MOSFET</b></font>
 
 LAMBDA:  Channel length modulation  (default value = 0 1/Volt) <font color=red>Levels 0-4</font>
 
 LD:      Lateral diffusion (default value = 0 m) <font color=red>Levels 0-4</font>
 
 WD:      Width diffusion (default value = 0 m) <font color=red>Levels 0-4</font>
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 GAMMA:   Body-effect parameter (default value = 0 Volt<sup>0.5</sup>) <font color=red>Levels 0-4</font>
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt) <font color=red>Levels 0-4</font>
 
 NSS:     Surface state density (default value = 0 1/m<sup>2</sup>) <font color=red>Levels 0-4</font>
 
 
<b>Basic Temperature Compensation Parameters:</b>
 
 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 0-4</font>
 
 EG:      Energy gap for temperature effect on saturation current at 0 K (default value = 1.11 Volt) <font color=red>Levels 0-4</font>
 
 
<b>Level=1 Electrical Parameters:</b>
 
 AD:      Drain diffusion area (default value = 0 m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PD:      Drain perimeter width (default value = 0 m) <font color=red>Levels 1-4</font>
 
 AS:      Source diffusion area (default value = 0 m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PS:      Source perimeter width (default value = 0 m) <font color=red>Levels 1-4</font>
 
 ISD:     Drain junction saturation current at reference temperature (default value = 0 Amp) <font color=red>Levels 1-4</font>
 
 ISS:     Source junction saturation current at reference temperature (default value = 0 Amp) <font color=red>Levels 1-4</font>
 
 JS:      Transport saturation current density (default value = 0 Amp/m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Parasitic Resistor Parameters:</b>
 
 RD:      Drain Ohmic resistance (default value = 1 Ohm) <font color=red>Levels 1-4</font>
 
 RS:      Source Ohmic resistance (default value = 1 Ohm) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Junction Capacitance Parameters:</b>
 
 CJ:      Zero-bias bulk capacitance per square meter at reference temperature (default value = 0 F/m<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 MJ:      Bulk junction grading coefficient (default value = 0.33) <font color=red>Levels 1-4</font>
 
 CJSW:    Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m) <font color=red>Levels 1-4</font>
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33) <font color=red>Levels 1-4</font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5) <font color=red>Levels 1-4</font>
 
 CGB0:    Gate-bulk overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 CGD0:    Gate-drain overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 CGS0:    Gate-source overlap capacitance per meter (default value = 0 F/m) <font color=red>Levels 1-4</font>
 
 
<b>Level=1 Temperature Compensation Parameters:</b>
 
 TRD1:    Linear temperature coefficient of drain resistance (default value = 0 1/K) <font color=red>Levels 1-4</font>
 
 TRD2:    Quadratic temperature coefficient of drain resistance (default value = 0 1/K<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 TRS1:    Linear temperature coefficient of source resistance (default value = 0 1/K) <font color=red>Levels 1-4</font>
 
 TRS2:    Quadratic temperature coefficient of source resistance (default value = 0 1/K<sup>2</sup>) <font color=red>Levels 1-4</font>
 
 
<b>Level=2 Process Parameters:</b>
 
 XJ:      Metallurgical Junction Depth (default value = 0 m) <font color=red>Levels 2-4</font>
 
 
<b>Level=2 Electrical Parameters:</b>
 
 UCRIT:   Critical electric field for mobility (default value = 1e6 V/m) <font color=red>Levels 2,4</font>
 
 UEXP:    Exponential coefficient for mobility (default value = 0) <font color=red>Levels 2,4</font>
 
 UTRA:    Transverse field coefficient (default value = 0) <font color=red>Levels 2,4</font>
 
 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m) <font color=red>Levels 2,4</font>
 
 DELTA:   Width effect on threshold voltage (default value = 0) <font color=red>Levels 2-4</font>
 
 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s) <font color=red>Levels 2-4</font>
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation (Levels 2,4)</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation (Levels 2,4)</b></font>
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>) <font color=red>Levels 2-4</font>
 
 NEFF:    Total channel charge coefficient (default value = 1) <font color=red>Levels 2,4</font>
 
 XQC:     Coefficient of channel charge share (default value = 0) <font color=red>Levels 2-4</font>
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 
<b>Level=3 Electrical Parameters:</b>
 
 KAPPA:   Saturation field factor (default value = 0.2) <font color=red>Level 3</font>
 
 ETA:     Static feedback on threshold voltage (default value = 0) <font color=red>Level 3</font>
 
 THETA:   Mobility modulation (default value = 0 1/Volt) <font color=red>Level 3</font>
 
 
<b>Numerical Parameters:</b>
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1-4</font>
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1-4</font>
 
 GminDC:  Leakage conductance (default value = 1e-12 mho) <font color=red>Levels 0-4</font>
 
 
<b>Compiler Parameters:</b>
 
 enforceStates:  State selector (default value = true) <font color=red>Levels 0-4</font>
                   <font color=blue><b>enforceStates = true:   Use (external) capacitive voltages as state variables
                   enforceStates = false:  Use (internal) bond graph efforts as state variables</b></font>
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name"),Line(color={0,0,255}, points={{-90,-50},{-10,-50}}),Line(color={0,0,255}, points={{-10,-50},{-10,50}}),Line(color={0,0,255}, points={{10,70},{10,29}}),Line(color={0,0,255}, points={{10,20},{10,-21}}),Line(color={0,0,255}, points={{10,-30},{10,-71}}),Line(color={0,0,255}, points={{10,50},{91,50}}),Line(color={0,0,255}, points={{10,0},{90,0}}),Line(color={0,0,255}, points={{10,-50},{90,-50}}),Polygon(lineColor={0,0,255}, points={{60,0},{40,5},{40,-5},{60,0}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-50}}, color={191,0,0})}));
          Utilities.Mpi Mpi(Tnom=Tnom, GAMMA=GAMMAeff, KP=KPeff, PHI=PHIeff, NSS=NSS, NFS=NFS, NEFF=NEFF, TPG=TPG, UEXP=UEXP, UTRA=UTRA, VMAX=VMAX, THETA=THETA, ISD=ISDeff, ISS=ISSeff, PB=PB, MJ=MJ, MJSW=MJSW, FC=FC, GminDC=GminDC, Level=Level, EMin=EMin, EMax=EMax, VT0=VT0eff, LAMBDA=LAMBDAeff, TOX=TOXeff, NSUB=NSUBeff, LD=LDeff, U0=U0eff, CJ=CJeff, EG=EGeff, L=Leff, W=Weff, COX=COXeff, VFB=VFBeff, XJ=XJ, AD=AD, PD=PD, AS=AS, PS=PS, CJSW=CJSW, XD=XD, UCRIT=UCRIT, VBP=VBP, XQC=XQC, ECRIT=ECRIT, Type=-1, KAPPA=KAPPA, DELTA=DELTA, ETA=ETA, enforceStates=enforceStates) annotation(Placement(transformation(x=0.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Sources.FixedTemperature T_nom(T=Tnom) annotation(Placement(transformation(x=70.0, y=-90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          Thermal.HeatTransfer.Switches.HeatBranch Sw1 annotation(Placement(visible=true, transformation(x=0, y=-76, scale=0.1, rotation=-90)));
          Sensors.VoltageSensor Vsd annotation(Placement(visible=true, transformation(x=118, y=2, scale=0.1, flipHorizontal=true, flipVertical=true, rotation=-90)));
        protected 
          parameter Integer Type=-1 "Type=1 for NMOS; Type=-1 for PMOS";
          parameter Modelica.SIunits.Permittivity es=ks*e0 "Permittivity of silicon";
          parameter Modelica.SIunits.Permittivity eox=kox*e0 "Permittivity of SiO2";
          parameter Modelica.SIunits.Length LDeff=LD;
          parameter Modelica.SIunits.Length Leff=L - 2*LDeff;
          parameter Modelica.SIunits.Length Weff=W - 2*WD;
          parameter Modelica.SIunits.Length TOXeff=if TOX == TOXdef and COX > 0 then eox/COX else TOX;
          parameter Real COXeff(unit="F/m2")=if COX > 0 then COX else eox/TOX;
          parameter Real CGB0eff(unit="F/m")=CGB0;
          parameter Real CGD0eff(unit="F/m")=CGD0;
          parameter Real CGS0eff(unit="F/m")=CGS0;
          parameter Real U0def(unit="m2/(V.s)")=0.06;
          parameter Real U0tmp(unit="m2/(V.s)")=if KP == 0 and U0 == 0 then U0def else U0;
          parameter Modelica.SIunits.Transconductance KPeff=if KP > 0 then KP else U0tmp*COXeff;
          parameter Real U0eff(unit="m2/(V.s)")=if KP > 0 and U0 == 0 then KP/COXeff else U0tmp;
          parameter Real GAMMAtmp(unit="V^0.5")=if GAMMA == 0 and NSUB == 0 then 0.35 else GAMMA;
          parameter Modelica.SIunits.ElectronNumberDensity NSUBeff=if NSUB > 0 then NSUB else (GAMMAtmp*COXeff)^2/(2*es*q);
          parameter Real GAMMAeff(unit="V^0.5")=if GAMMA == 0 and NSUB > 0 then sqrt(2*es*q*NSUB)/COXeff else GAMMAtmp;
          parameter Modelica.SIunits.InversePotential LAMBDAeff=if LAMBDA > 0 then LAMBDA else if Level <> 2 then sqrt(2*es/(q*NSUBeff)) else LAMBDA;
          parameter Modelica.SIunits.Voltage EGref=EG - GapC1*Tnom*Tnom/(Tnom + GapC2) "Energy gap for temperature effect on saturation current at reference temperature";
          parameter Modelica.SIunits.ElectronNumberDensity XNI=ni*(Tnom/300)^1.5*exp(EGref*q/(2*k)*(1/300 - 1/Tnom)) "Intrinsic carrier concentration at reference temperature";
          parameter Modelica.SIunits.Voltage VTref=k*Tnom/q "Thermal voltage at reference temperature";
          parameter Modelica.SIunits.Voltage PHIeff=if PHI > 0 then PHI else if NSUB > 0 then max({2*VTref*log(NSUB/XNI),0.1}) else 0.6;
          parameter Modelica.SIunits.Voltage FermiG=Type*TPG*EGref/2;
          parameter Modelica.SIunits.Voltage Fn1=if TPG == 0 then 3.2 else Fn0 + EGref/2 - FermiG;
          parameter Modelica.SIunits.Voltage FermiS=Type*PHIeff/2;
          parameter Modelica.SIunits.Voltage Fn2=Fn1 - Fn0 - EGref/2 - FermiS;
          parameter Modelica.SIunits.Voltage VFB=Fn2 - NSS*q/COXeff;
          parameter Modelica.SIunits.Voltage Vcorr=Type*(GAMMAeff*sqrt(PHIeff) + PHIeff);
          parameter Modelica.SIunits.Voltage VT0eff=if Type*VT0 > 0 then VT0 else VFB + Vcorr;
          parameter Modelica.SIunits.Voltage VFBeff=if Type*VT0 > 0 then VT0 - Vcorr else VFB;
          parameter Real XD(unit="m/V^0.5")=sqrt(2*es/(q*NSUBeff)) "Depletion factor";
          parameter Real CJeff(unit="F/m2")=if CJ > 0 then CJ else sqrt(es*q*NSUBeff/(2*PB));
          parameter Modelica.SIunits.Voltage EGeff=if Level == 3 and EG == 0 then 0.2 else EGref;
          parameter Modelica.SIunits.Voltage VBP=UCRIT*es/COXeff "Gate to channel critical voltage";
          parameter Modelica.SIunits.Current ISDeff=if ISD > 0 then ISD else if AD*JS > 0 then AD*JS else 1e-15;
          parameter Modelica.SIunits.Current ISSeff=if ISS > 0 then ISS else if AS*JS > 0 then AS*JS else 1e-15;
        algorithm 
          assert(NSUBeff > XNI, "NSUB must be larger than intrinsic carrier concentration");
          assert(LAMBDAeff < 0.2, "LAMBDA value too large, leads to numerical instability");
          assert(Leff > 0, "The effective channel length must be larger than zero");
        equation 
          connect(Vsd.V,Cbg1.vds) annotation(Line(visible=true, points={{128,2},{132,2},{132,98},{-2,98},{-2,90}}, color={0,0,191}));
          connect(D,Vsd.n) annotation(Line(visible=true, points={{100,50},{118,50},{118,12}}, color={0,0,255}));
          connect(Vsd.p,S) annotation(Line(visible=true, points={{118,-8},{118,-50},{100,-50}}, color={0,0,255}));
          connect(Sw1.p,Csg1.heatPort) annotation(Line(visible=true, points={{0,-65},{-6.73533e-16,-60},{-30,-60},{-30,-50}}, color={191,0,0}));
          connect(Sw1.n2,heatPort) annotation(Line(visible=true, points={{0,-87},{6.73533e-16,-89.5},{0,-89.5},{0,-100}}, color={191,0,0}));
          connect(Sw1.n1,T_nom.port) annotation(Line(visible=true, points={{5,-87},{12,-87},{12,-90},{59,-90}}, color={191,0,0}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(Rd.n,D) annotation(Line(points={{70,50},{100,50}}, color={0,0,255}));
          connect(Rs.n,S) annotation(Line(points={{68,-40},{80,-40},{80,-50},{100,-50}}, color={0,0,255}));
          connect(Cbg1.heatPort,Rd.heatPort) annotation(Line(points={{10,70},{10,34},{50,34},{50,40}}, color={191,0,0}));
          connect(Rd.heatPort,Mpi.heatPort) annotation(Line(points={{50,40},{50,-20},{0,-20}}, color={191,0,0}));
          connect(Mpi.B,B) annotation(Line(points={{20,0},{100,0}}, color={0,0,255}));
          connect(Rd.p,Mpi.D) annotation(Line(points={{30,50},{20,50},{20,10}}, color={0,0,255}));
          connect(Rs.p,Mpi.S) annotation(Line(points={{28,-40},{20,-40},{20,-10}}, color={0,0,255}));
          connect(Mpi.G,G) annotation(Line(points={{-20,-10},{-76,-10},{-76,-50},{-100,-50}}, color={0,0,255}));
          connect(Csg1.n,G) annotation(Line(points={{-50,-40},{-76,-40},{-76,-50},{-100,-50}}, color={0,0,255}));
          connect(Csg1.p,Rs.p) annotation(Line(points={{-10,-40},{28,-40}}, color={0,0,255}));
          connect(Cdg1.n,G) annotation(Line(points={{-50,50},{-76,50},{-76,-50},{-100,-50}}, color={0,0,255}));
          connect(Cdg1.p,Rd.p) annotation(Line(points={{-10,50},{30,50}}, color={0,0,255}));
          connect(Cbg1.p,B) annotation(Line(points={{30,80},{80,80},{80,0},{100,0}}, color={0,0,255}));
          connect(Cbg1.n,G) annotation(Line(points={{-10,80},{-76,80},{-76,-50},{-100,-50}}, color={0,0,255}));
          connect(Vsb.n,B) annotation(Line(points={{80,-14},{80,0},{100,0}}, color={0,0,255}));
          connect(Vsb.p,S) annotation(Line(points={{80,-34},{80,-50},{100,-50}}, color={0,0,255}));
          connect(Csg1.vbs,Vsb.V) annotation(Line(points={{-18,-30},{-18,-24},{70,-24}}, color={0,0,191}));
          connect(Cbg1.vds,Cdg1.vds) annotation(Line(points={{-2,90},{-2,98},{-42,98},{-42,60}}, color={0,0,191}));
          connect(Cdg1.vds,Csg1.vds) annotation(Line(points={{-42,60},{-42,66},{-60,66},{-60,-24},{-42,-24},{-42,-30}}, color={0,0,191}));
          connect(Csg1.vbs,Cdg1.vbs) annotation(Line(points={{-18,-30},{-18,-24},{-10,-24},{-10,30},{0,30},{0,66},{-18,66},{-18,60}}, color={0,0,191}));
          connect(Cbg1.vbs,Cdg1.vbs) annotation(Line(points={{22,90},{22,96},{38,96},{38,66},{-18,66},{-18,60}}, color={0,0,191}));
          connect(Cdg1.heatPort,Cbg1.heatPort) annotation(Line(points={{-30,40},{-30,34},{10,34},{10,70}}, color={191,0,0}));
          connect(Mpi.y1,Cdg1.u) annotation(Line(points={{10,22},{10,26},{-18,26},{-18,40}}, color={0,0,191}));
          connect(Mpi.y1,Cbg1.u) annotation(Line(points={{10,22},{10,26},{16,26},{16,60},{22,60},{22,70}}, color={0,0,191}));
          connect(Mpi.y1,Csg1.u) annotation(Line(points={{10,22},{10,26},{24,26},{24,-54},{-18,-54},{-18,-50}}, color={0,0,191}));
          connect(Rs.heatPort,Csg1.heatPort) annotation(Line(points={{48,-50},{48,-60},{-30,-60},{-30,-50}}, color={191,0,0}));
          connect(Mpi.heatPort,Csg1.heatPort) annotation(Line(points={{0,-20},{0,-60},{-30,-60},{-30,-50}}, color={191,0,0}));
        end Mp;

        package Types
          type MOSFETlevel= Modelica.Icons.TypeInteger(min=0, max=4) "MOSFET modeling level" annotation(preferedView="text", Evaluate=true, choices(choice=0 "0: Static injection model", choice=1 "1: Shichman-Hodges model", choice=2 "2: Grove-Frohman model", choice=3 "3: Empirical model", choice=4 "4: Simplified Grove-Frohman model"));
          type MOSFETgateType= Modelica.Icons.TypeReal(min=1, max=2) "MOSFET gate type" annotation(preferedView="text", Evaluate=true, choices(choice=0 "0: Aluminum gate", choice=1 "1: Polysilicon gate"));
          type EnforceCapacitor= Modelica.Icons.TypeBoolean "Selection of capacitive state variables" annotation(preferedView="text", Evaluate=true, choices(choice=true "true: Select (external) electrical capacitive voltage as state variable", choice=false "false: Select (internal) bond graph capacitive effort as state variable"));
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}));
        end Types;

        package Utilities "Utility models of Spice circuit element models"
          annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used within the Spice-style circuit element models.
</html>
"));
          model Isignal "Modulated internal current source with heat computation"
            extends BondLib.Electrical.Analog.Interfaces.OnePort;
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{-50,0}}),Line(color={0,0,255}, points={{0,-50},{0,50}}),Line(color={0,0,255}, points={{50,0},{90,0}}),Text(lineColor={0,0,255}, extent={{-100,-88},{100,-48}}, textString="%name")}), Diagram, Documentation(info="<html>
The internal modulated current source of Spice-style transistors is built in bondgraphic technology from a bond graph <b>mSf_Int</b> element.  The internal modulated current source of Spice-style transistors is in fact a non-linear resistor, rather than a source, since voltage and current are always pointing in the same direction. <p>
 
The internal modulated current source also has a heat port to put out the heat that is being generated by the resistor.
</html>
"));
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "Thermal connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            Modelica.Blocks.Interfaces.RealInput InPort1(redeclare type SignalType= Modelica.SIunits.Current ) "Current source" annotation(Placement(visible=true, transformation(x=0, y=60, scale=0.1, rotation=-90), iconTransformation(x=0, y=60, scale=0.1, rotation=-90)));
          protected 
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=-60.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=-60.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=-60.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=-60.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=-60.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(transformation(x=51.0, y=30.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false, rotation=0.0)));
            BondLib.Bonds.fBond B4 annotation(Placement(visible=true, transformation(x=0, y=10, scale=0.1, rotation=-90)));
            BondLib.Bonds.eBond B3 annotation(Placement(visible=true, transformation(x=0, y=-36, scale=0.12, rotation=-90)));
            BondLib.Sources.mSf_int I1 annotation(Placement(visible=true, transformation(x=0, y=-12, scale=0.1, aspectRatio=1.2, rotation=-450)));
          equation 
            connect(InPort1,I1.s) annotation(Line(visible=true, points={{0,60},{0,40},{-20,40},{-20,-12},{-10.8,-12}}, color={0,0,191}));
            connect(B4.fBondCon1,I1.BondCon1) annotation(Line(visible=true, points={{0,0},{-3.06152e-15,-2}}, color={192,192,192}));
            connect(I1.BondCon2,B3.fBondCon1) annotation(Line(visible=true, points={{3.06152e-15,-22},{0,-24}}, color={192,192,192}));
            connect(B3.eBondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,-48},{0,-48}}, color={192,192,192}));
            connect(B4.eBondCon1,BG2Heat1.BondCon1) annotation(Line(visible=true, points={{0,20},{0,20},{0,30},{38,30}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,-60},{12,-60}}, color={192,192,192}));
            connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,-60},{37.74,-60}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,-60},{-38,-60}}, color={192,192,192}));
            connect(J1p3_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,-60},{-12.26,-60}}, color={192,192,192}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,-60},{-80,-60},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,-60},{80,-60},{80,0},{100,0}}, color={0,0,255}));
            connect(BG2Heat1.port_b,heatPort) annotation(Line(points={{64,30},{70,30},{70,-80},{0,-80},{0,-100}}, color={191,0,0}));
          end Isignal;

          model RM "Spice-style resistor model for MOSFETs"
            extends Interfaces.SpiceTwoPort;
            parameter Modelica.SIunits.Resistance R=0 "Resistance at reference temperature";
            parameter Real TR1(unit="1/K")=0 "Linear temperature coefficient";
            parameter Real TR2(unit="1/K2")=0 "Quadratic temperature coefficient";
            parameter Integer Level=1 "MOSFET modeling level (check documentation window for details)";
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
            BondLib.Spice.Utilities.RM RM1(Tnom=Tnom, R=R, TR1=TR1, TR2=TR2, Level=Level) annotation(Placement(visible=true, transformation(x=-1.77636e-15, y=-14, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
          equation 
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{0,-80},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(RM1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{-1.77636e-15,-24},{0,-32}}, color={192,192,192}));
            connect(RM1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{-1.77636e-15,-4},{3.67382e-15,4}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Documentation(info="<html>
This is the regular Spice-style resistive source <b>RS</b> model, except that it looks at the modeling level.  If the level is equal to 0, the resistance is set equal to zero.
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-50,-40},{46,-80}}, fillColor={0,0,0}, textString="R=%R"),Line(points={{0,-30},{0,-91}}, color={191,0,0}),Line(color={0,0,255}, points={{70,0},{90,0}}),Line(color={0,0,255}, points={{-90,0},{-70,0}})}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end RM;

          model CjM "Spice-style junction capacitor model for MOSFETs"
            extends Interfaces.SpiceTwoPort;
            parameter Integer Level=3 "MOSFET modeling level (check documentation window for details)";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Current IS=0 "Saturation current at reference temperature";
            parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
            parameter Real CJ(unit="F/m2")=0.0001 "Zero-bias bulk capacitance per square meter at reference temperature";
            parameter Real MJ=0.33 "Bulk junction grading coefficient";
            parameter Real CJSW(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
            parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
            parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
            parameter Modelica.SIunits.Area A=0 "Diffusion area";
            parameter Modelica.SIunits.Length P=0 "Perimeter width";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 300 K";
            parameter Modelica.SIunits.Conductance GminDC=1e-12 "Leakage conductance";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            BondLib.Spice.Utilities.nlCM nlCM1(Tnom=Tnom, PB=PB, CJ=CJ, MJ=MJ, CJSW=CJSW, MJSW=MJSW, FC=FC, A=A, P=P, EG=EG, Level=Level) annotation(Placement(transformation(x=-40.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,20},{-30,-20},{30,0}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={255,255,255}),Line(points={{30,20},{30,-20}}, color={128,128,128}),Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0})}), Documentation(info="<html>
The Spice-style junction capacitance for MOSFETs computes the depletion capacitance value of a junction used in a MOSFET.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the junction capacitance at all, but rather compute the electric charge stored in the junction directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the junction capacitance, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>
 
This particular model uses the capacitance formula advocated in [2]. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 IS:      Transport saturation current (default value = 0 Amp)
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)
 
 CJ:      Zero-bias bulk capacitance per square meter at reference temperature (default value = 1e-4 F/m<sup>2</sup>)
 
 MJ:      Bulk junction grading coefficient (default value = 0.33)
 
 CJSW:    Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m)
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33)
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)
 
 A:       Diffusion area (default value = 0 m<sup>2</sup>)
 
 P:       Perimeter width (default value = 0 m)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
 
 GminDC:  Leakage conductance (default value = 1e-12 Mho)
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)
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
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-20.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            R Rd(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=70, y=0, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Electrical.Analog.Spice.Utilities.DjM DjM1(Tnom=Tnom, IS=IS, EG=EG, Level=Level, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=40, y=7.77156e-16, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vd annotation(Placement(visible=true, transformation(x=0, y=0, scale=0.14, rotation=-90)));
            Semiconductors.Utilities.VariableCapacitor2 VarC1(enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=-70, y=-1.33227e-15, scale=0.1, aspectRatio=1, rotation=-90)));
          equation 
            connect(p,VarC1.p) annotation(Line(visible=true, points={{-100,0},{-84,0},{-84,40},{-70,40},{-70,10}}, color={0,0,255}));
            connect(VarC1.n,Vd.n) annotation(Line(visible=true, points={{-70,-10},{-70,-40},{2.63358e-15,-40},{0,-14}}, color={0,0,255}));
            connect(VarC1.p,Vd.p) annotation(Line(visible=true, points={{-70,10},{-70,40},{9.19132e-16,40},{0,14}}, color={0,0,255}));
            connect(nlCM1.y,VarC1.u) annotation(Line(visible=true, points={{-51,0},{-61,-4.44089e-16}}, color={0,0,191}));
            connect(Vd.n,DjM1.n) annotation(Line(visible=true, points={{0,-14},{0,-14},{0,-40},{40,-40},{40,-10}}, color={0,0,255}));
            connect(Vd.p,DjM1.p) annotation(Line(visible=true, points={{0,14},{0,14},{0,40},{40,40},{40,10}}, color={0,0,255}));
            connect(Vd.V,nlCM1.u) annotation(Line(visible=true, points={{-14,0},{-24,9.19132e-16},{-24,0},{-28,0}}, color={0,0,191}));
            connect(Rd.p,DjM1.p) annotation(Line(visible=true, points={{70,10},{70,40},{40,40},{40,10}}, color={0,0,255}));
            connect(Rd.n,DjM1.n) annotation(Line(visible=true, points={{70,-10},{70,-40},{40,-40},{40,-10}}, color={0,0,255}));
            connect(DjM1.n,n) annotation(Line(visible=true, points={{40,-10},{40,-40},{88,-40},{88,0},{100,0}}, color={0,0,255}));
            connect(DjM1.heatPort,Tdev1.port) annotation(Line(visible=true, points={{30,-8.88178e-16},{30,-70},{-10,-70}}, color={191,0,0}));
            connect(Rd.heatPort,Tdev1.port) annotation(Line(visible=true, points={{60,0},{60,-70},{-10,-70}}, color={191,0,0}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-10,-70},{0,-70},{0,-100}}, color={191,0,0}));
            connect(Tdev1.T,nlCM1.Tdev) annotation(Line(points={{-30,-70},{-40,-70},{-40,-10}}, color={0,0,191}));
          end CjM;

          model Cgb "Spice-style gate capacitance between gate and bulk of MOSFETs"
            extends Interfaces.SpiceTwoPortV;
            parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
            parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
            parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
            parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
            parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
            parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
            parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
            parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
            parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
            parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
            parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
            parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
            parameter Real XQC=0 "Coefficient of channel charge share";
            parameter Real DELTA=0 "Width effect on threshold voltage";
            parameter Real ETA=0 "Static feedback on threshold voltage";
            parameter Real CGB0(unit="F/m")=1e-12 "Gate-bulk overlap capacitance per meter";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
            Modelica.Blocks.Interfaces.RealInput vbs(redeclare type SignalType= Modelica.SIunits.Voltage ) "Base-source voltage" annotation(Placement(visible=true, transformation(x=-60, y=100, scale=0.1, rotation=-450), iconTransformation(x=-60, y=100, scale=0.1, rotation=-270)));
            Modelica.Blocks.Interfaces.RealInput vds(redeclare type SignalType= Modelica.SIunits.Voltage ) "Drain-source voltage" annotation(Placement(visible=true, transformation(x=60, y=100, scale=0.1, rotation=-450), iconTransformation(x=60, y=100, scale=0.1, rotation=-270)));
            Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(visible=true, transformation(x=-60, y=-100, scale=0.1, rotation=-270), iconTransformation(x=-60, y=-100, scale=0.1, rotation=-90)));
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Spice.Utilities.Cgb Cgb1(Tnom=Tnom, Level=Level, Type=Type, VFB=VFB, KP=KP, GAMMA=GAMMA, PHI=PHI, COX=COX, NFS=NFS, XJ=XJ, L=L, W=W, LD=LD, XD=XD, DELTA=DELTA, ETA=ETA, CGB0=CGB0, EG=EG, XQC=XQC, e1(start=u0)) annotation(Placement(visible=true, transformation(x=3.33067e-15, y=-14, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-45, scale=0.12, aspectRatio=0.916667, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=17, scale=0.12, aspectRatio=0.916667, rotation=-450)));
          equation 
            connect(u,Cgb1.u) annotation(Line(visible=true, points={{-60,-100},{-60,-46},{20,-46},{20,-14},{10,-14}}, color={0,0,191}));
            connect(Cgb1.u1,vds) annotation(Line(visible=true, points={{-10,-8},{-30,-8},{-30,70},{60,70},{60,100}}, color={0,0,191}));
            connect(Cgb1.u2,vbs) annotation(Line(visible=true, points={{-10,-20},{-70,-20},{-70,70},{-60,70},{-60,100}}, color={0,0,191}));
            connect(Cgb1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{2.66454e-15,-4},{3.67382e-15,5}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.78},{-3.60034e-15,28.76}}, color={192,192,192}));
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{7.34764e-16,-86},{0,-86},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-57}}, color={192,192,192}));
            connect(Cgb1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{2.66454e-15,-24},{0,-33}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{18,30},{44,2}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-42,28},{-16,0}}, fillColor={0,0,255}, textString="+")}), Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>
 
This particular model uses the space charge formula advocated in [2]. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)
 
 XJ:      Metallurgical junction depth (default value = 0 m)
 
 L:       Channel length (default value = 1e-4 m)
 
 W:       Channel width (default value = 1e-4 m)
 
 LD:      Lateral diffusion (default value = 0 m)
 
 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)
 
 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 DELTA:   Width effect on threshold voltage (default value = 0)
 
 ETA:     Static feedback on threshold voltage (default value = 1)
 
 CGB0:    Gate-bulk overlap capacitance per meter (default value = 1e-12 F/m)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end Cgb;

          model Cgs "Spice-style gate capacitance between gate and source of MOSFETs"
            extends Interfaces.SpiceTwoPortV;
            parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
            parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
            parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
            parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
            parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
            parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
            parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
            parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
            parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
            parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
            parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
            parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
            parameter Real XQC=0 "Coefficient of channel charge share";
            parameter Real DELTA=0 "Width effect on threshold voltage";
            parameter Real ETA=0 "Static feedback on threshold voltage";
            parameter Real CGS0(unit="F/m")=1e-12 "Gate-source overlap capacitance per meter";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Spice.Utilities.Cgs Cgs1(Tnom=Tnom, GAMMA=GAMMA, PHI=PHI, XJ=XJ, LD=LD, DELTA=DELTA, ETA=ETA, CGS0=CGS0, EG=EG, L=L, W=W, Level=Level, Type=Type, VFB=VFB, KP=KP, COX=COX, XD=XD, NFS=NFS, XQC=XQC, e1(start=u0)) annotation(Placement(visible=true, transformation(x=8.88178e-16, y=-14, scale=0.1, aspectRatio=1, rotation=-90)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
          public 
            Modelica.Blocks.Interfaces.RealInput vds(redeclare type SignalType= Modelica.SIunits.Voltage ) "Drain-source voltage" annotation(Placement(transformation(x=60.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0), iconTransformation(x=60.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
            Modelica.Blocks.Interfaces.RealInput vbs(redeclare type SignalType= Modelica.SIunits.Voltage ) "Base-source voltage" annotation(Placement(transformation(x=-60.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0), iconTransformation(x=-60.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
          public 
            Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(transformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=-60.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
          equation 
            connect(vds,Cgs1.u1) annotation(Line(visible=true, points={{60,100},{60,70},{-30,70},{-30,-8},{-10,-8}}, color={0,0,191}));
            connect(vbs,Cgs1.u2) annotation(Line(visible=true, points={{-60,100},{-60,70},{-70,70},{-70,-20},{-10,-20}}, color={0,0,191}));
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{0,-80},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(Cgs1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{8.88178e-16,-24},{0,-32}}, color={192,192,192}));
            connect(Cgs1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{8.88178e-16,-4},{3.67382e-15,4}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(u,Cgs1.u) annotation(Line(visible=true, points={{-60,-100},{-60,-40},{20,-40},{20,-14},{10,-14}}, color={0,0,191}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{18,28},{44,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-42,26},{-16,-2}}, fillColor={0,0,255}, textString="+")}), Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>
 
This particular model uses the space charge formula advocated in [2]. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)
 
 XJ:      Metallurgical junction depth (default value = 0 m)
 
 L:       Channel length (default value = 1e-4 m)
 
 W:       Channel width (default value = 1e-4 m)
 
 LD:      Lateral diffusion (default value = 0 m)
 
 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)
 
 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 DELTA:   Width effect on threshold voltage (default value = 0)
 
 ETA:     Static feedback on threshold voltage (default value = 1)
 
 CGS0:    Gate-source overlap capacitance per meter (default value = 1e-12 F/m)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end Cgs;

          model Cgd "Spice-style gate capacitance between gate and drain of MOSFETs"
            extends Interfaces.SpiceTwoPortV;
            parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
            parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage at reference temperature";
            parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
            parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
            parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
            parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
            parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
            parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
            parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
            parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
            parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
            parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
            parameter Real XQC=0 "Coefficient of channel charge share";
            parameter Real DELTA=0 "Width effect on threshold voltage";
            parameter Real ETA=0 "Static feedback on threshold voltage";
            parameter Real CGD0(unit="F/m")=1e-12 "Gate-drain overlap capacitance per meter";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
            Modelica.Blocks.Interfaces.RealInput vbs(redeclare type SignalType= Modelica.SIunits.Voltage ) "Base-source voltage" annotation(Placement(visible=true, transformation(x=-60, y=100, scale=0.1, rotation=-450), iconTransformation(x=-60, y=100, scale=0.1, rotation=-270)));
            Modelica.Blocks.Interfaces.RealInput vds(redeclare type SignalType= Modelica.SIunits.Voltage ) "Drain-source voltage" annotation(Placement(visible=true, transformation(x=60, y=100, scale=0.1, rotation=-450), iconTransformation(x=60, y=100, scale=0.1, rotation=-270)));
            Modelica.Blocks.Interfaces.RealInput u[5] "Connector of Real input signals" annotation(Placement(visible=true, transformation(x=-60, y=-100, scale=0.1, rotation=-270), iconTransformation(x=-60, y=-100, scale=0.1, rotation=-90)));
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Spice.Utilities.Cgd Cgd1(Tnom=Tnom, GAMMA=GAMMA, PHI=PHI, XJ=XJ, LD=LD, DELTA=DELTA, ETA=ETA, CGD0=CGD0, EG=EG, L=L, W=W, Level=Level, Type=Type, VFB=VFB, KP=KP, COX=COX, XD=XD, NFS=NFS, XQC=XQC, e1(start=u0)) annotation(Placement(visible=true, transformation(x=-1.44329e-15, y=-14, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
          equation 
            connect(u,Cgd1.u) annotation(Line(visible=true, points={{-60,-100},{-60,-40},{20,-40},{20,-14},{10,-14}}, color={0,0,191}));
            connect(vds,Cgd1.u1) annotation(Line(visible=true, points={{60,100},{60,70},{-30,70},{-30,-8},{-10,-8}}, color={0,0,191}));
            connect(vbs,Cgd1.u2) annotation(Line(visible=true, points={{-60,100},{-60,70},{-70,70},{-70,-20},{-10,-20}}, color={0,0,191}));
            connect(Cgd1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{-3.10862e-15,-4},{3.67382e-15,4}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{7.34764e-16,-86},{0,-86},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(Cgd1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{-3.10862e-15,-24},{0,-32}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Documentation(info="<html>
The Spice-style gate capacitances for MOSFETs are non-linear capacitors that use different formulae to compute the capacitance value in the four different regions: <i>accumulation</i>, <i>depletion</i>, <i>saturation</i>, and the <i>linear region</i>.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the gate capacitances at all, but rather compute the electric charges stored in these regions directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the gate capacitances directly, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>
 
This particular model uses the space charge formula advocated in [2]. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 Type:    Type of MOSFET (default value = 1)
            Type = +1:  NMOS
            Type = -1:  PMOS
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VFB:     Flat band voltage at reference temperature (default value = 0 Volt)
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)
 
 XJ:      Metallurgical junction depth (default value = 0 m)
 
 L:       Channel length (default value = 1e-4 m)
 
 W:       Channel width (default value = 1e-4 m)
 
 LD:      Lateral diffusion (default value = 0 m)
 
 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)
 
 XQC:     Coefficient of channel charge share (default value = 0)
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 DELTA:   Width effect on threshold voltage (default value = 0)
 
 ETA:     Static feedback on threshold voltage (default value = 1)
 
 CGD0:    Gate-drain overlap capacitance per meter (default value = 1e-12 F/m)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, pp.196-197.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{18,28},{44,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-42,26},{-16,-2}}, fillColor={0,0,255}, textString="+")}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end Cgd;

          model DjM "Spice-style junction diode model for MOSFETs"
            extends Interfaces.SpiceTwoPort;
            parameter Integer Level=3 "MOSFET modeling level (check documentation window for details)";
            parameter Modelica.SIunits.Current IS=0 "Saturation current at reference temperature";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
            BondLib.Spice.Utilities.DjM DjM1(Tnom=Tnom, IS=IS, EG=EG, Level=Level, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=1.77636e-15, y=-14, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
          equation 
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{7.34764e-16,-86},{0,-86},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(DjM1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{1.77636e-15,-24},{0,-32}}, color={192,192,192}));
            connect(DjM1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{1.77636e-15,-4},{3.67382e-15,4}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Documentation(info="<html>
The Spice-style MOSFET junction diode is a regular exponential diode. A separate model was needed to implement the <b>Level</b> parameter of the MOSFET models. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:  MOSFET modeling level (default value = 3)
           Level=0: Static injection model
           Level=1: Shichman-Hodges model
           Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 IS:     Transport saturation current (default value = 0 Amp)
 
 JS:     Transport saturation current density (default value = 0 Amp/m<sup>2</sup>)
 
 A :     Diffusion area (default value = 0 m<sup>2</sup>)
 
 EG:     Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
 
 EMin:   if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:   if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{-30,0}}),Line(color={0,0,255}, points={{30,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(points={{0,-20},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-24,14},{4,-14}}, fillColor={0,0,255}, textString="J")}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end DjM;

          model Mni "Spice-style internal NMOS transistor"
            parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
            parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VT0=0 "Zero-bias threshold voltage";
            parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage";
            parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
            parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
            parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
            parameter Modelica.SIunits.InversePotential LAMBDA=0 "Channel length modulation";
            parameter Modelica.SIunits.Length TOX=1e-07 "Thin oxide thickness";
            parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
            parameter Modelica.SIunits.ElectronNumberDensity NSUB=0 "Substrate doping";
            parameter Real NSS(unit="1/m2")=0 "Surface state density";
            parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
            parameter Real NEFF=1 "Total channel charge coefficient";
            parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
            parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
            parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
            parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
            parameter Modelica.SIunits.Area AD=0 "Drain diffusion area";
            parameter Modelica.SIunits.Length PD=0 "Drain perimeter width";
            parameter Modelica.SIunits.Area AS=0 "Source diffusion area";
            parameter Modelica.SIunits.Length PS=0 "Source perimeter width";
            parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
            parameter Real TPG=1 "Type of gate material";
            parameter Real U0(unit="m2/(V.s)")=0 "Surface mobility at reference temperature";
            parameter Modelica.SIunits.ElectricFieldStrength UCRIT=1000000.0 "Critical electric field for mobility";
            parameter Real UEXP=0 "Exponential coefficient for mobility";
            parameter Real UTRA=0 "Transverse field coefficient";
            parameter Modelica.SIunits.Velocity VMAX=0 "Maximum drift velocity of carriers";
            parameter Modelica.SIunits.ElectricFieldStrength ECRIT=0 "Critical electric field for pinch-off";
            parameter Real XQC=0 "Coefficient of channel charge share";
            parameter Real DELTA=0 "Width effect on threshold voltage";
            parameter Real KAPPA=0.2 "Saturation field factor";
            parameter Real ETA=0 "Static feedback on threshold voltage";
            parameter Modelica.SIunits.InversePotential THETA=0 "Mobility modulation";
            parameter Modelica.SIunits.Voltage VBP=0 "Gate to channel critical voltage";
            parameter Modelica.SIunits.Current ISD=0 "Drain junction saturation current at reference temperature";
            parameter Modelica.SIunits.Current ISS=0 "Source junction saturation current at reference temperature";
            parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
            parameter Real CJ(unit="F/m2")=0 "Zero-bias bulk capacitance per square meter at reference temperature";
            parameter Real MJ=0.33 "Bulk junction grading coefficient";
            parameter Real CJSW(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
            parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
            parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
            parameter Modelica.SIunits.Conductance GminDC=1e-12 "Leakage conductance";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
            Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "Thermal connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name"),Line(color={0,0,255}, points={{-90,-50},{-10,-50}}),Line(color={0,0,255}, points={{-10,-50},{-10,50}}),Line(color={0,0,255}, points={{10,70},{10,29}}),Line(color={0,0,255}, points={{10,20},{10,-21}}),Line(color={0,0,255}, points={{10,-30},{10,-71}}),Line(color={0,0,255}, points={{10,50},{91,50}}),Line(color={0,0,255}, points={{10,0},{90,0}}),Line(color={0,0,255}, points={{10,-50},{90,-50}}),Polygon(lineColor={0,0,255}, points={{40,0},{60,5},{60,-5},{40,0}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-50}}, color={191,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,14},{-74,8}}, textString="vds", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{-86,-2},{-72,-8}}, fillColor={128,128,128}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-66,30},{-52,24}}, fillColor={128,128,128}, textString="vbs"),Text(lineColor={0,0,255}, extent={{-66,-24},{-52,-30}}, fillColor={128,128,128}, textString="Tdev"),Ellipse(extent={{48,2},{52,-2}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255})}), Documentation(info="<html>
The Spice-style internal n-channel MOSFET model contains the non-linear current source, the two junction diodes (including the junctions capacitances), as well as leakage conductances everywhere to keep the model together. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VT0:     Zero-bias threshold voltage (default value = 0 Volt)
            <font color=blue><b>VT0 &gt; 0 for enhancement MOSFET
            VT0 &lt; 0 for depletion MOSFET</b></font>
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)
 
 LAMBDA:  Channel length modulation  (default value = 0 1/Volt)
 
 TOX:     Thin oxide thickness (default value = 1e-7 m)
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)
 
 NSUB:    Substrate doping (default value = 0 1/m<sup>3</sup>)
 
 NSS:     Surface state density (default value = 0 1/m<sup>2</sup>)
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)
 
 NEFF:    Total channel charge coefficient (default value = 1)
 
 XJ:      Metallurgical junction depth (default value = 0 m)
 
 L:       Channel length (default value = 1e-4 m)
 
 W:       Channel width (default value = 1e-4 m)
 
 LD:      Lateral diffusion (default value = 0 m)
 
 AD:      Drain diffusion area (default value = 0 m<sup>2</sup>)
 
 PD:      Drain perimeter width (default value = 0 m)
 
 AS:      Source diffusion area (default value = 0 m<sup>2</sup>)
 
 PS:      Source perimeter width (default value = 0 m)
 
 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)
 
 TPG:     Type of gate material (default value = 1)
 
 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s))
 
 UCRIT:   Critical electric field for mobility (default value = 1e6 V/m)
 
 UEXP:    Exponential coefficient for mobility (default value = 0)
 
 UTRA:    Transverse field coefficient (default value = 0)
 
 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s)
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation</b></font>
 
 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m) <font color=red>Levels 2,3</font>
 
 XQC:     Coefficient of channel charge share (default value = 0) <font color=red>Levels 2,3</font>
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 DELTA:   Width effect on threshold voltage (default value = 0)
 
 KAPPA:   Saturation field factor (default value = 0.2)
 
 ETA:     Static feedback on threshold voltage (default value = 0)
 
 THETA:   Mobility modulation (default value = 0 1/Volt)
 
 VBP:     Gate to channel critical voltage (default value = 0 Volt)
 
 ISD:     Drain junction saturation current at reference temperature (default value = 0 Amp)
 
 ISS:     Source junction saturation current at reference temperature (default value = 0 Amp)
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)
 
 CJ:      Zero-bias bulk capacitance per square meter at reference temperature (default value = 1e-4 F/m<sup>2</sup>)
 
 MJ:      Bulk junction grading coefficient (default value = 0.33)
 
 CJSW:    Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m)
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33)
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)
 
 GminDC:  Leakage conductance (default value = 1e-12 mho)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
            Isignal Ids annotation(Placement(transformation(x=-20.0, y=0.0, scale=0.14, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
            BondLib.Spice.Utilities.IDS0 IDS0(Tnom=Tnom, KP=KP, GAMMA=GAMMA, LAMBDA=LAMBDA, NFS=NFS, NEFF=NEFF, XJ=XJ, U0=U0, UEXP=UEXP, UTRA=UTRA, VMAX=VMAX, DELTA=DELTA, EG=EG, L=L, W=W, Level=Level, EMin=EMin, EMax=EMax, PHI=PHI, Type=Type, VFB=VFB, COX=COX, XD=XD, ECRIT=ECRIT, VBP=VBP, PB=PB, LD=LD, KAPPA=KAPPA, ETA=ETA, THETA=THETA) annotation(Placement(transformation(x=-53.0, y=0.0, scale=0.15, aspectRatio=0.933333333333333, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-30.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vds annotation(Placement(transformation(x=118.0, y=2.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vgs annotation(Placement(transformation(x=70.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=0.0)));
            Modelica.Blocks.Interfaces.RealOutput y1[5] "Connector of Real output signals" annotation(Placement(transformation(x=50.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=50.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
            R Rgs(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=-50, scale=0.1)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vbs annotation(Placement(visible=true, transformation(x=84, y=-24, scale=0.1, flipHorizontal=true, flipVertical=true, rotation=-630)));
            CjM Dbs(Tnom=Tnom, PB=PB, CJ=CJ, MJ=MJ, CJSW=CJSW, MJSW=MJSW, FC=FC, EG=EG, GminDC=GminDC, Level=Level, IS=ISS, A=AS, P=PS, EMin=EMin, EMax=EMax, enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=50, y=-19.5625, scale=0.104375, aspectRatio=0.958084, flipHorizontal=true, flipVertical=true, rotation=-270)));
            R Rgd(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=50, scale=0.1)));
            R Rgb(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=80, scale=0.1, aspectRatio=1)));
            CjM Dbd(Tnom=Tnom, IS=ISD, PB=PB, CJ=CJ, MJ=MJ, CJSW=CJSW, MJSW=MJSW, FC=FC, A=AD, P=PD, EG=EG, GminDC=GminDC, Level=Level, EMin=EMin, EMax=EMax, enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=50, y=20, scale=0.1, aspectRatio=0.9, flipHorizontal=true, rotation=-90)));
            R Rds(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=10, y=5.55112e-16, scale=0.1, rotation=-90)));
          equation 
            connect(Rds.heatPort,Ids.heatPort) annotation(Line(visible=true, points={{0,5.55112e-16},{-4,-1.22461e-15},{-4,9.19132e-16},{-6,0}}, color={191,0,0}));
            connect(Rds.n,S) annotation(Line(visible=true, points={{10,-10},{10,-50},{100,-50}}, color={0,0,255}));
            connect(Rds.p,D) annotation(Line(visible=true, points={{10,10},{10,50},{100,50}}, color={0,0,255}));
            connect(Rgb.heatPort,Dbd.heatPort) annotation(Line(visible=true, points={{-50,70},{41,70},{41,20}}, color={191,0,0}));
            connect(Dbd.heatPort,Rgd.heatPort) annotation(Line(visible=true, points={{41,20},{41,40},{-50,40}}, color={191,0,0}));
            connect(Dbd.heatPort,Dbs.heatPort) annotation(Line(visible=true, points={{41,20},{35.9987,20},{35.9987,-19.5625},{40,-19.5625}}, color={191,0,0}));
            connect(Dbd.n,D) annotation(Line(visible=true, points={{50,30},{50,50},{100,50}}, color={0,0,255}));
            connect(B,Dbd.p) annotation(Line(visible=true, points={{100,0},{50,0},{50,10}}, color={0,0,255}));
            connect(Rgb.n,B) annotation(Line(visible=true, points={{-40,80},{32,80},{32,0},{100,0}}, color={0,0,255}));
            connect(Rgb.p,G) annotation(Line(visible=true, points={{-60,80},{-90,80},{-90,-50},{-100,-50}}, color={0,0,255}));
            connect(Rgd.n,D) annotation(Line(visible=true, points={{-40,50},{100,50}}, color={0,0,255}));
            connect(Rgd.p,G) annotation(Line(visible=true, points={{-60,50},{-90,50},{-90,-50},{-100,-50}}, color={0,0,255}));
            connect(Dbs.heatPort,Tdev1.port) annotation(Line(visible=true, points={{40,-19.5625},{40,-80},{-15.9988,-80},{-20,-80}}, color={191,0,0}));
            connect(Dbs.p,B) annotation(Line(visible=true, points={{50,-9.125},{50,0},{100,0}}, color={0,0,255}));
            connect(Dbs.n,S) annotation(Line(visible=true, points={{50,-30},{50,-50},{100,-50}}, color={0,0,255}));
            connect(Vbs.n,S) annotation(Line(visible=true, points={{84,-34},{84,-50},{100,-50}}, color={0,0,255}));
            connect(Vbs.p,B) annotation(Line(visible=true, points={{84,-14},{84,0},{100,0}}, color={0,0,255}));
            connect(IDS0.u3,Vbs.V) annotation(Line(visible=true, points={{-53,14},{-54,14},{-54,34},{70,34},{70,-24},{74,-24}}, color={0,0,191}));
            connect(Rgs.heatPort,Tdev1.port) annotation(Line(visible=true, points={{-50,-60},{-6,-60},{-6,-80},{-20,-80}}, color={191,0,0}));
            connect(Rgs.n,S) annotation(Line(visible=true, points={{-40,-50},{100,-50}}, color={0,0,255}));
            connect(Rgs.p,G) annotation(Line(visible=true, points={{-60,-50},{-100,-50}}, color={0,0,255}));
            connect(IDS0.y,Ids.InPort1) annotation(Line(points={{-36.5,1.77636e-15},{-13.7,1.77636e-15},{-13.7,2.29069e-15},{-28.4,2.29069e-15}}, color={0,0,191}));
            connect(Ids.p,D) annotation(Line(points={{-20,14},{-20,50},{100,50}}, color={0,0,255}));
            connect(Ids.n,S) annotation(Line(points={{-20,-14},{-20,-50},{100,-50}}, color={0,0,255}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-20,-80},{0,-80},{0,-100}}, color={191,0,0}));
            connect(Tdev1.port,Ids.heatPort) annotation(Line(points={{-20,-80},{-6,-80},{-6,9.19132e-16}}, color={191,0,0}));
            connect(Tdev1.T,IDS0.Tdev) annotation(Line(points={{-40,-80},{-80,-80},{-80,-30},{-53,-30},{-53,-14}}, color={0,0,191}));
            connect(Vds.p,D) annotation(Line(points={{118,12},{118,50},{100,50}}, color={0,0,255}));
            connect(Vds.n,S) annotation(Line(points={{118,-8},{118,-50},{100,-50}}, color={0,0,255}));
            connect(IDS0.u1,Vds.V) annotation(Line(points={{-71,8.4},{-92,8.4},{-92,92},{132,92},{132,2},{128,2}}, color={0,0,191}));
            connect(Vgs.n,S) annotation(Line(points={{80,-80},{100,-80},{100,-50}}, color={0,0,255}));
            connect(Vgs.p,G) annotation(Line(points={{60,-80},{50,-80},{50,-104},{-100,-104},{-100,-50}}, color={0,0,255}));
            connect(Vgs.V,IDS0.u2) annotation(Line(points={{70,-90},{70,-106},{-82,-106},{-82,-8.4},{-71,-8.4}}, color={0,0,191}));
            connect(IDS0.y1,y1) annotation(Line(points={{-36.5,-7},{-32,-7},{-32,-30},{28,-30},{28,76},{50,76},{50,110}}, color={0,0,191}));
          end Mni;

          model Mpi "Spice-style internal PMOS transistor"
            parameter Integer Level=3 "Level of MOS model (check documentation window for details)";
            parameter Integer Type=1 "Type=1 for NMOS; Type=-1 for PMOS";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VT0=0 "Zero-bias threshold voltage";
            parameter Modelica.SIunits.Voltage VFB=0 "Flat band voltage";
            parameter Modelica.SIunits.Transconductance KP=0 "Transconductance parameter at reference temperature";
            parameter Real GAMMA(unit="V^0.5")=0 "Body-effect parameter";
            parameter Modelica.SIunits.Voltage PHI=0 "Surface inversion potential at reference temperature";
            parameter Modelica.SIunits.InversePotential LAMBDA=0 "Channel length modulation";
            parameter Modelica.SIunits.Length TOX=1e-07 "Thin oxide thickness";
            parameter Real COX(unit="F/m2")=0 "Specific capacitance of SiO2";
            parameter Modelica.SIunits.ElectronNumberDensity NSUB=0 "Substrate doping";
            parameter Real NSS(unit="1/m2")=0 "Surface state density";
            parameter Real NFS(unit="1/m2")=0 "Surface fast state density";
            parameter Real NEFF=1 "Total channel charge coefficient";
            parameter Modelica.SIunits.Length L(min=0)=0.0001 "Channel length";
            parameter Modelica.SIunits.Length W(min=0)=0.0001 "Channel width";
            parameter Modelica.SIunits.Length XJ=0 "Metallurgical junction depth";
            parameter Modelica.SIunits.Length LD=0 "Lateral diffusion";
            parameter Modelica.SIunits.Area AD=0 "Drain diffusion area";
            parameter Modelica.SIunits.Length PD=0 "Drain perimeter width";
            parameter Modelica.SIunits.Area AS=0 "Source diffusion area";
            parameter Modelica.SIunits.Length PS=0 "Source perimeter width";
            parameter Real XD(unit="m/V^0.5")=0 "Depletion factor";
            parameter Real TPG=1 "Type of gate material";
            parameter Real U0(unit="m2/(V.s)")=0 "Surface mobility at reference temperature";
            parameter Modelica.SIunits.ElectricFieldStrength UCRIT=1000000.0 "Critical electric field for mobility";
            parameter Real UEXP=0 "Exponential coefficient for mobility";
            parameter Real UTRA=0 "Transverse field coefficient";
            parameter Modelica.SIunits.Velocity VMAX=0 "Maximum drift velocity of carriers";
            parameter Modelica.SIunits.ElectricFieldStrength ECRIT=0 "Critical electric field for pinch-off";
            parameter Real XQC=0 "Coefficient of channel charge share";
            parameter Real DELTA=0 "Width effect on threshold voltage";
            parameter Real KAPPA=0.2 "Saturation field factor";
            parameter Real ETA=0 "Static feedback on threshold voltage";
            parameter Modelica.SIunits.InversePotential THETA=0 "Mobility modulation";
            parameter Modelica.SIunits.Voltage VBP=0 "Gate to channel critical voltage";
            parameter Modelica.SIunits.Current ISD=0 "Drain junction saturation current at reference temperature";
            parameter Modelica.SIunits.Current ISS=0 "Source junction saturation current at reference temperature";
            parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
            parameter Real CJ(unit="F/m2")=0 "Zero-bias bulk capacitance per square meter at reference temperature";
            parameter Real MJ=0.33 "Bulk junction grading coefficient";
            parameter Real CJSW(unit="F/m")=1e-09 "Zero-bias perimeter capacitance per meter at reference temperature";
            parameter Real MJSW=0.33 "Perimeter capacitance grading coefficient";
            parameter Real FC=0.5 "Forward-bias depletion capacitance coefficient";
            parameter Modelica.SIunits.Conductance GminDC=1e-12 "Leakage conductance";
            parameter Modelica.SIunits.Voltage EG=1.11 "Energy gap for temperature effect on saturation current at 0 K";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
            Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            Modelica.Electrical.Analog.Interfaces.Pin B "Bulk" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "Thermal connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            BondLib.Spice.Utilities.IDS0 IDS0(Tnom=Tnom, KP=KP, GAMMA=GAMMA, LAMBDA=LAMBDA, NFS=NFS, NEFF=NEFF, XJ=XJ, U0=U0, UEXP=UEXP, UTRA=UTRA, VMAX=VMAX, DELTA=DELTA, EG=EG, L=L, W=W, Level=Level, EMin=EMin, EMax=EMax, PHI=PHI, Type=Type, VFB=VFB, COX=COX, XD=XD, ECRIT=ECRIT, VBP=VBP, PB=PB, LD=LD, KAPPA=KAPPA, ETA=ETA, THETA=THETA) annotation(Placement(transformation(x=-53.0, y=0.0, scale=0.15, aspectRatio=0.933333333333333, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-30.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vsg annotation(Placement(transformation(x=70.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=0.0)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vsb annotation(Placement(transformation(x=84.0, y=-24.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
            annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-88,14},{-74,8}}, fillColor={128,128,128}, textString="vsd"),Text(lineColor={0,0,255}, extent={{-86,-2},{-72,-8}}, fillColor={128,128,128}, textString="vsg"),Text(lineColor={0,0,255}, extent={{-66,30},{-52,24}}, fillColor={128,128,128}, textString="vsb"),Text(lineColor={0,0,255}, extent={{-66,-24},{-52,-30}}, fillColor={128,128,128}, textString="Tdev"),Ellipse(extent={{48,2},{52,-2}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255})}), Documentation(info="<html>
The Spice-style internal p-channel MOSFET model contains the non-linear current source, the two junction diodes (including the junctions capacitances), as well as leakage conductances everywhere to keep the model together. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VT0:     Zero-bias threshold voltage (default value = 0 Volt)
            <font color=blue><b>VT0 &lt; 0 for enhancement MOSFET
            VT0 &gt; 0 for depletion MOSFET</b></font>
 
 KP:      Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 GAMMA:   Body-effect parameter (default value = Volt<sup>0.5</sup>)
 
 PHI:     Surface inversion potential at reference temperature (default value = 0 Volt)
 
 LAMBDA:  Channel length modulation  (default value = 0 1/Volt)
 
 TOX:     Thin oxide thickness (default value = 1e-7 m)
 
 COX:     Specific capacitance of SiO2 (default value = 0 F/m<sup>2</sup>)
 
 NSUB:    Substrate doping (default value = 0 1/m<sup>3</sup>)
 
 NSS:     Surface state density (default value = 0 1/m<sup>2</sup>)
 
 NFS:     Surface fast state density (default value = 0 1/m<sup>2</sup>)
 
 NEFF:    Total channel charge coefficient (default value = 1)
 
 XJ:      Metallurgical junction depth (default value = 0 m)
 
 L:       Channel length (default value = 1e-4 m)
 
 W:       Channel width (default value = 1e-4 m)
 
 LD:      Lateral diffusion (default value = 0 m)
 
 AD:      Drain diffusion area (default value = 0 m<sup>2</sup>)
 
 PD:      Drain perimeter width (default value = 0 m)
 
 AS:      Source diffusion area (default value = 0 m<sup>2</sup>)
 
 PS:      Source perimeter width (default value = 0 m)
 
 XD:      Depletion factor (default value = 0 m/Volt<sup>0.5</sup>)
 
 TPG:     Type of gate material (default value = 1)
 
 U0:      Surface mobility at reference temperature (default value = 0 m<sup>2</sup>/(V*s))
 
 UCRIT:   Critical electric field for mobility (default value = 1e6 V/m)
 
 UEXP:    Exponential coefficient for mobility (default value = 0)
 
 UTRA:    Transverse field coefficient (default value = 0)
 
 VMAX:    Maximum drift velocity of carriers (default value = 0 m/s)
            <font color=blue><b>VMAX = 0: Frohman-Grove model of drain current computation</b></font>
            <font color=blue><b>VMAX &gt; 0: Baum-Beneking model of drain current computation</b></font>
 
 ECRIT:   Critical electric field for pinch-off (default value = 0 V/m) <font color=red>Levels 2,3</font>
 
 XQC:     Coefficient of channel charge share (default value = 0) <font color=red>Levels 2,3</font>
            <font color=blue><b>XQC &lt;= 0.5: Ward-Dutton model of gate capacitance computation</b></font>
            <font color=blue><b>XQC &gt;  0.5: Meyer model of gate capacitance computation</b></font>
 
 DELTA:   Width effect on threshold voltage (default value = 0)
 
 KAPPA:   Saturation field factor (default value = 0.2)
 
 ETA:     Static feedback on threshold voltage (default value = 0)
 
 THETA:   Mobility modulation (default value = 0 1/Volt)
 
 VBP:     Gate to channel critical voltage (default value = 0 Volt)
 
 ISD:     Drain junction saturation current at reference temperature (default value = 0 Amp)
 
 ISS:     Source junction saturation current at reference temperature (default value = 0 Amp)
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)
 
 CJ:      Zero-bias bulk capacitance per square meter at reference temperature (default value = 1e-4 F/m<sup>2</sup>)
 
 MJ:      Bulk junction grading coefficient (default value = 0.33)
 
 CJSW:    Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m)
 
 MJSW:    Perimeter capacitance grading coefficient (default value = 0.33)
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)
 
 GminDC:  Leakage conductance (default value = 1e-12 mho)
 
 EG:      Energy gap for temperature effect on saturation current (default value = 1.11 Volt)
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name"),Line(color={0,0,255}, points={{-90,-50},{-10,-50}}),Line(color={0,0,255}, points={{-10,-50},{-10,50}}),Line(color={0,0,255}, points={{10,70},{10,29}}),Line(color={0,0,255}, points={{10,20},{10,-21}}),Line(color={0,0,255}, points={{10,-30},{10,-71}}),Line(color={0,0,255}, points={{10,50},{91,50}}),Line(color={0,0,255}, points={{10,0},{90,0}}),Line(color={0,0,255}, points={{10,-50},{90,-50}}),Polygon(lineColor={0,0,255}, points={{60,0},{40,5},{40,-5},{60,0}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-50}}, color={191,0,0})}));
            Modelica.Blocks.Interfaces.RealOutput y1[5] "Connector of Real output signals" annotation(Placement(transformation(x=50.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=50.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
            CjM Dsb(Tnom=Tnom, PB=PB, CJ=CJ, MJ=MJ, CJSW=CJSW, MJSW=MJSW, FC=FC, EG=EG, GminDC=GminDC, Level=Level, IS=ISS, A=AS, P=PS, enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=50, y=-26, scale=0.14, aspectRatio=1, flipHorizontal=true, rotation=-90)));
            CjM Ddb(Tnom=Tnom, IS=ISD, PB=PB, CJ=CJ, MJ=MJ, CJSW=CJSW, MJSW=MJSW, FC=FC, A=AD, P=PD, EG=EG, GminDC=GminDC, Level=Level, enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=49.8207, y=26, scale=0.14, aspectRatio=0.986093, flipHorizontal=true, flipVertical=true, rotation=-270)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vsd annotation(Placement(visible=true, transformation(x=118, y=2, scale=0.1, flipHorizontal=true, flipVertical=true, rotation=-90)));
            Isignal Isd annotation(Placement(visible=true, transformation(x=-20, y=0, scale=0.14, flipHorizontal=true, flipVertical=true, rotation=-90)));
            R Rsg(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=-50, scale=0.1)));
            R Rdg(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=50, scale=0.1, aspectRatio=1)));
            R Rbg(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=-50, y=80, scale=0.1, aspectRatio=1)));
            R Rsd(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=10, y=-10, scale=0.1, aspectRatio=1, rotation=-90)));
          equation 
            connect(IDS0.u1,Vsd.V) annotation(Line(visible=true, points={{-71,8.4},{-92,8.4},{-92,90},{132,90},{132,2},{128,2}}, color={0,0,191}));
            connect(Rsd.n,S) annotation(Line(visible=true, points={{10,-20},{10,-50},{100,-50}}, color={0,0,255}));
            connect(Rsd.p,D) annotation(Line(visible=true, points={{10,0},{10,50},{100,50}}, color={0,0,255}));
            connect(Rsd.heatPort,Isd.heatPort) annotation(Line(visible=true, points={{0,-10},{-4,-1.22461e-15},{-4,-9.19132e-16},{-6,0}}, color={191,0,0}));
            connect(Rbg.n,B) annotation(Line(visible=true, points={{-40,80},{30,80},{30,0},{100,0}}, color={0,0,255}));
            connect(Rbg.p,G) annotation(Line(visible=true, points={{-60,80},{-90,80},{-90,-50},{-100,-50}}, color={0,0,255}));
            connect(Rbg.heatPort,Ddb.heatPort) annotation(Line(visible=true, points={{-50,70},{36,70},{36.0154,26}}, color={191,0,0}));
            connect(Rdg.p,G) annotation(Line(visible=true, points={{-60,50},{-90,50},{-90,-50},{-100,-50}}, color={0,0,255}));
            connect(Rdg.n,D) annotation(Line(visible=true, points={{-40,50},{100,50}}, color={0,0,255}));
            connect(Rdg.heatPort,Ddb.heatPort) annotation(Line(visible=true, points={{-50,40},{36,40},{36.0154,26}}, color={191,0,0}));
            connect(Rsg.heatPort,Tdev1.port) annotation(Line(visible=true, points={{-50,-60},{-6,-60},{-6,-80},{-20,-80}}, color={191,0,0}));
            connect(Rsg.p,G) annotation(Line(visible=true, points={{-60,-50},{-100,-50}}, color={0,0,255}));
            connect(Rsg.n,S) annotation(Line(visible=true, points={{-40,-50},{100,-50}}, color={0,0,255}));
            connect(Isd.p,S) annotation(Line(visible=true, points={{-20,-14},{-20,-50},{100,-50}}, color={0,0,255}));
            connect(Isd.n,D) annotation(Line(visible=true, points={{-20,14},{-20,50},{100,50}}, color={0,0,255}));
            connect(Tdev1.port,Isd.heatPort) annotation(Line(visible=true, points={{-20,-80},{-6,-80},{-6,0}}, color={191,0,0}));
            connect(IDS0.y,Isd.InPort1) annotation(Line(visible=true, points={{-36.5,0},{-13.7,1.77636e-15},{-13.7,-2.29069e-15},{-28.4,0}}, color={0,0,191}));
            connect(S,Vsd.p) annotation(Line(visible=true, points={{100,-50},{118,-50},{118,-8}}, color={0,0,255}));
            connect(D,Vsd.n) annotation(Line(visible=true, points={{100,50},{118,50},{118,12}}, color={0,0,255}));
            connect(Dsb.n,Ddb.n) annotation(Line(visible=true, points={{50,-12},{50,7.59825},{49.8207,7.59825},{49.8207,12}}, color={0,0,255}));
            connect(Ddb.n,B) annotation(Line(visible=true, points={{49.8207,12},{49.8207,0},{100,0}}, color={0,0,255}));
            connect(Ddb.p,D) annotation(Line(visible=true, points={{49.8207,40},{49.8207,50},{100,50}}, color={0,0,255}));
            connect(Ddb.heatPort,Dsb.heatPort) annotation(Line(visible=true, points={{36.0154,26},{36,-26}}, color={191,0,0}));
            connect(Dsb.p,S) annotation(Line(visible=true, points={{50,-40},{50,-50},{100,-50}}, color={0,0,255}));
            connect(Dsb.heatPort,Tdev1.port) annotation(Line(visible=true, points={{36,-26},{36,-80},{-20,-80}}, color={191,0,0}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-20,-80},{0,-80},{0,-100}}, color={191,0,0}));
            connect(Tdev1.T,IDS0.Tdev) annotation(Line(points={{-40,-80},{-80,-80},{-80,-30},{-53,-30},{-53,-14}}, color={0,0,191}));
            connect(Vsg.V,IDS0.u2) annotation(Line(points={{70,-90},{70,-106},{-82,-106},{-82,-8.4},{-71,-8.4}}, color={0,0,191}));
            connect(IDS0.u3,Vsb.V) annotation(Line(points={{-53,14},{-54,14},{-54,34},{70,34},{70,-24},{74,-24}}, color={0,0,191}));
            connect(Vsg.p,S) annotation(Line(points={{80,-80},{100,-80},{100,-50}}, color={0,0,255}));
            connect(Vsg.n,G) annotation(Line(points={{60,-80},{50,-80},{50,-104},{-100,-104},{-100,-50}}, color={0,0,255}));
            connect(Vsb.n,B) annotation(Line(points={{84,-14},{84,0},{100,0}}, color={0,0,255}));
            connect(Vsb.p,S) annotation(Line(points={{84,-34},{84,-50},{100,-50}}, color={0,0,255}));
            connect(IDS0.y1,y1) annotation(Line(points={{-36.5,-7},{-32,-7},{-32,-30},{26,-30},{26,76},{50,76},{50,110}}, color={0,0,191}));
          end Mpi;

        end Utilities;

      end Spice;

    end Analog;

  end Electrical;

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
      package NandGate "NAND gate built in CMOS logic"
        annotation(preferedView="info", Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-65.85,52.65},{66,22}}, fillColor={0,0,0}, lineThickness=0.5, textString="Analog NAND gate"),Text(lineColor={0,0,255}, extent={{-58,32},{60,0}}, fillColor={0,0,0}, lineThickness=0.5, textString="built in CMOS logic"),Text(lineColor={0,0,255}, extent={{-58,-4},{58,-56}}, fillColor={0,0,0}, lineThickness=0.5, textString="2 PMOS devices"),Text(lineColor={0,0,255}, extent={{-64,22},{70,-34}}, fillColor={0,0,0}, lineThickness=0.5, textString="using 2 NMOS and ")}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-65.85,52.65},{66,22}}, fillColor={0,0,0}, lineThickness=0.5, textString="Analog NAND gate"),Text(lineColor={0,0,255}, extent={{-58,32},{60,0}}, fillColor={0,0,0}, lineThickness=0.5, textString="built in CMOS logic"),Text(lineColor={0,0,255}, extent={{-58,-4},{58,-56}}, fillColor={0,0,0}, lineThickness=0.5, textString="2 PMOS devices"),Text(lineColor={0,0,255}, extent={{-64,22},{70,-34}}, fillColor={0,0,0}, lineThickness=0.5, textString="using 2 NMOS and ")}), Documentation(info="<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v
are both high. In this way the nand functionality is realized.
<p>
The simulation end time should be set to 1e-7. Please plot the input voltages Nand.x1.v,
d Nand.x2.v, and the output voltage Nand.y.v.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>
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
Copyright &copy; 1998-2002, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>
"));
        model Nand "CMOS NAND Gate"
          parameter Integer Level=3 "MOSFET modeling level";
          Modelica.Electrical.Analog.Interfaces.Pin x1 "First input electrical connector" annotation(Placement(transformation(x=-100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin x2 "Second input electrical connector" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin Vdd "High support electrical connector" annotation(Placement(transformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=0.0, y=100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin y "NAND output electrical connector" annotation(Placement(transformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "Thermal connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
          Electrical.Analog.Spice.Mp Mp1(Tnom=300.15, GAMMA=0.35, PHI=0.65, LAMBDA=0.02, TOX=1e-07, NSUB=1e+21, NSS=100000000000000.0, NFS=100000000000000.0, NEFF=5, XJ=1e-06, TPG=1, U0=0.07, UCRIT=1000000.0, UEXP=0.1, UTRA=0.5, DELTA=1, ETA=1, THETA=0.05, ISD=1e-15, ISS=1e-15, JS=1e-08, PB=0.75, MJ=0.5, MJSW=0.33, FC=0.5, CGB0=2e-10, CGD0=4e-11, CGS0=4e-11, RD=10, RS=10, TRD1=0.005, TRD2=0.0005, TRS1=0.005, TRS2=0.0005, GminDC=1e-16, EG=1.11, PD=8e-07, PS=8e-07, EMin=-100, EMax=40, Level=Level, COX=0.000335, ECRIT=0, XQC=0, VMAX=0, KAPPA=0.2, VT0=-1, KP=1.05e-05, W=6.5e-06, L=3.1e-06, LD=2.5e-07, WD=1.25e-06, AD=2e-11, AS=2e-11, CJ=0.0002, CJSW=1e-09) annotation(Placement(transformation(x=20.0, y=70.0, scale=0.1, aspectRatio=1.2, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Spice.Mp Mp2(Tnom=300.15, GAMMA=0.35, PHI=0.65, LAMBDA=0.02, TOX=1e-07, NSUB=1e+21, NSS=100000000000000.0, NFS=100000000000000.0, NEFF=5, XJ=1e-06, TPG=1, U0=0.07, UCRIT=1000000.0, UEXP=0.1, UTRA=0.5, DELTA=1, ETA=1, THETA=0.05, ISD=1e-15, ISS=1e-15, JS=1e-08, PB=0.75, MJ=0.5, MJSW=0.33, FC=0.5, CGB0=2e-10, CGD0=4e-11, CGS0=4e-11, RD=10, RS=10, TRD1=0.005, TRD2=0.0005, TRS1=0.005, TRS2=0.0005, GminDC=1e-16, EG=1.11, PD=8e-07, PS=8e-07, EMin=-100, EMax=40, Level=Level, COX=0.000335, ECRIT=0, XQC=0, VMAX=0, KAPPA=0.2, VT0=-1, KP=1.05e-05, W=6.5e-06, L=3.1e-06, LD=2.5e-07, WD=1.25e-06, AD=2e-11, AS=2e-11, CJ=0.0002, CJSW=1e-09) annotation(Placement(transformation(x=-40.0, y=56.0, scale=0.1, aspectRatio=1.2, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Spice.Mn Mn1(Tnom=300.15, GAMMA=0.35, PHI=0.65, LAMBDA=0.02, TOX=1e-07, NSUB=1e+21, NSS=100000000000000.0, NFS=100000000000000.0, NEFF=5, XJ=1e-06, TPG=1, U0=0.07, UCRIT=1000000.0, UEXP=0.1, UTRA=0.5, DELTA=1, ETA=1, THETA=0.05, ISD=1e-15, ISS=1e-15, JS=1e-08, PB=0.75, MJ=0.5, MJSW=0.33, FC=0.5, CGB0=2e-10, CGD0=4e-11, CGS0=4e-11, RD=10, RS=10, TRD1=0.005, TRD2=0.0005, TRS1=0.005, TRS2=0.0005, GminDC=1e-16, EG=1.11, PD=8e-07, PS=8e-07, EMin=-100, EMax=40, Level=Level, COX=0.000335, ECRIT=0, XQC=0, VMAX=0, KAPPA=0.2, KP=4.1e-05, VT0=0.8, W=6.5e-06, L=3.1e-06, LD=2.5e-07, WD=1.25e-06, AD=2e-11, AS=2e-11, CJ=0.0002, CJSW=1e-09) annotation(Placement(transformation(x=20.0, y=26.0, scale=0.1, aspectRatio=1.2, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Spice.Mn Mn2(Tnom=300.15, GAMMA=0.35, PHI=0.65, LAMBDA=0.02, TOX=1e-07, NSUB=1e+21, NSS=100000000000000.0, NFS=100000000000000.0, NEFF=5, XJ=1e-06, TPG=1, U0=0.07, UCRIT=1000000.0, UEXP=0.1, UTRA=0.5, DELTA=1, ETA=1, THETA=0.05, ISD=1e-15, ISS=1e-15, JS=1e-08, PB=0.75, MJ=0.5, MJSW=0.33, FC=0.5, CGB0=2e-10, CGD0=4e-11, CGS0=4e-11, RD=10, RS=10, TRD1=0.005, TRD2=0.0005, TRS1=0.005, TRS2=0.0005, GminDC=1e-16, EG=1.11, PD=8e-07, PS=8e-07, EMin=-100, EMax=40, Level=Level, COX=0.000335, ECRIT=0, XQC=0, VMAX=0, KAPPA=0.2, KP=4.1e-05, VT0=0.8, W=6.5e-06, L=3.1e-06, LD=2.5e-07, WD=1.25e-06, AD=2e-11, AS=2e-11, CJ=0.0002, CJSW=1e-09) annotation(Placement(transformation(x=20.0, y=-16.0, scale=0.1, aspectRatio=1.2, flipHorizontal=false, flipVertical=false)));
          annotation(Icon(coordinateSystem(), graphics={Line(points={{-90,-50},{-70,-50},{-70,-12},{-42,-12}}, color={0,0,255}),Line(points={{-90,50},{-70,50},{-70,14},{-42,14}}, color={0,0,255}),Ellipse(extent={{54,6},{65,-5}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(points={{65,0},{91,0}}, color={0,0,255}),Ellipse(extent={{-6,32},{54,-32}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Rectangle(lineColor={0,0,255}, extent={{25,33},{-30,-37}}, fillPattern=FillPattern.Solid, fillColor={255,255,255}),Rectangle(extent={{-42,32},{26,-32}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Rectangle(lineColor={0,0,255}, extent={{25,31.5},{27,-31}}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(lineColor={0,0,255}, extent={{24.5,31},{26.5,-31.5}}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(color={0,0,255}, points={{0,90.5},{0,32}}),Line(points={{0,-32},{0,-90}}, color={191,0,0})}), Diagram(coordinateSystem(), graphics={Ellipse(extent={{-2,2},{2,-2}}, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{28,52},{32,48}}, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid)}), Documentation(info="<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>
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
Copyright &copy; 1998-2002, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
<font color=red>The circuit was slightly modified by Alfonso Urquía of the Universidad Nacional de Educación a Distancia in Madrid from the original circuit proposed by Clau&szlig; and Schneider.  Alfonso tied the bulk of the two p-channel MOSFETs to the high voltage (<b>Vdd</b>) instead of the ground, as the original circuit wouldn't simulate correctly for any modeling levels higher than 0.</font>
<p>
</html>
"));
          Electrical.Analog.Basic.Ground Gnd1 annotation(Placement(transformation(x=50.0, y=-22.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Basic.Ground Gnd2 annotation(Placement(transformation(x=60.0, y=4.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Basic.Ground Gnd3 annotation(Placement(transformation(x=60.0, y=-76.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Basic.Ground Gnd4 annotation(Placement(transformation(x=40.0, y=20.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Spice.C C4(Tnom=300.15, C=4e-14, TC1=0, TC2=0, Area=1) annotation(Placement(visible=true, transformation(x=60, y=30, scale=0.1, rotation=-90)));
          Electrical.Analog.Spice.C C7(Tnom=300.15, C=4e-14, TC1=0, TC2=0, Area=1) annotation(Placement(visible=true, transformation(x=60, y=-50, scale=0.1, rotation=-90)));
        equation 
          connect(C7.heatPort,heatPort) annotation(Line(visible=true, points={{50,-50},{0,-50},{0,-100}}, color={191,0,0}));
          connect(C7.n,Gnd3.p) annotation(Line(visible=true, points={{60,-60},{60,-70}}, color={0,0,255}));
          connect(C7.p,Mn2.D) annotation(Line(visible=true, points={{60,-40},{60,-10},{30,-10}}, color={0,0,255}));
          connect(Mp1.S,C4.p) annotation(Line(visible=true, points={{30,64},{30,50},{60,50},{60,40}}, color={0,0,255}));
          connect(C4.heatPort,heatPort) annotation(Line(visible=true, points={{50,30},{50,0},{0,0},{0,-100}}, color={191,0,0}));
          connect(C4.n,Gnd2.p) annotation(Line(visible=true, points={{60,20},{60,10}}, color={0,0,255}));
          connect(C4.p,y) annotation(Line(visible=true, points={{60,40},{60,50},{80,50},{80,0},{100,0}}, color={0,0,255}));
          connect(Mp1.D,Vdd) annotation(Line(points={{30,76},{30,88},{0,88},{0,100}}, color={0,0,255}));
          connect(Mp2.D,Vdd) annotation(Line(points={{-30,62},{-30,88},{0,88},{0,100}}, color={0,0,255}));
          connect(Mp2.G,x1) annotation(Line(points={{-50,50},{-100,50}}, color={0,0,255}));
          connect(Mp1.G,Mn1.G) annotation(Line(points={{10,64},{10,20}}, color={0,0,255}));
          connect(Mn1.S,Mn2.D) annotation(Line(points={{30,20},{30,-10}}, color={0,0,255}));
          connect(Mn1.G,x2) annotation(Line(points={{10,20},{-70,20},{-70,-50},{-100,-50}}, color={0,0,255}));
          connect(Mp2.G,Mn2.G) annotation(Line(points={{-50,50},{-50,-22},{10,-22}}, color={0,0,255}));
          connect(Mn2.B,Gnd1.p) annotation(Line(points={{30,-16},{50,-16}}, color={0,0,255}));
          connect(Mn2.S,Gnd1.p) annotation(Line(points={{30,-22},{40,-22},{40,-16},{50,-16}}, color={0,0,255}));
          connect(Gnd4.p,Mn1.B) annotation(Line(points={{40,26},{30,26}}, color={0,0,255}));
          connect(Mp1.B,Mp1.D) annotation(Line(points={{30,70},{30,76}}, color={0,0,255}));
          connect(Mn2.heatPort,heatPort) annotation(Line(points={{20,-28},{0,-28},{0,-100}}, color={191,0,0}));
          connect(Mn1.heatPort,heatPort) annotation(Line(points={{20,14},{0,14},{0,-100}}, color={191,0,0}));
          connect(Mp1.heatPort,heatPort) annotation(Line(points={{20,58},{0,58},{0,-100}}, color={191,0,0}));
          connect(Mp2.heatPort,heatPort) annotation(Line(points={{-40,44},{-40,0},{0,0},{0,-100}}, color={191,0,0}));
          connect(Mp1.S,Mn1.D) annotation(Line(points={{30,64},{30,32}}, color={0,0,255}));
          connect(Mp2.B,Mp2.D) annotation(Line(points={{-30,56},{-30,62}}, color={0,0,255}));
          connect(Mp1.S,Mp2.S) annotation(Line(points={{30,64},{30,50},{-30,50}}, color={0,0,255}));
        end Nand;

        model TestNand "Test circuit to evaluate performance of NAND gate"
          parameter Integer Level=3 "MOSFET modeling level";
          output Modelica.SIunits.Voltage vA "First input voltage";
          output Modelica.SIunits.Voltage vB "Second input voltage";
          output Modelica.SIunits.Voltage vNAND "Output voltage";
          output Modelica.SIunits.HeatFlowRate Pth "Total heat dissipated by NAND gate";
          annotation(Diagram, Documentation(info="<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v
are both high. In this way the nand functionality is realized.
<p>
The simulation end time should be set to 1e-7. Please plot the input voltages Nand.x1.v,
d Nand.x2.v, and the output voltage Nand.y.v.
<p>
Repeat the simulation using all five levels of MOSFET modeling currently available: <p>

<pre>
 <font color=red><b>Level:   MOSFET modeling level (default value = 3)
            Level=0: Static injection model
            Level=1: Shichman-Hodges model
            Level=2: Grove-Frohman model
            Level=3: Empirical model
            Level=4: Simplified Grove-Frohman model</b></font>
</pre>
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>
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
Copyright &copy; 1998-2002, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,-50},{-70,-50},{-70,-12},{-42,-12}}, color={0,0,255}),Line(points={{-90,50},{-70,50},{-70,14},{-42,14}}, color={0,0,255}),Ellipse(extent={{54,6},{65,-5}}, lineColor={0,0,255}),Line(points={{65,0},{91,0}}, color={0,0,255}),Ellipse(extent={{-6,32},{54,-32}}, lineColor={0,0,255}),Rectangle(lineColor={0,0,255}, extent={{25,33},{-30,-37}}, fillPattern=FillPattern.Solid, fillColor={255,255,255}),Rectangle(extent={{-42,32},{26,-32}}, lineColor={0,0,255}),Rectangle(lineColor={0,0,255}, extent={{25,31.5},{27,-31}}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Rectangle(lineColor={0,0,255}, extent={{24.5,31},{26.5,-31.5}}, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), experiment(StopTime=1e-07), experimentSetupOutput);
          Electrical.Analog.Sources.RampVoltage VDD(V=5, offset=0, startTime=0, duration=1e-09) annotation(Placement(transformation(x=50.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
          Electrical.Analog.Basic.Ground Gnd4 annotation(Placement(transformation(x=-60.0, y=-26.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Sources.TrapezoidVoltage VIN2(V=3.5, rising=1e-09, width=1.9e-08, falling=1e-09, period=4e-08, nperiod=-1, offset=0, startTime=1e-08) annotation(Placement(transformation(x=-40.0, y=-30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
          Electrical.Analog.Basic.Ground Gnd5 annotation(Placement(transformation(x=-40.0, y=-56.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Basic.Ground Gnd1 annotation(Placement(transformation(x=50.0, y=24.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Electrical.Analog.Sensors.VoltageSensor Vnand annotation(Placement(transformation(x=80.0, y=-20.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
          Electrical.Analog.Basic.Ground Gnd2 annotation(Placement(transformation(x=80.0, y=-46.0, scale=0.06, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Sensors.HeatFlowSensor Qtot annotation(Placement(transformation(x=20.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Sources.FixedTemperature FixedTemperature1(T=300.15) annotation(Placement(transformation(x=50.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          Electrical.Analog.Sources.TrapezoidVoltage VIN1(V=3.5, rising=1e-09, width=1.9e-08, falling=1e-09, period=4e-08, nperiod=-1, offset=0, startTime=2e-08) annotation(Placement(visible=true, transformation(x=-60, y=6.66134e-16, scale=0.1, rotation=-90)));
          Nand Nand1(Level=Level) annotation(Placement(visible=true, transformation(x=0, y=0, scale=0.2)));
        equation 
          connect(Qtot.port_a,Nand1.heatPort) annotation(Line(visible=true, points={{9,-70},{0,-70},{0,-20}}, color={191,0,0}));
          connect(Vnand.p,Nand1.y) annotation(Line(visible=true, points={{80,-10},{80,0},{20,0}}, color={0,0,255}));
          connect(VDD.p,Nand1.Vdd) annotation(Line(visible=true, points={{50,40},{50,70},{0,70},{0,20}}, color={0,0,255}));
          connect(VIN2.p,Nand1.x2) annotation(Line(visible=true, points={{-40,-40},{-40,-10},{-20,-10}}, color={0,0,255}));
          connect(VIN1.p,Nand1.x1) annotation(Line(visible=true, points={{-60,10},{-20,10}}, color={0,0,255}));
          connect(VIN1.n,Gnd4.p) annotation(Line(visible=true, points={{-60,-10},{-60,-20}}, color={0,0,255}));
          vA=VIN1.v;
          vB=VIN2.v;
          vNAND=Vnand.v;
          Pth=Qtot.Q_flow;
          connect(VIN2.n,Gnd5.p) annotation(Line(points={{-40,-40},{-40,-50}}, color={0,0,255}));
          connect(VDD.n,Gnd1.p) annotation(Line(points={{50,40},{50,30}}, color={0,0,255}));
          connect(Vnand.n,Gnd2.p) annotation(Line(points={{80,-30},{80,-40}}, color={0,0,255}));
          connect(Qtot.port_b,FixedTemperature1.port) annotation(Line(points={{31,-70},{39,-70}}, color={191,0,0}));
        end TestNand;

      end NandGate;

    end ModelicaSpice;

  end Examples;

end BondLib;




model BondLib_Examples_ModelicaSpice_NandGate_TestNand
  extends BondLib.Examples.ModelicaSpice.NandGate.TestNand;
end BondLib_Examples_ModelicaSpice_NandGate_TestNand;



