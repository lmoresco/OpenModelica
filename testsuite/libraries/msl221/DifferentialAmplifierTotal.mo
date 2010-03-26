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
    type Time= Real(final quantity="Time", final unit="s");
    type Velocity= Real(final quantity="Velocity", final unit="m/s");
    type Acceleration= Real(final quantity="Acceleration", final unit="m/s2");
    type Frequency= Real(final quantity="Frequency", final unit="Hz");
    type ThermodynamicTemperature= Real(final quantity="ThermodynamicTemperature", final unit="K", min=0, displayUnit="degC");
    type Temperature= ThermodynamicTemperature;
    type HeatFlowRate= Real(final quantity="Power", final unit="W");
    type Entropy= Real(final quantity="Entropy", final unit="J/K");
    type ElectricCurrent= Real(final quantity="ElectricCurrent", final unit="A");
    type Current= ElectricCurrent;
    type ElectricCharge= Real(final quantity="ElectricCharge", final unit="C");
    type ElectricPotential= Real(final quantity="ElectricPotential", final unit="V");
    type Voltage= ElectricPotential;
    type Capacitance= Real(final quantity="Capacitance", final unit="F", min=0);
    type Resistance= Real(final quantity="Resistance", final unit="Ohm");
    type Conductance= Real(final quantity="Conductance", final unit="S");
    type Transconductance= Real(final quantity="Transconductance", final unit="A/(V*V)");
    type InversePotential= Real(final quantity="InversePotential", final unit="1/V");
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

    package Utilities "Utility models of Spice circuit element models"
      annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used within the Spice-style circuit element models.
</html>
"));
      function JFETeq1 "Computation of injected drain-source current for Level = 1"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VT0 "Threshold voltage at reference temperature";
        input Modelica.SIunits.Transconductance BETA "Transconductance parameter at reference temperature";
        input Modelica.SIunits.InversePotential LAMBDA "Channel length modulation";
        input Real TCV(unit="V/K") "Linear temperature coefficient of threshold voltage";
        input Real BEX "Mobility temperature exponent";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
      protected 
        Modelica.SIunits.Temperature DTemp "Temperature difference";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage VT0val "Threshold voltage at device temperature";
        Modelica.SIunits.Transconductance BETAval "Transconductance at device temperature";
        Modelica.SIunits.Transconductance Beta "Adjusted transconductance at device temperature";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Modelica.SIunits.Voltage Vgst "vgs - VT0";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-48,8},{20,-20}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-50,-18},{24,-40}}, fillColor={191,0,0}, textString="Level = 1")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-48,8},{20,-20}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-50,-18},{24,-40}}, fillColor={191,0,0}, textString="Level = 1")}), Documentation(info="<html>
This function implements a Spice-style <b>Level-1</b> model of the current flowing between drain and source of a JFET. <p>

The model comments the equations by providing the corresponding equation numbers from [1]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Tnom:    Reference temperature (default value = 300.15 K)

 VT0:     Threshold voltage at reference temperature (default value = 0 Volt)

 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 LAMBDA:  Channel length modulation (default value = 0 1/Volt)

 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K)

 BEX:     Mobility temperature exponent (default value = 0)


Output variables:

 isd0:    Drain-source current (Amp)

 vdsat:   Saturation voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
      algorithm 
        DTemp:=Tdev - Tnom;
        RTemp:=Tdev/Tnom;
        VT0val:=VT0 - TCV*DTemp;
        BETAval:=BETA*RTemp^BEX;
        Vgst:=vgs - VT0val;
        vdsat:=if Vgst > 0 then Vgst else 0;
        Beta:=BETAval*(1 + LAMBDA*vds);
        cdlin:=vds*(2*Vgst - vds);
        cdsat:=Vgst*Vgst;
        ids0:=sig*Beta*(if Vgst > 0 and vds <= vdsat then cdlin else if Vgst > 0 and vds > vdsat then cdsat else 0);
      end JFETeq1;

      function JFETeq2 "Computation of injected drain-source current for Level = 2"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VT0 "Threshold voltage at reference temperature";
        input Modelica.SIunits.Transconductance BETA "Transconductance parameter at reference temperature";
        input Modelica.SIunits.InversePotential LAMBDA "Channel length modulation";
        input Real TCV(unit="V/K") "Linear temperature coefficient of threshold voltage";
        input Real BEX "Mobility temperature exponent";
        input Modelica.SIunits.InversePotential LAM1 "Channel length modulation gate voltage parameter";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
      protected 
        Modelica.SIunits.Temperature DTemp "Temperature difference";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage VT0val "Threshold voltage at device temperature";
        Modelica.SIunits.Transconductance Beta "Adjusted transconductance at device temperature";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Modelica.SIunits.Voltage Vgst "vgs - VT0";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-48,8},{20,-20}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-50,-18},{24,-40}}, fillColor={191,0,0}, textString="Level = 2")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-48,8},{20,-20}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-92,36},{72,-4}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-62,50},{38,22}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-50,-18},{24,-40}}, fillColor={191,0,0}, textString="Level = 2")}), Documentation(info="<html>
This function implements a Spice-style <b>Level-2</b> model of the current flowing between drain and source of a JFET. <p>

The model comments the equations by providing the corresponding equation numbers from [1]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Tnom:    Reference temperature (default value = 300.15 K)

 VT0:     Threshold voltage at reference temperature (default value = 0 Volt)

 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 LAMBDA:  Channel length modulation (default value = 0 1/Volt)

 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K)

 BEX:     Mobility temperature exponent (default value = 0)

 LAM1:    Channel length modulation gate voltage parameter (default value = 0 1/Volt)


Output variables:

 isd0:    Drain-source current (Amp)

 vdsat:   Saturation voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
      algorithm 
        DTemp:=Tdev - Tnom;
        RTemp:=Tdev/Tnom;
        VT0val:=VT0 - TCV*DTemp;
        Beta:=BETA*RTemp^BEX;
        Vgst:=vgs - VT0val;
        vdsat:=if Vgst > 0 then Vgst else 0;
        cdlin:=vds*(2*Vgst - vds);
        cdsat:=Vgst*Vgst*(if vgs >= 0 then 1 + LAMBDA*(vds - Vgst)*(1 + LAM1*vgs) else 1 - LAMBDA*(vds - Vgst)*Vgst/VT0val);
        ids0:=sig*Beta*(if Vgst > 0 and vds <= vdsat then cdlin else if Vgst > 0 and vds > vdsat then cdsat else 0);
      end JFETeq2;

      function JFETeq3 "Computation of injected drain-source current of GaAs MESFET (Level = 3 JFET)"
        input Modelica.SIunits.Voltage vds "Drain-source voltage";
        input Modelica.SIunits.Voltage vgs "Gate-source voltage";
        input Modelica.SIunits.Temperature Tdev "Device temperature";
        input Real sig "sign(vds)";
        input Modelica.SIunits.Temperature Tnom "Reference temperature";
        input Modelica.SIunits.Voltage VT0 "Threshold voltage at reference temperature";
        input Modelica.SIunits.Transconductance BETA "Transconductance parameter at reference temperature";
        input Modelica.SIunits.InversePotential LAMBDA "Channel length modulation";
        input Real TCV(unit="V/K") "Linear temperature coefficient of threshold voltage";
        input Real BEX "Mobility temperature exponent";
        input Modelica.SIunits.InversePotential ALPHA "Hyperbolic tangient fitting parameter";
        input Modelica.SIunits.InversePotential B "Measure of doping profile";
        output Modelica.SIunits.Current ids0 "Injected drain-source current";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
      protected 
        Modelica.SIunits.Temperature DTemp "Temperature difference";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage VT0val "Threshold voltage at device temperature";
        Modelica.SIunits.Transconductance BETAval "Transconductance at device temperature";
        Modelica.SIunits.Transconductance Beta "Adjusted transconductance at device temperature";
        Real cdlin(unit="V2") "Linear region current factor";
        Real cdsat(unit="V2") "Saturation region current factor";
        Modelica.SIunits.Voltage Vgst "vgs - VT0";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-50,18},{18,-10}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-96,48},{68,8}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-68,62},{32,34}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-52,-8},{22,-30}}, fillColor={191,0,0}, textString="Level = 3"),Text(lineColor={0,0,255}, extent={{-70,-30},{40,-62}}, fillColor={0,191,0}, textString="(GaAs MESFET)")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{20,100},{100,0},{20,-100},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,191,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-50,18},{18,-10}}, fillColor={0,191,0}, textString="of a JFET"),Text(lineColor={0,0,255}, extent={{-96,48},{68,8}}, textString="between drain and source", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-68,62},{32,34}}, textString="Injected current", fillColor={0,191,0}),Text(lineColor={0,0,255}, extent={{-52,-8},{22,-30}}, fillColor={191,0,0}, textString="Level = 3"),Text(lineColor={0,0,255}, extent={{-70,-30},{40,-62}}, fillColor={0,191,0}, textString="(GaAs MESFET)")}), Documentation(info="<html>
This function implements a Spice-style <b>Level-3</b> model of the current flowing between drain and source of a JFET.  The <b>Level-3</b> model of the JFET describes one type of a GaAs MESFET device.  The theory behind the model is that proposed by Statz, <i>et al</i> [1]. <p>

The model comments the equations by providing the corresponding equation numbers from [2]. <p>

<hr> <p>

<pre>
Input variables:

 vds:     Drain-source voltage (Volt)

 vgs:     Gate-source voltage (Volt)

 Tdev:    Device temperature (K)

 sig:     Indicator of operating mode
            sig = +1:  direct mode
            sig = -1:  reverse mode (source and drain are flipped)


Input parameters:

 Tnom:    Reference temperature (default value = 300.15 K)

 VT0:     Threshold voltage at reference temperature (default value = 0 Volt)

 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)

 LAMBDA:  Channel length modulation (default value = 0 1/Volt)

 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K)

 BEX:     Mobility temperature exponent (default value = 0)

 ALPHA:   Hyperbolic tangient fitting parameter (default value = 1)

 B:       Measure of doping profile (default value = 0 1/Volt)


