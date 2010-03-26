within Modelica.Blocks;
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
  encapsulated package UnitConversions
    import Modelica;
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    block ConvertAllUnits "Convert signal to a signal with different unit"
      replaceable block ConversionBlock= Modelica.Blocks.Interfaces.PartialConversionBlock "Conversion block" annotation(choicesAllMatching=true, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends ConversionBlock;
      annotation(defaultComponentName="convert", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{30,0}}, color={191,0,0}),Polygon(visible=true, lineColor={191,0,0}, fillColor={191,0,0}, fillPattern=FillPattern.Solid, points={{90,0},{30,20},{30,-20},{90,0}})}), Documentation(info="<html>
<p>This block implements the Modelica.SIunits.Conversions functions as a fixed causality block to
simplify their use. The block contains a replaceable block class <b>ConversionBlock</b> that can be
changed to be any of the blocks defined in Modelica.Blocks.Math.UnitConversions, and more generally, any
blocks that extend from Modelica.Blocks.Interfaces.PartialConversionBlock.</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end ConvertAllUnits;

    block To_degC "Convert from Kelvin to °Celsius"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="K"), y(unit="degC"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="K", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="°C", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_degC(u);
    end To_degC;

    block From_degC "Convert from °Celsius to Kelvin"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="degC"), y(unit="K"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="°C", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="K", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_degC(u);
    end From_degC;

    block To_degF "Convert from Kelvin to °Fahrenheit"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="K"), y(unit="degF"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="K", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="°F", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_degF(u);
    end To_degF;

    block From_degF "Convert from °Fahrenheit to Kelvin"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="degF"), y(unit="K"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="°F", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="K", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_degF(u);
    end From_degF;

    block To_degRk "Convert from Kelvin to °Rankine"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="K"), y(unit="degRk"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="K", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="°Rk", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_degRk(u);
    end To_degRk;

    block From_degRk "Convert from °Rankine to Kelvin"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="degRk"), y(unit="K"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="°Rk", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="K", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_degRk(u);
    end From_degRk;

    block To_deg "Convert from radian to degree"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="rad"), y(unit="deg"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="rad", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="deg", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_deg(u);
    end To_deg;

    block From_deg "Convert from degree to radian"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="deg"), y(unit="rad"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="deg", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="rad", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_deg(u);
    end From_deg;

    block To_rpm "Convert from radian per second to revolutions per minute"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="rad/s"), y(unit="rev/min"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-98,50},{26,82}}, textString="rad/s", fontName="Arial"),Text(visible=true, extent={{-62,-74},{100,-42}}, textString="rev/min", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_rpm(u);
    end To_rpm;

    block From_rpm "Convert from revolutions per minute to radian per second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="rev/min"), y(unit="rad/s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-94,56},{50,84}}, textString="rev/min", fontName="Arial"),Text(visible=true, extent={{-26,-74},{94,-42}}, textString="rad/s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_rpm(u);
    end From_rpm;

    block To_kmh "Convert from metre per second to kilometre per hour"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="m/s"), y(unit="km/h"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-96,42},{0,82}}, textString="m/s", fontName="Arial"),Text(visible=true, extent={{-14,-84},{92,-40}}, textString="km/h", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_kmh(u);
    end To_kmh;

    block From_kmh "Convert from kilometre per hour to metre per second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="km/h"), y(unit="m/s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-96,48},{26,80}}, textString="km/h", fontName="Arial"),Text(visible=true, extent={{-20,-82},{92,-46}}, textString="m/s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_kmh(u);
    end From_kmh;

    block To_day "Convert from second to day"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="s"), y(unit="d"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="s", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="day", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_day(u);
    end To_day;

    block From_day "Convert from day to second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="d"), y(unit="s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="day", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_day(u);
    end From_day;

    block To_hour "Convert from second to hour"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="s"), y(unit="h"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="s", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="hour", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_hour(u);
    end To_hour;

    block From_hour "Convert from hour to second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="h"), y(unit="s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="hour", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_hour(u);
    end From_hour;

    block To_minute "Convert from second to minute"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="s"), y(unit="min"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="s", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="minute", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_minute(u);
    end To_minute;

    block From_minute "Convert from minute to second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="min"), y(unit="s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="minute", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_minute(u);
    end From_minute;

    block To_litre "Convert from cubic metre to litre"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="m3"), y(unit="l"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="m3", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="litre", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_litre(u);
    end To_litre;

    block From_litre "Convert from litre to cubic metre"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="l"), y(unit="m3"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="litre", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="m3", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_litre(u);
    end From_litre;

    block To_kWh "Convert from Joule to kilo Watt hour"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="J"), y(unit="kWh"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="J", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="kWh", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_kWh(u);
    end To_kWh;

    block From_kWh "Convert from kilo Watt hour to Joule"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="kWh"), y(unit="J"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="kWh", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="J", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_kWh(u);
    end From_kWh;

    block To_bar "Convert from Pascal to bar"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="Pa"), y(unit="bar"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="Pa", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="bar", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_bar(u);
    end To_bar;

    block From_bar "Convert from bar to Pascal"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="bar"), y(unit="Pa"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="bar", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="Pa", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_bar(u);
    end From_bar;

    block To_gps "Convert from kilogram per second to gram per second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="kg/s"), y(unit="g/s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="kg/s", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="g/s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.to_gps(u);
    end To_gps;

    block From_gps "Convert from gram per second to kilogram per second"
      extends Modelica.Blocks.Interfaces.PartialConversionBlock(u(unit="g/s"), y(unit="kg/s"));
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,20},{-20,100}}, textString="g/s", fontName="Arial"),Text(visible=true, extent={{20,-100},{100,-20}}, textString="kg/s", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      y=SI.Conversions.from_gps(u);
    end From_gps;

    annotation(Documentation(info="<html>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end UnitConversions;

  block TwoInputs "Change causality of input signals by defining that two input signals are identical (e.g. for inverse models)"
    extends Blocks.Interfaces.BlockIcon;
    annotation(structurallyIncomplete, Documentation(info="<HTML>
<p>
This block is used to enable asignment of values to variables preliminary
defined as outputs (e.g. useful for inverse model generation).
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,191}, extent={{-95,-50},{95,50}}, textString="=", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u1 "Connector of first Real input signal" annotation(Placement(visible=true, transformation(origin={-119.871,0.4978}, extent={{-19.871,-19.5022},{19.871,19.5022}}, rotation=0), iconTransformation(origin={-119.871,0.4978}, extent={{-19.871,-19.5022},{19.871,19.5022}}, rotation=0)));
    Blocks.Interfaces.RealInput u2 "Connector of second Real input signal (u1=u2)" annotation(Placement(visible=true, transformation(origin={120,0}, extent={{-20,-20},{20,20}}, rotation=-180), iconTransformation(origin={120,0}, extent={{-20,-20},{20,20}}, rotation=-180)));
  equation 
    u1=u2;
  end TwoInputs;

  block TwoOutputs "Change causality of output signals by defining that two output signals are identical (e.g. for inverse models)"
    extends Blocks.Interfaces.BlockIcon;
    annotation(structurallyIncomplete, Documentation(info="
<HTML>
<p>
This block is used to enable calculation of values preliminary defined as inputs.
(e.g. useful for inverse model generation).
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,191}, extent={{-95,-50},{95,50}}, textString="=", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    output Blocks.Interfaces.RealOutput y1 "Connector of first Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    output Blocks.Interfaces.RealOutput y2 "Connector of second Real output signal (y1=y2)" annotation(Placement(visible=true, transformation(origin={-110.365,-0.90289}, extent={{-10.0005,-10},{10.0005,10}}, rotation=-180), iconTransformation(origin={-110.365,-0.90289}, extent={{-10.0005,-10},{10.0005,10}}, rotation=-180)));
  equation 
    y1=y2;
  end TwoOutputs;

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

  block MatrixGain "Output the product of a gain matrix with the input signal vector"
    parameter Real K[:,:]=[1,0;0,1] "Gain matrix which is multiplied with the input";
    extends Interfaces.MIMO(final nin=size(K, 2), final nout=size(K, 1));
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes output vector <b>y</b> as <i>product</i> of the
gain matrix <b>K</b> with the input signal vector <b>u</b>:
</p>
<pre>
    <b>y</b> = <b>K</b> * <b>u</b>;
</pre>
<p>
Example:
</p>
<pre>
   parameter: <b>K</b> = [0.12 2; 3 1.5]
   results in the following equations:
     | y[1] |     | 0.12  2.00 |   | u[1] |
     |      |  =  |            | * |      |
     | y[2] |     | 3.00  1.50 |   | u[2] |
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-60},{90,60}}, textString="*K", fontName="Arial"),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={160,160,160}, extent={{-90,-60},{90,60}}, textString="*K", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=K*u;
  end MatrixGain;

  block Sum "Output the sum of the elements of the input vector"
    extends Interfaces.MISO;
    parameter Real k[nin]=ones(nin) "Optional: sum coefficients";
    annotation(defaultComponentName="sum1", Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as
<i>sum</i> of the elements of the input signal vector
<b>u</b>:
</p>
<pre>
    <b>y</b> = <b>u</b>[1] + <b>u</b>[2] + ...;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   nin = 3;
  results in the following equations:
     y = u[1] + u[2] + u[3];
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}}),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{26,42},{-34,42},{6,2},{-34,-38},{26,-38}})}));
  equation 
    y=k*u;
  end Sum;

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

  block Add3 "Output the sum of the three inputs"
    extends Interfaces.BlockIcon;
    parameter Real k1=+1 "Gain of upper input";
    parameter Real k2=+1 "Gain of middle input";
    parameter Real k3=+1 "Gain of lower input";
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes output <b>y</b> as <i>sum</i> of the
three input signals <b>u1</b>, <b>u2</b> and <b>u3</b>:
</p>
<pre>
    <b>y</b> = k1*<b>u1</b> + k2*<b>u2</b> + k3*<b>u3</b>;
