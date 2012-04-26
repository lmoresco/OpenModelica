within ThermoSysPro.MultiFluids.Machines;
model CHPEngineTrigenParamSystem 
  parameter ThermoSysPro.Units.AbsoluteTemperature Tair=298 
    "Temperature inlet air";
  parameter Real RechFumEff=0.725576 "Flue gases heater efficiency";
  parameter Real RechWaterEff=0.910767 "Water heater efficiency";
  parameter Integer mechanical_efficiency_type=3 "Engine efficiency type" 
                                                         annotation(choices(
    choice=1 "Fixed nominal efficiency",
    choice=2 "Efficiency computed using a linear function Coef_Rm",
    choice=3 "Efficiency computed using the Beau de Rochas Cycle"));
  parameter Real Rmeca_nom=0.40 "Engine nominal efficiency ";
  parameter Modelica.SIunits.Power Pnom=5e8 "Engine nominal power";
  
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
  ThermoSysPro.WaterSteam.BoundaryConditions.SourcePQ Source_water(
    P0=3e5,
    Q0=12.2,
    h0=215e3) 
          annotation (extent=[62,-42; 40,-20]);
  WaterSteam.PressureLosses.LumpedStraightPipe PDC1(  L=0.0001) 
    annotation (extent=[-70,0; -50,-20],   rotation=90);
  WaterSteam.BoundaryConditions.SinkPQ Sink_water 
    annotation (extent=[-18,-72; -40,-48]);
  WaterSteam.PressureLosses.LumpedStraightPipe PDC2(  L=0.0001) 
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
             annotation (extent=[62,-20; 40,2]);
  ThermoSysPro.MultiFluids.HeatExchangers.StaticExchangerWaterSteamFlueGases 
    ExchangerWaterFlueGases(
    W(fixed=false, start=1195.9e3),
    EffEch=RechFumEff) 
             annotation (extent=[-14,54; 14,82], rotation=90);
  ThermoSysPro.WaterSteam.HeatExchangers.StaticWaterWaterExchangerDTorWorEff 
    ExchangerWaterWater(
    DPc(start=0.1),
    DPf(start=0.1),
    W(fixed=false, start=463.4e3),
    Tsf(fixed=false, start=364.186),
    exchanger_type=3,
    EffEch=RechWaterEff) 
               annotation (extent=[-14,-80; 14,-52], rotation=90);
  ThermoSysPro.MultiFluids.Machines.AlternatingEngine Engine(
    MMg=20,
    Xref=0.3166,
    Xpth=0,
    RV=6.45,
    Kc=1.28,
    Kd=1.33,
    Tsf(fixed=false, start=657),
    exc(fixed=false, start=1.8),
    DPe=1,
    mechanical_efficiency_type=mechanical_efficiency_type,
    Rmeca_nom=Rmeca_nom,
    Pnom=Pnom) 
    annotation (extent=[-24,-24; 24,24], rotation=90);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit_eau(
                                                k=12.2) 
                      annotation (extent=[96,-28; 80,-12]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkG M_puits_fumees 
    annotation (extent=[38,56; 62,80]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Pression(
                                       k=1e5) 
    annotation (extent=[100,58; 80,78]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Debit_air(
                                                k=50) 
    annotation (extent=[20,30; 40,50]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceG Air(
    Xco2=0,
    Xh2o=0.005,
    Xo2=0.23,
    Xso2=0) annotation (extent=[64,8; 40,32]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Temperature(
                                          k=Tair) 
    annotation (extent=[100,0; 80,20]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI outletWaterSteamI 
    annotation (extent=[180,80; 220,120]);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI inletWaterSteamI 
    annotation (extent=[-220,80; -180,120]);
equation 
  connect(ExchangerWaterWater.Ef, inletWaterSteamI) 
                                         annotation (points=[9.19104e-016,-80;
        9.19104e-016,-100; -140,-100; -140,100; -200,100],
                                           style(
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(Sink_water.C, ExchangerWaterWater.Sc) 
                                       annotation (points=[-18,-60; -14.08,-60;
        -14.08,-60.4; -5.74,-60.4],       style(
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(PDC1.C2, ExchangerWaterWater.Ec) 
                                   annotation (points=[-60,-20; -60,-71.6;
        -5.74,-71.6], style(
      color=3,
      rgbcolor={0,0,255},
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(PDC2.C1, ExchangerWaterWater.Sf) 
                                   annotation (points=[-80,-20; -80,-40; -0.14,
        -40; -0.14,-52],   style(
      fillColor=6,
      rgbfillColor={255,255,0},
      fillPattern=1));
  connect(Debit_air.y, Air.IMassFlow) 
    annotation (points=[41,40; 52,40; 52,26]);
  connect(Air.ITemperature, Temperature.y) 
    annotation (points=[52,14; 52,10; 79,10]);
  connect(M_puits_fumees.IPressure, Pression.y) 
    annotation (points=[56,68; 68,68; 68,68; 79,68]);
  connect(Source_water.IMassFlow, Debit_eau.y) 
    annotation (points=[51,-25.5; 51,-20; 79.2,-20]);
  connect(silencieux.C2, ExchangerWaterFlueGases.Cfg1) annotation (points=[-39,
        26; -40,26; -40,68; -12.6,68], style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cfg2, M_puits_fumees.C) annotation (points=[12.6,
        67.93; 26.3,67.93; 26.3,68; 38.24,68],      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4,
      fillColor=71,
      rgbfillColor={85,170,255},
      fillPattern=8));
  connect(ExchangerWaterFlueGases.Cws2, outletWaterSteamI) annotation (points=[
        2.63361e-015,82; 0,82; 0,100; 200,100], style(
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
  connect(Engine.Cair, Air.C) annotation (points=[21.6,9.6; 30,9.6; 30,20; 40,
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
  connect(PDC1.C1, Engine.Cws2) 
    annotation (points=[-60,0; -60,30; 1.32262e-015,30; 1.32262e-015,21.6]);
  connect(Engine.Cfuel, Fuel.C) annotation (points=[21.6,-9.6; 30.8,-9.6; 30.8,
        -9; 40,-9], style(color=0, rgbcolor={0,0,0}));
end CHPEngineTrigenParamSystem;
