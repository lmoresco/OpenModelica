within ThermoSysPro.HeatNetworksCooling;
model DesorberWaterLiBr "Water LiBr solution desorber with water heating" 
  parameter Real Eff=0.65 "Thermal exchange efficiency (=W/Wmax)";
  parameter ThermoSysPro.Units.DifferentialPressure DPc=0 
    "Pressure losses in the hot fluid a a percent of the pressure at the inlet";
  parameter Real Pth=0.15 "Thermal losses fraction (=losses/W)";
  
public 
  Modelica.SIunits.Power W(start=1e6) "Power exchnaged with the solution";
  Modelica.SIunits.Power Wpth(start=1e6) "Thermal losses power";
  Modelica.SIunits.Power Wtot(start=1e6) "Hot water total power";
  Modelica.SIunits.Power Wmaxf(start=1e6) 
    "Maximum power acceptable by the solution";
  Modelica.SIunits.Power Wmaxc(start=1e6) 
    "Maximum power releasable by the hot water";
  ThermoSysPro.Units.AbsoluteTemperature Tsatc(start=400) 
    "Hot water saturation temperature at the outlet";
  ThermoSysPro.Units.SpecificEnthalpy Hminc(start=1e5) 
    "Minimum specific enthalpy reachable by the hot water";
  Real Xmin "Minimum mass fraction reachable by the solution";
  Modelica.SIunits.MassFlowRate Qs_min(start=100) 
    "Minimum solution mass flow rate at the outlet";
  Modelica.SIunits.MassFlowRate Qv_max(start=100) 
    "Maximum steam mass flow rate at the outlet";
  Modelica.SIunits.Power Wmax(start=1e6) "Maximum power exchangeable";
  ThermoSysPro.Units.DifferentialTemperature DTm(start=40) 
    "Differences of the average temperatures between the hot and cold sides";
  
public 
  ThermoSysPro.WaterSteam.Connectors.FluidInlet Ec 
                          annotation(extent=[-84,-72; -64,-52]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutlet Svap 
                          annotation(extent=[-10,80; 10,101]);
  ThermoSysPro.WaterSteam.Connectors.FluidOutlet Sc 
                          annotation(extent=[-82,50; -62,70]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionInlet Ef 
    annotation (extent=[64,50; 84,70]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionOutlet Sf 
    annotation (extent=[-8,-100; 12,-80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proce 
    annotation(extent=[-100,-100; -80,-80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph procs 
    annotation(extent=[-100,80; -80,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph provap 
    annotation(extent=[80,80; 100,100]);
equation 
  
  // Hypothesis : counter-current exchange
  
  Sc.Q = Ec.Q;
  Ef.P = Sf.P;
  Svap.P = Sf.P;
  
  /* Flow reversal */
  0 = if (Ec.Q > 0) then Ec.h - Ec.h_vol else Sc.h - Sc.h_vol;
  
  /* Maximum power exchangeable on the hot side */
  Tsatc = ThermoSysPro.Properties.WaterSteam.BaseIF97.Basic.tsat(Sc.P);
  
  if (Tsatc > Ef.T) then
      Hminc = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(Sc.P, Ef.T, 0);
  elseif (Tsatc < Ef.T) then
      Hminc = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(Sc.P, Ef.T, 0);
  else
      Hminc = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(Sc.P, Ef.T, 1);
  end if;
  
  Wmaxc = Ec.Q*(Ec.h - Hminc);
  
  /* Maximum power exchangeable on the solution side */
  Xmin = ThermoSysPro.Properties.WaterSolution.MassFraction_eq_PT(Sf.P, proce.T);
  Qs_min = Ef.Q*(1 - Ef.Xh2o)/(1 - Xmin);
  Qv_max = Ef.Q*(1 - (1-Ef.Xh2o)/(1 - Xmin));
  Wmaxf = Ef.Q*ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(Ef.T, Ef.Xh2o)
          - Qs_min * ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(proce.T, Xmin) + Qv_max*Svap.h;
  
  /* Power exchanged */
  Wmax = min(Wmaxf, Wmaxc);
  W = Eff*Wmax;
  Wpth = W*Pth;
  Wtot = W + Wpth;
  
  /* Water/steam properties */
  proce = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Ec.P, Ec.h, 0);
  procs = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Sc.P, Sc.h, 0);
  provap = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Svap.P, Svap.h, 0);
  
  /* Mass flow rate in the hot side : mass balance and LiBr balance */
  Sf.Q = Ef.Q*(1 - Ef.Xh2o)/(1 - Sf.Xh2o);
  Svap.Q = Ef.Q*(1 - (1-Ef.Xh2o)/(1 - Sf.Xh2o));
  
  /* Pressure losses in the hot side */
  Sc.P = if (Ec.Q > 0) then Ec.P - DPc*Ec.P/100 else Ec.P + DPc*Ec.P/100;
  
  /* Fluid properties at the outlet */
  Svap.h = ThermoSysPro.Properties.WaterSteam.IF97.SpecificEnthalpy_PT(Svap.P, Sf.T,2);
  Sf.Xh2o = ThermoSysPro.Properties.WaterSolution.MassFraction_eq_PT(Sf.P, Sf.T);
  
  /* Energy balance in the hot side */
  Sc.h = Ec.h - Wtot/Ec.Q;
  
  /* Energy balance in the solution side */
  W = Ef.Q*ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(Ef.T, Ef.Xh2o)
      - Sf.Q * ThermoSysPro.Properties.WaterSolution.SpecificEnthalpy_TX(Sf.T, Sf.Xh2o)
      + Svap.Q*Svap.h;
  
  /* Difference between the average temperatures */
  DTm = (proce.T - procs.T) - (Sf.T - Ef.T);
  
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
      Line(points=[-12,68; 0,78; 14,68], style(
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
      Line(points=[-12,68; 0,78; 14,68], style(
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
end DesorberWaterLiBr;
