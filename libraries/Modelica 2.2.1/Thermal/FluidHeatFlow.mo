within Modelica.Thermal;
package FluidHeatFlow "Simple components for 1-dimensional incompressible thermo-fluid flow models"
  extends Modelica.Icons.Library2;
  annotation(version="1.50", versionDate="2005-09-07", preferedView="info", Documentation(info="<HTML>
<p>
This package contains very simple-to-use components to model coolant flows as needed to simulate cooling e.g. of electric machines:
<ul>
<li>Components: components like different types of pipe models</li>
<li>Examples: some test examples</li>
<li>Interfaces: definition of connectors and partial models 
(containing the core thermodynamic equations)</li>
<li>Media: definition of media properties</li>
<li>Sensors: various sensors for pressure, temperature, volume and enthalpy flow</li>
<li>Sources: various flow sources</li>
</ul>
</p>
<p>
<b>Variables used in connectors:</b>
<ul>
<li>Pressure p</li>
<li>flow MassFlowRate m_flow</li>
<li>SpecificEnthalpy h</li>
<li>flow EnthalpyFlowRate H_flow</li>
</ul>
EnthalpyFlowRate means the Enthalpy = cp<sub>constant</sub> * m * T that is carried by the medium's flow.
</p>
<p>
<b>Limitations and assumptions:</b>
<ul>
<li>Splitting and mixing of coolant flows (media with the same cp) is possible.</li>
<li>Reversing the direction of flow is possible.</li>
<li>The medium is considered to be incompressible.</li>
<li>No mixtures of media is taken into consideration.</li>
<li>The medium may not change its phase.</li>
<li>Medium properties are kept constant.</li>
<li>Pressure changes are only due to pressure drop and geodetic height differnence rho*g*h (if h > 0).</li>
<li>A user-defined part (0..1) of the friction losses (V_flow*dp) are fed to the medium.</li>
<li><b>Note:</b> Connected flowPorts have the same temperature (mixing temperature)!<br>
Since mixing may occur, the outlet temperature may be different from the connector's temperature.<br> 
Outlet temperature is defined by variable T of the corresponding component.</li>
</ul>
</p>
<p>
<b>Further development:</b>
<ul>
<li>Additional components like tanks (if needed)</li>
</ul>
</p>
<p>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>
</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.10 2005/02/15 Anton Haumer<br>
       reorganisation of the package</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  <li> v1.20 Beta 2005/02/18 Anton Haumer<br>
       introduced geodetic height in Components.Pipes<br>
       <i>new models: Components.Valve, Sources.IdealPump</i></li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  <li> v1.31 Beta 2005/06/04 Anton Haumer<br>
       <i>new example: PumpAndValve</i><br>
       <i>new example: PumpDropOut</i></li>
  <li> v1.33 Beta 2005/06/07 Anton Haumer<br>
       corrected usage of simpleFlow</li>
  <li> v1.40 2005/06/13 Anton Haumer<br>
       stable release</li>
  <li> v1.42 Beta 2005/06/18 Anton Haumer<br>
       <i>new test example: ParallelPumpDropOut</i></li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear<br>
       <i>new test example: OneMass</i><br>
       <i>new test example: TwoMass</i></li>
  <li> v1.50 2005/09/07 Anton Haumer<br>
       semiLinear works fine</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,127,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid, points={{-80,10},{-60,-10},{-80,-30},{-20,-30},{0,-10},{-20,10},{-80,10}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-40,-90},{-20,-70},{0,-90},{0,-50},{-20,-30},{-40,-50},{-40,-90}}),Polygon(visible=true, lineColor={255,127,0}, fillColor={255,127,0}, fillPattern=FillPattern.Solid, points={{-20,10},{0,-10},{-20,-30},{40,-30},{60,-10},{40,10},{-20,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Examples "Examples that demonstrate the usage of the FluidHeatFlow components"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains test examples:
<ul>
<li>1.SimpleCooling: heat is dissipated through a media flow</li>
<li>2.ParallelCooling: two heat sources dissipate through merged media flows</li>
<li>3.IndirectCooling: heat is disspated through two cooling cycles</li>
<li>4.PumpAndValve: demonstrates usage of an IdealPump and a Valve</li>
<li>5.PumpDropOut: demonstrates shutdown and restart of a pump</li>
<li>6.ParallelPumpDropOut: demonstrates shutdown and restart of a pump in a parallel circuit</li>
<li>7.OneMass: cooling of a mass (thermal capacity) by a coolant flow</li>
<li>8.TwoMass: cooling of two masses (thermal capacities) by two parallel coolant flows</li>
</ul>
</p>

</HTML>", revisions="<HTML>
<p>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.31 Beta 2005/06/04 Anton Haumer<br>
       <i>new example: PumpAndValve</i><br>
       <i>new example: PumpDropOut</i></li>
  <li> v1.42 Beta 2005/06/18 Anton Haumer<br>
       <i>new test example: ParallelPumpDropOut</i></li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear<br>
       <i>new test example: OneMass</i><br>
       <i>new test example: TwoMass</i></li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={128,128,128}, extent={{-60,-90},{40,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-30,-12},{-30,-68},{28,-40},{-30,-12}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model SimpleCooling
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
1st test example: SimpleCooling
</p>
<p>
A prescribed heat source dissipates its heat through a thermal conductor to a coolant flow. The coolant flow is taken from an ambient and driven by a pump with prescribed mass flow.<br>
<b>Results</b>:<br>
<table>
<tr>
<td><b>output</b></td>
<td><b>explanation</b></td>
<td><b>formula</b></td>
<td><b>actual steady-state value</b></td>
</tr>
<tr>
<td>dTSource</td>
<td>Source over Ambient</td>
<td>dtCoolant + dtToPipe</td>
<td>20 K</td>
</tr>
<tr>
<td>dTtoPipe</td>
<td>Source over Coolant</td>
<td>Losses / ThermalConductor.G</td>
<td>10 K</td>
</tr>
<tr>
<td>dTCoolant</td>
<td>Coolant's temperature increase</td>
<td>Losses * cp * massFlow</td>
<td>10 K</td>
</tr>
</table>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.0), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source over Coolant";
      output Modelica.SIunits.Temperature dTCoolant=Pipe1.dT "Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={40,-50}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-50}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant VolumeFlow(k=1) annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow(k=10) annotation(Placement(visible=true, transformation(origin={-50,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G(k=1) annotation(Placement(visible=true, transformation(origin={-20,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.Convection Convection1 annotation(Placement(visible=true, transformation(origin={10,-30}, extent={{-10,-10},{10,10}}, rotation=-270)));
    equation 
      connect(VolumeFlow.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(HeatFlow.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-50},{-30,-50}}, color={0,0,255}));
      connect(Pipe1.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{20,0},{40,0}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{0,0}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(Convection1.solid,PrescribedHeatFlow1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
      connect(Convection1.solid,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{30,-50}}, color={191,0,0}));
      connect(Pipe1.heatPort,Convection1.fluid) annotation(Line(visible=true, points={{10,-10},{10,-20}}, color={191,0,0}));
      connect(G.y,Convection1.Gc) annotation(Line(visible=true, points={{-9,-30},{0,-30}}, color={0,0,191}));
    end SimpleCooling;

    model ParallelCooling
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
2nd test example: ParallelCooling
</p>
<p>
Two prescribed heat sources dissipate their heat through thermal conductors to coolant flows. The coolant flow is taken from an ambient and driven by a pump with prescribed mass flow, then splitted into two coolant flows connected to the two heat sources, and afterwards merged. Splitting of coolant flows is determined by pressure drop characteristic of the two pipes.<br>
<b>Results</b>:<br>
<table>
<tr>
<td><b>output</b></td>
<td><b>explanation</b></td>
<td><b>formula</b></td>
<td><b>actual steady-state value</b></td>
</tr>
<tr>
<td>dTSource1</td>
<td>Source1 over Ambient</td>
<td>dTCoolant1 + dTtoPipe1</td>
<td>15 K</td>
</tr>
<tr>
<td>dTtoPipe1</td>
<td>Source1 over Coolant1</td>
<td>Losses1 / ThermalConductor1.G</td>
<td> 5 K</td>
</tr>
<tr>
<td>dTCoolant1</td>
<td>Coolant's temperature increase</td>
<td>Losses * cp * totalMassFlow/2</td>
<td>10 K</td>
</tr>
<tr>
<td>dTSource2</td>
<td>Source2 over Ambient</td>
<td>dTCoolant2 + dTtoPipe2</td>
<td>30 K</td>
</tr>
<tr>
<td>dTtoPipe2</td>
<td>Source2 over Coolant2</td>
<td>Losses2 / ThermalConductor2.G</td>
<td>10 K</td>
</tr>
<tr>
<td>dTCoolant2</td>
<td>Coolant's temperature increase</td>
<td>Losses * cp * totalMassFlow/2</td>
<td>20 K</td>
</tr>
<tr>
<td>dTmixedCoolant</td>
<td>mixed Coolant's temperature increase</td>
<td>(dTCoolant1+dTCoolant2)/2</td>
<td>15 K</td>
</tr>
</table>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.0), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource1=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source1 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe1=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source1 over Coolant1";
      output Modelica.SIunits.Temperature dTCoolant1=Pipe1.dT "Coolant1's temperature increase";
      output Modelica.SIunits.Temperature dTSource2=PrescribedHeatFlow2.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source2 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe2=PrescribedHeatFlow2.port.T - Pipe2.heatPort.T "Source2 over Coolant2";
      output Modelica.SIunits.Temperature dTCoolant2=Pipe2.dT "Coolant2's temperature increase";
      output Modelica.SIunits.Temperature dTmixedCoolant=Ambient2.T_port - Ambient1.T_port "mixed Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe2(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,10}, extent={{-10,10},{10,-10}}, rotation=0)));
      FluidHeatFlow.Components.IsolatedPipe Pipe3(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={90,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={40,-60}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-60}, extent={{10,-10},{-10,10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow2 annotation(Placement(visible=true, transformation(origin={-20,60}, extent={{10,10},{-10,-10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.Convection Convection2 annotation(Placement(visible=true, transformation(origin={10,40}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Modelica.Blocks.Sources.Constant VolumeFlow(k=1) annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow1(k=5) annotation(Placement(visible=true, transformation(origin={-50,-60}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow2(k=10) annotation(Placement(visible=true, transformation(origin={-50,60}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G1(k=1) annotation(Placement(visible=true, transformation(origin={-20,-40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G2(k=1) annotation(Placement(visible=true, transformation(origin={-20,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor2(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={37.5,60}, extent={{10,10},{-10,-10}}, rotation=-270)));
      Modelica.Thermal.HeatTransfer.Convection Convection1 annotation(Placement(visible=true, transformation(origin={10,-40}, extent={{10,10},{-10,-10}}, rotation=-90)));
    equation 
      connect(Pipe3.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{60,0},{80,0}}, color={255,0,0}));
      connect(Pipe1.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,-10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
      connect(Pipe2.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,10},{30,10},{30,0},{40,0}}, color={255,0,0}));
      connect(Convection2.solid,PrescribedHeatFlow2.port) annotation(Line(visible=true, points={{10,50},{10,60},{-10,60}}, color={191,0,0}));
      connect(Convection2.fluid,Pipe2.heatPort) annotation(Line(visible=true, points={{10,30},{10,20}}, color={191,0,0}));
      connect(G2.y,Convection2.Gc) annotation(Line(visible=true, points={{-9,40},{0,40}}, color={0,0,191}));
      connect(VolumeFlow.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(HeatFlow1.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-60},{-30,-60}}, color={0,0,255}));
      connect(HeatFlow2.y,PrescribedHeatFlow2.Q_flow) annotation(Line(visible=true, points={{-39,60},{-30,60}}, color={0,0,255}));
      connect(Pump1.flowPort_b,Pipe2.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(Convection2.solid,HeatCapacitor2.port) annotation(Line(visible=true, points={{10,50},{10,60},{27.5,60}}, color={191,0,0}));
      connect(G1.y,Convection1.Gc) annotation(Line(visible=true, points={{-9,-40},{0,-40}}, color={0,0,191}));
      connect(Pipe1.heatPort,Convection1.fluid) annotation(Line(visible=true, points={{10,-20},{10,-30}}, color={191,0,0}));
      connect(Convection1.solid,PrescribedHeatFlow1.port) annotation(Line(visible=true, points={{10,-50},{10,-60},{-10,-60}}, color={191,0,0}));
      connect(Convection1.solid,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-50},{10,-60},{30,-60}}, color={191,0,0}));
    end ParallelCooling;

    model IndirectCooling
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
3rd test example: IndirectCooling
</p>
<p>
A prescribed heat sources dissipates its heat through a thermal conductor to the inner coolant cycle. It is necessary to define the pressure level of the inner coolant cycle. The inner coolant cycle is coupled to the outer coolant flow through a thermal conductor.<br>
Inner coolant's temperature rise near the source is the same as temperature drop near the cooler.<br>
<b>Results</b>:<br>
<table>
<tr>
<td><b>output</b></td>
<td><b>explanation</b></td>
<td><b>formula</b></td>
<td><b>actual steady-state value</b></td>
</tr>
<tr>
<td>dTSource</td>
<td>Source over Ambient</td>
<td>dtouterCoolant + dtCooler + dTinnerCoolant + dtToPipe</td>
<td>40 K</td>
</tr>
<tr>
<td>dTtoPipe</td>
<td>Source over inner Coolant</td>
<td>Losses / ThermalConductor.G</td>
<td>10 K</td>
</tr>
<tr>
<td>dTinnerColant</td>
<td>inner Coolant's temperature increase</td>
<td>Losses * cp * innerMassFlow</td>
<td>10 K</td>
</tr>
<tr>
<td>dTCooler</td>
<td>Cooler's temperature rise between inner and outer pipes</td>
<td>Losses * (innerGc + outerGc)</td>
<td>10 K</td>
</tr>
<tr>
<td>dTouterColant</td>
<td>outer Coolant's temperature increase</td>
<td>Losses * cp * outerMassFlow</td>
<td>10 K</td>
</tr>
</table>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium outerMedium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter FluidHeatFlow.Media.Medium innerMedium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source over inner Coolant";
      output Modelica.SIunits.Temperature dTinnerCoolant=Pipe1.dT "inner Coolant's temperature increase";
      output Modelica.SIunits.Temperature dTCooler=innerPipe.heatPort.T - outerPipe.heatPort.T "Cooler's temperature increase between inner and outer pipes";
      output Modelica.SIunits.Temperature dTouterCoolant=outerPipe.dT "outer Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=outerMedium) annotation(Placement(visible=true, transformation(origin={-70,70}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow outerPump(medium=outerMedium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,70}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=outerMedium) annotation(Placement(visible=true, transformation(origin={50,70}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.05) annotation(Placement(visible=true, transformation(origin={40,-90}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-90}, extent={{10,-10},{-10,10}}, rotation=-180)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=innerMedium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb), V_flowLaminar=1, dpLaminar=1000, V_flowNominal=2, dpNominal=2000) annotation(Placement(visible=true, transformation(origin={10,-40}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.AbsolutePressure AbsolutePressure1(p=10000, medium=innerMedium) annotation(Placement(visible=true, transformation(origin={50,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow(k=10) annotation(Placement(visible=true, transformation(origin={-50,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant outerVolumeFlow(k=1) annotation(Placement(visible=true, transformation(origin={-50,90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant innerVolumeFlow(k=1) annotation(Placement(visible=true, transformation(origin={-50,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant outerGc(k=2) annotation(Placement(visible=true, transformation(origin={-30,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant innerGc(k=2) annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,10},{10,-10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe outerPipe(medium=outerMedium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,70}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe innerPipe(medium=innerMedium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,-20}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.Convection innerConvection annotation(Placement(visible=true, transformation(origin={10,10}, extent={{10,-10},{-10,10}}, rotation=90)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow innerPump(medium=innerMedium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-20,-30}, extent={{-10,-10},{10,10}}, rotation=-270)));
      Modelica.Thermal.HeatTransfer.ThermalConductor ThermalConductor1(G=1) annotation(Placement(visible=true, transformation(origin={10,-70}, extent={{-10,-10},{10,10}}, rotation=-270)));
      Modelica.Thermal.HeatTransfer.Convection outerConvection annotation(Placement(visible=true, transformation(origin={10,40}, extent={{10,10},{-10,-10}}, rotation=-90)));
    equation 
      connect(innerGc.y,innerConvection.Gc) annotation(Line(visible=true, points={{-19,10},{0,10}}, color={0,0,191}));
      connect(innerConvection.fluid,innerPipe.heatPort) annotation(Line(visible=true, points={{10,0},{10,-10}}, color={191,0,0}));
      connect(outerPipe.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{20,70},{40,70}}, color={255,0,0}));
      connect(outerPump.flowPort_b,outerPipe.flowPort_a) annotation(Line(visible=true, points={{-20,70},{0,70}}, color={255,0,0}));
      connect(innerPipe.flowPort_b,AbsolutePressure1.flowPort) annotation(Line(visible=true, points={{20,-20},{40,-20},{40,-30}}, color={255,0,0}));
      connect(outerVolumeFlow.y,outerPump.VolumeFlow) annotation(Line(visible=true, points={{-39,90},{-30,90},{-30,80}}, color={0,0,191}));
      connect(HeatFlow.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-90},{-30,-90}}, color={0,0,255}));
      connect(AbsolutePressure1.flowPort,Pipe1.flowPort_a) annotation(Line(visible=true, points={{40,-30},{40,-40},{20,-40}}, color={255,0,0}));
      connect(Ambient1.flowPort,outerPump.flowPort_a) annotation(Line(visible=true, points={{-60,70},{-40,70}}, color={255,0,0}));
      connect(Pipe1.flowPort_b,innerPump.flowPort_a) annotation(Line(visible=true, points={{0,-40},{-20,-40}}, color={255,0,0}));
      connect(innerVolumeFlow.y,innerPump.VolumeFlow) annotation(Line(visible=true, points={{-39,-30},{-30,-30}}, color={0,0,191}));
      connect(innerPump.flowPort_b,innerPipe.flowPort_a) annotation(Line(visible=true, points={{-20,-20},{0,-20}}, color={255,0,0}));
      connect(PrescribedHeatFlow1.port,ThermalConductor1.port_a) annotation(Line(visible=true, points={{-10,-90},{10,-90},{10,-80}}, color={191,0,0}));
      connect(HeatCapacitor1.port,ThermalConductor1.port_a) annotation(Line(visible=true, points={{30,-90},{10,-90},{10,-80}}, color={191,0,0}));
      connect(Pipe1.heatPort,ThermalConductor1.port_b) annotation(Line(visible=true, points={{10,-50},{10,-60}}, color={191,0,0}));
      connect(outerPipe.heatPort,outerConvection.fluid) annotation(Line(visible=true, points={{10,60},{10,50}}, color={191,0,0}));
      connect(outerConvection.solid,innerConvection.solid) annotation(Line(visible=true, points={{10,30},{10,20}}, color={191,0,0}));
      connect(outerGc.y,outerConvection.Gc) annotation(Line(visible=true, points={{-19,40},{0,40}}, color={0,0,191}));
    end IndirectCooling;

    model PumpAndValve
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
4th test example: PumpAndValve
</p>
<p>
The pump is running with half speed for 0.4 s, 
afterwards with full speed (using a ramp of 0.1 s).<br> 
The valve is half open for 0.9 s, afterwards full open (using a ramp of 0.1 s).
</p>
<p>
You may try to<br>
<ul>
<li>drive the pump with variable speed and let the valve full open 
    to regulate the volume flow rate of coolant</li>
<li>drive the pump with constant speed and throttle the valve 
    to regulate the volume flow rate of coolant</li>
</ul>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source over Coolant";
      output Modelica.SIunits.Temperature dTCoolant=Pipe1.dT "Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.IdealPump IdealPump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-50,0}, extent={{-10,10},{10,-10}}, rotation=0)));
      FluidHeatFlow.Components.Valve Valve1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb), LinearCharacteristic=false) annotation(Placement(visible=true, transformation(origin={-20,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, T0=Modelica.SIunits.Conversions.from_degC(TAmb), m=0.1) annotation(Placement(visible=true, transformation(origin={10,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={40,-50}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-50}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow(k=10) annotation(Placement(visible=true, transformation(origin={-50,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G(k=1) annotation(Placement(visible=true, transformation(origin={-20,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp speedRamp(height=0.5, offset=0.5, duration=0.1, startTime=0.4) annotation(Placement(visible=true, transformation(origin={-70,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp valveRamp(height=0.5, offset=0.5, duration=0.1, startTime=0.9) annotation(Placement(visible=true, transformation(origin={2,50}, extent={{10,-10},{-10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Speed Speed1(exact=true) annotation(Placement(visible=true, transformation(origin={-50,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.Convection Convection1 annotation(Placement(visible=true, transformation(origin={10,-30}, extent={{-10,-10},{10,10}}, rotation=-270)));
    equation 
      connect(valveRamp.y,Valve1.y) annotation(Line(visible=true, points={{-9,50},{-20,50},{-20,9}}, color={0,0,191}));
      connect(Valve1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-10,0},{0,0}}, color={255,0,0}));
      connect(IdealPump1.flowPort_b,Valve1.flowPort_a) annotation(Line(visible=true, points={{-40,0},{-30,0}}, color={255,0,0}));
      connect(Ambient1.flowPort,IdealPump1.flowPort_a) annotation(Line(visible=true, points={{-70,0},{-60,0}}, color={255,0,0}));
      connect(HeatFlow.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-50},{-30,-50}}, color={0,0,255}));
      connect(Pipe1.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{20,0},{40,0}}, color={255,0,0}));
      connect(Speed1.flange_b,IdealPump1.flange_a) annotation(Line(visible=true, points={{-50,20},{-50,10}}));
      connect(speedRamp.y,Speed1.w_ref) annotation(Line(visible=true, points={{-59,50},{-50,50},{-50,42}}, color={0,0,191}));
      connect(Convection1.solid,PrescribedHeatFlow1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
      connect(Convection1.solid,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{30,-50}}, color={191,0,0}));
      connect(Pipe1.heatPort,Convection1.fluid) annotation(Line(visible=true, points={{10,-10},{10,-20}}, color={191,0,0}));
      connect(G.y,Convection1.Gc) annotation(Line(visible=true, points={{-9,-30},{0,-30}}, color={0,0,191}));
    end PumpAndValve;

    model PumpDropOut
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
5th test example: PumpDropOut
</p>
<p>
Same as 1st test example, but with a drop out of the pump:<br>
The pump is running for 0.2 s, then shut down (using a ramp of 0.2 s) for 0.2 s, 
then started again (using a ramp of 0.2 s).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source over Coolant";
      output Modelica.SIunits.Temperature dTCoolant=Pipe1.dT "Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, T0=Modelica.SIunits.Conversions.from_degC(TAmb), m=0.1) annotation(Placement(visible=true, transformation(origin={10,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={40,-50}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-50}, extent={{-10,10},{10,-10}}, rotation=0)));
      Utilities.DoubleRamp VolumeFlow annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow(k=10) annotation(Placement(visible=true, transformation(origin={-50,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G(k=1) annotation(Placement(visible=true, transformation(origin={-20,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.Convection Convection1 annotation(Placement(visible=true, transformation(origin={10,-30}, extent={{-10,-10},{10,10}}, rotation=-270)));
    equation 
      connect(VolumeFlow.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(HeatFlow.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-50},{-30,-50}}, color={0,0,255}));
      connect(Pipe1.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{20,0},{40,0}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{0,0}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(Convection1.solid,PrescribedHeatFlow1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{-10,-50}}, color={191,0,0}));
      connect(Convection1.solid,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-40},{10,-50},{30,-50}}, color={191,0,0}));
      connect(Pipe1.heatPort,Convection1.fluid) annotation(Line(visible=true, points={{10,-10},{10,-20}}, color={191,0,0}));
      connect(G.y,Convection1.Gc) annotation(Line(visible=true, points={{-9,-30},{0,-30}}, color={0,0,191}));
    end PumpDropOut;

    model ParallelPumpDropOut
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
6th test example: ParallelPumpDropOut
</p>
<p>
Same as 2nd test example, but with a drop out of the pump:<br>
The pump is running for 0.2 s, then shut down (using a ramp of 0.2 s) for 0.2 s, 
then started again (using a ramp of 0.2 s).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2, Algorithm="Lsodar"), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      output Modelica.SIunits.Temperature dTSource1=PrescribedHeatFlow1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source1 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe1=PrescribedHeatFlow1.port.T - Pipe1.heatPort.T "Source1 over Coolant1";
      output Modelica.SIunits.Temperature dTCoolant1=Pipe1.dT "Coolant1's temperature increase";
      output Modelica.SIunits.Temperature dTSource2=PrescribedHeatFlow2.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Source2 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe2=PrescribedHeatFlow2.port.T - Pipe2.heatPort.T "Source2 over Coolant2";
      output Modelica.SIunits.Temperature dTCoolant2=Pipe2.dT "Coolant2's temperature increase";
      output Modelica.SIunits.Temperature dTmixedCoolant=Ambient2.T_port - Ambient1.T_port "mixed Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe2(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,10}, extent={{-10,10},{10,-10}}, rotation=0)));
      FluidHeatFlow.Components.IsolatedPipe Pipe3(medium=medium, T0=Modelica.SIunits.Conversions.from_degC(TAmb), m=0.1) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={90,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={40,-60}, extent={{10,-10},{-10,10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow1 annotation(Placement(visible=true, transformation(origin={-20,-60}, extent={{10,-10},{-10,10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.PrescribedHeatFlow PrescribedHeatFlow2 annotation(Placement(visible=true, transformation(origin={-20,60}, extent={{10,10},{-10,-10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.Convection Convection2 annotation(Placement(visible=true, transformation(origin={10,40}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Utilities.DoubleRamp VolumeFlow annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow1(k=5) annotation(Placement(visible=true, transformation(origin={-50,-60}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant HeatFlow2(k=10) annotation(Placement(visible=true, transformation(origin={-50,60}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G1(k=1) annotation(Placement(visible=true, transformation(origin={-20,-40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Constant G2(k=1) annotation(Placement(visible=true, transformation(origin={-20,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.Convection Convection1 annotation(Placement(visible=true, transformation(origin={10,-40}, extent={{10,10},{-10,-10}}, rotation=-90)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor2(T(start=Modelica.SIunits.Conversions.from_degC(TAmb)), C=0.1) annotation(Placement(visible=true, transformation(origin={38,60}, extent={{10,10},{-10,-10}}, rotation=-270)));
    equation 
      connect(VolumeFlow.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(Pipe3.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{60,0},{80,0}}, color={255,0,0}));
      connect(Pipe1.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,-10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
      connect(Pipe2.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,10},{30,10},{30,0},{40,0}}, color={255,0,0}));
      connect(Convection2.solid,PrescribedHeatFlow2.port) annotation(Line(visible=true, points={{10,50},{10,60},{-10,60}}, color={191,0,0}));
      connect(Convection2.fluid,Pipe2.heatPort) annotation(Line(visible=true, points={{10,30},{10,20}}, color={191,0,0}));
      connect(G2.y,Convection2.Gc) annotation(Line(visible=true, points={{-9,40},{0,40}}, color={0,0,191}));
      connect(HeatFlow1.y,PrescribedHeatFlow1.Q_flow) annotation(Line(visible=true, points={{-39,-60},{-30,-60}}, color={0,0,255}));
      connect(HeatFlow2.y,PrescribedHeatFlow2.Q_flow) annotation(Line(visible=true, points={{-39,60},{-30,60}}, color={0,0,255}));
      connect(Pump1.flowPort_b,Pipe2.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(G1.y,Convection1.Gc) annotation(Line(visible=true, points={{-9,-40},{0,-40}}, color={0,0,191}));
      connect(Pipe1.heatPort,Convection1.fluid) annotation(Line(visible=true, points={{10,-20},{10,-30}}, color={191,0,0}));
      connect(Convection1.solid,PrescribedHeatFlow1.port) annotation(Line(visible=true, points={{10,-50},{10,-60},{-10,-60}}, color={191,0,0}));
      connect(Convection1.solid,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-50},{10,-60},{30,-60}}, color={191,0,0}));
      connect(Convection2.solid,HeatCapacitor2.port) annotation(Line(visible=true, points={{10,50},{10,60},{28,60}}, color={191,0,0}));
    end ParallelPumpDropOut;

    model OneMass
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
7th test example: OneMass
</p>
<p>
A thermal capacity is coupled with a coolant flow. 
Different inital temperatures of thermal capacity and pipe's coolant get ambient's temperature, 
the time behaviour depending on coolant flow.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.0), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      parameter Modelica.SIunits.CelsiusTemperature TMass=40 "inital temperature of mass";
      output Modelica.SIunits.Temperature dTMass=HeatCapacitor1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Mass over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe=HeatCapacitor1.port.T - Pipe1.heatPort.T "Mass over Coolant";
      output Modelica.SIunits.Temperature dTCoolant=Pipe1.dT "Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(C=0.1, T(start=Modelica.SIunits.Conversions.from_degC(TMass))) annotation(Placement(visible=true, transformation(origin={10,-60}, extent={{10,-10},{-10,10}}, rotation=-180)));
      Utilities.DoubleRamp DoubleRamp1(offset=0, height_1=1, height_2=-2) annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.ThermalConductor ThermalConductor1(G=1) annotation(Placement(visible=true, transformation(origin={10,-30}, extent={{-10,-10},{10,10}}, rotation=-270)));
    equation 
      connect(DoubleRamp1.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(Pipe1.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{20,0},{40,0}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{0,0}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(ThermalConductor1.port_a,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-40},{10,-40},{10,-50},{10,-50}}, color={191,0,0}));
      connect(Pipe1.heatPort,ThermalConductor1.port_b) annotation(Line(visible=true, points={{10,-10},{10,-20}}, color={191,0,0}));
    end OneMass;

    model TwoMass
      extends Modelica.Icons.Example;
      annotation(Documentation(info="<HTML>
<p>
8th test example: TwoMass
</p>
<p>
Two thermal capacities are coupled with two parallel coolant flow. 
Different inital temperatures of thermal capacities and pipe's coolants get ambient's temperature, 
the time behaviour depending on coolant flow.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.0), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.CelsiusTemperature TAmb=20 "ambient temperature";
      parameter Modelica.SIunits.CelsiusTemperature TMass1=40 "inital temperature of mass1";
      parameter Modelica.SIunits.CelsiusTemperature TMass2=60 "inital temperature of mass2";
      output Modelica.SIunits.Temperature dTMass1=HeatCapacitor1.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Mass1 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe1=HeatCapacitor1.port.T - Pipe1.heatPort.T "Mass1 over Coolant1";
      output Modelica.SIunits.Temperature dTCoolant1=Pipe1.dT "Coolant1's temperature increase";
      output Modelica.SIunits.Temperature dTMass2=HeatCapacitor2.port.T - Modelica.SIunits.Conversions.from_degC(TAmb) "Mass2 over Ambient";
      output Modelica.SIunits.Temperature dTtoPipe2=HeatCapacitor2.port.T - Pipe2.heatPort.T "Mass2 over Coolant2";
      output Modelica.SIunits.Temperature dTCoolant2=Pipe2.dT "Coolant2's temperature increase";
      output Modelica.SIunits.Temperature dTmixedCoolant=Ambient2.T_port - Ambient1.T_port "mixed Coolant's temperature increase";
      FluidHeatFlow.Sources.Ambient Ambient1(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={-70,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      FluidHeatFlow.Sources.PrescribedVolumeFlow Pump1(medium=medium, m=0, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe1(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Components.HeatedPipe Pipe2(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={10,10}, extent={{-10,10},{10,-10}}, rotation=0)));
      FluidHeatFlow.Components.IsolatedPipe Pipe3(medium=medium, m=0.1, T0=Modelica.SIunits.Conversions.from_degC(TAmb)) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      FluidHeatFlow.Sources.Ambient Ambient2(T_Ambient=Modelica.SIunits.Conversions.from_degC(TAmb), medium=medium) annotation(Placement(visible=true, transformation(origin={90,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor1(C=0.1, T(start=Modelica.SIunits.Conversions.from_degC(TMass1))) annotation(Placement(visible=true, transformation(origin={10,-70}, extent={{10,-10},{-10,10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.HeatCapacitor HeatCapacitor2(C=0.1, T(start=Modelica.SIunits.Conversions.from_degC(TMass2))) annotation(Placement(visible=true, transformation(origin={10,70}, extent={{10,10},{-10,-10}}, rotation=-180)));
      Modelica.Thermal.HeatTransfer.ThermalConductor ThermalConductor2(G=1) annotation(Placement(visible=true, transformation(origin={10,40}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Utilities.DoubleRamp DoubleRamp1(offset=0, height_1=1, height_2=-2) annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Thermal.HeatTransfer.ThermalConductor ThermalConductor1(G=1) annotation(Placement(visible=true, transformation(origin={10,-40}, extent={{-10,-10},{10,10}}, rotation=-270)));
    equation 
      connect(DoubleRamp1.y,Pump1.VolumeFlow) annotation(Line(visible=true, points={{-39,20},{-30,20},{-30,10}}, color={0,0,191}));
      connect(ThermalConductor2.port_b,Pipe2.heatPort) annotation(Line(visible=true, points={{10,30},{10,20}}, color={191,0,0}));
      connect(HeatCapacitor2.port,ThermalConductor2.port_a) annotation(Line(visible=true, points={{10,60},{10,55.5},{10,50},{10,50}}, color={191,0,0}));
      connect(Pipe3.flowPort_b,Ambient2.flowPort) annotation(Line(visible=true, points={{60,0},{80,0}}, color={255,0,0}));
      connect(Pipe1.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,-10},{30,-10},{30,0},{40,0}}, color={255,0,0}));
      connect(Pipe2.flowPort_b,Pipe3.flowPort_a) annotation(Line(visible=true, points={{20,10},{30,10},{30,0},{40,0}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe2.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,10},{0,10}}, color={255,0,0}));
      connect(Pump1.flowPort_b,Pipe1.flowPort_a) annotation(Line(visible=true, points={{-20,0},{-10,0},{-10,-10},{0,-10}}, color={255,0,0}));
      connect(Ambient1.flowPort,Pump1.flowPort_a) annotation(Line(visible=true, points={{-60,0},{-40,0}}, color={255,0,0}));
      connect(Pipe1.heatPort,ThermalConductor1.port_b) annotation(Line(visible=true, points={{10,-20},{10,-30}}, color={191,0,0}));
      connect(ThermalConductor1.port_a,HeatCapacitor1.port) annotation(Line(visible=true, points={{10,-50},{10,-50},{10,-60},{10,-60}}, color={191,0,0}));
    end TwoMass;

    package Utilities
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<html>
<p>
This package contains utility components used for the test examples.
<p>

</html>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.41 Beta 2005/06/17 Anton Haumer<br>
       first used</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model DoubleRamp
        extends Modelica.Blocks.Interfaces.SO;
        parameter Real offset=1 "offset of ramps";
        parameter Modelica.SIunits.Time startTime=0.2 "startTime of 1st ramp";
        parameter Modelica.SIunits.Time interval=0.2 "interval between end of 1st and beginning of 2nd ramp";
        parameter Real height_1=-1 "|1st ramp|Height of ramp";
        parameter Modelica.SIunits.Time duration_1(min=Modelica.Constants.small)=0.2 "|1st ramp|Duration of ramp";
        parameter Real height_2=1 "|2nd ramp|Height of ramp";
        parameter Modelica.SIunits.Time duration_2(min=Modelica.Constants.small)=0.2 "|2nd ramp|Duration of ramp";
        annotation(Documentation(info="<HTML>
<p>
Block generating the sum of two ramps.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-90,-70},{82,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Line(visible=true, points={{-80,-60},{-50,-60},{-30,60},{10,60},{30,-20},{70,-20}})}));
        Modelica.Blocks.Math.Add Add1 annotation(Placement(visible=true, transformation(origin={20,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp Ramp1(final height=height_1, final duration=duration_1, final startTime=startTime, final offset=offset) annotation(Placement(visible=true, transformation(origin={-20,20}, extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica.Blocks.Sources.Ramp Ramp2(final height=height_2, final duration=duration_2, final startTime=startTime + duration_1 + interval, final offset=0) annotation(Placement(visible=true, transformation(origin={-20,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
      equation 
        connect(Add1.y,y) annotation(Line(visible=true, points={{31,0},{110,0}}, color={0,0,191}));
        connect(Ramp2.y,Add1.u2) annotation(Line(visible=true, points={{-9,-20},{0,-20},{0,-6},{8,-6}}, color={0,0,191}));
        connect(Ramp1.y,Add1.u1) annotation(Line(visible=true, points={{-9,20},{0,20},{0,6},{8,6}}, color={0,0,191}));
      end DoubleRamp;

    end Utilities;

  end Examples;

  package Components "Basic components (pipes, valves)"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains components:
<ul>
<li>pipe without heat exchange</li>
<li>pipe with heat exchange</li>
<li>valve (simple controlled valve)</li>
<ul>
</p>
<p>
Pressure drop is taken from partial model SimpleFriction.<br>
Thermodynamic equations are defined in partial models (package Partials).
</p>
<p>

</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.20 Beta 2005/02/18 Anton Haumer<br>
       introduced geodetic height in Components.Pipes<br>
       <i>new models: Components.Valve</i></li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={0,127,255}, fillPattern=FillPattern.Solid, points={{-56,10},{-56,-90},{-6,-40},{44,10},{44,-90},{-56,10}}),Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{-16,10},{4,10},{-6,-10},{-16,10}}),Line(visible=true, points={{-6,-10},{-6,-40},{-6,-38}}, color={0,0,191})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model IsolatedPipe
      annotation(Documentation(info="<HTML>
<p>
Pipe without heat exchange.<br>
Thermodynamic equations are defined by Partials.TwoPortMass(Q_flow = 0).
</p>
<p>
<b>Note:</b> Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90,-20},{90,20}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial")}));
      extends Interfaces.Partials.TwoPort;
      extends Interfaces.Partials.SimpleFriction;
      parameter Modelica.SIunits.Length h_g=0 "geodetic height (heigth difference from flowPort_a to flowPort_b)";
    equation 
      VolumeFlow=V_flow;
      dp=pressureDrop + medium.rho*Modelica.Constants.g_n*h_g;
      Q_flow=Q_friction;
    end IsolatedPipe;

    model HeatedPipe
      annotation(Documentation(info="<HTML>
<p>
Pipe with heat exchange.<br>
Thermodynamic equations are defined by Partials.TwoPort.<br>
Q_flow is defined by heatPort.Q_flow.
</p>
<p>
<b>Note:</b> Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).
</p>
<p>
<b>Note:</b> Injecting heat into a pipe with zero massflow causes 
temperature rise defined by storing heat in medium's mass.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90,-20},{90,20}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-10,-90},{-10,-40},{0,-20},{10,-40},{10,-90},{-10,-90}})}));
      extends Interfaces.Partials.TwoPort;
      extends Interfaces.Partials.SimpleFriction;
      parameter Modelica.SIunits.Length h_g=0 "geodetic height (heigth difference from flowPort_a to flowPort_b)";
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      VolumeFlow=V_flow;
      dp=pressureDrop + medium.rho*Modelica.Constants.g_n*h_g;
      Q_flow=heatPort.Q_flow + Q_friction;
      heatPort.T=T_q;
    end HeatedPipe;

    model Valve
      annotation(Documentation(info="<HTML>
<p>
Simple controlled valve.<br>
Standard characteristic Kv=<i>f </i>(y) is given at standard conditions (dp0, rho0),<br> 
<tt>
<ul>
<li>either linear : Kv/Kv1 = Kv0/Kv1 + (1-Kv0/Kv1) * y/Y1</li>
<li>or exponential: Kv/Kv1 = Kv0/Kv1 * exp[Modelica.Math.log(Kv1/Kv0) * y/Y1]</li>
</ul>
where:
<ul>
<li>Kv0 ... min. flow @ y = 0</li>
<li>Y1 .... max. valve opening</li>
<li>Kv1 ... max. flow @ y = Y1</li>
</ul>
</tt>
Flow resistance under real conditions is calculated by<br>
<tt>V_flow**2 * rho / dp = Kv(y)**2 * rho0 / dp0</tt>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-120},{150,-60}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-90,10},{-60,10},{-60,60},{0,0},{60,60},{60,10},{90,10},{90,-10},{60,-10},{60,-60},{0,0},{-60,-60},{-60,-10},{-90,-10},{-90,10}}),Line(visible=true, points={{0,80},{0,0}}, color={0,0,191})}));
      extends Interfaces.Partials.TwoPort(m=0);
      parameter Boolean LinearCharacteristic=true "|standard characteristic|type of characteristic" annotation(choices(choice=true "Linear", choice=false "Exponential"));
      parameter Real y1(min=small)=1 "|standard characteristic|max. valve opening";
      parameter Modelica.SIunits.VolumeFlowRate Kv1(min=small)=1 "|standard characteristic|max. flow @ y = y1";
      parameter Real kv0(min=small, max=1 - small)=0.01 "|standard characteristic|leakage flow / max.flow @ y = 0";
      parameter Modelica.SIunits.Pressure dp0=1 "|standard characteristic|standard pressure drop";
      parameter Modelica.SIunits.Density rho0=10 "|standard characteristic|standard medium's density";
      parameter Real frictionLoss(min=0, max=1)=0 "part of friction losses fed to medium";
      Modelica.Blocks.Interfaces.RealInput y annotation(Placement(visible=true, transformation(origin={0,90}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,90}, extent={{-10,-10},{10,10}}, rotation=-90)));
    protected 
      constant Real small=Modelica.Constants.small;
      constant Real eps=Modelica.Constants.eps;
      Real yLim=max(min(y, y1), 0) "limited valve opening";
      Modelica.SIunits.VolumeFlowRate Kv "standard flow rate";
    initial algorithm 
      assert(y1 > small, "Valve characteristic: y1 has to be > 0 !");
      assert(Kv1 > small, "Valve characteristic: Kv1 has to be > 0 !");
      assert(kv0 > small, "Valve characteristic: kv0 has to be > 0 !");
      assert(kv0 < 1 - eps, "Valve characteristic: kv0 has to be < 1 !");
    equation 
      Kv/Kv1=if LinearCharacteristic then kv0 + (1 - kv0)*yLim/y1 else kv0*exp(Modelica.Math.log(1/kv0)*yLim/y1);
      dp/dp0=medium.rho/rho0*V_flow/Kv*abs(V_flow/Kv);
      Q_flow=frictionLoss*V_flow*dp;
    end Valve;

  end Components;

  package Interfaces "Connectors and partial models"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains connectors and partial models:
<ul>
<li>FlowPort: basic definition of the connector.</li>
<li>FlowPort_a & FlowPort_b: same as FlowPort with different icons to differentiate direction of flow</li>
<li>package Partials (defining basic thermodynamic equations)</li>
</ul>
</p>
<p>

</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.10 2005/02/15 Anton Haumer<br>
       moved Partials into Interfaces</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  <li> v1.33 Beta 2005/06/07 Anton Haumer<br>
       corrected usage of simpleFlow</li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear</li>
  <li> v1.50 2005/09/07 Anton Haumer<br>
       semiLinear works fine</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, extent={{-60,-90},{40,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-58,-88},{38,8}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    connector FlowPort
      annotation(Documentation(info="<HTML>
<p>
Basic definition of the connector.
</p>
<p>
<b>Variables:</b>
<ul>
<li>Pressure p</li>
<li>flow MassFlowRate m_flow</li>
<li>Specific Enthalpy h</li>
<li>flow EnthaplyFlowRate H_flow</li>
</ul>
</p>
<p>
<p>
If ports with different media are connected, the simulation is asserted due to the check of parameter.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter FluidHeatFlow.Media.Medium medium;
      Modelica.SIunits.Pressure p;
      flow Modelica.SIunits.MassFlowRate m_flow;
      Modelica.SIunits.SpecificEnthalpy h;
      flow Modelica.SIunits.EnthalpyFlowRate H_flow;
    end FlowPort;

    connector FlowPort_a
      annotation(Documentation(info="<HTML>
<p>
Same as FlowPort, but icon allows to differentiate direction of flow.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-98,-98},{98,98}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-48,-48},{48,48}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-100,50},{100,110}}, textString="%name", fontName="Arial")}));
      extends FlowPort;
    end FlowPort_a;

    connector FlowPort_b
      annotation(Documentation(info="<HTML>
<p>
Same as FlowPort, but icon allows to differentiate direction of flow.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-98,-98},{98,98}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-48,-48},{48,48}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-100,50},{100,110}}, textString="%name", fontName="Arial")}));
      extends FlowPort;
    end FlowPort_b;

    package Partials
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains partial models, defining in a very compact way the basic thermodynamic equations used by the different components.
</p>
<p>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>
</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.10 2005/02/15 Anton Haumer<br>
       moved Partials into Interfaces</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  <li> v1.30 Beta 2005/06/02 Anton Haumer<br>
       friction losses are fed to medium</li>
  <li> v1.31 Beta 2005/06/04 Anton Haumer<br>
       searching solution for problems @ m_flow=0</li>
  <li> v1.33 Beta 2005/06/07 Anton Haumer<br>
       corrected usage of simpleFlow</li>
  <li> v1.43 Beta 2005/06/20 Anton Haumer<br>
       Test of mixing / semiLinear</li>
  <li> v1.50 2005/09/07 Anton Haumer<br>
       semiLinear works fine<br>
       removed test-version of semiLinear</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      partial model SimpleFriction
        annotation(Documentation(info="<HTML>
<p>
Definition of relationship between pressure drop and volume flow rate:
</p>
<p>
-V_flowLaminar &lt; VolumeFlow &lt; +V_flowLaminar: laminar i.e. linear dependency of pressure drop on volume flow.<br>
-V_flowLaminar &gt; VolumeFlow or VolumeFlow &lt; +V_flowLaminar: turbulent i.e. quadratic dependency of pressure drop on volume flow.<br>
Linear and quadratic dependency are coupled smoothly at V_flowLaminar / dpLaminar.<br>
Quadratic dependency is defined by nominal volume flow and pressure drop (V_flowNominal / dpNominal).<br>
See also sketch at diagram layer.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,0},{80,0}}, color={0,0,255}),Line(visible=true, points={{0,80},{0,-80}}, color={0,0,255}),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255}),Line(visible=true, points={{60,40},{60,0}}, color={0,0,255}),Line(visible=true, points={{40,20},{0,20}}, color={0,0,255}),Line(visible=true, points={{60,40},{3.553e-15,40}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{18,-20},{48,0}}, textString="V_flowLaminar", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{50,-20},{80,0}}, textString="V_flowNominal", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-30,10},{-4,30}}, textString="dpLaminar", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-30,30},{-4,50}}, textString="dpNominal", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{0,0},{30,20}}, textString="dp ~ V_flow", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{30,40},{60,60}}, textString="dp ~ V_flow²", fontName="Arial"),Line(visible=true, points={{75,80},{70,60},{60,37.5},{35,15},{-35,-15},{-60,-37.5},{-70,-60},{-75,-80}}, color={0,0,255}, smooth=Smooth.Bezier)}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        parameter Modelica.SIunits.VolumeFlowRate V_flowLaminar(min=Modelica.Constants.small)=0.1 "|SimpleFriction|laminar volume flow";
        parameter Modelica.SIunits.Pressure dpLaminar=0.1 "|SimpleFriction|laminar pressure drop";
        parameter Modelica.SIunits.VolumeFlowRate V_flowNominal=1 "|SimpleFriction|nominal volume flow";
        parameter Modelica.SIunits.Pressure dpNominal=1 "|SimpleFriction|nominal pressure drop";
        parameter Real frictionLoss(min=0, max=1)=0 "|SimpleFriction|part of friction losses fed to medium";
        Modelica.SIunits.Pressure pressureDrop;
        Modelica.SIunits.VolumeFlowRate VolumeFlow;
        Modelica.SIunits.Power Q_friction;
      protected 
        parameter Real k(fixed=false);
      initial algorithm 
        assert(V_flowNominal > V_flowLaminar, "SimpleFriction: V_flowNominal has to be > V_flowLaminar!");
        k:=dpLaminar/V_flowLaminar*V_flowNominal;
        assert(dpNominal >= k, "SimpleFriction: dpNominal has to be > dpLaminar*V_flowNominal/V_flowLaminar!");
        k:=(dpNominal - k)/(V_flowNominal - V_flowLaminar)^2;
      equation 
        if VolumeFlow > +V_flowLaminar then
          pressureDrop=+dpLaminar/V_flowLaminar*VolumeFlow + k*(VolumeFlow - V_flowLaminar)^2;
        elseif VolumeFlow < -V_flowLaminar then
          pressureDrop=+dpLaminar/V_flowLaminar*VolumeFlow - k*(VolumeFlow + V_flowLaminar)^2;
        else
          pressureDrop=dpLaminar/V_flowLaminar*VolumeFlow;
        end if;
        Q_friction=frictionLoss*VolumeFlow*pressureDrop;
      end SimpleFriction;

      partial model TwoPort
        annotation(Documentation(info="<HTML>
<p>
Partial model with two flowPorts.<br>
Possible heat exchange with the ambient is defined by Q_flow; setting this = 0 means no energy exchange.<br>
Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Mixing rule is applied.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
        parameter Modelica.SIunits.Mass m=1 "mass of medium";
        parameter Modelica.SIunits.Temperature T0=Modelica.SIunits.Conversions.from_degC(20) "initial temperature of medium" annotation(Dialog(enable=m > Modelica.Constants.small));
        Modelica.SIunits.Pressure dp=flowPort_a.p - flowPort_b.p "pressure drop a->b";
        Modelica.SIunits.VolumeFlowRate V_flow=flowPort_a.m_flow/medium.rho "Volume flow a->b";
        Modelica.SIunits.HeatFlowRate Q_flow "heat exchange with ambient";
        output Modelica.SIunits.Temperature T(start=T0) "outlet temperature of medium";
        output Modelica.SIunits.Temperature T_a=flowPort_a.h/medium.cp "temperature at flowPort_a";
        output Modelica.SIunits.Temperature T_b=flowPort_b.h/medium.cp "temperature at flowPort_b";
        output Modelica.SIunits.Temperature dT=if noEvent(V_flow >= 0) then T - T_a else T_b - T "temperature increase of coolant in flow direction";
        Interfaces.FlowPort_a flowPort_a(final medium=medium) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        Interfaces.FlowPort_b flowPort_b(final medium=medium) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      protected 
        Modelica.SIunits.SpecificEnthalpy h=medium.cp*T "medium's specific enthalpy";
        Modelica.SIunits.Temperature T_q=T "temperature relevant for heat exchange with ambient";
      equation 
        flowPort_a.m_flow + flowPort_b.m_flow=0;
        if m > Modelica.Constants.small then
          flowPort_a.H_flow + flowPort_b.H_flow + Q_flow=m*medium.cv*der(T);
        else
          flowPort_a.H_flow + flowPort_b.H_flow + Q_flow=0;
        end if;
        flowPort_a.H_flow=semiLinear(flowPort_a.m_flow, flowPort_a.h, h);
        flowPort_b.H_flow=semiLinear(flowPort_b.m_flow, flowPort_b.h, h);
      end TwoPort;

      partial model Ambient
        annotation(Documentation(info="<HTML>
<p>
Partial model of (Infinite) ambient, defines pressure and temperature.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,90},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
        output Modelica.SIunits.Temperature T "outlet temperature of medium";
        output Modelica.SIunits.Temperature T_port=flowPort.h/medium.cp "temperature at flowPort_a";
        Interfaces.FlowPort_a flowPort(final medium=medium) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      protected 
        Modelica.SIunits.SpecificEnthalpy h=medium.cp*T;
      equation 
        flowPort.H_flow=semiLinear(flowPort.m_flow, flowPort.h, h);
      end Ambient;

      partial model AbsoluteSensor
        annotation(Documentation(info="<HTML>
<p>
Partial model for an absolute sensor (pressure/temperature).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected.
</p>
</HTML>"));
        parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}}),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,70},{150,130}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Interfaces.FlowPort_a flowPort(final medium=medium) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      equation 
        flowPort.m_flow=0;
        flowPort.H_flow=0;
      end AbsoluteSensor;

      partial model RelativeSensor
        annotation(Documentation(info="<HTML>
<p>
Partial model for a relative sensor (pressure drop/temperature difference).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected.
</p>
</HTML>"));
        parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}}),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,70},{150,130}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Interfaces.FlowPort_a flowPort_a(final medium=medium) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        Interfaces.FlowPort_b flowPort_b(final medium=medium) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
      equation 
        flowPort_a.m_flow=0;
        flowPort_b.m_flow=0;
        flowPort_a.H_flow=0;
        flowPort_b.H_flow=0;
      end RelativeSensor;

      partial model FlowSensor
        annotation(Documentation(info="<HTML>
<p>
Partial model for a flow sensor (mass flow/heat flow).<br>
Pressure, mass flow, temperature and enthalpy flow of medium are not affected, but mixing rule is applied.
</p>
</HTML>"));
        extends TwoPort(final m=0, final T0=0);
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}}),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,70},{150,130}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
      equation 
        dp=0;
        Q_flow=0;
      end FlowSensor;

    end Partials;

  end Interfaces;

  package Media "Medium properties"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains definitions of medium properties.
</p>

</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.11 2005/02/18 Anton Haumer<br>
       corrected usage of cv and cp</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,191}, fillColor={127,191,255}, fillPattern=FillPattern.Solid, extent={{-80,-88},{60,8}}),Line(visible=true, points={{-10,8},{-10,-88},{-10,-88}}, color={0,0,191}),Line(visible=true, points={{-80,-24},{60,-24}}, color={0,0,191}),Line(visible=true, points={{-80,-56},{60,-56}}, color={0,0,191})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    record Medium
      extends Modelica.Icons.Record;
      parameter Modelica.SIunits.Density rho=1 "density";
      parameter Modelica.SIunits.SpecificHeatCapacity cp=1 "specific heat capacity at constant pressure";
      parameter Modelica.SIunits.SpecificHeatCapacity cv=1 "specific heat capacity at constant volume";
      parameter Modelica.SIunits.ThermalConductivity lamda=1 "thermal conductivity";
      parameter Modelica.SIunits.KinematicViscosity nue=1 "kinematic viscosity";
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Medium;

    record Air_30degC
      extends Medium(rho=1.149, cp=1007, cv=720, lamda=0.0264, nue=1.63e-05);
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Air_30degC;

    record Air_70degC
      extends Medium(rho=1.015, cp=1010, cv=723, lamda=0.0293, nue=2.03e-05);
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Air_70degC;

    record Water
      extends Medium(rho=995.6, cp=4177, cv=4177, lamda=0.615, nue=8e-07);
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Water;

  end Media;

  package Sensors "Ideal sensors to measure port properties"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains sensors:
<ul>
<li>pSensor: absolute pressure</li>
<li>TSensor: absolute temperature (Kelvin)</li>
<li>dpSensor: pressure drop between flowPort_a and flowPort_b</li>
<li>dTSensor: temperature difference between flowPort_a and flowPort_b</li>
<li>m_flowSensor: measures mass flow rate</li>
<li>V_flowSensor: measures volume flow rate</li>
<li>H_flowSensor: measures enthalpy flow rate</li>
</ul>
</p>
<p>
Some of the sensors do not need access to medium properties for measuring, 
but it is necessary to define the medium in the connector (check of connections).<br>
Thermodynamic equations are defined in partial models (package Interfaces.Partials).<br>
All sensors are considered massless, they do not change mass flow or enthalpy flow.
</p>
<p>

</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-90},{40,10}}),Line(visible=true, points={{-10,7},{-10,-10}}),Line(visible=true, points={{-50,-16},{-36,-25}}),Line(visible=true, points={{30,-15},{16,-25}}),Line(visible=true, points={{-35,0},{-25,-14}}),Line(visible=true, points={{15,0},{5,-14}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-15,-45},{-5,-35}}),Line(visible=true, points={{-10,-40},{-6,-26}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-12,-24},{-0.5,-27},{2,1.5},{-12,-24}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model pSensor
      annotation(Documentation(info="<HTML>
<p>
pSensor measures the absolute pressure.<br>
Thermodynamic equations are defined by Partials.AbsoluteSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="p", fontName="Arial")}));
      extends Interfaces.Partials.AbsoluteSensor(y(redeclare type SignalType= Modelica.SIunits.Pressure ));
    equation 
      y=flowPort.p;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="p")}), Diagram);
    end pSensor;

    model TSensor
      annotation(Documentation(info="<HTML>
<p>
TSensor measures the absolute temperature (Kelvin).<br>
Thermodynamic equations are defined by Partials.AbsoluteSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="T", fontName="Arial")}));
      extends Interfaces.Partials.AbsoluteSensor(y(redeclare type SignalType= Modelica.SIunits.Temperature ));
    equation 
      medium.cp*y=flowPort.h;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="T")}));
    end TSensor;

    model dpSensor
      annotation(Documentation(info="<HTML>
<p>
dpSensor measures the pressure drop between flowPort_a and flowPort_b.<br>
Thermodynamic equations are defined by Partials.RelativeSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="dp", fontName="Arial")}));
      extends Interfaces.Partials.RelativeSensor(y(redeclare type SignalType= Modelica.SIunits.Pressure ));
    equation 
      y=flowPort_a.p - flowPort_b.p;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="dp")}));
    end dpSensor;

    model dTSensor
      annotation(Documentation(info="<HTML>
<p>
dTSensor measures the temperature difference between flowPort_a and flowPort_b.<br>
Thermodynamic equations are defined by Partials.RelativeSensor.
</p>
<ul>
<li><b>Note:</b> Connected flowPorts have the same temperature (mixing temperature)!<br>
Since mixing my occur, the outlet temperature of a component may be different from the connector's temperature.<br> 
Outlet temperature is defined by variable T of the corresponding component.</li>
</ul>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="dT", fontName="Arial")}));
      extends Interfaces.Partials.RelativeSensor(y(redeclare type SignalType= Modelica.SIunits.Temperature ));
    equation 
      medium.cp*y=flowPort_a.h - flowPort_b.h;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="dT")}));
    end dTSensor;

    model m_flowSensor
      annotation(Documentation(info="<HTML>
<p>
m_flowSensor measures the mass flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="m", fontName="Arial")}));
      extends Interfaces.Partials.FlowSensor(y(redeclare type SignalType= Modelica.SIunits.MassFlowRate ));
    equation 
      y=V_flow*medium.rho;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="m")}));
    end m_flowSensor;

    model V_flowSensor
      annotation(Documentation(info="<HTML>
<p>
V_flowSensor measures the volume flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="V", fontName="Arial")}));
      extends Interfaces.Partials.FlowSensor(y(redeclare type SignalType= Modelica.SIunits.VolumeFlowRate ));
    equation 
      y=V_flow;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="V")}));
    end V_flowSensor;

    model H_flowSensor
      annotation(Documentation(info="<HTML>
<p>
H_flowSensor measures the enthalpy flow rate.<br>
Thermodynamic equations are defined by Partials.FlowSensor.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-22,-60},{20,-20}}, textString="H", fontName="Arial")}));
      extends Interfaces.Partials.FlowSensor(y(redeclare type SignalType= Modelica.SIunits.EnthalpyFlowRate ));
    equation 
      y=flowPort_a.H_flow;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-22,-20},{20,-60}}, fillColor={0,0,255}, textString="H")}));
    end H_flowSensor;

  end Sensors;

  package Sources "Ideal fluid sources, e.g., ambient, volume flow"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains different types of sources:
