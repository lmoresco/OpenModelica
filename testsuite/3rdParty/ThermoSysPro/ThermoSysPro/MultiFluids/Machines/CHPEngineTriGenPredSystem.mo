within ThermoSysPro.MultiFluids.Machines;
model CHPEngineTriGenPredSystem 
  parameter ThermoSysPro.Units.AbsoluteTemperature Tair=298 
    "Temperature inlet air";
  parameter Real RechFumEff=0.717833 "Flue gases heater efficiency";
  parameter Real RechWaterEff=0.837865 "Water heater efficiency";
  parameter Integer mechanical_efficiency_type=3 "Engine efficiency type" 
                                                         annotation(choices(
    choice=1 "Fixed nominal efficiency",
    choice=2 "Efficiency computed using a linear function Coef_Rm",
    choice=3 "Efficiency computed using the Beau de Rochas Cycle"));
  parameter Real Rmeca_nom=0.40 "Engine nominal efficiency";
  parameter Modelica.SIunits.Power Pnom=5e8 "Engine nominal power";
  
  annotation (Diagram,    Icon(
      Rectangle(extent=[-200,200; 200,-200], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=2,
          thickness=2)),
      Rectangle(extent=[-180,-2; -20,-162],
                                         style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=52,
          rgbfillColor={255,213,170})),
      Polygon(points=[-110,-146; -96,-128; -100,-138; -82,-136; -98,-142; -78,
            -148; -94,-146; -110,-158; -102,-148; -110,-146],
                                   style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=1,
          rgbfillColor={255,0,0})),
      Polygon(points=[-146,-124; -146,-82; -106,-82; -106,-24; -100,-32; -94,
            -24; -94,-82; -52,-82; -52,-124; -146,-124],
                           style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=60,
          rgbfillColor={170,255,170})),
      Polygon(points=[-180,-52; -134,-52; -134,-28; -62,-28; -62,-52; -20,-52;
            -20,-44; -54,-44; -54,-20; -142,-20; -142,-44; -180,-44; -180,-52],
                                                    style(
          pattern=0,
          fillColor=0,
          rgbfillColor={0,0,0})),
      Rectangle(extent=[20,140; 180,38],     style(fillColor=53, rgbfillColor={
              128,255,0})),
      Text(
        extent=[50,142; 146,74],
        style(color=3, rgbcolor={0,0,255}),
        string="E"),
      Rectangle(extent=[-180,140; -20,38],   style(fillColor=54, rgbfillColor={
              72,143,0})),  Line(points=[-160,38; -160,116; -100,72; -100,72;
            -100,72], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Text(
        extent=[-148,146; -52,78],
        style(color=3, rgbcolor={0,0,255}),
        string="E"),        Line(points=[38,38; 38,116; 98,72; 158,120; 158,38],
          style(
          color=0,
          rgbcolor={0,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-20,98; 20,98], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4)),
      Line(points=[-160,-2; -160,38], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4)),
      Line(points=[-40,-2; -40,38], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4)),
      Polygon(points=[-20,-52; 26,-52; 26,-52; 38,-52; 38,-52; 44,-52; 44,38;
            36,38; 36,-44; 18,-44; 18,-44; -20,-44; -20,-52],
                                                    style(
          pattern=0,
          fillColor=0,
          rgbfillColor={0,0,0})),
                            Line(points=[-40,38; -40,116; -100,72; -100,72;
            -100,72], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),  Line(points=[40,38; 40,116; 100,72; 160,120; 160,38],
          style(
          color=0,
          rgbcolor={0,0,0},
          thickness=4,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),  Line(points=[42,38; 42,116; 102,72; 162,120; 162,38],
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
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ Source_water(
    P0=3e5,
    Q0=12.2,
    h0=205e3) 
          annotation (extent=[62,-42; 40,-20]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PDC1(L=0.0001) 
    annotation (extent=[-70,0; -50,-20],   rotation=90);
  ThermoSysPro.WaterSteam.BoundaryConditions.Sink Sink_water 
    annotation (extent=[-22,-72; -44,-48]);
  ThermoSysPro.WaterSteam.PressureLosses.LumpedStraightPipe PDC2(L=0.0001) 
    annotation (extent=[-90,0; -70,-20],   rotation=-90);
  ThermoSysPro.FlueGases.PressureLosses.SingularPressureLoss silencieux(
                                                                   K=20) 
           annotation (extent=[-30,26; -48,6], rotation=-90);
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ Fuel(
    rho=500,
    Hum=0,
    Xh=.25,
    Xs=0,
    Xashes=0,
    Vol=100,
    T0=298,
    Xc=.75,
    Xo=0,
    Xn=0,
    LHV=47.5e6,
    Q0=0.156042) 
             annotation (extent=[62,-18; 40,4]);
  ThermoSysPro.MultiFluids.Machines.AlternatingEngine Engine(
    DPe=1,
    MMg=20,
    Xref=0.3166,
    Xpth=0,
    RV=6.45,
    Kc=1.28,
    Kd=1.33,
    Tsf(fixed=false, start=657),
    exc(fixed=false, start=1.8),
    mechanical_efficiency_type=mechanical_efficiency_type,
    Rmeca_nom=Rmeca_nom,
    Pnom=Pnom) 
    annotation (extent=[-24,-24; 24,24], rotation=90);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchangerDTorWorEff 
    ExchangerWaterWater(
    DPc(start=0.1),
    DPf(start=0.1),
    W(fixed=false, start=463.4e3),
    EffEch=RechWaterEff,
    exchanger_type=3) 
               annotation (extent=[-14,-80; 14,-52], rotation=90);
  ThermoSysPro.MultiFluids.HeatExchangers.StaticExchangerWaterSteamFlueGases 
    ExchangerWaterFlueGases(W(fixed=false, start=1195.9e3), EffEch=RechFumEff) 
             annotation (extent=[-14,54; 14,82], rotation=90);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkG puits_fumees 
    annotation (extent=[58,56; 82,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Pression(
                                       k=1e5) 
    annotation (extent=[120,60; 100,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit_air(
                                        k(fixed=false) = 50) 
    annotation (extent=[20,30; 40,50]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceG Air(
    Xco2=0,
    Xh2o=0.005,
    Xo2=0.23,
    Xso2=0) annotation (extent=[72,8; 48,32]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Temperature(
                                          k=Tair) 
    annotation (extent=[100,0; 80,20]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI outletWaterSteamI 
    annotation (extent=[180,80; 220,120]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI inletWaterSteamI 
    annotation (extent=[-220,80; -180,120]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit_eau(
                                                k=12.2) 
                      annotation (extent=[96,-28; 80,-12]);
equation 
  connect(Sink_water.C, ExchangerWaterWater.Sc) 
    annotation (points=[-22,-60; -12.08,-60; -12.08,-60.4; -5.74,-60.4]);
  connect(ExchangerWaterWater.Ec, PDC1.C2) 
    annotation (points=[-5.74,-71.6; -60,-71.6; -60,-20]);
  connect(PDC2.C1, ExchangerWaterWater.Sf) 
    annotation (points=[-80,-20; -80,-40; -0.14,-40; -0.14,-52]);
  connect(Debit_air.y, Air.IMassFlow) 
    annotation (points=[41,40; 60,40; 60,26]);
  connect(Air.ITemperature, Temperature.y) 
    annotation (points=[60,14; 60,10; 79,10]);
  connect(ExchangerWaterWater.Ef, inletWaterSteamI) 
                                     annotation (points=[9.19104e-016,-80; 0,
        -80; 0,-100; -140,-100; -140,100; -200,100]);
  connect(Debit_eau.y, Source_water.IMassFlow) 
    annotation (points=[79.2,-20; 51,-20; 51,-25.5]);
  connect(puits_fumees.IPressure, Pression.y) 
    annotation (points=[76,68; 90,68; 90,70; 99,70]);
  connect(silencieux.C2, ExchangerWaterFlueGases.Cfg1) annotation (points=[-39,
        26; -39,68; -12.6,68], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cfg2, puits_fumees.C) annotation (points=[12.6,
        67.93; 36.3,67.93; 36.3,68; 58.24,68],      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cws2, outletWaterSteamI) annotation (points=[
        2.63361e-015,82; 2.63361e-015,100; 200,100], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(PDC2.C2, ExchangerWaterFlueGases.Cws1) annotation (points=[-80,0; -80,
        40; 9.19104e-016,40; 9.19104e-016,54], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(PDC1.C1, Engine.Cws2) 
    annotation (points=[-60,0; -60,32; 1.32262e-015,32; 1.32262e-015,21.6]);
  connect(Engine.Cair, Air.C) annotation (points=[21.6,9.6; 34,9.6; 34,20; 48,
        20], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(Engine.Cws1, Source_water.C) 
    annotation (points=[-1.32262e-015,-21.6; -1.32262e-015,-31; 40,-31]);
  connect(silencieux.C1, Engine.Cfg) annotation (points=[-39,6; -40,6; -40,
        1.32262e-015; -21.6,1.32262e-015], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(Engine.Cfuel, Fuel.C) annotation (points=[21.6,-9.6; 32,-9.6; 32,-7;
        40,-7], style(color=0, rgbcolor={0,0,0}));
end CHPEngineTriGenPredSystem;
