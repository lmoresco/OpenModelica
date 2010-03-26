within Modelica.Blocks;
package Nonlinear "Discontinuous or non-differentiable algebraic control blocks"
  import Modelica.Blocks.Interfaces;
  extends Modelica.Icons.Library;
  annotation(preferedView="info", Documentation(info="
<HTML>
<p>
This package contains <b>discontinuous</b> and
<b>non-differentiable, algebraic</b> input/output blocks.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New block VariableLimiter added.
<li><i>August 22, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.
</li>
</ul>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{0,0},{207,-132}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  block Limiter "Limit the range of a signal"
    parameter Real uMax=1 "Upper limits of input signals";
    parameter Real uMin=-uMax "Lower limits of input signals";
    parameter Boolean limitsAtInit=true "= false, if limits are ignored during initializiation (i.e., y=u)";
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the specified upper and lower
limits. If this is not the case, the corresponding limits are passed
as output.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-90},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,-8},{68,8},{90,0}}),Line(visible=true, points={{-80,-70},{-50,-70},{50,70},{80,70}}),Text(visible=true, extent={{-150,-150},{150,-110}}, textString="uMax=%uMax", fontName="Arial"),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-60},{0,50}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,60},{-5,50},{5,50},{0,60}}),Line(visible=true, points={{-60,0},{50,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{60,0},{50,-5},{50,5},{60,0}}),Line(visible=true, points={{-50,-40},{-30,-40},{30,40},{50,40}}),Text(visible=true, fillColor={128,128,128}, extent={{46,-18},{68,-6}}, textString="u", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-30,50},{-5,70}}, textString="y", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-58,-54},{-28,-42}}, textString="uMin", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{26,40},{66,56}}, textString="uMax", fontName="Arial")}));
  equation 
    assert(uMax >= uMin, "Limiter: Limits must be consistent. However, uMax (=" + String(uMax) + ") < uMin (=" + String(uMin) + ")");
    if initial() and not limitsAtInit then
      y=u;
      assert(u >= uMin - 0.01*abs(uMin) and u <= uMax + 0.01*abs(uMax), "Limiter: During initialization the limits have been ignored.\n" + "However, the result is that the input u is not within the required limits:\n" + "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
    else
      y=smooth(0, if u > uMax then uMax else if u < uMin then uMin else u);
    end if;
  end Limiter;

  block VariableLimiter "Limit the range of a signal with variable limits"
    extends Interfaces.SISO;
    parameter Boolean limitsAtInit=true "= false, if limits are ignored during initializiation (i.e., y=u)";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-90},{0,68}}, color={192,192,192}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,-8},{68,8},{90,0}}),Line(visible=true, points={{-80,-70},{-50,-70},{50,70},{80,70}}),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-100,80},{66,80},{66,70}}),Line(visible=true, points={{-100,-80},{-64,-80},{-64,-70}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-64,-70},{-66,-74},{-62,-74},{-64,-70}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{66,70},{64,74},{68,74},{66,70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-60},{0,50}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,60},{-5,50},{5,50},{0,60}}),Line(visible=true, points={{-60,0},{50,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{60,0},{50,-5},{50,5},{60,0}}),Line(visible=true, points={{-50,-40},{-30,-40},{30,40},{50,40}}),Text(visible=true, fillColor={128,128,128}, extent={{46,-18},{68,-6}}, textString="inPort", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-30,50},{-5,70}}, textString="outPort", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-66,-40},{-26,-20}}, textString="uMin", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{30,20},{70,40}}, textString="uMax", fontName="Arial"),Line(visible=true, points={{-100,80},{40,80},{40,40}}),Line(visible=true, points={{-100,-80},{-40,-80},{-40,-40}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{40,40},{35,50},{45,50},{40,40}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-40,-40},{-45,-50},{-35,-50},{-40,-40}})}));
    Interfaces.RealInput limit1 "Connector of Real input signal used as maximum of input u" annotation(Placement(visible=true, transformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.RealInput limit2 "Connector of Real input signal used as minimum of input u" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
  protected 
    Real uMax;
    Real uMin;
    annotation(Documentation(info="<html>
<p>
The Limiter block passes its input signal as output signal
as long as the input is within the upper and lower
limits specified by the two additional inputs limit1 and
limit2. If this is not the case, the corresponding limit
is passed as output.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{0,-90},{0,68}}, color={192,192,192}),Line(points={{-90,0},{68,0}}, color={192,192,192}),Polygon(points={{90,0},{68,-8},{68,8},{90,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-80,-70},{-50,-70},{50,70},{80,70}}, color={0,0,0}),Text(extent={{-150,150},{150,110}}, textString="%name"),Line(points={{-100,80},{66,80},{66,70}}),Line(points={{-100,-80},{-64,-80},{-64,-70}}),Polygon(points={{-64,-70},{-66,-74},{-62,-74},{-64,-70}}, fillPattern=FillPattern.Solid),Polygon(points={{66,70},{64,74},{68,74},{66,70}}, fillPattern=FillPattern.Solid),Polygon(points={{0,90},{-8,68},{8,68},{0,90}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{0,-60},{0,50}}, color={192,192,192}),Polygon(points={{0,60},{-5,50},{5,50},{0,60}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-60,0},{50,0}}, color={192,192,192}),Polygon(points={{60,0},{50,-5},{50,5},{60,0}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Line(points={{-50,-40},{-30,-40},{30,40},{50,40}}, color={0,0,0}),Text(extent={{46,-6},{68,-18}}, textString="inPort", fillColor={128,128,128}),Text(extent={{-30,70},{-5,50}}, textString="outPort", fillColor={128,128,128}),Text(extent={{-66,-40},{-26,-20}}, textString="uMin", fillColor={128,128,128}),Text(extent={{30,20},{70,40}}, textString="uMax", fillColor={128,128,128}),Line(points={{-100,80},{40,80},{40,40}}),Line(points={{-100,-80},{-40,-80},{-40,-40}}),Polygon(points={{40,40},{35,50},{45,50},{40,40}}, fillPattern=FillPattern.Solid),Polygon(points={{-40,-40},{-45,-50},{-35,-50},{-40,-40}}, fillPattern=FillPattern.Solid)}));
  equation 
    uMax=max(limit1, limit2);
    uMin=min(limit1, limit2);
    if initial() and not limitsAtInit then
      y=u;
      assert(u >= uMin - 0.01*abs(uMin) and u <= uMax + 0.01*abs(uMax), "VariableLimiter: During initialization the limits have been ignored.\n" + "However, the result is that the input u is not within the required limits:\n" + "  u = " + String(u) + ", uMin = " + String(uMin) + ", uMax = " + String(uMax));
    else
      y=smooth(0, if u > uMax then uMax else if u < uMin then uMin else u);
    end if;
  end VariableLimiter;

  block DeadZone "Provide a region of zero output"
    parameter Real uMax=1 "Upper limits of dead zones";
    parameter Real uMin=-uMax "Lower limits of dead zones";
    parameter Boolean deadZoneAtInit=true "= false, if dead zone is ignored during initializiation (i.e., y=u)";
    extends Interfaces.SISO;
    annotation(Documentation(info="
<HTML>
<p>
The DeadZone block defines a region of zero output.
</p>
<p>
If the input is within uMin ... uMax, the output
is zero. Outside of this zone, the output is a linear
function of the input with a slope of 1.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-90},{0,68}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,90},{-8,68},{8,68},{0,90}}),Line(visible=true, points={{-90,0},{68,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,0},{68,-8},{68,8},{90,0}}),Line(visible=true, points={{-80,-60},{-20,0},{20,0},{80,60}}),Text(visible=true, fillColor={160,160,160}, extent={{-150,-150},{150,-110}}, textString="uMax=%uMax", fontName="Arial"),Text(visible=true, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-60},{0,50}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{0,60},{-5,50},{5,50},{0,60}}),Line(visible=true, points={{-76,0},{74,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{84,0},{74,-5},{74,5},{84,0}}),Line(visible=true, points={{-81,-40},{-38,0},{40,0},{80,40}}),Text(visible=true, fillColor={128,128,128}, extent={{62,-25},{88,-7}}, textString="u", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-36,50},{-5,72}}, textString="y", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{-51,1},{-28,19}}, textString="uMin", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{27,5},{52,21}}, textString="uMax", fontName="Arial")}));
  equation 
    assert(uMax >= uMin, "DeadZone: Limits must be consistent. However, uMax (=" + String(uMax) + ") < uMin (=" + String(uMin) + ")");
    if initial() and not deadZoneAtInit then
      y=u;
    else
      y=smooth(0, if u > uMax then u - uMax else if u < uMin then u - uMin else 0);
    end if;
  end DeadZone;

  block FixedDelay "Delay block with fixed DelayTime"
    extends Modelica.Blocks.Interfaces.SISO;
    parameter SI.Time delayTime=1 "Delay time of output with respect to input signal";
    annotation(Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{8,-142},{8,-102}}, textString="delayTime=%delayTime", fontName="Arial"),Line(visible=true, points={{-92,0},{-80.7,34.2},{-73.5,53.1},{-67.1,66.4},{-61.4,74.6},{-55.8,79.1},{-50.2,79.8},{-44.6,76.6},{-38.9,69.7},{-33.3,59.4},{-26.9,44.1},{-18.83,21.2},{-1.9,-30.8},{5.3,-50.2},{11.7,-64.2},{17.3,-73.1},{23,-78.4},{28.6,-80},{34.2,-77.6},{39.9,-71.5},{45.5,-61.9},{51.9,-47.2},{60,-24.8},{68,0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, points={{-62,0},{-50.7,34.2},{-43.5,53.1},{-37.1,66.4},{-31.4,74.6},{-25.8,79.1},{-20.2,79.8},{-14.6,76.6},{-8.9,69.7},{-3.3,59.4},{3.1,44.1},{11.17,21.2},{28.1,-30.8},{35.3,-50.2},{41.7,-64.2},{47.3,-73.1},{53,-78.4},{58.6,-80},{64.2,-77.6},{69.9,-71.5},{75.5,-61.9},{81.9,-47.2},{90,-24.8},{98,0}}, color={160,160,160}, smooth=Smooth.Bezier)}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-88},{-80,86}}, color={192,192,192}),Text(visible=true, fillColor={0,0,255}, extent={{-75,78},{-46,98}}, textString="outPort", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,96},{-86,80},{-74,80},{-80,96}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,255}, smooth=Smooth.Bezier),Text(visible=true, extent={{-24,78},{-2,98}}, textString="inPort", fontName="Arial"),Line(visible=true, points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{67,6},{96,22}}, textString="time", fontName="Arial"),Line(visible=true, points={{-64,-30},{-64,0}}, color={192,192,192}),Text(visible=true, extent={{-58,-42},{-58,-32}}, textString="delayTime", fontName="Arial"),Line(visible=true, points={{-94,-26},{-80,-26}}, color={192,192,192}),Line(visible=true, points={{-64,-26},{-50,-26}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}})}));
  equation 
    y=delay(u, delayTime);
  end FixedDelay;

  block PadeDelay "Pade approximation of delay block with fixed DelayTime "
    extends Modelica.Blocks.Interfaces.SISO;
    parameter SI.Time delayTime=1 "Delay time of output with respect to input signal";
    parameter Integer n(min=1)=1 "Order of pade approximation";
    parameter Integer m(min=1, max=n)=n "Order of numerator";
    final output Real x[n] "State of transfer function from controller canonical form";
    annotation(Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
<p>
The delay is approximated by a Pade approximation, i.e., by
a transfer function
</p>
<pre>
           b[1]*s^m + b[2]*s^[m-1] + ... + b[m+1]
   y(s) = --------------------------------------------- * u(s)
           a[1]*s^n + a[2]*s^[n-1] + ... + a[n+1]
</pre>
<p>
where the coefficients b[:] and a[:] are calculated such that the
coefficients of the Taylor expansion of the delay exp(-T*s) around s=0
are identical upto order n+m.
</p>
<p>
The main advantage of this approach is that the delay is
approximated by a linear differential equation system, which
is continuous and continuously differentiable. For example, it
is uncritical to linearize a system containing a Pade-approximated
delay.
</p>
<p>
The standard text book version uses order \"m=n\", which is
also the default setting of this block. The setting
\"m=n-1\" may yield a better approximation in certain cases.
<p>
<p>
Literature:<br>
Otto Foellinger: Regelungstechnik, 8. Auflage,
chapter 11.9, page 412-414, Huethig Verlag Heidelberg, 1994
</p>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,80},{-88,80}}, color={192,192,192}),Line(visible=true, points={{-80,-80},{-88,-80}}, color={192,192,192}),Line(visible=true, points={{-80,-88},{-80,86}}, color={192,192,192}),Text(visible=true, fillColor={0,0,255}, extent={{-75,78},{-46,98}}, textString="outPort", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,96},{-86,80},{-74,80},{-80,96}}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,255}, smooth=Smooth.Bezier),Text(visible=true, extent={{-24,78},{-2,98}}, textString="inPort", fontName="Arial"),Line(visible=true, points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{67,6},{96,22}}, textString="time", fontName="Arial"),Line(visible=true, points={{-64,-30},{-64,0}}, color={192,192,192}),Text(visible=true, extent={{-58,-42},{-58,-32}}, textString="delayTime", fontName="Arial"),Line(visible=true, points={{-94,-26},{-80,-26}}, color={192,192,192}),Line(visible=true, points={{-64,-26},{-50,-26}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{8,-142},{8,-102}}, textString="delayTime=%delayTime", fontName="Arial"),Line(visible=true, points={{-94,0},{-82.7,34.2},{-75.5,53.1},{-69.1,66.4},{-63.4,74.6},{-57.8,79.1},{-52.2,79.8},{-46.6,76.6},{-40.9,69.7},{-35.3,59.4},{-28.9,44.1},{-20.83,21.2},{-3.9,-30.8},{3.3,-50.2},{9.7,-64.2},{15.3,-73.1},{21,-78.4},{26.6,-80},{32.2,-77.6},{37.9,-71.5},{43.5,-61.9},{49.9,-47.2},{58,-24.8},{66,0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, points={{-72,0},{-60.7,34.2},{-53.5,53.1},{-47.1,66.4},{-41.4,74.6},{-35.8,79.1},{-30.2,79.8},{-24.6,76.6},{-18.9,69.7},{-13.3,59.4},{-6.9,44.1},{1.17,21.2},{18.1,-30.8},{25.3,-50.2},{31.7,-64.2},{37.3,-73.1},{43,-78.4},{48.6,-80},{54.2,-77.6},{59.9,-71.5},{65.5,-61.9},{71.9,-47.2},{80,-24.8},{88,0}}, color={160,160,160}, smooth=Smooth.Bezier),Text(visible=true, fillColor={160,160,160}, extent={{-10,38},{100,100}}, textString="m=%m", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-98,-96},{6,-34}}, textString="n=%n", fontName="Arial")}));
  protected 
    Real x1dot "Derivative of first state of TransferFcn";
    Real xn "Highest order state of TransferFcn";
    Real a[n + 1];
    Real b[m + 1];
  protected 
    function padeCoefficients
      input Real T "delay time";
      input Integer n "order of denominator";
      input Integer m "order of numerator";
      output Real b[m + 1] "numerator coefficients of transfer function";
      output Real a[n + 1] "denominator coefficients of transfer function";
    protected 
      Real nm;
    algorithm 
      a[1]:=1;
      b[1]:=1;
      nm:=n + m;
      for i in 1:n loop
        a[i + 1]:=a[i]*T*(n - i + 1)/(nm - i + 1)/i;
        if i <= m then 
          b[i + 1]:=-b[i]*T*(m - i + 1)/(nm - i + 1)/i;
        end if;
      end for;
      b:=b[m + 1:-1:1];
      a:=a[n + 1:-1:1];
    end padeCoefficients;

  equation 
    (b,a)=padeCoefficients(delayTime, n, m);
    [der(x);xn]=[x1dot;x];
    [u]=transpose([a])*[x1dot;x];
    [y]=transpose([zeros(n - m, 1);b])*[x1dot;x];
  initial equation 
    x[n]=u;
  end PadeDelay;

  block VariableDelay "Delay block with variable DelayTime"
    extends Modelica.Blocks.Interfaces.SISO;
    parameter Real delayMax(min=0)=1 "maximum delay time";
    annotation(Documentation(info="<html>
<p>
The Input signal is delayed by a given time instant, or more precisely:
</p>
<pre>
   y = u(time - delayTime) for time &gt; time.start + delayTime
     = u(time.start)       for time &le; time.start + delayTime
</pre>
<p>
where delayTime is an additional input signal which must follow
the following relationship:
</p>
<pre>  0 &le; delayTime &le; delayMax
</pre>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,96},{-86,80},{-74,80},{-80,96}}),Text(visible=true, fillColor={0,0,255}, extent={{-69,78},{-40,98}}, textString="outPort", fontName="Arial"),Line(visible=true, points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,255}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Text(visible=true, fillColor={160,160,160}, extent={{67,6},{96,22}}, textString="time", fontName="Arial"),Text(visible=true, extent={{-58,-42},{-58,-32}}, textString="delayTime", fontName="Arial"),Line(visible=true, points={{-80,-88},{-80,86}}, color={192,192,192}),Text(visible=true, extent={{-24,78},{-2,98}}, textString="inPort", fontName="Arial"),Text(visible=true, extent={{-24,78},{-2,98}}, textString="inPort", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,-26},{-88,-24},{-88,-28},{-80,-26}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-56,-24},{-64,-26},{-56,-28},{-56,-24}}),Line(visible=true, points={{-64,-26},{-50,-26}}, color={192,192,192}),Line(visible=true, points={{-94,-26},{-80,-26}}, color={192,192,192}),Text(visible=true, extent={{-58,-42},{-58,-32}}, textString="delayTime", fontName="Arial"),Line(visible=true, points={{-100,-60},{-70,-60},{-64,-44}}, arrow={Arrow.None,Arrow.Filled}),Line(visible=true, points={{-80,-88},{-80,86}}, color={192,192,192}),Line(visible=true, points={{-100,0},{84,0}}, color={192,192,192}),Line(visible=true, points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, smooth=Smooth.Bezier),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,96},{-86,80},{-74,80},{-80,96}}),Line(visible=true, points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,255}, smooth=Smooth.Bezier),Text(visible=true, fillColor={0,0,255}, extent={{-69,78},{-40,98}}, textString="outPort", fontName="Arial"),Text(visible=true, extent={{-24,78},{-2,98}}, textString="inPort", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{67,6},{96,22}}, textString="time", fontName="Arial"),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{100,0},{84,6},{84,-6},{100,0}}),Line(visible=true, points={{-64,-30},{-64,0}}, color={192,192,192})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,-148},{100,-108}}, textString="delayMax=%delayMax", fontName="Arial"),Line(visible=true, points={{-92,0},{-80.7,34.2},{-73.5,53.1},{-67.1,66.4},{-61.4,74.6},{-55.8,79.1},{-50.2,79.8},{-44.6,76.6},{-38.9,69.7},{-33.3,59.4},{-26.9,44.1},{-18.83,21.2},{-1.9,-30.8},{5.3,-50.2},{11.7,-64.2},{17.3,-73.1},{23,-78.4},{28.6,-80},{34.2,-77.6},{39.9,-71.5},{45.5,-61.9},{51.9,-47.2},{60,-24.8},{68,0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, points={{-64,0},{-52.7,34.2},{-45.5,53.1},{-39.1,66.4},{-33.4,74.6},{-27.8,79.1},{-22.2,79.8},{-16.6,76.6},{-10.9,69.7},{-5.3,59.4},{1.1,44.1},{9.17,21.2},{26.1,-30.8},{33.3,-50.2},{39.7,-64.2},{45.3,-73.1},{51,-78.4},{56.6,-80},{62.2,-77.6},{67.9,-71.5},{73.5,-61.9},{79.9,-47.2},{88,-24.8},{96,0}}, smooth=Smooth.Bezier),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{6,4},{-14,-2},{-6,-12},{6,4}}),Line(visible=true, points={{-100,-60},{-76,-60},{-8,-6}})}));
    Modelica.Blocks.Interfaces.RealInput delayTime annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
  equation 
    y=delay(u, delayTime, delayMax);
  end VariableDelay;

end Nonlinear;
