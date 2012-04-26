within ThermoSysPro.Examples.SimpleExamples;
model TestSingularPressureLoss 
  
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
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss(                                                          fluid=1) 
                                          annotation (extent=[-20,20; 0,40]);
equation 
  connect(singularPressureLoss.C2, PuitsP1.C) 
    annotation (points=[0,30; 60,30],                        style(color=3));
  connect(SourceP1.C, singularPressureLoss.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
end TestSingularPressureLoss;
