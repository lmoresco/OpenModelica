within Modelica.Electrical.Analog;
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

  partial model TwoPin "Component with one electrical port"
    SI.Voltage v "Voltage drop between the two pins (= p.v - n.v)";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-120,3},{-110,0},{-120,-3},{-120,3}}),Line(visible=true, points={{-136,0},{-111,0}}, color={160,160,160}),Text(visible=true, fillColor={160,160,160}, extent={{-134,5},{-117,20}}, textString="p.i", fontName="Arial"),Line(visible=true, points={{110,0},{135,0}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{120,3},{110,0},{120,-3},{120,3}}),Text(visible=true, fillColor={160,160,160}, extent={{117,3},{134,18}}, textString="n.i", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    PositivePin p "Positive pin Positive pin (potential p.v > n.v for positive voltage drop v)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    NegativePin n "Negative pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    v=p.v - n.v;
  end TwoPin;

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

  partial model TwoPort "Component with two electrical ports, including current"
    SI.Voltage v1 "Voltage drop over the left port";
    SI.Voltage v2 "Voltage drop over the right port";
    SI.Current i1 "Current flowing from pos. to neg. pin of the left port";
    SI.Current i2 "Current flowing from pos. to neg. pin of the right port";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-120,53},{-110,50},{-120,47},{-120,53}}),Line(visible=true, points={{-136,50},{-111,50}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{127,-47},{137,-50},{127,-53},{127,-47}}),Line(visible=true, points={{111,-50},{136,-50}}, color={160,160,160}),Text(visible=true, fillColor={160,160,160}, extent={{112,-44},{128,-29}}, textString="i2", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{118,52},{135,67}}, textString="i2", fontName="Arial"),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{120,53},{110,50},{120,47},{120,53}}),Line(visible=true, points={{111,50},{136,50}}, color={160,160,160}),Line(visible=true, points={{-136,-49},{-111,-49}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-126,-46},{-136,-49},{-126,-52},{-126,-46}}),Text(visible=true, fillColor={160,160,160}, extent={{-127,-46},{-110,-31}}, textString="i1", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-136,53},{-119,68}}, textString="i1", fontName="Arial")}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>", info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    PositivePin p1 "Positive pin of the left port (potential p1.v > n1.v for positive voltage drop v1)" annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
    NegativePin n1 "Negative pin of the left port" annotation(Placement(visible=true, transformation(origin={-100,-50}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={-100,-50}, extent={{10,-10},{-10,10}}, rotation=0)));
    PositivePin p2 "Positive pin of the right port (potential p2.v > n2.v for positive voltage drop v2)" annotation(Placement(visible=true, transformation(origin={100,50}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{10,-10},{-10,10}}, rotation=0)));
    NegativePin n2 "Negative pin of the right port" annotation(Placement(visible=true, transformation(origin={100,-50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    v1=p1.v - n1.v;
    v2=p2.v - n2.v;
    0=p1.i + n1.i;
    0=p2.i + n2.i;
    i1=p1.i;
    i2=p2.i;
  end TwoPort;

  partial model AbsoluteSensor "Base class to measure the absolute value of a pin variable"
    extends Modelica.Icons.RotationalSensor;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p "Pin to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y "Measured quantity as Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end AbsoluteSensor;

  partial model RelativeSensor "Base class to measure a relative variable between two pins"
    extends Modelica.Icons.RotationalSensor;
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255}),Line(visible=true, points={{70,0},{96,0}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-90},{0,-70}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
    Interfaces.PositivePin p "Positive pin" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.NegativePin n "Negative pin" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y "Measured quantity as Real output signal" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=-90)));
  end RelativeSensor;

  partial model VoltageSource "Interface for voltage sources"
    extends OnePort;
    parameter SI.Voltage offset=0 "Voltage offset";
    parameter SI.Time startTime=0 "Time offset";
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{90,0}}),Text(visible=true, fillColor={0,0,255}, extent={{-120,0},{-20,50}}, textString="+", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{20,0},{120,50}}, textString="-", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset=offset, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={80,80}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    v=signalSource.y;
  end VoltageSource;

  partial model CurrentSource "Interface for current sources"
    extends OnePort;
    parameter SI.Current offset=0 "Current offset";
    parameter SI.Time startTime=0 "Time offset";
    annotation(Documentation(revisions="<html>
<ul>
<li><i>  </i>
       </li>
<li><i> 1998   </i>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-90,0},{-50,0}}),Line(visible=true, points={{50,0},{90,0}}),Line(visible=true, points={{0,-50},{0,50}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-60,-80},{60,-80}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{60,-80},{30,-70},{30,-90},{60,-80}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    replaceable Modelica.Blocks.Interfaces.SignalSource signalSource(final offset=offset, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={80.5,79}, extent={{-10.5,-10},{10.5,10}}, rotation=0)));
  equation 
    i=signalSource.y;
  end CurrentSource;

end Interfaces;
