within ThermoSysPro.Examples.SimpleExamples;
model TestStaticCentrifugalPump 
  
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
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump StaticCentrifugalPump1 
    annotation (extent=[0, -40; -20, -20]);
  ThermoSysPro.WaterSteam.Volumes.Tank Bache1(
                                        ze2=10, zs2=10) 
    annotation (extent=[-20, 20; 0, 40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve VanneReglante1 
    annotation (extent=[40, 20; 60, 40]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1(
                                                  k=0.5) annotation (extent=[0, 60; 20, 80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Pulse pulse(
    width=200,
    period=500,
    amplitude=1400,
    offset=0)   annotation (extent=[-40,-70; -20,-50]);
equation 
  connect(StaticCentrifugalPump1.C2, Bache1.Ce2) 
    annotation (points=[-20,-30; -60,-30; -60,24; -20,24],     style(color=3));
  connect(Bache1.Cs2, VanneReglante1.C1) 
    annotation (points=[0, 24; 40, 24], style(color=3));
  connect(VanneReglante1.C2, StaticCentrifugalPump1.C1) 
    annotation (points=[60,24; 80,24; 80,-30; 0,-30],     style(color=3));
  connect(Constante1.y, VanneReglante1.Ouv) 
    annotation (points=[21,70; 50,70; 50,41],    style(color=3));
  connect(pulse.y, StaticCentrifugalPump1.rpm_or_mpower) 
    annotation (points=[-19,-60; -10,-60; -10,-41], style(smooth=0));
end TestStaticCentrifugalPump;
