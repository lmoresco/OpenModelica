within ThermoSysPro.MultiFluids.HeatExchangers;
model SimpleEvaporatorWaterSteamFlueGases 
  "Simple water/steam - flue gases evaporator" 
  parameter Real Kdpf=10 "Flue gases pressure drop coefficient";
  parameter Real Kdpe=10 "Water/steam pressure drop coefficient";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
protected 
  parameter Real eps=1.e-0 "Small number for pressure loss equation";
  
public 
  ThermoSysPro.Units.AbsolutePressure Pef(start=3e5) 
    "Flue gases pressure at the inlet";
  ThermoSysPro.Units.AbsolutePressure Psf(start=2.5e5) 
    "Flue gases pressure at the outlet";
  ThermoSysPro.Units.AbsoluteTemperature Tef(start=600) 
    "Flue gases temperature at the inlet";
  ThermoSysPro.Units.AbsoluteTemperature Tsf(start=400) 
    "Flue gases temperature at the outlet";
  ThermoSysPro.Units.SpecificEnthalpy Hsf(start=3e5) 
    "Flue gases specific enthalpy at the outlet";
  ThermoSysPro.Units.SpecificEnthalpy Hef(start=6e5) 
    "Flue gases specific enthalpy at the inlet";
  Modelica.SIunits.MassFlowRate Qf(start=10) "Flue gases mass flow rate";
  ThermoSysPro.Units.AbsolutePressure Pee(start=2e6) 
    "Water pressure at the inlet";
  ThermoSysPro.Units.AbsolutePressure Pse(start=2e6) 
    "Water pressure at the outlet";
  ThermoSysPro.Units.AbsoluteTemperature Tee(start=400) 
    "Water temperature at the inlet";
  ThermoSysPro.Units.AbsoluteTemperature Tse(start=450) 
    "Water temperature at the outlet";
  ThermoSysPro.Units.SpecificEnthalpy Hee(start=3e5) 
    "Water specific enthalpy at the inlet";
  ThermoSysPro.Units.SpecificEnthalpy Hse(start=20e5) 
    "Water specific enthalpy at the outlet";
  Modelica.SIunits.MassFlowRate Qe(start=10) "Water mass flow rate";
  Modelica.SIunits.Density rhof(start=0.9) "Flue gases density";
  Modelica.SIunits.Density rhoe(start=700) "Water density";
  Modelica.SIunits.Power W(start=1e8) "Power exchanged";
  
  annotation (Diagram(Rectangle(extent=[-100,80; 100,-80], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),
      Text(
        extent=[-30,76; 28,66],
        style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          gradient=2,
          fillColor=9,
          rgbfillColor={175,175,175}),
        string="Flue gases"),
      Polygon(points=[-94,12; -80,12; -80,56; 80,56; 80,12; 92,12; 92,6; 74,6;
            74,50; -74,50; -74,6; -94,6; -94,12], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Polygon(points=[-94,-12; -80,-12; -80,-56; 80,-56; 80,-12; 92,-12; 92,-6;
            74,-6; 74,-50; -74,-50; -74,-6; -94,-6; -94,-12], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Text(
        extent=[-114,28; -48,18],
        style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2,
          gradient=2,
          fillColor=9,
          rgbfillColor={175,175,175}),
        string="Water/Steam"),
      Polygon(points=[-94,3; 90,3; 90,-3; -94,-3; -94,3], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))), Icon(
                      Rectangle(extent=[-100,80; 100,-80], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=8)),
      Polygon(points=[-94,12; -80,12; -80,56; 80,56; 80,12; 92,12; 92,6; 74,6;
            74,50; -74,50; -74,6; -94,6; -94,12], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})),
      Polygon(points=[-92,3; 92,3; 92,-3; -92,-3; -92,3], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Polygon(points=[-94,-12; -80,-12; -80,-56; 80,-56; 80,-12; 92,-12; 92,-6;
            74,-6; 74,-50; -74,-50; -74,-6; -94,-6; -94,-12], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0}))),
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
  ThermoSysPro.WaterSteam.Connectors.FluidOutlet Cws2 
    annotation (extent=[90,-10; 110,10]);
  ThermoSysPro.WaterSteam.Connectors.FluidInlet Cws1 
    annotation (extent=[-110,-10; -90,10]);
  ThermoSysPro.FlueGases.Connectors.FlueGasesInlet Cfg1 
    annotation (extent=[-10,80; 10,100]);
  ThermoSysPro.FlueGases.Connectors.FlueGasesOutlet Cfg2 
    annotation (extent=[-10,-100; 10,-80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proee 
    annotation (extent=[-100,80; -80,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proes 
    annotation (extent=[-52,80; -32,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proem 
    annotation (extent=[-76,80; -56,100]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat vsat 
                                           annotation (extent=[80,80; 100,100]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat lsat 
    annotation (extent=[58,80; 78,100]);
equation 
  /* Flue gases inlet */
  Pef = Cfg1.P;
  Tef = Cfg1.T;
  Qf = Cfg1.Q;
  
  /* Flue gases outlet */
  Psf = Cfg2.P;
  Tsf = Cfg2.T;
  Cfg1.Q = Cfg2.Q;
  
  Cfg2.Xco2 = Cfg1.Xco2;
  Cfg2.Xh2o = Cfg1.Xh2o;
  Cfg2.Xo2  = Cfg1.Xo2;
  Cfg2.Xso2 = Cfg1.Xso2;
  
  /* Water inlet */
  Pee = Cws1.P;
  Hee = Cws1.h;
  Qe = Cws1.Q;
  
  /* Water outlet */
  Pse = Cws2.P;
  Hse = Cws2.h;
  Cws1.Q = Cws2.Q;
  
  /* Flow reversal */
  0 = if (Qe > 0) then Cws1.h - Cws1.h_vol else Cws2.h - Cws2.h_vol;
  
  /* Pressure losses */
  Pef = Psf + Kdpf*ThermoSysPro.Functions.ThermoSquare(
                                                      Qf, eps)/rhof;
  Pee = Pse + Kdpe*ThermoSysPro.Functions.ThermoSquare(
                                                      Qe, eps)/rhoe;
  
  /* Power exchanged */
  W = Qf*(Hef - Hsf);
  W = Qe*(Hse - Hee);
  
  /* Flue gases specific ethalpy at the inlet */
  Hef =  ThermoSysPro.Properties.FlueGases.FlueGases_h(Pef, Tef, Cfg1.Xco2, Cfg1.Xh2o, Cfg1.Xo2, Cfg1.Xso2);
  
  /* Flue gases specific ethalpy at the outlet */
  Hsf =  ThermoSysPro.Properties.FlueGases.FlueGases_h(Psf, Tsf, Cfg1.Xco2, Cfg1.Xh2o, Cfg1.Xo2, Cfg1.Xso2);
  
  /* Flue gases density */
  rhof = ThermoSysPro.Properties.FlueGases.FlueGases_rho(Pef, Tef, Cfg1.Xco2, Cfg1.Xh2o, Cfg1.Xo2, Cfg1.Xso2);
  
  /* Water/steam thermodynamic properties */
  proee = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pee, Hee, mode);
  Tee = proee.T;
  
  proem = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph((Pee + Pse)/2, (Hee + Hse)/2, mode);
  rhoe = proem.d;
  
  proes = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pse, Hse, mode);
  Tse = proes.T;
  
  (lsat,vsat) = ThermoSysPro.Properties.WaterSteam.IF97.Water_sat_P(Pse);
  Hse= vsat.h;
  
end SimpleEvaporatorWaterSteamFlueGases;
