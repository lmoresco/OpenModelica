within ThermoSysPro.WaterSteam.Volumes;
model VolumeB "Mixing volume with 2 inlets and 2 outlets" 
  parameter Modelica.SIunits.Volume V=1 "Volume";
  parameter ThermoSysPro.Units.AbsolutePressure P0=1e5 
    "Initial fluid pressure (active if dynamic_mass_balance=true and steady_state=false)";
  parameter ThermoSysPro.Units.SpecificEnthalpy h0=1e5 
    "Initial fluid specific enthalpy (active if steady_state=false)";
  parameter Boolean dynamic_mass_balance=false 
    "true: dynamic mass balance equation - false: static mass balance equation";
  parameter Boolean steady_state=true 
    "true: start from steady state - false: start from (P0, h0)";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure P(start=1.e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  Modelica.SIunits.MassFlowRate BQ 
    "Right hand side of the mass balance equation";
  Modelica.SIunits.Power BH "Right hand side of the energybalance equation";
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation (extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[-90, 0; 90, 0]),
      Line(points=[0, 90; 0, -100]),
      Ellipse(extent=[-60, 60; 60, -60], style(fillColor=71, rgbfillColor={85,
              170,255}))),
    Icon(
      Line(points=[0, 90; 0, -100]),
      Line(points=[-90, 0; 90, 0]),
      Ellipse(extent=[-60, 60; 60, -60], style(fillColor=71, rgbfillColor={85,
              170,255}))),
    Window(
      x=0.07,
      y=0.22,
      width=0.66,
      height=0.69),
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
    Daniel Bouskela</li>
</ul>
</html>
"));
public 
  Connectors.FluidInlet Ce1 
                           annotation (extent=[-110, -10; -90, 10]);
  Connectors.FluidInlet Ce2 
                           annotation (extent=[90, -10; 110, 10]);
  Connectors.FluidOutlet Cs1 
                           annotation (extent=[-10, 80; 10, 100]);
  Connectors.FluidOutlet Cs2 
                           annotation (extent=[-10, -108; 10, -88]);
initial equation 
  if steady_state then
    if dynamic_mass_balance then
      der(P) = 0;
    end if;
    
    der(h) = 0;
  else
    if dynamic_mass_balance then
      P = P0;
    end if;
    
    h = h0;
  end if;
  
equation 
  assert(V > 0, "Volume non-positive");
  
  /* Unconnected connectors */
  if (cardinality(Ce1) == 0) then
    Ce1.Q = 0;
    Ce1.h = 1.e5;
    Ce1.b = true;
  end if;
  
  if (cardinality(Ce2) == 0) then
    Ce2.Q = 0;
    Ce2.h = 1.e5;
    Ce2.b = true;
  end if;
  
  if (cardinality(Cs1) == 0) then
    Cs1.Q = 0;
    Cs1.h = 1.e5;
    Cs1.a = true;
  end if;
  
  if (cardinality(Cs2) == 0) then
    Cs2.Q = 0;
    Cs2.h = 1.e5;
    Cs2.a = true;
  end if;
  
  /* Mass balance equation */
  BQ = Ce1.Q + Ce2.Q - Cs1.Q - Cs2.Q;
  if dynamic_mass_balance then
    V*(pro.ddph*der(P) + pro.ddhp*der(h)) = BQ;
  else
    0 = BQ;
  end if;
  
  P = Ce1.P;
  P = Ce2.P;
  P = Cs1.P;
  P = Cs2.P;
  
  /* Energy balance equation */
  BH = Ce1.Q*Ce1.h + Ce2.Q*Ce2.h - Cs1.Q*Cs1.h - Cs2.Q*Cs2.h;
  if dynamic_mass_balance then
    V*((h*pro.ddph - 1)*der(P) + (h*pro.ddhp + rho)*der(h)) = BH;
  else
    V*rho*der(h) = BH;
  end if;
  
  Ce1.h_vol = h;
  Ce2.h_vol = h;
  Cs1.h_vol = h;
  Cs2.h_vol = h;
  
  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);
  
  T = pro.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
  
end VolumeB;
