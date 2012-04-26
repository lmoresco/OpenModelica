within ThermoSysPro.Examples.SimpleExamples;
model TestStaticWaterWaterExchangerDTorWorEff 
  
  annotation (Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceWaterSteam_FF(
    C(P(start=219.E5)),
    Q0=481.07,
    h0=1067.9E3) 
    annotation (extent=[-60,-20; -40,0],       rotation=0);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkWaterSteam_FF(
    P0=217.68E5) 
    annotation (extent=[20,-20; 40,0],         rotation=0);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceQ sourceWaterSteam_FC(
    C(P(start=24E5)),
    Q0=23.377,
    h0=3420.3E3) 
    annotation (extent=[-20,20; -40,40],       rotation=180);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP sinkWaterSteam_FC(
    P0=24.13E5) 
    annotation (extent=[-2,20; 20,40],         rotation=0);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchangerDTorWorEff 
    exchangerWaterSteamDTorWorEFF(
    EffEch=1,
    Kf=597.832,
    Ec(P(start=23e5)),
    Ef(P(start=219E5)),
    exchanger_type=3)   annotation (extent=[-20,-20; 0,0]);
equation 
  connect(sourceWaterSteam_FF.C, exchangerWaterSteamDTorWorEFF.Ef) 
    annotation (points=[-40,-10; -20,-10], style(color=3, rgbcolor={0,0,255}));
  connect(exchangerWaterSteamDTorWorEFF.Sf, sinkWaterSteam_FF.C) annotation (
      points=[0,-9.9; 10.2,-9.9; 10.2,-10; 20,-10], style(color=3, rgbcolor={0,
          0,255}));
  connect(sourceWaterSteam_FC.C, exchangerWaterSteamDTorWorEFF.Ec) annotation (
      points=[-20,30; -14,30; -14,-5.9], style(color=3, rgbcolor={0,0,255}));
  connect(exchangerWaterSteamDTorWorEFF.Sc, sinkWaterSteam_FC.C) annotation (
      points=[-6,-5.9; -6,30; -2,30], style(color=3, rgbcolor={0,0,255}));
end TestStaticWaterWaterExchangerDTorWorEff;
