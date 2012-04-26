within ThermoSysPro.WaterSteam.Volumes;
model Tank "Open tank" 
  parameter ThermoSysPro.Units.AbsolutePressure Patm=1.013e5 
    "Pressure above the fluid level";
  parameter Modelica.SIunits.Area A=1 "Tank cross sectional area";
  parameter Modelica.SIunits.Position ze1=40 "Altitude of inlet 1";
  parameter Modelica.SIunits.Position ze2=0 "Altitude of inlet 2";
  parameter Modelica.SIunits.Position zs1=40 "Altitude of outlet 1";
  parameter Modelica.SIunits.Position zs2=0 "Altitude of outlet 2";
  parameter Modelica.SIunits.Position z0=30 
    "Initial fluid level (active if steady_state=false)";
  parameter ThermoSysPro.Units.SpecificEnthalpy h0=1.e5 
    "Initial fluid specific enthalpy (active if steady_state=false)";
  parameter Boolean steady_state=false 
    "true: start from steady state - false: start from h0";
  parameter Boolean steady_state_mech=false 
    "true: start from steady state - false: start from z0";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
protected 
  parameter Modelica.SIunits.Acceleration g=Modelica.Constants.g_n 
    "Gravity constant";
  parameter Modelica.SIunits.Thickness e=0.25 "Inlet/outlet thickness";
  parameter ThermoSysPro.Units.PressureLossCoefficient k=
                                                        1 
    "Inlet/outlet pressure loss coefficient";
  parameter Real eps=1.e-0 "Small number for ths square function";
  parameter Modelica.SIunits.Position zmin=1.e-6 "Minimum fluid level";
  
public 
  Modelica.SIunits.Position z "Fluid level";
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure P(start=1.e5) "Fluid average pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) 
    "Fluid average specific enthalpy";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  Modelica.SIunits.MassFlowRate BQ 
    "Right hand side of the mass balance equation";
  Modelica.SIunits.Power BH "Right hand side of the energy balance equation";
  Real Oe1;
  Real Oe2;
  Real Os1;
  Real Os2;
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation (extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(Rectangle(extent=[-100, 20; 100, -100], style(fillColor=71,
            rgbfillColor={85,170,255})),
                             Rectangle(extent=[-100, 100; 100, 20])),
    Diagram(Rectangle(extent=[-100, 20; 100, -100], style(fillColor=71,
            rgbfillColor={85,170,255})),
        Rectangle(extent=[-100, 100; 100, 20], style(fillPattern=0))),
    Window(
      x=0.16,
      y=0.03,
      width=0.81,
      height=0.9),
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
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal yLevel 
    "Water level"                        annotation (extent=[100, 10; 120, 30]);
  Connectors.FluidInlet Ce1          annotation (extent=[-110, 50; -90, 70]);
  Connectors.FluidOutlet Cs2         annotation (extent=[90, -70; 110, -50]);
  ThermoSysPro.Thermal.Connectors.ThermalPort Cth 
                                     annotation (extent=[-10, -10; 10, 10]);
  Connectors.FluidInlet Ce2          annotation (extent=[-110, -70; -90, -50]);
  Connectors.FluidOutlet Cs1         annotation (extent=[92, 50; 112, 70]);
initial equation 
  if steady_state then
    der(h) = 0;
  else
    h = h0;
  end if;
  
  if steady_state_mech then
    der(z) = 0;
  else
    z = z0;
  end if;
  
equation 
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
  
  /* Fluid pressure at the inlets and outlets */
  if (cardinality(Ce1) == 0) then
    Ce1.P = Patm + rho*g*max(z - ze1, 0);
    Oe1 = 0;
  else
    (Ce1.P - (Patm + rho*g*max(z - ze1, 0)))*Oe1 = k*
      ThermoSysPro.Functions.ThermoSquare(Ce1.Q, eps)/2/rho;
    Oe1 = if ((Ce1.Q >= 0) or (z > ze1 + e)) then 1 else if (z < ze1) then 0 else 
            (z - ze1)/e;
  end if;
  
  if (cardinality(Ce2) == 0) then
    Ce2.P = Patm + rho*g*max(z - ze2, 0);
    Oe2 = 0;
  else
    (Ce2.P - (Patm + rho*g*max(z - ze2, 0)))*Oe2 = k*
      ThermoSysPro.Functions.ThermoSquare(Ce2.Q, eps)/2/rho;
    Oe2 = if ((Ce2.Q >= 0) or (z > ze2 + e)) then 1 else if (z < ze2) then 0 else 
            (z - ze2)/e;
  end if;
  
  if (cardinality(Cs1) == 0) then
    Cs1.P = Patm + rho*g*max(z - zs1, 0);
    Os1 = 0;
  else
    (Patm + rho*g*max(z - zs1, 0) - Cs1.P)*Os1 = k*
      ThermoSysPro.Functions.ThermoSquare(Cs1.Q, eps)/2/rho;
    Os1 = if ((Cs1.Q <= 0) or (z > zs1 + e)) then 1 else if (z < zs1) then 0 else 
            (z - zs1)/e;
  end if;
  
  if (cardinality(Cs2) == 0) then
    Cs2.P = Patm + rho*g*max(z - zs2, 0);
    Os2 = 0;
  else
    (Patm + rho*g*max(z - zs2, 0) - Cs2.P)*Os2 = k*
      ThermoSysPro.Functions.ThermoSquare(Cs2.Q, eps)/2/rho;
    Os2 = if ((Cs2.Q <= 0) or (z > zs2 + e)) then 1 else if (z < zs2) then 0 else 
            (z - zs2)/e;
  end if;
  
  /* Mass balance equation */
  BQ = Ce1.Q + Ce2.Q - Cs1.Q - Cs2.Q;
  rho*A*der(z) = BQ;
  
  /* Energy balance equation */
  BH = Ce1.Q*(Ce1.h - h) + Ce2.Q*(Ce2.h - h) - Cs1.Q*(Cs1.h - h) - Cs2.Q*(
    Cs2.h - h) + Cth.W;
  if (z > zmin) then
    rho*A*z*der(h) = BH;
  else
    der(h) = 0;
  end if;
  
  Ce1.h_vol = h;
  Ce2.h_vol = h;
  Cs1.h_vol = h;
  Cs2.h_vol = h;
  
  Cth.T = T;
  
  /* Fluid level sensor */
  yLevel.signal = z;
  
  /* Fluid thermodynamic properties */
  P = Patm + rho*g*z/2;
  
  pro = ThermoSysPro.Properties.Fluid.Ph(P, h, mode, fluid);
  
  T = pro.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
end Tank;
