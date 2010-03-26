within Modelica.Electrical.Analog.Examples;
model HeatingRectifier "Heating rectifier"
  annotation(experiment(StopTime=5), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-94,74},{0,102}}, textString="HeatingRectifier", fontName="Arial")}), Documentation(info="<HTML>
<P>
The heating rectifier shows a heat flow always if the electrical capacitor is loaded.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
SineVoltage1.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and HeatingDiode1.heatPort.T<br>
HeatingDiode1.heatPort.Q_flow<br>
</P>
</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
by Christoph Clauss<br> realized<br>
</li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(C=1) annotation(Placement(visible=true, transformation(origin={-10.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
  Modelica.Thermal.HeatTransfer.ThermalConductor ThermalConductor1(G=10) annotation(Placement(visible=true, transformation(origin={-10.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  Modelica.Electrical.Analog.Semiconductors.HeatingDiode HeatingDiode1 annotation(Placement(visible=true, transformation(origin={-10,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(visible=true, transformation(origin={-70,10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor Capacitor1 annotation(Placement(visible=true, transformation(origin={30,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R(R=1) annotation(Placement(visible=true, transformation(origin={30,80}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1 annotation(Placement(visible=true, transformation(origin={-70,40}, extent={{-10,-10},{10,10}}, rotation=270)));
equation 
  connect(R.n,Capacitor1.n) annotation(Line(visible=true, points={{40,80},{40,50}}, color={0,0,255}));
  connect(R.p,Capacitor1.p) annotation(Line(visible=true, points={{20,80},{20,50}}, color={0,0,255}));
  connect(ThermalConductor1.port_b,HeatCapacitor1.port) annotation(Line(visible=true, points={{-10.0,-20.0},{-10.0,-25.75},{-10.0,-25.75},{-10.0,-30.5},{-10.0,-40.0},{-10.0,-40.0}}, color={191,0,0}));
  connect(HeatingDiode1.heatPort,ThermalConductor1.port_a) annotation(Line(visible=true, points={{-10.0,40.0},{-10.0,20.5},{-10.0,0.0},{-10.0,0.0}}, color={191,0,0}));
  connect(HeatingDiode1.n,Capacitor1.p) annotation(Line(visible=true, points={{0,50},{20,50}}, color={0,0,255}));
  connect(Capacitor1.n,G.p) annotation(Line(visible=true, points={{40,50},{40,20},{-70,20}}, color={0,0,255}));
  connect(SineVoltage1.p,HeatingDiode1.p) annotation(Line(visible=true, points={{-70,50},{-20,50}}, color={0,0,255}));
  connect(SineVoltage1.n,G.p) annotation(Line(visible=true, points={{-70,30},{-70,20}}, color={0,0,255}));
  annotation(Documentation(info="<HTML>
<P>
The heating rectifier shows a heat flow always if the electrical capacitor is loaded.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
SineVoltage1.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and HeatingDiode1.heatPort.T<br>
HeatingDiode1.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime=5));
end HeatingRectifier;
