within ThermoSysPro.Examples.SimpleExamples;
model TestStaticCentrifugalPump1 
  
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
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump StaticCentrifugalPump1(
      fixed_rot_or_power=2, MPower=0.15e6) 
    annotation (extent=[-20,20; 0,40]);
  WaterSteam.BoundaryConditions.SourceP sourceP 
    annotation (extent=[-80,20; -60,40]);
  WaterSteam.BoundaryConditions.SinkP sinkP(P0=600000) 
    annotation (extent=[40,20; 60,40]);
equation 
  connect(sourceP.C, StaticCentrifugalPump1.C1) annotation (points=[-60,30; -20,
        30], style(
      color=3,
      rgbcolor={0,0,255},
      smooth=0));
  connect(StaticCentrifugalPump1.C2, sinkP.C) annotation (points=[0,30; 40,30],
      style(
      color=3,
      rgbcolor={0,0,255},
      smooth=0));
end TestStaticCentrifugalPump1;