</pre>
<p>
Example:
</p>
<pre>
     parameter:   k1= +2, k2= -3, k3=1;
  results in the following equations:
     y = 2 * u1 - 3 * u2 + u3;
</pre>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,50},{5,90}}, textString="%k1", fontName="Arial"),Text(visible=true, extent={{-100,-20},{5,20}}, textString="%k2", fontName="Arial"),Text(visible=true, extent={{-100,-90},{5,-50}}, textString="%k3", fontName="Arial"),Text(visible=true, extent={{2,-44},{100,36}}, textString="+", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-100,50},{5,90}}, textString="%k1", fontName="Arial"),Text(visible=true, extent={{-100,-20},{5,20}}, textString="%k2", fontName="Arial"),Text(visible=true, extent={{-100,-90},{5,-50}}, textString="%k3", fontName="Arial"),Text(visible=true, extent={{2,-44},{100,36}}, textString="+", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-100,50},{5,90}}, textString="k1", fontName="Arial"),Text(visible=true, extent={{-100,-20},{5,20}}, textString="k2", fontName="Arial"),Text(visible=true, extent={{-100,-90},{5,-50}}, textString="k3", fontName="Arial"),Text(visible=true, extent={{2,-44},{100,36}}, textString="+", fontName="Arial")}));
    input Interfaces.RealInput u1 "Connector 1 of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0)));
    input Interfaces.RealInput u2 "Connector 2 of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    input Interfaces.RealInput u3 "Connector 3 of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
    output Interfaces.RealOutput y "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=k1*u1 + k2*u2 + k3*u3;
  end Add3;

  block Product "Output product of the two inputs"
    extends Interfaces.SI2SO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <i>product</i> of the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 * u2;
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,60},{-40,60},{-30,40}}, color={0,0,191}),Line(visible=true, points={{-100,-60},{-40,-60},{-30,-40}}, color={0,0,191}),Line(visible=true, points={{50,0},{100,0}}, color={0,0,191}),Line(visible=true, points={{-30,0},{30,0}}),Line(visible=true, points={{-15,25.99},{15,-25.99}}),Line(visible=true, points={{-15,-25.99},{15,25.99}}),Ellipse(visible=true, lineColor={0,0,191}, extent={{-50,-50},{50,50}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{-100,60},{-40,60},{-30,40}}),Line(visible=true, points={{-100,-60},{-40,-60},{-30,-40}}),Line(visible=true, points={{50,0},{100,0}}),Line(visible=true, points={{-30,0},{30,0}}),Line(visible=true, points={{-15,25.99},{15,-25.99}}),Line(visible=true, points={{-15,-25.99},{15,25.99}}),Ellipse(visible=true, extent={{-50,-50},{50,50}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=u1*u2;
  end Product;

  block Division "Output first input divided by second input"
    extends Interfaces.SI2SO;
    annotation(Documentation(info="
<HTML>
<p>
This block computes the output <b>y</b> (element-wise)
by <i>dividing</i> the corresponding elements of
the two inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>
    y = u1 / u2;
</pre>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{50,0},{100,0}}, color={0,0,191}),Line(visible=true, points={{-30,0},{30,0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,20},{5,30}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-30},{5,-20}}),Ellipse(visible=true, lineColor={0,0,191}, extent={{-50,-50},{50,50}}),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-100,60},{-66,60},{-40,30}}, color={0,0,191}),Line(visible=true, points={{-100,-60},{0,-60},{0,-50}}, color={0,0,191})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{50,0},{100,0}}),Line(visible=true, points={{-30,0},{30,0}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,20},{5,30}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-30},{5,-20}}),Ellipse(visible=true, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-100,60},{-66,60},{-40,30}}),Line(visible=true, points={{-100,-60},{0,-60},{0,-50}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=u1/u2;
  end Division;

  block Abs "Output the absolute value of the input"
    extends Interfaces.SISO;
    annotation(defaultComponentName="abs1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{92,0},{70,8},{70,-8},{92,0}}),Line(visible=true, points={{-80,80},{0,0},{80,80}}),Line(visible=true, points={{0,-14},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={192,192,192}, extent={{-34,-76},{38,-28}}, textString="abs", fontName="Arial"),Line(visible=true, points={{-88,0},{76,0}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,0},{76,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{92,0},{76,6},{76,-6},{92,0}}),Line(visible=true, points={{-80,80},{0,0},{80,80}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={160,160,160}, extent={{7,78},{34,98}}, textString="u", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{74,-28},{96,-8}}, textString="y", fontName="Arial"),Text(visible=true, extent={{52,-23},{72,-3}}, textString="1", fontName="Arial"),Text(visible=true, extent={{-86,-21},{-66,-1}}, textString="-1", fontName="Arial"),Text(visible=true, extent={{-28,59},{-8,79}}, textString="1", fontName="Arial")}), Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <i>absolute value</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>abs</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=abs(u);
  end Abs;

  block Sign "Output the sign of the input"
    extends Interfaces.SISO;
    annotation(defaultComponentName="sign1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,-80},{0,-80}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Text(visible=true, fillColor={192,192,192}, extent={{-90,24},{-18,72}}, textString="sign", fontName="Arial"),Line(visible=true, points={{0,80},{80,80}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-2,-4},{2,2}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,-80},{0,-80}}),Line(visible=true, points={{-0.01,0},{0.01,0}}),Line(visible=true, points={{0,80},{80,80}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-2,-4},{2,2}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{7,82},{32,102}}, textString="y", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{70,-26},{94,-6}}, textString="u", fontName="Arial"),Text(visible=true, extent={{-25,70},{-5,86}}, textString="1", fontName="Arial"),Text(visible=true, extent={{5,-88},{25,-72}}, textString="-1", fontName="Arial")}), Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <b>sign</b> of the input <b>u</b>:
</p>
<pre>
         1  <b>if</b> u > 0
    y =  0  <b>if</b> u == 0
        -1  <b>if</b> u < 0
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=sign(u);
  end Sign;

  block Sqrt "Output the square root of the input (input >= 0 required)"
    extends Interfaces.SISO;
    annotation(defaultComponentName="sqrt1", Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <i>square root</i> of the input <b>u</b>:
</p>
<pre>
    y = sqrt( u );
</pre>
<p>
All elements of the input vector shall be zero or positive.
Otherwise an error occurs.
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,-80},{68,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80},{68,-72},{68,-88},{90,-80}}),Line(visible=true, points={{-80,-80},{-79.2,-68.7},{-78.4,-64},{-76.8,-57.3},{-73.6,-47.9},{-67.9,-36.1},{-59.1,-22.2},{-46.2,-6.49},{-28.5,10.7},{-4.42,30},{27.7,51.3},{69.5,74.7},{80,80}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-88},{-80,68}}, color={192,192,192}),Text(visible=true, fillColor={192,192,192}, extent={{-8,-52},{64,-4}}, textString="sqrt", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-92,-80},{84,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-80},{84,-74},{84,-86},{100,-80}}),Line(visible=true, points={{-80,-80},{-79.2,-68.7},{-78.4,-64},{-76.8,-57.3},{-73.6,-47.9},{-67.9,-36.1},{-59.1,-22.2},{-46.2,-6.49},{-28.5,10.7},{-4.42,30},{27.7,51.3},{69.5,74.7},{80,80}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,98},{-86,82},{-74,82},{-80,98}}),Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{-71,78},{-44,98}}, textString="y", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{60,-72},{84,-52}}, textString="u", fontName="Arial")}));
  equation 
    y=sqrt(u);
  end Sqrt;

  block Sin "Output the sine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <b>sine</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>sin</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{-75,78},{-46,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,96},{-86,80},{-74,80},{-80,96}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-105,72},{-85,88}}, textString="1", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="2*pi", fontName="Arial"),Text(visible=true, extent={{-105,-88},{-85,-72}}, textString="-1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{76,-30},{98,-10}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Text(visible=true, fillColor={192,192,192}, extent={{12,36},{84,84}}, textString="sin", fontName="Arial")}));
  equation 
    y=Modelica.Math.sin(u);
  end Sin;

  block Cos "Output the cosine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <b>cos</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>cos</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{-75,82},{-48,102}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Text(visible=true, extent={{-103,72},{-83,88}}, textString="1", fontName="Arial"),Text(visible=true, extent={{-79,-88},{-59,-72}}, textString="-1", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="2*pi", fontName="Arial"),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},{24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,73.4},{75.2,78.6},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{74,-24},{98,-4}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},{24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,73.4},{75.2,78.6},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={192,192,192}, extent={{-36,34},{36,82}}, textString="cos", fontName="Arial")}));
  equation 
    y=Modelica.Math.cos(u);
  end Cos;

  block Tan "Output the tangent of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise)
