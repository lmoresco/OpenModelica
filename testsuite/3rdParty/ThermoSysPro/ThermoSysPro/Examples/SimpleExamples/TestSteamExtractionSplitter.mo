within ThermoSysPro.Examples.SimpleExamples;
model TestSteamExtractionSplitter 
  
  ThermoSysPro.WaterSteam.Junctions.SteamExtractionSplitter 
    steamExtractionSplitter(alpha=0.9) 
                            annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ(h0=2600000) 
    annotation (extent=[-100,20; -80,40]);
  annotation (Diagram);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[-60,20; -40,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP(P0=100e5) 
    annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[20,20; 40,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss3(K=2.e-3) 
                          annotation (extent=[0,-20; 20,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkQ sink(Q0=10) 
    annotation (extent=[40,-20; 60,0]);
equation 
  connect(sourceQ.C, singularPressureLoss2.C1) annotation (points=[-80,30; -60,
        30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(singularPressureLoss2.C2, steamExtractionSplitter.Ce) annotation (
      points=[-40,30; -20.3,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(steamExtractionSplitter.Cs, singularPressureLoss1.C1) annotation (
      points=[0.3,30; 20,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(steamExtractionSplitter.Cex, singularPressureLoss3.C1) annotation (
      points=[-6,20; -6,-10; 0,-10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(singularPressureLoss1.C2, sinkP.C) 
    annotation (points=[40,30; 60,30], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss3.C2, sink.C) 
    annotation (points=[20,-10; 40,-10], style(color=3, rgbcolor={0,0,255}));
end TestSteamExtractionSplitter;
