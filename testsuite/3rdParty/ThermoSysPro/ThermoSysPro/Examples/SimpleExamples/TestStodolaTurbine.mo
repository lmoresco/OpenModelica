within ThermoSysPro.Examples.SimpleExamples;
model TestStodolaTurbine 
  
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
  ThermoSysPro.WaterSteam.Machines.StodolaTurbine stodolaTurbine(fluid=1) 
    annotation (extent=[-60,60; -40,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=45e5) 
    annotation (extent=[-20,60; 0,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=48.e5) annotation (extent=[-100,60; -80,80]);
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump 
    DynamicCentrifugalPump1 
    annotation (extent=[20,-40; 0,-20]);
  ThermoSysPro.WaterSteam.Volumes.Tank Bache1(
                                        ze2=10, zs2=10) 
    annotation (extent=[0,20; 20,40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve VanneReglante1 
    annotation (extent=[60,20; 80,40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1(
                                                  k=0.5) annotation (extent=[20,60;
        40,80]);
equation 
  connect(DynamicCentrifugalPump1.C2,Bache1. Ce2) 
    annotation (points=[0,-30.2; -10,-30; -20,-30; -20,24; 0,24],
                                                               style(color=3));
  connect(Bache1.Cs2,VanneReglante1. C1) 
    annotation (points=[20,24; 60,24],  style(color=3));
  connect(VanneReglante1.C2,DynamicCentrifugalPump1. C1) 
    annotation (points=[80,24; 100,24; 100,-30; 20,-30],  style(color=3));
  connect(Constante1.y,VanneReglante1. Ouv) 
    annotation (points=[41,70; 70,70; 70,41],    style(color=3));
  connect(sourceP.C, stodolaTurbine.Ce) 
    annotation (points=[-80,70; -60.1,70], style(color=3, rgbcolor={0,0,255}));
  connect(stodolaTurbine.Cs, puitsP.C) 
    annotation (points=[-39.9,70; -20,70], style(color=3, rgbcolor={0,0,255}));
  connect(stodolaTurbine.M, DynamicCentrifugalPump1.M) 
    annotation (points=[-50,60; -50,-60; 10,-60; 10,-41], style(smooth=0));
end TestStodolaTurbine;
