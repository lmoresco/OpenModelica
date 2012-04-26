within ThermoSysPro.MultiFluids.Machines;
model CHPEngineBarkantineSystem 
  parameter ThermoSysPro.Units.AbsoluteTemperature Tair=300 
    "Temperature inlet air";
  parameter Real RechFumEff=0.73 "Flue gases heater efficiency";
  parameter Real RechWaterEff=0.9 "Water heater efficiency";
  parameter Integer mechanical_efficiency_type=3 "Engine efficiency type" 
                                                         annotation(choices(
    choice=1 "Fixed nominal efficiency",
    choice=2 "Efficiency computed using a linear function Coef_Rm",
    choice=3 "Efficiency computed using the Beau de Rochas Cycle"));
  parameter Real Rmeca_nom=0.40 "Engine nominal efficiency";
  parameter Modelica.SIunits.Power Pnom=1.4e6 "Engine nominal power";
  
  annotation (Diagram,    Icon(
      Rectangle(extent=[-200,200; 200,-200], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=2,
          thickness=2)),
      Rectangle(extent=[-180,0; -20,-160],
                                         style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=52,
          rgbfillColor={255,213,170})),
      Polygon(points=[-110,-144; -96,-126; -100,-136; -82,-134; -98,-140; -78,
            -146; -94,-144; -110,-156; -102,-146; -110,-144],
                                   style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=1,
          rgbfillColor={255,0,0})),
      Polygon(points=[-146,-122; -146,-80; -106,-80; -106,-22; -100,-30; -94,
            -22; -94,-80; -52,-80; -52,-122; -146,-122],
                           style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=60,
          rgbfillColor={170,255,170})),
      Polygon(points=[-180,-50; -134,-50; -134,-26; -62,-26; -62,-50; -20,-50;
            -20,-42; -54,-42; -54,-18; -142,-18; -142,-42; -180,-42; -180,-50],
                                                    style(
          pattern=0,
          fillColor=0,
          rgbfillColor={0,0,0})),
      Rectangle(extent=[20,142; 180,40],     style(fillColor=53, rgbfillColor={
              128,255,0})),
      Text(
        extent=[50,144; 146,76],
        style(color=3, rgbcolor={0,0,255}),
        string="E"),
      Rectangle(extent=[-180,142; -20,40],   style(fillColor=54, rgbfillColor={
              72,143,0})),  Line(points=[-160,40; -160,118; -100,74; -100,74;
            -100,74], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Text(
        extent=[-148,148; -52,80],
        style(color=3, rgbcolor={0,0,255}),
        string="E"),        Line(points=[38,40; 38,118; 98,74; 158,122; 158,40],
          style(
          color=0,
          rgbcolor={0,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-20,100; 20,100], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4)),
      Line(points=[-160,0; -160,40], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4)),
      Line(points=[-40,0; -40,40], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4)),
      Polygon(points=[-20,-50; 26,-50; 26,-50; 38,-50; 38,-50; 44,-50; 44,40;
            36,40; 36,-42; 18,-42; 18,-42; -20,-42; -20,-50],
                                                    style(
          pattern=0,
          fillColor=0,
          rgbfillColor={0,0,0})),
                            Line(points=[-40,40; -40,118; -100,74; -100,74;
            -100,74], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),  Line(points=[40,40; 40,118; 100,74; 160,122; 160,40],
          style(
          color=0,
          rgbcolor={0,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),  Line(points=[42,40; 42,118; 102,74; 162,122; 162,40],
          style(
          color=0,
          rgbcolor={0,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))),
    Coordsys(extent=[-200,-200; 200,200], scale=0.1),
    DymolaStoredErrors,
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Guillaume Larrignon</li>
<li>
    Bruno Péchiné</li>
</html>
", info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ Fuel(
    Hum=0,
    Xh=.25,
    Xs=0,
    Xashes=0,
    Vol=100,
    Xc=.75,
    Xo=0,
    Xn=0,
    T0=299,
    P0=2.25e5,
    rho=0.72,
    LHV=48e6,
    Q0=0.0727958) 
             annotation (extent=[62,-26; 38,-2]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ Source_water(
    P0=3e5,
    h0=293e3,
    Q0=11.8) 
          annotation (extent=[62,-46; 40,-24]);
  ThermoSysPro.MultiFluids.Machines.AlternatingEngine Engine(
    DPe=1,
    MMg=20,
    Kd=1.33,
    Wcomb(fixed=false, start=3.4942e6),
    exc(fixed=false, start=1.8),
    RV=6.45,
    Kc=1.28,
    Xpth=0.01,
    Xref=0.2896,
    Tsf(fixed=false, start=815),
    Wmeca(fixed=false, start=1400e3),
    mechanical_efficiency_type=mechanical_efficiency_type,
    Rmeca_nom=Rmeca_nom,
    Pnom=Pnom) 
    annotation (extent=[-24,-24; 24,24], rotation=90);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchangerDTorWorEff 
    ExchangerWaterWater(
    EffEch=RechWaterEff, exchanger_type=3) 
               annotation (extent=[14,-52; -14,-80],rotation=-90);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PDC1(L=0.0001) 
    annotation (extent=[-70,0; -50,-20],   rotation=90);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink M1_puits_eau 
    annotation (extent=[-20,-72; -42,-48]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PDC2(L=0.0001) 
    annotation (extent=[-90,0; -70,-20],   rotation=-90);
  ThermoSysPro.MultiFluids.HeatExchangers.StaticExchangerWaterSteamFlueGases 
    ExchangerWaterFlueGases(Tsf(fixed=false, start=363), EffEch=RechFumEff) 
             annotation (extent=[-14,56; 14,84],rotation=-270);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss silencieux(
                                                                   K=20) 
           annotation (extent=[-30,26; -48,6], rotation=-90);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI outletWaterSteamI 
    annotation (extent=[180,80; 220,120]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI inletWaterSteamI 
    annotation (extent=[-220,80; -180,120]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkG M_puits_fumees 
    annotation (extent=[58,58; 82,82]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Pression(
                                       k=1e5) 
    annotation (extent=[120,60; 100,80]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceG M_Air(
    Xco2=0,
    Xh2o=0.005,
    Xo2=0.23,
    Xso2=0) annotation (extent=[64,2; 40,26]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Temperature(
                                          k=Tair) 
    annotation (extent=[100,-10; 80,10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante DebitAir(
                                       k=50) 
    annotation (extent=[20,30; 40,50]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit_eau(
                                   k=11.8) 
                      annotation (extent=[96,-34; 80,-18]);
equation 
  connect(ExchangerWaterWater.Ef, inletWaterSteamI) 
    annotation (points=[-9.19104e-016,-80; 0,-80; 0,-100; -140,-100; -140,100;
        -200,100]);
  connect(M1_puits_eau.C, ExchangerWaterWater.Sc) 
    annotation (points=[-20,-60; -13.04,-60; -13.04,-60.4; -5.74,-60.4]);
  connect(PDC2.C1, ExchangerWaterWater.Sf) 
    annotation (points=[-80,-20; -80,-40; -0.14,-40; -0.14,-52]);
  connect(PDC1.C2, ExchangerWaterWater.Ec) 
                                   annotation (points=[-60,-20; -60,-71.6;
        -5.74,-71.6], style(color=3, rgbcolor={0,0,255}));
  connect(Pression.y, M_puits_fumees.IPressure) 
    annotation (points=[99,70; 76,70]);
  connect(DebitAir.y, M_Air.IMassFlow) 
    annotation (points=[41,40; 52,40; 52,20]);
  connect(M_Air.ITemperature, Temperature.y) 
    annotation (points=[52,8; 52,0; 79,0]);
  connect(Source_water.IMassFlow, Debit_eau.y) 
    annotation (points=[51,-29.5; 51,-26; 79.2,-26]);
  connect(silencieux.C2, ExchangerWaterFlueGases.Cfg1) annotation (points=[-39,
        26; -39,70; -12.6,70], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cfg2, M_puits_fumees.C) annotation (points=[12.6,
        69.93; 35.3,69.93; 35.3,70; 58.24,70],      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cws2, outletWaterSteamI) annotation (points=[
        -7.95401e-016,84; 0,84; 0,100; 200,100], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(PDC2.C2, ExchangerWaterFlueGases.Cws1) annotation (points=[-80,0; -80,
        48; 4.34812e-015,48; 4.34812e-015,56], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(silencieux.C1, Engine.Cfg) annotation (points=[-39,6; -40,6; -40,
        1.32262e-015; -21.6,1.32262e-015], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(Engine.Cws1, Source_water.C) 
    annotation (points=[-1.32262e-015,-21.6; -1.32262e-015,-35; 40,-35]);
  connect(Engine.Cair, M_Air.C) annotation (points=[21.6,9.6; 32,9.6; 32,14; 40,
        14], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(PDC1.C1, Engine.Cws2) 
    annotation (points=[-60,0; -60,32; 1.32262e-015,32; 1.32262e-015,21.6]);
  connect(Engine.Cfuel, Fuel.C) annotation (points=[21.6,-9.6; 32,-9.6; 32,-14;
        38,-14], style(color=0, rgbcolor={0,0,0}));
end CHPEngineBarkantineSystem;
