within ThermoSysPro.WaterSteam.Junctions;
model MassFlowMultiplier "Mass flow multipliier" 
  parameter Real alpha=2 "Flow multiplier";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsolutePressure P(start=10e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-100,60; -100,-60; 90,0; -100,60], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})), Text(
        extent=[-60,24; -20,-16],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1),
        string="%alpha")),
    Icon(Polygon(points=[-100,60; -100,-60; 90,0; -100,60], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0})), Text(
        extent=[-60,24; -20,-16],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0},
          fillPattern=1),
        string="%alpha")),
    Window(
      x=0.33,
      y=0.09,
      width=0.71,
      height=0.88),
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
"));
public 
  Connectors.FluidInlet Ce 
    annotation (extent=[-110,-10; -90,10]);
  Connectors.FluidOutlet Cs                annotation (extent=[90,-10; 110,
        10]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation (extent=[-100,80; -80,100]);
equation 
  
  /* Fluid pressure */
  P = Ce.P;
  P = Cs.P;
  
  /* Fluid specific enthalpy (singular if all flows = 0) */
  Ce.h_vol = h;
  Cs.h_vol = h;
  
  /* Mass balance equation */
  0 = alpha*Ce.Q - Cs.Q;
  
  /* Energy balance equation */
  0 = alpha*Ce.Q*Ce.h - Cs.Q*Cs.h;
  
  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);
  
  T = pro.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
  
end MassFlowMultiplier;
