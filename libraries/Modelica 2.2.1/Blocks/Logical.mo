within Modelica.Blocks;
package Logical "Components with Boolean input and output signals"
  extends Modelica.Icons.Library;
  annotation(preferedView="info", Documentation(info="<html>
<p>
This package provides blocks with Boolean input and output signals
to describe logical networks. A typical example for a logical
network built with package Logical is shown in the next figure:
</p>
<p align=\"center\">
<img src=\"../Images/LogicalNetwork1.png\">
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  model And "Logical 'and': y = u1 and u2"
    extends Blocks.Interfaces.partialBooleanSI2SO;
    annotation(defaultComponentName="and1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="and", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u1 and u2;
  end And;

  model Or "Logical 'or': y = u1 or u2"
    extends Blocks.Interfaces.partialBooleanSI2SO;
    annotation(defaultComponentName="or1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="or", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u1 or u2;
  end Or;

  model Xor "Logical 'xor': y = u1 xor u2"
    extends Blocks.Interfaces.partialBooleanSI2SO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="xor", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=not (u1 and u2 or not u1 and not u2);
  end Xor;

  model Nor "Logical 'nor': y = not (u1 or u2)"
    extends Blocks.Interfaces.partialBooleanSI2SO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="nor", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=not (u1 or u2);
  end Nor;

  model Nand "Logical 'nand': y = not (u1 and u2)"
    extends Blocks.Interfaces.partialBooleanSI2SO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="nand", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=not (u1 and u2);
  end Nand;

  model Not "Logical 'not': y = not u"
    extends Blocks.Interfaces.partialBooleanSISO;
    annotation(defaultComponentName="not1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="not", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=not u;
  end Not;

  model Pre "y = pre(u): Breaks algebraic loops by an infinitesimal small time delay (event iteration continues until u = pre(u))"
    parameter Boolean pre_u_start=false "Start value of pre(u) at initial time";
    extends Blocks.Interfaces.partialBooleanSISO;
    annotation(defaultComponentName="pre1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="pre", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  initial equation 
    pre(u)=pre_u_start;
  equation 
    y=pre(u);
  end Pre;

  model Edge "y = edge(u): Output y is true, if the input u has a rising edge"
    parameter Boolean pre_u_start=false "Start value of pre(u) at initial time";
    extends Blocks.Interfaces.partialBooleanSISO;
    annotation(defaultComponentName="edge1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="edge", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  initial equation 
    pre(u)=pre_u_start;
  equation 
    y=edge(u);
  end Edge;

  model FallingEdge "y = edge(not u): Output y is true, if the input u has a falling edge"
    parameter Boolean pre_u_start=false "Start value of pre(u) at initial time";
    extends Blocks.Interfaces.partialBooleanSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="falling", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  protected 
    Boolean not_u=not u;
  initial equation 
    pre(not_u)=not pre_u_start;
  equation 
    y=edge(not_u);
  end FallingEdge;

  model Change "y = change(u): Output y is true, if the input u has a rising or falling edge"
    parameter Boolean pre_u_start=false "Start value of pre(u) at initial time";
    extends Blocks.Interfaces.partialBooleanSISO;
    annotation(defaultComponentName="change1", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{90,40}}, textString="change", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  initial equation 
    pre(u)=pre_u_start;
  equation 
    y=change(u);
  end Change;

  block GreaterThreshold "Output y is true, if input u is greater than threshold"
    extends Blocks.Interfaces.partialBooleanThresholdComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{60,40}}, textString=">", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u > threshold;
  end GreaterThreshold;

  block GreaterEqualThreshold "Output y is true, if input u is greater or equal than threshold"
    extends Blocks.Interfaces.partialBooleanThresholdComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{60,40}}, textString=">=", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u >= threshold;
  end GreaterEqualThreshold;

  block LessThreshold "Output y is true, if input u is less than threshold"
    extends Blocks.Interfaces.partialBooleanThresholdComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{60,40}}, textString="<", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u < threshold;
  end LessThreshold;

  block LessEqualThreshold "Output y is true, if input u is less or equal than threshold"
    extends Blocks.Interfaces.partialBooleanThresholdComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,-40},{60,40}}, textString="<=", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
 
</html>"));
  equation 
    y=u <= threshold;
  end LessEqualThreshold;

  block Greater "Output y is true, if input u1 is greater as input u2"
    extends Blocks.Interfaces.partialBooleanComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{32,-10},{52,10}}),Line(visible=true, points={{-100,-80},{42,-80},{42,0}}),Text(visible=true, extent={{-80,-60},{20,60}}, textString=">", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=u1 > u2;
  end Greater;

  block GreaterEqual "Output y is true, if input u1 is greater or equal as input u2"
    extends Blocks.Interfaces.partialBooleanComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{32,-10},{52,10}}),Line(visible=true, points={{-100,-80},{42,-80},{42,0}}),Text(visible=true, extent={{-80,-60},{20,60}}, textString=">=", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=u1 >= u2;
  end GreaterEqual;

  block Less "Output y is true, if input u1 is less as input u2"
    extends Blocks.Interfaces.partialBooleanComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{32,-10},{52,10}}),Line(visible=true, points={{-100,-80},{42,-80},{42,0}}),Text(visible=true, extent={{-80,-60},{20,60}}, textString="<", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=u1 < u2;
  end Less;

  block LessEqual "Output y is true, if input u1 is less or equal as input u2"
    extends Blocks.Interfaces.partialBooleanComparison;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{32,-10},{52,10}}),Line(visible=true, points={{-100,-80},{42,-80},{42,0}}),Text(visible=true, extent={{-80,-60},{20,60}}, textString="<=", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=u1 <= u2;
  end LessEqual;

  block ZeroCrossing "Trigger zero crossing of input u"
    extends Blocks.Interfaces.partialBooleanSO;
    annotation(Documentation(info="<HTML>
<p>
The output \"y\" is <b>true</b> at the
time instant when the input \"u\" becomes
zero, provided the input \"enable\" is
<b>true</b>. At all other time instants, the output \"y\" is <b>false</b>.
If the input \"u\" is zero at a time instant when the \"enable\"
input changes its value, then the output y is <b>false</b>.
</p>
<p>
Note, that in the plot window of a Modelica simulator, the output of
this block is usually identically to <b>false</b>, because the output
may only be <b>true</b> at an event instant, but not during
continuous integration. In order to check that this component is
actually working as expected, one should connect its output to, e.g.,
component <i>ModelicaAdditions.Blocks.Discrete.TriggeredSampler</i>.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-78,68},{-78,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-78,90},{-86,68},{-70,68},{-78,90}}),Line(visible=true, points={{-88,0},{70,0}}, color={192,192,192}),Line(visible=true, points={{-78,0},{-73.2,32.3},{-70,50.3},{-66.7,64.5},{-63.5,74.2},{-60.3,79.3},{-57.1,79.6},{-53.9,75.3},{-50.7,67.1},{-46.6,52.2},{-41,25.8},{-33,-13.9},{-28.2,-33.7},{-24.1,-45.9},{-20.1,-53.2},{-16.1,-55.3},{-12.1,-52.5},{-8.1,-45.3},{-3.23,-32.1},{10.44,13.7},{15.3,26.4},{20.1,34.8},{24.1,38},{28.9,37.2},{33.8,31.8},{40.2,19.4},{53.1,-10.5},{59.5,-21.2},{65.1,-25.9},{70.7,-25.9},{77.2,-20.5},{82,-13.8}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{92,0},{70,8},{70,-8},{92,0}}),Line(visible=true, points={{-36,-59},{-36,81}}, color={255,0,255}),Line(visible=true, points={{6,-59},{6,81}}, color={255,0,255}),Line(visible=true, points={{49,-59},{49,81}}, color={255,0,255}),Line(visible=true, points={{-78,0},{70,0}}, color={255,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanInput enable "Zero input crossing is triggered if the enable input signal is true" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90)));
  protected 
    Boolean disable=not enable;
    Boolean u_pos;
  initial equation 
    pre(u_pos)=false;
    pre(enable)=false;
    pre(disable)=not pre(enable);
  equation 
    u_pos=enable and u >= 0;
    y=change(u_pos) and not edge(enable) and not edge(disable);
  end ZeroCrossing;

  block LogicalSwitch "Logical Switch"
    extends Blocks.Interfaces.partialBooleanSI3SO;
    annotation(Documentation(info="<html>
<p>The LogicalSwitch switches, depending on the
Boolean u2 connector (the middle connector),
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is true, connector y is set equal to
u1, else it is set equal to u2.</p>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{12,0},{100,0}}, color={255,0,255}),Line(visible=true, points={{-100,0},{-40,0}}, color={255,0,255}),Line(visible=true, points={{-100,-80},{-40,-80},{-40,-80}}, color={255,0,255}),Line(visible=true, points={{-40,12},{-40,-10}}, color={255,0,255}),Line(visible=true, points={{-100,80},{-40,80}}, color={255,0,255}),Line(visible=true, points={{-40,80},{8,2}}, color={255,0,127}, thickness=1),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{2,-6},{18,8}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  equation 
    y=if u2 then u1 else u3;
  end LogicalSwitch;

  block Switch "Switch between two Real signals"
    extends Blocks.Interfaces.partialBooleanBlockIcon;
    annotation(defaultComponentName="switch1", Documentation(info="<html>
<p>The Logical.Switch switches, depending on the
logical connector u2 (the middle connector)
between the two possible input signals
u1 (upper connector) and u3 (lower connector).</p>
<p>If u2 is <b>true</b>, the output signal y is set equal to
u1, else it is set equal to u3.</p>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{12,0},{100,0}}),Line(visible=true, points={{-100,0},{-40,0}}, color={255,0,127}),Line(visible=true, points={{-100,-80},{-40,-80},{-40,-80}}),Line(visible=true, points={{-40,12},{-40,-12}}, color={255,0,127}),Line(visible=true, points={{-100,80},{-38,80}}),Line(visible=true, points={{-38,80},{6,2}}, thickness=1),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{2,-6},{18,8}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u1 "Connector of first Real input signal" annotation(Placement(visible=true, transformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanInput u2 "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.RealInput u3 "Connector of second Real input signal" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    y=if u2 then u1 else u3;
  end Switch;

  block Hysteresis "Transform Real to Boolean signal with Hysteresis"
    extends Blocks.Interfaces.partialBooleanBlockIcon;
    parameter Real uLow=0 "if y=true and u<=uLow, switch to y=false";
    parameter Real uHigh=1 "if y=false and u>=uHigh, switch to y=true";
    parameter Boolean pre_y_start=false "Value of pre(y) at initial time";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-65,89},{-73,67},{-57,67},{-65,89}}),Line(visible=true, points={{-65,67},{-65,-81}}, color={192,192,192}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Text(visible=true, fillColor={160,160,160}, extent={{70,-100},{94,-80}}, textString="time", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-65,75},{-12,93}}, textString="y", fontName="Arial"),Line(visible=true, points={{-80,-70},{30,-70}}, thickness=0.5),Line(visible=true, points={{-50,10},{80,10}}, thickness=0.5),Line(visible=true, points={{-50,10},{-50,-70}}, thickness=0.5),Line(visible=true, points={{30,10},{30,-70}}, thickness=0.5),Line(visible=true, points={{-10,-65},{0,-70},{-10,-75}}, thickness=0.5),Line(visible=true, points={{-10,15},{-20,10},{-10,5}}, thickness=0.5),Line(visible=true, points={{-55,-20},{-50,-30},{-44,-20}}, thickness=0.5),Line(visible=true, points={{25,-30},{30,-19},{35,-30}}, thickness=0.5),Text(visible=true, fillColor={160,160,160}, extent={{-99,2},{-70,18}}, textString="true", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-98,-87},{-66,-73}}, textString="false", fontName="Arial"),Text(visible=true, extent={{19,-87},{44,-70}}, textString="uHigh", fontName="Arial"),Text(visible=true, extent={{-63,-88},{-38,-71}}, textString="uLow", fontName="Arial"),Line(visible=true, points={{-69,10},{-60,10}}, color={160,160,160})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,68},{-80,-29}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{92,-29},{70,-21},{70,-37},{92,-29}}),Line(visible=true, points={{-79,-29},{84,-29}}, color={192,192,192}),Line(visible=true, points={{-79,-29},{41,-29}}),Line(visible=true, points={{-15,-21},{1,-29},{-15,-36}}),Line(visible=true, points={{41,51},{41,-29}}),Line(visible=true, points={{33,3},{41,22},{50,3}}),Line(visible=true, points={{-49,51},{81,51}}),Line(visible=true, points={{-4,59},{-19,51},{-4,43}}),Line(visible=true, points={{-59,29},{-49,11},{-39,29}}),Line(visible=true, points={{-49,51},{-49,-29}}),Text(visible=true, fillColor={192,192,192}, extent={{-92,-92},{-9,-49}}, textString="%uLow", fontName="Arial"),Text(visible=true, fillColor={192,192,192}, extent={{2,-92},{91,-49}}, textString="%uHigh", fontName="Arial"),Rectangle(visible=true, lineColor={192,192,192}, extent={{-91,-92},{-8,-49}}),Line(visible=true, points={{-49,-29},{-49,-49}}, color={192,192,192}),Rectangle(visible=true, lineColor={192,192,192}, extent={{2,-92},{91,-49}}),Line(visible=true, points={{41,-29},{41,-49}}, color={192,192,192})}), Documentation(info="<HTML>
<p>
This block transforms a <b>Real</b> input signal into a <b>Boolean</b>
output signal:
</p>
<ul>
<li> When the output was <b>false</b> and the input becomes
     <b>greater</b> than parameter <b>uHigh</b>, the output
     switches to <b>true</b>.</li>
<li> When the output was <b>true</b> and the input becomes
     <b>less</b> than parameter <b>uLow</b>, the output
     switches to <b>false</b>.</li>
</ul>
<p>
The start value of the output is defined via parameter
<b>pre_y_start</b> (= value of pre(y) at initial time).
The default value of this parameter is <b>false</b>.
</p>
</HTML>
"));
    Blocks.Interfaces.RealInput u annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  initial equation 
    pre(y)=pre_y_start;
  equation 
    y=u > uHigh or pre(y) and u >= uLow;
  end Hysteresis;

  block OnOffController "On-off controller"
    extends Interfaces.partialBooleanBlockIcon;
    parameter Real bandwidth=0.1 "Bandwidth around reference signal";
    parameter Boolean pre_y_start=false "Value of pre(y) at initial time";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineThickness=0.5, extent={{-92,44},{44,74}}, textString="reference", fontName="Arial"),Text(visible=true, extent={{-94,-74},{-34,-52}}, textString="u", fontName="Arial"),Line(visible=true, points={{-76,-32},{-68,-6},{-50,26},{-24,40},{-2,42},{16,36},{32,28},{48,12},{58,-6},{68,-28}}),Line(visible=true, points={{-78,-2},{-6,18},{82,-12}}, color={255,0,0}),Line(visible=true, points={{-78,12},{-6,30},{82,0}}),Line(visible=true, points={{-78,-16},{-6,4},{82,-26}}),Line(visible=true, points={{-82,-18},{-56,-18},{-56,-40},{64,-40},{64,-20},{90,-20}}, color={255,0,255})}), Documentation(info="<html>
<p>The block OnOffController sets the output signal <b>y</b> to <b>true</b> when
the input signal <b>u</b> falls below the <b>reference</b> signal minus half of
the bandwidth and sets the output signal <b>y</b> to <b>false</b> when the input
signal <b>u</b> exceeds the <b>reference</b> signal plus half of the bandwidth.</p>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput reference "Connector of Real input signal used as reference signal" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,20},{20,-20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,20},{20,-20}}, rotation=0)));
    Blocks.Interfaces.RealInput u "Connector of Real input signal used as measurement signal" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,20},{20,-20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,20},{20,-20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Real output signal used as actuator signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  initial equation 
    pre(y)=pre_y_start;
  equation 
    y=pre(y) and u < reference + bandwidth/2 or u < reference - bandwidth/2;
  end OnOffController;

  block TriggeredTrapezoid "Triggered trapezoid generator"
    extends Interfaces.partialBooleanBlockIcon;
    parameter Real amplitude=1 "Amplitude of trapezoid";
    parameter Modelica.SIunits.Time rising(final min=0)=0 "Rising duration of trapezoid";
    parameter Modelica.SIunits.Time falling(final min=0)=rising "Falling duration of trapezoid";
    parameter Real offset=0 "Offset of output signal";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-60,-70},{-60,-70},{-30,40},{8,40},{40,-70},{40,-70}}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-70},{-60,-70},{-60,24},{8,24},{8,-70},{60,-70}}, color={255,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-20},{-60,-20},{-30,40},{8,40},{40,-20},{60,-20}}),Line(visible=true, points={{-90,-70},{82,-70}}),Line(visible=true, points={{-80,68},{-80,-80}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-68},{-60,-68},{-60,-42},{8,-42},{8,-68},{60,-68}}, color={255,0,255}),Line(visible=true, points={{-60,40},{-60,-42}}, pattern=LinePattern.Dot),Line(visible=true, points={{8,-42},{8,40}}, pattern=LinePattern.Dot),Line(visible=true, points={{-60,40},{-30,40}}),Line(visible=true, points={{8,-20},{40,-20}}),Line(visible=true, points={{-20,40},{-20,-20}}),Line(visible=true, points={{-20,-20},{-20,-70}}),Text(visible=true, extent={{-44,40},{-44,50}}, textString="rising", fontName="Arial"),Text(visible=true, extent={{24,-20},{24,-10}}, textString="falling", fontName="Arial"),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-60,40},{-56,42},{-56,38},{-60,40}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-30,40},{-34,42},{-34,38},{-30,40}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{8,-20},{12,-18},{12,-22},{8,-20}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{40,-20},{36,-18},{36,-22},{40,-20}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-22,-24},{-20,-20},{-18,-24},{-22,-24}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-18,-66},{-22,-66},{-20,-70},{-18,-66}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-22,36},{-20,40},{-18,36},{-22,36}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-18,-16},{-22,-16},{-20,-20},{-18,-16}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-4},{0,6}}),Text(visible=true, extent={{-20,-4},{-20,6}}, textString="amplitude", fontName="Arial"),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-58},{0,-48}}),Text(visible=true, extent={{-20,-58},{-20,-48}}, textString="offset", fontName="Arial"),Text(visible=true, extent={{60,-92},{94,-82}}, textString="time", fontName="Arial"),Text(visible=true, extent={{-88,-14},{-54,-4}}, textString="y", fontName="Arial"),Text(visible=true, extent={{-88,-56},{-54,-46}}, textString="u", fontName="Arial")}), Documentation(info="<HTML>
<p>The block TriggeredTrapezoid has a boolean input and a real
output signal and requires the parameters <i>amplitude</i>,
<i>rising</i>, <i>falling</i> and <i>offset</i>. The
output signal <b>y</b> represents a trapezoidal signal dependent on the
input signal <b>u</b>.
</p>
<p>The behaviour is as follows: Assume the initial input to be false. In this
case, the output will be <i>offset</i>. After a rising edge (i.e. the input
changes from false to true), the output is rising during <i>rising</i> to the
sum of <i>offset</i> and <i>amplitude</i>. In contrast, after a falling
edge (i.e. the input changes from true to false), the output is falling
during <i>falling</i> to a value of <i>offset</i>.
</p>
<p>Note, that the case of edges before expiration of rising or falling is
handled properly.</p>
</HTML>
"));
    Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    discrete Real endValue "Value of y at time of recent edge";
    discrete Real rate "Current rising/falling rate";
    discrete Modelica.SIunits.Time T "Predicted time of output reaching endValue";
  initial equation 
    pre(y)=0;
  equation 
    y=if time < T then endValue - (T - time)*rate else endValue;
    when {initial(),u,not u} then
      endValue=if u then offset + amplitude else offset;
      rate=if u and rising > 0 then amplitude/rising else if not u and falling > 0 then -amplitude/falling else 0;
      T=if u and not rising > 0 or not u and not falling > 0 or not abs(amplitude) > 0 or initial() then time else time + (endValue - pre(y))/rate;
    end when;
  end TriggeredTrapezoid;

  block Timer "Timer measuring the time from the time instant where the Boolean input became true"
    extends Interfaces.partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-70},{-60,-70},{-60,-26},{38,-26},{38,-70},{66,-70}}, color={255,0,255}),Line(visible=true, points={{-80,0},{-62,0},{40,90},{40,0},{68,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,-70},{82,-70}}),Line(visible=true, points={{-80,68},{-80,-80}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-80,-68},{-60,-68},{-60,-40},{20,-40},{20,-68},{60,-68}}, color={255,0,255}),Line(visible=true, points={{-80,-20},{-60,-20},{20,60},{20,-20},{60,-20},{60,-20}}, color={0,0,255}),Text(visible=true, extent={{-88,-4},{-54,6}}, textString="y", fontName="Arial"),Text(visible=true, extent={{48,-88},{84,-80}}, textString="time", fontName="Arial"),Text(visible=true, extent={{-88,-46},{-54,-36}}, textString="u", fontName="Arial")}), Documentation(info="<HTML>
<p> When the Boolean input \"u\" becomes <b>true</b>, the timer is started
and the output \"y\" is the time from the time instant where u became true.
The timer is stopped and the output is reset to zero, once the
input becomes false.
</p>
</HTML>
"));
    Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    discrete Modelica.SIunits.Time entryTime "Time instant when u became true";
  initial equation 
    pre(entryTime)=0;
  equation 
    when u then
      entryTime=time;
    end when;
    y=if u then time - entryTime else 0.0;
  end Timer;

end Logical;
