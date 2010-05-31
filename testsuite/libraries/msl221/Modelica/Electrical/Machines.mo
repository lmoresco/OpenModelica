within Modelica.Electrical;
package Machines "Library for electric machines"
  extends Modelica.Icons.Library2;
  annotation(version="1.7.2", versionDate="2006-02-10", Settings(NewStateSelection=true, Evaluate=true), preferedView="info", Documentation(info="<HTML>
<p>
This package contains components to model electrical machines:
<ul>
<li>Examples: test examples</li>
<li>BasicMachines: basic machine models</li>
<li>Sensors: sensors, usefull when modelling machines</li>
<li>SpacePhasors: an independent library for using space phasors</li>
<li>Interfaces: Space phasor connector and partial machine models</li>
</ul>
</p>
<p>
<b>Limitations and assumptions:</b>
<ul>
<li>number of phases (of induction machines) is limited to 3, therefore definition as a constant m=3</li>
<li>phase symmetric windings as well as symmetry of the whole machine structure</li>
<li>all values are used in physical units, no scaling to p.u. is done</li>
<li>only basic harmonics (in space) are taken into account</li>
<li>waveform (with respect to time) of voltages and currents is not restricted</li>
<li>constant parameters, i.e. no saturation, no skin effect</li>
<li>no iron losses, eddy currents, friction losses;<br>
    only ohmic losses in stator and rotor winding</li>
</ul>
You may have a look at a short summary of space phasor theory at <a href=\"http://www.haumer.at/refimg/SpacePhasors.pdf\">http://www.haumer.at/refimg/SpacePhasors.pdf</a>
</p>
<p>
<b>Further development:</b>
<ul>
<li>generalizing space phasor theory to m phases with arbitrary spatial angle of the coils</li>
<li>generalizing space phasor theory to arbitrary number of windings and winding factor of the coils</li>
<li>MachineModels: other machine types</li>
<li>effects: saturation, skin-effect, other losses than ohmic, ...</li>
</ul>
</p>
<p>
<dl>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</dl>
</p>
<p>
Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>
</HTML>", revisions="<HTML>
  <ul>
  <li> v1.00  2004/09/16 Anton Haumer<br>
       first stable release</li>
  <li> v1.01  2004/09/18 Anton Haumer<br>
       moved common equations from machine models to PartialMachine<br>
       improved MoveToRotational</li>
  <li> v1.02  2004/09/19 Anton Haumer<br>
       new package structure for machine types<br>
       added DC machine models</li>
  <li> v1.03  2004/09/24 Anton Haumer<br>
       added package Sensors<br>
       added DC machine with series excitation<br>
       debugged and improved MoveToRotational</li>
  <li> v1.1   2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2   2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3   2004/11/05 Anton Haumer<br>
       several improvements in SpacePhasors.Blocks</li>
  <li> v1.3.1 2004/11/06 Anton Haumer<br>
       small changes in Examples.Utilities.VfController</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.51  2005/02/01 Anton Haumer<br>
       changed parameter polePairs to Integer</li>
  <li> v1.52  2005/10/12 Anton Haumer<br>
       added BasicMachines.SynchronousInductionMachines.SM_ElectricalExcitedDamperCage<br>
       using new basicMachines.Components.ElectricalExcitation<br>
       as well as a new exmaple.</li>
  <li> v1.53  2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v1.60  2005/11/04 Anton Haumer<br>
       added SpacePhasors.Components.Rotator<br>
       corrected consistent naming of parameters and variables</li>
  <li> v1.6.1 2005/11/22 Anton Haumer<br>
       improved Transformation and Rotation in SpacePhasor.<br>
       introduced Examples.Utilities.TerminalBox</li>
  <li> v1.6.2 2005/10/23 Anton Haumer<br>
       selectable DamperCage for Synchronous Machines</li>
  <li> v1.6.3 2005/11/25 Anton Haumer<br>
       easier parametrisation of AsynchronousInductionMachines.AIM_SlipRing model</li>
  <li> v1.7.0 2005/12/15 Anton Haumer<br>
       back-changed the naming to ensure backward compatibility</li>
  <li> v1.7.1 2006/02/06 Anton Haumer<br>
       changed some naming of synchronous machines, not affecting existing models</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={0,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-60.0,60.0},{60.0,-60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{-60.0,60.0},{-80.0,-60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{60.0,10.0},{80.0,-10.0}}),Rectangle(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-60.0,70.0},{20.0,50.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-70.0,-90.0},{-60.0,-90.0},{-30.0,-20.0},{20.0,-20.0},{50.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-70.0,-100.0},{-70.0,-90.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Examples "Test examples"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains test examples of electric machines,<br>
and a package utilities with components used for the examples.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.01 2004/09/18 Anton Haumer<br>
       adapted to improved MoveToRotational</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added examples for DC machines</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       usage of Sensors.CurrentRMSsensor<br>
       added example for DC machine with series excitation</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.3.1 2004/11/06 Anton Haumer<br>
       small changes in Utilities.VfController</li>
  <li> v1.52 2005/10/12 Anton Haumer<br>
       new example for electrical excited synchronous induction machine</li>
  <li> v1.6.1 2004/11/22 Anton Haumer<br>
       introduced Utilities.TerminalBox</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={128,128,128}, extent={{-80.0,44.0},{60.0,-96.0}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-40.0,36.0},{-40.0,-88.0},{60.0,-26.0},{-40.0,36.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model AIMC_DOL "Test example 1: AsynchronousInductionMachineSquirrelCage direct-on-line"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Time tStart1=0.1 "start time";
      parameter Modelica.SIunits.Torque T_Load=161.4 "nominal load torque";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmLoad=1440.45 "nominal load speed";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>1st Test example: Asynchronous induction Machine with squirrel cage - direct on line starting</b><br>
At start time tStart three phase voltage is supplied to the asynchronous induction machine with squirrel cage;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>AIMC1.rpm_mechanical: motor's speed</li>
<li>AIMC1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage AIMC1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Sources.SineVoltage SineVoltage1(final m=m, freqHz=fill(fNominal, m), V=fill(sqrt(2/3)*VNominal, m)) annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep1[m](each startTime=tStart1) annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Ideal.IdealClosingSwitch IdealCloser1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-270)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.QuadraticSpeedDependentTorque QuadraticLoadTorque1(w_nominal=Modelica.SIunits.Conversions.from_rpm(rpmLoad), tau_nominal=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1(StarDelta="D") annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{-10.0,-20.0},{0.0,-20.0},{0.0,-10.0}}, color={0,0,255}));
      connect(IdealCloser1.plug_n,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{0.0,20.0},{0.0,17.0},{0.0,17.0},{0.0,10.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,IdealCloser1.plug_p) annotation(Line(visible=true, points={{0.0,70.0},{0.0,48.0},{0.0,46.0},{0.0,46.0},{0.0,40.0}}, color={0,0,255}));
      connect(BooleanStep1.y,IdealCloser1.control) annotation(Line(visible=true, points={{-59.0,40.0},{-20.0,40.0},{-20.0,30.0},{-7.0,30.0}}, color={255,0,255}));
      connect(AIMC1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, origin={20.0,-40.0}, points={{-20.0,0.0},{20.0,0.0}}));
      connect(TerminalBox1.negativeMachinePlug,AIMC1.plug_sn) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(TerminalBox1.positiveMachinePlug,AIMC1.plug_sp) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(LoadInertia.flange_b,QuadraticLoadTorque1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(SineVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{0.0,50.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
    end AIMC_DOL;

    model AIMC_YD "Test example 2: AsynchronousInductionMachineSquirrelCage Y-D"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Time tStart1=0.1 "start time";
      parameter Modelica.SIunits.Time tStart2=2.0 "2nd start time";
      parameter Modelica.SIunits.Torque T_Load=161.4 "nominal load torque";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmLoad=1440.45 "nominal load speed";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2.5, Interval=0.001, Tolerance=0.0001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>2nd Test example: Asynchronous induction Machine with squirrel cage - Y-D starting</b><br>
At start time tStart three phase voltage is supplied to the asynchronous induction machine with squirrel cage, first star-connected, then delta-connetced; the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 2.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>AIMC1.rpm_mechanical: motor's speed</li>
<li>AIMC1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage AIMC1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep1[m](each startTime=tStart1) annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Ideal.IdealClosingSwitch IdealCloser1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.Machines.Examples.Utilities.SwitchYD SwitchYD1 annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep2[m](each startTime=tStart2) annotation(Placement(visible=true, transformation(origin={-70.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.QuadraticSpeedDependentTorque QuadraticLoadTorque1(w_nominal=Modelica.SIunits.Conversions.from_rpm(rpmLoad), tau_nominal=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.MultiPhase.Sources.SineVoltage SineVoltage1(final m=m, freqHz=fill(fNominal, m), V=fill(sqrt(2/3)*VNominal, m)) annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-450)));
    equation 
      connect(BooleanStep2.y,SwitchYD1.control) annotation(Line(visible=true, origin={-40.0,-20.0}, points={{-19.0,0.0},{19.0,0.0}}, color={255,0,255}));
      connect(CurrentRMSsensor1.plug_n,SwitchYD1.plug_P) annotation(Line(visible=true, points={{0.0,-10.0},{0.0,-10.0},{0.0,-8.0},{0.0,-10.0}}, color={0,0,255}));
      connect(AIMC1.plug_sp,SwitchYD1.pug_PS) annotation(Line(visible=true, points={{-4.0,-30.0},{0.0,-30.0}}, color={0,0,255}));
      connect(SwitchYD1.plug_NS,AIMC1.plug_sn) annotation(Line(visible=true, points={{-20.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(AIMC1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, origin={20.0,-40.0}, points={{-20.0,0.0},{20.0,0.0}}));
      connect(IdealCloser1.plug_n,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{0.0,20.0},{-0.0,18.0},{0.0,18.0},{0.0,10.0}}, color={0,0,255}));
      connect(BooleanStep1.y,IdealCloser1.control) annotation(Line(visible=true, points={{-59.0,40.0},{-20.0,40.0},{-20.0,30.0},{-7.0,30.0}}, color={255,0,255}));
      connect(LoadInertia.flange_b,QuadraticLoadTorque1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{-0.0,70.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,IdealCloser1.plug_p) annotation(Line(visible=true, points={{0.0,50.0},{0.0,48.0},{0.0,46.0},{0.0,46.0},{0.0,40.0}}, color={0,0,255}));
    end AIMC_YD;

    model AIMS_start "Test example 3: AsynchronousInductionMachineSlipRing"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Time tStart1=0.1 "1st start time";
      parameter Modelica.SIunits.Resistance Rstart=0.16 "starting resistance";
      parameter Modelica.SIunits.Time tStart2=1.0 "2nd start time";
      parameter Modelica.SIunits.Torque T_Load=161.4 "nominal load torque";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmLoad=1440.45 "nominal load speed";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>3rd Test example: Asynchronous induction Machine with slipring rotor - resistance starting</b><br>
At start time tStart1 three phase voltage is supplied to the asynchronous induction machine with sliprings;
the machine starts from standstill, accelerating inertias against load torque quadratic dependent on speed,
using a starting resistance. At time tStart2 tStart2 is shortened, finally reaching nominal speed.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>AIMS1.rpm_mechanical: motor's speed</li>
<li>AIMS1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SlipRing</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SlipRing AIMS1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Sources.SineVoltage SineVoltage1(final m=m, freqHz=fill(fNominal, m), V=fill(sqrt(2/3)*VNominal, m)) annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep1[m](each startTime=tStart1) annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Ideal.IdealClosingSwitch IdealCloser1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Basic.Star Star3(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,-90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Ideal.IdealCommutingSwitch IdealCommutingSwitch1(m=m) annotation(Placement(visible=true, transformation(origin={-40.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Basic.Resistor Resistor1(m=m, R=fill(Rstart, m)) annotation(Placement(visible=true, transformation(origin={-60.0,-70.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Basic.Star Star4(final m=m) annotation(Placement(visible=true, transformation(origin={-90.0,-70.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanStep BooleanStep2[m](each startTime=tStart2) annotation(Placement(visible=true, transformation(origin={-70.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.QuadraticSpeedDependentTorque QuadraticLoadTorque1(w_nominal=Modelica.SIunits.Conversions.from_rpm(rpmLoad), tau_nominal=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1(StarDelta="D") annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Ground Ground3 annotation(Placement(visible=true, transformation(origin={-90.0,-90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(Resistor1.plug_p,IdealCommutingSwitch1.plug_n1) annotation(Line(visible=true, origin={-46.6667,-63.3333}, points={{-3.3333,-6.6667},{1.6667,-6.6667},{1.6667,13.3333}}, color={0,0,255}));
      connect(IdealCommutingSwitch1.plug_n2,AIMS1.plug_rn) annotation(Line(visible=true, points={{-40.0,-50.0},{-28.0,-50.0},{-28.0,-46.0},{-20.0,-46.0}}, color={0,0,255}));
      connect(IdealCommutingSwitch1.plug_p,AIMS1.plug_rp) annotation(Line(visible=true, points={{-40.0,-30.0},{-30.0,-30.0},{-30.0,-34.0},{-20.0,-34.0}}, color={0,0,255}));
      connect(BooleanStep2.y,IdealCommutingSwitch1.control) annotation(Line(visible=true, origin={-53.5,-40.0}, points={{-5.5,0.0},{5.5,0.0}}, color={255,0,255}));
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{-10.0,-20.0},{-0.0,-20.0},{0.0,-10.0}}, color={0,0,255}));
      connect(TerminalBox1.positiveMachinePlug,AIMS1.plug_sp) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(TerminalBox1.negativeMachinePlug,AIMS1.plug_sn) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(IdealCloser1.plug_n,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{0.0,20.0},{-0.0,16.0},{0.0,16.0},{0.0,10.0}}, color={0,0,255}));
      connect(BooleanStep1.y,IdealCloser1.control) annotation(Line(visible=true, points={{-59.0,40.0},{-20.0,40.0},{-20.0,30.0},{-7.0,30.0}}, color={255,0,255}));
      connect(AIMS1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(LoadInertia.flange_b,QuadraticLoadTorque1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(AIMS1.plug_rn,Star3.plug_p) annotation(Line(visible=true, points={{-20.0,-46.0},{-20.0,-90.0},{-50.0,-90.0}}, color={0,0,255}));
      connect(Star4.plug_p,Resistor1.plug_n) annotation(Line(visible=true, points={{-80.0,-70.0},{-70.0,-70.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,IdealCloser1.plug_p) annotation(Line(visible=true, points={{0.0,70.0},{0.0,48.0},{0.0,46.0},{0.0,46.0},{0.0,40.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{0.0,50.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
      connect(Star3.pin_n,Ground3.p) annotation(Line(visible=true, points={{-70.0,-90.0},{-80.0,-90.0}}, color={0,0,255}));
    end AIMS_start;

    model AIMC_Inverter "Test example 4: AsynchronousInductionMachineSquirrelCage with inverter"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Frequency f=50 "actual frequency";
      parameter Modelica.SIunits.Time tRamp=1 "frequency ramp";
      parameter Modelica.SIunits.Torque T_Load=161.4 "nominal load torque";
      parameter Modelica.SIunits.Time tStep=1.2 "time of load torque step";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>4th Test example: Asynchronous induction Machine with squirrel cage fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a threephase SignalVoltage.<br>
Frequency is raised by a ramp, causing the asynchronous induction machine with squirrel cage to start, 
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>AIMC1.rpm_mechanical: motor's speed</li>
<li>AIMC1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>AIM_SquirrelCage</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Blocks.Sources.Ramp Ramp1(height=f, duration=tRamp) annotation(Placement(visible=true, transformation(origin={-70.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.VfController VfController1(final m=m, VNominal=VNominal, fNominal=fNominal) annotation(Placement(visible=true, transformation(origin={-30.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.TorqueStep TorqueStep1(startTime=tStep, stepTorque=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1 annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Sources.SignalVoltage SignalVoltage1(final m=m) annotation(Placement(visible=true, transformation(origin={-0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
      Modelica.Electrical.Machines.BasicMachines.AsynchronousInductionMachines.AIM_SquirrelCage AIMC1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{-10.0,-20.0},{-0.0,-20.0},{0.0,-10.0}}, color={0,0,255}));
      connect(TorqueStep1.flange,LoadInertia.flange_b) annotation(Line(visible=true, points={{70.0,-40.0},{60.0,-40.0}}));
      connect(Ramp1.y,VfController1.u) annotation(Line(visible=true, points={{-59.0,60.0},{-42.0,60.0}}, color={0,0,255}));
      connect(SignalVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{-0.0,70.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(VfController1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-19.0,60.0},{-7.0,60.0}}, color={0,0,255}));
      connect(SignalVoltage1.plug_p,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{-0.0,50.0},{0.0,40.0},{0.0,40.0},{0.0,30.0},{0.0,10.0},{0.0,10.0}}, color={0,0,255}));
      connect(AIMC1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(TerminalBox1.negativeMachinePlug,AIMC1.plug_sn) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(TerminalBox1.positiveMachinePlug,AIMC1.plug_sp) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
    end AIMC_Inverter;

    model SMR_Inverter "Test example 5: SynchronousInductionMachineReluctanceRotor with inverter"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Frequency f=50 "actual frequency";
      parameter Modelica.SIunits.Time tRamp=1 "frequency ramp";
      parameter Modelica.SIunits.Torque T_Load=46 "nominal load torque";
      parameter Modelica.SIunits.Time tStep=1.2 "time of load torque step";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>5th Test example: Synchronous Induction Machine with Reluctance rotor fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a threephase SignalVoltage.<br>
Frequency is raised by a ramp, causing the reluctance machine to start, 
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>SMRD1.rpm_mechanical: motor's speed</li>
<li>SMRD1.tau_electrical: motor's torque</li>
<li>RotorAngle.rotorAngle: rotor displacement angle</li>
</ul>
Default machine parameters of model <i>SM_ReluctanceRotorDamperCage</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ReluctanceRotorDamperCage SMR1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.Machines.Sensors.RotorAngle RotorAngle1(p=SMR1.p) annotation(Placement(visible=true, transformation(origin={-10.0,-10.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-90)));
      Modelica.Blocks.Sources.Ramp Ramp1(height=f, duration=tRamp) annotation(Placement(visible=true, transformation(origin={-70.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.VfController VfController1(final m=m, VNominal=VNominal, fNominal=fNominal) annotation(Placement(visible=true, transformation(origin={-30.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.TorqueStep TorqueStep1(startTime=tStep, stepTorque=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1 annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Sources.SignalVoltage SignalVoltage1(final m=m) annotation(Placement(visible=true, transformation(origin={-0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{12.0,-28.0},{12.0,20.0},{0.0,20.0}}, color={0,0,255}));
      connect(TerminalBox1.negativeMachinePlug,SMR1.plug_sn) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(TerminalBox1.positiveMachinePlug,SMR1.plug_sp) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(SMR1.flange_a,RotorAngle1.flange) annotation(Line(visible=true, points={{0.0,-40.0},{0.0,-10.0}}));
      connect(SMR1.plug_sp,RotorAngle1.plug_p) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-25.0},{-4.0,-20.0},{-4.0,-20.0}}, color={0,0,255}));
      connect(SMR1.plug_sn,RotorAngle1.plug_n) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-20.0}}, color={0,0,255}));
      connect(LoadInertia.flange_b,TorqueStep1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(Ramp1.y,VfController1.u) annotation(Line(visible=true, points={{-59.0,60.0},{-42.0,60.0}}, color={0,0,255}));
      connect(SMR1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(SignalVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{-0.0,70.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(VfController1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-19.0,60.0},{-7.0,60.0}}, color={0,0,255}));
      connect(CurrentRMSsensor1.plug_p,SignalVoltage1.plug_p) annotation(Line(visible=true, points={{0.0,40.0},{0.0,42.5},{0.0,42.5},{0.0,45.0},{0.0,50.0},{-0.0,50.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
    end SMR_Inverter;

    model SMPM_Inverter "Test example 6: PermanentMagnetSynchronousInductionMachine with inverter"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Frequency f=50 "actual frequency";
      parameter Modelica.SIunits.Time tRamp=1 "frequency ramp";
      parameter Modelica.SIunits.Torque T_Load=181.4 "nominal load torque";
      parameter Modelica.SIunits.Time tStep=1.2 "time of load torque step";
      parameter Modelica.SIunits.Inertia J_Load=0.29 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=1.5, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>6th Test example: Permanent Magnet Synchronous Induction Machine fed by an ideal inverter</b><br>
An ideal frequency inverter is modeled by using a VfController and a threephase SignalVoltage.<br>
Frequency is raised by a ramp, causing the permanent magnet synchronous induction machine to start, 
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 1.5 seconds and plot (versus time):
<ul>
<li>CurrentRMSsensor1.I: stator current RMS</li>
<li>PMSMD1.rpm_mechanical: motor's speed</li>
<li>PMSMD1.tau_electrical: motor's torque</li>
<li>RotorAngle.rotorAngle: rotor displacement angle</li>
</ul>
Default machine parameters of model <i>SM_PermanentMagnetDamperCage</i> are used.
</p>
<p>
<b>In practice it is nearly impossible to drive a PMSMD without current controller.</b>
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_PermanentMagnetDamperCage SMPM1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.Machines.Sensors.RotorAngle RotorAngle1(p=SMPM1.p) annotation(Placement(visible=true, transformation(origin={-10.0,-10.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
      Modelica.Blocks.Sources.Ramp Ramp1(height=f, duration=tRamp) annotation(Placement(visible=true, transformation(origin={-70.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.VfController VfController1(final m=m, VNominal=VNominal, fNominal=fNominal, BasePhase=+Modelica.Constants.pi/2) annotation(Placement(visible=true, transformation(origin={-30.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.TorqueStep TorqueStep1(startTime=tStep, stepTorque=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1 annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.MultiPhase.Sources.SignalVoltage SignalVoltage1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-90)));
    equation 
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{12.0,-28.0},{12.0,20.0},{0.0,20.0}}, color={0,0,255}));
      connect(TerminalBox1.positiveMachinePlug,SMPM1.plug_sp) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(TerminalBox1.negativeMachinePlug,SMPM1.plug_sn) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(SMPM1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(RotorAngle1.flange,SMPM1.flange_a) annotation(Line(visible=true, points={{0.0,-10.0},{0.0,-40.0}}));
      connect(RotorAngle1.plug_p,SMPM1.plug_sp) annotation(Line(visible=true, points={{-4.0,-20.0},{-4.0,-25.0},{-4.0,-25.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(RotorAngle1.plug_n,SMPM1.plug_sn) annotation(Line(visible=true, points={{-16.0,-20.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(LoadInertia.flange_b,TorqueStep1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(Ramp1.y,VfController1.u) annotation(Line(visible=true, points={{-59.0,60.0},{-42.0,60.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
      connect(SignalVoltage1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{0.0,70.0},{-0.0,90.0},{-50.0,90.0}}, color={0,0,255}));
      connect(VfController1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-19.0,60.0},{-7.0,60.0}}, color={0,0,255}));
      connect(SignalVoltage1.plug_p,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{0.0,50.0},{0.0,50.0},{0.0,40.0},{0.0,40.0}}, color={0,0,255}));
    end SMPM_Inverter;

    model SMEE_Gen "Test example 7: ElectricalExcitedSynchronousInductionMachine as Generator"
      extends Modelica.Icons.Example;
      constant Integer m=3 "number of phases";
      parameter Modelica.SIunits.Voltage VNominal=100 "nominal RMS voltage per phase";
      parameter Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpm=1499 "nominal speed";
      parameter Modelica.SIunits.Current Ie=19 "excitation current";
      parameter Modelica.SIunits.Current Ie0=10 "initial excitation current";
      parameter Modelica.SIunits.Conversions.NonSIunits.Angle_deg gamma0=0 "initial rotor displacement angle";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=30, Interval=0.005), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>7th Test example: Electrical Excited Synchronous Induction Machine as generator</b><br>
An electrically excited synchronous generator is connected to the grid and driven with constant speed. 
Since speed is slightly smaller than synchronous speed corresponding to mains frequency, 
rotor angle is very slowly increased. This allows to see several charactersistics dependent on rotor angle.
Simulate for 30 seconds and plot (versus RotorAngle1.rotorAngle):
<ul>
<li>SMEED1.tau_electrical</li>
<li>CurrentRMSsensor1.I</li>
<li>ElectricalPowerSensor1.P</li>
<li>ElectricalPowerSensor1.Q</li>
<li>MechanicalPowerSensor1.P</li>
</ul>
Default machine parameters of model <i>SM_ElectricalExcitedDamperCage</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.SynchronousInductionMachines.SM_ElectricalExcitedDamperCage SMEE1(phi_mechanical(start=-(Modelica.Constants.pi + Modelica.SIunits.Conversions.from_deg(gamma0))/SMEE1.p)) annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.RotorAngle RotorAngle1(p=SMEE1.p) annotation(Placement(visible=true, transformation(origin={-10.0,-10.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
      Modelica.Mechanics.Rotational.ConstantSpeed ConstantSpeed1(final w_fixed=Modelica.SIunits.Conversions.from_rpm(rpm)) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.MechanicalPowerSensor MechanicalPowerSensor1 annotation(Placement(visible=true, transformation(origin={20.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Sensors.CurrentRMSsensor CurrentRMSsensor1 annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Sources.SineVoltage SineVoltage1(final m=m, final V=fill(VNominal*sqrt(2), m), final freqHz=fill(fNominal, m)) annotation(Placement(visible=true, transformation(origin={-30.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,90.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Machines.Examples.Utilities.TerminalBox TerminalBox1 annotation(Placement(visible=true, transformation(origin={-10.0,-20.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-90.0,90.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Ground Ground3 annotation(Placement(visible=true, transformation(origin={-90.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Sources.RampCurrent RampCurrent1(duration=0.1, I=Ie - Ie0, offset=Ie0) annotation(Placement(visible=true, transformation(origin={-50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-270)));
      Modelica.Electrical.Machines.Sensors.ElectricalPowerSensor ElectricalPowerSensor1 annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(MechanicalPowerSensor1.flange_b,ConstantSpeed1.flange) annotation(Line(visible=true, origin={50.0,-40.0}, points={{-20.0,0.0},{20.0,0.0}}));
      connect(SMEE1.flange_a,MechanicalPowerSensor1.flange_a) annotation(Line(visible=true, origin={5.0,-40.0}, points={{-5.0,0.0},{5.0,0.0}}));
      connect(ElectricalPowerSensor1.plug_nv,RotorAngle1.plug_n) annotation(Line(visible=true, points={{-10.0,60.0},{-20.0,60.0},{-20.0,-20.0},{-16.0,-20.0}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,ElectricalPowerSensor1.plug_p) annotation(Line(visible=true, origin={-6.6667,83.3333}, points={{-13.3333,6.6667},{6.6667,6.6667},{6.6667,-13.3333}}, color={0,0,255}));
      connect(ElectricalPowerSensor1.plug_ni,CurrentRMSsensor1.plug_p) annotation(Line(visible=true, points={{0.0,50.0},{0.0,46.0},{0.0,46.0},{0.0,40.0}}, color={0,0,255}));
      connect(TerminalBox1.plugToGrid,CurrentRMSsensor1.plug_n) annotation(Line(visible=true, points={{-10.0,-28.0},{10.0,-28.0},{10.0,20.0},{0.0,20.0}}, color={0,0,255}));
      connect(SMEE1.plug_sp,TerminalBox1.positiveMachinePlug) annotation(Line(visible=true, points={{-4.0,-30.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(SMEE1.plug_sn,TerminalBox1.negativeMachinePlug) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(Star1.plug_p,SineVoltage1.plug_n) annotation(Line(visible=true, points={{-50.0,90.0},{-40.0,90.0}}, color={0,0,255}));
      connect(RotorAngle1.flange,SMEE1.flange_a) annotation(Line(visible=true, points={{0.0,-10.0},{0.0,-40.0}}));
      connect(RotorAngle1.plug_p,SMEE1.plug_sp) annotation(Line(visible=true, points={{-4.0,-20.0},{-4.0,-25.0},{-4.0,-25.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(RotorAngle1.plug_n,SMEE1.plug_sn) annotation(Line(visible=true, points={{-16.0,-20.0},{-16.0,-30.0}}, color={0,0,255}));
      connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-70.0,90.0},{-80.0,90.0}}, color={0,0,255}));
      connect(RampCurrent1.p,Ground3.p) annotation(Line(visible=true, points={{-50.0,-50.0},{-80.0,-50.0}}, color={0,0,255}));
      connect(RampCurrent1.p,SMEE1.pin_en) annotation(Line(visible=true, points={{-50.0,-50.0},{-40.0,-50.0},{-40.0,-46.0},{-20.0,-46.0}}, color={0,0,255}));
      connect(RampCurrent1.n,SMEE1.pin_ep) annotation(Line(visible=true, points={{-50.0,-30.0},{-40.0,-30.0},{-40.0,-34.0},{-20.0,-34.0}}, color={0,0,255}));
    end SMEE_Gen;

    model DCPM_start "Test example 8: DC with permanent magnet starting with voltage ramp"
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Voltage Va=100 "actual armature voltage";
      parameter Modelica.SIunits.Time tStart=0.2 "armature voltage ramp";
      parameter Modelica.SIunits.Time tRamp=0.8 "armature voltage ramp";
      parameter Modelica.SIunits.Torque T_Load=63.66 "nominal load torque";
      parameter Modelica.SIunits.Time tStep=1.5 "time of load torque step";
      parameter Modelica.SIunits.Inertia J_Load=0.15 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>8th Test example: Permanent magnet DC Machine started with an armature voltage ramp</b><br>
A voltage ramp is applied to the armature, causing the DC machine to start, 
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>DCPM1.ia: armature current</li>
<li>DCPM1.rpm_mechanical: motor's speed</li>
<li>DCPM1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>DC_PermanentMagnet</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_PermanentMagnet DCPM1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(duration=tRamp, height=Va, startTime=tStart) annotation(Placement(visible=true, transformation(origin={-70.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.TorqueStep TorqueStep1(startTime=tStep, stepTorque=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Sources.SignalVoltage SignalVoltage1 annotation(Placement(visible=true, transformation(origin={-10.0,40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-360)));
    equation 
      connect(LoadInertia.flange_b,TorqueStep1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(DCPM1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(Ramp1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-59.0,70.0},{-10.0,70.0},{-10.0,47.0}}, color={0,0,255}));
      connect(SignalVoltage1.p,DCPM1.pin_ap) annotation(Line(visible=true, points={{0.0,40.0},{0.0,-20.0},{-4.0,-20.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(SignalVoltage1.n,Ground1.p) annotation(Line(visible=true, points={{-20.0,40.0},{-60.0,40.0}}, color={0,0,255}));
      connect(DCPM1.pin_an,SignalVoltage1.n) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-20.0},{-20.0,-20.0},{-20.0,40.0}}, color={0,0,255}));
    end DCPM_start;

    model DCEE_start "Test example 9: DC with electrical ecxitation starting with voltage ramp"
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Voltage Va=100 "actual armature voltage";
      parameter Modelica.SIunits.Time tStart=0.2 "armature voltage ramp";
      parameter Modelica.SIunits.Time tRamp=0.8 "armature voltage ramp";
      parameter Modelica.SIunits.Voltage Ve=100 "actual excitation voltage";
      parameter Modelica.SIunits.Torque T_Load=63.66 "nominal load torque";
      parameter Modelica.SIunits.Time tStep=1.5 "time of load torque step";
      parameter Modelica.SIunits.Inertia J_Load=0.15 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>9th Test example: Electrically separate excited DC Machine started with an armature voltage ramp</b><br>
A voltage ramp is applied to the armature, causing the DC machine to start, 
and accelerating inertias.<br>At time tStep a load step is applied.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>DCEE1.ia: armature current</li>
<li>DCEE1.rpm_mechanical: motor's speed</li>
<li>DCEE1.tau_electrical: motor's torque</li>
<li>DCEE1.ie: excitation current</li>
</ul>
Default machine parameters of model <i>DC_ElectricalExcited</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Blocks.Sources.Ramp Ramp1(duration=tRamp, height=Va, startTime=tStart) annotation(Placement(visible=true, transformation(origin={-70.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.TorqueStep TorqueStep1(startTime=tStep, stepTorque=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Sources.ConstantVoltage ConstantVoltage1(V=Ve) annotation(Placement(visible=true, transformation(origin={-40.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-450)));
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_ElectricalExcited DCEE1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage SignalVoltage1 annotation(Placement(visible=true, transformation(origin={-10.0,40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-720)));
      Modelica.Electrical.Analog.Basic.Ground Grounda annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Ground Grounde annotation(Placement(visible=true, transformation(origin={-70.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(LoadInertia.flange_b,TorqueStep1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(DCEE1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(DCEE1.pin_ep,ConstantVoltage1.p) annotation(Line(visible=true, points={{-20.0,-34.0},{-30.0,-34.0},{-30.0,-30.0},{-40.0,-30.0}}, color={0,0,255}));
      connect(DCEE1.pin_en,ConstantVoltage1.n) annotation(Line(visible=true, points={{-20.0,-46.0},{-30.0,-46.0},{-30.0,-50.0},{-40.0,-50.0}}, color={0,0,255}));
      connect(Ramp1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-59.0,70.0},{-10.0,70.0},{-10.0,47.0}}, color={0,0,255}));
      connect(SignalVoltage1.p,DCEE1.pin_ap) annotation(Line(visible=true, points={{0.0,40.0},{0.0,-20.0},{-4.0,-20.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(SignalVoltage1.n,Grounda.p) annotation(Line(visible=true, points={{-20.0,40.0},{-60.0,40.0}}, color={0,0,255}));
      connect(DCEE1.pin_an,Grounda.p) annotation(Line(visible=true, points={{-16.0,-30.0},{-16.0,-20.0},{-20.0,-20.0},{-20.0,40.0},{-60.0,40.0}}, color={0,0,255}));
      connect(ConstantVoltage1.n,Grounde.p) annotation(Line(visible=true, points={{-40.0,-50.0},{-60.0,-50.0}}, color={0,0,255}));
    end DCEE_start;

    model DCSE_start "Test example 10: DC with serial excitation starting with voltage ramp"
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Voltage Va=100 "actual armature voltage";
      parameter Modelica.SIunits.Time tStart=0.2 "armature voltage ramp";
      parameter Modelica.SIunits.Time tRamp=0.8 "armature voltage ramp";
      parameter Modelica.SIunits.Torque T_Load=63.66 "nominal load torque";
      parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmLoad=1402.5 "nominal load speed";
      parameter Modelica.SIunits.Inertia J_Load=0.15 "load's moment of inertia";
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=2, Interval=0.001), experimentSetupOutput(doublePrecision=true), Documentation(info="<HTML>
<p>
<b>10th Test example: Series excited DC Machine started with an armature voltage ramp</b><br>
A voltage ramp is applied to the armature, causing the DC machine to start, 
and accelerating inertiasagainst load torque quadratic dependent on speed, finally reaching nominal speed.<br>
Simulate for 2 seconds and plot (versus time):
<ul>
<li>DCSE1.ia: armature current</li>
<li>DCSE1.rpm_mechanical: motor's speed</li>
<li>DCSE1.tau_electrical: motor's torque</li>
</ul>
Default machine parameters of model <i>DC_SeriesExcited</i> are used.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Machines.BasicMachines.DCMachines.DC_SeriesExcited DCSE1 annotation(Placement(visible=true, transformation(origin={-10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp Ramp1(duration=tRamp, height=Va, startTime=tStart) annotation(Placement(visible=true, transformation(origin={-70.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Sources.SignalVoltage SignalVoltage1 annotation(Placement(visible=true, transformation(origin={-10.0,40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia LoadInertia(J=J_Load) annotation(Placement(visible=true, transformation(origin={50.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.QuadraticSpeedDependentTorque QuadraticLoadTorque1(w_nominal=Modelica.SIunits.Conversions.from_rpm(rpmLoad), tau_nominal=-T_Load) annotation(Placement(visible=true, transformation(origin={80.0,-40.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground Grounda annotation(Placement(visible=true, transformation(origin={-70.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(DCSE1.pin_en,SignalVoltage1.n) annotation(Line(visible=true, points={{-20.0,-46.0},{-30.0,-46.0},{-30.0,-20.0},{-20.0,-20.0},{-20.0,40.0}}, color={0,0,255}));
      connect(DCSE1.pin_an,DCSE1.pin_ep) annotation(Line(visible=true, points={{-16.0,-30.0},{-20.0,-30.0},{-20.0,-34.0}}, color={0,0,255}));
      connect(LoadInertia.flange_b,QuadraticLoadTorque1.flange) annotation(Line(visible=true, points={{60.0,-40.0},{70.0,-40.0}}));
      connect(SignalVoltage1.p,DCSE1.pin_ap) annotation(Line(visible=true, points={{0.0,40.0},{0.0,-20.0},{-4.0,-20.0},{-4.0,-30.0}}, color={0,0,255}));
      connect(Ramp1.y,SignalVoltage1.v) annotation(Line(visible=true, points={{-59.0,70.0},{-10.0,70.0},{-10.0,47.0}}, color={0,0,255}));
      connect(DCSE1.flange_a,LoadInertia.flange_a) annotation(Line(visible=true, points={{0.0,-40.0},{40.0,-40.0}}));
      connect(SignalVoltage1.n,Grounda.p) annotation(Line(visible=true, points={{-20.0,40.0},{-60.0,40.0}}, color={0,0,255}));
    end DCSE_start;

    package Utilities "Library with auxiliary models for testing"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains components utility components for testing examples.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.3.1 2004/11/06 Anton Haumer<br>
       small changes in VfController</li>
  <li> v1.6.1 2004/11/22 Anton Haumer<br>
       introduced TerminalBox</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      block VfController "Voltage-Frequency-Controller"
        extends Modelica.Blocks.Interfaces.SIMO(final nout=m, u(redeclare type SignalType= Modelica.SIunits.Frequency ), y(redeclare type SignalType= Modelica.SIunits.Voltage ));
        constant Real pi=Modelica.Constants.pi;
        parameter Integer m=3 "number of phases";
        parameter Modelica.SIunits.Voltage VNominal "nominal RMS voltage per phase";
        parameter Modelica.SIunits.Frequency fNominal "nominal frequency";
        parameter Modelica.SIunits.Angle BasePhase=0 "common phase shift";
        output Modelica.SIunits.Angle x(start=0, fixed=true) "Integrator state";
        output Modelica.SIunits.Voltage amplitude;
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Simple Voltage-Frequency-Controller.<br>
Amplitude of voltage is linear dependent (VNominal/fNominal) on Frequency (input signal \"u\"), but limited by VNominal (nominal RMS voltage per phase).<br>
m sine-waves with amplitudes as described above are provided as output signal \"y\".<br>
The sine-waves are intended to feed a m-phase SignalVoltage.<br>
Phase shifts between sine-waves may be choosen by the user; default values are <i>(k-1)/m*pi for k in 1:m</i>.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={10.0,-22.7276}, points={{-110.0,-77.2724},{-3.6842,67.2714},{72.0068,67.2714}}, color={0,0,255}),Line(visible=true, origin={-10.0,0.0}, points={{-50.0,0.0},{-25.0,70.0},{0.0,0.0},{25.0,-70.0},{50.0,0.0}}, color={160,160,164}, smooth=Smooth.Bezier),Line(visible=true, origin={10.0,0.0}, points={{-50.0,0.0},{-25.0,70.0},{0.0,0.0},{25.0,-70.0},{50.0,0.0}}, color={160,160,164}, smooth=Smooth.Bezier),Line(visible=true, origin={30.0,0.0}, points={{-50.0,0.0},{-25.0,70.0},{0.0,0.0},{25.0,-70.0},{50.0,0.0}}, color={160,160,164}, smooth=Smooth.Bezier)}));
      equation 
        amplitude=sqrt(2)*VNominal*(if abs(u) < fNominal then abs(u)/fNominal else 1);
        der(x)=2*pi*u;
        y=array(amplitude*sin(x + BasePhase - (k - 1)*2/m*pi) for k in 1:m);
      end VfController;

      model SwitchYD "Y-D-switch"
        constant Integer m=3 "number of phases";
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_P(final m=m) annotation(Placement(visible=true, transformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug pug_PS(final m=m) annotation(Placement(visible=true, transformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_NS(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80.0,52.0},{-40.0,0.0},{0.0,52.0},{-40.0,0.0},{-40.0,-52.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{0.0,40.0},{0.0,-40.0},{80.0,0.0},{0.0,40.0}}, color={0,0,255}, thickness=0.5)}), Documentation(info="<HTML>
<p>
Simple Star-Delta-switch.<br>
If <i>control</i> is false, plug_PS and plug_NS are star connected and plug_PS connected to plug_P.<br>
If <i>control</i> is true, plug_PS and plug_NS are delta connected and they are connected to plug_P.
</p>
</HTML>"));
        Modelica.Electrical.MultiPhase.Basic.Star star(final m=m) annotation(Placement(visible=true, transformation(origin={70.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Delta delta(final m=m) annotation(Placement(visible=true, transformation(origin={70.0,-70.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Ideal.IdealCommutingSwitch idealCommutingSwitch(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanInput control[m] annotation(Placement(visible=true, transformation(origin={-110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(control,idealCommutingSwitch.control) annotation(Line(visible=true, points={{-110.0,0.0},{0.0,0.0},{0.0,-52.0}}, color={255,0,255}));
        connect(idealCommutingSwitch.plug_p,plug_NS) annotation(Line(visible=true, points={{-10.0,-60.0},{-100.0,-60.0},{-100.0,-100.0}}, color={0,0,255}));
        connect(idealCommutingSwitch.plug_n1,star.plug_p) annotation(Line(visible=true, points={{10.0,-55.0},{10.0,-40.0},{60.0,-40.0}}, color={0,0,255}));
        connect(idealCommutingSwitch.plug_n2,delta.plug_n) annotation(Line(visible=true, points={{10.0,-60.0},{10.0,-70.0},{60.0,-70.0}}, color={0,0,255}));
        connect(delta.plug_p,pug_PS) annotation(Line(visible=true, points={{80.0,-70.0},{100.0,-70.0},{100.0,-100.0}}, color={0,0,255}));
        connect(delta.plug_p,plug_P) annotation(Line(visible=true, points={{80.0,-70.0},{100.0,-70.0},{100.0,100.0}}, color={0,0,255}));
      end SwitchYD;

      model TerminalBox
        constant Integer m=3 "number of phases";
        parameter String StarDelta="Y" annotation(choices(choice="Y" "Star connection", choice="D" "Delta connection"));
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug positiveMachinePlug(final m=m) annotation(Placement(visible=true, transformation(origin={60.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={60.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.NegativePlug negativeMachinePlug(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-60.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Star star(final m=m) if StarDelta <> "D" annotation(Placement(visible=true, transformation(origin={-70.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=180)));
        Modelica.Electrical.MultiPhase.Basic.Delta delta(final m=m) if StarDelta == "D" annotation(Placement(visible=true, transformation(origin={-30.0,-60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plugToGrid(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={0.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-80.0,-80.0},{-80.0,-84.0},{-80.0,-120.0},{-40.0,-140.0},{40.0,-140.0},{80.0,-110.0},{80.0,-84.0},{76.0,-80.0},{-80.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-130.0},{40.0,-90.0}}, textString="%StarDelta", fontName="Arial")}), Documentation(info="<html>
<p>
TerminalBox: at the bottom connected to both machine plugs, connect at the top to the grid as usual,<br>
choosing Y-connection (StarDelta=Y) or D-connection (StarDelta=D).
</p>
</html>"));
        Modelica.Electrical.Analog.Interfaces.NegativePin starpoint if StarDelta <> "D" annotation(Placement(visible=true, transformation(origin={-90.0,-80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-90.0,-80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(star.pin_n,starpoint) annotation(Line(visible=true, points={{-80.0,-80.0},{-90.0,-80.0}}, color={0,0,255}));
        connect(positiveMachinePlug,plugToGrid) annotation(Line(visible=true, points={{60.0,-100.0},{0.0,-100.0},{0.0,-80.0}}, color={0,0,255}));
        connect(delta.plug_p,positiveMachinePlug) annotation(Line(visible=true, points={{-20.0,-60.0},{60.0,-60.0},{60.0,-100.0}}, color={0,0,255}));
        connect(negativeMachinePlug,delta.plug_n) annotation(Line(visible=true, points={{-60.0,-100.0},{-40.0,-100.0},{-40.0,-60.0}}, color={0,0,255}));
        connect(negativeMachinePlug,star.plug_p) annotation(Line(visible=true, points={{-60.0,-100.0},{-60.0,-80.0}}, color={0,0,255}));
      end TerminalBox;

    end Utilities;

  end Examples;

  package BasicMachines "Basic machine models"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains components for modeling electrical machines, specially threephase induction machines, based on space phasor theory:
<ul>
<li>package AsynchronousInductionMachines: models of three phase asynchronous induction machines</li>
<li>package SynchronousInductionMachines: models of three phase synchronous induction machines</li>
<li>package DCMachines: models of DC machines with different excitation</li>
<li>package Components: components for modeling machines</li>
</ul>
The induction machine models use package SpacePhasors.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00  2004/09/16 Anton Haumer</li>
  <li> v1.01  2004/09/18 Anton Haumer<br>
       moved common equations from machine models to PartialMachine</li>
  <li> v1.02  2004/09/19 Anton Haumer<br>
       new package structure for machine types<br>
       added DCMachine models</li>
  <li> v1.03  2004/09/24 Anton Haumer<br>
       added DC machine with series excitation</li>
  <li> v1.1   2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2   2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.53  2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v1.6.2 2005/10/23 Anton Haumer<br>
       selectable DamperCage for Synchronous Machines</li>
  <li> v1.6.3 2005/11/25 Anton Haumer<br>
       easier parametrisation of AsynchronousInductionMachines.AIM_SlipRing model</li>
  <li> v1.7.1 2006/02/06 Anton Haumer<br>
       changed some naming of synchronous machines, not affecting existing models</li>
  </ul>
<HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={0,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-60.0,-60.0},{60.0,60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{-80.0,-60.0},{-60.0,60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{60.0,-10.0},{80.0,10.0}}),Rectangle(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-59.66,50.0},{20.34,70.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-70.0,-90.0},{-60.0,-90.0},{-30.0,-20.0},{20.0,-20.0},{50.0,-90.0},{60.0,-90.0},{60.0,-100.0},{-70.0,-100.0},{-70.0,-90.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package AsynchronousInductionMachines "Models of asynchronous induction machines"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains models of asynchronous induction machines, based on space phasor theory:
<ul>
<li>AIM_SquirrelCage: asynchronous induction machine with squirrel cage</li>
<li>AIM_SlipRing: asynchronous induction machine with wound rotor</li>
</ul>
These models use package SpacePhasors.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.02 2004/09/19 Anton Haumer</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       consistent naming of inductors and resistors in machine models</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.6.3 2005/11/25 Anton Haumer<br>
       easier parametrisation of SlipRing model</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model AIM_SquirrelCage "Asynchronous induction machine with squirrel cage rotor"
        extends Machines.Interfaces.PartialBasicInductionMachine;
        constant Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
        parameter Modelica.SIunits.Resistance Rs=0.03 "|Nominal resistances and inductances|warm stator resistance per phase";
        parameter Modelica.SIunits.Inductance Lssigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fNominal) "|Nominal resistances and inductances|stator stray inductance per phase";
        parameter Modelica.SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance";
        parameter Modelica.SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fNominal) "|Nominal resistances and inductances|rotor stray inductance";
        parameter Modelica.SIunits.Resistance Rr=0.04 "|Nominal resistances and inductances|warm rotor resistance";
        output Modelica.SIunits.Current i_0_s(stateSelect=StateSelect.default)=spacePhasorS.zero.i "stator zero-sequence current";
        output Modelica.SIunits.Current idq_ss[2]=airGapS.i_ss "stator space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)=airGapS.i_sr "stator space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current idq_rs[2]=airGapS.i_rs "rotor space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_rr[2](each stateSelect=StateSelect.prefer)=airGapS.i_rr "rotor space phasor current / rotor fixed frame";
        Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m=m, final R=fill(Rs, m)) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(final m=m, final L=fill(Lssigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        annotation(defaultComponentName="AIMC", Documentation(info="<HTML>
<p>
<b>Model of a three phase asynchronous induction machine with squirrel cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed ccordinate system. Both together connected via a stator-fixed <i>AirGap</i> model. Only losses in stator and rotor resistance are taken into account.
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>number of pole pairs p</td>
<td>2</td><td> </td>
</tr>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal frequency fNominal</td>
<td>50</td><td>Hz</td>
</tr>
<tr>
<td>nominal voltage per phase</td>
<td>100</td><td>V RMS</td>
</tr>
<tr>
<td>nominal current per phase</td>
<td>100</td><td>A RMS</td>
</tr>
<tr>
<td>nominal torque</td>
<td>161.4</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1440.45</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>24.346</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>92.7</td><td>%</td>
</tr>
<tr>
<td>power factor</td>
<td>0.875</td><td> </td>
</tr>
<tr>
<td>stator resistance</td>
<td>0.03</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>rotor resistance</td>
<td>0.04</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>stator reactance Xs</td>
<td>3</td><td>Ohm per phase</td>
</tr>
<tr>
<td>rotor reactance Xr</td>
<td>3</td><td>Ohm</td>
</tr>
<tr>
<td>total stray coefficient sigma</td>
<td>0.0667</td><td> </td>
</tr>
<tr>
<td>These values give the following inductances, <br>assuming equal stator and rotor stray inductances:</td>
<td> </td><td> </td>
</tr>
<tr>
<td>stator stray inductance per phase</td>
<td>Xs * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>rotor stray inductance</td>
<td>Xr * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance per phase</td>
<td>sqrt(Xs*Xr * (1-sigma))/(2*pi*fNominal)</td><td> </td>
</tr>
</table>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapS airGapS(final p=p, final Lm=Lm) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.BasicMachines.Components.SquirrelCage squirrelCageR(final Lrsigma=Lrsigma, final Rr=Rr) annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      equation 
        connect(airGapS.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapS.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{28.0,0.0},{28.0,-0.0},{60.0,0.0}}));
        connect(spacePhasorS.plug_n,plug_sn) annotation(Line(visible=true, points={{-10.0,40.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_p,plug_sp) annotation(Line(visible=true, points={{60.0,60.0},{60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_n,lssigma.plug_p) annotation(Line(visible=true, points={{40.0,60.0},{30.0,60.0}}, color={0,0,255}));
        connect(lssigma.plug_n,spacePhasorS.plug_p) annotation(Line(visible=true, points={{10.0,60.0},{10.0,40.0}}, color={0,0,255}));
        connect(spacePhasorS.ground,spacePhasorS.zero) annotation(Line(visible=true, points={{-10.0,20.0},{-10.0,14.0},{-0.0,14.0},{0.0,20.0}}, color={0,0,255}));
        connect(spacePhasorS.spacePhasor,airGapS.spacePhasor_s) annotation(Line(visible=true, points={{10.0,20.0},{10.0,10.0}}, color={0,0,255}));
        connect(airGapS.spacePhasor_r,squirrelCageR.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-20.0}}, color={0,0,255}));
      end AIM_SquirrelCage;

      model AIM_SlipRing "Asynchronous induction machine with slipring rotor"
        extends Interfaces.PartialBasicInductionMachine;
        constant Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
        parameter Modelica.SIunits.Resistance Rs=0.03 "|Nominal resistances and inductances|warm stator resistance per phase";
        parameter Modelica.SIunits.Inductance Lssigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fNominal) "|Nominal resistances and inductances|stator stray inductance per phase";
        parameter Modelica.SIunits.Inductance Lm=3*sqrt(1 - 0.0667)/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance";
        parameter Modelica.SIunits.Inductance Lrsigma=3*(1 - sqrt(1 - 0.0667))/(2*pi*fNominal) "|Nominal resistances and inductances|rotor stray inductance per phase";
        parameter Modelica.SIunits.Resistance Rr=0.04 "|Nominal resistances and inductances|warm rotor resistance per phase";
        parameter Boolean useTurnsRatio=true "use TurnsRatio or calculate from locked-rotor voltage?";
        parameter Real TurnsRatio(final min=Modelica.Constants.small)=1 "(ws*xis) / (wr*xir)" annotation(Dialog(enable=useTurnsRatio));
        parameter Modelica.SIunits.Voltage VsNom=100 "Nominal stator voltage per phase" annotation(Dialog(enable=not useTurnsRatio));
        parameter Modelica.SIunits.Voltage Vr_LR=100*2*pi*fNominal*Lm/sqrt(Rs^2 + (2*pi*fNominal*(Lm + Lssigma))^2) "Locked-rotor voltage per phase" annotation(Dialog(enable=not useTurnsRatio));
        output Modelica.SIunits.Current i_0_s(stateSelect=StateSelect.prefer)=spacePhasorS.zero.i "stator zero-sequence current";
        output Modelica.SIunits.Current idq_ss[2]=airGapS.i_ss "stator space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)=airGapS.i_sr "stator space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current idq_rs[2]=airGapS.i_rs "rotor space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_rr[2](each stateSelect=StateSelect.prefer)=airGapS.i_rr "rotor space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current i_0_r=spacePhasorR.zero.i "rotor zero-sequence current";
        output Modelica.SIunits.Voltage vr[m]=plug_rp.pin.v - plug_rn.pin.v "rotor instantaneous voltages";
        output Modelica.SIunits.Current ir[m]=plug_rp.pin.i "rotor instantaneous currents";
        Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m=m, final R=fill(Rs, m)) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(final m=m, final L=fill(Lssigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Ideal.IdealTransformer IdealTransformer1(final m=m, final n=fill(1/internalTurnsRatio, m)) annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.MultiPhase.Basic.Star Star1(final m=m) annotation(Placement(visible=true, transformation(origin={-30.0,-50.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-50.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lrsigma(final m=m, final L=fill(Lrsigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,-80.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Resistor rr(final m=m, final R=fill(Rr, m)) annotation(Placement(visible=true, transformation(origin={50.0,-80.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_rp(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_rn(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,-60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,-60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        annotation(defaultComponentName="AIMS", Documentation(info="<HTML>
<p>
<b>Model of a three phase asynchronous induction machine with slipring rotor.</b><br>
Resistance and stray inductance of stator and rotor are modeled directly in stator respectively rotor phases, then using space phasor transformation and a stator-fixed <i>AirGap</i> model. Only losses in stator and rotor resistance are taken into account.
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>number of pole pairs p</td>
<td>2</td><td> </td>
</tr>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal frequency fNominal</td>
<td>50</td><td>Hz</td>
</tr>
<tr>
<td>nominal voltage per phase</td>
<td>100</td><td>V RMS</td>
</tr>
<tr>
<td>nominal current per phase</td>
<td>100</td><td>A RMS</td>
</tr>
<tr>
<td>nominal torque</td>
<td>161.4</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1440.45</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>24.346</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>92.7</td><td>%</td>
</tr>
<tr>
<td>power factor</td>
<td>0.875</td><td> </td>
</tr>
<tr>
<td>stator resistance</td>
<td>0.03</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>rotor resistance</td>
<td>0.04</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>stator reactance Xs</td>
<td>3</td><td>Ohm per phase</td>
</tr>
<tr>
<td>rotor reactance Xr</td>
<td>3</td><td>Ohm per phase</td>
</tr>
<tr>
<td>total stray coefficient sigma</td>
<td>0.0667</td><td> </td>
</tr>
<tr>
<td>TurnsRatio</td>
<td>1</td><td>effective ratio of stator and rotor current (ws*xis) / (wr*xir)</td>
</tr>
<tr>
<td>These values give the following inductances:</td>
<td> </td><td> </td>
</tr>
<tr>
<td>stator stray inductance per phase</td>
<td>Xs * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>rotor stray inductance</td>
<td>Xr * (1 - sqrt(1-sigma))/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance per phase</td>
<td>sqrt(Xs*Xr * (1-sigma))/(2*pi*f)</td><td> </td>
</tr>
</table>
</p>
<p>
Parameter TurnsRatio could be obtained from the following relationship 
at standstill with open rotor circuit at nominal voltage and nominal frequency, <br>
using the locked-rotor voltage VR, no-load stator current I0 and powerfactor PF0:<br>
TurnsRatio * <u>V</u><sub>R</sub> = <u>V</u><sub>s</sub> - (R<sub>s</sub> + j X<sub>s,sigma</sub>) <u>I</u><sub>0</sub>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100.0,50.0},{-100.0,20.0},{-60.0,20.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-50.0},{-100.0,-20.0},{-60.0,-20.0}}, color={0,0,255})}));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapS airGapS(final p=p, final Lm=Lm) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorR annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-450)));
      protected 
        parameter Real internalTurnsRatio=if useTurnsRatio then TurnsRatio else VsNom/Vr_LR*2*pi*fNominal*Lm/sqrt(Rs^2 + (2*pi*fNominal*(Lm + Lssigma))^2);
      equation 
        connect(spacePhasorR.plug_p,IdealTransformer1.plug_p2) annotation(Line(visible=true, points={{10.0,-40.0},{10.0,-50.0}}, color={0,0,255}));
        connect(spacePhasorR.plug_n,IdealTransformer1.plug_n2) annotation(Line(visible=true, origin={-10.0,-45.0}, points={{0.0,5.0},{-0.0,-5.0}}, color={0,0,255}));
        connect(IdealTransformer1.plug_p1,lrsigma.plug_n) annotation(Line(visible=true, points={{10.0,-70.0},{10.0,-80.0}}, color={0,0,255}));
        connect(Star1.plug_p,IdealTransformer1.plug_n2) annotation(Line(visible=true, points={{-20.0,-50.0},{-10.0,-50.0}}, color={0,0,255}));
        connect(IdealTransformer1.plug_n1,plug_rn) annotation(Line(visible=true, points={{-10.0,-70.0},{-10.0,-80.0},{-60.0,-80.0},{-60.0,-60.0},{-100.0,-60.0}}, color={0,0,255}));
        connect(spacePhasorS.spacePhasor,airGapS.spacePhasor_s) annotation(Line(visible=true, origin={10.0,15.0}, points={{0.0,5.0},{0.0,-5.0}}, color={0,0,255}));
        connect(spacePhasorS.ground,spacePhasorS.zero) annotation(Line(visible=true, points={{-10.0,20.0},{-10.0,14.0},{0.0,14.0},{0.0,20.0}}, color={0,0,255}));
        connect(lssigma.plug_n,spacePhasorS.plug_p) annotation(Line(visible=true, points={{10.0,60.0},{10.0,40.0}}, color={0,0,255}));
        connect(plug_sn,spacePhasorS.plug_n) annotation(Line(visible=true, points={{-60.0,100.0},{-60.0,60.0},{-10.0,60.0},{-10.0,40.0}}, color={0,0,255}));
        connect(airGapS.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapS.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{25.0,0.0},{25.0,-0.0},{60.0,0.0}}));
        connect(rs.plug_p,plug_sp) annotation(Line(visible=true, points={{60.0,60.0},{60.0,100.0}}, color={0,0,255}));
        connect(rr.plug_p,plug_rp) annotation(Line(visible=true, points={{60.0,-80.0},{60.0,-90.0},{-80.0,-90.0},{-80.0,60.0},{-100.0,60.0}}, color={0,0,255}));
        connect(Star1.pin_n,Ground1.p) annotation(Line(visible=true, points={{-40.0,-50.0},{-50.0,-50.0}}, color={0,0,255}));
        connect(rr.plug_n,lrsigma.plug_p) annotation(Line(visible=true, points={{40.0,-80.0},{30.0,-80.0}}, color={0,0,255}));
        connect(rs.plug_n,lssigma.plug_p) annotation(Line(visible=true, points={{40.0,60.0},{30.0,60.0}}, color={0,0,255}));
        connect(spacePhasorR.ground,spacePhasorR.zero) annotation(Line(visible=true, points={{-10.0,-20.0},{-10.0,-14.0},{-0.0,-14.0},{-0.0,-20.0}}, color={0,0,255}));
        connect(airGapS.spacePhasor_r,spacePhasorR.spacePhasor) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-20.0}}, color={0,0,255}));
      end AIM_SlipRing;

    end AsynchronousInductionMachines;

    package SynchronousInductionMachines "Models of synchronous induction machines"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains models of synchronous induction machines, based on space phasor theory:
<ul>
<li>SM_PermanentMagnetDamperCage: synchronous induction machine with permanent magnet excitation, with damper cage</li>
<li>SM_ElectricalExcitedDamperCage: synchronous induction machine with electrical excitation 
    and damper cage</li>
<li>SM_ReluctanceRotorDamperCage: induction machine with reluctance rotor and damper cage<br>
i.e. a squirrel cage rotor with magnetic poles due to different airgap width</li>
</ul>
These models use package SpacePhasors.
</p>
<p>
<b>Please keep in mind:</b><br>
<ul>
<li>We keep the same reference system as for motors, i.e.:<br>
    Positive RotorDisplacementAngle means acting as motor,<br>
    with positive electric power consumption and positive mechanical power output.
<li>ElectricalAngle = p * MechanicalAngle</li>
<li>real axis = d-axis<br>
    imaginary= q-axis</li>
<li>Voltage induced by the magnet wheel (d-axis) is located in the q-axis.</li>
</ul>
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.02  2004/09/19 Anton Haumer</li>
  <li> v1.03  2004/09/24 Anton Haumer<br>
       consistent naming of inductors and resistors in machine models</li>
  <li> v1.1   2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2   2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.3.2 2004/11/10 Anton Haumer<br>
       ReluctanceRotor moved to SynchronousMachines</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.52  2005/10/12 Anton Haumer<br>
       added SM_ElectricalExcited</li>
  <li> v1.53  2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  <li> v1.6.2 2005/10/23 Anton Haumer<br>
       selectable DamperCage for Synchronous Machines</li>
  <li> v1.7.1 2006/02/06 Anton Haumer<br>
       changed some naming of synchronous machines, not affecting existing models</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model SM_PermanentMagnetDamperCage "Permanent magnet synchronous induction machine"
        extends Interfaces.PartialBasicInductionMachine;
        parameter Modelica.SIunits.Frequency fNominal=50 "|Excitation|nominal frequency";
        parameter Modelica.SIunits.Voltage V0=112.3 "|Excitation|no-load RMS voltage per phase @ fNominal";
        parameter Modelica.SIunits.Resistance Rs=0.03 "|Nominal resistances and inductances|warm stator resistance per phase";
        parameter Modelica.SIunits.Inductance Lssigma=0.1/(2*pi*fNominal) "|Nominal resistances and inductances|stator stray inductance per phase";
        parameter Modelica.SIunits.Inductance Lmd=0.3/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in d-axis";
        parameter Modelica.SIunits.Inductance Lmq=0.3/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in q-axis";
        parameter Boolean DamperCage=true "damper cage is present?" annotation(Dialog(group="DamperCage"));
        parameter Modelica.SIunits.Inductance Lrsigma=0.05/(2*pi*fNominal) "damper stray inductance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Inductance Lrsigmaq=Lrsigma "damper stray inductance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rr=0.04 "warm damper resistance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rrq=Rr "warm damper resistance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        output Modelica.SIunits.Current i_0_s(stateSelect=StateSelect.default)=spacePhasorS.zero.i "stator zero-sequence current";
        output Modelica.SIunits.Current idq_ss[2]=airGapR.i_ss "stator space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)=airGapR.i_sr "stator space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current idq_dr[2](each stateSelect=StateSelect.prefer)=damperCage.spacePhasor_r.i_ if DamperCage "damper space phasor current / rotor fixed frame";
        Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m=m, final R=fill(Rs, m)) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(final m=m, final L=fill(Lssigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        annotation(defaultComponentName="SMPM", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={0,255,0}, fillPattern=FillPattern.Solid, extent={{-130.0,10.0},{-100.0,-10.0}}),Rectangle(visible=true, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-100.0,10.0},{-70.0,-10.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-134.0,34.0},{-66.0,-34.0}})}), Documentation(info="<HTML>
<p>
<b>Model of a three phase permanent magnet synchronous induction machine.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation and a rotor-fixed <i>AirGap</i> model. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed ccordinate system. Permanent magnet excitation is modelled by a constant equivalent excitation current feeding the d-axis. Only losses in stator and damper resistance are taken into account.
</p>
<p>
Whether a damper cage is present or not, can be selected with Boolean parameter DamperCage (default = true).
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>number of pole pairs p</td>
<td>2</td><td> </td>
</tr>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal frequency fNominal</td>
<td>50</td><td>Hz</td>
</tr>
<tr>
<td>nominal voltage per phase</td>
<td>100</td><td>V RMS</td>
</tr>
<tr>
<td>no-load voltage per phase</td>
<td>112.3</td><td>V RMS @ nominal speed</td>
</tr>
<tr>
<td>nominal current per phase</td>
<td>100</td><td>A RMS</td>
</tr>
<tr>
<td>nominal torque</td>
<td>181.4</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1500</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>28.5</td><td>kW</td>
</tr>
<tr>
<td>nominal rotor angle</td>
<td>20.75</td><td>degree</td>
</tr>
<tr>
<td>efficiency</td>
<td>95.0</td><td>%</td>
</tr>
<tr>
<td>power factor</td>
<td>0.98</td><td> </td>
</tr>
<tr>
<td>stator resistance</td>
<td>0.03</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>stator reactance Xd</td>
<td>0.4</td><td>Ohm per phase in d-axis</td>
</tr>
<tr>
<td>stator reactance Xq</td>
<td>0.4</td><td>Ohm per phase in q-axis</td>
</tr>
<tr>
<td>stator stray reactance Xss</td>
<td>0.1</td><td>Ohm per phase</td>
</tr>
<tr>
<td>damper resistance in d-axis</td>
<td>0.04</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>damper resistance in q-axis</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>damper stray reactance in d-axis XDds</td>
<td>0.05</td><td>Ohm</td>
</tr>
<tr>
<td>damper stray reactance in q-axis XDqs</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>These values give the following inductances:</td>
<td> </td><td> </td>
</tr>
<tr>
<td>main field inductance in d-axis</td>
<td>(Xd - Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance in q-axis</td>
<td>(Xq - Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>stator stray inductance per phase</td>
<td>Xss/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>damper stray inductance in d-axis</td>
<td>XDds/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>damper stray inductance in q-axis</td>
<td>XDqs/(2*pi*fNominal)</td><td> </td>
</tr>
</table>
</p>
</HTML>"));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapR airGapR(final p=p, final Lmd=Lmd, final Lmq=Lmq) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.BasicMachines.Components.DamperCage damperCage(final Lrsigma=Lrsigma, final Lrsigmaq=Lrsigmaq, final Rr=Rr, final Rrq=Rrq) if DamperCage annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.BasicMachines.Components.PermanentMagnet permanentMagnet(Ie=Ie) annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      protected 
        parameter Modelica.SIunits.Current Ie=sqrt(2)*V0/(Lmd*2*pi*fNominal) "equivalent excitation current";
      equation 
        connect(airGapR.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapR.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{25.0,0.0},{25.0,-0.0},{60.0,0.0}}));
        connect(spacePhasorS.plug_n,plug_sn) annotation(Line(visible=true, points={{-10.0,40.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_p,plug_sp) annotation(Line(visible=true, points={{60.0,60.0},{60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_n,lssigma.plug_p) annotation(Line(visible=true, points={{40.0,60.0},{30.0,60.0}}, color={0,0,255}));
        connect(lssigma.plug_n,spacePhasorS.plug_p) annotation(Line(visible=true, points={{10.0,60.0},{10.0,40.0}}, color={0,0,255}));
        connect(spacePhasorS.ground,spacePhasorS.zero) annotation(Line(visible=true, points={{-10.0,20.0},{-10.0,14.0},{-0.0,14.0},{0.0,20.0}}, color={0,0,255}));
        connect(spacePhasorS.spacePhasor,airGapR.spacePhasor_s) annotation(Line(visible=true, points={{10.0,20.0},{10.0,10.0}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r,damperCage.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-20.0}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r,permanentMagnet.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{20.0,-10.0},{20.0,-50.0},{10.0,-50.0}}, color={0,0,255}));
      end SM_PermanentMagnetDamperCage;

      model SM_ElectricalExcitedDamperCage "Electrical excited synchronous induction machine with damper cage"
        extends Interfaces.PartialBasicInductionMachine;
        parameter Modelica.SIunits.Resistance Rs=0.03 "|Nominal resistances and inductances|warm stator resistance per phase";
        parameter Modelica.SIunits.Inductance Lssigma=0.1/(2*pi*fNominal) "|Nominal resistances and inductances|stator stray inductance per phase";
        parameter Modelica.SIunits.Inductance Lmd=1.5/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in d-axis";
        parameter Modelica.SIunits.Inductance Lmq=1.5/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in q-axis";
        parameter Boolean DamperCage=true "damper cage is present?" annotation(Dialog(group="DamperCage"));
        parameter Modelica.SIunits.Inductance Lrsigma=0.05/(2*pi*fNominal) "damper stray inductance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Inductance Lrsigmaq=Lrsigma "damper stray inductance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rr=0.04 "warm damper resistance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rrq=Rr "warm damper resistance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Voltage VNominal=100 "|Excitation|nominal stator RMS voltage per phase";
        parameter Modelica.SIunits.Frequency fNominal=50 "|Excitation|nominal frequency";
        parameter Modelica.SIunits.Current Ie0=10 "|Excitation|no-load excitation current @ nominal voltage and frequency";
        parameter Modelica.SIunits.Resistance Re=2.5 "|Excitation|warm excitation resistance";
        parameter Real sigmae(min=0, max=1)=0.025 "|Excitation|stray fraction of total excitation inductance";
        output Modelica.SIunits.Current i_0_s(stateSelect=StateSelect.default)=spacePhasorS.zero.i "stator zero-sequence current";
        output Modelica.SIunits.Current idq_ss[2]=airGapR.i_ss "stator space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)=airGapR.i_sr "stator space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current idq_dr[2](each stateSelect=StateSelect.prefer)=damperCage.spacePhasor_r.i_ if DamperCage "damper space phasor current / rotor fixed frame";
        output Modelica.SIunits.Voltage ve=pin_ep.v - pin_en.v "excitation voltage";
        output Modelica.SIunits.Current ie=pin_ep.i "excitation current";
        Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m=m, final R=fill(Rs, m)) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(final m=m, final L=fill(Lssigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Resistor re(final R=Re) annotation(Placement(visible=true, transformation(origin={50.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-180)));
        Modelica.Electrical.Analog.Basic.Inductor lesigma(final L=Lesigma) annotation(Placement(visible=true, transformation(origin={20.0,-80.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ep annotation(Placement(visible=true, transformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_en annotation(Placement(visible=true, transformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0)));
        annotation(defaultComponentName="SMEE", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-134.0,34.0},{-66.0,-34.0}}),Line(visible=true, points={{-100.0,50.0},{-100.0,20.0},{-130.0,20.0},{-130.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-130.0,-4.0},{-129.0,1.0},{-125.0,5.0},{-120.0,6.0},{-115.0,5.0},{-111.0,1.0},{-110.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-110.0,-4.0},{-109.0,1.0},{-105.0,5.0},{-100.0,6.0},{-95.0,5.0},{-91.0,1.0},{-90.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-4.0},{-89.0,1.0},{-85.0,5.0},{-80.0,6.0},{-75.0,5.0},{-71.0,1.0},{-70.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-50.0},{-100.0,-20.0},{-70.0,-20.0},{-70.0,-2.0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
<b>Model of a three phase electrical excited synchronous induction machine with damper cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation and a rotor-fixed <i>AirGap</i> model. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed ccordinate system. Electrical excitation is modelled by converting excitation current and voltage to d-axis space phasors. Only losses in stator, damper and excitation resistance are taken into account.
</p>
<p>
Whether a damper cage is present or not, can be selected with Boolean parameter DamperCage (default = true).
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>number of pole pairs p</td>
<td>2</td><td> </td>
</tr>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal frequency fNominal</td>
<td>50</td><td>Hz</td>
</tr>
<tr>
<td>nominal voltage per phase</td>
<td>100</td><td>V RMS</td>
</tr>
<tr>
<td>no-load excitation current<br>
    @ nominal voltage and frequency</td>
<td>10</td><td>A DC</td>
</tr>
<tr>
<td>warm excitation resistance</td>
<td>2.5</td><td>Ohm</td>
</tr>
<tr>
<td>nominal current per phase</td>
<td>100</td><td>A RMS</td>
</tr>
<tr>
<td>nominal apparent power</td>
<td>-30000</td><td>VA</td>
</tr>
<tr>
<td>power factor</td>
<td>-1.0</td><td>ind./cap.</td>
</tr>
<tr>
<td>nominal excitation current</td>
<td>19</td><td>A</td>
</tr>
<tr>
<td>efficiency w/o excitation</td>
<td>97.1</td><td>%</td>
</tr>
<tr>
<td>nominal torque</td>
<td>-196.7</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1500</td><td>rpm</td>
</tr>
<tr>
<td>nominal rotor angle</td>
<td>-57.23</td><td>degree</td>
</tr>
<tr>
<td>stator resistance</td>
<td>0.03</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>stator reactance Xd</td>
<td>1.6</td><td>Ohm per phase in d-axis</td>
</tr>
<tr>
<td>giving Kc</td>
<td>0.625</td><td> </td>
</tr>
<tr>
<td>stator reactance Xq</td>
<td>1.6</td><td>Ohm per phase in q-axis</td>
</tr>
<tr>
<td>stator stray reactance Xss</td>
<td>0.1</td><td>Ohm per phase</td>
</tr>
<tr>
<td>damper resistance in d-axis</td>
<td>0.04</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>damper resistance in q-axis</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>damper stray reactance in d-axis XDds</td>
<td>0.1</td><td>Ohm</td>
</tr>
<tr>
<td>damper stray reactance in q-axis XDqs</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>excitation stray inductance</td>
<td>2.5</td><td>% of total excitation inductance</td>
</tr>
<tr>
<td>These values give the following inductances:</td>
<td> </td><td> </td>
</tr>
<tr>
<td>main field inductance in d-axis</td>
<td>(Xd - Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance in q-axis</td>
<td>(Xq - Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>stator stray inductance per phase</td>
<td>Xss/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>damper stray inductance in d-axis</td>
<td>XDds/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>damper stray inductance in q-axis</td>
<td>XDqs/(2*pi*fNominal)</td><td> </td>
</tr>
</table>
</p>
</HTML>"));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapR airGapR(final p=p, final Lmd=Lmd, final Lmq=Lmq) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.BasicMachines.Components.DamperCage damperCage(final Lrsigma=Lrsigma, final Lrsigmaq=Lrsigmaq, final Rr=Rr, final Rrq=Rrq) if DamperCage annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-450)));
        Modelica.Electrical.Machines.BasicMachines.Components.ElectricalExcitation electricalExcitation(final TurnsRatio=TurnsRatio) annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
      protected 
        parameter Real TurnsRatio=sqrt(2)*VNominal/(2*pi*fNominal*Lmd*Ie0) "stator current / excitation current";
        parameter Modelica.SIunits.Inductance Lesigma=Lmd*TurnsRatio^2*sigmae/(1 - sigmae);
      equation 
        connect(airGapR.spacePhasor_r,damperCage.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-20.0}}, color={0,0,255}));
        connect(airGapR.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapR.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{25.0,0.0},{25.0,-0.0},{60.0,0.0}}));
        connect(spacePhasorS.plug_n,plug_sn) annotation(Line(visible=true, points={{-10.0,40.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_p,plug_sp) annotation(Line(visible=true, points={{60.0,60.0},{60.0,100.0}}, color={0,0,255}));
        connect(lesigma.p,re.n) annotation(Line(visible=true, points={{30.0,-80.0},{40.0,-80.0}}, color={0,0,255}));
        connect(pin_ep,re.p) annotation(Line(visible=true, points={{-100.0,60.0},{-80.0,60.0},{-80.0,-90.0},{60.0,-90.0},{60.0,-80.0}}, color={0,0,255}));
        connect(rs.plug_n,lssigma.plug_p) annotation(Line(visible=true, points={{40.0,60.0},{30.0,60.0}}, color={0,0,255}));
        connect(lssigma.plug_n,spacePhasorS.plug_p) annotation(Line(visible=true, points={{10.0,60.0},{10.0,40.0}}, color={0,0,255}));
        connect(spacePhasorS.ground,spacePhasorS.zero) annotation(Line(visible=true, points={{-10.0,20.0},{-10.0,14.0},{-0.0,14.0},{0.0,20.0}}, color={0,0,255}));
        connect(spacePhasorS.spacePhasor,airGapR.spacePhasor_s) annotation(Line(visible=true, points={{10.0,20.0},{10.0,10.0}}, color={0,0,255}));
        connect(electricalExcitation.pin_en,pin_en) annotation(Line(visible=true, points={{-10.0,-70.0},{-70.0,-70.0},{-70.0,-60.0},{-100.0,-60.0}}, color={0,0,255}));
        connect(lesigma.n,electricalExcitation.pin_ep) annotation(Line(visible=true, points={{10.0,-80.0},{10.0,-70.0}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r,electricalExcitation.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{20.0,-10.0},{20.0,-50.0},{10.0,-50.0}}, color={0,0,255}));
      end SM_ElectricalExcitedDamperCage;

      model SM_ReluctanceRotorDamperCage "Synchronous induction machine with reluctance rotor and damper cage"
        extends Interfaces.PartialBasicInductionMachine;
        constant Modelica.SIunits.Frequency fNominal=50 "nominal frequency";
        parameter Modelica.SIunits.Resistance Rs=0.03 "|Nominal resistances and inductances|warm stator resistance per phase";
        parameter Modelica.SIunits.Inductance Lssigma=0.1/(2*pi*fNominal) "|Nominal resistances and inductances|stator stray inductance per phase";
        parameter Modelica.SIunits.Inductance Lmd=2.9/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in d-axis";
        parameter Modelica.SIunits.Inductance Lmq=0.9/(2*pi*fNominal) "|Nominal resistances and inductances|main field inductance in q-axis";
        parameter Boolean DamperCage=true "damper cage is present?" annotation(Dialog(group="DamperCage"));
        parameter Modelica.SIunits.Inductance Lrsigma=0.05/(2*pi*fNominal) "damper stray inductance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Inductance Lrsigmaq=Lrsigma "damper stray inductance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rr=0.04 "warm damper resistance in d-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        parameter Modelica.SIunits.Resistance Rrq=Rr "warm damper resistance in q-axis" annotation(Dialog(group="DamperCage", enable=DamperCage));
        output Modelica.SIunits.Current i_0_s(stateSelect=StateSelect.default)=spacePhasorS.zero.i "stator zero-sequence current";
        output Modelica.SIunits.Current idq_ss[2]=airGapR.i_ss "stator space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_sr[2](each stateSelect=StateSelect.prefer)=airGapR.i_sr "stator space phasor current / rotor fixed frame";
        output Modelica.SIunits.Current idq_rs[2]=airGapR.i_rs if DamperCage "rotor space phasor current / stator fixed frame";
        output Modelica.SIunits.Current idq_rr[2](each stateSelect=StateSelect.prefer)=airGapR.i_rr if DamperCage "rotor space phasor current / rotor fixed frame";
        Modelica.Electrical.MultiPhase.Basic.Resistor rs(final m=m, final R=fill(Rs, m)) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Basic.Inductor lssigma(final m=m, final L=fill(Lssigma, m)) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        annotation(defaultComponentName="SMR", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-130.0,10.0},{-100.0,-10.0}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,10.0},{-70.0,-10.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-134.0,34.0},{-66.0,-34.0}})}), Documentation(info="<HTML>
<p>
<b>Model of a three phase synchronous induction machine with reluctance rotor and damper cage.</b><br>
Resistance and stray inductance of stator is modeled directly in stator phases, then using space phasor transformation. Resistance and stray inductance of rotor's squirrel cage is modeled in two axis of the rotor-fixed ccordinate system. Both together connected via a rotor-fixed <i>AirGap</i> model. Only losses in stator and rotor resistance are taken into account.
</p>
<p>
Whether a damper cage is present or not, can be selected with Boolean parameter DamperCage (default = true).
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>number of pole pairs p</td>
<td>2</td><td> </td>
</tr>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal frequency fNominal</td>
<td>50</td><td>Hz</td>
</tr>
<tr>
<td>nominal voltage per phase</td>
<td>100</td><td>V RMS</td>
</tr>
<tr>
<td>nominal current per phase</td>
<td>50</td><td>A RMS</td>
</tr>
<tr>
<td>nominal torque</td>
<td> 46</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1500</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td> 7.23</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>96.98</td><td>%</td>
</tr>
<tr>
<td>power factor</td>
<td>0.497</td><td> </td>
</tr>
<tr>
<td>stator resistance</td>
<td>0.03</td><td>Ohm per phase in warm condition</td>
</tr>
<tr>
<td>rotor resistance in d-axis</td>
<td>0.04</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>rotor resistance in q-axis</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>stator reactance Xsd in d-axis</td>
<td>3</td><td>Ohm per phase</td>
</tr>
<tr>
<td>stator reactance Xsq in q-axis</td>
<td>1</td><td>Ohm</td>
</tr>
<tr>
<td>stator stray reactance Xss</td>
<td>0.1</td><td>Ohm per phase</td>
</tr>
<tr>
<td>rotor stray reactance in d-axis Xrds</td>
<td>0.1</td><td>Ohm per phase</td>
</tr>
<tr>
<td>rotor stray reactance in q-axis Xrqs</td>
<td>same as d-axis</td><td> </td>
</tr>
<tr>
<td>These values give the following inductances:</td>
<td> </td><td> </td>
</tr>
<tr>
<td>stator stray inductance per phase</td>
<td>Xss/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>rotor stray inductance in d-axis</td>
<td>Xrds/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>rotor stray inductance in q-axis</td>
<td>Xrqs/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance per phase in d-axis</td>
<td>(Xsd-Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
<tr>
<td>main field inductance per phase in q-axis</td>
<td>(Xsq-Xss)/(2*pi*fNominal)</td><td> </td>
</tr>
</table>
</p>
</HTML>"));
        Modelica.Electrical.Machines.SpacePhasors.Components.SpacePhasor spacePhasorS annotation(Placement(visible=true, transformation(origin={0.0,30.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-270)));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapR airGapR(final p=p, final Lmd=Lmd, final Lmq=Lmq) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Modelica.Electrical.Machines.BasicMachines.Components.DamperCage damperCage(final Lrsigma=Lrsigma, final Lrsigmaq=Lrsigmaq, final Rr=Rr, final Rrq=Rrq) if DamperCage annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      equation 
        connect(airGapR.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-50.0,-0.0},{-50.0,0.0},{-90.0,0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapR.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{25.0,0.0},{25.0,-0.0},{60.0,0.0}}));
        connect(spacePhasorS.plug_n,plug_sn) annotation(Line(visible=true, points={{-10.0,40.0},{-12.0,40.0},{-12.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_p,plug_sp) annotation(Line(visible=true, points={{60.0,60.0},{60.0,100.0}}, color={0,0,255}));
        connect(rs.plug_n,lssigma.plug_p) annotation(Line(visible=true, points={{40.0,60.0},{30.0,60.0}}, color={0,0,255}));
        connect(lssigma.plug_n,spacePhasorS.plug_p) annotation(Line(visible=true, points={{10.0,60.0},{10.0,40.0}}, color={0,0,255}));
        connect(spacePhasorS.ground,spacePhasorS.zero) annotation(Line(visible=true, points={{-10.0,20.0},{-10.0,14.0},{-0.0,14.0},{0.0,20.0}}, color={0,0,255}));
        connect(spacePhasorS.spacePhasor,airGapR.spacePhasor_s) annotation(Line(visible=true, points={{10.0,20.0},{10.0,10.0},{10.0,10.0}}, color={0,0,255}));
        connect(airGapR.spacePhasor_r,damperCage.spacePhasor_r) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-20.0}}, color={0,0,255}));
      end SM_ReluctanceRotorDamperCage;

    end SynchronousInductionMachines;

    package DCMachines "Models of DC machines"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains models of DC machines:
<ul>
<li>DC_PermanentMagnet: DC machine with permanent magnet excitation</li>
<li>DC_ElectricalExcited: DC machine with electrical shunt or separate excitation</li>
<li>DC_SeriesExcited: DC machine with series excitation</li>
</ul>
</p>

</HTML>
", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.02 2004/09/19 Anton Haumer</li>
  <li> v1.03 2004/09/24 Anton Haumer<br>
       added DC machine with series excitation</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed naming and structure<br>
       issued to Modelica Standard Library 2.1</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model DC_PermanentMagnet "Permanent magnet DC machine"
        extends Interfaces.PartialBasicDCMachine;
        parameter Modelica.SIunits.Voltage VaNominal=100 "|Nominal parameters|nominal armature voltage";
        parameter Modelica.SIunits.Current IaNominal=100 "|Nominal parameters|nominal armature current";
        parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmNominal=1425 "|Nominal parameters|nominal speed";
        parameter Modelica.SIunits.Resistance Ra=0.05 "|Nominal resistances and inductances|warm armature resistance";
        parameter Modelica.SIunits.Inductance La=0.0015 "|Nominal resistances and inductances|armature inductance";
        Modelica.Electrical.Analog.Basic.Resistor ra(final R=Ra) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Inductor la(final L=La) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Ground eGround annotation(Placement(visible=true, transformation(origin={-10.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(defaultComponentName="DCPM", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={0,255,0}, fillPattern=FillPattern.Solid, extent={{-130.0,10.0},{-100.0,-10.0}}),Rectangle(visible=true, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-100.0,10.0},{-70.0,-10.0}})}), Documentation(info="<HTML>
<p>
<b>Model of a DC Machine with Permanent magnet.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model. Permanent magnet excitation is modelled by a constant equivalent excitation current feeding AirGapDC. Only losses in armature resistance are taken into account. No saturation is modelled.
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.15</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal armature voltage</td>
<td>100</td><td>V</td>
</tr>
<tr>
<td>nominal armature current</td>
<td>100</td><td>A</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1425</td><td>rpm</td>
</tr>
<tr>
<td>nominal torque</td>
<td>63.66</td><td>Nm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>9.5</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>95.0</td><td>%</td>
</tr>
<tr>
<td>armature resistance</td>
<td>0.05</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>armature inductance</td>
<td>0.0015</td><td>H</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and compensation windig, if present.
</p>
</HTML>"));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapDC airGapDC(final Le=Le, final TurnsRatio=TurnsRatio) annotation(Placement(visible=true, transformation(origin={-0.0,-0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-450)));
        Modelica.Electrical.Analog.Sources.ConstantCurrent ie(I=IeNominal) annotation(Placement(visible=true, transformation(origin={10.0,-40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-270)));
      protected 
        constant Modelica.SIunits.Current IeNominal=1 "equivalent excitation current";
        constant Modelica.SIunits.Inductance Le=1 "arbitrary excitation inductance";
        parameter Real TurnsRatio=(VaNominal - Ra*IaNominal)/(Modelica.SIunits.Conversions.from_rpm(rpmNominal)*Le*IeNominal) "Ratio of armature turns over number of turns of the excitation winding";
      equation 
        connect(airGapDC.pin_ep,ie.n) annotation(Line(visible=true, points={{10.0,-10.0},{10.0,-30.0}}, color={0,0,255}));
        connect(airGapDC.pin_en,eGround.p) annotation(Line(visible=true, points={{-10.0,-10.0},{-10.0,-50.0}}, color={0,0,255}));
        connect(la.n,airGapDC.pin_ap) annotation(Line(visible=true, points={{10.0,60.0},{10.0,10.0}}, color={0,0,255}));
        connect(airGapDC.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{24.0,0.0},{24.0,0.0},{60.0,0.0}}));
        connect(airGapDC.support,internalSupport) annotation(Line(visible=true, points={{-10.0,-0.0},{-90.0,0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapDC.pin_an,pin_an) annotation(Line(visible=true, points={{-10.0,10.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(pin_ap,ra.p) annotation(Line(visible=true, points={{60.0,100.0},{60.0,60.0}}, color={0,0,255}));
        connect(la.p,ra.n) annotation(Line(visible=true, points={{30.0,60.0},{40.0,60.0}}, color={0,0,255}));
        connect(eGround.p,ie.p) annotation(Line(visible=true, points={{-10.0,-50.0},{10.0,-50.0}}, color={0,0,255}));
        assert(VaNominal > Ra*IaNominal, "VaNominal has to be > (Ra+Re)*IaNominal");
      end DC_PermanentMagnet;

      model DC_ElectricalExcited "Electrical shunt/separate excited linear DC machine"
        extends Machines.Interfaces.PartialBasicDCMachine;
        parameter Modelica.SIunits.Voltage VaNominal=100 "|Nominal parameters|nominal armature voltage";
        parameter Modelica.SIunits.Current IaNominal=100 "|Nominal parameters|nominal armature current";
        parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmNominal=1425 "|Nominal parameters|nominal speed";
        parameter Modelica.SIunits.Resistance Ra=0.05 "|Nominal resistances and inductances|warm armature resistance";
        parameter Modelica.SIunits.Inductance La=0.0015 "|Nominal resistances and inductances|armature inductance";
        parameter Modelica.SIunits.Current IeNominal=1 "|Excitation|nominal excitation current";
        parameter Modelica.SIunits.Resistance Re=100 "|Excitation|warm field excitation resistance";
        parameter Modelica.SIunits.Inductance Le=1 "|Excitation|total field excitation inductance";
        output Modelica.SIunits.Voltage ve=pin_ep.v - pin_en.v "Field excitation voltage";
        output Modelica.SIunits.Current ie=pin_ep.i "Field excitation current";
        Modelica.Electrical.Analog.Basic.Resistor ra(final R=Ra) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Inductor la(final L=La) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Resistor re(final R=Re) annotation(Placement(visible=true, transformation(origin={-50.0,-40.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-180)));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ep annotation(Placement(visible=true, transformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_en annotation(Placement(visible=true, transformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0)));
        annotation(defaultComponentName="DCEE", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-130.0,-4.0},{-129.0,1.0},{-125.0,5.0},{-120.0,6.0},{-115.0,5.0},{-111.0,1.0},{-110.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-110.0,-4.0},{-109.0,1.0},{-105.0,5.0},{-100.0,6.0},{-95.0,5.0},{-91.0,1.0},{-90.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-4.0},{-89.0,1.0},{-85.0,5.0},{-80.0,6.0},{-75.0,5.0},{-71.0,1.0},{-70.0,-4.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-50.0},{-100.0,-20.0},{-70.0,-20.0},{-70.0,-2.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,50.0},{-100.0,20.0},{-130.0,20.0},{-130.0,-4.0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
<b>Model of a DC Machine with Electrical shunt or separate excitation.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model.<br>
Only losses in armature and excitation resistance are taken into account. No saturation is modelled.<br>
Shunt or separate excitation is defined by the user's external circuit.
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.15</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal armature voltage</td>
<td>100</td><td>V</td>
</tr>
<tr>
<td>nominal armature current</td>
<td>100</td><td>A</td>
</tr>
<tr>
<td>nominal torque</td>
<td>63.66</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1425</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>9.5</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>95.0</td><td>% only armature</td>
</tr>
<tr>
<td>efficiency</td>
<td>94.06</td><td>% including excitation</td>
</tr>
<tr>
<td>armature resistance</td>
<td>0.05</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>aramture inductance</td>
<td>0.0015</td><td>H</td>
</tr>
<tr>
<td>nominal excitation voltage</td>
<td>100</td><td>V</td>
</tr>
<tr>
<td>nominal excitation current</td>
<td>1</td><td>A</td>
</tr>
<tr>
<td>excitation resistance</td>
<td>100</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>excitation inductance</td>
<td>1</td><td>H</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and 
compensation windig, if present.<br>
Armature current does not cover excitation current of a shunt excitation; in this case total current drawn from the grid = armature current + excitation current.
</p>
</HTML>"));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapDC airGapDC(final Le=Le, final TurnsRatio=TurnsRatio) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      protected 
        parameter Real TurnsRatio=(VaNominal - Ra*IaNominal)/(Modelica.SIunits.Conversions.from_rpm(rpmNominal)*Le*IeNominal) "Ratio of armature turns over number of turns of the excitation winding";
      equation 
        connect(airGapDC.pin_an,pin_an) annotation(Line(visible=true, points={{-10.0,10.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(pin_ap,ra.p) annotation(Line(visible=true, points={{60.0,100.0},{60.0,60.0}}, color={0,0,255}));
        connect(airGapDC.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapDC.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{26.0,0.0},{26.0,-0.0},{60.0,0.0}}));
        connect(re.p,pin_ep) annotation(Line(visible=true, points={{-60.0,-40.0},{-80.0,-40.0},{-80.0,60.0},{-100.0,60.0}}, color={0,0,255}));
        connect(la.p,ra.n) annotation(Line(visible=true, points={{30.0,60.0},{40.0,60.0}}, color={0,0,255}));
        connect(la.n,airGapDC.pin_ap) annotation(Line(visible=true, points={{10.0,60.0},{10.0,10.0}}, color={0,0,255}));
        connect(re.n,airGapDC.pin_ep) annotation(Line(visible=true, points={{-40.0,-40.0},{10.0,-40.0},{10.0,-10.0}}, color={0,0,255}));
        connect(airGapDC.pin_en,pin_en) annotation(Line(visible=true, points={{-10.0,-10.0},{-10.0,-60.0},{-100.0,-60.0}}, color={0,0,255}));
        assert(VaNominal > Ra*IaNominal, "VaNominal has to be > (Ra+Re)*IaNominal");
      end DC_ElectricalExcited;

      model DC_SeriesExcited "Series excited linear DC machine"
        extends Machines.Interfaces.PartialBasicDCMachine;
        parameter Modelica.SIunits.Voltage VaNominal=100 "|Nominal parameters|nominal armature voltage";
        parameter Modelica.SIunits.Current IaNominal=100 "|Nominal parameters|nominal armature current";
        parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpmNominal=1402.5 "|Nominal parameters|nominal speed";
        parameter Modelica.SIunits.Resistance Ra=0.05 "|Nominal resistances and inductances|warm armature resistance";
        parameter Modelica.SIunits.Inductance La=0.0015 "|Nominal resistances and inductances|armature inductance";
        parameter Modelica.SIunits.Resistance Re=0.01 "|Excitation|warm field excitation resistance";
        parameter Modelica.SIunits.Inductance Le=0.0005 "|Excitation|total field excitation inductance";
        output Modelica.SIunits.Voltage ve=pin_ep.v - pin_en.v "Field excitation voltage";
        output Modelica.SIunits.Current ie=pin_ep.i "Field excitation current";
        Modelica.Electrical.Analog.Basic.Resistor ra(final R=Ra) annotation(Placement(visible=true, transformation(origin={50.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Inductor la(final L=La) annotation(Placement(visible=true, transformation(origin={20.0,60.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Resistor re(final R=Re) annotation(Placement(visible=true, transformation(origin={-50.0,-40.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=-180)));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ep annotation(Placement(visible=true, transformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,60.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_en annotation(Placement(visible=true, transformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,-60.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=0)));
        annotation(defaultComponentName="DCSE", Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100.0,-10.0},{-105.0,-9.0},{-109.0,-5.0},{-110.0,0.0},{-109.0,5.0},{-105.0,9.0},{-100.0,10.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-30.0},{-105.0,-29.0},{-109.0,-25.0},{-110.0,-20.0},{-109.0,-15.0},{-105.0,-11.0},{-100.0,-10.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,10.0},{-105.0,11.0},{-109.0,15.0},{-110.0,20.0},{-109.0,25.0},{-105.0,29.0},{-100.0,30.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,50.0},{-100.0,30.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-30.0},{-100.0,-50.0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
<b>Model of a DC Machine with Series excitation.</b><br>
Armature resistance and inductance are modeled directly after the armature pins, then using a <i>AirGapDC</i> model.<br>
Only losses in armature and excitation resistance are taken into account. No saturation is modelled.<br>
Series excitation has to be connected by the user's external circuit.
</p>
<p>
<b>Default values for machine's parameters (a realistic example) are:</b><br>
<table>
<tr>
<td>stator's moment of inertia</td>
<td>0.29</td><td>kg.m2</td>
</tr>
<tr>
<td>rotor's moment of inertia</td>
<td>0.15</td><td>kg.m2</td>
</tr>
<tr>
<td>nominal armature voltage</td>
<td>100</td><td>V</td>
</tr>
<tr>
<td>nominal armature current</td>
<td>100</td><td>A</td>
</tr>
<tr>
<td>nominal torque</td>
<td>63.66</td><td>Nm</td>
</tr>
<tr>
<td>nominal speed</td>
<td>1410</td><td>rpm</td>
</tr>
<tr>
<td>nominal mechanical output</td>
<td>9.4</td><td>kW</td>
</tr>
<tr>
<td>efficiency</td>
<td>94.0</td><td>% only armature</td>
</tr>
<tr>
<td>armature resistance</td>
<td>0.05</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>aramture inductance</td>
<td>0.0015</td><td>H</td>
</tr>
<tr>
<td>excitation resistance</td>
<td>0.01</td><td>Ohm in warm condition</td>
</tr>
<tr>
<td>excitation inductance</td>
<td>0.0005</td><td>H</td>
</tr>
</table>
Armature resistance resp. inductance include resistance resp. inductance of commutating pole winding and 
compensation windig, if present.<br>
Parameter nominal armature voltage includes voltage drop of series excitation;<br>
but for output the voltage is splitted into:<br>
va = armature voltage without voltage drop of series excitation<br>
ve = voltage drop of series excitation
</p>
</HTML>"));
        Modelica.Electrical.Machines.BasicMachines.Components.AirGapDC airGapDC(final Le=Le, final TurnsRatio=TurnsRatio) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      protected 
        parameter Real TurnsRatio=(VaNominal - (Ra + Re)*IaNominal)/(Modelica.SIunits.Conversions.from_rpm(rpmNominal)*Le*IaNominal) "Ratio of armature turns over number of turns of the excitation winding";
      equation 
        connect(airGapDC.pin_an,pin_an) annotation(Line(visible=true, points={{-10.0,10.0},{-10.0,60.0},{-60.0,60.0},{-60.0,100.0}}, color={0,0,255}));
        connect(pin_ap,ra.p) annotation(Line(visible=true, points={{60.0,100.0},{60.0,60.0}}, color={0,0,255}));
        connect(airGapDC.support,internalSupport) annotation(Line(visible=true, points={{-10.0,0.0},{-90.0,-0.0},{-90.0,-100.0},{20.0,-100.0}}));
        connect(airGapDC.flange_a,inertiaRotor.flange_a) annotation(Line(visible=true, points={{10.0,0.0},{25.0,0.0},{25.0,-0.0},{60.0,0.0}}));
        connect(re.p,pin_ep) annotation(Line(visible=true, points={{-60.0,-40.0},{-80.0,-40.0},{-80.0,60.0},{-100.0,60.0}}, color={0,0,255}));
        connect(la.p,ra.n) annotation(Line(visible=true, points={{30.0,60.0},{40.0,60.0}}, color={0,0,255}));
        connect(la.n,airGapDC.pin_ap) annotation(Line(visible=true, points={{10.0,60.0},{10.0,10.0}}, color={0,0,255}));
        connect(re.n,airGapDC.pin_ep) annotation(Line(visible=true, points={{-40.0,-40.0},{10.0,-40.0},{10.0,-10.0}}, color={0,0,255}));
        connect(airGapDC.pin_en,pin_en) annotation(Line(visible=true, points={{-10.0,-10.0},{-10.0,-60.0},{-100.0,-60.0}}, color={0,0,255}));
        assert(VaNominal > (Ra + Re)*IaNominal, "VaNominal has to be > (Ra+Re)*IaNominal");
      end DC_SeriesExcited;

    end DCMachines;

    package Components "Machine components like AirGaps"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains components for modeling electrical machines, specially threephase induction machines, based on space phasor theory:
<ul>
<li>AirGapS: model of an airgap whose coordinate system is fixed to the stator</li>
<li>AirGapR: model of an airgap whose coordinate system is fixed to the rotor</li>
<li>SquirrelCage: model of a squirrel cage rotor</li>
<li>PermanentMagnet: model of a permanent magnet excitation</li>
<li>ElectricalExcitation: model of an electrical excitation (converting excitation to space phasor)</li>
<li>AirGapDC: model of an airgap of DC machines</li>
</ul>
These models use package SpacePhasors.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added AirGapDC models</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.52 2005/10/12 Anton Haumer<br>
       added electrical excitation</li>
  <li> v1.53 Beta 2005/10/14 Anton Haumer<br>
       introduced unsymmetrical DamperCage for Synchronous Machines</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model AirGapS "Airgap in stator-fixed coordinate system"
        constant Integer m=3 "number of phases";
        parameter Integer p(min=1) "number of pole pairs";
        parameter Modelica.SIunits.Inductance Lm "main field inductance";
        output Modelica.SIunits.Torque tau_electrical;
        Modelica.SIunits.Angle gamma "Rotor displacement angle";
        Modelica.SIunits.Current i_ss[2] "Stator current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.Current i_sr[2] "Stator current space phasor with respect to the rotor fixed frame";
        Modelica.SIunits.Current i_rs[2] "Rotor current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.Current i_rr[2] "Rotor current space phasor with respect to the rotor fixed frame";
        Modelica.SIunits.Current i_ms[2] "Magnetizing current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.MagneticFlux psi_ms[2] "Magnetizing flux phasor with respect to the stator fixed frame";
        Modelica.SIunits.MagneticFlux psi_mr[2] "Magnetizing flux phasor with respect to the rotor fixed frame";
        Real RotationMatrix[2,2] "matrix of rotation from rotor to stator";
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a support "support at which the reaction torque is acting" annotation(Placement(visible=true, transformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_s annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90.0,90.0},{90.0,-92.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-80.0,80.0},{80.0,-80.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.VerticalCylinder, extent={{-10.0,90.0},{10.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-40.0},{0.0,40.0}}, textString="S", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Model of the airgap in stator-fixed coordinate system, using only equations.
</p>
</HTML>"));
      protected 
        parameter Modelica.SIunits.Inductance L[2,2]={{Lm,0},{0,Lm}} "inductance matrix";
      equation 
        gamma=p*(flange_a.phi - support.phi);
        RotationMatrix={{+cos(gamma),-sin(gamma)},{+sin(gamma),+cos(gamma)}};
        i_ss=spacePhasor_s.i_;
        i_ss=RotationMatrix*i_sr;
        i_rr=spacePhasor_r.i_;
        i_rs=RotationMatrix*i_rr;
        i_ms=i_ss + i_rs;
        psi_ms=L*i_ms;
        psi_mr=transpose(RotationMatrix)*psi_ms;
        spacePhasor_s.v_=der(psi_ms);
        spacePhasor_r.v_=der(psi_mr);
        tau_electrical=m/2*p*(spacePhasor_s.i_[2]*psi_ms[1] - spacePhasor_s.i_[1]*psi_ms[2]);
        flange_a.tau=-tau_electrical;
        support.tau=tau_electrical;
      end AirGapS;

      model AirGapR "Airgap in rotor-fixed coordinate system"
        constant Integer m=3 "number of phases";
        parameter Integer p(min=1) "number of pole pairs";
        parameter Modelica.SIunits.Inductance Lmd "main field inductance d-axis";
        parameter Modelica.SIunits.Inductance Lmq "main field inductance q-axis";
        output Modelica.SIunits.Torque tau_electrical;
        Modelica.SIunits.Angle gamma "Rotor displacement angle";
        Modelica.SIunits.Current i_ss[2] "Stator current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.Current i_sr[2] "Stator current space phasor with respect to the rotor fixed frame";
        Modelica.SIunits.Current i_rs[2] "Rotor current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.Current i_rr[2] "Rotor current space phasor with respect to the rotor fixed frame";
        Modelica.SIunits.Current i_mr[2] "Magnetizing current space phasor with respect to the stator fixed frame";
        Modelica.SIunits.MagneticFlux psi_ms[2] "Magnetizing flux phasor with respect to the stator fixed frame";
        Modelica.SIunits.MagneticFlux psi_mr[2] "Magnetizing flux phasor with respect to the rotor fixed frame";
        Real RotationMatrix[2,2] "matrix of rotation from rotor to stator";
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a support "support at which the reaction torque is acting" annotation(Placement(visible=true, transformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_s annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90.0,90.0},{90.0,-92.0}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,80.0},{80.0,-80.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.VerticalCylinder, extent={{-10.0,90.0},{10.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{0.0,-40.0},{80.0,40.0}}, textString="R", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Model of the airgap in rotor-fixed coordinate system, using only equations.
</p>
</HTML>"));
      protected 
        parameter Modelica.SIunits.Inductance L[2,2]={{Lmd,0},{0,Lmq}} "inductance matrix";
      equation 
        gamma=p*(flange_a.phi - support.phi);
        RotationMatrix={{+cos(gamma),-sin(gamma)},{+sin(gamma),+cos(gamma)}};
        i_ss=spacePhasor_s.i_;
        i_ss=RotationMatrix*i_sr;
        i_rr=spacePhasor_r.i_;
        i_rs=RotationMatrix*i_rr;
        i_mr=i_sr + i_rr;
        psi_mr=L*i_mr;
        psi_ms=RotationMatrix*psi_mr;
        spacePhasor_s.v_=der(psi_ms);
        spacePhasor_r.v_=der(psi_mr);
        tau_electrical=m/2*p*(spacePhasor_s.i_[2]*psi_ms[1] - spacePhasor_s.i_[1]*psi_ms[2]);
        flange_a.tau=-tau_electrical;
        support.tau=tau_electrical;
      end AirGapR;

      model SquirrelCage "Squirrel Cage"
        parameter Modelica.SIunits.Inductance Lrsigma "rotor stray inductance per phase translated to stator";
        parameter Modelica.SIunits.Resistance Rr "warm rotor resistance per phase translated to stator";
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60.0,45.0},{-30.0,75.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30.0,45.0},{0.0,75.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{0.0,45.0},{30.0,75.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{30.0,45.0},{60.0,75.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60.0,30.0},{60.0,60.0}}),Line(visible=true, points={{-100.0,60.0},{-60.0,60.0}}, color={0,0,255}),Line(visible=true, points={{60.0,60.0},{80.0,60.0},{80.0,40.0}}, color={0,0,255}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{60.0,40.0},{100.0,-40.0}}),Line(visible=true, points={{80.0,-40.0},{80.0,-60.0}}, color={0,0,255}),Line(visible=true, points={{60.0,-60.0},{100.0,-60.0}}, color={0,0,255}),Line(visible=true, points={{70.0,-80.0},{90.0,-80.0}}, color={0,0,255}),Line(visible=true, points={{66.0,-70.0},{94.0,-70.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-100.0,90.0},{-100.0,60.0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of a squirrel cage / damper cage in two axis.
</p>
</HTML>"));
      equation 
        spacePhasor_r.v_=Rr*spacePhasor_r.i_ + Lrsigma*der(spacePhasor_r.i_);
      end SquirrelCage;

      model DamperCage "Squirrel Cage"
        parameter Modelica.SIunits.Inductance Lrsigma "stray inductance in d-axis per phase translated to stator";
        parameter Modelica.SIunits.Inductance Lrsigmaq "stray inductance in q-axis per phase translated to stator";
        parameter Modelica.SIunits.Resistance Rr "warm resistance in d-axis per phase translated to stator";
        parameter Modelica.SIunits.Resistance Rrq "warm resistance in q-axis per phase translated to stator";
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{60.0,60.0},{100.0,60.0}}, color={0,0,255}),Line(visible=true, points={{70.0,40.0},{90.0,40.0}}, color={0,0,255}),Line(visible=true, points={{66.0,50.0},{94.0,50.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, extent={{-60.0,90.0},{-40.0,70.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-40.0,90.0},{-20.0,70.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-20.0,90.0},{0.0,70.0}}),Line(visible=true, points={{-80.0,0.0},{-80.0,-20.0}}, color={0,0,255}),Rectangle(visible=true, lineColor={0,0,255}, extent={{20.0,90.0},{60.0,70.0}}),Line(visible=true, points={{60.0,80.0},{80.0,80.0},{80.0,60.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,90.0},{-100.0,80.0},{-60.0,80.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,90.0},{-100.0,80.0},{-80.0,80.0},{-80.0,60.0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-90.0,60.0},{-70.0,40.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-90.0,40.0},{-70.0,20.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-90.0,20.0},{-70.0,0.0}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,0.0},{-70.0,60.0}}),Line(visible=true, points={{0.0,80.0},{20.0,80.0}}, color={0,0,255}),Rectangle(visible=true, lineColor={0,0,255}, extent={{-90.0,-20.0},{-70.0,-60.0}}),Line(visible=true, points={{-100.0,-80.0},{-60.0,-80.0}}, color={0,0,255}),Line(visible=true, points={{-90.0,-100.0},{-70.0,-100.0}}, color={0,0,255}),Line(visible=true, points={{-94.0,-90.0},{-66.0,-90.0}}, color={0,0,255}),Line(visible=true, points={{-80.0,-60.0},{-80.0,-80.0}}, color={0,0,255}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{0.0,70.0},{-60.0,80.0}})}), Documentation(info="<HTML>
<p>
Model of an unsymmetrical damper cage cage in two axis.
</p>
</HTML>"));
      equation 
        spacePhasor_r.v_[1]=Rr*spacePhasor_r.i_[1] + Lrsigma*der(spacePhasor_r.i_[1]);
        spacePhasor_r.v_[2]=Rrq*spacePhasor_r.i_[2] + Lrsigmaq*der(spacePhasor_r.i_[2]);
      end DamperCage;

      model PermanentMagnet "Permanent magnet excitation"
        parameter Modelica.SIunits.Current Ie "Equivalent excitation current";
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-60.0,60.0},{60.0,20.0}}),Ellipse(visible=true, lineColor={0,255,0}, fillColor={0,255,0}, fillPattern=FillPattern.Solid, extent={{-60.0,-20.0},{60.0,-60.0}}),Rectangle(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-60.0,40.0},{60.0,0.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-90.0,100.0},{-70.0,106.0},{-70.0,94.0},{-90.0,100.0}}),Rectangle(visible=true, lineColor={0,255,0}, fillColor={0,255,0}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-60.0,0.0},{60.0,-40.0}}),Line(visible=true, points={{-60.0,-40.0},{-60.0,0.0}}, color={0,255,0}),Line(visible=true, points={{60.0,-40.0},{60.0,0.0}}, color={0,255,0}),Line(visible=true, points={{0.0,100.0},{-70.0,100.0}}, color={0,0,255}),Line(visible=true, points={{0.0,100.0},{0.0,60.0}}, color={255,0,0}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Model of a permanent magnet excitation, characterized by an equivalent excitation current.
</p>
</HTML>"));
      equation 
        spacePhasor_r.i_={-Ie,0};
      end PermanentMagnet;

      model ElectricalExcitation "Electrical excitation"
        parameter Real TurnsRatio=1 "stator current / excitation current";
        Modelica.SIunits.Current ie "excitation current";
        Modelica.SIunits.Voltage ve "excitation voltage";
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_r annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-90.0,100.0},{-70.0,106.0},{-70.0,94.0},{-90.0,100.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-70.0,40.0},{10.0,-40.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-10.0,40.0},{70.0,-40.0}}),Line(visible=true, points={{-30.0,0.0},{-54.0,32.0},{-50.0,20.0},{-44.0,26.0},{-54.0,32.0}}, color={0,0,255}),Line(visible=true, points={{-30.0,0.0},{-54.0,-32.0},{-50.0,-20.0},{-44.0,-26.0},{-54.0,-32.0}}, color={0,0,255}),Line(visible=true, points={{-54.0,32.0},{-54.0,100.0},{-70.0,100.0}}, color={0,0,255}),Line(visible=true, points={{90.0,100.0},{30.0,100.0},{30.0,40.0}}, color={0,0,255}),Line(visible=true, points={{30.0,-40.0},{30.0,-100.0},{90.0,-100.0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of an electrical excitation, converting excitation to space phasor.
</p>
</HTML>"));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ep annotation(Placement(visible=true, transformation(origin={100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_en annotation(Placement(visible=true, transformation(origin={100.0,-100.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-100.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      equation 
        pin_ep.i + pin_en.i=0;
        ie=+pin_ep.i;
        ve=pin_ep.v - pin_en.v;
        spacePhasor_r.i_={-ie*TurnsRatio,0};
        ve=spacePhasor_r.v_[1]*TurnsRatio;
      end ElectricalExcitation;

      model AirGapDC "Linear airgap model of a DC machine"
        parameter Modelica.SIunits.Inductance Le "Excitation inductance";
        parameter Real TurnsRatio "Ratio of armature turns over number of turns of the excitation winding";
        Modelica.SIunits.AngularVelocity w "Angluar velocity";
        Modelica.SIunits.Voltage vei "Voltage drop across field excitation inductance";
        Modelica.SIunits.Current ie "Excitation current";
        Modelica.SIunits.MagneticFlux psi_e "Excitation flux";
        Modelica.SIunits.Voltage vai "Induced armature voltage";
        Modelica.SIunits.Current ia "Armature current";
        output Modelica.SIunits.Torque tau_electrical;
        Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={0.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Mechanics.Rotational.Interfaces.Flange_a support "support at which the reaction torque is acting" annotation(Placement(visible=true, transformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ap annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.PositivePin pin_ep annotation(Placement(visible=true, transformation(origin={100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={100.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_an annotation(Placement(visible=true, transformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin pin_en annotation(Placement(visible=true, transformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90.0,90.0},{90.0,-92.0}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80.0,80.0},{80.0,-80.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.VerticalCylinder, extent={{-10.0,90.0},{10.0,-80.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{0.0,-40.0},{80.0,40.0}}, textString="E", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80.0,-40.0},{0.0,40.0}}, textString="A", fontName="Arial")}), Documentation(info="<HTML>
<p>
Linear model of the airgap (without saturation effects) of a DC machine, using only equations.<br>
Induced excitation voltage is calculated from der(flux), where flux is defined by excitation inductance times excitation current.<br>
Induced armature voltage is calculated from flux times angular velocity.
</p>
</HTML>"));
      equation 
        vai=pin_ap.v - pin_an.v;
        ia=+pin_ap.i;
        ia=-pin_an.i;
        vei=pin_ep.v - pin_en.v;
        ie=+pin_ep.i;
        ie=-pin_en.i;
        psi_e=Le*ie;
        vei=der(psi_e);
        w=der(flange_a.phi) - der(support.phi);
        vai=TurnsRatio*psi_e*w;
        tau_electrical=TurnsRatio*psi_e*ia;
        flange_a.tau=-tau_electrical;
        support.tau=tau_electrical;
      end AirGapDC;

    end Components;

  end BasicMachines;

  package Sensors "Sensors for machine modelling"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains sensors that are usefull when modelling machines.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.03 2004/09/24 Anton Haumer</li>
  <li> v1.1  2004/10/01 Anton Haumer<br>
       changed RotorAngle</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support, also in sensor RotorAngle<br>
       to ease the implementation of a 3D-frame in a future release</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-74.0,46.0},{66.0,-94.0}}),Line(visible=true, points={{-4.0,46.0},{-4.0,16.0}}),Line(visible=true, points={{18.9,8.8},{36.2,33.3}}),Line(visible=true, points={{-26.9,8.8},{-44.2,33.3}}),Line(visible=true, points={{33.6,-10.3},{61.8,-0.1}}),Line(visible=true, points={{-41.6,-10.3},{-69.8,-0.1}}),Line(visible=true, points={{-4.0,-24.0},{5.02,4.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-4.48,7.6},{14.0,2.0},{14.0,33.2},{-4.48,7.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-9.0,-19.0},{1.0,-29.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model VoltageRMSsensor
      constant Integer m(final min=1)=3 "number of phases";
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Sensors.VoltageSensor VoltageSensor1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70.0,70.0},{70.0,-70.0}}),Line(visible=true, points={{0.0,70.0},{0.0,40.0}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0.0,0.0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18.0,26.0},{18.0,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5.0,5.0},{5.0,-5.0}}),Line(visible=true, points={{-90.0,0.0},{-70.0,0.0}}, color={0,0,255}),Line(visible=true, points={{70.0,0.0},{90.0,0.0}}, color={0,0,255}),Line(visible=true, points={{0.0,-70.0},{0.0,-100.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-60.0},{40.0,-20.0}}, textString="V RMS", fontName="Arial")}), Documentation(info="<HTML>
<p>
Measured 3-phase instantaneous voltages are transformed to the corresponding space phasor; <br>
output is length of the space phasor divided by sqrt(2), thus giving in sinusoidal stationary state RMS voltage.
</p>
</HTML>"));
      Modelica.Blocks.Math.Gain Gain1(final k=1/sqrt(2)) annotation(Placement(visible=true, transformation(origin={0.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToPolar ToPolar1 annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasor1 annotation(Placement(visible=true, transformation(origin={0.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealOutput V(redeclare type SignalType= Modelica.SIunits.Voltage ) annotation(Placement(visible=true, transformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90), iconTransformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(Gain1.y,V) annotation(Line(visible=true, origin={0.0,-95.5}, points={{0.0,14.5},{0.0,-14.5}}, color={0,0,255}));
      connect(ToPolar1.y[1],Gain1.u) annotation(Line(visible=true, origin={0.0,-49.5}, points={{0.0,8.5},{0.0,-8.5}}, color={0,0,255}));
      connect(ToSpacePhasor1.y,ToPolar1.u) annotation(Line(visible=true, origin={0.0,-9.5}, points={{0.0,8.5},{0.0,-8.5}}, color={0,0,255}));
      connect(VoltageSensor1.plug_n,plug_n) annotation(Line(visible=true, points={{10.0,50.0},{100.0,50.0},{100.0,0.0}}, color={0,0,255}));
      connect(plug_p,VoltageSensor1.plug_p) annotation(Line(visible=true, points={{-100.0,0.0},{-100.0,50.0},{-10.0,50.0}}, color={0,0,255}));
      connect(VoltageSensor1.v,ToSpacePhasor1.u) annotation(Line(visible=true, points={{0.0,39.0},{0.0,22.0},{0.0,22.0}}, color={0,0,255}));
    end VoltageRMSsensor;

    model CurrentRMSsensor
      constant Integer m(final min=1)=3 "number of phases";
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Sensors.CurrentSensor CurrentSensor1(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70.0,70.0},{70.0,-70.0}}),Line(visible=true, points={{0.0,70.0},{0.0,40.0}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0.0,0.0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18.0,26.0},{18.0,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5.0,5.0},{5.0,-5.0}}),Line(visible=true, points={{-90.0,0.0},{-70.0,0.0}}, color={0,0,255}),Line(visible=true, points={{70.0,0.0},{90.0,0.0}}, color={0,0,255}),Line(visible=true, points={{0.0,-70.0},{0.0,-100.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-60.0},{40.0,-20.0}}, textString="A RMS", fontName="Arial")}), Documentation(info="<HTML>
<p>
Measured 3-phase instantaneous currents are transformed to the corresponding space phasor; <br>
output is length of the space phasor divided by sqrt(2), thus giving in sinusoidal stationary state RMS current.
</p>
</HTML>"));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasor1 annotation(Placement(visible=true, transformation(origin={0.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToPolar ToPolar1 annotation(Placement(visible=true, transformation(origin={0.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Blocks.Math.Gain Gain1(final k=1/sqrt(2)) annotation(Placement(visible=true, transformation(origin={-0.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Blocks.Interfaces.RealOutput I(redeclare type SignalType= Modelica.SIunits.Current ) annotation(Placement(visible=true, transformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90), iconTransformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(ToSpacePhasor1.y,ToPolar1.u) annotation(Line(visible=true, origin={0.0,-9.5}, points={{0.0,8.5},{0.0,-8.5}}, color={0,0,255}));
      connect(CurrentSensor1.i,ToSpacePhasor1.u) annotation(Line(visible=true, points={{0.0,39.0},{0.0,22.0},{0.0,22.0}}, color={0,0,255}));
      connect(ToPolar1.y[1],Gain1.u) annotation(Line(visible=true, origin={0.0,-49.5}, points={{0.0,8.5},{0.0,-8.5}}, color={0,0,255}));
      connect(CurrentSensor1.plug_n,plug_n) annotation(Line(visible=true, points={{10.0,50.0},{100.0,50.0},{100.0,0.0}}, color={0,0,255}));
      connect(plug_p,CurrentSensor1.plug_p) annotation(Line(visible=true, points={{-100.0,0.0},{-100.0,50.0},{-10.0,50.0}}, color={0,0,255}));
      connect(Gain1.y,I) annotation(Line(visible=true, points={{-0.0,-81.0},{0.0,-91.5},{0.0,-91.5},{0.0,-110.0}}, color={0,0,255}));
    end CurrentRMSsensor;

    model ElectricalPowerSensor
      constant Integer m(final min=1)=3 "number of phases";
      Modelica.Blocks.Interfaces.RealOutput P(redeclare type SignalType= Modelica.SIunits.Power ) annotation(Placement(visible=true, transformation(origin={-50.0,110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90), iconTransformation(origin={-50.0,110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
      Modelica.Blocks.Interfaces.RealOutput Q(redeclare type SignalType= Modelica.SIunits.Power ) annotation(Placement(visible=true, transformation(origin={50.0,110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90), iconTransformation(origin={50.0,110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=90)));
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_ni(final m=m) annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_nv(final m=m) annotation(Placement(visible=true, transformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70.0,70.0},{70.0,-70.0}}),Line(visible=true, points={{0.0,70.0},{0.0,40.0}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0.0,0.0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18.0,26.0},{18.0,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5.0,5.0},{5.0,-5.0}}),Line(visible=true, points={{-90.0,0.0},{-70.0,0.0}}, color={0,0,255}),Line(visible=true, points={{70.0,0.0},{90.0,0.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-60.0},{40.0,-20.0}}, textString="P Q", fontName="Arial"),Line(visible=true, points={{0.0,-70.0},{0.0,-90.0}}, color={0,0,255}),Line(visible=true, points={{-10.0,70.0},{-10.0,80.0},{-50.0,80.0},{-50.0,100.0}}, color={0,0,255}),Line(visible=true, points={{10.0,70.0},{10.0,80.0},{50.0,80.0},{50.0,100.0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
3-phase instantaneous voltages (plug_p - plug_nv) and currents (plug_p - plug_ni) are transformed to the corresponding space phasors, <br>
which are used to calculate power quantities:<br>
P = instantaneous power, thus giving in stationary state active power.<br>
Q = giving in stationary state reactive power.<br>
</p>
</HTML>"));
    protected 
      Modelica.SIunits.Voltage v_[2];
      Modelica.SIunits.Current i_[2];
    equation 
      plug_p.pin.v=plug_ni.pin.v;
      plug_p.pin.i + plug_ni.pin.i=zeros(m);
      plug_nv.pin.i=zeros(m);
      v_=Machines.SpacePhasors.Functions.ToSpacePhasor(plug_p.pin.v - plug_nv.pin.v);
      i_=Machines.SpacePhasors.Functions.ToSpacePhasor(plug_p.pin.i);
      2/3*P=+v_[1]*i_[1] + v_[2]*i_[2];
      2/3*Q=-v_[1]*i_[2] + v_[2]*i_[1];
    end ElectricalPowerSensor;

    model MechanicalPowerSensor
      extends Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
      Modelica.Blocks.Interfaces.RealOutput P(redeclare type SignalType= Modelica.SIunits.Power ) annotation(Placement(visible=true, transformation(origin={0.0,-110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90), iconTransformation(origin={0.0,-110.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70.0,70.0},{70.0,-70.0}}),Line(visible=true, points={{0.0,70.0},{0.0,40.0}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0.0,0.0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18.0,26.0},{18.0,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5.0,5.0},{5.0,-5.0}}),Line(visible=true, points={{-70.0,0.0},{-90.0,0.0}}),Line(visible=true, points={{70.0,0.0},{90.0,0.0}}),Line(visible=true, points={{0.0,-100.0},{0.0,-70.0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,-60.0},{40.0,-20.0}}, textString="Pmech", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Calculates (mechanical) power from torque times angular speed.
</p>
</HTML>"));
      Modelica.Mechanics.Rotational.Sensors.TorqueSensor TorqueSensor1 annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Math.Product Product1 annotation(Placement(visible=true, transformation(origin={0.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor SpeedSensor1 annotation(Placement(visible=true, transformation(origin={-30.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
    equation 
      connect(SpeedSensor1.w,Product1.u2) annotation(Line(visible=true, origin={-18.0,-46.2488}, points={{-12.0,25.2488},{-12.0,-6.7488},{12.0,-6.7488},{12.0,-11.7512}}, color={0,0,255}));
      connect(TorqueSensor1.tau,Product1.u1) annotation(Line(visible=true, origin={14.0,-43.7488}, points={{8.0,32.7488},{8.0,-9.2488},{-8.0,-9.2488},{-8.0,-14.2512}}, color={0,0,255}));
      connect(Product1.y,P) annotation(Line(visible=true, origin={0.0,-95.5}, points={{0.0,14.5},{0.0,-14.5}}, color={0,0,255}));
      connect(TorqueSensor1.flange_b,flange_b) annotation(Line(visible=true, points={{40.0,0.0},{100.0,0.0}}));
      connect(flange_a,TorqueSensor1.flange_a) annotation(Line(visible=true, points={{-100.0,0.0},{20.0,0.0}}));
      connect(SpeedSensor1.flange_a,flange_a) annotation(Line(visible=true, points={{-30.0,0.0},{-100.0,0.0}}));
    end MechanicalPowerSensor;

    model RotorAngle "Rotor lagging angle"
      constant Integer m=3 "number of phases";
      parameter Integer p(min=1) "number of pole pairs";
      Modelica.Blocks.Interfaces.RealOutput rotorAngle(redeclare type SignalType= Modelica.SIunits.Angle ) annotation(Placement(visible=true, transformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Sensors.VoltageSensor VoltageSensor1(final m=m) annotation(Placement(visible=true, transformation(origin={-80.0,-10.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=-90)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToSpacePhasor ToSpacePhasorVS annotation(Placement(visible=true, transformation(origin={-50.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange annotation(Placement(visible=true, transformation(origin={0.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sensors.RelAngleSensor relativeAngleSensor annotation(Placement(visible=true, transformation(origin={30.0,80.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Sources.Constant constant_(final k=Modelica.Constants.pi/2) annotation(Placement(visible=true, transformation(origin={-40.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Math.Add add(final k2=1, final k1=p) annotation(Placement(visible=true, transformation(origin={-10.0,20.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=90)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.Rotator rotatorVS2R annotation(Placement(visible=true, transformation(origin={-10.0,-10.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
      Modelica.Electrical.Machines.SpacePhasors.Blocks.ToPolar ToPolarVSR annotation(Placement(visible=true, transformation(origin={30.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Routing.DeMultiplex2 deMultiplex2(final n1=1, final n2=1) annotation(Placement(visible=true, transformation(origin={70.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Fixed fixedHousing(final phi0=0) annotation(Placement(visible=true, transformation(origin={60.0,80.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60.0,80.0},{60.0,40.0}}),Ellipse(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60.0,-40.0},{60.0,-80.0}}),Rectangle(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60.0,60.0},{60.0,40.0}}),Rectangle(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60.0,-40.0},{60.0,-60.0}}),Rectangle(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40.0,40.0},{40.0,-40.0}}),Line(visible=true, points={{0.0,0.0},{-80.0,80.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-80.0,80.0},{-68.0,76.0},{-76.0,68.0},{-80.0,80.0}}),Line(visible=true, points={{0.0,0.0},{0.0,80.0}}, color={0,255,0}),Polygon(visible=true, lineColor={0,255,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{0.0,84.0},{4.0,72.0},{-4.0,72.0},{0.0,84.0}})}), Documentation(info="<HTML>
<p>
Calculates rotor lagging angle by measuring the stator phase voltages, transforming them to the correspondig space phasor in stator-fixed coordinate system, <br>
rotating the space phasor to the rotor-fixed coordinate system and calculating the angle of this space phasor.
</p>
<p>
The sensor's housing is implicitely fixed.<br>
Since the machine's stator also implicitely fixed, the angle at the flange 
is equal to the angle of the machine's rotor against the stator.
</p>
</HTML>"));
    equation 
      connect(constant_.y,add.u2) annotation(Line(visible=true, origin={-20.3333,37.3333}, points={{-8.6667,2.6667},{4.3333,2.6667},{4.3333,-5.3333}}, color={0,0,255}));
      connect(add.y,rotatorVS2R.angle) annotation(Line(visible=true, origin={-10.0,5.5}, points={{0.0,3.5},{0.0,-3.5}}, color={0,0,255}));
      connect(relativeAngleSensor.phi_rel,add.u1) annotation(Line(visible=true, points={{30.0,69.0},{30.0,40.0},{-4.0,40.0},{-4.0,32.0}}, color={0,0,255}));
      connect(plug_p,VoltageSensor1.plug_p) annotation(Line(visible=true, points={{-100.0,60.0},{-80.0,60.0},{-80.0,0.0}}, color={0,0,255}));
      connect(plug_n,VoltageSensor1.plug_n) annotation(Line(visible=true, points={{-100.0,-60.0},{-80.0,-60.0},{-80.0,-20.0}}, color={0,0,255}));
      connect(VoltageSensor1.v,ToSpacePhasorVS.u) annotation(Line(visible=true, origin={-65.5,-10.0}, points={{-3.5,0.0},{3.5,0.0}}, color={0,0,255}));
      connect(relativeAngleSensor.flange_a,fixedHousing.flange_b) annotation(Line(visible=true, points={{40.0,80.0},{60.0,80.0}}));
      connect(relativeAngleSensor.flange_b,flange) annotation(Line(visible=true, points={{20.0,80.0},{0.0,80.0},{0.0,100.0}}));
      connect(deMultiplex2.y2[1],rotorAngle) annotation(Line(visible=true, points={{81.0,-16.0},{90.0,-16.0},{90.0,0.0},{110.0,0.0}}, color={0,0,255}));
      connect(ToPolarVSR.y,deMultiplex2.u) annotation(Line(visible=true, points={{41.0,-10.0},{58.0,-10.0}}, color={0,0,255}));
      connect(rotatorVS2R.y,ToPolarVSR.u) annotation(Line(visible=true, points={{1.0,-10.0},{18.0,-10.0}}, color={0,0,255}));
      connect(ToSpacePhasorVS.y,rotatorVS2R.u) annotation(Line(visible=true, points={{-39.0,-10.0},{-22.0,-10.0}}, color={0,0,255}));
    end RotorAngle;

  end Sensors;

  package SpacePhasors "Library with space phasor-models"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains components, blocks and functions to utilize space phasor theory.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.30 2004/11/05 Anton Haumer<br>
       several improvements in SpacePhasors.Blocks</li>
  <li> v1.60 2005/11/03 Anton Haumer<br>
       added Components.Rotator</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-8.0,-26.0},{64.0,46.0},{44.0,38.0},{56.0,26.0},{64.0,46.0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-8.0,-26.0},{64.0,-98.0},{56.0,-78.0},{44.0,-90.0},{64.0,-98.0}}, color={0,0,255}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package Components "Basic space phasor models"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains basic space phasor models:
<ul>
<li>SpacePhasor: physical transformation of voltages and currents three phase <-> space phasors</li>
</ul>
Real and imaginary part of voltage space phasor are the potentials v_[2] of the space phasor connector; (implicit grounded).<br>
Real and imaginary part of current space phasor are the currents i_[2] at the space phasor connector;
a ground has to be used where necessary for currents flowing back.<br>
Zero-sequence voltage and current are present at pin zero. An additional zero-sequence impedance could be connected between pin zero and pin ground.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.60 2005/11/03 Anton Haumer<br>
       added Rotator</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      model SpacePhasor "Physical transformation: three phase <-> space phasors"
        constant Integer m=3 "number of phases";
        constant Real pi=Modelica.Constants.pi;
        Modelica.SIunits.Voltage v[m] "instantaneous phase voltages";
        Modelica.SIunits.Current i[m] "instantaneous phase currents";
        Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.PositivePin zero annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Interfaces.NegativePin ground annotation(Placement(visible=true, transformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Analog.Basic.Ground gnd annotation(Placement(visible=true, transformation(origin={70.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Physical transformation of voltages and currents: three phases <-> space phasors:<br>
x[k] = X0 + {cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi) * X[Re,Im]<br>
and vice versa:<br>
X0 = sum(x[k])/m<br>
X[Re,Im] = sum(2/m*{cos((k - 1)/m*2*pi),sin((k - 1)/m*2*pi)}*x[k])<br>
were x designates three phase values, X[Re,Im] designates the space phasor and X0 designates the zero sequence system.<br>
<i>Physcial transformation</i> means that both voltages and currents are transformed in both directions.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={35.0,35.0}, points={{-35.0,-35.0},{35.0,35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={35.0,-35.0}, points={{-35.0,35.0},{35.0,-35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={-30.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={-40.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={-50.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Polygon(visible=true, origin={70.0,-70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-10.0,0.0},{0.0,10.0},{10.0,-10.0}}),Polygon(visible=true, origin={70.0,70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-10.0,0.0},{0.0,-10.0},{10.0,10.0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,110.0},{150.0,150.0}}, textString="%name", fontName="Arial")}));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{90.0,90.0},{110.0,110.0}}, rotation=0), iconTransformation(origin={0.0,0.0}, extent={{90.0,90.0},{110.0,110.0}}, rotation=0)));
      protected 
        parameter Real TransformationMatrix[2,m]=2/m*{array(cos(+(k - 1)/m*2*pi) for k in 1:m),array(+sin(+(k - 1)/m*2*pi) for k in 1:m)};
        parameter Real InverseTransformation[m,2]=array({cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi)} for k in 1:m);
      equation 
        connect(gnd.p,ground) annotation(Line(visible=true, points={{70.0,-90.0},{100.0,-90.0},{100.0,-100.0}}, color={0,0,255}));
        v=plug_p.pin.v - plug_n.pin.v;
        i=+plug_p.pin.i;
        i=-plug_n.pin.i;
        zero.v=1/m*sum(v);
        spacePhasor.v_=TransformationMatrix*v;
        -zero.i=1/m*sum(i);
        -spacePhasor.i_=TransformationMatrix*i;
      end SpacePhasor;

      model Rotator "Rotates space phasor"
        constant Real pi=Modelica.Constants.pi;
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_a annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-110.0,110.0},{-90.0,90.0}}, rotation=0), iconTransformation(origin={0.0,0.0}, extent={{-110.0,110.0},{-90.0,90.0}}, rotation=0)));
        Modelica.Electrical.Machines.Interfaces.SpacePhasor spacePhasor_b annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{90.0,110.0},{110.0,90.0}}, rotation=0), iconTransformation(origin={0.0,0.0}, extent={{90.0,110.0},{110.0,90.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Rotates space phasors of left connector to right connector by the angle provided by the input signal \"angle\" from one coordinate system into another.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-2.0,-50.0},{50.0,-2.0}}),Line(visible=true, points={{0.0,0.0},{80.0,0.0},{60.0,10.0},{60.0,-10.0},{80.0,0.0}}, color={0,0,255}),Line(visible=true, points={{0.0,0.0},{0.0,80.0},{-10.0,60.0},{10.0,60.0},{0.0,80.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{50.0,0.0},{42.0,14.0},{54.0,16.0},{50.0,0.0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-50.0,-50.0},{50.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-75.0,-50.0},{-2.0,54.63}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-75.0,-75.0},{53.6,-2.0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,110.0},{150.0,150.0}}, textString="%name", fontName="Arial")}));
        Modelica.Blocks.Interfaces.RealInput angle(redeclare type SignalType= Modelica.SIunits.Angle ) annotation(Placement(visible=true, transformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90), iconTransformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90)));
      protected 
        Real RotationMatrix[2,2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+cos(-angle)}};
      equation 
        spacePhasor_b.v_=RotationMatrix*spacePhasor_a.v_;
        spacePhasor_b.i_=RotationMatrix*spacePhasor_a.i_;
      end Rotator;

    end Components;

    package Blocks "Blocks for space phasor transformation"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains space phasor transformation blocks for use in controllers:
<ul>
<li>ToSpacePhasor: transforms a set of threephase values to space phasor and zero sequence system</li>
<li>FromSpacePhasor: transforms a space phasor and zero sequence system to a set of threephase values</li>
<li>Rotator: rotates a space phasor (from one coordinate system into another)</li>
<li>ToPolar: Converts a space phasor from rectangular coordinates to polar coordinates</li>
<li>FromPolar: Converts a space phasor from polar coordinates to rectangular coordinates</li>
</ul>
</p>

</HTML>", revisions="<HTML>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.30 2004/11/05 Anton Haumer<br>
       several improvements in SpacePhasors.Blocks</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      block ToSpacePhasor "Conversion: three phase -> space phasor"
        extends Modelica.Blocks.Interfaces.MIMO(final nin=m, final nout=2);
        constant Integer m=3 "number of phases";
        constant Real pi=Modelica.Constants.pi;
        Modelica.Blocks.Interfaces.RealOutput zero annotation(Placement(visible=true, transformation(origin={110.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={110.0,-80.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Transformation of threephase values (voltages or currents) to space phasor and zero sequence value.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={35.0,35.0}, points={{-35.0,-35.0},{35.0,35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={35.0,-35.0}, points={{-35.0,35.0},{35.0,-35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={-30.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={-40.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={-50.0,0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Polygon(visible=true, origin={70.0,-70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-10.0,0.0},{0.0,10.0},{10.0,-10.0}}),Polygon(visible=true, origin={70.0,70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-10.0,0.0},{0.0,-10.0},{10.0,10.0}})}));
      protected 
        parameter Real TransformationMatrix[2,m]=2/m*{array(cos(+(k - 1)/m*2*pi) for k in 1:m),array(+sin(+(k - 1)/m*2*pi) for k in 1:m)};
        parameter Real InverseTransformation[m,2]=array({cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi)} for k in 1:m);
      equation 
        zero=1/m*sum(u);
        y=TransformationMatrix*u;
      end ToSpacePhasor;

      block FromSpacePhasor "Conversion: space phasor -> three phase"
        extends Modelica.Blocks.Interfaces.MIMO(final nin=2, final nout=m);
        constant Integer m=3 "number of phases";
        constant Real pi=Modelica.Constants.pi;
        Modelica.Blocks.Interfaces.RealInput zero annotation(Placement(visible=true, transformation(origin={-120.0,-80.0}, extent={{-20.0,20.0},{20.0,-20.0}}, rotation=0), iconTransformation(origin={-120.0,-80.0}, extent={{-20.0,20.0},{20.0,-20.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Transformation of space phasor and zero sequence value to threephase values (voltages or currents).
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, origin={-35.0,35.0}, points={{35.0,-35.0},{-35.0,35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={-35.0,-35.0}, points={{35.0,35.0},{-35.0,-35.0}}, color={0,0,255}, arrowSize=20),Line(visible=true, origin={50.0,-0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={40.0,-0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Line(visible=true, origin={30.0,-0.0}, points={{-40.0,0.0},{-20.0,30.0},{0.0,0.0},{20.0,-30.0},{40.0,0.0}}, color={0,0,255}, smooth=Smooth.Bezier),Polygon(visible=true, origin={-70.0,70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{10.0,0.0},{0.0,-10.0},{-10.0,10.0}}),Polygon(visible=true, origin={-70.0,-70.0}, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{10.0,0.0},{0.0,10.0},{-10.0,-10.0}})}));
      protected 
        parameter Real TransformationMatrix[2,m]=2/m*{array(cos(+(k - 1)/m*2*pi) for k in 1:m),array(+sin(+(k - 1)/m*2*pi) for k in 1:m)};
        parameter Real InverseTransformation[m,2]=array({cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi)} for k in 1:m);
      equation 
        y=fill(zero, m) + InverseTransformation*u;
      end FromSpacePhasor;

      block Rotator "Rotates space phasor"
        extends Modelica.Blocks.Interfaces.MIMOs(final n=2);
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Rotates a space phasor (voltage or current) by the angle provided by the input signal \"angle\" from one coordinate system into another.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0.0,0.0},{0.0,80.0},{-10.0,60.0},{10.0,60.0},{0.0,80.0}}, color={0,0,255}),Line(visible=true, points={{0.0,0.0},{80.0,0.0},{60.0,10.0},{60.0,-10.0},{80.0,0.0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-50.0,-50.0},{50.0,50.0}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-51.89,-50.0},{-2.0,51.54}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-8.59,-52.23},{53.26,-1.718}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{50.0,0.0},{42.0,14.0},{54.0,16.0},{50.0,0.0}}),Text(visible=true, lineColor={0,0,255}, extent={{-88.0,-92.0},{84.0,-72.0}}, textString="angle", fontName="Arial")}));
        Modelica.Blocks.Interfaces.RealInput angle(redeclare type SignalType= Modelica.SIunits.Angle ) annotation(Placement(visible=true, transformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90), iconTransformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90)));
      protected 
        Real RotationMatrix[2,2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+cos(-angle)}};
      equation 
        y=RotationMatrix*u;
      end Rotator;

      block ToPolar "Converts a space phasor to polar coordinates"
        extends Modelica.Blocks.Interfaces.MIMOs(final n=2);
        constant Real small=Modelica.Constants.small;
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Converts a space phasor from rectangular coordinates to polar coordinates.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-60.0,60.0},{-60.0,-60.0},{60.0,-60.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-100.0},{100.0,100.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, points={{26.0,26.0},{14.0,20.0},{20.0,14.0},{26.0,26.0}}),Line(visible=true, points={{-18.0,-18.0},{-14.0,-22.0},{-10.0,-28.0},{-6.0,-34.0},{-2.0,-44.0},{0.0,-52.0},{0.0,-60.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, points={{-18.0,-18.0},{-14.0,-26.0},{-10.0,-22.0},{-18.0,-18.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-6.0},{-6.0,100.0}}, textString="R", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{6.0,-100.0},{100.0,6.0}}, textString="P", fontName="Arial")}));
      equation 
        y[1]=sqrt(u[1]^2 + u[2]^2);
        y[2]=if noEvent(y[1] <= small) then 0 else Modelica.Math.atan2(u[2], u[1]);
      end ToPolar;

      block FromPolar "Converts a space phasor from polar coordinates"
        extends Modelica.Blocks.Interfaces.MIMOs(final n=2);
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-60.0,60.0},{-60.0,-60.0},{60.0,-60.0}}, color={0,0,255}),Line(visible=true, points={{-100.0,-100.0},{100.0,100.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, points={{26.0,26.0},{14.0,20.0},{20.0,14.0},{26.0,26.0}}),Line(visible=true, points={{-18.0,-18.0},{-14.0,-22.0},{-10.0,-28.0},{-6.0,-34.0},{-2.0,-44.0},{0.0,-52.0},{0.0,-60.0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, points={{-18.0,-18.0},{-14.0,-26.0},{-10.0,-22.0},{-18.0,-18.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-6.0},{-6.0,100.0}}, textString="P", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{6.0,-100.0},{100.0,6.0}}, textString="R", fontName="Arial")}), Documentation(info="<HTML>
<p>
Converts a space phasor from polar coordinates to rectangular coordinates.
</p>
</HTML>"));
      equation 
        y=u[1]*{cos(u[2]),sin(u[2])};
      end FromPolar;

    end Blocks;

    package Functions "Functions for space phasor transformation"
      extends Modelica.Icons.Library;
      annotation(Documentation(info="<HTML>
<p>
This package contains space phasor transformation functions for use in calculations:
<ul>
<li>ToSpacePhasor: transforms a set of threephase values to space phasor and zero sequence system</li>
<li>FromSpacePhasor: transforms a space phasor and zero sequence system to a set of threephase values</li>
<li>Rotator: rotates a space phasor (from one coordinate system into another)</li>
<li>ToPolar: Converts a space phasor from rectangular coordinates to polar coordinates</li>
<li>FromPolar: Converts a space phasor from polar coordinates to rectangular coordinates</li>
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  </ul>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.6.1 2005/11/10 Anton Haumer<br>
       improved Transformation and Rotation</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      function ToSpacePhasor "Conversion: three phase -> space phasor"
        extends Modelica.Icons.Function;
        constant Integer m=3 "number of phases";
        constant Real pi=Modelica.Constants.pi;
        input Real x[3];
        output Real y[2];
        output Real y0;
        annotation(Documentation(info="<HTML>
<p>
Transformation of three phase values (voltages or currents) to space phasor and zero sequence value:<br>
y[k] = X0 + {cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi) * X[Re,Im]<br>
were y designates three phase values, X[Re,Im] designates the space phasor and X0 designates the zero sequence system.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      algorithm 
        y:=zeros(2);
        for k in 1:m loop
          y:=y + 2/m*{+cos((k - 1)/m*2*pi),+sin(+(k - 1)/m*2*pi)}*x[k];
        end for;
        y0:=1/m*sum(x);
      end ToSpacePhasor;

      function FromSpacePhasor "Conversion: space phasor -> three phase"
        extends Modelica.Icons.Function;
        constant Integer m=3 "number of phases";
        constant Real pi=Modelica.Constants.pi;
        input Real x[2];
        input Real x0;
        output Real y[3];
        annotation(Documentation(info="<HTML>
<p>
Transformation of space phasor and zero sequence value to three phase values (voltages or currents):<br>
Y0 = sum(x[k])/m<br>
Y[Re,Im] = sum(2/m*{cos((k - 1)/m*2*pi),sin((k - 1)/m*2*pi)}*x[k])<br>
were x designates three phase values, Y[Re,Im] designates the space phasor and Y0 designates the zero sequence system.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      algorithm 
        for k in 1:m loop
          y[k]:=x0 + {cos(-(k - 1)/m*2*pi),-sin(-(k - 1)/m*2*pi)}*x;
        end for;
      end FromSpacePhasor;

      function Rotator "Rotates space phasor"
        extends Modelica.Icons.Function;
        input Real x[2];
        input Modelica.SIunits.Angle angle;
        output Real y[2];
        annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      protected 
        Real RotationMatrix[2,2]={{+cos(-angle),-sin(-angle)},{+sin(-angle),+cos(-angle)}};
        annotation(Documentation(info="<HTML>
<p>
Rotates a space phasor (voltage or current) by the angle provided by input argument \"angle\" from one coordinate system into another:<br>
y[Re,Im] := {{+cos(-angle),-sin(-angle)},{+sin(-angle),+cos(-angle)}}*x[Re,Im]<br>
where y[Re,Im] designates the space phasor in the new coordinate system (twisted by angle against old coordinate system) and y[Re,Im] designates the space phasor in the old coordinate system.
</p>
</HTML>"));
      algorithm 
        y:=RotationMatrix*x;
      end Rotator;

      function ToPolar "Converts a space phasor to polar coordinates"
        extends Modelica.Icons.Function;
        constant Real small=Modelica.Constants.small;
        input Real x[2];
        output Real absolute;
        output Modelica.SIunits.Angle angle;
        annotation(Documentation(info="<HTML>
<p>
Converts a space phasor from rectangular coordinates to polar coordinates, providing angle=0 for {0,0}.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      algorithm 
        absolute:=sqrt(x[1]^2 + x[2]^2);
        angle:=if absolute <= small then 0 else Modelica.Math.atan2(x[2], x[1]);
      end ToPolar;

      function FromPolar "Converts a space phasor from polar coordinates"
        extends Modelica.Icons.Function;
        constant Real pi=Modelica.Constants.pi;
        constant Real small=Modelica.Constants.small;
        input Real absolute;
        input Modelica.SIunits.Angle angle;
        output Real x[2];
        annotation(Documentation(info="<HTML>
<p>
Converts a space phasor from polar coordinates to rectangular coordinates.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      algorithm 
        x:=absolute*{cos(angle),sin(angle)};
      end FromPolar;

    end Functions;

  end SpacePhasors;

  package Interfaces "SpacePhasor connector and PartialMachines"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains the space phasor connector and partial models for machine models.
</p>

</HTML>", revisions="<HTML>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>

  <ul>
  <li> v1.00 2004/09/16 Anton Haumer</li>
  <li> v1.01 2004/09/18 Anton Haumer<br>
       moved common equations from machine models to PartialMachine</li>
  <li> v1.02 2004/09/19 Anton Haumer<br>
       added PartialDCMachine</li>
  <li> v1.2  2004/10/27 Anton Haumer<br>
       fixed a bug with support (formerly bearing)</li>
  <li> v1.4   2004/11/11 Anton Haumer<br>
       removed mechanical flange support<br>
       to ease the implementation of a 3D-frame in a future release</li>
  <li> v1.51 Beta 2005/02/01 Anton Haumer<br>
       changed parameter polePairs to Integer</li>
  </ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-70.0,-30.0},{-10.0,30.0},{50.0,-30.0},{-10.0,-90.0},{-70.0,-30.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    connector SpacePhasor "Connector for Space Phasors"
      Modelica.SIunits.Voltage v_[2];
      flow Modelica.SIunits.Current i_[2];
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{0.0,100.0},{-100.0,0.0},{0.0,-100.0},{100.0,0.0},{0.0,100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,-90.0}}, textString="%name", fontName="Arial")}), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{0.0,100.0},{-100.0,0.0},{0.0,-100.0},{100.0,0.0},{0.0,100.0}})}), Documentation(info="<HTML>
<p>
Connector for Space Phasors:
<ul>
<li>Voltage v_[2] ... Real and Imaginary part of voltage space phasor</li>
<li>Current i_[2] ... Real and Imaginary part of current space phasor</li>
</ul>
</p>
</HTML>"));
    end SpacePhasor;

    partial model PartialBasicMachine "Partial machine model"
      parameter Modelica.SIunits.Inertia J_Rotor "rotor's moment of inertia";
      output Modelica.SIunits.Angle phi_mechanical=flange_a.phi "mechanical angle of rotor against stator";
      output Modelica.SIunits.AngularVelocity w_mechanical=der(phi_mechanical) "mechanical angular velocity of rotor against stator";
      output Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm rpm_mechanical=Modelica.SIunits.Conversions.to_rpm(w_mechanical) "mechanical speed of rotor against stator [rpm]";
      output Modelica.SIunits.Torque tau_electrical=inertiaRotor.flange_a.tau "electromagnetic torque";
      output Modelica.SIunits.Torque tau_shaft=-flange_a.tau "shaft torque";
      Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia inertiaRotor(final J=J_Rotor) annotation(Placement(visible=true, transformation(origin={70.0,0.0}, extent={{10.0,10.0},{-10.0,-10.0}}, rotation=180)));
      Modelica.Mechanics.Rotational.Fixed fixedHousing(final phi0=0) annotation(Placement(visible=true, transformation(origin={40.0,-100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={0,127,255}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40.0,60.0},{80.0,-60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40.0,60.0},{-60.0,-60.0}}),Rectangle(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.HorizontalCylinder, extent={{80.0,10.0},{100.0,-10.0}}),Rectangle(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-40.0,70.0},{40.0,50.0}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-50.0,-90.0},{-40.0,-90.0},{-10.0,-20.0},{40.0,-20.0},{70.0,-90.0},{80.0,-90.0},{80.0,-100.0},{-50.0,-100.0},{-50.0,-90.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-180.0},{150.0,-120.0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    protected 
      Modelica.Mechanics.Rotational.Interfaces.Flange_b internalSupport annotation(Placement(visible=true, transformation(origin={20.0,-100.0}, extent={{-1.0,-1.0},{1.0,1.0}}, rotation=0)));
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-40,60},{80,-60}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={0,127,255}),Rectangle(extent={{-40,60},{-60,-60}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={128,128,128}),Rectangle(extent={{80,10},{100,-10}}, lineColor={0,0,0}, fillPattern=FillPattern.HorizontalCylinder, fillColor={128,128,128}),Rectangle(extent={{-40,70},{40,50}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Polygon(points={{-50,-90},{-40,-90},{-10,-20},{40,-20},{70,-90},{80,-90},{80,-100},{-50,-100},{-50,-90}}, lineColor={0,0,0}, fillColor={0,0,0}, fillPattern=FillPattern.Solid),Text(lineColor={0,0,255}, extent={{-150,-120},{150,-180}}, fillColor={0,0,255}, textString="%name")}), Documentation(info="<HTML>
<p>
Base partial model DC machines:
<ul>
<li>main parts of the icon</li>
<li>mechanical flange</li>
<li>mechanical support</li>
</ul>
</p>
<p>
The machine's stator is implicitely fixed. 
</p>
</HTML>"), Diagram);
    equation 
      connect(internalSupport,fixedHousing.flange_b) annotation(Line(visible=true, points={{20.0,-100.0},{40.0,-100.0}}));
      connect(inertiaRotor.flange_b,flange_a) annotation(Line(visible=true, points={{80.0,0.0},{92.0,0.0},{92.0,0.0},{100.0,0.0}}));
    end PartialBasicMachine;

    partial model PartialBasicInductionMachine "Partial model for induction machine"
      extends PartialBasicMachine(J_Rotor=0.29);
      constant Real pi=Modelica.Constants.pi;
      constant Integer m=3 "number of phases";
      parameter Integer p(min=1)=2 "number of pole pairs (Integer)";
      output Modelica.SIunits.Voltage vs[m]=plug_sp.pin.v - plug_sn.pin.v "stator instantaneous voltages";
      output Modelica.SIunits.Current is[m]=plug_sp.pin.i "stator instantaneous currents";
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug plug_sp(final m=m) annotation(Placement(visible=true, transformation(origin={60.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={60.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug plug_sn(final m=m) annotation(Placement(visible=true, transformation(origin={-60.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-60.0,100.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<p>
Partial model for induction machine models, containing:
<ul>
<li>main parts of the icon</li>
<li>stator plugs</li>
<li>mechanical connectors</li>
</ul>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-50.0,100.0},{-20.0,100.0},{-20.0,70.0}}, color={0,0,255}),Line(visible=true, points={{50.0,100.0},{20.0,100.0},{20.0,70.0}}, color={0,0,255})}));
    end PartialBasicInductionMachine;

    partial model PartialBasicDCMachine "Partial model for DC machine"
      extends PartialBasicMachine(J_Rotor=0.15);
      output Modelica.SIunits.Voltage va=pin_ap.v - pin_an.v "armature voltage";
      output Modelica.SIunits.Current ia=pin_ap.i "armature current";
      annotation(Documentation(info="<HTML>
<p>
Partial model for DC machine models, containing:
<ul>
<li>main parts of the icon</li>
<li>armature pins</li>
<li>mechanical connectors</li>
</ul>
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-50.0,100.0},{-20.0,100.0},{-20.0,70.0}}, color={0,0,255}),Line(visible=true, points={{50.0,100.0},{20.0,100.0},{20.0,70.0}}, color={0,0,255})}));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_ap annotation(Placement(visible=true, transformation(origin={60.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={60.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_an annotation(Placement(visible=true, transformation(origin={-60.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-60.0,100.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
    end PartialBasicDCMachine;

  end Interfaces;

end Machines;
