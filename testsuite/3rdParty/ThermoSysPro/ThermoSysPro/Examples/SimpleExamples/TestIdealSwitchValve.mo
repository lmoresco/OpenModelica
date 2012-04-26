within ThermoSysPro.Examples.SimpleExamples;
model TestIdealSwitchValve 
  
  annotation (Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]), Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1 
    annotation (extent=[-100, 20; -80, 40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[60, 20; 80, 40]);
  ThermoSysPro.WaterSteam.PressureLosses.IdealSwitchValve SwitchValve 
                                          annotation (extent=[-20,26; 0,46]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse pulse(
                                         width=10, period=20) 
    annotation (extent=[-60,60; -40,80]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP2 
                                        annotation (extent=[-60,20; -40,40]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe perteDP1 
                                        annotation (extent=[20,20; 40,40]);
equation 
  connect(pulse.yL, SwitchValve.Ouv) annotation (points=[-39,70; -10,70; -10,43],
      style(
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
  connect(SourceP1.C, perteDP2.C1) annotation (points=[-80,30; -60,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
  connect(perteDP2.C2, SwitchValve.C1) annotation (points=[-40,30; -30,30; -30,
        29.8; -20,29.8], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
  connect(SwitchValve.C2, perteDP1.C1) annotation (points=[0,30; 20,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
  connect(perteDP1.C2, PuitsP1.C) annotation (points=[40,30; 60,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
end TestIdealSwitchValve;
