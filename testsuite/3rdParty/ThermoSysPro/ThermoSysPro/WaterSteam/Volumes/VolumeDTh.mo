within ThermoSysPro.WaterSteam.Volumes;
model VolumeDTh "Mixing volume with 1 inlet and 3 outlets and thermal input" 
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
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-60, 60; 60, -60], style(fillColor=71, rgbfillColor={85,
              170,255})),
      Line(points=[-90, 0; 90, 0]),
      Line(points=[0, 90; 0, -100])),
    Icon(
      Line(points=[0, 90; 0, -100]),
      Line(points=[-90, 0; 90, 0]),
      Ellipse(extent=[-60, 60; 60, -60], style(fillColor=71, rgbfillColor={85,
              170,255}))),
    Window(
      x=0.16,
      y=0.23,
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
  Connectors.FluidInlet Ce          annotation (extent=[-110, -10; -90, 10]);
  Connectors.FluidOutlet Cs1         annotation (extent=[-10, 90; 10, 110]);
  Connectors.FluidOutlet Cs2         annotation (extent=[-10, -108; 10, -88]);
  ThermoSysPro.Thermal.Connectors.ThermalPort Cth 
                                     annotation (extent=[-10, -10; 10, 10]);
  Connectors.FluidOutlet Cs3         annotation (extent=[90, -10; 110, 10]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    annotation (extent=[-100, 80; -80, 100]);
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
  if (cardinality(Ce) == 0) then
    Ce.Q = 0;
    Ce.h = 1.e5;
    Ce.b = true;
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
  
  if (cardinality(Cs3) == 0) then
    Cs3.Q = 0;
    Cs3.h = 1.e5;
    Cs3.a = true;
  end if;
  
  /* Mass balance equation */
  BQ = Ce.Q - Cs1.Q - Cs2.Q - Cs3.Q;
  if dynamic_mass_balance then
    V*(pro.ddph*der(P) + pro.ddhp*der(h)) = BQ;
  else
    0 = BQ;
  end if;
  
  P = Ce.P;
  P = Cs1.P;
  P = Cs2.P;
  P = Cs3.P;
  
  /* Energy balance equation */
  BH = Ce.Q*Ce.h - Cs1.Q*Cs1.h - Cs2.Q*Cs2.h - Cs3.Q*Cs3.h + Cth.W;
  if dynamic_mass_balance then
    V*((h*pro.ddph - 1)*der(P) + (h*pro.ddhp + rho)*der(h)) = BH;
  else
    V*rho*der(h) = BH;
  end if;
  
  Ce.h_vol = h;
  Cs1.h_vol = h;
  Cs2.h_vol = h;
  Cs3.h_vol = h;
  
  /* Fluid thermodynamic properties */
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);
  
  T = pro.T;
  
  Cth.T = T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
  
end VolumeDTh;
