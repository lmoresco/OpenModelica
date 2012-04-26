within ThermoSysPro.Examples.SimpleExamples;
model TestStodolaTurbine2 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Window(
      x=0.32,
      y=0.02,
      width=0.39,
      height=0.47),
    Diagram);
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine stodolaTurbine 
    annotation (extent=[-60,60; -40,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=5000) 
    annotation (extent=[-20,60; 0,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=3e5)  annotation (extent=[-100,60; -80,80]);
equation 
  connect(sourceP.C, stodolaTurbine.Ce) 
    annotation (points=[-80,70; -60.1,70], style(color=3, rgbcolor={0,0,255}));
  connect(stodolaTurbine.Cs, puitsP.C) 
    annotation (points=[-39.9,70; -20,70], style(color=3, rgbcolor={0,0,255}));
end TestStodolaTurbine2;
