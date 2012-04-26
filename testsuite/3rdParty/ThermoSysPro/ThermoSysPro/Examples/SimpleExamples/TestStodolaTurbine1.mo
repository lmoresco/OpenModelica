within ThermoSysPro.Examples.SimpleExamples;
model TestStodolaTurbine1 
  
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
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP(                 mode=0, P0=45e5) 
    annotation (extent=[-20,60; 0,80]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=65e5) annotation (extent=[-100,60; -80,80]);
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump 
    DynamicCentrifugalPump1(                                                      C2(P(
          start=3.e5)), Q(fixed=true, start=50)) 
    annotation (extent=[20,-40; 40,-20]);
  ThermoSysPro.ElectroMechanics.Machines.Shaft Shaft1 
    annotation (extent=[-20,-90; 0,-70]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1(                 mode=0, P0(fixed=false) = 45e5) 
    annotation (extent=[60,-40; 80,-20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1(
    h0=3.e6,
    option_temperature=2,
    mode=2,
    P0=10e5) annotation (extent=[-20,-40; 0,-20]);
equation 
  connect(Shaft1.C2, DynamicCentrifugalPump1.M) 
    annotation (points=[1,-80; 30,-80; 30,-41]);
  connect(stodolaTurbine.M, Shaft1.C1) 
    annotation (points=[-50,60; -50,-80; -21,-80]);
  connect(sourceP1.C, DynamicCentrifugalPump1.C1) 
    annotation (points=[0,-30; 20,-30], style(color=3, rgbcolor={0,0,255}));
  connect(DynamicCentrifugalPump1.C2, puitsP1.C) annotation (points=[40,-30.2;
        50,-30.2; 50,-30; 60,-30], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, stodolaTurbine.Ce) 
    annotation (points=[-80,70; -60.1,70], style(color=3, rgbcolor={0,0,255}));
  connect(stodolaTurbine.Cs, puitsP.C) 
    annotation (points=[-39.9,70; -20,70], style(color=3, rgbcolor={0,0,255}));
end TestStodolaTurbine1;
