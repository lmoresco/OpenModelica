within ThermoSysPro.Examples.SimpleExamples;
model TestSwitchValve 
  
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
  ThermoSysPro.WaterSteam.PressureLosses.SwitchValve SwitchValve 
                                          annotation (extent=[-20,26; 0,46]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse pulse(
                                         width=10, period=20) 
    annotation (extent=[-60,60; -40,80]);
equation 
  connect(SwitchValve.C2, PuitsP1.C) 
    annotation (points=[0,30.2; 40,30.2; 40,30; 60,30],      style(color=3));
  connect(SourceP1.C, SwitchValve.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
  connect(pulse.yL, SwitchValve.Ouv) annotation (points=[-39,70; -10,70; -10,43.2],
      style(
      fillColor=59,
      rgbfillColor={85,255,85},
      fillPattern=1));
end TestSwitchValve;
