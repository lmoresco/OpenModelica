within ThermoSysPro.WaterSteam.PressureLosses;
model DynamicReliefValve "Dynamic relief valve" 
  parameter ThermoSysPro.Units.DifferentialPressure dPOuvert=1.e5 
    "Pressure difference when the valve opens";
  parameter ThermoSysPro.Units.DifferentialPressure dPFerme=0.9e5 
    "Pressure difference when the valve closes";
  parameter Real Cmin=1.e-2 "Minimum position of the valve";
  parameter ThermoSysPro.Units.Cv Cvmax=8005.42 
    "Maximum CV (active if mode_caract=0)";
  parameter Real caract[:, 2]=[0, 0; 1, Cvmax] 
    "Position vs. Cv characteristics (active if mode_caract=1)";
  parameter Real Ke=0.2 "Valve spring stiffness";
  parameter Real D=0 "Damping";
  parameter Modelica.SIunits.Mass m=0 "Valve mass";
  parameter Integer mode_caract=0 
    "0:linear characteristics - 1:characteristics is given by caract[]";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Real eps=1.e-0 "Small number for pressure loss equation";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow for continuous flow reversal";
  Real der_Ouv "Valve position derivative";
  Real c "Valve position coefficient";
  
public 
  Real Ouv "Valve position";
  ThermoSysPro.Units.Cv Cv "Cv";
  Modelica.SIunits.MassFlowRate Q(start=500) "Mass flow rate";
  ThermoSysPro.Units.DifferentialPressure deltaP "Singular pressure loss";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  ThermoSysPro.Units.AbsoluteTemperature T(start=290) "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure Pm(start=1.e5) "Fluid avreage pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";
  
protected 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation(extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[0, 0; -30, -60; 30, -60; 0, 0], style(fillColor=79,
            rgbfillColor={170,85,255})),
      Polygon(points=[0, 0; 60, -30; 60, 30; 0, 0], style(fillColor=79,
            rgbfillColor={170,85,255})),
      Line(points=[0, -60; 0, -98]),
      Line(points=[60, 0; 90, 0]),
      Line(points=[0, 0; 10, 10; -10, 20; 10, 28; -10, 40; 10, 50; -10, 60; 10,
            70], style(color=79, rgbcolor={170,85,255}))),
    Diagram(
      Polygon(points=[0, 0; -30, -60; 30, -60; 0, 0], style(fillColor=79,
            rgbfillColor={170,85,255})),
      Polygon(points=[0, 0; 60, -30; 60, 30; 0, 0], style(fillColor=79,
            rgbfillColor={170,85,255})),
      Line(points=[0, -60; 0, -98]),
      Line(points=[60, 0; 90, 0]),
      Line(points=[0, 0; 10, 10; -10, 20; 10, 28; -10, 40; 10, 50; -10, 60; 10,
            70])),
    Window(
      x=0.12,
      y=0.05,
      width=0.8,
      height=0.77),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
public 
  Connectors.FluidInlet C1 
    annotation(extent=[-10, -108; 10, -88]);
  Connectors.FluidOutlet C2                annotation(extent=[90, -12; 110, 8]);
initial equation 
  if (D > 0) then
    Ouv = c;
  end if;
  
  if (m > 0) then
    der_Ouv = 0;
  end if;
  
equation 
  C1.h = C2.h;
  C1.Q = C2.Q;
  
  h = C1.h;
  Q = C1.Q;
  deltaP = C1.P - C2.P;
  
  /* Flow reversal */
  if continuous_flow_reversal then
    0 = noEvent(if (Q > Qeps) then C1.h - C1.h_vol else if (Q < -Qeps) then 
      C2.h - C2.h_vol else C1.h - 0.5*((C1.h_vol - C2.h_vol)*Modelica.Math.sin(pi
      *Q/2/Qeps) + C1.h_vol + C2.h_vol));
  else
    0 = if (Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  end if;
  
  /* Valve position */
  if (dPOuvert > dPFerme) then
    c = min(max((deltaP - dPFerme)/(dPOuvert - dPFerme), Cmin), 1);
  else
    c = if (deltaP > dPOuvert) then 1 else Cmin;
  end if;
  
  if ((D > 0) or (m > 0)) then
    der_Ouv = der(Ouv);
  else
    der_Ouv = 0;
  end if;
  
  if ((D > 0) and (m > 0)) then
    Ouv + D/Ke*der_Ouv + m/Ke*der(der_Ouv) = c;
  elseif (D > 0) then
    Ouv + D/Ke*der_Ouv = c;
  elseif (m > 0) then
    Ouv + m/Ke*der(der_Ouv) = c;
  else
    Ouv = c;
  end if;
  
  /* Pressure loss */
  deltaP*Cv*abs(Cv) = 1.733e12*ThermoSysPro.Functions.ThermoSquare(Q, eps)/rho^2;
  
  /* Cv as a function of the valve position */
  if (mode_caract == 0) then
    Cv = Ouv*Cvmax;
  elseif (mode_caract == 1) then
    Cv = ThermoSysPro.Functions.LinearInterpolation(caract[:, 1], caract[:, 2], Ouv);
  else
    assert(false, "VanneReglante : mode de calcul du Cv incorrect");
  end if;
  
  /* Fluid thermodynamic properties */
  Pm = (C1.P + C2.P)/2;
  
  pro = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pm, h, mode);
  
  T = pro.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
end DynamicReliefValve;
