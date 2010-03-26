within Modelica.Electrical.Analog.Examples;
model HeatingMOSInverter "Heating MOS Inverter"
  annotation(experiment(StopTime=5), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,72},{-6,100}}, textString="Heating MOS Inverter", fontName="Arial")}), Documentation(info="<HTML>
<P>
The heating MOS inverter shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
Sin.p.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and H_PMOS.heatPort.T and H_NMOS.heatPort.T<br>
H_PMOS.heatPort.Q_flow and H_NMOS.heatPort.Q_flow<br>
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
  Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(C=0.01) annotation(Placement(visible=true, transformation(origin={70.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-450)));
  Modelica.Thermal.HeatTransfer.ThermalConductor TC1(G=0.01) annotation(Placement(visible=true, transformation(origin={10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  Modelica.Thermal.HeatTransfer.ThermalConductor TC2(G=0.01) annotation(Placement(visible=true, transformation(origin={10.0,-80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  Modelica.Thermal.HeatTransfer.FixedTemperature FixedTemperature1(T=300) annotation(Placement(visible=true, transformation(origin={90.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
  Modelica.Thermal.HeatTransfer.ThermalConductor TC3(G=0.01) annotation(Placement(visible=true, transformation(origin={60.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground G annotation(Placement(visible=true, transformation(origin={-70,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.HeatingPMOS H_PMOS annotation(Placement(visible=true, transformation(origin={-30,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.HeatingNMOS H_NMOS annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage Sin(V=5) annotation(Placement(visible=true, transformation(origin={-70,8.32667e-16}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Sources.RampVoltage V(V=5, duration=0.01) annotation(Placement(visible=true, transformation(origin={50,50}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C=1e-05) annotation(Placement(visible=true, transformation(origin={30,10}, extent={{-10,-10},{10,10}}, rotation=270)));
equation 
  connect(TC3.port_a,HeatCapacitor1.port) annotation(Line(visible=true, origin={-12.0,0.0}, points={{62.0,-30.0},{52.0,-30.0},{52.0,-60.0},{72.0,-60.0}}, color={191,0,0}));
  connect(TC3.port_b,FixedTemperature1.port) annotation(Line(visible=true, origin={75.0,-30.0}, points={{-5.0,0.0},{5.0,0.0}}, color={191,0,0}));
  connect(TC2.port_a,H_NMOS.heatPort) annotation(Line(visible=true, origin={-20.0,-53.3333}, points={{20.0,-26.6667},{-10.0,-26.6667},{-10.0,53.3333}}, color={191,0,0}));
  connect(TC1.port_a,H_PMOS.heatPort) annotation(Line(visible=true, points={{-0.0,-40.0},{-10.0,-40.0},{-10.0,40.0},{-30.0,40.0}}, color={191,0,0}));
  connect(TC2.port_b,HeatCapacitor1.port) annotation(Line(visible=true, points={{20.0,-80.0},{40.0,-80.0},{40.0,-60.0},{60.0,-60.0}}, color={191,0,0}));
  connect(TC1.port_b,HeatCapacitor1.port) annotation(Line(visible=true, points={{20.0,-40.0},{40.0,-40.0},{40.0,-60.0},{60.0,-60.0}}, color={191,0,0}));
  connect(H_PMOS.B,H_PMOS.D) annotation(Line(visible=true, points={{-20.0,50.0},{-20.0,55.0}}, color={0,0,255}));
  connect(H_NMOS.S,G.p) annotation(Line(visible=true, points={{-20.0,5.0},{-20.0,-20.0},{-70.0,-20.0}}, color={0,0,255}));
  connect(H_NMOS.B,H_NMOS.S) annotation(Line(visible=true, points={{-20.0,10.0},{-20.0,5.0}}, color={0,0,255}));
  connect(H_PMOS.S,H_NMOS.D) annotation(Line(visible=true, points={{-20.0,45.0},{-20.0,15.0}}, color={0,0,255}));
  connect(H_NMOS.G,H_PMOS.G) annotation(Line(visible=true, points={{-40.0,5.0},{-40.0,45.0}}, color={0,0,255}));
  connect(Sin.n,G.p) annotation(Line(visible=true, points={{-70,-10},{-70,-20}}, color={0,0,255}));
  connect(H_NMOS.G,Sin.p) annotation(Line(visible=true, points={{-40.0,5.0},{-40.0,10.0},{-70.0,10.0}}, color={0,0,255}));
  connect(V.p,H_PMOS.D) annotation(Line(visible=true, points={{50.0,60.0},{-20.0,60.0},{-20.0,55.0}}, color={0,0,255}));
  connect(V.n,G.p) annotation(Line(visible=true, points={{50,40},{50,-20},{-70,-20}}, color={0,0,255}));
  connect(Capacitor1.n,G.p) annotation(Line(visible=true, points={{30,0},{30,-20},{-70,-20}}, color={0,0,255}));
  connect(H_NMOS.D,Capacitor1.p) annotation(Line(visible=true, points={{-20.0,15.0},{-20.0,20.0},{30.0,20.0}}, color={0,0,255}));
  annotation(Documentation(info="<HTML>
<P>
The heating MOS inverter shows a heat flow always if a transistor is leading.
</P>
<P>
Simulate until T=5 s.
</P>
<P>
Plot in separate windows:<br> <br>
Sin.p.v  and  Capacitor1.p.v <br>
HeatCapacitor1.port.T and H_PMOS.heatPort.T and H_NMOS.heatPort.T<br>
H_PMOS.heatPort.Q_flow and H_NMOS.heatPort.Q_flow<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 6, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime=5));
end HeatingMOSInverter;
