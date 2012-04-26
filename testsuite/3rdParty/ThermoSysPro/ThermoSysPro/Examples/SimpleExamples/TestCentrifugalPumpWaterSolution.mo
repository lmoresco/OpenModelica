within ThermoSysPro.Examples.SimpleExamples;
model TestCentrifugalPumpWaterSolution 
  
  ThermoSysPro.WaterSolution.BoundaryConditions.RefP refP 
    annotation (extent=[-100,0; -80,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(
                                                 k=2.e5) 
    annotation (extent=[-100,60; -80,80]);
  ThermoSysPro.WaterSolution.Machines.StaticCentrifugalPump pump 
    annotation (extent=[-20,0; 0,20]);
  ThermoSysPro.WaterSolution.LoopBreakers.LoopBreakerQ loopBreakerQ 
    annotation (extent=[10,0; 30,20]);
  ThermoSysPro.WaterSolution.LoopBreakers.LoopBreakerT loopBreakerH 
    annotation (extent=[40,0; 60,20]);
  ThermoSysPro.WaterSolution.BoundaryConditions.RefT refT 
    annotation (extent=[-70,0; -50,20]);
  ThermoSysPro.WaterSolution.PressureLosses.SingularPressureLoss 
    lumpedStraightPipe annotation (extent=[0,-40; -20,-20]);
  ThermoSysPro.WaterSolution.LoopBreakers.LoopBreakerXh2o loopBreakerXh20_1 
    annotation (extent=[70,0; 90,20]);
  ThermoSysPro.WaterSolution.BoundaryConditions.RefXh2o refXh2o 
    annotation (extent=[-44,0; -24,20]);
equation 
  connect(loopBreakerQ.Cs, loopBreakerH.Ce) annotation (points=[30,10; 40,10],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(refP.C2, refT.C1) annotation (points=[-80,10; -70,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(constante.y, refP.IPressure) annotation (points=[-79,70; -60,70; -60,
        34; -90,34; -90,21], style(
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  annotation (Diagram);
  connect(pump.C2, loopBreakerQ.Ce) annotation (points=[0,10; 10,10], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(loopBreakerH.Cs, loopBreakerXh20_1.Ce) annotation (points=[60,10; 70,
        10], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(refT.C2, refXh2o.C1) annotation (points=[-50,10; -44,10], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(refXh2o.C2, pump.C1) annotation (points=[-24,10; -20,10], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(loopBreakerXh20_1.Cs, lumpedStraightPipe.C1) annotation (points=[90,
        10; 100,10; 100,-30; -1,-30], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
  connect(lumpedStraightPipe.C2, refP.C1) annotation (points=[-19,-30; -100,-30;
        -100,10], style(
      color=0,
      rgbcolor={0,0,0},
      fillColor=44,
      rgbfillColor={255,170,170},
      fillPattern=1));
end TestCentrifugalPumpWaterSolution;
