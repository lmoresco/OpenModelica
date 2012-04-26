within ThermoSysPro.Examples.SimpleExamples;
model TestSteamEngine 
  
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
  ThermoSysPro.WaterSteam.Machines.SteamEngine steamEngine1 
    annotation (extent=[-60,60; -40,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=100000) 
    annotation (extent=[-20,60; 0,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=16e5) annotation (extent=[-100,60; -80,80]);
equation 
  connect(sourceP.C, steamEngine1.C1) 
    annotation (points=[-80,70; -57,70],   style(color=3, rgbcolor={0,0,255}));
  connect(steamEngine1.C2, puitsP.C) 
    annotation (points=[-43,70; -31.5,70; -31.5,70; -20,70],
                                           style(color=3, rgbcolor={0,0,255}));
end TestSteamEngine;
