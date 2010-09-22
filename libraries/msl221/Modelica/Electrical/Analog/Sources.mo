within Modelica.Electrical.Analog;
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

  model ConstantVoltage "Source for constant voltage"
    parameter SI.Voltage V=1 "Value of constant voltage";
    extends Interfaces.OnePort;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-10,0}}),Line(visible=true, points={{-10,60},{-10,-60}}),Line(visible=true, points={{0,30},{0,-30}}),Line(visible=true, points={{0,0},{90,0}})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-10,0}}),Line(visible=true, points={{-10,60},{-10,-60}}),Line(visible=true, points={{0,30},{0,-30}}),Line(visible=true, points={{0,0},{90,0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-120},{100,-80}}, textString="%name=%V", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-120,0},{-20,50}}, textString="+", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{20,0},{120,50}}, textString="-", fontName="Arial")}));
  equation 
    v=V;
  end ConstantVoltage;

  model StepVoltage "Step voltage source"
    parameter SI.Voltage V=1 "Height of step";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Step signalSource(height=V) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,-70},{0,-70},{0,70},{69,70}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-18},{0,-18},{0,50},{80,50}}, thickness=0.5),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-21,-90},{25,-72}}, textString="startTime", fontName="Arial"),Line(visible=true, points={{0,-17},{0,-71}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-68,-54},{-22,-36}}, textString="offset", fontName="Arial"),Line(visible=true, points={{-13,50},{-13,-17}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, pattern=LinePattern.Dash, points={{2,50},{-19,50},{2,50}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,50},{-16,37},{-9,37},{-13,50}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-68,8},{-22,26}}, textString="V", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}),Line(visible=true, points={{-13,-18},{-13,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-67,67},{-2,93}}, textString="v = p.v - n.v", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end StepVoltage;

  model RampVoltage "Ramp voltage source"
    parameter SI.Voltage V=1 "Height of ramp";
    parameter SI.Time duration(min=Modelica.Constants.small)=2 "Duration of ramp";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Ramp signalSource(final height=V, final duration=duration) );
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-20},{-20,-20},{50,50}}, thickness=0.5),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-20},{-42,-30},{-37,-30},{-40,-20}}),Line(visible=true, points={{-40,-20},{-40,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-80,-49},{-41,-33}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-40,-88},{6,-70}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-67,67},{-2,93}}, textString="v = p.v - n.v", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-20,-20},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-19,-20},{50,-20}}, color={192,192,192}),Line(visible=true, points={{50,50},{101,50}}, thickness=0.5),Line(visible=true, points={{50,50},{50,-20}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-20},{42,-18},{42,-22},{50,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,50},{48,40},{53,40},{50,50}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{53,7},{82,25}}, textString="V", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{0,-37},{35,-17}}, textString="duration", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-60},{-50,-60},{50,60},{80,60}}, color={192,192,192})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end RampVoltage;

  model SineVoltage "Sine voltage source"
    parameter SI.Voltage V=1 "Amplitude of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Frequency freqHz=1 "Frequency of sine wave";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Sine signalSource(amplitude=V, freqHz=freqHz, phase=phase) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{101,-40},{85,-34},{85,-46},{101,-40}}),Line(visible=true, points={{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.2,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, thickness=0.5, smooth=Smooth.Bezier),Line(visible=true, points={{-40.5,-2.22e-16},{-79.5,-2.22e-16}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-106,-29},{-60,-11}}, textString="offset", fontName="Arial"),Line(visible=true, points={{-41,-2},{-41,-40}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-60,-61},{-14,-43}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{84,-72},{108,-52}}, textString="time", fontName="Arial"),Line(visible=true, points={{-9,79},{43,79}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-42,-1},{50,0}}, color={192,192,192}, pattern=LinePattern.Dot),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,80},{30,67},{37,67},{33,80}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{37,39},{83,57}}, textString="V", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,1},{30,14},{36,14},{33,1},{33,1}}),Line(visible=true, points={{33,79},{33,0}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-70,82.5},{-5,108.5}}, textString="v = p.v - n.v", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-66,0},{-56.2,29.9},{-49.8,46.5},{-44.2,58.1},{-39.3,65.2},{-34.3,69.2},{-29.4,69.8},{-24.5,67},{-19.6,61},{-14.6,52},{-9,38.6},{-1.98,18.6},{12.79,-26.9},{19.1,-44},{24.8,-56.2},{29.7,-64},{34.6,-68.6},{39.5,-70},{44.5,-67.9},{49.4,-62.5},{54.3,-54.1},{59.9,-41.3},{67,-21.7},{74,0}}, color={192,192,192}, smooth=Smooth.Bezier)}));
  end SineVoltage;

  model ExpSineVoltage "Exponentially damped sine voltage source"
    parameter SI.Voltage V=1 "Amplitude of sine wave";
    parameter SI.Frequency freqHz=2 "Frequency of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Damping damping=1 "Damping coefficient of sine wave";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.ExpSine signalSource(amplitude=V, freqHz=freqHz, phase=phase, damping=damping) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{101,-40},{85,-34},{85,-46},{101,-40}}),Line(visible=true, points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},{-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{0.3,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},{56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,-12.1}}, thickness=0.5, smooth=Smooth.Bezier),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-19},{-55,1}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-72,-54},{-26,-36}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{84,-72},{108,-52}}, textString="time", fontName="Arial"),Line(visible=true, points={{-50,0},{18,0}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-50,0},{-81,0}}, thickness=0.5),Line(visible=true, points={{-50,77},{-50,0}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,-1},{18,76}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,73},{-50,73}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-42,74},{9,88}}, textString="1/freqHz", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-49,73},{-40,75},{-40,71},{-49,73}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{18,73},{10,75},{10,71},{18,73}}),Line(visible=true, points={{-50,-61},{-19,-61}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-51,-75},{-27,-63}}, textString="t", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-82,-96},{108,-67}}, textString="V*exp(-damping*t)*sin(2*pi*freqHz*t+phase)", fontName="Arial"),Line(visible=true, points={{-50,0},{-50,-40}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-50,-54},{-50,-72}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,-76},{-1,-48}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,92},{-38,105}}, textString="v = p.v - n.v", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-64,-14},{-59.2,18.3},{-56,36.3},{-52.7,50.5},{-49.5,60.2},{-46.3,65.3},{-43.1,65.6},{-39.9,61.3},{-36.7,53.1},{-32.6,38.2},{-27,11.8},{-19,-27.9},{-14.2,-47.7},{-10.1,-59.9},{-6.1,-67.2},{-2.1,-69.3},{1.9,-66.5},{5.9,-59.3},{10.77,-46.1},{24.44,-0.3},{29.3,12.4},{34.1,20.8},{38.1,24},{42.9,23.2},{47.8,17.8},{54.2,5.4},{67.1,-24.5},{73.5,-35.2},{79.1,-39.9},{84.7,-39.9},{91.2,-34.5},{96,-27.8}}, color={192,192,192}, smooth=Smooth.Bezier)}));
  end ExpSineVoltage;

  model ExponentialsVoltage " Rising and falling exponential voltage source"
    parameter Real vMax=1 "Upper bound for rising edge";
    parameter SI.Time riseTime(min=0)=0.5 "Rise time";
    parameter SI.Time riseTimeConst(min=Modelica.Constants.small)=0.1 "Rise time constant";
    parameter SI.Time fallTimeConst(min=Modelica.Constants.small)=riseTimeConst "Fall time constant";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Exponentials signalSource(outMax=vMax, riseTime=riseTime, riseTimeConst=riseTimeConst, fallTimeConst=fallTimeConst) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-70},{84,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-70},{84,-64},{84,-76},{100,-70}}),Line(visible=true, points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{27.9,99.2},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.61,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, thickness=0.5),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-70,71},{-29,91}}, textString="outPort", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-56},{-46,-43}}, textString="offset", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}),Line(visible=true, points={{-40,-29},{-40,-60}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-30},{-42,-40},{-37,-40},{-40,-30}}),Line(visible=true, points={{-39,-30},{-80,-30}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-59,-89},{-13,-71}}, textString="startTime", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-41,-30},{-32,-28},{-32,-32},{-41,-30}}),Line(visible=true, points={{-40,-30},{29,-30}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{29,-30},{21,-28},{21,-32},{29,-30}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-26,-28},{19,-12}}, textString="riseTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{78,-96},{102,-76}}, textString="time", fontName="Arial"),Line(visible=true, points={{-100,-70},{84,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-70},{84,-64},{84,-76},{100,-70}}),Line(visible=true, points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{30,100},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.61,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-70,71},{-29,91}}, textString="outPort", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-56},{-46,-43}}, textString="offset", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}),Line(visible=true, points={{-40,-29},{-40,-60}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-30},{-42,-40},{-37,-40},{-40,-30}}),Line(visible=true, points={{-39,-30},{-80,-30}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-59,-89},{-13,-71}}, textString="startTime", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-41,-30},{-32,-28},{-32,-32},{-41,-30}}),Line(visible=true, points={{-40,-30},{29,-30}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{29,-30},{21,-28},{21,-32},{29,-30}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-26,-28},{19,-12}}, textString="riseTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{78,-96},{102,-76}}, textString="time", fontName="Arial"),Line(visible=true, points={{30,100},{30,-34}}, color={192,192,192}, pattern=LinePattern.Dot)}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},{-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},{-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},{-6,71},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{4.61,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},{64,-54.4}}, color={192,192,192}, smooth=Smooth.Bezier)}));
  end ExponentialsVoltage;

  model PulseVoltage "Pulse voltage source"
    parameter SI.Voltage V=1 "Amplitude of pulse";
    parameter Real width(final min=Modelica.Constants.small, final max=100)=50 "Width of pulse in % of period";
    parameter SI.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Pulse signalSource(amplitude=V, width=width, period=period) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,-70},{-40,-70},{-40,70},{0,70},{0,-70},{40,-70},{40,70},{80,70}}, color={192,192,192})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,1},{-37,-12},{-30,-12},{-34,1}}),Line(visible=true, points={{-34,-1},{-34,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-33,-70},{-36,-57},{-30,-57},{-33,-70},{-33,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-36},{-35,-24}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-31,-87},{15,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-10,0},{-10,-70}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-80,0},{-21,0},{-21,50},{21,50},{21,0},{41,0},{41,50},{79.72,50}}, thickness=0.5),Line(visible=true, points={{-19,88},{-19,49}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{21,74},{21,50}}, color={160,160,160}, pattern=LinePattern.Dot),Line(visible=true, points={{41,88},{41,50}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-19,83},{42,83}}, color={192,192,192}),Line(visible=true, points={{-19,69},{21,69}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-9,85},{37,97}}, textString="period", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-18,69},{21,81}}, textString="width", fontName="Arial"),Line(visible=true, points={{-52,50},{-19,50}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-34,50},{-34,1}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,20},{-37,34}}, textString="V", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,49},{-37,36},{-30,36},{-34,49}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,1},{-37,14},{-31,14},{-34,1},{-34,1}}),Line(visible=true, points={{79.94,50.17},{79.94,8.882e-16},{90,8.882e-16}}, thickness=0.5),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-19,69},{-10,71},{-10,67},{-19,69}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{21,69},{13,71},{13,67},{21,69}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-19,83},{-10,85},{-10,81},{-19,83}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{41,83},{33,85},{33,81},{41,83}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,89},{-24,103}}, textString="v = p.v - n.v", fontName="Arial")}));
  end PulseVoltage;

  model SawToothVoltage "Saw tooth voltage source"
    parameter SI.Voltage V=1 "Amplitude of saw tooth";
    parameter SI.Time period=1 "Time for one period";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.SawTooth signalSource(amplitude=V, period=period) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-85,-70},{-65,-70},{-5,71},{-5,-70},{55,71},{55,-70}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-19},{-37,-32},{-30,-32},{-34,-19}}),Line(visible=true, points={{-34,-20},{-34,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-36},{-35,-24}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-31,-87},{15,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-10,-20},{-10,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,88},{-10,-20}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{30,88},{30,59}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,83},{30,83}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-12,85},{34,97}}, textString="period", fontName="Arial"),Line(visible=true, points={{-44,60},{30,60}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-34,47},{-34,-7}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,20},{-37,34}}, textString="V", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,60},{-37,47},{-30,47},{-34,60}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10,83},{-1,85},{-1,81},{-10,83}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{30,83},{22,85},{22,81},{30,83}}),Line(visible=true, points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,88},{-27,100}}, textString="v = p.v - n.v", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end SawToothVoltage;

  model TrapezoidVoltage "Trapezoidal voltage source"
    parameter SI.Voltage V=1 "Amplitude of trapezoid";
    parameter SI.Time rising(final min=0)=0 "Rising duration of trapezoid";
    parameter SI.Time width(final min=0)=0.5 "Width duration of trapezoid";
    parameter SI.Time falling(final min=0)=0 "Falling duration of trapezoid";
    parameter SI.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
    parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.Trapezoid signalSource(amplitude=V, rising=rising, width=width, falling=falling, period=period, nperiod=nperiod) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-81,-70},{-60,-70},{-30,70},{1,70},{30,-70},{51,-70},{80,70}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}}),Line(visible=true, points={{-45,-31},{-45,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-86,-55},{-43,-43}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-47,-87},{-1,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-30,81},{-30,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,59},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{20,59},{20,39}}, color={160,160,160}, pattern=LinePattern.Dash),Line(visible=true, points={{40,59},{40,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-29,56},{40,56}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-8,60},{21,70}}, textString="width", fontName="Arial"),Line(visible=true, points={{-42,40},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-39,40},{-39,-19}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,0},{-40,14}}, textString="V", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-29,56},{-22,58},{-22,54},{-29,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10,56},{-17,58},{-17,54},{-10,56}}),Line(visible=true, points={{-80,-30},{-30,-30},{-9,46},{21,46},{40,-30},{60,-30},{80,46},{100,46}}, thickness=0.5),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-39,40},{-41,29},{-37,29},{-39,40}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-39,-29},{-41,-19},{-37,-19},{-39,-29},{-39,-29}}),Line(visible=true, points={{60,81},{60,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{39,56},{32,58},{32,54},{39,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{20,56},{27,58},{27,54},{20,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{20,56},{13,58},{13,54},{20,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-12,56},{-5,58},{-5,54},{-12,56}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-34,60},{-5,70}}, textString="rising", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{16,60},{45,70}}, textString="falling", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,91},{-23,103}}, textString="v = p.v - n.v", fontName="Arial"),Line(visible=true, points={{-20,76},{61,76}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-29,76},{-20,78},{-20,74},{-29,76}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{61,76},{53,78},{53,74},{61,76}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-2,77},{25,86}}, textString="period", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end TrapezoidVoltage;

  model TableVoltage "Voltage source by linear interpolation in a table"
    parameter Real table[:,:]=[0,0;1,1;2,4] "Table matrix (time = first column, voltage = second column)";
    extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.TimeTable signalSource(table=table) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-58,-36},{-58,84},{42,84},{42,-36},{-58,-36},{-58,-6},{42,-6},{42,24},{-58,24},{-58,54},{42,54},{42,84},{-8,84},{-8,-37}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-30},{30,90}}),Line(visible=true, points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{30,90},{30,-31}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,-58},{-38,-42}}, textString="offset", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}),Line(visible=true, points={{-31,-31},{-31,-70}}, color={192,192,192}),Line(visible=true, points={{-20,-20},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-38,-88},{8,-70}}, textString="startTime", fontName="Arial"),Line(visible=true, points={{-20,-30},{-80,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{66,-93},{91,-81}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-15,68},{24,83}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{33,67},{76,83}}, textString="v", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-81,85},{-31,98}}, textString="v = p.v - n.v", fontName="Arial")}), Documentation(info="<HTML>
<p>
This block generates a voltage source by <b>linear interpolation</b> in
a table. The time points and voltage values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the voltage to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the voltage value is just returned independantly of the
    actual time instant, i.e., this is a constant voltage source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the voltage.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
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
            4 16]
