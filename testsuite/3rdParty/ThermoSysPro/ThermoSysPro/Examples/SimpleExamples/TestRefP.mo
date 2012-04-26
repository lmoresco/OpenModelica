within ThermoSysPro.Examples.SimpleExamples;
model TestRefP 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.RefP refP 
    annotation (extent=[-90,0; -70,20]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante constante(
                                                 k=2.e5) 
    annotation (extent=[-100,60; -80,80]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.Machines.StaticCentrifugalPump pump 
    annotation (extent=[-30,0; -10,20]);
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerQ loopBreakerQ 
    annotation (extent=[0,0; 20,20]);
  ThermoSysPro.WaterSteam.LoopBreakers.LoopBreakerH loopBreakerH 
    annotation (extent=[30,0; 50,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.RefT refT 
    annotation (extent=[-60,0; -40,20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe lumpedStraightPipe 
    annotation (extent=[60,0; 80,20]);
equation 
  connect(refP.C2, refT.C1) annotation (points=[-70,10; -60,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(refT.C2, pump.C1) annotation (points=[-40,10; -30,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(constante.y, refP.IPressure) annotation (points=[-79,70; -60,70; -60,
        34; -80,34; -80,21], style(
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(lumpedStraightPipe.C2, refP.C1) annotation (points=[80,10; 100,10;
        100,-20; -100,-20; -100,10; -90,10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=53,
      rgbfillColor={128,255,0},
      fillPattern=1));
  connect(pump.C2, loopBreakerQ.C1) 
    annotation (points=[-10,10; 0,10], style(color=3, rgbcolor={0,0,255}));
  connect(loopBreakerQ.C2, loopBreakerH.C1) 
    annotation (points=[20,10; 30,10], style(color=3, rgbcolor={0,0,255}));
  connect(loopBreakerH.C2, lumpedStraightPipe.C1) 
    annotation (points=[50,10; 60,10], style(color=3, rgbcolor={0,0,255}));
end TestRefP;