<ul>
<li>Ambient with constant pressure and temperature</li>
<li>Ambient with prescribed pressure and temperature</li>
<li>AbsolutePressure to define pressure level of a closed cooling cycle.</li>
<li>Constant and prescribed volume flow</li>
<li>Constant and prescribed pressure increase</li>
<li>Simple pump with mechanical flange</li>
<ul>
</p>
<p>
Thermodynamic equations are defined in partial models (package Interfaces.Partials).<br>
All fans / pumps are considered without losses, they do not change enthalpy flow.
</p>
<p>

</HTML>", revisions="<HTML>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <p>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern, Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </p>
  <p>
  Dr.Christian Kral & Markus Plainer<br>
  <a href=\"http://www.arsenal.ac.at/english/\">arsenal research</a><br>
  Business Unit Monitoring, Energy and Drive Technologies<br>
  A-1030 Vienna, Austria
  </p>
  </dd>
</dl>
</p>
</dl>
<p>
Copyright &copy; 1998-2006, Modelica Association, Anton Haumer and arsenal research.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

  <ul>
  <li> v1.00 2005/02/01 Anton Haumer<br>
       first stable official release</li>
  <li> v1.20 Beta 2005/02/18 Anton Haumer<br>
       <i>new model: IdealPump</i></li>
  </ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, extent={{-60,-90},{40,10}}),Polygon(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-40,0},{-40,-80},{38,-50},{38,-30},{-40,0}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model Ambient
      annotation(Documentation(info="<HTML>
<p>
(Infinite) ambient with constant pressure and temperature.<br>
Thermodynamic equations are defined by Partials.Ambient. 
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.Ambient;
      parameter Modelica.SIunits.Pressure p_Ambient=0;
      parameter Modelica.SIunits.Temperature T_Ambient=Modelica.SIunits.Conversions.from_degC(20);
    equation 
      flowPort.p=p_Ambient;
      T=T_Ambient;
    end Ambient;

    model PrescribedAmbient
      annotation(Documentation(info="<HTML>
<p>
(Infinite) ambient with prescribed pressure and temperature.<br>
Thermodynamic equations are defined by Partials.Ambient. 
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.Ambient;
      Modelica.Blocks.Interfaces.RealInput p_Ambient(redeclare type SignalType= Modelica.SIunits.Pressure ) annotation(Placement(visible=true, transformation(origin={100,70}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,70}, extent={{10,-10},{-10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput T_Ambient(redeclare type SignalType= Modelica.SIunits.Temperature ) annotation(Placement(visible=true, transformation(origin={100,-70}, extent={{10,10},{-10,-10}}, rotation=0), iconTransformation(origin={100,-70}, extent={{10,10},{-10,-10}}, rotation=0)));
    equation 
      flowPort.p=p_Ambient;
      T=T_Ambient;
    end PrescribedAmbient;

    model AbsolutePressure
      annotation(Documentation(info="<HTML>
<p>
AbsolutePressure to define pressure level of a closed cooling cycle. 
Coolant's mass flow, temperature and enthalpy flow are not affected.<br>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,90},{150,150}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}})}));
      parameter FluidHeatFlow.Media.Medium medium=FluidHeatFlow.Media.Medium() annotation(choicesAllMatching=true);
      parameter Modelica.SIunits.Pressure p=0 "pressure ground";
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Ellipse(extent={{-90,90},{90,-90}}, fillPattern=FillPattern.Solid, lineColor={255,0,0}, fillColor={255,255,255})}));
      Interfaces.FlowPort_a flowPort(final medium=medium) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      flowPort.p=p;
      flowPort.H_flow=0;
    end AbsolutePressure;

    model ConstantVolumeFlow
      annotation(Documentation(info="<HTML>
<p>
Fan resp. pump with constant volume flow rate. Pressure increase is the response of the whole system. 
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,-150},{150,-90}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}}),Text(visible=true, lineColor={0,0,255}, extent={{-40,-20},{0,20}}, textString="V", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.TwoPort;
      parameter Modelica.SIunits.VolumeFlowRate VolumeFlow=1;
    equation 
      Q_flow=0;
      V_flow=VolumeFlow;
    end ConstantVolumeFlow;

    model PrescribedVolumeFlow
      annotation(Documentation(info="<HTML>
<p>
Fan resp. pump with prescribed volume flow rate. Pressure increase is the response of the whole system. 
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,-150},{150,-90}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}}),Text(visible=true, lineColor={0,0,255}, extent={{-40,-20},{0,20}}, textString="V", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.TwoPort;
      Modelica.Blocks.Interfaces.RealInput VolumeFlow(redeclare type SignalType= Modelica.SIunits.VolumeFlowRate ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=90)));
    equation 
      Q_flow=0;
      V_flow=VolumeFlow;
    end PrescribedVolumeFlow;

    model ConstantPressureIncrease
      annotation(Documentation(info="<HTML>
<p>
Fan resp. pump with constant pressure increase. Mass resp. volume flow is the response of the whole system. 
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,-150},{150,-90}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}}),Text(visible=true, lineColor={0,0,255}, extent={{-40,-20},{0,20}}, textString="dp", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.TwoPort;
      parameter Modelica.SIunits.Pressure PressureIncrease=1;
    equation 
      Q_flow=0;
      dp=-PressureIncrease;
    end ConstantPressureIncrease;

    model PrescribedPressureIncrease
      annotation(Documentation(info="<HTML>
<p>
Fan resp. pump with prescribed pressure increase. Mass resp. volume flow is the response of the whole system. 
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,-150},{150,-90}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}}),Text(visible=true, lineColor={0,0,255}, extent={{-40,-20},{0,20}}, textString="dp", fontName="Arial")}));
      extends Interfaces.Partials.TwoPort;
      Modelica.Blocks.Interfaces.RealInput PressureIncrease(redeclare type SignalType= Modelica.SIunits.Pressure ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=90)));
    equation 
      Q_flow=0;
      dp=-PressureIncrease;
    end PrescribedPressureIncrease;

    model IdealPump
      annotation(Documentation(info="<HTML>
<p>
Simple fan resp. pump where characteristic is dependent on shaft's speed, <br>
torque * speed = pressure increase * volume flow (without losses)<br>
Pressure increase versus volume flow is defined by a linear function, 
from dp0(V_flow=0) to V_flow0(dp=0).<br>
The axis intersections vary with speed as follows:<br>
<ul>
<li>dp prop. speed^2</li>
<li>V_flow prop. speed</li>
</ul>
Coolant's temperature and enthalpy flow are not affected.<br>
Setting parameter m (mass of medium within fan/pump) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
Thermodynamic equations are defined by Partials.TwoPort.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-90},{90,90}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,90},{150,150}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.VerticalCylinder, extent={{-10,-100},{10,-40}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-60,68},{90,10},{90,-10},{-60,-68},{-60,68}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Interfaces.Partials.TwoPort;
      parameter Modelica.SIunits.AngularVelocity w_Nominal=1 "|pump characteristic|nominal speed";
      parameter Modelica.SIunits.Pressure dp0=2 "|pump characteristic|max. pressure increase @ V_flow=0";
      parameter Modelica.SIunits.VolumeFlowRate V_flow0=2 "|pump characteristic|max. volume flow rate @ dp=0";
      Modelica.SIunits.AngularVelocity w=der(flange_a.phi) "speed";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
    protected 
      Modelica.SIunits.Pressure dp1;
      Modelica.SIunits.VolumeFlowRate V_flow1;
    equation 
      dp1=dp0*sign(w/w_Nominal)*(w/w_Nominal)^2;
      V_flow1=V_flow0*w/w_Nominal;
      if noEvent(abs(w) < Modelica.Constants.small) then
        dp=0;
        flange_a.tau=0;
      else
        dp=-dp1*(1 - noEvent(abs(V_flow/V_flow1)));
        flange_a.tau*w=-dp*V_flow;
      end if;
      Q_flow=0;
    end IdealPump;

  end Sources;

end FluidHeatFlow;
