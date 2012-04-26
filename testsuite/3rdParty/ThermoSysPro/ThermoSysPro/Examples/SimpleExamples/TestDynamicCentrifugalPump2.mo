within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicCentrifugalPump2 
  
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
  ThermoSysPro.InstrumentationAndControl.Blocks.Logique.Pulse Pulse1(
                                          width=200, period=400) 
    annotation (extent=[-60,-60; -40,-40]);
  ThermoSysPro.ElectroMechanics.Machines.SynchronousMotor Motor1 
                                           annotation (extent=[-40,-80; -20,-60]);
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump 
    DynamicCentrifugalPump1(         continuous_flow_reversal=true,
    J=10,
    Cf0=1000) 
    annotation (extent=[40,-40; 20,-20]);
  ThermoSysPro.WaterSteam.Volumes.Tank Tank(
    ze2=10,
    zs2=10) 
    annotation (extent=[20,20; 40,40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve 
    annotation (extent=[-80,20; -60,40]);
  ThermoSysPro.ElectroMechanics.Machines.Shaft Shaft1 
    annotation (extent=[0,-80; 20,-60]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Rampe rampe(
    Starttime=200,
    Duration=100,
    Initialvalue=0.5,
    Finalvalue=0) annotation (extent=[-100,60; -80,80]);
  ThermoSysPro.WaterSteam.PressureLosses.DynamicReliefValve dynamicReliefValve(
    dPOuvert=7e5,
    dPFerme=6e5,
    Cmin=1.e-20)                  annotation (extent=[-20,-10; 0,10]);
  ThermoSysPro.WaterSteam.Volumes.VolumeA volumeA 
    annotation (extent=[0,-20; -20,-40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP 
    annotation (extent=[20,-10; 40,10]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve1 
    annotation (extent=[-20,32; 0,52]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP 
    annotation (extent=[-60,26; -40,46]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(k=
        15) annotation (extent=[-60,80; -40,100]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Math.Feedback feedback 
    annotation (extent=[-20,80; 0,100]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Continu.PIsat pIsat 
    annotation (extent=[20,80; 40,100]);
equation 
  connect(Pulse1.yL, Motor1.marche) 
    annotation (points=[-39,-50; -30,-50; -30,-65.6]);
  connect(Motor1.C, Shaft1.C1) 
    annotation (points=[-19.8,-70; -1,-70]);
  connect(DynamicCentrifugalPump1.M, Shaft1.C2) 
    annotation (points=[30,-41; 30,-70; 21,-70]);
  connect(rampe.y, Valve.Ouv) annotation (points=[-79,70; -70,70; -70,41]);
  connect(DynamicCentrifugalPump1.C2, volumeA.Ce1) annotation (points=[20,-30.2;
        10,-30.2; 10,-30; 0,-30], style(color=3, rgbcolor={0,0,255}));
  connect(dynamicReliefValve.C1, volumeA.Cs2) 
    annotation (points=[-10,-9.8; -10,-20]);
  connect(dynamicReliefValve.C2, sinkP.C) annotation (points=[0,-0.2; 10,-0.2;
        10,0; 20,0], style(color=3, rgbcolor={0,0,255}));
  connect(volumeA.Cs1, Valve.C1) annotation (points=[-20,-30; -100,-30; -100,24;
        -80,24], style(color=3, rgbcolor={0,0,255}));
  connect(Valve.C2, Tank.Ce2) 
    annotation (points=[-60,24; 20,24], style(color=3, rgbcolor={0,0,255}));
  connect(Tank.Cs2, DynamicCentrifugalPump1.C1) annotation (points=[40,24; 80,
        24; 80,-30; 40,-30], style(color=3, rgbcolor={0,0,255}));
  connect(Valve1.C2, Tank.Ce1) 
    annotation (points=[0,36; 20,36], style(color=3, rgbcolor={0,0,255}));
  connect(sourceP.C, Valve1.C1) 
    annotation (points=[-40,36; -20,36], style(color=3, rgbcolor={0,0,255}));
  connect(constante.y, feedback.u1) annotation (points=[-39,90; -21,90]);
  connect(Tank.yLevel, feedback.u2) 
    annotation (points=[41,32; 60,32; 60,70; -10,70; -10,79]);
  connect(feedback.y, pIsat.u) annotation (points=[1,90; 19,90]);
  connect(pIsat.y, Valve1.Ouv) 
    annotation (points=[41,90; 80,90; 80,60; -10,60; -10,53]);
end TestDynamicCentrifugalPump2;