as <b>tan</b> of the input <b>u</b>:
</p>
<pre>
    y = <b>tan</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-88},{0,86}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{11,80},{38,100}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,102},{-6,86},{6,86},{0,102}}),Text(visible=true, extent={{-37,-88},{-17,-72}}, textString="-5.8", fontName="Arial"),Text(visible=true, extent={{-33,70},{-13,86}}, textString=" 5.8", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="1.4", fontName="Arial"),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-78.4,-68.4},{-76.8,-59.7},{-74.4,-50},{-71.2,-40.9},{-67.1,-33},{-60.7,-24.8},{-51.1,-17.2},{-35.8,-9.98},{-4.42,-1.07},{33.4,9.12},{49.4,16.2},{59.1,23.2},{65.5,30.6},{70.4,39.1},{73.6,47.4},{76,56.1},{77.6,63.8},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{70,-26},{94,-6}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-78.4,-68.4},{-76.8,-59.7},{-74.4,-50},{-71.2,-40.9},{-67.1,-33},{-60.7,-24.8},{-51.1,-17.2},{-35.8,-9.98},{-4.42,-1.07},{33.4,9.12},{49.4,16.2},{59.1,23.2},{65.5,30.6},{70.4,39.1},{73.6,47.4},{76,56.1},{77.6,63.8},{80,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Text(visible=true, fillColor={192,192,192}, extent={{-90,24},{-18,72}}, textString="tan", fontName="Arial")}));
  equation 
    y=Modelica.Math.tan(u);
  end Tan;

  block Asin "Output the arc sine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>sine-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>asin</b>( u );
