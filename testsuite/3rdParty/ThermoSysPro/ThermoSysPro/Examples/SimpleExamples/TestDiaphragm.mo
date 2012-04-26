within ThermoSysPro.Examples.SimpleExamples;
model TestDiaphragm 
  
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
    annotation (extent=[-80,20; -60,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[40,20; 60,40]);
  ThermoSysPro.WaterSteam.PressureLosses.Diaphragm Diaphragm 
                                          annotation (extent=[-20,20; 0,40]);
equation 
  connect(Diaphragm.C2, PuitsP1.C) 
    annotation (points=[0,30; 40,30],                        style(color=3));
  connect(SourceP1.C, Diaphragm.C1) 
    annotation (points=[-60,30; -20,30], style(color=3, rgbcolor={0,0,255}));
end TestDiaphragm;