Output variables:

 isd0:    Drain-source current (Amp)

 vdsat:   Saturation voltage (Volt)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
      algorithm 
        DTemp:=Tdev - Tnom;
        RTemp:=Tdev/Tnom;
        VT0val:=VT0 - TCV*DTemp;
        BETAval:=BETA*RTemp^BEX;
        Vgst:=vgs - VT0val;
        vdsat:=if Vgst > 0 then Vgst else 0;
        Beta:=BETAval*(1 + LAMBDA*vds);
        cdsat:=Vgst*Vgst/(1 + B*Vgst);
        cdlin:=cdsat*(1 - (1 - ALPHA*vds/3)^3);
        ids0:=sig*Beta*(if Vgst > 0 and vds <= 3/ALPHA then cdlin else if Vgst > 0 and vds > 3/ALPHA then cdsat else 0);
      end JFETeq3;

      block nlCJ "Non-linear capacitance computation of JFET and GaAs MESFET"
        extends Modelica.Blocks.Interfaces.SI2SO;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VT0=0 "Threshold voltage at reference temperature";
        parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of threshold voltage";
        parameter Modelica.SIunits.Current IS=1e-14 "Transport saturation current";
        parameter Modelica.SIunits.Voltage EG=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K";
        parameter Real N=1 "Current emission coefficient";
        parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent";
        parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
        parameter Modelica.SIunits.Capacitance CGS=5e-13 "Zero-bias gate-source depletion capacitance at reference temperature";
        parameter Modelica.SIunits.Capacitance CGD=5e-13 "Zero-bias gate-drain depletion capacitance at reference temperature";
        parameter Real M=if Level == 3 then 0.5 else 0.33 "Junction grading coefficient";
        parameter Real FC=0.5 "Factor for linearization of depletion capacitance formula";
        parameter Modelica.SIunits.Time TT=5e-09 "Ideal transit time";
        parameter Modelica.SIunits.InversePotential ALPHA=1 "Hyperbolic tangient fitting parameter";
        parameter Modelica.SIunits.Voltage DELTA=0.2 "Voltage range for transition";
        parameter Modelica.SIunits.Voltage VMAX=0.5 "Limit voltage for carrier velocity saturation";
        parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
        parameter Real Area=1 "Relative area occupied by capacitor";
        parameter Boolean GS=true "True if gate-source junction";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
        output Modelica.SIunits.Voltage vgs "Gate-source voltage";
        output Modelica.SIunits.Voltage vgd "Gate-drain voltage";
        output Modelica.SIunits.Voltage v "Diode voltage";
        output Modelica.SIunits.Capacitance Cval "Diode capacitance";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-78,68},{76,-60}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-88,-42},{92,-74}}, fillColor={0,0,0}, textString="JFET / GaAs MESFET")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-78,68},{76,-60}}, textString="nl C", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-88,-42},{92,-74}}, fillColor={0,0,0}, textString="JFET / GaAs MESFET")}));
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=0, y=-120, scale=0.2, rotation=-270)));
      protected 
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Modelica.SIunits.Temperature DTemp "Difference between circuit temperature and reference temperature";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage VT0val "Threshold voltage at device temperature";
        Modelica.SIunits.Voltage EGval "Energy gap at device temperature";
        Modelica.SIunits.Voltage EGnom "Energy gap at reference temperature";
        Modelica.SIunits.Voltage PBval "Built-in potential at device temperature";
        Modelica.SIunits.Capacitance CGSval "Zero-bias gate-source depletion capacitance at device temperature";
        Modelica.SIunits.Capacitance CGDval "Zero-bias gate-drain depletion capacitance at device temperature";
        Modelica.SIunits.Capacitance CJval "Zero-bias depletion capacitance at device temperature";
        Modelica.SIunits.Current ISval "Saturation current at device temperature";
        Modelica.SIunits.Capacitance Cdiff "Diffusion capacitance";
        Modelica.SIunits.Capacitance Cdepl "Depletion capacitance";
        Real et;
        Modelica.SIunits.Voltage Vfac1;
        Modelica.SIunits.Voltage Vfac2;
        Modelica.SIunits.Voltage Ve;
        Modelica.SIunits.Voltage Vn;
        Modelica.SIunits.Voltage VNval;
        Real sig2;
        Real Cfac1;
        Real Cfac2;
        Real Cfac3;
      equation 
        vgs=u1;
        vgd=u2;
        v=if GS then vgs else vgd;
        Vt=k*Tdev/q;
        et=v/(N*Vt);
        DTemp=Tdev - Tnom;
        RTemp=Tdev/Tnom;
        VT0val=VT0 - TCV*DTemp;
        EGval=EG - GapC1*Tdev*Tdev/(Tdev + GapC2);
        EGnom=EG - GapC1*Tnom*Tnom/(Tnom + GapC2);
        PBval=PB*RTemp + EGval - EGnom*RTemp - 3*Vt*log(RTemp);
        CGSval=CGS*(1 + M*(1 - PBval/PB + 0.0004*DTemp));
        CGDval=CGD*(1 + M*(1 - PBval/PB + 0.0004*DTemp));
        CJval=if GS then CGSval else CGDval;
        ISval=IS*exp((RTemp - 1)*EGval/Vt + XTI*log(RTemp));
        if Level == 1 or Level == 2 then
          Cdiff=Area*TT*(GminDC + ISval/(N*Vt)*(if et < EMin then ExMin*(et - EMin + 1) else if et > EMax then ExMax*(et - EMax + 1) else exp(et)));
          Vfac1=0;
          Vfac2=0;
          Ve=0;
          Vn=0;
          VNval=0;
          sig2=0;
          Cfac1=0;
          Cfac2=0;
          Cfac3=0;
          Cdepl=Area*CJval*(if v > FC*PBval then (1 - FC*(1 + M) + M*v/PBval)/(1 - FC)^(1 + M) else 1/noEvent(abs(1 - v/PBval)^M));
          Cval=Cdiff + Cdepl;

        else
          Cdiff=0;
          Vfac1=sqrt((Ve - VT0val)^2 + DELTA^2);
          Vfac2=sqrt((vgs - vgd)^2 + (1/ALPHA)^2);
          Ve=0.5*(vgs + vgd + Vfac2);
          Vn=0.5*(Ve + VT0val + Vfac1);
          VNval=if Vn <= VMAX then Vn else VMAX;
          sig2=if GS then 1 else -1;
          Cfac1=0.5*(1 + (Ve - VT0val)/Vfac1);
          Cfac2=0.5*(1 + sig2*(vgs - vgd)/Vfac2);
          Cfac3=0.5*(1 - sig2*(vgs - vgd)/Vfac2);
          Cdepl=Area*(CGSval*Cfac1*Cfac2/sqrt(1 - Vn/PBval) + CGDval*Cfac3);
          Cval=Cdiff + Cdepl;
        end if;
        y=Cval;
      end nlCJ;

      block IDS1 "Injected current between drain and source of a JFET"
        extends Modelica.Blocks.Interfaces.SI2SO;
        parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
        parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
        parameter Modelica.SIunits.Voltage VT0=0 "Threshold voltage at reference temperature";
        parameter Modelica.SIunits.Transconductance BETA=0 "Transconductance parameter at reference temperature";
        parameter Modelica.SIunits.InversePotential LAMBDA=0 "Channel length modulation";
        parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of threshold voltage";
        parameter Real BEX=0 "Mobility temperature exponent";
        parameter Modelica.SIunits.InversePotential LAM1=0 "Channel length modulation gate voltage parameter";
        parameter Modelica.SIunits.InversePotential ALPHA=1 "Hyperbolic tangient fitting parameter";
        parameter Modelica.SIunits.InversePotential B=0 "Measure of doping profile";
        output Modelica.SIunits.Voltage vds "Drain-source voltage";
        output Modelica.SIunits.Voltage vgs "Gate-source voltage";
        output Modelica.SIunits.Current ids "Injected drain-source current";
        output Modelica.SIunits.Voltage vdsat "Saturation voltage";
        Modelica.Blocks.Interfaces.RealInput Tdev(redeclare type SignalType= Modelica.SIunits.Temperature ) "Device temperature" annotation(Placement(visible=true, transformation(x=0, y=-110, scale=0.1, rotation=-270), iconTransformation(x=0, y=-110, scale=0.1, rotation=-270)));
      protected 
        Real sig "sign(vds)";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-52,42},{48,14}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-82,26},{82,-14}}, fillColor={0,0,255}, textString="between drain and source"),Text(lineColor={0,0,255}, extent={{-68,-2},{62,-32}}, fillColor={0,0,255}, textString="of a JFET / MESFET"),Text(lineColor={0,0,255}, extent={{-96,66},{-76,54}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{-96,-54},{-76,-66}}, fillColor={0,0,255}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-10,-76},{10,-88}}, fillColor={0,0,255}, textString="Tdev")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,191}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-52,42},{48,14}}, fillColor={0,0,255}, textString="Injected current"),Text(lineColor={0,0,255}, extent={{-96,66},{-76,54}}, fillColor={0,0,255}, textString="vds"),Text(lineColor={0,0,255}, extent={{-82,26},{82,-14}}, fillColor={0,0,255}, textString="between drain and source"),Text(lineColor={0,0,255}, extent={{-68,-2},{62,-32}}, fillColor={0,0,255}, textString="of a JFET / MESFET"),Text(lineColor={0,0,255}, extent={{-96,-54},{-76,-66}}, fillColor={0,0,255}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-10,-76},{10,-88}}, fillColor={0,0,255}, textString="Tdev")}), Documentation(info="<html>
The <b>IDS1</b> block computes the drain-source current of JFETs and GaAs MESFETs.  Depending on the modeling level, a different algorithm is being used.  The equations for each of these algorithms are programmed in functions, called <b>JFETeq1</b> .. <b>JFETeq3</b> that implement the particular model in question.  These functions have been carefully documented to make it easier on future developers to add additional models of their own by providing corresponding <b>JFETeq_i</b> functions. <p>

<hr> <p>

<pre>
Parameters:

 <font color=red><b>Level:   JFET modeling level (default value = 1)
            Level=1: Shichman-Hodges (Si) JFET model
            Level=2: Improved Shichman-Hodges (Si) JFET model [1]
            Level=3: Statz-Curtice (GaAs) MESFET model [2,3]<b></font>

 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 1-3</font>

 VT0:     Threshold voltage at reference temperature (default value = 0 Volt) <font color=red>Levels 1-3</font>

 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>) <font color=red>Levels 1-3</font>

 LAMBDA:  Channel length modulation (default value = 0 1/Volt) <font color=red>Levels 1-3</font>

 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K) <font color=red>Levels 1-3</font>

 BEX:     Mobility temperature exponent (default value = 0) <font color=red>Levels 1-3</font>

 LAM1:    Channel length modulation gate voltage parameter (default value = 0 1/Volt) <font color=red>Level 2</font>

 ALPHA:   Hyperbolic tangient fitting parameter (default value = 1) <font color=red>Level 3</font>

 B:       Measure of doping profile (default value = 0 1/Volt) <font color=red>Level 3</font>
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"));
      equation 
        if noEvent(u1 > 0) then
          sig=1;
          vds=u1;
          vgs=u2;

        else
          sig=-1;
          vds=-u1;
          vgs=u2 - u1;
        end if;
        if Level == 0 or Level == 1 then
          (ids,vdsat)=JFETeq1(vds=vds, vgs=vgs, Tdev=Tdev, sig=sig, Tnom=Tnom, VT0=VT0, BETA=BETA, LAMBDA=LAMBDA, TCV=TCV, BEX=BEX);

        elseif Level == 2 then
          (ids,vdsat)=JFETeq2(vds=vds, vgs=vgs, Tdev=Tdev, sig=sig, Tnom=Tnom, VT0=VT0, BETA=BETA, LAMBDA=LAMBDA, TCV=TCV, BEX=BEX, LAM1=LAM1);


        elseif Level == 3 then
          (ids,vdsat)=JFETeq3(vds=vds, vgs=vgs, Tdev=Tdev, sig=sig, Tnom=Tnom, VT0=VT0, BETA=BETA, LAMBDA=LAMBDA, TCV=TCV, BEX=BEX, ALPHA=ALPHA, B=B);


        else
        end if;
        y=ids;
      end IDS1;

      model DjJ "Spice-style junction diode model for JFETs"
        extends Interfaces.SpiceTwoPort;
        constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
        constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
        constant Real GapC1(unit="V/K")=0.000702 "First bandgap correction factor Silicon";
        constant Modelica.SIunits.Temperature GapC2=1108.0 "Second bandgap correction factor Silicon";
        parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
        parameter Modelica.SIunits.Current IS=1e-14 "Saturation current at reference temperature";
        parameter Modelica.SIunits.Voltage EG=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K";
        parameter Real N=1 "Current emission coefficient";
        parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent";
        parameter Real Area=1 "Relative area occupied by diode";
        parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
        parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
      protected 
        parameter Real ExMin=exp(EMin);
        parameter Real ExMax=exp(EMax);
        Modelica.SIunits.Voltage Vt "Thermal voltage";
        Real RTemp "Temperature quotient";
        Modelica.SIunits.Voltage EGval "Activation energy at device temperature";
        Modelica.SIunits.Current ISval "Saturation current at device temperature";
        Real et;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-84,76},{26,-82}}, fillColor={0,0,0}, textString="DjJ")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{4,82},{14,72}}, fillColor={128,128,128}, textString="f"),Text(lineColor={0,0,255}, extent={{70,-4},{80,-14}}, fillColor={128,128,128}, textString="e"),Line(points={{-80,-4},{-28,-4},{-6,-2},{0,0}}, color={0,0,0}, thickness=0.5),Text(lineColor={0,0,255}, extent={{-66,-6},{-36,-14}}, fillColor={128,128,128}, textString="blocking"),Text(lineColor={0,0,255}, extent={{16,50},{48,42}}, fillColor={128,128,128}, textString="conducting"),Line(points={{0,0},{6,10},{12,28},{16,66}}, color={0,0,0}, thickness=0.5)}), Documentation(info="<html>
The Spice-style JFET junction diode is a regular exponential diode. <p>

<hr>

<pre>
Parameters:

 <font color=red><b>Level:  JFET modeling level (default value = 1)
           Level=1: Shichman-Hodges (Si) JFET model
           Level=2: Improved Shichman-Hodges (Si) JFET model [1]
           Level=3: Statz-Curtice (GaAs) MESFET model [2,3]<b></font>

 IS:     Transport saturation current (default value = 1e-14 Amp)

 EG:     Energy gap for temperature effect on saturation current at 0 K
           <font color=blue><b>default value = 1.11 Volt for Levels=1,2 (Si)
           default value = 0.73 Volt for Level=3 (GaAs)</b></font>

 N:      Current emission coefficient (default value = 1)

 XTI:    Saturation current temperature exponent
           <font color=blue><b>default value = 3 for Levels=1,2 (Si)
           default value = 2 for Level=3 (GaAs)</b></font>

 Area:   Relative area occupied by the diode (default value = 1)

 EMin:   if x &lt; EMin, the exp(x) function is linearized (default value = -100)

 EMax:   if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"));
      equation 
        Vt=k*e2/q;
        et=e1/(N*Vt);
        RTemp=e2/Tnom;
        EGval=EG - GapC1*e2*e2/(e2 + GapC2);
        ISval=IS*exp((RTemp - 1)*EGval/Vt + XTI*log(RTemp));
        f1=ISval*Area*(if noEvent(et < EMin) then ExMin*(et - EMin + 1) - 1 else if noEvent(et > EMax) then ExMax*(et - EMax + 1) - 1 else exp(et) - 1);
        e2*f2=e1*f1;
      end DjJ;

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

        end Interfaces;

        package RampingSources "Sources with ramping for Spice"
          annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
Complex semiconductor circuits with realistic device parameters cannot be simulated in Spice without first computing a <b>DC OP-point</b>, i.e., an initial <b>nodeset</b> that is close to steady-state conditions.  The Spice library of Modelica doesn't currently offer DC analysis.  Furthermore, the DC analysis also frequently fails due to numerical non-linearities in the transistor models. <p>

Among circuit analysts, a technique has been developed to circumvent these difficulties, called <i>ramping</i> [1].  One OP-point that can always be computed easily is the one where all sources are set equal to zero.  In that case, all node potentials must evidently be zero as well.  Thus, rather than working with the regular <b>startTime</b> and <b>offset</b> parameters of Modelica sources, it may make sense to start always from zero, ramp all sources up to their <b>offset</b> during the <b>rampTime</b>, then wait with the actual analysis during a period, called <b>settleTime</b>. <p>

Thus in Spice ramping sources, the <b>startTime</b> parameter of regular Modelica sources is replaced by two parameters: <b>rampTime</b> and <b>settleTime</b>.  To prevent numerical problems, the <b>phase</b> parameter of the sinusoidal sources has also been removed.  If a sine wave signal is supposed to be off by a certain fraction of a period from another, you need to adjust the <b>settleTime</b> of one of them accordingly. <p>

For example, a ramping trapezoidal voltage source with the parameters: <p>

<img src=\"Images/BG_Fig28.png\"> <p>

produces the following voltage characteristic: <p>

<img src=\"Images/BG_Fig29.png\"> <p>

<hr> <p>

<b>References:</b> <p>

<ol>
<li>Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp.213-215.
</ol> 

</html>
"));
          model V "Constant voltage ramping source for Spice"
            extends BondLib.Electrical.Analog.Interfaces.OnePort;
            parameter Modelica.SIunits.Voltage V=1 "Constant voltage";
            parameter Modelica.SIunits.Time rampTime=0 "Ramping time";
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-90,0},{-10,0}}, color={0,0,0}),Line(points={{-10,60},{-10,-60}}, color={0,0,0}),Line(points={{0,30},{0,-30}}, color={0,0,0}),Line(points={{0,0},{90,0}}, color={0,0,0}),Text(lineColor={0,0,255}, extent={{-120,50},{-20,0}}, fillColor={0,0,255}, textString="+"),Text(lineColor={0,0,255}, extent={{20,50},{120,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-100,-120},{100,-80}}, textString="%name=%V")}), Diagram, Documentation(info="<html>
The constant voltage ramping source ramps the voltage up (or down) from zero to its final value during <b>rampTime</b>. <p>

<hr>

<pre>
Parameters:

 V:         Constant source voltage (default value = 1 Volt)

 rampTime:  Initial ramping period (default value = 0 sec)
</pre>
</html>
"));
          protected 
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            BondLib.Bonds.fBond B3 annotation(Placement(transformation(x=0.0, y=24.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
            BondLib.Sources.rampSe V1(e0=V, offset=0, startTime=0, duration=rampTime) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
          equation 
            connect(B3.eBondCon1,V1.BondCon1) annotation(Line(visible=true, points={{0,12},{0,36}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,0},{12,1.46953e-15}}, color={192,192,192}));
            connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,1.77636e-15},{38,-1.44014e-15},{37.74,-1.44014e-15}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,1.77636e-15},{-38,1.46953e-15}}, color={192,192,192}));
            connect(J1p3_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,0},{-12.13,0},{-12.13,-1.44014e-15},{-12.26,-1.44014e-15}}, color={192,192,192}));
            connect(B3.fBondCon1,J1p3_1.BondCon3) annotation(Line(points={{7.34764e-16,12},{0,12}}, color={192,192,192}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
          end V;

          model sinV "Sinusoidal voltage ramping source for Spice"
            extends BondLib.Electrical.Analog.Interfaces.OnePort;
            parameter Modelica.SIunits.Voltage V=1 "Amplitude of sine wave";
            parameter Modelica.SIunits.Frequency freqHz=1 "Frequency of sine wave";
            parameter Modelica.SIunits.Voltage offset=0 "Voltage offset";
            parameter Modelica.SIunits.Time rampTime=0 "Ramping period";
            parameter Modelica.SIunits.Time settleTime=0 "Settling period";
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-120,50},{-20,0}}, fillColor={0,0,255}, textString="+"),Text(lineColor={0,0,255}, extent={{20,50},{120,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-150,80},{150,120}}, textString="%name"),Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},{-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},{-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,-67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}}, color={192,192,192}),Line(points={{-90,0},{90,0}}, color={0,0,0})}), Diagram, Documentation(info="<html>
The sinusoidal voltage ramping source for Spice is built from two superposed sources, a sinusoidal source and a ramping source placed in series. <p>

<hr>

<pre>
Parameters:

 V:           Amplitude of source voltage (default value = 1 Volt)

 freqHz:      Frequency of sine wave to be generated (default value = 1 Hz)

 offset:      Offset of sine wave to be generated (default value = 0 Volt)

 rampTime:    Initial ramping period (default value = 0 sec)

 settleTime:  Initial settling period (default value = 0 sec)
</pre>
</html>
"));
          protected 
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
            BondLib.Junctions.J1p4 J1p4_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            BondLib.Bonds.fBond B3 annotation(Placement(visible=true, transformation(x=0, y=24, scale=0.12, rotation=-90)));
            BondLib.Sources.sinSe V1(e0=V, freqHz=freqHz, phase=0, offset=0, startTime=rampTime + settleTime) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
            BondLib.Sources.rampSe Vramp(offset=0, startTime=0, e0=offset, duration=rampTime) annotation(Placement(visible=true, transformation(x=0, y=-48, scale=0.12, rotation=-90)));
            BondLib.Bonds.fBond B4 annotation(Placement(visible=true, transformation(x=0, y=-24, scale=0.12, rotation=-270)));
          equation 
            connect(Vramp.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-36},{1.87707e-22,-36},{0,-38},{0,-36}}, color={192,192,192}));
            connect(B4.fBondCon1,J1p4_1.BondCon3) annotation(Line(visible=true, points={{0,-12},{0,-12}}, color={192,192,192}));
            connect(B3.eBondCon1,V1.BondCon1) annotation(Line(visible=true, points={{0,36},{0,36}}, color={192,192,192}));
            connect(J1p4_1.BondCon4,B3.fBondCon1) annotation(Line(visible=true, points={{0,12},{0,12}}, color={192,192,192}));
            connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,1.77636e-15},{38,-1.44014e-15},{37.74,-1.44014e-15}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,1.77636e-15},{-38,1.46953e-15}}, color={192,192,192}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
            connect(J1p4_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,0},{-12,-1.44014e-15},{-12.26,-1.44014e-15}}, color={192,192,192}));
            connect(J1p4_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,0},{12,1.46953e-15}}, color={192,192,192}));
          end sinV;

        end RampingSources;

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

        model Jp "Spice-style p-channel JFET"
          parameter Types.JFETlevel Level=1 "JFET modeling level" annotation(Evaluate=true);
          parameter Real Area=1 "Relative area occupied by capacitor";
          parameter Modelica.SIunits.Voltage VT0=0 "Threshold voltage at reference temperature (VT0<0: enhancement type, VT0>0: depletion type)" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.InversePotential LAMBDA(min=0)=0 "Channel length modulation" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Transconductance BETA=0 "Transconductance parameter at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Real N=1 "Current emission coefficient" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Current IS(min=Modelica.Constants.small)=1e-14 "Transport saturation current at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature" annotation(Dialog(group="Electrical parameters"));
          parameter Modelica.SIunits.Resistance RS(min=0)=0 "Source resistance" annotation(Dialog(group="Parasitic resistance parameters"));
          parameter Modelica.SIunits.Resistance RD(min=0)=0 "Drain resistance" annotation(Dialog(group="Parasitic resistance parameters"));
          parameter Modelica.SIunits.Resistance RG(min=0)=0 "Gate resistance" annotation(Dialog(group="Parasitic resistance parameters"));
          parameter Modelica.SIunits.Capacitance CGS(min=Modelica.Constants.small)=5e-13 "Zero-bias gate-source depletion capacitance at reference temperature" annotation(Dialog(group="Junction capacitance parameters"));
          parameter Modelica.SIunits.Capacitance CGD(min=Modelica.Constants.small)=5e-13 "Zero-bias gate-drain depletion capacitance at reference temperature" annotation(Dialog(group="Junction capacitance parameters"));
          parameter Real M(min=0.1, max=0.9)=if Level == 3 then 0.5 else 0.33 "Junction grading coefficient" annotation(Dialog(group="Junction capacitance parameters"));
          parameter Real FC(min=0, max=0.95)=0.5 "Factor for linearization of depletion capacitance formula" annotation(Dialog(group="Junction capacitance parameters", enable=Level < 3));
          parameter Modelica.SIunits.Time TT(min=0)=5e-09 "Ideal transit time" annotation(Dialog(group="Transit time parameters", enable=Level < 3));
          parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real BEX=0 "Mobility temperature exponent" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.Voltage EG(min=0.1)=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of threshold voltage" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real TRS(unit="1/K")=0 "Linear temperature coefficient of source resistance" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real TRD(unit="1/K")=0 "Linear temperature coefficient of drain resistance" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Real TRG(unit="1/K")=0 "Linear temperature coefficient of gate resistance" annotation(Dialog(group="Temperature compensation parameters"));
          parameter Modelica.SIunits.InversePotential LAM1=0 "Channel length modulation gate voltage parameter" annotation(Dialog(tab="Level=2", group="Electrical parameters", enable=Level == 2));
          parameter Modelica.SIunits.InversePotential ALPHA=1 "Hyperbolic tangient fitting parameter" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Modelica.SIunits.InversePotential B=0 "Measure of doping profile" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Modelica.SIunits.Voltage DELTA=0.2 "Voltage range for transition" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Modelica.SIunits.Voltage VMAX=0.5 "Limit voltage for carrier velocity saturation" annotation(Dialog(tab="Level=3", group="Electrical parameters", enable=Level == 3));
          parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters"));
          parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized" annotation(Dialog(tab="Advanced", group="Numerical parameters"));
          parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance" annotation(Dialog(tab="Advanced", group="Numerical parameters"));
          parameter Types.EnforceCapacitor enforceStates=true "State selector" annotation(Dialog(tab="Advanced", group="Compiler parameters"));
          Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
          Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "may remain unconnected" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
          R Rg(Tnom=Tnom, R=RG, TR1=TRG, TR2=0, Area=Area) annotation(Placement(transformation(x=-60.0, y=-10.0, scale=0.2, aspectRatio=0.6, flipHorizontal=false, flipVertical=false)));
          R Rd(Tnom=Tnom, TR2=0, Area=Area, R=RD, TR1=TRD) annotation(Placement(transformation(x=60.0, y=50.0, scale=0.2, aspectRatio=0.6, flipHorizontal=false, flipVertical=false)));
          R Rs(Tnom=Tnom, TR2=0, Area=Area, R=RS, TR1=TRS) annotation(Placement(transformation(x=60.0, y=-40.0, scale=0.2, aspectRatio=0.6, flipHorizontal=false, flipVertical=false)));
          Utilities.Jpi Jpi1(Level=Level, Tnom=Tnom, VT0=VT0, IS=IS, BETA=BETA, LAMBDA=LAMBDA, TCV=TCV, EG=EG, N=N, XTI=XTI, PB=PB, CGS=CGS, CGD=CGD, M=M, FC=FC, TT=TT, BEX=BEX, LAM1=LAM1, ALPHA=ALPHA, B=B, DELTA=DELTA, VMAX=VMAX, GminDC=GminDC, Area=Area, EMin=EMin, EMax=EMax, enforceStates=enforceStates) annotation(Placement(transformation(x=0.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Sources.FixedTemperature T_nom(T=Tnom) annotation(Placement(transformation(x=70.0, y=-90.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          Thermal.HeatTransfer.Switches.HeatBranch Sw1 annotation(Placement(visible=true, transformation(x=0, y=-70, scale=0.1, rotation=-90)));
        equation 
          connect(Sw1.n2,heatPort) annotation(Line(visible=true, points={{0,-81},{6.73533e-16,-86.5},{0,-86.5},{0,-100}}, color={191,0,0}));
          connect(Sw1.p,Rs.heatPort) annotation(Line(visible=true, points={{0,-59},{-6.73533e-16,-52},{60,-52}}, color={191,0,0}));
          connect(Sw1.n1,T_nom.port) annotation(Line(visible=true, points={{5,-81},{12,-81},{12,-90},{59,-90}}, color={191,0,0}));
          connect(Rg.p,G) annotation(Line(points={{-80,-10},{-90,-10},{-90,-50},{-100,-50}}, color={0,0,255}));
          connect(Rd.n,D) annotation(Line(points={{80,50},{100,50}}, color={0,0,255}));
          connect(Rs.n,S) annotation(Line(points={{80,-40},{90,-40},{90,-50},{100,-50}}, color={0,0,255}));
          annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{20,-60},{40,-80}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{20,-60},{40,-80}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{14,-70},{20,-70}}, color={255,127,255})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{0,50},{91,50}}),Line(color={0,0,255}, points={{0,-50},{90,-50}}),Line(color={0,0,255}, points={{-90,-50},{0,-50}}),Line(color={0,0,255}, points={{0,-70},{0,70}}),Polygon(lineColor={0,0,255}, points={{-60,-50},{-40,-46},{-40,-54},{-60,-50}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-80}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name")}), Documentation(info="<html>
The Spice-style p-channel JFET model contains an internal p-channel JFET together with the three external resistances. <p>
 
The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>
 
<hr> <p>
 
<pre>
<b>Parameters:</b>
 
 <font color=red><b>Level:   JFET modeling level (default value = 1)
            Level=1: Shichman-Hodges (Si) JFET model
            Level=2: Improved Shichman-Hodges (Si) JFET model [1]
            Level=3: Statz-Curtice (GaAs) MESFET model [2,3]<b></font>
 
 Area:    Relative area occupied by the diode (default value = 1) <font color=red>Levels 1-3</font>
 
 
<b>Basic Electrical Parameters:</b>
 
 VT0:     Threshold voltage at reference temperature (default value = 0 Volt) <font color=red>Levels 1-3</font>
            <font color=blue><b>VT0 &lt; 0 for enhancement JFET
            VT0 &gt; 0 for depletion JFET</b></font>
 
 LAMBDA:  Channel length modulation (default value = 0 1/Volt) <font color=red>Levels 1-3</font>
 
 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>) <font color=red>Levels 1-3</font>
 
 N:       Current emission coefficient (default value = 1) <font color=red>Levels 1-3</font>
 
 IS:      Transport saturation current (default value = 1e-14 Amp) <font color=red>Levels 1-3</font>
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt) <font color=red>Levels 1-3</font>
 
 
<b>Parasitic Resistor Parameters:</b>
 
 RS:      Source resistance (default value = 0 Ohm) <font color=red>Levels 1-3</font>
 
 RD:      Drain resistance (default value = 0 Ohm) <font color=red>Levels 1-3</font>
 
 RG:      Gate resistance (default value = 0 Ohm) <font color=red>Levels 1-3</font>
 
 
<b>Junction Capacitance Parameters:</b>
 
 CGS:     Zero-bias gate-source depletion capacitance at reference temperature (default value = 0.5e-12 F) <font color=red>Levels 1-3</font>
 
 CGD:     Zero-bias gate-drain depletion capacitance at reference temperature (default value = 0.5e-12 F) <font color=red>Levels 1-3</font>
 
 M:       Junction grading coefficient <font color=red>Levels 1-3</font>
            <font color=blue><b>default value = 0.33 for Levels=1,2 (Si)
            default value = 0.5  for Level=3 (GaAs)</b></font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5) <font color=red>Levels 1,2</font>
 
 
