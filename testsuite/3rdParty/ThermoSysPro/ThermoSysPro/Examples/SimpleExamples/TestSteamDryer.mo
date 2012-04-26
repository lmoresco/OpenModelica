within ThermoSysPro.Examples.SimpleExamples;
model TestSteamDryer 
  
  annotation (Diagram);
  ThermoSysPro.WaterSteam.Junctions.SteamDryer steamDryer(
    eta=1,
    P(start=100e5),
    h(start=3e6))           annotation (extent=[-20,20; 0,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceQ(h0=3000000) 
    annotation (extent=[-100,20; -80,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss2 annotation (extent=[-60,20; -40,40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkP(P0=100e5) 
    annotation (extent=[60,20; 80,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss1 annotation (extent=[20,20; 40,40]);
  ThermoSysPro.WaterSteam.PressureLosses.SingularPressureLoss 
    singularPressureLoss3(K=2.e-3) 
                          annotation (extent=[0,-20; 20,0]);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink sink 
    annotation (extent=[40,-20; 60,0]);
equation 
  connect(sourceQ.C,singularPressureLoss2. C1) annotation (points=[-80,30; -60,
        30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(singularPressureLoss1.C2,sinkP. C) 
    annotation (points=[40,30; 60,30], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss3.C2,sink. C) 
    annotation (points=[20,-10; 40,-10], style(color=3, rgbcolor={0,0,255}));
  connect(singularPressureLoss2.C2, steamDryer.Cev) annotation (points=[-40,30; -30,
        30; -30,34; -19.9,34], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(steamDryer.Csv, singularPressureLoss1.C1) annotation (points=[-0.1,34;
        10,34; 10,30; 20,30], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(steamDryer.Csl, singularPressureLoss3.C1) annotation (points=[-9.9,20;
        -10,20; -10,-10; 0,-10], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
end TestSteamDryer;