</pre>
<p>
The absolute values of the elements of the input <b>u</b> need to
be less or equal to one (<b>abs</b>( u ) <= 1).
Otherwise an error occurs.
</p>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{9,82},{36,102}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Text(visible=true, extent={{-40,-88},{-15,-72}}, textString="-pi/2", fontName="Arial"),Text(visible=true, extent={{-38,72},{-13,88}}, textString=" pi/2", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="+1", fontName="Arial"),Text(visible=true, extent={{-90,1},{-70,21}}, textString="-1", fontName="Arial"),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{74,-26},{100,-4}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{75.2,62.2},{77.6,67.5},{80,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Text(visible=true, fillColor={192,192,192}, extent={{-88,30},{-16,78}}, textString="asin", fontName="Arial")}));
  equation 
    y=Modelica.Math.asin(u);
  end Asin;

  block Acos "Output the arc cosine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>cosine-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>acos</b>( u );
</pre>
<p>
The absolute values of the elements of the input <b>u</b> need to
be less or equal to one (<b>abs</b>( u ) <= 1).
Otherwise an error occurs.
</p>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{13,82},{42,100}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,-80},{84,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-80},{84,-74},{84,-86},{100,-80}}),Line(visible=true, points={{-80,80},{-79.2,72.8},{-77.6,67.5},{-73.6,59.4},{-66.3,49.8},{-53.5,37.3},{-30.2,19.7},{37.4,-24.8},{57.5,-40.8},{68.7,-52.7},{75.2,-62.2},{77.6,-67.5},{80,-80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-30,72},{-5,88}}, textString=" pi", fontName="Arial"),Text(visible=true, extent={{-94,-77},{-74,-57}}, textString="-1", fontName="Arial"),Text(visible=true, extent={{80,-65},{100,-45}}, textString="+1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{76,-102},{102,-84}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{-80,80},{-79.2,72.8},{-77.6,67.5},{-73.6,59.4},{-66.3,49.8},{-53.5,37.3},{-30.2,19.7},{37.4,-24.8},{57.5,-40.8},{68.7,-52.7},{75.2,-62.2},{77.6,-67.5},{80,-80}}, smooth=Smooth.Bezier),Line(visible=true, points={{0,-88},{0,68}}, color={192,192,192}),Line(visible=true, points={{-90,-80},{68,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80},{68,-72},{68,-88},{90,-80}}),Text(visible=true, fillColor={192,192,192}, extent={{-86,-62},{-14,-14}}, textString="acos", fontName="Arial")}));
  equation 
    y=Modelica.Math.acos(u);
  end Acos;

  block Atan "Output the arc tangent of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>tangent-inverse</i> of the input <b>u</b>:
</p>
<pre>
    y= <b>atan</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{13,82},{42,102}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-52.7,-75.2},{-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},{-14.1,-45.8},{-10.1,-36.4},{-6.03,-23.9},{-1.21,-5.06},{5.23,21},{9.25,34.1},{13.3,44.2},{18.1,52.9},{24.5,60.8},{33.4,67.6},{47,73.6},{69.5,78.6},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-32,71},{-12,91}}, textString="1.4", fontName="Arial"),Text(visible=true, extent={{-32,-91},{-12,-71}}, textString="-1.4", fontName="Arial"),Text(visible=true, extent={{73,10},{93,26}}, textString=" 5.8", fontName="Arial"),Text(visible=true, extent={{-103,4},{-83,20}}, textString="-5.8", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{66,-28},{94,-8}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-52.7,-75.2},{-37.4,-69.7},{-26.9,-63},{-19.7,-55.2},{-14.1,-45.8},{-10.1,-36.4},{-6.03,-23.9},{-1.21,-5.06},{5.23,21},{9.25,34.1},{13.3,44.2},{18.1,52.9},{24.5,60.8},{33.4,67.6},{47,73.6},{69.5,78.6},{80,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Text(visible=true, fillColor={192,192,192}, extent={{-86,20},{-14,68}}, textString="atan", fontName="Arial")}));
  equation 
    y=Modelica.Math.atan(u);
  end Atan;

  block Atan2 "Output atan(u1/u2) of the inputs u1 and u2"
    extends Interfaces.SI2SO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>tangent-inverse</i> of the input <b>u1</b> divided by