If, e.g., time = 1.0, the voltage v =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the voltage v =  2.5,
    e.g., time = 2.0, the voltage v =  4.0,
    e.g., time = 5.0, the voltage v = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TableVoltage;

  model SignalCurrent "Generic current source using the input signal as source current"
    SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-96,0},{-50,0}}),Line(visible=true, points={{50,0},{96,0}}),Line(visible=true, points={{0,-50},{0,50}})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Martin Otter<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-90,0},{-50,0}}),Line(visible=true, points={{50,0},{90,0}}),Line(visible=true, points={{0,-50},{0,50}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-120},{100,-80}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-60,-70},{60,-70}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{60,-70},{30,-60},{30,-80},{60,-70}})}));
    Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n annotation(Placement(visible=true, transformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput i(redeclare type SignalType= SI.Current ) "Current flowing from pin p to pin n as input signal" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
  equation 
    v=p.v - n.v;
    0=p.i + n.i;
    i=p.i;
  end SignalCurrent;

  model ConstantCurrent "Source for constant current"
    parameter SI.Current I=1 "Value of constant current";
    extends Interfaces.OnePort;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-96,0},{-50,0}}),Line(visible=true, points={{50,0},{96,0}}),Line(visible=true, points={{0,-50},{0,50}})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-90,0},{-50,0}}),Line(visible=true, points={{50,0},{90,0}}),Line(visible=true, points={{0,-50},{0,50}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,80},{100,120}}, textString="%name=%I", fontName="Arial"),Line(visible=true, points={{-60,-80},{60,-80}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{60,-80},{30,-70},{30,-90},{60,-80}})}));
  equation 
    i=I;
  end ConstantCurrent;

  model StepCurrent "Step current source"
    parameter SI.Current I=1 "Height of step";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Step signalSource(height=I) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-86,-70},{-14,-70},{-14,70},{57,70}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-18},{0,-18},{0,50},{80,50}}, thickness=0.5),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-21,-90},{25,-72}}, textString="startTime", fontName="Arial"),Line(visible=true, points={{0,-17},{0,-71}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-68,-54},{-22,-36}}, textString="offset", fontName="Arial"),Line(visible=true, points={{-13,50},{-13,-17}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, pattern=LinePattern.Dash, points={{2,50},{-19,50},{2,50}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-17},{-16,-4},{-10,-4},{-13,-17},{-13,-17}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,50},{-16,37},{-9,37},{-13,50}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-68,8},{-22,26}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-69},{-16,-56},{-10,-56},{-13,-69},{-13,-69}}),Line(visible=true, points={{-13,-18},{-13,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-13,-18},{-16,-31},{-9,-31},{-13,-18}}),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end StepCurrent;

  model RampCurrent "Ramp current source"
    parameter SI.Current I=1 "Height of ramp";
    parameter SI.Time duration(min=Modelica.Constants.small)=2 "Duration of ramp";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Ramp signalSource(final height=I, final duration=duration) );
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-20},{-20,-20},{50,50}}, thickness=0.5),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-20},{-42,-30},{-37,-30},{-40,-20}}),Line(visible=true, points={{-40,-20},{-40,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-80,-49},{-41,-33}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-40,-88},{6,-70}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-20,-20},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-19,-20},{50,-20}}, color={192,192,192}),Line(visible=true, points={{50,50},{101,50}}, thickness=0.5),Line(visible=true, points={{50,50},{50,-20}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-20},{42,-18},{42,-22},{50,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-20,-20},{-11,-18},{-11,-22},{-20,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,50},{48,40},{53,40},{50,50}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-20},{47,-10},{52,-10},{50,-20},{50,-20}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{53,7},{82,25}}, textString="I", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{0,-37},{35,-17}}, textString="duration", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-60},{-50,-60},{50,60},{80,60}}, color={192,192,192})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end RampCurrent;

  model SineCurrent "Sine current source"
    parameter SI.Current I=1 "Amplitude of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Frequency freqHz=1 "Frequency of sine wave";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Sine signalSource(amplitude=I, freqHz=freqHz, phase=phase) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{101,-40},{85,-34},{85,-46},{101,-40}}),Line(visible=true, points={{-40,0},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},{-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.2,69.7},{4.02,59.4},{8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}}, thickness=0.5, smooth=Smooth.Bezier),Line(visible=true, points={{-40.5,0},{-79.5,0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-106,-29},{-60,-11}}, textString="offset", fontName="Arial"),Line(visible=true, points={{-41,-2},{-41,-40}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-60,-61},{-14,-43}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{84,-72},{108,-52}}, textString="time", fontName="Arial"),Line(visible=true, points={{-9,79},{43,79}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-42,-1},{50,0}}, color={192,192,192}, pattern=LinePattern.Dot),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,80},{30,67},{37,67},{33,80}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{37,39},{83,57}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{33,1},{30,14},{36,14},{33,1},{33,1}}),Line(visible=true, points={{33,79},{33,0}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,82},{-53,102}}, textString="i", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}}, color={192,192,192}, smooth=Smooth.Bezier)}));
  end SineCurrent;

  model ExpSineCurrent "Exponentially damped sine current source"
    parameter Real I=1 "Amplitude of sine wave";
    parameter SI.Frequency freqHz=2 "Frequency of sine wave";
    parameter SI.Angle phase=0 "Phase of sine wave";
    parameter SI.Damping damping=1 "Damping coefficient of sine wave";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.ExpSine signalSource(amplitude=I, freqHz=freqHz, phase=phase, damping=damping) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-14},{-75.2,18.3},{-72,36.3},{-68.7,50.5},{-65.5,60.2},{-62.3,65.3},{-59.1,65.6},{-55.9,61.3},{-52.7,53.1},{-48.6,38.2},{-43,11.8},{-35,-27.9},{-30.2,-47.7},{-26.1,-59.9},{-22.1,-67.2},{-18.1,-69.3},{-14.1,-66.5},{-10.1,-59.3},{-5.23,-46.1},{8.44,-0.3},{13.3,12.4},{18.1,20.8},{22.1,24},{26.9,23.2},{31.8,17.8},{38.2,5.4},{51.1,-24.5},{57.5,-35.2},{63.1,-39.9},{68.7,-39.9},{75.2,-34.5},{80,-27.8}}, color={192,192,192}, smooth=Smooth.Bezier)}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-90},{-80,84}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,100},{-86,84},{-74,84},{-80,100}}),Line(visible=true, points={{-99,-40},{85,-40}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{101,-40},{85,-34},{85,-46},{101,-40}}),Line(visible=true, points={{-50,0},{-46.1,28.2},{-43.5,44},{-40.9,56.4},{-38.2,64.9},{-35.6,69.4},{-33,69.6},{-30.4,65.9},{-27.8,58.7},{-24.5,45.7},{-19.9,22.5},{-13.4,-12.2},{-9.5,-29.5},{-6.23,-40.1},{-2.96,-46.5},{0.3,-48.4},{3.57,-45.9},{6.83,-39.6},{10.8,-28.1},{21.9,12},{25.8,23.1},{29.7,30.5},{33,33.3},{36.9,32.5},{40.8,27.8},{46,16.9},{56.5,-9.2},{61.7,-18.6},{66.3,-22.7},{70.9,-22.6},{76.1,-18},{80,-12.1}}, thickness=0.5, smooth=Smooth.Bezier),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-19},{-55,1}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-72,-54},{-26,-36}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{84,-72},{108,-52}}, textString="time", fontName="Arial"),Line(visible=true, points={{-50,0},{18,0}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-50,0},{-81,0}}, thickness=0.5),Line(visible=true, points={{-50,77},{-50,0}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,-1},{18,76}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,73},{-50,73}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-42,74},{9,88}}, textString="1/freqHz", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-49,73},{-40,75},{-40,71},{-49,73}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{18,73},{10,75},{10,71},{18,73}}),Line(visible=true, points={{-50,-61},{-19,-61}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-18,-61},{-26,-59},{-26,-63},{-18,-61}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-51,-75},{-27,-63}}, textString="t", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-82,-96},{108,-67}}, textString="I*exp(-damping*t)*sin(2*pi*freqHz*t+phase)", fontName="Arial"),Line(visible=true, points={{-50,0},{-50,-40}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-50,-54},{-50,-72}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{18,-76},{-1,-48}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-74,83},{-54,103}}, textString="i", fontName="Arial")}));
  end ExpSineCurrent;

  model ExponentialsCurrent " Rising and falling exponential current source"
    parameter Real iMax=1 "Upper bound for rising edge";
    parameter SI.Time riseTime(min=0)=0.5 "Rise time";
    parameter SI.Time riseTimeConst(min=Modelica.Constants.small)=0.1 "Rise time constant";
    parameter SI.Time fallTimeConst(min=Modelica.Constants.small)=riseTimeConst "Fall time constant";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Exponentials signalSource(outMax=iMax, riseTime=riseTime, riseTimeConst=riseTimeConst, fallTimeConst=fallTimeConst) );
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-70},{84,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,-70},{84,-64},{84,-76},{100,-70}}),Line(visible=true, points={{-40,-30},{-37.2,-15.3},{-34.3,-2.1},{-30.8,12.4},{-27.3,25},{-23.7,35.92},{-19.5,47.18},{-15.3,56.7},{-10.3,66},{-4.6,74.5},{1.7,82.1},{8.8,88.6},{17.3,94.3},{30,100},{30,100},{32.12,87.5},{34.95,72.7},{37.78,59.8},{40.61,48.45},{44.14,36.3},{47.68,26},{51.9,15.8},{56.2,7.4},{61.1,-0.5},{66.8,-7.4},{73.1,-13.3},{80.9,-18.5},{90.8,-22.8},{100,-25.4}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-70},{-43,-60},{-38,-60},{-40,-70},{-40,-70}}),Line(visible=true, points={{-40,-29},{-40,-60}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-40,-30},{-42,-40},{-37,-40},{-40,-30}}),Line(visible=true, points={{-39,-30},{-80,-30}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-59,-89},{-13,-71}}, textString="startTime", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-41,-30},{-32,-28},{-32,-32},{-41,-30}}),Line(visible=true, points={{-40,-30},{29,-30}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{29,-30},{21,-28},{21,-32},{29,-30}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-26,-28},{19,-12}}, textString="riseTime", fontName="Arial"),Line(visible=true, points={{-39,-30},{-80,-30}}, thickness=0.5),Line(visible=true, points={{30,100},{30,-34}}, color={192,192,192}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-76,-59},{-73.2,-44.3},{-70.3,-31.1},{-66.8,-16.6},{-63.3,-4},{-59.7,6.92},{-55.5,18.18},{-51.3,27.7},{-46.3,37},{-40.6,45.5},{-34.3,53.1},{-27.2,59.6},{-18.7,65.3},{-6,71},{-6,71},{-3.88,58.5},{-1.05,43.7},{1.78,30.8},{4.61,19.45},{8.14,7.3},{11.68,-3},{15.9,-13.2},{20.2,-21.6},{25.1,-29.5},{30.8,-36.4},{37.1,-42.3},{44.9,-47.5},{54.8,-51.8},{64,-54.4}}, color={192,192,192}, smooth=Smooth.Bezier)}));
  end ExponentialsCurrent;

  model PulseCurrent "Pulse current source"
    parameter SI.Current I=1 "Amplitude of pulse";
    parameter Real width(final min=Modelica.Constants.small, final max=100)=50 "Width of pulse in % of period";
    parameter SI.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Pulse signalSource(amplitude=I, width=width, period=period) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,-67},{-40,-67},{-40,73},{0,73},{0,-67},{40,-67},{40,73},{80,73}}, color={192,192,192})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,1},{-37,-12},{-30,-12},{-34,1}}),Line(visible=true, points={{-34,-1},{-34,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-33,-70},{-36,-57},{-30,-57},{-33,-70},{-33,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-36},{-35,-24}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-31,-87},{15,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-10,0},{-10,-70}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-80.03,-1.776e-15},{-21.03,-1.776e-15},{-21.03,50},{20.97,50},{20.97,-1.776e-15},{39.97,0},{39.97,50},{80.03,50}}, thickness=0.5),Line(visible=true, points={{-19,88},{-19,49}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{21,74},{21,50}}, color={160,160,160}, pattern=LinePattern.Dot),Line(visible=true, points={{41,88},{41,50}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-19,83},{42,83}}, color={192,192,192}),Line(visible=true, points={{-19,69},{21,69}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-9,85},{37,97}}, textString="period", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-18,69},{21,81}}, textString="width", fontName="Arial"),Line(visible=true, points={{-52,50},{-19,50}}, color={192,192,192}, pattern=LinePattern.Dot),Line(visible=true, points={{-34,50},{-34,1}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,20},{-37,34}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,49},{-37,36},{-30,36},{-34,49}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,1},{-37,14},{-31,14},{-34,1},{-34,1}}),Line(visible=true, points={{80,50.17},{80,0},{90,0}}, thickness=0.5),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-19,69},{-10,71},{-10,67},{-19,69}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{21,69},{13,71},{13,67},{21,69}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-19,83},{-10,85},{-10,81},{-19,83}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{41,83},{33,85},{33,81},{41,83}}),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}));
  end PulseCurrent;

  model SawToothCurrent "Saw tooth current source"
    parameter SI.Current I=1 "Amplitude of saw tooth";
    parameter SI.Time period=1 "Time for one period";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.SawTooth signalSource(amplitude=I, period=period) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,-71},{-50,-71},{10,70},{10,-71},{70,70},{70,-71}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-19},{-37,-32},{-30,-32},{-34,-19}}),Line(visible=true, points={{-34,-20},{-34,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-70},{-37,-57},{-31,-57},{-34,-70},{-34,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,-36},{-35,-24}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-31,-87},{15,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-10,-20},{-10,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,88},{-10,-20}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{30,88},{30,59}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,83},{30,83}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-12,85},{34,97}}, textString="period", fontName="Arial"),Line(visible=true, points={{-44,60},{30,60}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-34,47},{-34,-7}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-78,20},{-37,34}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,60},{-37,47},{-30,47},{-34,60}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-34,-20},{-37,-7},{-31,-7},{-34,-20},{-34,-20}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10,83},{-1,85},{-1,81},{-10,83}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{30,83},{22,85},{22,81},{30,83}}),Line(visible=true, points={{-80,-20},{-10,-20},{30,60},{30,-20},{72,60},{72,-20}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end SawToothCurrent;

  model TrapezoidCurrent "Trapezoidal current source"
    parameter SI.Current I=1 "Amplitude of trapezoid";
    parameter SI.Time rising(final min=0)=0 "Rising duration of trapezoid";
    parameter SI.Time width(final min=0)=0.5 "Width duration of trapezoid";
    parameter SI.Time falling(final min=0)=0 "Falling duration of trapezoid";
    parameter SI.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
    parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.Trapezoid signalSource(amplitude=I, rising=rising, width=width, falling=falling, period=period, nperiod=nperiod) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-81,-66},{-60,-66},{-30,74},{1,74},{30,-66},{51,-66},{80,74}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-45,-30},{-47,-41},{-43,-41},{-45,-30}}),Line(visible=true, points={{-45,-31},{-45,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-45,-70},{-47,-60},{-43,-60},{-45,-70},{-45,-70}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-86,-55},{-43,-43}}, textString="offset", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-47,-87},{-1,-69}}, textString="startTime", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Line(visible=true, points={{-29,79},{-30,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-10,59},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{20,59},{20,39}}, color={160,160,160}, pattern=LinePattern.Dash),Line(visible=true, points={{40,59},{40,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-20,75},{60,75}}, color={192,192,192}),Line(visible=true, points={{-29,56},{40,56}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-9,76},{37,88}}, textString="period", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-8,60},{21,70}}, textString="width", fontName="Arial"),Line(visible=true, points={{-42,40},{-10,40}}, color={192,192,192}, pattern=LinePattern.Dash),Line(visible=true, points={{-39,40},{-39,-19}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,0},{-40,14}}, textString="I", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-29,56},{-22,58},{-22,54},{-29,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-10,56},{-17,58},{-17,54},{-10,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-29,75},{-20,77},{-20,73},{-29,75}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{60,75},{52,77},{52,73},{60,75}}),Line(visible=true, points={{-80,-30},{-30,-30},{-9,46},{21,46},{40,-30},{60,-30},{80,46},{100,46}}, thickness=0.5),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-39,40},{-41,29},{-37,29},{-39,40}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-39,-29},{-41,-19},{-37,-19},{-39,-29},{-39,-29}}),Line(visible=true, points={{60,80},{60,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{39,56},{32,58},{32,54},{39,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{20,56},{27,58},{27,54},{20,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{20,56},{13,58},{13,54},{20,56}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-12,56},{-5,58},{-5,54},{-12,56}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-34,60},{-5,70}}, textString="rising", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{16,60},{45,70}}, textString="falling", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,-100},{100,100}})));
  end TrapezoidCurrent;

  model TableCurrent "Current source by linear interpolation in a table"
    parameter Real table[:,:]=[0,0;1,1;2,4] "Table matrix (time = first column, current = second column)";
    extends Interfaces.CurrentSource(redeclare Modelica.Blocks.Sources.TimeTable signalSource(table=table) );
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-66,-36},{-66,84},{34,84},{34,-36},{-66,-36},{-66,-6},{34,-6},{34,24},{-66,24},{-66,54},{34,54},{34,84},{-16,84},{-16,-37}}, color={192,192,192})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-30},{30,90}}),Line(visible=true, points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{30,90},{30,-31}}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-77,-58},{-38,-42}}, textString="offset", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-30,-70},{-33,-60},{-28,-60},{-30,-70},{-30,-70}}),Line(visible=true, points={{-31,-31},{-31,-70}}, color={192,192,192}),Line(visible=true, points={{-20,-20},{-20,-70}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-38,-88},{8,-70}}, textString="startTime", fontName="Arial"),Line(visible=true, points={{-20,-30},{-80,-30}}, color={192,192,192}, pattern=LinePattern.Dash),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{66,-93},{91,-81}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-15,68},{24,83}}, textString="time", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{33,67},{76,83}}, textString="v", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, extent={{-73,75},{-53,95}}, textString="i", fontName="Arial")}), Documentation(info="<HTML>
<p>
This block generates a current source by <b>linear interpolation</b> in
a table. The time points and current values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the second column contains the current to be interpolated.
The table interpolation has the following proporties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    <b>extrapolation</b> through the last or first two points of the
    table.</li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the current value is just returned independantly of the
    actual time instant, i.e., this is a constant current source.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the current.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
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
            4 16]
If, e.g., time = 1.0, the current i =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the current i =  2.5,
    e.g., time = 2.0, the current i =  4.0,
    e.g., time = 5.0, the current i = 23.0 (i.e. extrapolation).
</pre>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"));
  end TableCurrent;

end Sources;
