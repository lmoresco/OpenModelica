within Modelica.Electrical.Analog.Examples;
model ShowVariableResistor "Simple demo of a VariableResistor model"
  extends Modelica.Icons.Example;
  annotation(Documentation(info="<HTML>
<P>
It is a simple test circuit for the VariableResistor. The VariableResistor
sould be compared with R2.
</P>
<P>
Simulate until T=1 s.
</P>
<P>
 
</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Teresa Schlegel<br> realized<br>
       </li>
</ul>
</html>"), experiment(StopTime=1), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, extent={{-100,40},{80,112}}, textString="Example VariableResistor", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  annotation(Diagram);
  Modelica.Electrical.Analog.Basic.VariableResistor VariableResistor annotation(Placement(visible=true, transformation(origin={-10,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground Ground2 annotation(Placement(visible=true, transformation(origin={70,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R1 annotation(Placement(visible=true, transformation(origin={-50,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R2 annotation(Placement(visible=true, transformation(origin={-10,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R3 annotation(Placement(visible=true, transformation(origin={30,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R4 annotation(Placement(visible=true, transformation(origin={-50,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R5 annotation(Placement(visible=true, transformation(origin={30,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1 annotation(Placement(visible=true, transformation(origin={-90,-30}, extent={{-10,-10},{10,10}}, rotation=450)));
  Modelica.Blocks.Sources.Ramp Ramp1(height=5, offset=2) annotation(Placement(visible=true, transformation(origin={-10,20}, extent={{-10,-10},{10,10}}, rotation=1350)));
equation 
  connect(Ground2.p,R5.n) annotation(Line(visible=true, points={{70,-20},{70,-10},{40,-10}}, color={0,0,255}));
  connect(R3.n,Ground2.p) annotation(Line(visible=true, points={{40,50},{70,50},{70,-20}}, color={0,0,255}));
  connect(VariableResistor.n,R5.p) annotation(Line(visible=true, points={{0,-10},{20,-10}}, color={0,0,255}));
  connect(R4.n,VariableResistor.p) annotation(Line(visible=true, points={{-40,-10},{-20,-10}}, color={0,0,255}));
  connect(R2.n,R3.p) annotation(Line(visible=true, points={{0,50},{20,50}}, color={0,0,255}));
  connect(R1.n,R2.p) annotation(Line(visible=true, points={{-40,50},{-20,50}}, color={0,0,255}));
  connect(SineVoltage1.p,Ground1.p) annotation(Line(visible=true, points={{-90,-40},{-90,-60}}, color={0,0,255}));
  connect(SineVoltage1.n,R1.p) annotation(Line(visible=true, points={{-90,-20},{-90,50},{-60,50}}, color={0,0,255}));
  connect(SineVoltage1.n,R4.p) annotation(Line(visible=true, points={{-90,-20},{-90,-10},{-60,-10}}, color={0,0,255}));
  connect(Ramp1.y,VariableResistor.R) annotation(Line(visible=true, points={{-10,9},{-10,4.5},{-10,1},{-10,1}}, color={0,0,255}));
end ShowVariableResistor;