input <b>u2</b>:
</p>
<pre>
    y = <b>atan2</b>( u1, u2 );
</pre>
<p>
u1 and u2 shall not be zero at the same time instant.
<b>Atan2</b> uses the sign of u1 and u2 in order to construct
the solution in the range -180 deg &le; y &le; 180 deg, whereas
block <b>Atan</b> gives a solution in the range
-90 deg &le; y &le; 90 deg.
</p>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{11,78},{42,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{69.9,-45.8},{80,-45.1}}, smooth=Smooth.Bezier),Line(visible=true, points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,-14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{62.1,33.5},{80,34.9}}, smooth=Smooth.Bezier),Line(visible=true, points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},{-1.82,77.2},{0,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-30,70},{-10,89}}, textString="pi", fontName="Arial"),Text(visible=true, extent={{-30,-88},{-10,-69}}, textString="-pi", fontName="Arial"),Text(visible=true, extent={{-30,30},{-10,49}}, textString="pi/2", fontName="Arial"),Line(visible=true, points={{0,40},{-8,40}}, color={192,192,192}),Line(visible=true, points={{0,-40},{-8,-40}}, color={192,192,192}),Text(visible=true, extent={{-30,-50},{-10,-31}}, textString="-pi/2", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{48,-34},{100,0}}, textString="u1 / u2", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,-14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{62.1,33.5},{80,34.9}}, smooth=Smooth.Bezier),Line(visible=true, points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},{-1.82,77.2},{0,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{69.9,-45.8},{80,-45.1}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={192,192,192}, extent={{-90,-94},{-18,-46}}, textString="atan2", fontName="Arial")}));
  equation 
    y=Modelica.Math.atan2(u1, u2);
  end Atan2;

  block Sinh "Output the hyperbolic sine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>hyperbolic sine</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>sinh</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{9,78},{34,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-76,-65.4},{-71.2,-51.4},{-65.5,-38.8},{-59.1,-28.1},{-51.1,-18.7},{-41.4,-11.4},{-27.7,-5.5},{-4.42,-0.65},{24.5,4.57},{39,10.1},{49.4,17.2},{57.5,25.9},{63.9,35.8},{69.5,47.4},{74.4,60.4},{78.4,73.8},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-31,72},{-11,88}}, textString="27", fontName="Arial"),Text(visible=true, extent={{-35,-88},{-15,-72}}, textString="-27", fontName="Arial"),Text(visible=true, extent={{70,5},{90,25}}, textString="4", fontName="Arial"),Text(visible=true, extent={{-98,1},{-78,21}}, textString="-4", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{72,-26},{96,-6}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={192,192,192}, extent={{-86,32},{-14,80}}, textString="sinh", fontName="Arial"),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-76,-65.4},{-71.2,-51.4},{-65.5,-38.8},{-59.1,-28.1},{-51.1,-18.7},{-41.4,-11.4},{-27.7,-5.5},{-4.42,-0.65},{24.5,4.57},{39,10.1},{49.4,17.2},{57.5,25.9},{63.9,35.8},{69.5,47.4},{74.4,60.4},{78.4,73.8},{80,80}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}})}));
  equation 
    y=Modelica.Math.sinh(u);
  end Sinh;

  block Cosh "Output the hyperbolic cosine of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>hyperbolic cosine</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>cosh</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{11,78},{38,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,-86.08},{84,-86.08}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-86.08},{84,-80.08},{84,-92.08},{100,-86.08}}),Line(visible=true, points={{-80,80},{-77.6,61.1},{-74.4,39.3},{-71.2,20.7},{-67.1,1.29},{-63.1,-14.6},{-58.3,-29.8},{-52.7,-43.5},{-46.2,-55.1},{-39,-64.3},{-30.2,-71.7},{-18.9,-77.1},{-4.42,-79.9},{10.9,-79.1},{23.7,-75.2},{34.2,-68.7},{42.2,-60.6},{48.6,-51.2},{54.3,-40},{59.1,-27.5},{63.1,-14.6},{67.1,1.29},{71.2,20.7},{74.4,39.3},{77.6,61.1},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-31,72},{-11,88}}, textString="27", fontName="Arial"),Text(visible=true, extent={{62,-87},{82,-67}}, textString="4", fontName="Arial"),Text(visible=true, extent={{-104,-83},{-84,-63}}, textString="-4", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{78,-74},{100,-54}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Text(visible=true, fillColor={192,192,192}, extent={{4,20},{66,66}}, textString="cosh", fontName="Arial"),Line(visible=true, points={{-80,80},{-77.6,61.1},{-74.4,39.3},{-71.2,20.7},{-67.1,1.29},{-63.1,-14.6},{-58.3,-29.8},{-52.7,-43.5},{-46.2,-55.1},{-39,-64.3},{-30.2,-71.7},{-18.9,-77.1},{-4.42,-79.9},{10.9,-79.1},{23.7,-75.2},{34.2,-68.7},{42.2,-60.6},{48.6,-51.2},{54.3,-40},{59.1,-27.5},{63.1,-14.6},{67.1,1.29},{71.2,20.7},{74.4,39.3},{77.6,61.1},{80,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{-90,-86.08},{68,-86.08}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-86.08},{68,-78.08},{68,-94.08},{90,-86.08}})}));
  equation 
    y=Modelica.Math.cosh(u);
  end Cosh;

  block Tanh "Output the hyperbolic tangent of the input"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>hyperbolic tangent</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>tanh</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{9,80},{42,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-47.8,-78.7},{-35.8,-75.7},{-27.7,-70.6},{-22.1,-64.2},{-17.3,-55.9},{-12.5,-44.3},{-7.64,-29.2},{-1.21,-4.82},{6.83,26.3},{11.7,42},{16.5,54.2},{21.3,63.1},{26.9,69.9},{34.2,75},{45.4,78.4},{72,79.9},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{70,5},{90,25}}, textString="4", fontName="Arial"),Text(visible=true, extent={{-106,1},{-86,21}}, textString="-4", fontName="Arial"),Text(visible=true, extent={{-29,72},{-9,88}}, textString="1", fontName="Arial"),Text(visible=true, extent={{3,-88},{23,-72}}, textString="-1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{72,-26},{98,-8}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-47.8,-78.7},{-35.8,-75.7},{-27.7,-70.6},{-22.1,-64.2},{-17.3,-55.9},{-12.5,-44.3},{-7.64,-29.2},{-1.21,-4.82},{6.83,26.3},{11.7,42},{16.5,54.2},{21.3,63.1},{26.9,69.9},{34.2,75},{45.4,78.4},{72,79.9},{80,80}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={192,192,192}, extent={{-88,24},{-16,72}}, textString="tanh", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}})}));
  equation 
    y=Modelica.Math.tanh(u);
  end Tanh;

  block Exp "Output the exponential (base e) of the input"
    extends Interfaces.SISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-80},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Text(visible=true, fillColor={192,192,192}, extent={{-86,2},{-14,50}}, textString="exp", fontName="Arial"),Line(visible=true, points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}),Line(visible=true, points={{-90,-80.3976},{68,-80.3976}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-80.3976},{68,-72.3976},{68,-88.3976},{90,-80.3976}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,80},{-8,80}}, color={192,192,192}),Line(visible=true, points={{0,-80},{-8,-80}}, color={192,192,192}),Line(visible=true, points={{0,-90},{0,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{9,80},{40,100}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,100},{-6,84},{6,84},{0,100}}),Line(visible=true, points={{-100,-80.3976},{84,-80.3976}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-80.3976},{84,-74.3976},{84,-86.3976},{100,-80.3976}}),Line(visible=true, points={{-80,-80},{-31,-77.9},{-6.03,-74},{10.9,-68.4},{23.7,-61},{34.2,-51.6},{43,-40.3},{50.3,-27.8},{56.7,-13.5},{62.3,2.23},{67.1,18.6},{72,38.2},{76,57.6},{80,80}}),Text(visible=true, extent={{-31,72},{-11,88}}, textString="20", fontName="Arial"),Text(visible=true, extent={{-92,-103},{-72,-83}}, textString="-3", fontName="Arial"),Text(visible=true, extent={{70,-103},{90,-83}}, textString="3", fontName="Arial"),Text(visible=true, extent={{-18,-73},{2,-53}}, textString="1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{66,-72},{96,-52}}, textString="u", fontName="Arial")}), Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>exponential</i> (of base e) of the input <b>u</b>:
</p>
<pre>
    y = <b>exp</b>( u );
</pre>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  equation 
    y=Modelica.Math.exp(u);
  end Exp;

  block Log "Output the natural (base e) logarithm of the input (input > 0 required)"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>natural (base e) logarithm</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>log</b>( u );
</pre>
<p>
An error occurs if the elements of the input <b>u</b> are
zero or negative.
</p>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{-67,80},{-40,98}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{-105,72},{-85,88}}, textString="3", fontName="Arial"),Text(visible=true, extent={{-109,-88},{-89,-72}}, textString="-3", fontName="Arial"),Text(visible=true, extent={{70,-23},{90,-3}}, textString="20", fontName="Arial"),Text(visible=true, extent={{-78,-21},{-58,-1}}, textString="1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{68,8},{94,28}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=Smooth.Bezier),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Text(visible=true, fillColor={192,192,192}, extent={{-6,-72},{66,-24}}, textString="log", fontName="Arial")}));
  equation 
    y=Modelica.Math.log(u);
  end Log;

  block Log10 "Output the base 10 logarithm of the input (input > 0 required)"
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
This blocks computes the output <b>y</b> (element-wise) as the
<i>base 10 logarithm</i> of the input <b>u</b>:
</p>
<pre>
    y = <b>log10</b>( u );
</pre>
<p>
An error occurs if the elements of the input <b>u</b> are
zero or negative.
</p>

</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Text(visible=true, fillColor={160,160,160}, extent={{-65,78},{-38,96}}, textString="y", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-79.8,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=Smooth.Bezier),Text(visible=true, extent={{70,-23},{90,-3}}, textString="20", fontName="Arial"),Text(visible=true, extent={{-78,-21},{-58,-1}}, textString="1", fontName="Arial"),Text(visible=true, extent={{-109,72},{-89,88}}, textString=" 1.3", fontName="Arial"),Text(visible=true, extent={{-109,-88},{-89,-72}}, textString="-1.3", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{62,10},{90,30}}, textString="u", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,8},{68,-8},{90,0}}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Line(visible=true, points={{-79.8,-80},{-79.2,-50.6},{-78.4,-37},{-77.6,-28},{-76.8,-21.3},{-75.2,-11.4},{-72.8,-1.31},{-69.5,8.08},{-64.7,17.9},{-57.5,28},{-47,38.1},{-31.8,48.1},{-10.1,58},{22.1,68},{68.7,78.1},{80,80}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-80},{-80,68}}, color={192,192,192}),Text(visible=true, fillColor={192,192,192}, extent={{-30,-70},{60,-22}}, textString="log10", fontName="Arial")}));
  equation 
    y=Modelica.Math.log10(u);
  end Log10;

  block RealToInteger "Convert Real to Integer signal"
    extends Interfaces.IntegerBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,-60},{0,60}}, textString="R", fontName="Arial"),Text(visible=true, fillColor={255,127,0}, extent={{20,-60},{120,60}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={255,127,0}, fillColor={255,127,0}, fillPattern=FillPattern.Solid, points={{50,0},{30,20},{30,10},{0,10},{0,-10},{30,-10},{30,-20},{50,0}})}), Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>nearest integer value</i> of the input <b>u</b>:
