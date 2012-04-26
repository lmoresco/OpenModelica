within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicCentrifugalPump 
  
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
    annotation (extent=[-100, -60; -80, -40]);
  ThermoSysPro.ElectroMechanics.Machines.SynchronousMotor Motor1 
                                           annotation (extent=[-80, -80; -60, -60]);
  ThermoSysPro.WaterSteam.Machines.DynamicCentrifugalPump 
    DynamicCentrifugalPump1 
    annotation (extent=[0, -40; -20, -20]);
  ThermoSysPro.WaterSteam.Volumes.Tank Tank(
    ze2=10,
    zs2=10) 
    annotation (extent=[-20, 20; 0, 40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve Valve 
    annotation (extent=[40, 20; 60, 40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1(
                                                  k=0.5) annotation (extent=[0, 60; 20, 80]);
  ThermoSysPro.ElectroMechanics.Machines.Shaft Shaft1 
    annotation (extent=[-40, -80; -20, -60]);
equation 
  connect(Pulse1.yL, Motor1.marche) 
    annotation (points=[-79,-50; -70,-50; -70,-65.6]);
  connect(DynamicCentrifugalPump1.C2, Tank.Ce2) 
    annotation (points=[-20,-30.2; -60,-30.2; -60,24; -20,24], style(color=3));
  connect(Tank.Cs2, Valve.C1) 
    annotation (points=[0, 24; 40, 24], style(color=3));
  connect(Valve.C2, DynamicCentrifugalPump1.C1) 
    annotation (points=[60,24; 80,24; 80,-30; 0,-30],     style(color=3));
  connect(Constante1.y, Valve.Ouv) 
    annotation (points=[21,70; 50,70; 50,41],    style(color=3));
  connect(Motor1.C, Shaft1.C1) 
    annotation (points=[-59.8,-70; -41,-70]);
  connect(DynamicCentrifugalPump1.M, Shaft1.C2) 
    annotation (points=[-10,-41; -10,-70; -19,-70]);
end TestDynamicCentrifugalPump;