<b>Transit Time Parameters:</b>
 
 TT:      Ideal transit time (default value = 5e-9 sec) <font color=red>Levels 1,2</font>
 
 
<b>Temperature Compensation Parameters:</b>
 
 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 1-3</font>
 
 XTI:     Saturation current temperature exponent <font color=red>Levels 1-3</font>
            <font color=blue><b>default value = 3 for Levels=1,2 (Si)
            default value = 2 for Level=3 (GaAs)</b></font>
 
 BEX:     Mobility temperature exponent (default value = 0) <font color=red>Levels 1-3</font>
 
 EG:      Energy gap for temperature effect on saturation current at 0 K <font color=red>Levels 1-3</font>
            <font color=blue><b>default value = 1.11 Volt for Levels=1,2 (Si)
            default value = 0.73 Volt for Level=3 (GaAs)</b></font>
 
 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K) <font color=red>Levels 1-3</font>
 
 TRS:     Linear temperature coefficient of source resistance (default value = 0 1/K) <font color=red>Levels 1-3</font>
 
 TRD:     Linear temperature coefficient of drain resistance (default value = 0 1/K) <font color=red>Levels 1-3</font>
 
 TRG:     Linear temperature coefficient of gate resistance (default value = 0 1/K) <font color=red>Levels 1-3</font>
 
 
