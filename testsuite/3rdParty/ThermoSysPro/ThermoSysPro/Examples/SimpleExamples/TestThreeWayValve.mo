within ThermoSysPro.Examples.SimpleExamples;
model TestThreeWayValve 
  
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
  ThermoSysPro.WaterSteam.PressureLosses.ThreeWayValve threeWayValve 
    annotation (extent=[-20,24; 0,44]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP2 
                                          annotation (extent=[60,-20; 80,0]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe 
                                         annotation (extent=[-60,60; -40,80]);
equation 
  connect(SourceP1.C, threeWayValve.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
  connect(threeWayValve.C2, PuitsP1.C) 
    annotation (points=[0,30; 60,30], style(color=1, rgbcolor={255,0,0}));
  connect(threeWayValve.C3, PuitsP2.C) annotation (points=[-10,24; -10,-10; 60,
        -10], style(color=1, rgbcolor={255,0,0}));
  connect(rampe.y, threeWayValve.Ouv) 
    annotation (points=[-39,70; -10,70; -10,45]);
end TestThreeWayValve;
