within Modelica.Electrical.Analog;
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
  model IdealThyristor "Ideal thyristor"
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    parameter Modelica.SIunits.Resistance Ron(final min=0)=1e-05 "Closed thyristor resistance";
    parameter Modelica.SIunits.Conductance Goff(final min=0)=1e-05 "Opened thyristor conductance";
    parameter Modelica.SIunits.Voltage Vknee(final min=0)=0 "Forward threshold voltage";
    Boolean off(start=true) "Switching state";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Line(visible=true, points={{30,20},{70,60},{70,90}}, color={0,0,255}),Line(visible=true, points={{40,50},{60,30}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,0},{80,0}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{70,4},{80,0},{70,-4},{70,4}}),Line(visible=true, points={{0,80},{0,-80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-4,70},{0,80},{4,70},{-4,70}}),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{10,70},{20,80}}, textString="i", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{70,-20},{80,-10}}, textString="v", fontName="Arial"),Line(visible=true, points={{-80,-40},{-20,-10},{20,10},{40,70}}, thickness=0.5),Line(visible=true, points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,-10},{40,0}}, textString="Vknee", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,60},{40,70}}, textString="Ron", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{-20,0},{0,10}}, textString="Goff", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid, extent={{18,8},{22,12}}),Line(visible=true, points={{20,10},{70,40}}, thickness=0.5)}));
    Modelica.Blocks.Interfaces.BooleanInput fire annotation(Placement(visible=true, transformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable: if on then current, if opened then voltage";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);

    annotation(Documentation(info="<html>
This is an ideal thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (on), if the voltage drop is greater or equal 0  and fire is true.<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br> 
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(points={{-90,0},{40,0}}, color={0,0,255}),Line(points={{40,0},{90,0}}, color={0,0,255}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(points={{30,20},{70,60},{70,90}}, color={0,0,255}),Line(points={{40,50},{60,30}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{10,80},{20,70}}, fillColor={128,128,128}, textString="i"),Text(lineColor={0,0,255}, extent={{70,-10},{80,-20}}, fillColor={128,128,128}, textString="v"),Line(points={{-80,-40},{-20,-10},{20,10},{40,70}}, color={0,0,0}, thickness=0.5),Line(points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(lineColor={0,0,255}, extent={{20,0},{40,-10}}, fillColor={128,128,128}, textString="Vknee"),Text(lineColor={0,0,255}, extent={{20,70},{40,60}}, fillColor={128,128,128}, textString="Ron"),Text(lineColor={0,0,255}, extent={{-20,10},{0,0}}, fillColor={128,128,128}, textString="Goff"),Ellipse(lineColor={0,0,255}, extent={{18,12},{22,8}}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid),Line(points={{20,10},{70,40}}, color={0,0,0}, thickness=0.5)}));
  equation 
    off=s < 0 or pre(off) and not fire;
    v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
    i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
  end IdealThyristor;

  model IdealGTOThyristor "Ideal GTO thyristor"
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    parameter Modelica.SIunits.Resistance Ron(final min=0)=1e-05 "Closed thyristor resistance";
    parameter Modelica.SIunits.Conductance Goff(final min=0)=1e-05 "Opened thyristor conductance";
    parameter Modelica.SIunits.Voltage Vknee(final min=0)=0 "Forward threshold voltage";
    Boolean off(start=true) "Switching state";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Line(visible=true, points={{30,20},{70,60},{70,90}}, color={0,0,255}),Line(visible=true, points={{40,50},{60,30}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,0},{80,0}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{70,4},{80,0},{70,-4},{70,4}}),Line(visible=true, points={{0,80},{0,-80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-4,70},{0,80},{4,70},{-4,70}}),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{10,70},{20,80}}, textString="i", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{70,-20},{80,-10}}, textString="v", fontName="Arial"),Line(visible=true, points={{-80,-40},{-20,-10},{20,10},{40,70}}, thickness=0.5),Line(visible=true, points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,-10},{40,0}}, textString="Vknee", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,60},{40,70}}, textString="Ron", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{-20,0},{0,10}}, textString="Goff", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid, extent={{18,8},{22,12}}),Line(visible=true, points={{20,10},{70,40}}, thickness=0.5)}));
    Modelica.Blocks.Interfaces.BooleanInput fire annotation(Placement(visible=true, transformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable: if on then current, if opened then voltage";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);

    annotation(Documentation(info="<html>
This is an ideal GTO thyristor model which is<br><br>
<b>open </b>(off), if the voltage drop is less than 0 or fire is false<br>
<b>closed</b> (on), if the voltage drop is greater or equal 0  and fire is true.<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
thyristor has a small conductance <i>Goff</i> and the closed thyristor has a low
resistance <i>Ron</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br> 
along  the <i>Goff</i>-characteristic until <i>v = Vknee</i>.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{40,0}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Line(color={0,0,255}, points={{30,20},{70,60},{70,90}}),Line(color={0,0,255}, points={{40,50},{60,30}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{10,80},{20,70}}, fillColor={128,128,128}, textString="i"),Text(lineColor={0,0,255}, extent={{70,-10},{80,-20}}, fillColor={128,128,128}, textString="v"),Line(points={{-80,-40},{-20,-10},{20,10},{40,70}}, color={0,0,0}, thickness=0.5),Line(points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(lineColor={0,0,255}, extent={{20,0},{40,-10}}, fillColor={128,128,128}, textString="Vknee"),Text(lineColor={0,0,255}, extent={{20,70},{40,60}}, fillColor={128,128,128}, textString="Ron"),Text(lineColor={0,0,255}, extent={{-20,10},{0,0}}, fillColor={128,128,128}, textString="Goff"),Ellipse(lineColor={0,0,255}, extent={{18,12},{22,8}}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid),Line(points={{20,10},{70,40}}, color={0,0,0}, thickness=0.5)}));
  equation 
    off=s < 0 or not fire;
    v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
    i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
  end IdealGTOThyristor;

  model IdealCommutingSwitch "Ideal commuting switch"
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance";
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance";
    annotation(Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2. 
The switching behaviour is controlled
by the inpug signal control. If control is true, the pin p is connected 
with the negative pin n2. Otherwise, the pin p is connected to the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,50},{96,50}}, color={0,0,255}),Line(visible=true, points={{0,60},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,0},{-60,22}}, textString="p", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,50},{80,72}}, textString="n1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,0},{80,22}}, textString="n2", fontName="Arial"),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput control "true => p--n2 connected, false => p--n1 connected" annotation(Placement(visible=true, transformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s1;
    Real s2 "Auxiliary variables";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
  equation 
    0=p.i + n2.i + n1.i;
    
    p.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
    n1.i = -(s1*unitVoltage)*(if (control) then Goff else 1);
    p.v - n2.v = (s2*unitCurrent)*(if (control) then Ron else 1);
    n2.i = -(s2*unitVoltage)*(if (control) then 1 else Goff);
  end IdealCommutingSwitch;

  model IdealIntermediateSwitch "Ideal intermediate switch"
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance";
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance";
    annotation(Documentation(info="<HTML>
<P>
The intermediate switch has four switching contact pins p1, p2, n1, and n2. 
The switching behaviour is controlled by the input signal control. If control
is true, the pin p1 is connected to pin n2, and the pin p2 is 
connected to the pin n2. Otherwise, the pin p1 is connected to n1, and
p2 is connected to n2.
</P>
<IMG SRC=\"../Images/IdealIntermediateSwitch1.png\" ALT=\"IdealIntermediateSwitch1\">
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
</P>
<IMG SRC=\"../Images/IdealIntermediateSwitch2.png\" ALT=\"IdealIntermediateSwitch2\">
<P>
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-4,21},{4,29}}),Line(visible=true, points={{-96,0},{-40,0}}, color={0,0,255}),Line(visible=true, points={{-96,50},{-40,50}}, color={0,0,255}),Line(visible=true, points={{-40,0},{40,50}}, color={0,0,255}),Line(visible=true, points={{-40,50},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{96,50}}, color={0,0,255}),Line(visible=true, points={{0,60},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-4,22},{4,30}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,50},{-60,72}}, textString="p1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,0},{-60,22}}, textString="p2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,50},{80,72}}, textString="n1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,0},{80,22}}, textString="n2", fontName="Arial"),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-90,50},{-44,50}}, color={0,0,255}),Line(visible=true, points={{-44,0},{40,50}}, color={0,0,255}),Line(visible=true, points={{-44,50},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p1 annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.PositivePin p2 annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput control "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2  connected" annotation(Placement(visible=true, transformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s1;
    Real s2;
    Real s3;
    Real s4 "Auxiliary variables";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
  equation 
  p1.v - n1.v = (s1*unitCurrent)*(if (control) then 1 else Ron);
  p2.v - n2.v = (s2*unitCurrent)*(if (control) then 1 else Ron);
  p1.v - n2.v = (s3*unitCurrent)*(if (control) then Ron else 1);
  p2.v - n1.v = (s4*unitCurrent)*(if (control) then Ron else 1);
 
  p1.i = if control then s1*unitVoltage*Goff + s3*unitCurrent else s1*unitCurrent + s3*unitVoltage*Goff;
  p2.i = if control then s2*unitVoltage*Goff + s4*unitCurrent else s2*unitCurrent + s4*unitVoltage*Goff;
  n1.i = if control then -s1*unitVoltage*Goff - s4*unitCurrent else -s1*unitCurrent - s4*unitVoltage*Goff;
  n2.i = if control then -s2*unitVoltage*Goff - s3*unitCurrent else -s2*unitCurrent - s3*unitVoltage*Goff;
  end IdealIntermediateSwitch;

  model ControlledIdealCommutingSwitch "Controlled ideal commuting switch"
    parameter SI.Voltage level=0.5 "Switch level";
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance";
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance";
    annotation(Documentation(info="<HTML>
<P>
The commuting switch has a positive pin p and two negative pins n1 and n2. 
The switching behaviour is controlled
by the control pin. If its voltage exceeds the value of the parameter level,
the pin p is connected with the negative pin n2. Otherwise, the pin p is 
connected the negative pin n1.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,50},{96,50}}, color={0,0,255}),Line(visible=true, points={{0,96},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,0},{-60,22}}, textString="p", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,50},{80,72}}, textString="n1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,0},{80,22}}, textString="n2", fontName="Arial"),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Pin control "Control pin: if control.v > level p--n2 connected, otherwise p--n1 connected" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
  protected 
    Real s1;
    Real s2 "Auxiliary variables";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
  equation 
    control.i=0;
    0=p.i + n2.i + n1.i;
    
    p.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
    n1.i = -(s1*unitVoltage)*(if (control.v > level) then Goff else 1);
    p.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then Ron else 1);
    n2.i = -(s2*unitVoltage)*(if (control.v > level) then 1 else Goff);
  end ControlledIdealCommutingSwitch;

  model ControlledIdealIntermediateSwitch "Controlled ideal intermediate switch"
    parameter SI.Voltage level=0.5 "Switch level";
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance";
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance";
    annotation(Documentation(info="<HTML>
<P>
The intermediate switch has four switching contact pins p1, p2, n1, and n2. 
The switching behaviour is controlled
by the control pin. If its voltage exceeds the value of the 
parameter level, the pin p1 is connected to pin n2, and the pin p2 is 
connected to the pin n2. Otherwise, the pin p1 is connected to n1, and
p2 is connected to n2.
</P>
<IMG SRC=\"../Images/ControlledIdealIntermediateSwitch1.png\" ALT=\"ControlledIdealIntermediateSwitch1\">
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
</P>
<IMG SRC=\"../Images/ControlledIdealIntermediateSwitch2.png\" ALT=\"ControlledIdealIntermediateSwitch2\">
<P>
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-4,21},{4,29}}),Line(visible=true, points={{-96,0},{-40,0}}, color={0,0,255}),Line(visible=true, points={{-96,50},{-40,50}}, color={0,0,255}),Line(visible=true, points={{-40,0},{40,50}}, color={0,0,255}),Line(visible=true, points={{-40,50},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{96,50}}, color={0,0,255}),Line(visible=true, points={{0,96},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-4,22},{4,30}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,50},{-60,72}}, textString="p1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80,0},{-60,22}}, textString="p2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,50},{80,72}}, textString="n1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,0},{80,22}}, textString="n2", fontName="Arial"),Line(visible=true, points={{-90,0},{-40,0}}, color={0,0,255}),Line(visible=true, points={{-90,50},{-39,50}}, color={0,0,255}),Line(visible=true, points={{-40,0},{40,50}}, color={0,0,255}),Line(visible=true, points={{-40,50},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p1 annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.PositivePin p2 annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n1 annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n2 annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Pin control "Control pin: if control.v > level p1--n2, p2--n1 connected,
         otherwise p1--n1, p2--n2  connected" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
  protected 
    Real s1;
    Real s2;
    Real s3;
    Real s4 "Auxiliary variables";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
  equation 
    control.i=0;
    p1.v - n1.v = (s1*unitCurrent)*(if (control.v > level) then 1 else Ron);
    p2.v - n2.v = (s2*unitCurrent)*(if (control.v > level) then 1 else Ron);
    p1.v - n2.v = (s3*unitCurrent)*(if (control.v > level) then Ron else 1);
    p2.v - n1.v = (s4*unitCurrent)*(if (control.v > level) then Ron else 1);
 
    p1.i = if control.v > level then s1*unitVoltage*Goff + s3*unitCurrent else s1*unitCurrent + s3*unitVoltage*Goff;
    p2.i = if control.v > level then s2*unitVoltage*Goff + s4*unitCurrent else s2*unitCurrent + s4*unitVoltage*Goff;
    n1.i = if control.v > level then -s1*unitVoltage*Goff - s4*unitCurrent else -s1*unitCurrent - s4*unitVoltage*Goff;
    n2.i = if control.v > level then -s2*unitVoltage*Goff - s3*unitCurrent else -s2*unitCurrent - s3*unitVoltage*Goff;
  end ControlledIdealIntermediateSwitch;

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

  model IdealOpAmp3Pin "Ideal operational amplifier (norator-nullator pair), but 3 pins"
    annotation(Documentation(info="<html>
<P>
The ideal OpAmp with three pins is of exactly the same behaviour as the ideal
OpAmp with four pins. Only the negative output pin is left out.
Both the input voltage and current are fixed to zero (nullator).
At the output pin both any voltage <i>v2</i> and any current <i>i2</i>
are possible.
</P>
</HTML>
", revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 2002   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-96,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{97,0}}, color={0,0,255}),Line(visible=true, points={{-55,50},{-45,50}}, color={0,0,255}),Line(visible=true, points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(visible=true, points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,-39},{-90,-19}}, textString="p1.i=0", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{120,3},{110,0},{120,-3},{120,3}}),Line(visible=true, points={{111,0},{136,0}}, color={160,160,160}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{118,2},{135,17}}, textString="i2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,60},{-90,80}}, textString="n1.i=0", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,80},{100,100}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-90,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-48,32},{-28,32}}, color={0,0,255}),Line(visible=true, points={{-39,-20},{-39,-41}}, color={0,0,255}),Line(visible=true, points={{-50,-31},{-28,-31}}, color={0,0,255})}));
    Interfaces.PositivePin in_p "Positive pin of the input port" annotation(Placement(visible=true, transformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin in_n "Negative pin of the input port" annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.PositivePin out "Output pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    in_p.v=in_n.v;
    in_p.i=0;
    in_n.i=0;
  end IdealOpAmp3Pin;

  model IdealOpAmpLimited "Ideal operational amplifier with limitation"
    annotation(Documentation(info="<HTML>
<P>
The ideal OpAmp with limitation behaves like an ideal OpAmp without limitation,
if the output voltage is within the limits (VMin < out.v < VMax). In this case
the input voltage vin=in_p.v - in_n.v is zero.
If the input voltage is vin < 0, the output voltage is out.v = VMin.
If the input voltage is vin > 0, the output voltage is out.v = VMax.
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),Line(visible=true, points={{0,35},{0,80}}, color={0,0,255}),Line(visible=true, points={{0,-35},{0,-80}}, color={0,0,255}),Line(visible=true, points={{-96,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-96,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{-55,50},{-45,50}}, color={0,0,255}),Line(visible=true, points={{-50,-45},{-50,-55}}, color={0,0,255}),Line(visible=true, points={{-55,-50},{-45,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,-39},{-90,-19}}, textString="p1.i=0", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{120,3},{110,0},{120,-3},{120,3}}),Line(visible=true, points={{111,0},{136,0}}, color={160,160,160}),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{118,2},{135,17}}, textString="i2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, extent={{-111,60},{-90,80}}, textString="n1.i=0", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-110,80},{100,116.5}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{60,0},{-60,70},{-60,-70},{60,0}}),Line(visible=true, points={{-45,-10},{-10,-10},{-10,10},{20,10}}, color={0,0,255}),Line(visible=true, points={{0,35},{0,80}}, color={0,0,255}),Line(visible=true, points={{0,-35},{0,-80}}, color={0,0,255}),Line(visible=true, points={{-90,50},{-60,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-60,-50}}, color={0,0,255}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-48,32},{-28,32}}, color={0,0,255}),Line(visible=true, points={{-39,-20},{-39,-41}}, color={0,0,255}),Line(visible=true, points={{-50,-31},{-28,-31}}, color={0,0,255})}));
    SI.Voltage vin "input voltage";
    Interfaces.PositivePin in_p "Positive pin of the input port" annotation(Placement(visible=true, transformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin in_n "Negative pin of the input port" annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.PositivePin out "Output pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.PositivePin VMax "Positive output voltage limitation" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,70}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin VMin "Negative output voltage limitation" annotation(Placement(visible=true, transformation(origin={0,-70}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    Real s "Auxiliary variable";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
  equation 
    in_p.i=0;
    in_n.i=0;
    VMax.i=0;
    VMin.i=0;
    vin=in_p.v - in_n.v;
    in_p.v - in_n.v=unitVoltage*(if s < -1 then s + 1 else if s > 1 then s - 1 else 0);
    out.v=if s < -1 then VMin.v else if s > 1 then VMax.v else (VMax.v - VMin.v)*s/2 + (VMax.v + VMin.v)/2;
  end IdealOpAmpLimited;

  model IdealDiode "Ideal diode"
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    parameter Modelica.SIunits.Resistance Ron(final min=0)=1e-05 "Forward state-on differential resistance (closed diode resistance)";
    parameter Modelica.SIunits.Conductance Goff(final min=0)=1e-05 "Backward state-off conductance (opened diode conductance)";
    parameter Modelica.SIunits.Voltage Vknee(final min=0)=0 "Forward threshold voltage";
    Boolean off(start=true) "Switching state";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,70},{100,100}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,0},{80,0}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{70,4},{80,0},{70,-4},{70,4}}),Line(visible=true, points={{0,80},{0,-80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-4,70},{0,80},{4,70},{-4,70}}),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{10,70},{20,80}}, textString="i", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{70,-20},{80,-10}}, textString="v", fontName="Arial"),Line(visible=true, points={{-80,-40},{-20,-10},{20,10},{40,70}}, thickness=0.5),Line(visible=true, points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,-10},{40,0}}, textString="Vknee", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{20,60},{40,70}}, textString="Ron", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={128,128,128}, extent={{-20,0},{0,10}}, textString="Goff", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid, extent={{18,8},{22,12}})}));
  protected 
    Real s "Auxiliary variable: if on then current, if opened then voltage";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
    annotation(Documentation(info="<html>
<P>
This is an ideal switch which is<br><br>
<b>open </b>(off), if it is reversed biased (voltage drop less than 0)<br>
<b>closed</b> (on), if it is conducting (current > 0).<br>
</P>
<p>
This is the behaviour if all parameters are exactly zero.<br><br>
Note, there are circuits, where this ideal description
with zero resistance and zero cinductance is not possible.
In order to prevent singularities during switching, the opened
diode has a small conductance <i>Gon</i> and the closed diode has a low
resistance <i>Roff</i> which is default.
</P>
<P>
The parameter <i>Vknee</i> which is the forward threshold voltage, allows to displace
the knee point <br> 
along  the <i>Gon</i>-characteristic until <i>v = Vknee</i>.
</p>
</HTML>
", revisions="<html>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss and Anton Haumer<br> Vknee added<br>
       </li>
<li><i>some years ago   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{30,0},{-30,40},{-30,-40},{30,0}}, fillPattern=FillPattern.Solid, lineColor={0,0,255}, fillColor={255,255,255}),Line(color={0,0,255}, points={{-90,0},{40,0}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Line(points={{30,40},{30,-40}}, color={0,0,255}),Text(lineColor={0,0,255}, extent={{-100,100},{100,70}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,0},{80,0}}, color={128,128,128}),Polygon(points={{70,4},{80,0},{70,-4},{70,4}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{0,80},{0,-80}}, color={128,128,128}),Polygon(points={{-4,70},{0,80},{4,70},{-4,70}}, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{10,80},{20,70}}, fillColor={128,128,128}, textString="i"),Text(lineColor={0,0,255}, extent={{70,-10},{80,-20}}, fillColor={128,128,128}, textString="v"),Line(points={{-80,-40},{-20,-10},{20,10},{40,70}}, color={0,0,0}, thickness=0.5),Line(points={{20,9},{20,0}}, color={128,128,128}, pattern=LinePattern.Dot),Text(lineColor={0,0,255}, extent={{20,0},{40,-10}}, fillColor={128,128,128}, textString="Vknee"),Text(lineColor={0,0,255}, extent={{20,70},{40,60}}, fillColor={128,128,128}, textString="Ron"),Text(lineColor={0,0,255}, extent={{-20,10},{0,0}}, fillColor={128,128,128}, textString="Goff"),Ellipse(lineColor={0,0,255}, extent={{18,12},{22,8}}, pattern=LinePattern.Dot, fillPattern=FillPattern.Solid)}));
  equation 
    off=s < 0;
    v = (s*unitCurrent)*(if off then 1 else Ron) + Vknee;
    i = (s*unitVoltage)*(if off then Goff else 1) + Goff*Vknee;
  end IdealDiode;

  model IdealTransformer "Ideal electrical transformer"
    extends Interfaces.TwoPort;
    parameter Real n=1 "Turns ratio";
    annotation(Documentation(info="<html>
<P>
The ideal transformer is an ideal two-port resistive circuit element
which is characterized by the following two equations:
</P>
<PRE>
    v1 =  n * v2
    i2 = -n * i1
</PRE>
<P>
where <i>n</i> is a real number called the turns ratio.
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
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,0},{-20,25}}, startAngle=-90, endAngle=90),Line(visible=true, points={{-96,50},{-32,50}}, color={0,0,255}),Line(visible=true, points={{-96,-50},{-32,-50}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,25},{45,50}}, startAngle=90, endAngle=-90),Line(visible=true, points={{32,50},{96,50}}, color={0,0,255}),Line(visible=true, points={{32,-50},{96,-50}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,25},{-20,50}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-25},{-20,0}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-50},{-20,-25}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,0},{45,25}}, startAngle=90, endAngle=-90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-25},{45,0}}, startAngle=90, endAngle=-90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-50},{45,-25}}, startAngle=90, endAngle=-90)}), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,80},{100,114.8}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-50},{-20,-25}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-25},{-20,0}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,0},{-20,25}}, startAngle=-90, endAngle=90),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,25},{-20,50}}, startAngle=-90, endAngle=90),Line(visible=true, points={{-90,50},{-32,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-32,-50}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-50},{45,-25}}, startAngle=90, endAngle=-90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-25},{45,0}}, startAngle=90, endAngle=-90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,0},{45,25}}, startAngle=90, endAngle=-90),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,25},{45,50}}, startAngle=90, endAngle=-90),Line(visible=true, points={{32,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{32,-50},{90,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-80}}, textString="n=%n", fontName="Arial")}));
  equation 
    v1=n*v2;
    i2=-n*i1;
  end IdealTransformer;

  model IdealGyrator "Ideal gyrator"
    extends Interfaces.TwoPort;
    annotation(Documentation(info="<html>
<P>
A gyrator is an ideal two-port element defined by the following equations:
</P>
<PRE>
    i1 =  G * v2
    i2 = -G * v1
</PRE>
<P>
where the constant <i>G</i> is called the gyration conductance.
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-70,-30},{-10,30}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80,-40},{-41,40}}),Line(visible=true, points={{-96,50},{-40,50},{-40,-50},{-96,-50}}, color={0,0,255}),Line(visible=true, points={{-30,60},{20,60}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{20,63},{30,60},{20,57},{20,63}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{10,-30},{70,30}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{40,-40},{80,40}}),Line(visible=true, points={{96,50},{40,50},{40,-50},{96,-50}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-70,-30},{-10,30}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80,-40},{-41,40}}),Line(visible=true, points={{-90,50},{-40,50},{-40,-50},{-90,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,70},{100,100}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-30,60},{20,60}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{20,63},{30,60},{20,57},{20,63}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{10,-30},{70,30}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{40,-40},{80,40}}),Line(visible=true, points={{90,50},{40,50},{40,-50},{90,-50}}, color={0,0,255})}));
    parameter SI.Conductance G=1 "Gyration conductance";
  equation 
    i1=G*v2;
    i2=-G*v1;
  end IdealGyrator;

  model Idle "Idle branch"
    extends Interfaces.OnePort;
    annotation(Documentation(info="<html>
<P>
The model Idle is a simple idle running branch.
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-96,0},{-41,0}}, color={0,0,255}),Line(visible=true, points={{96,0},{40,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-90,0},{-41,0}}, color={0,0,255}),Line(visible=true, points={{91,0},{40,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,70},{100,100}}, textString="%name", fontName="Arial")}));
  equation 
    i=0;
  end Idle;

  model Short "Short cut branch"
    extends Interfaces.OnePort;
    annotation(Documentation(info="<html>
<P>
The model Short is a simple short cut branch.
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-60,-60},{60,60}}),Line(visible=true, points={{96,0},{-96,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,70},{100,100}}, textString="Short", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-60},{60,60}}),Line(visible=true, points={{91,0},{-90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,70},{100,100}}, textString="%name", fontName="Arial")}));
  equation 
    v=0;
  end Short;

  model IdealOpeningSwitch "Ideal electrical opener"
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance" annotation(extent=[-56.6667,10;-10,56.6667]);
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance" annotation(extent=[10,10;56.6667,56.6667]);
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{0,51},{0,26}}, color={0,0,255}),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial"),Line(visible=true, points={{0,51},{0,26}}, color={0,0,255}),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255})}));
    Modelica.Blocks.Interfaces.BooleanInput control "true => switch open, false => p--n connected" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
    annotation(Documentation(info="<HTML>
<P> 
The ideal opening switch has a positive pin p and a negative pin n. 
The switching behaviour is controlled by the input signal control. 
If control is true, pin p is not connected 
with negative pin n. Otherwise, pin p is connected 
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-90,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Line(color={0,0,255}, points={{0,51},{0,26}}),Line(color={0,0,255}, points={{40,20},{40,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-96,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{96,0}}),Text(lineColor={0,0,255}, extent={{-100,-40},{100,-79}}, textString="%name"),Line(color={0,0,255}, points={{0,51},{0,26}}),Line(color={0,0,255}, points={{40,20},{40,0}})}));
  equation 
   v = (s*unitCurrent)*(if control then 1 else Ron);
   i = (s*unitVoltage)*(if control then Goff else 1);
  end IdealOpeningSwitch;

  model IdealClosingSwitch "Ideal electrical closer"
    extends Modelica.Electrical.Analog.Interfaces.OnePort;
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance" annotation(extent=[-56.6667,10;-10,56.6667]);
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance" annotation(extent=[10,10;56.6667,56.6667]);
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial"),Line(visible=true, points={{0,51},{0,26}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{0,51},{0,26}}, color={0,0,255})}));
    Modelica.Blocks.Interfaces.BooleanInput control "true => p--n connected, false => switch open" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-450), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
    annotation(Documentation(info="<HTML>
<P> 
The ideal closing switch has a positive pin p and a negative pin n. 
The switching behaviour is controlled by input signal control. 
If control is true, pin p is connected 
with negative pin n. Otherwise, pin p is not connected 
with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-90,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Line(color={0,0,255}, points={{0,51},{0,26}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-96,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{96,0}}),Text(lineColor={0,0,255}, extent={{-100,-40},{100,-79}}, textString="%name"),Line(color={0,0,255}, points={{0,51},{0,26}})}));
  equation 
   v = (s*unitCurrent)*(if control then Ron else 1);
   i = (s*unitVoltage)*(if control then 1 else Goff);
  end IdealClosingSwitch;

  model ControlledIdealOpeningSwitch "Controlled ideal electrical opener"
    parameter SI.Voltage level=0.5 "Switch level" annotation(extent=[-56.6667,10;-10,56.6667]);
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance" annotation(extent=[10,10;56.6667,56.6667]);
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance" annotation(extent=[-56.6667,-56.6667;-10,-10]);
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial"),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{0,96},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255})}));
    Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Pin control "Control pin: control.v > level switch open, otherwise p--n connected" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
    annotation(Documentation(info="
<HTML>
<P>
The ideal switch has a positive pin p and a negative pin n. 
The switching behaviour is controlled by the control pin. 
If its voltage exceeds the voltage of the parameter level,
pin p is not connected with negative pin n. 
Otherwise, pin p is connected with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-90,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Line(color={0,0,255}, points={{0,90},{0,25}}),Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name"),Line(color={0,0,255}, points={{40,20},{40,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-96,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{96,0}}),Line(color={0,0,255}, points={{0,96},{0,25}}),Line(color={0,0,255}, points={{40,20},{40,0}})}));
  equation 
    control.i=0;
    0=p.i + n.i;
    p.v - n.v = (s*unitCurrent)*(if (control.v > level) then 1 else Ron);
    p.i = (s*unitVoltage)*(if (control.v > level) then Goff else 1);
  end ControlledIdealOpeningSwitch;

  model ControlledIdealClosingSwitch "Controlled ideal electrical closer"
    parameter SI.Voltage level=0.5 "Switch level" annotation(extent=[-56.6667,10;-10,56.6667]);
    parameter SI.Resistance Ron(final min=0)=1e-05 "Closed switch resistance" annotation(extent=[10,10;56.6667,56.6667]);
    parameter SI.Conductance Goff(final min=0)=1e-05 "Opened switch conductance" annotation(extent=[-56.6667,-56.6667;-10,-10]);
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,-70}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-96,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,0},{96,0}}, color={0,0,255}),Line(visible=true, points={{0,96},{0,25}}, color={0,0,255})}));
    Modelica.Electrical.Analog.Interfaces.PositivePin p annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.NegativePin n annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Electrical.Analog.Interfaces.Pin control "Control pin: control.v > level switch closed, otherwise switch open" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
  protected 
    Real s "Auxiliary variable";
    parameter Modelica.SIunits.Voltage unitVoltage= 1  annotation(HideResult=true);
    parameter Modelica.SIunits.Current unitCurrent= 1  annotation(HideResult=true);
    annotation(Documentation(info="
<HTML>
<P>
The closing ideal switch has a positive pin p and a negative pin n. 
The switching behaviour is controlled by the control pin. 
If its voltage exceeds the voltage of the parameter level,
pin p is connected with negative pin n. 
Otherwise, pin p is not connected with negative pin n.
</P>
<P>
In order to prevent singularities during switching, the opened 
switch has a (very low) conductance Goff
and the closed switch has a (very low) resistance Ron. 
The limiting case is also allowed, i.e., the resistance Ron of the
closed switch could be exactly zero and the conductance Goff of the
open switch could be also exactly zero. Note, there are circuits, 
where a description with zero Ron or zero Goff is not possible. 
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
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-90,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{90,0}}),Line(color={0,0,255}, points={{0,90},{0,25}}),Text(lineColor={0,0,255}, extent={{-100,-70},{100,-100}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(lineColor={0,0,255}, extent={{-44,4},{-36,-4}}),Line(color={0,0,255}, points={{-96,0},{-44,0}}),Line(color={0,0,255}, points={{-37,2},{40,50}}),Line(color={0,0,255}, points={{40,0},{96,0}}),Line(color={0,0,255}, points={{0,96},{0,25}})}));
  equation 
    control.i=0;
    0=p.i + n.i;
    p.v - n.v = (s*unitCurrent)*(if (control.v > level) then Ron else 1);
    p.i = (s*unitVoltage)*(if (control.v > level) then 1 else Goff);
  end ControlledIdealClosingSwitch;

end Ideal;