<b>Level=2 Electrical Parameters:</b>
 
 LAM1:    Channel length modulation gate voltage parameter (default value = 0 1/Volt) <font color=red>Level 2</font>
 
 
<b>Level=3 Electrical Parameters:</b>
 
 ALPHA:   Hyperbolic tangient fitting parameter (default value = 1) <font color=red>Level 3</font>
 
 B:       Measure of doping profile (default value = 0 1/Volt) <font color=red>Level 3</font>
 
 DELTA:   Voltage range for transition (default value = 0.2 Volt) <font color=red>Level 3</font>
 
 VMAX:    Limit voltage for carrier velocity saturation (default value = 0.5 Volt) <font color=red>Level 3</font>
 
 
<b>Numerical Parameters:</b>
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1-3</font>
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1-3</font>
 
 GminDC:  Leakage conductance (default value = 1e-15 Mho) <font color=red>Levels 1-3</font>
 
 
<b>Compiler Parameters:</b>
 
 enforceStates:  State selector (default value = true) <font color=red>Levels 1-3</font>
                   <font color=blue><b>enforceStates = true:   Use (external) capacitive voltages as state variables
                   enforceStates = false:  Use (internal) bond graph efforts as state variables</b></font>
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(Rg.n,Jpi1.G) annotation(Line(points={{-40,-10},{-20,-10}}, color={0,0,255}));
          connect(Rd.heatPort,Jpi1.heatPort) annotation(Line(points={{60,38},{60,-20},{0,-20}}, color={191,0,0}));
          connect(Rd.p,Jpi1.D) annotation(Line(points={{40,50},{20,50},{20,10}}, color={0,0,255}));
          connect(Jpi1.S,Rs.p) annotation(Line(points={{20,-10},{20,-40},{40,-40}}, color={0,0,255}));
          connect(Rg.heatPort,Jpi1.heatPort) annotation(Line(points={{-60,-22},{-60,-30},{0,-30},{0,-20}}, color={191,0,0}));
          connect(Jpi1.heatPort,Rs.heatPort) annotation(Line(points={{0,-20},{0,-52},{60,-52}}, color={191,0,0}));
        end Jp;

        package Types
          type JFETlevel= Modelica.Icons.TypeInteger(min=1, max=3) "MOSFET modeling level" annotation(preferedView="text", Evaluate=true, choices(choice=1 "1: Shichman-Hodges (Si) JFET model", choice=2 "2: Improved Shichman-Hodges (Si) JFET model", choice=3 "3: Statz-Curtice (GaAs) MESFET model"));
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

          model CjJ "Spice-style junction capacitor model for JFETs and MESFETs"
            extends Interfaces.SpiceTwoPort;
            parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VT0=0 "Threshold voltage at reference temperature";
            parameter Modelica.SIunits.Current IS=1e-14 "Transport saturation current at reference temperature";
            parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of threshold voltage";
            parameter Modelica.SIunits.Voltage EG=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K";
            parameter Real N=1 "Current emission coefficient";
            parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent";
            parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
            parameter Modelica.SIunits.Capacitance CGS=5e-13 "Zero-bias gate-source depletion capacitance at reference temperature";
            parameter Modelica.SIunits.Capacitance CGD=5e-13 "Zero-bias gate-drain depletion capacitance at reference temperature";
            parameter Real M=if Level == 3 then 0.5 else 0.33 "Junction grading coefficient";
            parameter Real FC=0.5 "Factor for linearization of depletion capacitance formula";
            parameter Modelica.SIunits.Time TT=5e-09 "Ideal transit time";
            parameter Modelica.SIunits.InversePotential ALPHA=1 "Hyperbolic tangient fitting parameter";
            parameter Modelica.SIunits.Voltage DELTA=0.2 "Voltage range for transition";
            parameter Modelica.SIunits.Voltage VMAX=0.5 "Limit voltage for carrier velocity saturation";
            parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
            parameter Real Area=1 "Relative area occupied by capacitor";
            parameter Boolean GS=true "True if gate-source junction";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,20},{-30,-20},{30,0}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={255,255,255}),Line(points={{30,20},{30,-20}}, color={128,128,128}),Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{0,20},{10,12}}, textString="vds", fillColor={128,128,128}),Text(lineColor={0,0,255}, extent={{0,2},{10,-6}}, fillColor={128,128,128}, textString="vgs"),Text(lineColor={0,0,255}, extent={{-42,-18},{-28,-26}}, fillColor={128,128,128}, textString="Tdev")}), Documentation(info="<html>
The Spice-style junction capacitance for JFETs and GaAs MESFETs computes the depletion and diffusion capacitance values of a junction used in a JFET / MESFET.  Different Spice dialects vary in the formulae they use for this purpose.  Many Spice dialects actually don't use a formula for the junction capacitance at all, but rather compute the electric charge stored in the junction directly, which is conceptually cleaner.  However, that approach is computationally cumbersome, as it leads to an awkward algebraic loop [1].  Thus, we chose to compute the junction capacitance, and use a (physically incorrect) approximate non-linear capacitor model.  The numerical error should remain small, as the time constants associated with temperature variation are much larger than those associated with electrical phenomena. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 <font color=red><b>Level:   JFET modeling level (default value = 1)
            Level=1: Shichman-Hodges (Si) JFET model
            Level=2: Improved Shichman-Hodges (Si) JFET model [2]
            Level=3: Statz-Curtice (GaAs) MESFET model [3,4]<b></font>
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VT0:     Threshold voltage at reference temperature (default value = 0 Volt)
 
 IS:      Transport saturation current (default value = 1e-14 Amp)
 
 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K)
 
 EG:      Energy gap for temperature effect on saturation current at 0 K
            <font color=blue><b>default value = 1.11 Volt for Levels=1,2 (Si)
            default value = 0.73 Volt for Level=3 (GaAs)</b></font>
 
 N:       Current emission coefficient (default value = 1)
 
 XTI:     Saturation current temperature exponent
            <font color=blue><b>default value = 3 for Levels=1,2 (Si)
            default value = 2 for Level=3 (GaAs)</b></font>
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)
 
 CGS:     Zero-bias gate-source depletion capacitance at reference temperature (default value = 0.5e-12 F)
 
 CGD:     Zero-bias gate-drain depletion capacitance at reference temperature (default value = 0.5e-12 F)
 
 M:       Junction grading coefficient
            <font color=blue><b>default value = 0.33 for Levels=1,2 (Si)
            default value = 0.5  for Level=3 (GaAs)</b></font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)
 
 TT:      Ideal transit time (default value = 5e-9 sec)
 
 ALPHA:   Hyperbolic tangient fitting parameter (default value = 1)
 
 DELTA:   Voltage range for transition (default value = 0.2 Volt)
 
 VMAX:    Limit voltage for carrier velocity saturation (default value = 0.5 Volt)
 
 GminDC:  Leakage conductance (default value = 1e-15 Mho)
 
 Area:    Relative area occupied by the diode (default value = 1)
 
 GS:      True if gate-source junction (default value = true)
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Cellier, F.E. (1991), <i>Continuous System Modeling</i>, Springer-Verlag, New York, pp. 224-225.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"));
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-20.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            BondLib.Electrical.Analog.Spice.Utilities.DjJ DjJ1(Tnom=Tnom, Level=Level, IS=IS, EG=EG, N=N, XTI=XTI, Area=Area, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=40, y=5.55112e-16, scale=0.1, aspectRatio=1, rotation=-90)));
            BondLib.Electrical.Analog.Spice.R Rd(Tnom=Tnom, R=1/GminDC, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=70, y=-5.21805e-15, scale=0.1, aspectRatio=1, rotation=-90)));
            Semiconductors.Utilities.VariableCapacitor2 VarC1(enforceStates=enforceStates, u0=0) annotation(Placement(visible=true, transformation(x=-70, y=-4.44089e-16, scale=0.1, rotation=-90)));
            Modelica.Blocks.Interfaces.RealInput vds(redeclare type SignalType= Modelica.SIunits.Voltage ) "Drain-source voltage" annotation(Placement(visible=true, transformation(x=-40, y=110, scale=0.1, rotation=-450), iconTransformation(x=-40, y=100, scale=0.1, rotation=-450)));
            Modelica.Blocks.Interfaces.RealInput vgs(redeclare type SignalType= Modelica.SIunits.Voltage ) "Gate-source voltage" annotation(Placement(visible=true, transformation(x=40, y=110, scale=0.1, rotation=-450), iconTransformation(x=40, y=100, scale=0.1, rotation=-450)));
            BondLib.Spice.Utilities.nlCJ nlCJ1(Level=Level, Tnom=Tnom, VT0=VT0, TCV=TCV, IS=IS, EG=EG, N=N, XTI=XTI, PB=PB, CGS=CGS, CGD=CGD, M=M, FC=FC, TT=TT, ALPHA=ALPHA, DELTA=DELTA, VMAX=VMAX, GminDC=GminDC, Area=Area, GS=GS, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=-26, y=0, scale=0.24, aspectRatio=0.666667, flipHorizontal=true)));
          equation 
            connect(nlCJ1.u2,vgs) annotation(Line(visible=true, points={{2.8,-9.6},{14,-9.6},{14,70},{40,70},{40,110}}, color={0,0,191}));
            connect(nlCJ1.u1,vds) annotation(Line(visible=true, points={{2.8,9.6},{12,9.6},{12,70},{-40,70},{-40,110}}, color={0,0,191}));
            connect(Tdev1.T,nlCJ1.Tdev) annotation(Line(visible=true, points={{-30,-70},{-40,-70},{-40,-30},{-26,-30},{-26,-16}}, color={0,0,191}));
            connect(nlCJ1.y,VarC1.u) annotation(Line(visible=true, points={{-52.4,0},{-56.7,0},{-56.7,1.10215e-15},{-61,-4.44089e-16}}, color={0,0,191}));
            connect(VarC1.p,p) annotation(Line(visible=true, points={{-70,10},{-70,40},{-86,40},{-86,0},{-100,0}}, color={0,0,255}));
            connect(DjJ1.p,VarC1.p) annotation(Line(visible=true, points={{40,10},{40,40},{-70,40},{-70,10}}, color={0,0,255}));
            connect(VarC1.n,DjJ1.n) annotation(Line(visible=true, points={{-70,-10},{-70,-40},{40,-40},{40,-10}}, color={0,0,255}));
            connect(Rd.p,DjJ1.p) annotation(Line(visible=true, points={{70,10},{70,40},{40,40},{40,10}}, color={0,0,255}));
            connect(DjJ1.n,Rd.n) annotation(Line(visible=true, points={{40,-10},{40,-40},{70,-40},{70,-10}}, color={0,0,255}));
            connect(Rd.n,n) annotation(Line(visible=true, points={{70,-10},{70,-40},{88,-40},{88,0},{100,0}}, color={0,0,255}));
            connect(Rd.heatPort,Tdev1.port) annotation(Line(visible=true, points={{60,1.77636e-15},{60,-70},{-10,-70}}, color={191,0,0}));
            connect(DjJ1.heatPort,Tdev1.port) annotation(Line(visible=true, points={{30,5.55112e-16},{30,-70},{-10,-70}}, color={191,0,0}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-10,-70},{0,-70},{0,-100}}, color={191,0,0}));
          end CjJ;

          model DjJ "Spice-style diode model for JFETs and MESFETs"
            extends Interfaces.SpiceTwoPort;
            parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
            parameter Modelica.SIunits.Current IS=1e-14 "Saturation current at reference temperature";
            parameter Modelica.SIunits.Voltage EG=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K";
            parameter Real N=1 "Current emission coefficient";
            parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent";
            parameter Real Area=1 "Relative area occupied by diode";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
          protected 
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Spice.Utilities.DjJ DjJ1(Tnom=Tnom, Level=Level, IS=IS, EG=EG, N=N, XTI=XTI, Area=Area, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=-1.77636e-15, y=-14, scale=0.12, aspectRatio=0.833333, rotation=-90)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
          equation 
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{0,-80},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(DjJ1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{-1.77636e-15,-26},{0,-32}}, color={192,192,192}));
            connect(DjJ1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{-1.77636e-15,-2},{3.67382e-15,4}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Documentation(info="<html>
The Spice-style JFET junction diode is a regular exponential diode. <p>
 
<hr>
 
<pre>
Parameters:
 
 <font color=red><b>Level:  JFET modeling level (default value = 1)
           Level=1: Shichman-Hodges (Si) JFET model
           Level=2: Improved Shichman-Hodges (Si) JFET model [1]
           Level=3: Statz-Curtice (GaAs) MESFET model [2,3]<b></font>
 
 IS:     Transport saturation current (default value = 1e-14 Amp)
 
 EG:     Energy gap for temperature effect on saturation current at 0 K
           <font color=blue><b>default value = 1.11 Volt for Levels=1,2 (Si)
           default value = 0.73 Volt for Level=3 (GaAs)</b></font>
 
 N:      Current emission coefficient (default value = 1)
 
 XTI:    Saturation current temperature exponent
           <font color=blue><b>default value = 3 for Levels=1,2 (Si)
           default value = 2 for Level=3 (GaAs)</b></font>
 
 Area:   Relative area occupied by the diode (default value = 1)
 
 EMin:   if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:   if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{-30,0}}),Line(color={0,0,255}, points={{30,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(points={{0,-20},{0,-91}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-20,14},{8,-14}}, fillColor={0,0,255}, textString="J")}));
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end DjJ;

          model Jpi "Spice-style internal p-channel JFET"
            parameter Integer Level=1 "JFET modeling level (check documentation layer for details)";
            parameter Modelica.SIunits.Temperature Tnom=300.15 "Reference temperature";
            parameter Modelica.SIunits.Voltage VT0=0 "Threshold voltage at reference temperature";
            parameter Modelica.SIunits.Current IS=1e-14 "Transport saturation current at reference temperature";
            parameter Modelica.SIunits.Transconductance BETA=0 "Transconductance parameter at reference temperature";
            parameter Modelica.SIunits.InversePotential LAMBDA=0 "Channel length modulation";
            parameter Real TCV(unit="V/K")=0 "Linear temperature coefficient of threshold voltage";
            parameter Modelica.SIunits.Voltage EG=if Level == 3 then 0.73 else 1.11 "Energy gap for temperature effect on saturation current at 0 K";
            parameter Real N=1 "Current emission coefficient";
            parameter Real XTI=if Level == 3 then 2 else 3 "Saturation current temperature exponent";
            parameter Modelica.SIunits.Voltage PB=0.8 "Built-in potential at reference temperature";
            parameter Modelica.SIunits.Capacitance CGS=5e-13 "Zero-bias gate-source depletion capacitance at reference temperature";
            parameter Modelica.SIunits.Capacitance CGD=5e-13 "Zero-bias gate-drain depletion capacitance at reference temperature";
            parameter Real M=if Level == 3 then 0.5 else 0.33 "Junction grading coefficient";
            parameter Real FC=0.5 "Factor for linearization of depletion capacitance formula";
            parameter Modelica.SIunits.Time TT=5e-09 "Ideal transit time";
            parameter Real BEX=0 "Mobility temperature exponent";
            parameter Modelica.SIunits.InversePotential LAM1=0 "Channel length modulation gate voltage parameter";
            parameter Modelica.SIunits.InversePotential ALPHA=1 "Hyperbolic tangient fitting parameter";
            parameter Modelica.SIunits.InversePotential B=0 "Measure of doping profile";
            parameter Modelica.SIunits.Voltage DELTA=0.2 "Voltage range for transition";
            parameter Modelica.SIunits.Voltage VMAX=0.5 "Limit voltage for carrier velocity saturation";
            parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
            parameter Real Area=1 "Relative area occupied by capacitor";
            parameter Real EMin=-100 "if x < EMin, the exp(x) function is linearized";
            parameter Real EMax=40 "if x > EMax, the exp(x) function is linearized";
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            Modelica.Electrical.Analog.Interfaces.Pin G "Gate" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=true)));
            Modelica.Electrical.Analog.Interfaces.Pin D "Drain" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Electrical.Analog.Interfaces.Pin S "Source" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
            Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort(T(start=300.15)) "Thermal connector" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=90.0)));
            BondLib.Spice.Utilities.IDS1 ISD(Level=Level, Tnom=Tnom, VT0=VT0, BETA=BETA, LAMBDA=LAMBDA, TCV=TCV, BEX=BEX, LAM1=LAM1, ALPHA=ALPHA, B=B) annotation(Placement(transformation(x=0.0, y=0.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-30.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            BondLib.Electrical.Analog.Spice.Utilities.CjJ Ddg(Tnom=Tnom, Level=Level, VT0=VT0, IS=IS, TCV=TCV, EG=EG, N=N, XTI=XTI, PB=PB, CGS=CGS, CGD=CGD, M=M, FC=FC, TT=TT, ALPHA=ALPHA, DELTA=DELTA, VMAX=VMAX, GminDC=GminDC, Area=Area, GS=false, EMin=EMin, EMax=EMax, enforceStates=enforceStates) annotation(Placement(transformation(x=0.0, y=50.0, scale=0.2, aspectRatio=0.7, flipHorizontal=true, flipVertical=false)));
            BondLib.Electrical.Analog.Spice.Utilities.CjJ Dsg(Tnom=Tnom, Level=Level, VT0=VT0, IS=IS, TCV=TCV, EG=EG, N=N, XTI=XTI, PB=PB, CGS=CGS, CGD=CGD, M=M, FC=FC, TT=TT, ALPHA=ALPHA, DELTA=DELTA, VMAX=VMAX, GminDC=GminDC, Area=Area, EMin=EMin, EMax=EMax, GS=true, enforceStates=enforceStates) annotation(Placement(transformation(x=0.0, y=-50.0, scale=0.2, aspectRatio=0.7, flipHorizontal=true, flipVertical=true)));
            BondLib.Electrical.Analog.Sensors.VoltageSensor Vsg annotation(Placement(transformation(x=50.0, y=-84.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=0.0)));
            annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{84,-48},{88,-52}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-40,18},{-28,12}}, fillColor={128,128,128}, textString="vsd"),Text(lineColor={0,0,255}, extent={{-22,66},{-8,60}}, fillColor={128,128,128}, textString="vsg"),Text(lineColor={0,0,255}, extent={{-20,-62},{-8,-68}}, fillColor={128,128,128}, textString="vsg"),Text(lineColor={0,0,255}, extent={{10,-62},{22,-68}}, fillColor={128,128,128}, textString="vsd"),Text(lineColor={0,0,255}, extent={{-40,-6},{-28,-12}}, fillColor={128,128,128}, textString="vsg"),Text(lineColor={0,0,255}, extent={{10,66},{22,60}}, fillColor={128,128,128}, textString="vsd"),Text(lineColor={0,0,255}, extent={{2,-22},{14,-28}}, fillColor={128,128,128}, textString="Tdev")}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(color={0,0,255}, points={{0,50},{91,50}}),Line(color={0,0,255}, points={{0,-50},{90,-50}}),Line(color={0,0,255}, points={{-90,-50},{0,-50}}),Line(color={0,0,255}, points={{0,-70},{0,70}}),Polygon(lineColor={0,0,255}, points={{-60,-50},{-40,-46},{-40,-54},{-60,-50}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(points={{0,-91},{0,-80}}, color={191,0,0}),Text(lineColor={0,0,255}, extent={{-100,80},{100,100}}, textString="%name")}), Documentation(info="<html>
The Spice-style internal p-channel JFET model contains the non-linear current source and the two junction diodes (including the junctions capacitances). <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 <font color=red><b>Level:   JFET modeling level (default value = 1)
            Level=1: Shichman-Hodges (Si) JFET model
            Level=2: Improved Shichman-Hodges (Si) JFET model [1]
            Level=3: Statz-Curtice (GaAs) MESFET model [2,3]<b></font>
 
 Tnom:    Reference temperature (default value = 300.15 K)
 
 VT0:     Threshold voltage at reference temperature (default value = 0 Volt)
            <font color=blue><b>VT0 &gt; 0 for enhancement JFET
            VT0 &lt; 0 for depletion JFET</b></font>
 
 IS:      Transport saturation current (default value = 1e-14 Amp)
 
 BETA:    Transconductance parameter at reference temperature (default value = 0 Amp/Volt<sup>2</sup>)
 
 LAMBDA:  Channel length modulation (default value = 0 1/Volt)
 
 TCV:     Linear temperature coefficient of threshold voltage (default value = 0 Volt/K)
 
 EG:      Energy gap for temperature effect on saturation current at 0 K
            <font color=blue><b>default value = 1.11 Volt for Levels=1,2 (Si)
            default value = 0.73 Volt for Level=3 (GaAs)</b></font>
 
 N:       Current emission coefficient (default value = 1)
 
 XTI:     Saturation current temperature exponent
            <font color=blue><b>default value = 3 for Levels=1,2 (Si)
            default value = 2 for Level=3 (GaAs)</b></font>
 
 PB:      Built-in potential at reference temperature (default value = 0.8 Volt)
 
 CGS:     Zero-bias gate-source depletion capacitance at reference temperature (default value = 0.5e-12 F)
 
 CGD:     Zero-bias gate-drain depletion capacitance at reference temperature (default value = 0.5e-12 F)
 
 M:       Junction grading coefficient
            <font color=blue><b>default value = 0.33 for Levels=1,2 (Si)
            default value = 0.5  for Level=3 (GaAs)</b></font>
 
 FC:      Forward-bias depletion capacitance coefficient (default value = 0.5)
 
 TT:      Ideal transit time (default value = 5e-9 sec)
 
 BEX:     Mobility temperature exponent (default value = 0)
 
 LAM1:    Channel length modulation gate voltage parameter (default value = 0 1/Volt)
 
 ALPHA:   Hyperbolic tangient fitting parameter (default value = 1)
 
 B:       Measure of doping profile (default value = 0 1/Volt)
 
 DELTA:   Voltage range for transition (default value = 0.2 Volt)
 
 VMAX:    Limit voltage for carrier velocity saturation (default value = 0.5 Volt)
 
 GminDC:  Leakage conductance (default value = 1e-15 Mho)
 
 Area:    Relative area occupied by the diode (default value = 1)
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100)
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40)
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.153.
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York, p.382.
<li> Statz, H., P. Newman, I.W. Smith, R.A. Pucel, and H.A. Hans (1987), \"GaAs FET Device and Circuit Simulation in Spice,\"
     <i>IEEE Trans. Electron Devices</i>, <b>34</b>(2), pp. 160-169.