</p>
<pre>    y = <b>integer</b>( <b>floor</b>( u + 0.5 ) )  for  u &gt; 0;
    y = <b>integer</b>( <b>ceil </b>( u - 0.5 ) )  for  u &lt; 0;
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Interfaces.RealInput u "Connector of Real input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.IntegerOutput y "Connector of Integer output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=if u > 0 then integer(floor(u + 0.5)) else integer(ceil(u - 0.5));
  end RealToInteger;

  block IntegerToReal "Convert integer to real signals"
    extends Interfaces.BlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={255,127,0}, extent={{-120,-60},{-20,60}}, textString="I", fontName="Arial"),Text(visible=true, extent={{0,-60},{100,60}}, textString="R", fontName="Arial"),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{10,0},{-10,20},{-10,10},{-40,10},{-40,-10},{-10,-10},{-10,-20},{10,0}})}), Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Real equivalent</i> of the Integer input <b>u</b>:
</p>
<pre>    y = u;
</pre>
<p>where <b>u</b> is of Integer and <b>y</b> of Real type.</p>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Interfaces.IntegerInput u "Connector of Integer input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=u;
  end IntegerToReal;

  block BooleanToReal "Convert Boolean to Real signal"
    extends Interfaces.partialBooleanSI;
    parameter Real realTrue=1.0 "Output signal for true Boolean input";
    parameter Real realFalse=0.0 "Output signal for false Boolean input";
    annotation(Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Real equivalent</i> of the Boolean input <b>u</b>:
</p>
<pre>    y = <b>if</b> u <b>then</b> realTrue <b>else</b> realFalse;
</pre>
<p>where <b>u</b> is of Boolean and <b>y</b> of Real type,
and <b>realTrue</b> and <b>realFalse</b> are parameters.
</p>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={255,0,255}, extent={{-86,10},{-6,92}}, textString="B", fontName="Arial"),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},{-32,-66},{-12,-46}}),Text(visible=true, extent={{8,-94},{92,-4}}, textString="R", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=if u then realTrue else realFalse;
  end BooleanToReal;

  block BooleanToInteger "Convert Boolean to Integer signal"
    extends Interfaces.partialBooleanSI;
    parameter Integer integerTrue=1 "Output signal for true Boolean input";
    parameter Integer integerFalse=0 "Output signal for false Boolean input";
    annotation(Documentation(info="<html>
<p>
This block computes the output <b>y</b>
as <i>Integer equivalent</i> of the Boolean input <b>u</b>:
</p>
<pre>    y = <b>if</b> u <b>then</b> integerTrue <b>else</b> integerFalse;
</pre>
<p>where <b>u</b> is of Boolean and <b>y</b> of Integer type,
and <b>integerTrue</b> and <b>integerFalse</b> are parameters.
</p>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={255,0,255}, extent={{-86,10},{-6,92}}, textString="B", fontName="Arial"),Polygon(visible=true, lineColor={255,191,127}, fillColor={255,191,127}, fillPattern=FillPattern.Solid, points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},{-32,-66},{-12,-46}}),Text(visible=true, fillColor={255,191,127}, extent={{8,-94},{92,-4}}, textString="I", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.IntegerOutput y "Connector of Integer output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=if u then integerTrue else integerFalse;
  end BooleanToInteger;

  block RealToBoolean "Convert Real to Boolean signal"
    extends Interfaces.partialBooleanSO;
    parameter Real threshold=0.5 "Output signal y is true, if input u >= threshold";
    annotation(Documentation(info="<html>
<p>
This block computes the Boolean output <b>y</b>
from the Real input <b> u</b> by the equation:
</p>

<pre>    y = u &ge; threshold;
</pre>

<p>
where <b>threshold</b> is a parameter.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, extent={{-86,10},{-6,92}}, textString="R", fontName="Arial"),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},{-32,-66},{-12,-46}}),Text(visible=true, fillColor={255,0,255}, extent={{8,-94},{92,-4}}, textString="B", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u "Connector of Real input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
  equation 
    y=u >= threshold;
  end RealToBoolean;

  block IntegerToBoolean "Convert Integer to Boolean signal"
    extends Interfaces.partialBooleanSO;
    parameter Integer threshold=1 "Output signal y is true, if input u >= threshold";
    annotation(Documentation(info="<html>
<p>
This block computes the Boolean output <b>y</b>
from the Integer input <b> u</b> by the equation:
</p>

<pre>    y = u &ge; threshold;
</pre>

<p>
where <b>threshold</b> is a parameter.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={255,127,0}, extent={{-86,10},{-6,92}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-12,-46},{-32,-26},{-32,-36},{-64,-36},{-64,-56},{-32,-56},{-32,-66},{-12,-46}}),Text(visible=true, fillColor={255,0,255}, extent={{8,-94},{92,-4}}, textString="B", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.IntegerInput u "Connector of Integer input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
  equation 
    y=u >= threshold;
  end IntegerToBoolean;

  block Max "Pass through the largest signal"
    extends Interfaces.SI2SO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-36},{90,36}}, textString="max()", fontName="Arial")}), Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>maximum</i>
