within ThermoSysPro.MultiFluids.HeatExchangers;
model ExchangerWaterC3H3F5W 
  "Static water - C3H3F5 heat exchanger with fixed delta power" 
  parameter Modelica.SIunits.Power DW = 0 
    "Power exchanged between the hot and the cold fluids";
  parameter ThermoSysPro.Units.DifferentialPressure DPc 
    "Total pressure loss for the hot fluid (% of the fluid pressure at the inlet)";
  parameter ThermoSysPro.Units.DifferentialPressure DPf 
    "Total pressure loss for the cold fluid (% of the fluid pressure at the inlet)";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  parameter Integer modec=0 
    "IF97 region of the water for the hot fluid. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow for continuous flow reversal";
  
public 
  ThermoSysPro.Units.AbsoluteTemperature Tec 
    "Fluid temperature at the inlet of the hot side";
  ThermoSysPro.Units.AbsoluteTemperature Tsc 
    "Fluid temperature at the outlet of the hot side";
  ThermoSysPro.Units.AbsoluteTemperature Tef 
    "Fluid temperature at the inlet of the cold side";
  ThermoSysPro.Units.AbsoluteTemperature Tsf 
    "Fluid temperature at the outlet of the cold side";
  Modelica.SIunits.MassFlowRate Qc(start=100) "Hot fluid mass flow rate";
  Modelica.SIunits.MassFlowRate Qf(start=100) "Cold fluid mass flow rate";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, 60; 100, -60], style(
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=10)), Line(points=[-56,-50; -56,4; 0,-28; 60,6; 60,-50],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))),
    Diagram(
      Rectangle(extent=[-100,60; 100,-60], style(
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=10)),
                        Line(points=[-58,-50; -58,2; -2,-34; 58,2; 58,-50],
          style(
          color=3,
          rgbcolor={0,0,255},
          thickness=2,
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1))),
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
    Baligh El Hefni</li>
</ul>
</html>
"));
public 
  WaterSteam.Connectors.FluidInlet Ec 
                          annotation(extent=[-68,-70; -48,-50]);
  WaterSteam.Connectors.FluidInlet Ef 
                          annotation(extent=[-110,-10; -90,10]);
  WaterSteam.Connectors.FluidOutlet Sf 
                          annotation(extent=[88,-9; 108,11]);
  WaterSteam.Connectors.FluidOutlet Sc 
                          annotation(extent=[48,-70; 68,-50]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proce 
    annotation(extent=[-20,80; 0,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph procs 
    annotation(extent=[20,80; 40,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph profe 
    annotation(extent=[-100,80; -80,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph profs 
    annotation(extent=[-60,80; -40,100]);
equation 
  
  /* Flow reversal for the hot fluid */
  if continuous_flow_reversal then
    0 = noEvent(if (Qc > Qeps) then Ec.h - Ec.h_vol else if (Qc < -Qeps) then 
        Sc.h - Sc.h_vol else Ec.h - 0.5*((Ec.h_vol - Sc.h_vol)*Modelica.Math.sin(pi
        *Qc/2/Qeps) + Ec.h_vol + Sc.h_vol));
  else
    0 = if (Qc > 0) then Ec.h - Ec.h_vol else Sc.h - Sc.h_vol;
  end if;
  
  /* Flow reversal for the cold fluid */
  if continuous_flow_reversal then
    0 = noEvent(if (Qf > Qeps) then Ef.h - Ef.h_vol else if (Qf < -Qeps) then 
        Sf.h - Sf.h_vol else Ef.h - 0.5*((Ef.h_vol - Sf.h_vol)*Modelica.Math.sin(pi
        *Qf/2/Qeps) + Ef.h_vol + Sf.h_vol));
  else
    0 = if (Qf > 0) then Ef.h - Ef.h_vol else Sf.h - Sf.h_vol;
  end if;
  
  /* Mass flow rates */
  Ec.Q = Sc.Q;
  Qc = Ec.Q;
  
  Ef.Q = Sf.Q;
  Qf = Ef.Q;
  
  /* Power exchanged between the hot and cold fluids */
  DW = Qf*(Sf.h - Ef.h);
  DW = Qc*(Ec.h - Sc.h);
  
  /* Pressure losses */
  Sc.P = if (Qc > 0) then Ec.P - DPc*Ec.P/100 else Ec.P + DPc*Ec.P/100;
  Sf.P = if (Qf > 0) then Ef.P - DPf*Ef.P/100 else Ef.P + DPf*Ef.P/100;
  
  /* Fluid thermodynamic properties for the hot fluid */
  proce = ThermoSysPro.Properties.Fluid.Ph(Ec.P, Ec.h, modec, 1);
  procs = ThermoSysPro.Properties.Fluid.Ph(Sc.P,Sc.h, modec, 1);
  
  Tec = proce.T;
  Tsc = procs.T;
  
  /* Fluid thermodynamic properties for the cold fluid */
  profe = ThermoSysPro.Properties.Fluid.Ph(Ef.P, Ef.h, 0, 2);
  profs = ThermoSysPro.Properties.Fluid.Ph(Sf.P, Sf.h, 0, 2);
  
  Tef = profe.T;
  Tsf = profs.T;
  
end ExchangerWaterC3H3F5W;
