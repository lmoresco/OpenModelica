within ThermoSysPro.Examples.SimpleExamples;
model TestSimpleEvaporatorWaterSteamFlueGases 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink puits_Eau 
                                          annotation (extent=[64,-17; 84,3]);
  
  annotation (Diagram);
  ThermoSysPro.MultiFluids.HeatExchangers.SimpleEvaporatorWaterSteamFlueGases 
    EchangeurEfficacite(Kdpf=1, Kdpe=1) 
                annotation (extent=[-44,-35; 44,21]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ source_Eau(
    P0=65.27e5,
    Q0=38.92/3.6,
    h0=1242080) 
              annotation (extent=[-84,-17; -64,3]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ Source_Fumees(
    Xso2=0,
    P0=1.01e5,
    Q0=86.7429,
    T0=750.54,
    Xco2=0.04725,
    Xh2o=0.051874,
    Xo2=0.15011) 
    annotation (extent=[-34,45; 0,75],      rotation=0);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink Puits_Fumees 
    annotation (extent=[32,-85; 0,-55],   rotation=180);
equation 
  connect(Source_Fumees.C, EchangeurEfficacite.Cfg1) annotation (points=[0,60;
        0,18.2], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EchangeurEfficacite.Cfg2, Puits_Fumees.C) annotation (points=[0,-32.2;
        0,-70; 0.32,-70], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(EchangeurEfficacite.Cws2, puits_Eau.C) annotation (points=[44,-7; 54,
        -7; 54,-7; 64,-7], style(color=3, rgbcolor={0,0,255}));
  connect(EchangeurEfficacite.Cws1, source_Eau.C) 
    annotation (points=[-44,-7; -54,-7; -54,-7; -64,-7]);
end TestSimpleEvaporatorWaterSteamFlueGases;
