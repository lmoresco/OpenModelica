within ThermoSysPro.WaterSteam.BoundaryConditions;
model RefP "Fixed pressure reference" 
  parameter ThermoSysPro.Units.AbsolutePressure P0=1.e5 "Fixed fluid pressure";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow rate for continuous flow reversal";
  
public 
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.SpecificEnthalpy h "Fluid specific enthalpy";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0})),
      Line(points=[0,100; 0,40], style(color=3, rgbcolor={0,0,255})),
      Line(points=[20,60; 0,40; -20,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[-90,0; -40,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[40,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Text(
        extent=[-28,30; 28,-26],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=1),
        string="P")),
    Icon(
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0})),
      Line(points=[0,100; 0,40], style(color=3, rgbcolor={0,0,255})),
      Line(points=[20,60; 0,40; -20,60], style(color=3, rgbcolor={0,0,255})),
      Line(points=[-90,0; -40,0], style(color=3, rgbcolor={0,0,255})),
      Line(points=[40,0; 90,0], style(color=3, rgbcolor={0,0,255})),
      Text(
        extent=[-28,30; 28,-26],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=53,
          rgbfillColor={128,255,0},
          fillPattern=1),
        string="P")),
    Window(
      x=0.06,
      y=0.08,
      width=0.82,
      height=0.65),
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
<li>
    Daniel Bouskela</li>
</ul>
</html>
"), DymolaStoredErrors);
  Connectors.FluidInlet C1 
    annotation (extent=[-110, -10; -90, 10]);
  Connectors.FluidOutlet C2 
    annotation (extent=[90, -10; 110, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal IPressure 
    annotation (extent=[-10,100; 10,120],rotation=270);
  
equation 
  if (cardinality(IPressure) == 0) then
    IPressure.signal = P0;
  end if;
  
  C1.P = C2.P;
  C1.h = C2.h;
  C1.Q = C2.Q;
  
  Q = C1.Q;
  h = C1.h;
  
  C1.P = IPressure.signal;
  
  /* Flow reversal */
  if continuous_flow_reversal then
    0 = noEvent(if (Q > Qeps) then C1.h - C1.h_vol else if (Q < -Qeps) then 
      C2.h - C2.h_vol else C1.h - 0.5*((C1.h_vol - C2.h_vol)*Modelica.Math.sin(pi
      *Q/2/Qeps) + C1.h_vol + C2.h_vol));
  else
    0 = if (Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  end if;
  
end RefP;
