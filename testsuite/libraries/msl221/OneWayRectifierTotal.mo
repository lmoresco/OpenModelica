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

        partial model TwoPort "TwoPort partial model of analog electrical library"
          Modelica.SIunits.Voltage v1 "Voltage drop over the left port";
          Modelica.SIunits.Voltage v2 "Voltage drop over the right port";
          Modelica.SIunits.Current i1 "Current flowing from pos. to neg. pin of the left port";
          Modelica.SIunits.Current i2 "Current flowing from pos. to neg. pin of the right port";
          Modelica.Electrical.Analog.Interfaces.PositivePin p1 "First left electrical connector" annotation(Placement(transformation(x=-100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.PositivePin p2 "Second left electrical connector" annotation(Placement(transformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n1 "First right electrical connector" annotation(Placement(transformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=-100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Modelica.Electrical.Analog.Interfaces.NegativePin n2 "Second right electrical connector" annotation(Placement(transformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false), iconTransformation(x=100.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-120,53},{-110,50},{-120,47},{-120,53}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{-136,50},{-111,50}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-136,53},{-119,68}}, textString="i1", fillColor={160,160,160}),Polygon(points={{-126,-46},{-136,-49},{-126,-52},{-126,-46}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{-136,-49},{-111,-49}}, color={160,160,160}),Text(lineColor={0,0,255}, extent={{-127,-46},{-110,-31}}, textString="i1", fillColor={160,160,160}),Line(points={{111,50},{136,50}}, color={160,160,160}),Polygon(points={{120,53},{110,50},{120,47},{120,53}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{118,52},{135,67}}, textString="i2", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{112,-44},{128,-29}}, textString="i2", fillColor={160,160,160}),Polygon(points={{127,-47},{137,-50},{127,-53},{127,-47}}, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid),Line(points={{111,-50},{136,-50}}, color={160,160,160})}));
        equation 
          v1=p1.v - n1.v;
          v2=p2.v - n2.v;
          i1=p1.i;
          i2=p2.i;
        end TwoPort;

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

        model VCV "Linear voltage-controlled voltage source"
          extends Interfaces.TwoPort;
          parameter Real gain=1 "Voltage gain";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-70,70},{70,-70}}, fillPattern=FillPattern.Solid, fillColor={255,255,255}),Text(lineColor={0,0,255}, extent={{-99,-59},{100,-109}}, textString="%name"),Line(color={0,0,255}, points={{-90,50},{-30,50}}),Line(color={0,0,255}, points={{-30,-50},{-90,-50}}),Ellipse(lineColor={0,0,255}, extent={{10,20},{50,-20}}),Line(color={0,0,255}, points={{-20,60},{20,60}}),Polygon(lineColor={0,0,255}, points={{20,60},{10,63},{10,57},{20,60}}, fillColor={0,0,255}, fillPattern=FillPattern.Solid),Line(color={0,0,255}, points={{30,50},{30,-50}}),Line(color={0,0,255}, points={{30,50},{90,50}}),Line(color={0,0,255}, points={{30,-50},{90,-50}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-68,26},{-58,18}}, textString="v1a", fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-82,26},{-72,18}}, fillColor={160,160,160}, textString="i1"),Text(lineColor={0,0,255}, extent={{-82,-16},{-72,-24}}, fillColor={160,160,160}, textString="i1"),Text(lineColor={0,0,255}, extent={{-56,-4},{-44,-12}}, fillColor={160,160,160}, textString="i1=0"),Text(lineColor={0,0,255}, extent={{-68,-14},{-58,-22}}, fillColor={160,160,160}, textString="v1b"),Text(lineColor={0,0,255}, extent={{-56,8},{-46,0}}, fillColor={160,160,160}, textString="v1"),Text(lineColor={0,0,255}, extent={{42,8},{54,0}}, fillColor={160,160,160}, textString="v2"),Text(lineColor={0,0,255}, extent={{44,-4},{56,-12}}, fillColor={160,160,160}, textString="i2"),Text(lineColor={0,0,255}, extent={{72,24},{84,16}}, fillColor={160,160,160}, textString="i2"),Text(lineColor={0,0,255}, extent={{72,-16},{84,-24}}, fillColor={160,160,160}, textString="i2"),Text(lineColor={0,0,255}, extent={{58,22},{68,14}}, fillColor={160,160,160}, textString="v2a"),Text(lineColor={0,0,255}, extent={{58,-18},{68,-26}}, fillColor={160,160,160}, textString="v2b")}), Documentation(info="<html>
The linear voltage-controlled voltage source is built in bondgraphic technology using an effort detector and a modulated effort source.  A-causal bonds must partially be used here, because the causality of the output port depends on the embedding of the <b>VCV</b> element in its environment. <p>

<hr>

<pre>
Parameters:

 gain:  Voltage gain (default value = 1)
</pre> <p>

<hr> <p>

Equations: <p>

<b>v2 = gain*v1</b> <br>
<b>i1 = 0</b>
</html>
"));
        protected 
          Modelica.Blocks.Math.Gain Gain1(k=gain) annotation(Placement(transformation(x=2.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Sensors.De De1 annotation(Placement(transformation(x=-30.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Bonds.fBond B3 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=-70.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
          BondLib.Sources.mSe mSe1 annotation(Placement(transformation(x=30.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Bonds.fBond B4 annotation(Placement(transformation(x=50.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Junctions.J1p3 J1p3_2 annotation(Placement(transformation(x=70.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=-90.0)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-70.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG2 annotation(Placement(transformation(x=70.0, y=50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=70.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El2 annotation(Placement(transformation(x=-70.0, y=-50.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
          BondLib.Bonds.eBond B2 annotation(Placement(visible=true, transformation(x=-70, y=-20, scale=0.1, rotation=-90)));
          BondLib.Bonds.fBond B1 annotation(Placement(visible=true, transformation(x=-70, y=20, scale=0.1, rotation=-90)));
          BondLib.Bonds.Bond B5 annotation(Placement(visible=true, transformation(x=70, y=20, scale=0.1, rotation=-270)));
          BondLib.Bonds.Bond B6 annotation(Placement(visible=true, transformation(x=70, y=-20, scale=0.1, rotation=-270)));
        equation 
          connect(BG2El1.BondCon1,B6.BondCon1) annotation(Line(visible=true, points={{60,-50},{50,-50},{50,-29.8},{70,-29.8}}, color={192,192,192}));
          connect(B6.BondCon2,J1p3_2.BondCon1) annotation(Line(visible=true, points={{70,-10},{70,-10}}, color={192,192,192}));
          connect(El2BG2.BondCon1,B5.BondCon2) annotation(Line(visible=true, points={{60,50},{50,50},{50,30},{70,30}}, color={192,192,192}));
          connect(B5.BondCon1,J1p3_2.BondCon2) annotation(Line(visible=true, points={{70,10.2},{70,10}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.eBondCon1) annotation(Line(visible=true, points={{-60,50},{-50,50},{-50,30},{-70,30}}, color={192,192,192}));
          connect(B1.fBondCon1,J1p3_1.BondCon2) annotation(Line(visible=true, points={{-70,10},{-70,-10}}, color={192,192,192}));
          connect(BG2El2.BondCon1,B2.eBondCon1) annotation(Line(visible=true, points={{-60,-50},{-50,-50},{-50,-30},{-70,-30}}, color={192,192,192}));
          connect(J1p3_1.BondCon1,B2.fBondCon1) annotation(Line(visible=true, points={{-70,10},{-70,-10}}, color={192,192,192}));
          connect(De1.OutPort1,Gain1.u) annotation(Line(points={{-19,0},{-10,0}}, color={0,0,255}));
          connect(B3.fBondCon1,De1.BondCon1) annotation(Line(points={{-40,0},{-40,0}}, color={192,192,192}));
          connect(J1p3_1.BondCon3,B3.eBondCon1) annotation(Line(points={{-60,-6.12303e-16},{-60,0}}, color={192,192,192}));
          connect(mSe1.BondCon1,B4.eBondCon1) annotation(Line(points={{40,0},{40,0}}, color={192,192,192}));
          connect(B4.fBondCon1,J1p3_2.BondCon3) annotation(Line(points={{60,0},{60,-6.12303e-16}}, color={192,192,192}));
          connect(El2BG1.p,p1) annotation(Line(points={{-80,50},{-100,50}}, color={0,0,255}));
          connect(BG2El2.n,n1) annotation(Line(points={{-80,-50},{-100,-50}}, color={0,0,255}));
          connect(El2BG2.p,p2) annotation(Line(points={{80,50},{100,50}}, color={0,0,255}));
          connect(BG2El1.n,n2) annotation(Line(points={{80,-50},{100,-50}}, color={0,0,255}));
          connect(Gain1.y,mSe1.s) annotation(Line(points={{13,0},{21,0}}, color={0,0,191}));
        end VCV;

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

        model CurrentSensor "Sensor of electrical current"
          extends Interfaces.OnePort;
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-70,70},{70,-70}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Line(points={{0,70},{0,40}}, color={0,0,0}),Line(points={{22.9,32.8},{40.2,57.3}}, color={0,0,0}),Line(points={{-22.9,32.8},{-40.2,57.3}}, color={0,0,0}),Line(points={{37.6,13.7},{65.8,23.9}}, color={0,0,0}),Line(points={{-37.6,13.7},{-65.8,23.9}}, color={0,0,0}),Line(points={{0,0},{9.02,28.6}}, color={0,0,0}),Polygon(points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Ellipse(extent={{-5,5},{5,-5}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-29,-11},{30,-70}}, textString="A", fillColor={0,0,0}),Text(lineColor={0,0,255}, extent={{-150,72},{150,112}}, textString="%name"),Line(points={{70,0},{90,0}}, color={0,0,0}),Line(color={0,0,255}, points={{0,-90},{0,-70}}),Line(points={{-70,0},{-90,0}}, color={0,0,0})}), Diagram, Documentation(info="<html>
Sensor of electrical current built in bond graph technology using a flow sensor.
</html>
"));
        protected 
          Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
          Bonds.Bond B3 annotation(Placement(transformation(x=0.0, y=-24.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-270.0)));
          Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
          Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
          BondLib.Sensors.Df Df1 annotation(Placement(visible=true, transformation(x=0, y=-48, scale=0.12, rotation=-90)));
        public 
          Modelica.Blocks.Interfaces.RealOutput I(redeclare type SignalType= Modelica.SIunits.Current ) "Current sensor" annotation(Placement(transformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0), iconTransformation(x=0.0, y=-100.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
        equation 
          connect(Df1.OutPort1,I) annotation(Line(visible=true, points={{0,-61.2},{8.0824e-16,-74.6},{0,-74.6},{0,-100}}, color={0,0,191}));
          connect(Df1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{0,-36},{0,-12}}, color={192,192,192}));
          connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,0},{-12,0}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,0},{12.26,0}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,1.77636e-15},{-38,0},{-37.74,0}}, color={192,192,192}));
          connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,0},{38,1.77636e-15}}, color={192,192,192}));
          connect(B3.BondCon1,J1p3_1.BondCon3) annotation(Line(points={{2.16021e-15,-12.24},{2.16021e-15,-18.12},{0,-18.12},{0,-12}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-79,1.77636e-15},{-79,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{81,1.77636e-15},{81,0},{100,0}}, color={0,0,255}));
        end CurrentSensor;

      end Sensors;

      package Sources "Sources of analog electrical library"
        annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(lineColor={0,0,255}, extent={{-100,-100},{80,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(lineColor={0,0,255}, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={0,0,255}),Text(lineColor={0,0,255}, extent={{-118,114},{122,65}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package offers a reimplementation of the <i>Sources</i> package of the standard analog electrical Modelica library using bond graph technology.
</html>
"));
        model SineVoltage "Sinusoidal voltage source of analog electrical library"
          extends Interfaces.OnePort;
          parameter Modelica.SIunits.Voltage V=1 "Amplitude of sine wave";
          parameter Modelica.SIunits.Angle phase=0 "Phase of sine wave";
          parameter Modelica.SIunits.Frequency freqHz=1 "Frequency of sine wave";
          parameter Modelica.SIunits.Voltage offset=0 "Voltage offset";
          parameter Modelica.SIunits.Time startTime=0 "Time offset";
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-120,50},{-20,0}}, fillColor={0,0,255}, textString="+"),Ellipse(extent={{-50,50},{50,-50}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Line(points={{-66,0},{-56.2,29.9},{-49.8,46.5},{-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},{-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,-67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}}, color={192,192,192}),Text(lineColor={0,0,255}, extent={{20,50},{120,0}}, fillColor={0,0,255}, textString="-"),Text(lineColor={0,0,255}, extent={{-150,80},{150,120}}, textString="%name"),Line(points={{-90,0},{90,0}}, color={0,0,0})}), Diagram, Documentation(info="<html>
The sinusoidal voltage source is built in bondgraphic technology from a bond graph <b>sinSe</b> element, a 1-junction, and three bonds.  A-causal bonds must be used except at the source, because the causality depends on the embedding of the voltage source in its environment. <p>

<hr>

<pre>
Parameters:

 V:          Amplitude of source voltage (default value = 1 Volt)

 phase:      Phase of sine wave to be generated (default value = 0 rad)

 freqHz:     Frequency of sine wave to be generated (default value = 1 Hz)

 offset:     Offset of sine wave to be generated (default value = 0 Volt)

 startTime:  Start time of sine wave to be generated (default value = 0 sec)
</pre>
</html>
"));
        protected 
          BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
          BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false, rotation=-180.0)));
          BondLib.Sources.sinSe V1(e0=V, phase=phase, freqHz=freqHz, offset=offset, startTime=startTime) annotation(Placement(visible=true, transformation(x=0, y=48, scale=0.12, rotation=-270)));
          BondLib.Bonds.fBond B3 annotation(Placement(visible=true, transformation(x=0, y=24, scale=0.12, rotation=-90)));
        equation 
          connect(B3.eBondCon1,V1.BondCon1) annotation(Line(visible=true, points={{0,36},{0,36}}, color={192,192,192}));
          connect(B3.fBondCon1,J1p3_1.BondCon3) annotation(Line(visible=true, points={{0,12},{0,12}}, color={192,192,192}));
          connect(J1p3_1.BondCon2,B1.BondCon2) annotation(Line(points={{12,0},{12,1.46953e-15}}, color={192,192,192}));
          connect(BG2El1.BondCon1,B1.BondCon1) annotation(Line(points={{38,1.77636e-15},{38,1.77636e-15},{38,-1.44014e-15},{37.74,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.BondCon1,B2.BondCon2) annotation(Line(points={{-38,1.77636e-15},{-38,1.46953e-15}}, color={192,192,192}));
          connect(J1p3_1.BondCon1,B2.BondCon1) annotation(Line(points={{-12,0},{-12.13,0},{-12.13,-1.44014e-15},{-12.26,-1.44014e-15}}, color={192,192,192}));
          connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
          connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{82,1.77636e-15},{82,0},{100,0}}, color={0,0,255}));
        end SineVoltage;

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

        model D "Spice-style diode of the analog electrical library"
          extends Interfaces.SpiceTwoPort;
          constant Real inf=Modelica.Constants.inf;
          constant Modelica.SIunits.Entropy k=Modelica.Constants.k "Boltzmann's constant";
          constant Modelica.SIunits.ElectricCharge q=1.6021892e-19 "Electron charge";
          parameter Types.DIODElevel Level=1 "DIODE modeling level" annotation(Evaluate=true);
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
          parameter Types.DIODEtype XTI=3 "Saturation current temperature exponent" annotation(Dialog(group="Temperature compensation parameters", enable=Level == 1 or Level == 3));
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
          parameter Types.EnforceCapacitor enforceStates=true "State selector" annotation(Dialog(tab="Advanced", group="Compiler parameters"));
          R RS1(Tnom=Tnom, R=RS, TR1=TRS, TR2=0, Area=Area) annotation(Placement(transformation(x=-60.0, y=0.0, scale=0.2, aspectRatio=0.5, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Spice.Utilities.Isignal Id annotation(Placement(transformation(x=20.0, y=-40.0, scale=0.2, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Electrical.Analog.Sensors.VoltageSensor vd annotation(Placement(transformation(x=20.0, y=80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true)));
          Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-30.0, y=-60.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          Thermal.HeatTransfer.Switches.HeatBranch Sw1 annotation(Placement(transformation(x=-60.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
          Thermal.HeatTransfer.Sources.FixedTemperature T_nom(T=Tnom) annotation(Placement(transformation(x=-90.0, y=-80.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
          BondLib.Spice.Utilities.ID0 ID0(Level=Level, N=N, IKF=IKF, IKR=IKR) annotation(Placement(visible=true, transformation(x=20, y=0, scale=0.16, rotation=-90)));
          BondLib.Electrical.Analog.Spice.Utilities.CjD Dd(Tnom=Tnom, Level=Level, Area=Area, PJ=PJ, M=M, IS=IS, JS=JS, N=N, TT=TT, PB=PB, PHP=PHP, CJ=CJ, CJ2=CJ2, MJ=MJ, CJSW=CJSW, CJSW2=CJSW2, MJSW=MJSW, FC=FC, GminDC=GminDC, EG=EG, XTI=XTI, TCV=TCV, TTT1=TTT1, TTT2=TTT2, ISW=ISW, JSW=JSW, TOX=TOX, L=L, W=W, LP=LP, WP=WP, XP=XP, XOI=XOI, LM=LM, WM=WM, XM=XM, XOM=XOM, JF=JF, JR=JR, EF=EF, ER=ER, EMin=EMin, EMax=EMax, BV=BVval, IBV=IBVval, enforceStates=enforceStates) annotation(Placement(visible=true, transformation(x=20, y=44, scale=0.2, aspectRatio=0.7, flipVertical=true)));
        protected 
          parameter Modelica.SIunits.Area AREAeff=W*L*M;
          parameter Modelica.SIunits.Length PJeff=2*(W + L)*M;
          parameter Modelica.SIunits.Voltage Vt=k*Tnom/q;
          parameter Modelica.SIunits.Current ISeff=if Level == 1 then Area*IS + PJ*ISW else if Level == 3 then AREAeff*JS + PJeff*JSW else 0;
          parameter Modelica.SIunits.Current Ibreak=-ISeff*(exp(-BV/(N*Vt)) - 1);
          parameter Modelica.SIunits.Current IBVval=if IBV < Ibreak then Ibreak else IBV;
          parameter Modelica.SIunits.Voltage BVval=if noEvent(BV > 0) then BV - N*Vt*log(IBVval/Ibreak) else 0;
          annotation(Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-30},{-80,-50}}, lineColor={255,127,255}),Text(lineColor={0,0,255}, extent={{-100,-30},{-80,-50}}, fillColor={255,127,255}, textString="Connected?"),Line(points={{-80,-40},{-74,-40}}, color={255,127,255})}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{40,0}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(points={{0,-20},{0,-91}}, color={191,0,0})}), Documentation(info="<html>
The Spice-style diode offers three modeling levels [1].  The <b>Level=1</b> model characterizes a junction diode by its electrical properties.  This model is similar to the models of the junction diodes used within the BJT and MOSFET models, but it is more accurate.  In particular, it includes a description of avalanche breakdown behavior.  The <b>Level=3</b> model is similar to the <b>Level=1</b> model, but here, the diode is characterized by its physical parameters, such as length and width of the junction.  Also, this model is yet more accurate as it allows the modeler to specify a polysilicon and a metal layer, in which case the additional capacitances associated with these layers will be computed as well.  The <b>Level=2</b> model is an entirely different device.  It represents essentially a non-linear resistor with a quadratic characteristic on both sides.  Thus, the Fowler-Nordheim diode is a symmetric device. <p>
 
The heating port may remain unconnected, in which case the device is being simulated at a constant temperature of <b>Tnom</b>. <p>
 
<hr> <p>
 
<pre>
<b>Parameters:</b>
 
 Tnom:    Reference temperature (default value = 300.15 K) <font color=red>Levels 1-3</font>
 
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
 
 
<b>Level=3 Junction Capacitance Parameters:</b>
 
 CJ2:     Zero-bias bulk capacitance per meter square at reference temperature (default value = 1e-4 F/m<sup>2</sup>) <font color=red>Level 3</font>
 
 CJSW2:   Zero-bias perimeter capacitance per meter at reference temperature (default value = 1e-9 F/m) <font color=red>Level 3</font>
 
 
<b>Numerical Parameters:</b>
 
 EMin:    if x &lt; EMin, the exp(x) function is linearized (default value = -100) <font color=red>Levels 1,3</font>
 
 EMax:    if x &gt; EMax, the exp(x) function is linearized (default value = 40) <font color=red>Levels 1,3</font>
 
 GminDC:  Leakage conductance (default value = 1e-16 mho) <font color=red>Levels 1,3</font>
 
 
<b>Compiler Parameters:</b>
 
 enforceStates:  State selector (default value = true) <font color=red>Levels 1-3</font>
                   <font color=blue><b>enforceStates = true:   Use (external) capacitive voltages as state variables
                   enforceStates = false:  Use (internal) bond graph efforts as state variables</b></font>
</pre> <p>
 
<hr> <p>
 
<b>References:</b> <p>
 
<ol>
<li> Massobrio, G. and P. Antognetti (1993), <i>Semiconductor Device Modeling with Spice</i>,
     2<sup>nd</sup> edition, McGraw Hill, New York.
</ol>
</html>
"));
        equation 
          connect(Dd.id,ID0.u) annotation(Line(visible=true, points={{20,28.6},{20,19.2}}, color={0,0,191}));
          connect(RS1.n,Dd.p) annotation(Line(visible=true, points={{-40,0},{-20,-1.77636e-15},{-20,44},{0,44}}, color={0,0,255}));
          connect(Dd.p,vd.p) annotation(Line(visible=true, points={{0,44},{-20,44},{-20,80},{10,80}}, color={0,0,255}));
          connect(Dd.n,n) annotation(Line(visible=true, points={{40,44},{70,44},{70,0},{100,0}}, color={0,0,255}));
          connect(vd.n,Dd.n) annotation(Line(visible=true, points={{30,80},{70,80},{70,44},{40,44}}, color={0,0,255}));
          connect(Dd.heatPort,RS1.heatPort) annotation(Line(visible=true, points={{20,58},{-30,58},{-30,-20},{-60,-20},{-60,-10}}, color={191,0,0}));
          connect(Id.heatPort,Dd.heatPort) annotation(Line(visible=true, points={{20,-60},{60,-60},{60,58},{20,58}}, color={191,0,0}));
          connect(vd.V,ID0.v) annotation(Line(visible=true, points={{20,90},{20,94},{80,94},{80,20},{50,20},{50,9.79685e-16},{39.6978,1.10218}}, color={0,0,191}));
          connect(ID0.y,Id.InPort1) annotation(Line(visible=true, points={{20,-17.6},{20,-28}}, color={0,0,191}));
          connect(Tdev1.T,ID0.Tdev) annotation(Line(visible=true, points={{-20,-60},{-10,-60},{-10,9.4369e-16},{0,2.4}}, color={0,0,191}));
          if cardinality(heatPort) <= 1 then
            Sw1.control=false;

          else
            Sw1.control=true;
          end if;
          connect(RS1.p,p) annotation(Line(points={{-80,0},{-100,0}}, color={0,0,255}));
          connect(RS1.n,Id.p) annotation(Line(points={{-40,0},{-20,0},{-20,-40},{0,-40}}, color={0,0,255}));
          connect(Id.n,n) annotation(Line(points={{40,-40},{70,-40},{70,0},{100,0}}, color={0,0,255}));
          connect(Tdev1.port,RS1.heatPort) annotation(Line(points={{-40,-60},{-40,-20},{-60,-20},{-60,-10}}, color={191,0,0}));
          connect(Sw1.p,RS1.heatPort) annotation(Line(points={{-60,-29},{-60,-10}}, color={191,0,0}));
          connect(Sw1.n2,heatPort) annotation(Line(points={{-60,-51},{-60,-80},{0,-80},{0,-100}}, color={191,0,0}));
          connect(T_nom.port,Sw1.n1) annotation(Line(points={{-79,-80},{-72,-80},{-72,-51},{-65,-51}}, color={191,0,0}));
        end D;

        package Types
          type DIODElevel= Modelica.Icons.TypeInteger(min=1, max=3) "DIODE modeling level" annotation(preferedView="text", Evaluate=true, choices(choice=1 "1: Non-geometric junction diode", choice=2 "2: Fowler-Nordheim diode", choice=3 "3: Geometric junction diode"));
          type DIODEtype= Modelica.Icons.TypeReal(min=0) "DIODE type" annotation(preferedView="text", Evaluate=true, choices(choice=2 "2: Schottky barrier diode", choice=3 "3: pn-junction"));
          type EnforceCapacitor= Modelica.Icons.TypeBoolean "Selection of capacitive state variables" annotation(preferedView="text", Evaluate=true, choices(choice=true "true: Select (external) electrical capacitive voltage as state variable", choice=false "false: Select (internal) bond graph capacitive effort as state variable"));
          annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}));
        end Types;

        package Utilities "Utility models of Spice circuit element models"
          annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,-100},{80,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Polygon(points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}, lineColor={191,0,0}, fillColor={235,235,235}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-85,35},{65,-85}}, textString="Library", fillColor={191,0,0}),Text(lineColor={0,0,255}, extent={{-120,122},{120,73}}, textString="%name", fillColor={255,0,0})}), Documentation(info="<html>
This package contains some utility models used within the Spice-style circuit element models.
</html>
"));
          model Gj "Spice-style leakage conductance model"
            extends BondLib.Electrical.Analog.Interfaces.OnePort;
            parameter Modelica.SIunits.Conductance GminDC=1e-16 "Leakage conductance";
            parameter Real Area=1 "Relative area occupied by device";
            parameter Integer Level=2 "Transistor modeling level (Ebers-Moll = 1; Gummel-Poon = 2)";
          protected 
            BondLib.Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=0.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            BondLib.Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=0.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=0.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            BondLib.Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=-24, scale=0.12, rotation=-450)));
            BondLib.Spice.Utilities.Gj Gj1(GminDC=GminDC, Area=Area, Level=Level) annotation(Placement(visible=true, transformation(x=1.77636e-15, y=-46.3304, scale=0.1, aspectRatio=1, rotation=-90)));
          equation 
            connect(Gj1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{1.77636e-15,-36.3304},{1.77636e-15,-36},{3.67382e-15,-36}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,-12},{0,-12.24},{-3.60034e-15,-12.24}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,0},{-12,0}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,0},{12.26,0}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,1.77636e-15},{-38,0},{-37.74,0}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,0},{38,1.77636e-15}}, color={192,192,192}));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-40,86},{40,56}}, textString="%name"),Rectangle(extent={{-70,30},{70,-30}}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(color={0,0,255}, points={{-90,0},{-70,0}}),Line(color={0,0,255}, points={{70,0},{90,0}}),Text(lineColor={0,0,255}, extent={{-50,-40},{46,-80}}, fillColor={0,0,0}, textString="G=%GminDC")}), Documentation(info="<html>
The Spice-style leakage conductance model is a conductive source without temperature variation.  The <b>Level</b> parameter is used to acknowledge the additional <b>Area</b> parameter of the Gummel-Poon transistor model. No heat port is needed here, as the model is used only as a mathematical construct to compute the currents of the non-linear current sources. The heat generation is accounted for in the non-linear sources. <p>
 
<hr> <p>
 
<pre>
Parameters:
 
 GminDC:   Leakage conductance (default value = 1e-16 Mho)
 
 Area:     Relative area occupied by resistor (default value = 1)
 
 Level:    Transistor modeling level (Ebers-Moll = 1; Gummel-Poon = 2) (default value = 2)
</pre>
</html>
"));
            connect(El2BG1.p,p) annotation(Line(points={{-62,1.77636e-15},{-80,1.77636e-15},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,1.77636e-15},{80,1.77636e-15},{80,0},{100,0}}, color={0,0,255}));
          end Gj;

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

          model CjD "Spice-style junction capacitor model for DIODEs"
            extends Interfaces.SpiceTwoPort;
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
            parameter Boolean enforceStates=true "Use electrical variables as states instead of bond graph variables" annotation(Dialog(tab="Advanced"));
            Basic.VCV VCV1(gain=1) annotation(Placement(transformation(x=13.0, y=0.0, scale=0.13, aspectRatio=1.69230769230769, flipHorizontal=true, flipVertical=true, rotation=180.0)));
            Sensors.CurrentSensor Id annotation(Placement(transformation(x=42.0, y=30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=true, rotation=0.0)));
            Basic.Ground Gnd1 annotation(Placement(transformation(x=60.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Modelica.Thermal.HeatTransfer.TemperatureSensor Tdev1 annotation(Placement(transformation(x=-30.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            BondLib.Spice.Utilities.nlCD nlCD1(Level=Level, Tnom=Tnom, Area=Area, PJ=PJ, M=M, IS=IS, JS=JS, N=N, TT=TT, PB=PB, PHP=PHP, CJ=CJ, CJ2=CJ2, MJ=MJ, CJSW=CJSW, CJSW2=CJSW2, MJSW=MJSW, FC=FC, GminDC=GminDC, EG=EG, XTI=XTI, TTT1=TTT1, TTT2=TTT2, ISW=ISW, JSW=JSW, TOX=TOX, L=L, W=W, LP=LP, WP=WP, XP=XP, XOI=XOI, LM=LM, WM=WM, XM=XM, XOM=XOM, EMin=EMin, EMax=EMax) annotation(Placement(transformation(x=-50.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
            Modelica.Blocks.Interfaces.RealOutput id(redeclare type SignalType= Modelica.SIunits.Current ) "Diode current" annotation(Placement(transformation(x=0.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0), iconTransformation(x=0.0, y=110.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=-90.0)));
            BondLib.Electrical.Analog.Semiconductors.Utilities.VariableCapacitor2 VarC1(u0=0, enforceStates=false) annotation(Placement(visible=true, transformation(x=-80, y=2.22045e-16, scale=0.1, aspectRatio=1, rotation=-90)));
            Sensors.VoltageSensor Vd annotation(Placement(visible=true, transformation(x=-19, y=0, scale=0.13, aspectRatio=0.923077, rotation=-90)));
            BondLib.Electrical.Analog.Spice.Utilities.Gj Gj1(GminDC=GminDC, Area=Area, Level=Level) annotation(Placement(visible=true, transformation(x=80, y=-5.55112e-16, scale=0.1, rotation=-90)));
            BondLib.Electrical.Analog.Spice.Utilities.DjD DjD1(Tnom=Tnom, Level=Level, Area=Area, PJ=PJ, M=M, IS=IS, JS=JS, N=N, EG=EG, XTI=XTI, BV=BV, IBV=IBV, ISW=ISW, JSW=JSW, TCV=TCV, TOX=TOX, L=L, W=W, JF=JF, JR=JR, EF=EF, ER=ER, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=60, y=-1.9984e-15, scale=0.1, rotation=-90)));
          equation 
            connect(DjD1.n,Gnd1.p) annotation(Line(visible=true, points={{60,-10},{60,-30}}, color={0,0,255}));
            connect(Id.n,DjD1.p) annotation(Line(visible=true, points={{52,30},{60,30},{60,10}}, color={0,0,255}));
            connect(DjD1.heatPort,Tdev1.port) annotation(Line(visible=true, points={{50,-1.9984e-15},{46,-1.22461e-15},{46,0},{40,0},{40,-70},{-20,-70}}, color={191,0,0}));
            connect(DjD1.p,Gj1.p) annotation(Line(visible=true, points={{60,10},{60,30},{80,30},{80,10}}, color={0,0,255}));
            connect(Gj1.n,Gnd1.p) annotation(Line(visible=true, points={{80,-10},{80,-25.9988},{60,-25.9988},{60,-30}}, color={0,0,255}));
            connect(VarC1.n,Vd.n) annotation(Line(visible=true, points={{-80,-10},{-80,-30},{-19,-30},{-19,-13}}, color={0,0,255}));
            connect(VarC1.p,Vd.p) annotation(Line(visible=true, points={{-80,10},{-80,30},{-19,30},{-19,13}}, color={0,0,255}));
            connect(nlCD1.u,Vd.V) annotation(Line(visible=true, points={{-38,0},{-37,0},{-37,-7.34764e-16},{-31,0}}, color={0,0,191}));
            connect(VCV1.n1,Vd.n) annotation(Line(visible=true, points={{-1.77636e-15,-11},{0,-30},{-19,-30},{-19,-13}}, color={0,0,255}));
            connect(VCV1.p1,Vd.p) annotation(Line(visible=true, points={{1.77636e-15,11},{0,30},{-19,30},{-19,13}}, color={0,0,255}));
            connect(VarC1.n,n) annotation(Line(visible=true, points={{-80,-10},{-80,-50},{92,-50},{92,0},{100,0}}, color={0,0,255}));
            connect(VarC1.p,p) annotation(Line(visible=true, points={{-80,10},{-80,30},{-92,30},{-92,0},{-100,0}}, color={0,0,255}));
            connect(VarC1.u,nlCD1.y) annotation(Line(visible=true, points={{-71,2.22045e-16},{-64.5,1.10215e-15},{-64.5,0},{-61,0}}, color={0,0,191}));
            connect(VCV1.n2,Gnd1.p) annotation(Line(points={{26,-11},{26,-30},{60,-30}}, color={0,0,255}));
            connect(Tdev1.port,heatPort) annotation(Line(points={{-20,-70},{0,-70},{0,-100}}, color={191,0,0}));
            connect(Id.p,VCV1.p2) annotation(Line(points={{32,30},{26,30},{26,11}}, color={0,0,255}));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,20},{-30,-20},{30,0}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={255,255,255}),Line(points={{30,20},{30,-20}}, color={128,128,128}),Line(color={0,0,255}, points={{14,0},{90,0}}),Line(color={0,0,255}, points={{14,28},{14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-14,28},{-14,-28}}, thickness=0.5),Line(color={0,0,255}, points={{-90,0},{-14,0}}),Line(points={{0,-28},{0,-91}}, color={191,0,0})}), Documentation(info="<html>
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
 
 TTT1:    Linear temperature coefficient of transit time (default value = 0 1/K)
 
 TTT2:    Quadratic temperature coefficient of transit time (default value = 0 1/K2)
 
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
            connect(Tdev1.T,nlCD1.Tdev) annotation(Line(points={{-40,-70},{-50,-70},{-50,-10}}, color={0,0,191}));
            connect(Id.I,id) annotation(Line(points={{42,40},{42,70},{0,70},{0,110}}, color={0,0,191}));
          end CjD;

          model DjD "Spice-style DIODE model"
            extends Interfaces.SpiceTwoPort;
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
            Junctions.J1p3 J1p3_1 annotation(Placement(transformation(x=0.0, y=40.0, scale=0.12, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B1 annotation(Placement(transformation(x=-25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B2 annotation(Placement(transformation(x=25.0, y=40.0, scale=0.13, aspectRatio=0.923076923076923, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.El2BG El2BG1 annotation(Placement(transformation(x=-50.0, y=40.0, scale=0.12, aspectRatio=1.16666666666667, flipHorizontal=false, flipVertical=false)));
            BondLib.Electrical.Analog.Interfaces.BG2El BG2El1 annotation(Placement(transformation(x=51.0, y=40.0, scale=0.13, aspectRatio=1.07692307692308, flipHorizontal=false, flipVertical=false)));
            Bonds.Bond B3 annotation(Placement(visible=true, transformation(x=0, y=16, scale=0.12, rotation=-450)));
            BondLib.Bonds.eBond B4 annotation(Placement(visible=true, transformation(x=0, y=-44, scale=0.12, rotation=-90)));
            Thermal.HeatTransfer.Interfaces.BG2Heat BG2Heat1 annotation(Placement(visible=true, transformation(x=0, y=-68, scale=0.12, rotation=-90)));
            BondLib.Spice.Utilities.DjD DjD1(Tnom=Tnom, Level=Level, Area=Area, PJ=PJ, M=M, IS=IS, JS=JS, N=N, EG=EG, XTI=XTI, BV=BV, IBV=IBV, ISW=ISW, JSW=JSW, TCV=TCV, TOX=TOX, L=L, W=W, JF=JF, JR=JR, EF=EF, ER=ER, EMin=EMin, EMax=EMax) annotation(Placement(visible=true, transformation(x=1.33227e-15, y=-13.685, scale=0.1, rotation=-90)));
          equation 
            connect(DjD1.BondCon1,B3.BondCon2) annotation(Line(visible=true, points={{1.33227e-15,-3.685},{3.67382e-15,4}}, color={192,192,192}));
            connect(DjD1.BondCon2,B4.fBondCon1) annotation(Line(visible=true, points={{1.33227e-15,-23.685},{6.12303e-16,-37},{-7.34764e-16,-37},{0,-32}}, color={192,192,192}));
            connect(BG2Heat1.port_b,heatPort) annotation(Line(visible=true, points={{0,-80},{7.34764e-16,-86},{0,-86},{0,-100}}, color={191,0,0}));
            connect(BG2Heat1.BondCon1,B4.eBondCon1) annotation(Line(visible=true, points={{0,-56},{0,-56}}, color={192,192,192}));
            connect(J1p3_1.BondCon3,B3.BondCon1) annotation(Line(visible=true, points={{0,28},{0,27.76},{-3.60034e-15,27.76}}, color={192,192,192}));
            connect(B1.BondCon2,J1p3_1.BondCon1) annotation(Line(points={{-12,40},{-12,40}}, color={192,192,192}));
            connect(J1p3_1.BondCon2,B2.BondCon1) annotation(Line(points={{12,40},{12.26,40}}, color={192,192,192}));
            connect(El2BG1.BondCon1,B1.BondCon1) annotation(Line(points={{-38,40},{-37.74,40}}, color={192,192,192}));
            connect(B2.BondCon2,BG2El1.BondCon1) annotation(Line(points={{38,40},{38,40}}, color={192,192,192}));
            annotation(Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{-30,0}}),Line(color={0,0,255}, points={{30,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(points={{0,-20},{0,-91}}, color={191,0,0})}), Documentation(info="<html>
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
            connect(El2BG1.p,p) annotation(Line(points={{-62,40},{-80,40},{-80,0},{-100,0}}, color={0,0,255}));
            connect(BG2El1.n,n) annotation(Line(points={{64,40},{80,40},{80,0},{100,0}}, color={0,0,255}));
          end DjD;

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
      model OneWayRectifier "One-way rectifier circuit"
        output Modelica.SIunits.Voltage vout "Output voltage";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-99.85,100.65},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={160,160,160}),Text(lineColor={0,0,255}, extent={{-33.85,54.65},{36,26}}, fillColor={0,0,0}, lineThickness=0.5, textString="One-way"),Text(lineColor={0,0,255}, extent={{-58,32},{58,-2}}, fillColor={0,0,0}, lineThickness=0.5, textString="rectifier circuit"),Text(lineColor={0,0,255}, extent={{-96,8},{94,-30}}, fillColor={0,0,0}, lineThickness=0.5, textString="using Spice-style diode")}), Diagram, experiment(StopTime=0.005), experimentSetupOutput, Documentation(info="<html>
This circuit demonstrates the use of the Spice-style DIODE model in a simple one-way rectifier circuit. <p>

Simulate the model across 0.005 seconds and plot the output voltage.
</html>
"));
        Electrical.Analog.Sources.SineVoltage V0(V=10, phase=0, freqHz=1000, offset=0, startTime=0) annotation(Placement(transformation(x=-70.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false, rotation=90.0)));
        Electrical.Analog.Spice.L L1(Tnom=300.15, L=0.015, TL1=0, TL2=0) annotation(Placement(transformation(x=-50.0, y=30.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Basic.Ground Gnd1 annotation(Placement(transformation(x=-20.0, y=-40.0, scale=0.1, aspectRatio=1.0, flipHorizontal=false, flipVertical=false)));
        Electrical.Analog.Sensors.VoltageSensor Vout annotation(Placement(transformation(x=80.0, y=0.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false, rotation=90.0)));
        Thermal.HeatTransfer.Sources.FixedTemperature FixedTemperature1(T=300.15) annotation(Placement(transformation(x=30.0, y=-70.0, scale=0.1, aspectRatio=1.0, flipHorizontal=true, flipVertical=false)));
        Electrical.Analog.Spice.C C1(Tnom=300.15, C=5e-05, TC1=0, TC2=0, Area=1) annotation(Placement(visible=true, transformation(x=20, y=0, scale=0.1, rotation=-90)));
        Electrical.Analog.Spice.R R1(Tnom=300.15, R=125, TR1=0.005, TR2=0.005, Area=1) annotation(Placement(visible=true, transformation(x=50, y=0, scale=0.1, rotation=-90)));
        Electrical.Analog.Spice.D D1(Tnom=300.15, Level=1, IS=1e-14, RS=5, N=1, TT=1e-09, CJ=5e-13, PB=0.75, MJ=0.33, EG=1.11, XTI=3, FC=0.5, BV=0, IBV=0, TRS=0.005, TCV=0, TTT1=0, TTT2=0, ISW=0, CJSW=0, PHP=0.75, MJSW=0.33, TOX=1e-07, GminDC=1e-16, Area=1, PJ=1, EMin=-100, EMax=40) annotation(Placement(visible=true, transformation(x=-10, y=30, scale=0.1)));
      equation 
        connect(R1.p,Vout.p) annotation(Line(visible=true, points={{50,10},{50,30},{80,30},{80,10}}, color={0,0,255}));
        connect(D1.p,L1.n) annotation(Line(visible=true, points={{-20,30},{-40,30}}, color={0,0,255}));
        connect(D1.n,C1.p) annotation(Line(visible=true, points={{0,30},{20,30},{20,10}}, color={0,0,255}));
        connect(D1.heatPort,C1.heatPort) annotation(Line(visible=true, points={{-10,20},{-10,-6.12303e-16},{10,0}}, color={191,0,0}));
        connect(V0.n,Gnd1.p) annotation(Line(visible=true, points={{-70,10},{-70,-30},{-20,-30}}, color={0,0,255}));
        connect(Vout.n,R1.n) annotation(Line(visible=true, points={{80,-10},{80,-30},{50,-30},{50,-10}}, color={0,0,255}));
        connect(R1.heatPort,C1.heatPort) annotation(Line(visible=true, points={{40,0},{40,-20},{0,-20},{0,-6.12303e-16},{10,0}}, color={191,0,0}));
        connect(R1.n,C1.n) annotation(Line(visible=true, points={{50,-10},{50,-30},{20,-30},{20,-10}}, color={0,0,255}));
        connect(R1.p,C1.p) annotation(Line(visible=true, points={{50,10},{50,30},{20,30},{20,10}}, color={0,0,255}));
        connect(L1.heatPort,C1.heatPort) annotation(Line(visible=true, points={{-50,20},{-50,-6.12303e-16},{10,0}}, color={191,0,0}));
        connect(FixedTemperature1.port,C1.heatPort) annotation(Line(visible=true, points={{19,-70},{0,-70},{0,-6.12303e-16},{10,0}}, color={191,0,0}));
        connect(C1.n,Gnd1.p) annotation(Line(visible=true, points={{20,-10},{20,-30},{-20,-30}}, color={0,0,255}));
        vout=Vout.v;
        connect(L1.p,V0.p) annotation(Line(points={{-60,30},{-70,30},{-70,10}}, color={0,0,255}));
      end OneWayRectifier;

    end ModelicaSpice;

  end Examples;

end BondLib;




model BondLib_Examples_ModelicaSpice_OneWayRectifier
  extends BondLib.Examples.ModelicaSpice.OneWayRectifier;
end BondLib_Examples_ModelicaSpice_OneWayRectifier;



