within ThermoSysPro.Examples.SimpleExamples;
model TestStaticCentrifugalPumpWaterSolution 
  
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
    annotation (extent=[-40,60; -20,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Pulse pulse(
    width=200,
    period=500,
    amplitude=1000,
    offset=400) annotation (extent=[-40,0; -20,20]);
  ThermoSysPro.WaterSolution.PressureLosses.SingularPressureLoss 
    singularPressureLossWaterLiBr annotation (extent=[40,30; 60,50]);
  ThermoSysPro.WaterSolution.Machines.StaticCentrifugalPump 
    staticCentrifugalPumpWaterLiBr annotation (extent=[0,30; 20,50]);
  ThermoSysPro.WaterSolution.BoundaryConditions.SourcePQ sourceSolution 
    annotation (extent=[-80,30; -60,50]);
  ThermoSysPro.WaterSolution.BoundaryConditions.Sink sinkSolution 
    annotation (extent=[80,30; 100,50]);
equation 
  connect(pulse.y, staticCentrifugalPumpWaterLiBr.VRotation) annotation (points=
       [-19,10; 10,10; 10,29], style(
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(Pulse1.yL, staticCentrifugalPumpWaterLiBr.commandePompe) annotation (
      points=[-19,70; 10,70; 10,51], style(
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(staticCentrifugalPumpWaterLiBr.C2, singularPressureLossWaterLiBr.C1) 
    annotation (points=[20,40; 30,40; 30,40; 41,40],     style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(sourceSolution.Cs, staticCentrifugalPumpWaterLiBr.C1) 
    annotation (points=[-60,40; 0,40], style(color=0, rgbcolor={0,0,0}));
  connect(singularPressureLossWaterLiBr.C2, sinkSolution.Ce) 
    annotation (points=[59,40; 80,40], style(color=0, rgbcolor={0,0,0}));
end TestStaticCentrifugalPumpWaterSolution;
