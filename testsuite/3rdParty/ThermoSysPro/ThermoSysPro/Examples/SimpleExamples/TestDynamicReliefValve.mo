within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicReliefValve 
  
  ThermoSysPro.WaterSteam.PressureLosses.DynamicReliefValve ReliefValve(
    dPOuvert=2.e5,
    dPFerme=1.9e5,
    Cmin=0,
    Cvmax=1000,
    D=1,
    m=1) annotation(extent=[0, 20; 20, 40]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram,
    Window(
      x=0.1,
      y=0.08,
      width=0.5,
      height=0.6));
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe Pipe2 
                                         annotation(extent=[40, -20; 60, 0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP Sink2 
                                   annotation(extent=[80, -20; 100, 0]);
  ThermoSysPro.WaterSteam.Volumes.Tank Tank(z0=70) annotation(extent=[-100, 0; -80, 20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe Pipe1 
                                         annotation(extent=[-40, -20; -20, 0]);
  ThermoSysPro.WaterSteam.Volumes.VolumeD VolumeD1 
                                     annotation(extent=[0, -20; 20, 0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP Sink1 
                                   annotation(extent=[40, 20; 60, 40]);
equation 
  connect(Pipe2.C2, Sink2.C) 
    annotation(points=[60, -10; 80, -10], style(color=3));
  connect(Tank.Cs2, Pipe1.C1) 
    annotation(points=[-80, 4; -60, 4; -60, -10; -40, -10], style(color=73));
  connect(Pipe1.C2, VolumeD1.Ce) 
    annotation(points=[-20, -10; 0, -10], style(color=73));
  connect(VolumeD1.Cs3, Pipe2.C1) 
    annotation(points=[20, -10; 40, -10], style(color=73));
  connect(ReliefValve.C1, VolumeD1.Cs1) 
                                     annotation(points=[10,20.2; 10,0]);
  connect(ReliefValve.C2, Sink1.C) 
    annotation(points=[20,29.8; 30,29.8; 30,30; 40,30],
                                        style(color=73));
end TestDynamicReliefValve;
