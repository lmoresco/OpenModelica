within Modelica.Electrical.Analog;
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
  model PotentialSensor "Sensor to measure the potential"
    extends Modelica.Icons.RotationalSensor;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{100,0},{70,0}}, color={0,0,255})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="V", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{100,0},{70,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p "pin to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput phi(redeclare type SignalType= SI.ElectricPotential ) "Absolute voltage potential as output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    p.i=0;
    phi=p.v;
  end PotentialSensor;

  model VoltageSensor "Sensor to measure the voltage between two pins"
    extends Modelica.Icons.RotationalSensor;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{96,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="V", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p "positive pin" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n "negative pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput v(redeclare type SignalType= SI.Voltage ) "Voltage between pin p and n (= p.v - n.v) as output signal" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90)));
  equation 
    p.i=0;
    n.i=0;
    v=p.v - n.v;
  end VoltageSensor;

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

  model PowerSensor "Sensor to measure the power"
    annotation(uses(Modelica(version="2.2")), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html><p>
This power sensor measures instantaneous electrical power of a singlephase system and has a separated voltage and current path. The pins of the voltage path are <code>pv</code> and <code>nv</code>, the pins of the current path are <code>pc</code> and <code>nc</code>. The internal resistance of the current path is zero, the internal resistance of the voltage path is infinite.
</p>
</html>", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> January 12, 2006   </i>
       by Anton Haumer<br> implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem()), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,100},{0,70}}, color={0,0,255}),Line(visible=true, points={{0,-70},{0,-100}}, color={0,0,255}),Line(visible=true, points={{-80,-100},{-80,0}}, color={0,0,255}),Line(visible=true, points={{-100,0},{100,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,119.7},{150,159.7}}, textString="%name", fontName="Arial"),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}}),Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="P", fontName="Arial")}));
    Modelica.Electrical.Analog.Interfaces.PositivePin pc "Positive pin, current path" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin nc "Negative pin, current path" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.PositivePin pv "Positive pin, voltage path" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,10},{10,-10}}, rotation=0), iconTransformation(origin={0,100}, extent={{-10,10},{10,-10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin nv "Negative pin, voltage path" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{10,-10},{-10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Math.Product product annotation(Placement(visible=true, transformation(origin={-30,-50}, extent={{-10,-10},{10,10}}, rotation=-450)));
    Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor annotation(Placement(visible=true, transformation(origin={0,-30}, extent={{10,10},{-10,-10}}, rotation=-270)));
    Modelica.Blocks.Interfaces.RealOutput power(redeclare type SignalType= Modelica.SIunits.Power ) annotation(Placement(visible=true, transformation(origin={-80,-110}, extent={{10,-10},{-10,10}}, rotation=-450), iconTransformation(origin={-80,-110}, extent={{10,-10},{-10,10}}, rotation=-450)));
  equation 
    connect(currentSensor.n,nc) annotation(Line(visible=true, points={{-30,0},{100,0}}, color={0,0,255}));
    connect(pc,currentSensor.p) annotation(Line(visible=true, points={{-100,0},{-50,0}}, color={0,0,255}));
    connect(currentSensor.i,product.u2) annotation(Line(visible=true, points={{-40,-10},{-40,-30},{-36,-30},{-36,-38}}, color={0,0,191}));
    connect(pv,voltageSensor.p) annotation(Line(visible=true, points={{0,100},{0,-20},{0,-20}}, color={0,0,255}));
    connect(voltageSensor.n,nv) annotation(Line(visible=true, points={{0,-40},{-6.123e-16,-63},{0,-63},{0,-100}}, color={0,0,255}));
    connect(voltageSensor.v,product.u1) annotation(Line(visible=true, points={{-10,-30},{-24,-30},{-24,-38}}, color={0,0,191}));
    connect(product.y,power) annotation(Line(visible=true, points={{-30,-61},{-30,-80},{-80,-80},{-80,-110}}, color={0,0,191}));
  end PowerSensor;

end Sensors;
