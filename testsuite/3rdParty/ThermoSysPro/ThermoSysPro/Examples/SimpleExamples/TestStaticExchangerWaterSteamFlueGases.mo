within ThermoSysPro.Examples.SimpleExamples;
model TestStaticExchangerWaterSteamFlueGases 
  
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink puits_Eau 
                                          annotation (extent=[60,-10; 80,10]);
  
  annotation (Diagram);
  ThermoSysPro.MultiFluids.HeatExchangers.StaticExchangerWaterSteamFlueGases 
    EchangeurEfficacite(                                                                   EffEch=0.9,
    Kdpf=10,
    Kdpe=100,
    W0=1e6,
    exchanger_conf=1,
    exchanger_type=1) 
                annotation (extent=[-40,-20; 40,20]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ source_Eau(
    P0=4e5,
    h0=170000,
    Q0=15)    annotation (extent=[-80,-10; -60,10]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourcePQ Source_Fumees(
    Xco2=0,
    Xo2=0.233,
    Xso2=0,
    Xh2o=0.01,
    Q0=20,
    T0=700,
    P0=13e5) 
    annotation (extent=[-40,40; -20,60],    rotation=0);
  ThermoSysPro.FlueGases.BoundaryConditions.Sink Puits_Fumees 
    annotation (extent=[40,-60; 20,-40],  rotation=180);
equation 
  connect(source_Eau.C, EchangeurEfficacite.Cws1) annotation (points=[-60,0;
        -40,0], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(EchangeurEfficacite.Cws2, puits_Eau.C) annotation (points=[40,0; 60,0],
      style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(Source_Fumees.C, EchangeurEfficacite.Cfg1) annotation (points=[-20,50;
        0,50; 0,18], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
  connect(Puits_Fumees.C, EchangeurEfficacite.Cfg2) annotation (points=[20.2,
        -50; -0.2,-50; -0.2,-18], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=8));
end TestStaticExchangerWaterSteamFlueGases;
