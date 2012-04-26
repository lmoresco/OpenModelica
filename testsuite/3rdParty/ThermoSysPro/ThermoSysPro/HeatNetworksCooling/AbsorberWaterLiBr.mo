within ThermoSysPro.HeatNetworksCooling;
model AbsorberWaterLiBr 
  "Absorption of H2O into a H2O LiBr solution, and exchange with cold water" 
  parameter Real DPf=0 
    "Pressure losses in the cold fluid a a percent of the pressure at the inlet";
  
public 
  Modelica.SIunits.Power W(start=1e6) "Power exchanged";
  Real DPc(start=10) 
    "Pressure losses in the hot fluid a a percent of the pressure at the inlet";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[-74,80; -64,90; 64,90; 74,80; 74,-80; 64,-90; -64,-90;
            -74,-80; -74,80], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Polygon(points=[74,-10; 74,-80; 64,-90; -64,-90; -74,-80; -74,-10; -26,
            -10; -4,66; 64,66; 64,54; 8,54; 26,-10; 74,-10], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1)),
                        Line(points=[-64,60; 0,60; 0,-16; 0,-62; -64,-62],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-14,78; 0,68; 14,78], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2))),
    Diagram(
      Polygon(points=[-74,80; -64,90; 64,90; 74,80; 74,-80; 64,-90; -64,-90;
            -74,-80; -74,80], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Polygon(points=[74,-10; 74,-80; 64,-90; -64,-90; -74,-80; -74,-10; -26,
            -10; -4,66; 64,66; 64,54; 8,54; 26,-10; 74,-10], style(
          color=0,
          rgbcolor={0,0,0},
          fillColor=30,
          rgbfillColor={215,215,215},
          fillPattern=1)),
                        Line(points=[-64,60; 0,60; 0,-16; 0,-62; -64,-62],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1)),
      Line(points=[-14,78; 0,68; 14,78], style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2))),
    Window(
      x=0.05,
      y=0.01,
      width=0.93,
      height=0.87),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Benoît Bride</li>
</ul>
</html>
"));
public 
  ThermoSysPro.WaterSteam.Connectors.FluidInlet Ef "Cold fluid inlet" 
                          annotation(extent=[-84,-72; -64,-52]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutlet Sf "Cold fluid outlet" 
                          annotation(extent=[-82,50; -62,70]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionInlet Ec 
    "Water solution inlet" 
    annotation (extent=[64,50; 84,70]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionOutlet Sc 
    "Water solution outlet" 
    annotation (extent=[-10,-100; 10,-80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph profe 
    annotation(extent=[-100,-100; -80,-80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph profs 
    annotation(extent=[-100,80; -80,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph provap 
    annotation(extent=[80,80; 100,100]);
public 
  ThermoSysPro.WaterSteam.Connectors.FluidInlet Evap 
                          annotation(extent=[-10,80; 10,100]);
equation 
  
  Sf.Q = Ef.Q;
  
  /* Flow reversal */
  0 = if (Ef.Q > 0) then Ef.h - Ef.h_vol else Sf.h - Sf.h_vol;
  0 = Evap.h - Evap.h_vol;
  
  /* Mass balance equation for the hot fluid */
  Sc.Q = Ec.Q + Evap.Q;
  
  /* Pressure losses in the cold fluid */
  Sf.P = if (Ef.Q > 0) then Ef.P - DPf*Ef.P/100 else Ef.P + DPf*Ec.P/100;
  
  /* Pressure losses in the hot fluid */
  Sc.P = Ec.P - DPc*Ec.P/100;
  Evap.P = Sc.P;
  
  /* Energy balance equation for the cold fluid */
  Sf.h = Ef.h + W/Ef.Q;
  
  /* Energy balance equation for the hot fluid */
  W = Ec.Q*ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(Ec.T, Ec.Xh2o)
      - Sc.Q*ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(Sc.T, Ec.Xh2o)
      + Evap.Q*Evap.h;
  
  /* Solution temperature at the outlet */
  Sc.Xh2o = ThermoSysPro.Properties.WaterSolution.MassFraction_eq_PT(Sc.P, Sc.T);
  
  /* H2O mass fraction at the outlet */
  Sc.Xh2o = (Evap.Q + Ec.Xh2o*Ec.Q)/Sc.Q;
  
  /* Water/steam properties */
  profe = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Ef.P, Ef.h, 0);
  profs = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Sf.P, Sf.h, 0);
  provap = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Evap.P, Evap.h, 0);
  
end AbsorberWaterLiBr;