of the two Real inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>    y = <b>max</b> ( u1 , u2 );
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=max(u1, u2);
  end Max;

  block Min "Pass through the smallest signal"
    extends Interfaces.SI2SO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-36},{90,36}}, textString="min()", fontName="Arial")}), Documentation(info="<html>
<p>
This block computes the output <b>y</b> as <i>minimum</i> of
the two Real inputs <b>u1</b> and <b>u2</b>:
</p>
<pre>    y = <b>min</b> ( u1 , u2 );
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=min(u1, u2);
  end Min;

  block Edge "Indicates rising edge of boolean signal"
    extends Interfaces.BooleanSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-36},{90,36}}, textString="edge()", fontName="Arial")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true,
when the Boolean input <b>u</b> shows a <i>rising edge</i>:
</p>
<pre>    y = <b>edge</b>( u );
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=edge(u);
  end Edge;

  block BooleanChange "Indicates boolean signal changing"
    extends Interfaces.BooleanSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-36},{90,36}}, textString="change()", fontName="Arial")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true, when the
Boolean input <b>u</b> shows a <i>rising or falling edge</i>,
i.e., when the signal changes:
</p>
<pre>    y = <b>change</b>( u );
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=change(u);
  end BooleanChange;

  block IntegerChange "Indicates integer signal changing"
    extends Interfaces.IntegerSIBooleanSO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={160,160,160}, extent={{-90,-36},{90,36}}, textString="change()", fontName="Arial")}), Documentation(info="<html>
<p>
This block sets the Boolean output <b>y</b> to true, when the
Integer input <b>u</b> changes:
</p>
<pre>    y = <b>change</b>( u );
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=change(u);
  end IntegerChange;

end Math;
