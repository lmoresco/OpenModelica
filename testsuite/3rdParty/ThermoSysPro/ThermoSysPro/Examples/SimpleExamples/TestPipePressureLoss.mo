within ThermoSysPro.Examples.SimpleExamples;
model TestPipePressureLoss 
  
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
    annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.PressureLosses.PipePressureLoss pipePressureLoss 
                                          annotation (extent=[-20,20; 0,40]);
equation 
  connect(pipePressureLoss.C2, PuitsP1.C) 
    annotation (points=[0,30; 60,30],                        style(color=3));
  connect(SourceP1.C, pipePressureLoss.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
end TestPipePressureLoss;
