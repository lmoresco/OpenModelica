within ThermoSysPro.Examples.SimpleExamples;
model TestDynamicCheckValve 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram,
    Window(
      x=0.28,
      y=0.03,
      width=0.5,
      height=0.6));
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP sourceP1 
                                     annotation (extent=[-40,40; -20,60]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP puitsP1(
                                   P0=6e5) annotation (extent=[40,40; 60,60]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Pulse pulse(
    amplitude=6e5,
    width=50,
    period=100,
    offset=3e5) annotation (extent=[-80,40; -60,60]);
  ThermoSysPro.WaterSteam.PressureLosses.DynamicCheckValve checkValve3(J=10) 
    annotation (extent=[0,40; 20,60]);
equation 
  connect(sourceP1.C,checkValve3. C1) 
    annotation (points=[-20,50; 0,50],     style(color=3, rgbcolor={0,0,255}));
  connect(checkValve3.C2,puitsP1. C) 
    annotation (points=[20,49.8; 30,49.8; 30,50; 40,50],
                                        style(color=3, rgbcolor={0,0,255}));
  connect(pulse.y, sourceP1.IPressure) annotation (points=[-59,50; -35,50],
      style(
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
end TestDynamicCheckValve;