</ol>
</html>
"));
            Sensors.VoltageSensor Vsd annotation(Placement(visible=true, transformation(x=86, y=0, scale=0.1, flipHorizontal=true, flipVertical=true, rotation=-90)));
            Isignal Isd annotation(Placement(visible=true, transformation(x=50, y=0, scale=0.14, flipHorizontal=true, flipVertical=true, rotation=-90)));
          equation 
            connect(Isd.p,S) annotation(Line(visible=true, points={{50,-14},{50,-50},{100,-50}}, color={0,0,255}));
            connect(Isd.n,D) annotation(Line(visible=true, points={{50,14},{50,50},{100,50}}, color={0,0,255}));
            connect(Dsg.heatPort,Isd.heatPort) annotation(Line(visible=true, points={{0,-36},{68,-36},{68,0},{64,0},{64,0}}, color={191,0,0}));
            connect(Ddg.heatPort,Isd.heatPort) annotation(Line(visible=true, points={{0,36},{68,36},{68,0},{64,0},{64,0}}, color={191,0,0}));
            connect(Isd.heatPort,heatPort) annotation(Line(visible=true, points={{64,0},{64,0},{68,0},{68,-70},{0,-70},{0,-100}}, color={191,0,0}));
            connect(ISD.y,Isd.InPort1) annotation(Line(visible=true, points={{22,0},{36.8,0},{36.8,-2.29069e-15},{41.6,0}}, color={0,0,191}));
            connect(Vsd.V,Dsg.vds) annotation(Line(visible=true, points={{96,0},{108,6.12303e-16},{108,-100},{20,-100},{20,-76},{8,-76},{8,-64}}, color={0,0,191}));
            connect(S,Vsd.p) annotation(Line(visible=true, points={{100,-50},{86,-50},{86,-10}}, color={0,0,255}));
            connect(D,Vsd.n) annotation(Line(visible=true, points={{100,50},{86,50},{86,10}}, color={0,0,255}));
            connect(Vsd.V,Ddg.vds) annotation(Line(visible=true, points={{96,0},{100,6.12303e-16},{100,0},{108,0},{108,72},{8,72},{8,64}}, color={0,0,191}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-20,-70},{0,-70},{0,-100}}, color={191,0,0}));
            connect(Tdev1.T,ISD.Tdev) annotation(Line(points={{-40,-70},{-50,-70},{-50,-28},{0,-28},{0,-20}}, color={0,0,191}));
            connect(Ddg.vds,ISD.u1) annotation(Line(points={{8,64},{8,72},{-50,72},{-50,12},{-24,12}}, color={0,0,191}));
            connect(Vsg.V,Ddg.vgs) annotation(Line(points={{50,-94},{50,-98},{32,-98},{32,80},{-8,80},{-8,64}}, color={0,0,191}));
            connect(Ddg.vgs,ISD.u2) annotation(Line(points={{-8,64},{-8,80},{-54,80},{-54,-12},{-24,-12}}, color={0,0,191}));
            connect(Vsg.p,S) annotation(Line(points={{60,-84},{86,-84},{86,-50},{100,-50}}, color={0,0,255}));
            connect(Vsg.n,G) annotation(Line(points={{40,-84},{-80,-84},{-80,-50},{-100,-50}}, color={0,0,255}));
            connect(Ddg.p,D) annotation(Line(points={{20,50},{100,50}}, color={0,0,255}));
            connect(Ddg.n,G) annotation(Line(points={{-20,50},{-80,50},{-80,-50},{-100,-50}}, color={0,0,255}));
            connect(Dsg.p,S) annotation(Line(points={{20,-50},{100,-50}}, color={0,0,255}));
            connect(Dsg.n,G) annotation(Line(points={{-20,-50},{-100,-50}}, color={0,0,255}));
            connect(ISD.u2,Dsg.vgs) annotation(Line(points={{-24,-12},{-54,-12},{-54,-88},{-8,-88},{-8,-64}}, color={0,0,191}));
          end Jpi;

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
      model DifferentialAmplifier "Differential amplifier circuit made from two p-channel JFETs"
        output Modelica.SIunits.Voltage vin;
        output Modelica.SIunits.Voltage vout;
        Electrical.Analog.Basic.Ground Gnd1 annotation(Placement(transformation(x=0.0, y=-76.0, scale=0.08, aspectRatio=0.75, flipHorizontal=false, flipVertical=false)));
        annotation(Diagram, experiment(StopTime=0.005), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-69.85,56.65},{78,24}}, fillColor={0,0,0}, lineThickness=0.5, textString="Differential amplifier"),Text(lineColor={0,0,255}, extent={{-34,26},{28,6}}, fillColor={0,0,0}, lineThickness=0.5, textString="circuit"),Text(lineColor={0,0,255}, extent={{-78,6},{76,-26}}, fillColor={0,0,0}, lineThickness=0.5, textString="using two Spice-style"),Text(lineColor={0,0,255}, extent={{-70,-20},{68,-58}}, fillColor={0,0,0}, lineThickness=0.5, textString="p-channel JFETs")}), Documentation(info="<html>
This circuit describes a differential amplifier built from two p-channel JFETs.  Notice the use of ramping sources.  After ramping, the gate of the right JFET is held constant at 0.5 Volt, whereas the gate of the left JFET varies slightly around that value using a sine-wave.  The output voltage inverts and amplifies that differential voltage by about a factor of 80. <p>

Simulate the circuit across 0.005 seconds and plot the input and output voltages as functions of time.

<font color=red><b><p>
This example does not currently simulate. It simulated correctly under Dymola 6.0b with Modelica 2.2,
but in Dymola 6.1 with Modelica 2.2.1, the simulation dies at time 0, claiming that a Newton iteration
on a non-linear set of equations fails to converge. <p>

We are still investigating what the cause of this anomaly is.
</p></b></font>
</html>
"));
        Electrical.Analog.Spice.Jp Jp1(Level=1, Tnom=300.15, IS=1e-15, RS=0.5, RD=1.5, RG=0, BETA=0.015, LAMBDA=0.001, TCV=0, TRS=0, TRD=0, TRG=0, EG=1.11, N=1, XTI=3, CGS=5e-14, CGD=5e-14, M=0.5, FC=0.5, PB=0.2, TT=1e-12, BEX=0, GminDC=1e-16, Area=1, EMin=-100, EMax=40, VT0=-1.1) annotation(Placement(transformation(x=-30.0, y=-10.0, scale=0.1, aspectRatio=1.2, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Spice.Jp Jp2(Level=1, Tnom=300.15, IS=1e-15, RS=0.5, RD=1.5, RG=0, BETA=0.015, LAMBDA=0.001, TCV=0, TRS=0, TRD=0, TRG=0, EG=1.11, N=1, XTI=3, CGS=5e-14, CGD=5e-14, M=0.5, FC=0.5, PB=0.2, TT=1e-12, BEX=0, GminDC=1e-16, Area=1, EMin=-100, EMax=40, VT0=-1.1) annotation(Placement(transformation(x=30.0, y=-10.0, scale=0.1, aspectRatio=1.2, flipHorizontal=true, flipVertical=false)));
        Electrical.Analog.Spice.R Rd1(Tnom=300.15, TR1=0, TR2=0, Area=1, R=150000.0) annotation(Placement(transformation(x=-20.0, y=30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
        Electrical.Analog.Basic.Ground Gnd2 annotation(Placement(transformation(x=60.0, y=4.0, scale=0.08, aspectRatio=0.75, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Basic.Ground Gnd3 annotation(Placement(transformation(x=60.0, y=-76.0, scale=0.08, aspectRatio=0.75, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Spice.RampingSources.sinV Vin(offset=0.5, freqHz=1000.0, rampTime=0.001, settleTime=0.001, V=0.02) annotation(Placement(transformation(x=-60.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
        Electrical.Analog.Basic.Ground Gnd4 annotation(Placement(transformation(x=-60.0, y=-76.0, scale=0.08, aspectRatio=0.75, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Sensors.VoltageSensor Vout annotation(Placement(transformation(x=0.0, y=10.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
        Thermal.HeatTransfer.Sources.FixedTemperature FixedTemperature1(T=300.15) annotation(Placement(transformation(x=-70.0, y=70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Spice.R Rd2(Tnom=300.15, TR1=0, TR2=0, Area=1, R=150000.0) annotation(Placement(visible=true, transformation(x=20, y=30, scale=0.1, rotation=-270)));
        Electrical.Analog.Spice.RampingSources.V V1(V=-5, rampTime=0.001) annotation(Placement(visible=true, transformation(x=60, y=30, scale=0.1, rotation=-90)));
        Electrical.Analog.Spice.R Rg(Tnom=300.15, R=75000.0, TR1=0, TR2=0, Area=1) annotation(Placement(visible=true, transformation(x=0, y=-50, scale=0.1, rotation=-270)));
        Electrical.Analog.Spice.RampingSources.V V2(V=0.5, rampTime=0.001) annotation(Placement(visible=true, transformation(x=60, y=-50, scale=0.1, rotation=-90)));
      equation 
        connect(V2.n,Gnd3.p) annotation(Line(visible=true, points={{60,-60},{60,-70}}, color={0,0,255}));
        connect(Jp2.G,V2.p) annotation(Line(visible=true, points={{40,-16},{60,-16},{60,-40}}, color={0,0,255}));
        connect(Rg.heatPort,Jp2.heatPort) annotation(Line(visible=true, points={{10,-50},{30,-50},{30,-22}}, color={191,0,0}));
        connect(Jp2.S,Rg.n) annotation(Line(visible=true, points={{20,-16},{20,-30},{0,-30},{0,-40},{0,-40}}, color={0,0,255}));
        connect(Jp1.S,Rg.n) annotation(Line(visible=true, points={{-20,-16},{-20,-30},{0,-30},{0,-40},{0,-40}}, color={0,0,255}));
        connect(Rg.p,Gnd1.p) annotation(Line(visible=true, points={{0,-60},{0,-60},{0,-70}}, color={0,0,255}));
        connect(V1.n,Gnd2.p) annotation(Line(visible=true, points={{60,20},{60,10}}, color={0,0,255}));
        connect(Rd2.n,V1.p) annotation(Line(visible=true, points={{20,40},{20,50},{60,50},{60,40}}, color={0,0,255}));
        connect(Jp2.heatPort,Rd2.heatPort) annotation(Line(visible=true, points={{30,-22},{44,-22},{44,30},{30,30}}, color={191,0,0}));
        connect(FixedTemperature1.port,Rd2.heatPort) annotation(Line(visible=true, points={{-59,70},{44,70},{44,30},{30,30}}, color={191,0,0}));
        connect(Vout.n,Rd2.p) annotation(Line(visible=true, points={{10,10},{20,10},{20,20}}, color={0,0,255}));
        connect(Rd1.n,Rd2.n) annotation(Line(visible=true, points={{-20,40},{-20,50},{20,50},{20,40}}, color={0,0,255}));
        connect(Rd2.p,Jp2.D) annotation(Line(visible=true, points={{20,20},{20,-4}}, color={0,0,255}));
        vin=Vin.v;
        vout=Vout.v;
        connect(Rd1.p,Jp1.D) annotation(Line(points={{-20,20},{-20,-4}}, color={0,0,255}));
        connect(Vin.n,Gnd4.p) annotation(Line(points={{-60,-60},{-60,-70}}, color={0,0,255}));
        connect(Jp1.G,Vin.p) annotation(Line(points={{-40,-16},{-60,-16},{-60,-40}}, color={0,0,255}));
        connect(Vout.p,Rd1.p) annotation(Line(points={{-10,10},{-20,10},{-20,20}}, color={0,0,255}));
        connect(FixedTemperature1.port,Rd1.heatPort) annotation(Line(points={{-59,70},{-44,70},{-44,30},{-30,30}}, color={191,0,0}));
        connect(Jp1.heatPort,Rd1.heatPort) annotation(Line(points={{-30,-22},{-44,-22},{-44,30},{-30,30}}, color={191,0,0}));
      end DifferentialAmplifier;

    end ModelicaSpice;

  end Examples;

end BondLib;




model BondLib_Examples_ModelicaSpice_DifferentialAmplifier
  extends BondLib.Examples.ModelicaSpice.DifferentialAmplifier;
end BondLib_Examples_ModelicaSpice_DifferentialAmplifier;



