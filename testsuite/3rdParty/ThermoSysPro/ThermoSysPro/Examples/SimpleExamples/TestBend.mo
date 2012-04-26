within ThermoSysPro.Examples.SimpleExamples;
model TestBend 
  
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
    annotation (extent=[-100,26; -80,46]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP SinkP1 
                                          annotation (extent=[60,0; 80,20]);
  ThermoSysPro.WaterSteam.PressureLosses.Bend Bend   annotation (extent=[-20,26; 0,46]);
equation 
  connect(Bend.C2, SinkP1.C) 
    annotation (points=[-10,26; -10,10; 60,10],              style(color=3));
  connect(SourceP1.C, Bend.C1) 
    annotation (points=[-80,36; -20,36], style(color=3, rgbcolor={0,0,255}));
end TestBend;
