within ThermoSysPro.MultiFluids.Boilers;
model BoilerSystem 
  parameter ThermoSysPro.Units.AbsoluteTemperature Tair=300 
    "Source air temperature";
  parameter ThermoSysPro.Units.AbsoluteTemperature Tsf=423.16 
    "Flue gases temperature at the outlet";
  parameter Modelica.SIunits.Power Wloss=1e5 "Thermal losses";
  
  annotation (Diagram,    Icon(
      Rectangle(extent=[-80,100; 60,-100],style(
          color=0,
          rgbcolor={0,0,0},
          pattern=2,
          thickness=2)),
      Rectangle(extent=[-60,80; 40,-80], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Polygon(points=[-12,-46; 0,-50; 10,-38; 14,-24; 12,-10; 10,-2; 6,8; 2,18;
            0,26; -2,32; -6,50; -10,40; -14,32; -18,20; -18,16; -20,12; -22,20;
            -24,22; -26,18; -30,10; -32,4; -36,-4; -38,-14; -40,-24; -40,-32;
            -34,-40; -30,-46; -20,-52; -12,-46],
                                            style(
          color=85,
          rgbcolor={255,0,128},
          fillColor=45,
          rgbfillColor={255,128,0},
          fillPattern=1)),
      Polygon(points=[-20,-28; -18,-24; -14,-22; -10,-22; -6,-24; -4,-26; -2,
            -32; -2,-36; -4,-34; -6,-30; -8,-26; -14,-26; -16,-28; -20,-32; -22,
            -34; -22,-34; -20,-28],
                      style(
          color=42,
          rgbcolor={127,0,0},
          fillColor=42,
          rgbfillColor={127,0,0},
          fillPattern=1))),
    Coordsys(extent=[-80,-100; 60,100],
                                      scale=0.01),
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</html>
", info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  ThermoSysPro.Combustion.BoundaryConditions.FuelSourcePQ Fuel(
    Xashes=.011,
    rho=1000,
    T0=294.45,
    Hum=.50,
    Xc=.2479,
    Xh=.0297,
    Xo=.2088,
    Xn=.0017,
    Xs=.0003,
    LHV=1.5e7,
    Q0=0.0407331) 
    annotation (extent=[-40,-10; -20,10]);
  ThermoSysPro.MultiFluids.Boilers.FossilFuelBoiler Boiler(
    Qsf(start=45.8744, fixed=false),
    mode=1,
    Pee(fixed=false),
    Tf(fixed=false, start=1600),
    Qe(fixed=false, start=6),
    Pse(fixed=false, start=2e5),
    Hee(fixed=false, start=293.1e3),
    Hse(fixed=false, start=377e3),
    Tsf=Tsf,
    Tse(fixed=false, start=363.16),
    exc_air(fixed=false, start=10),
    Wloss=Wloss,
    Wboil(start=1600e3, fixed=false)) 
    annotation (extent=[-14,20; 26,-20],   rotation=-90);
  ThermoSysPro.WaterSteam.Connectors.FluidInletI inletWaterSteamI 
    annotation (extent=[-20,-108; 0,-88]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutletI outletWaterSteamI 
    annotation (extent=[-20,90; 0,110]);
  ThermoSysPro.FlueGases.BoundaryConditions.SinkG SinkFlueGases 
    annotation (extent=[-20,10; -40,30]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante FlueGas_P(
                                        k=1e5) 
    annotation (extent=[-80,10; -60,30]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Air_Q(
                                    k=1) 
    annotation (extent=[-80,-20; -60,0]);
  ThermoSysPro.FlueGases.BoundaryConditions.SourceG SourceAir(
    Xco2=0,
    Xh2o=0.01,
    Xo2=0.233) annotation (extent=[-40,-30; -20,-10]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Air_T(
                                    k=Tair) 
    annotation (extent=[-80,-50; -60,-30]);
equation 
  connect(FlueGas_P.y, SinkFlueGases.IPressure) 
    annotation (points=[-59,20; -35,20]);
  connect(SourceAir.IMassFlow, Air_Q.y) 
    annotation (points=[-30,-15; -30,-10; -59,-10]);
  connect(Air_T.y, SourceAir.ITemperature) 
    annotation (points=[-59,-40; -30,-40; -30,-25]);
  connect(outletWaterSteamI, Boiler.Cws2) annotation (points=[-10,100; -10,40;
        18,40; 18,20], style(color=1, rgbcolor={255,0,0}));
  connect(Boiler.Cws1, inletWaterSteamI) 
    annotation (points=[18,-20; 18,-60; -10,-60; -10,-98]);
  connect(SinkFlueGases.C, Boiler.Cfg) annotation (points=[-20.2,20; -6.4,20],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(SourceAir.C, Boiler.Cair) annotation (points=[-20,-20; -6.4,-20],
      style(
      color=0,
      rgbcolor={0,0,0},
      thickness=4));
  connect(Boiler.Cfuel, Fuel.C) annotation (points=[-10,9.79717e-016; -16,
        9.79717e-016; -16,0; -20,0], style(color=0, rgbcolor={0,0,0}));
end BoilerSystem;
