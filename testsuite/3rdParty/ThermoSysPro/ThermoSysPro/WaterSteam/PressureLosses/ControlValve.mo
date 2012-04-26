within ThermoSysPro.WaterSteam.PressureLosses;
model ControlValve "Control valve" 
  parameter ThermoSysPro.Units.Cv Cvmax=8005.42 
    "Maximum CV (active if mode_caract=0)";
  parameter Real caract[:, 2]=[0, 0; 1, Cvmax] 
    "Position vs. Cv characteristics (active if mode_caract=1)";
  parameter Integer mode_caract=0 
    "0:linear characteristics - 1:characteristics is given by caract[]";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
protected 
  parameter Real eps=1.e-0 "Small number for pressure loss equation";
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow for continuous flow reversal";
  
public 
  ThermoSysPro.Units.Cv Cv(start=100) "Cv";
  Modelica.SIunits.MassFlowRate Q(start=500) "Mass flow rate";
  ThermoSysPro.Units.DifferentialPressure deltaP "Singular pressure loss";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  ThermoSysPro.Units.AbsoluteTemperature T(start=290) "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure Pm(start=1.e5) "Fluid average pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) "Fluid specific enthalpy";
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    "Propriétés de l'eau" 
    annotation(extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[40, 40; -40, 40; -40, 56; -38, 74; -32, 84; -20, 94; 0,
            100; 20, 94; 32, 84; 38, 72; 40, 54; 40, 40], style(fillColor=53,
            fillPattern=1)),
      Polygon(points=[0, -60; 40, 40; -40, 40; 0, -60], style(fillColor=53,
            fillPattern=1)),
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -102; -100, -100],
          style(fillColor=53, fillPattern=1)),
      Polygon(points=[0, -60; 100, -20; 100, -102; 0, -60; 0, -60], style(
            fillColor=53, fillPattern=1))),
    Diagram(
      Polygon(points=[-100, -100; 0, -60; -100, -20; -100, -102; -100, -100],
          style(fillColor=53, fillPattern=1)),
      Polygon(points=[0,-60; 100,-20; 100,-102; 0,-60; 0,-60],      style(
            fillColor=53, fillPattern=1)),
      Polygon(points=[0, -60; 40, 40; -40, 40; 0, -60], style(fillColor=53,
            fillPattern=1)),
      Polygon(points=[40, 40; -40, 40; -40, 56; -38, 74; -32, 84; -20, 94; 0,
            100; 20, 94; 32, 84; 38, 72; 40, 54; 40, 40], style(fillColor=53,
            fillPattern=1))),
    Window(
      x=0.07,
      y=0.13,
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
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal Ouv 
    annotation(extent=[-10, 100; 10, 120], rotation=-90);
  Connectors.FluidInlet C1 
                          annotation(extent=[-110, -70; -90, -50]);
  Connectors.FluidOutlet C2 
                          annotation(extent=[90,-70; 110,-50]);
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
  
  /* Pressure loss */
  deltaP*Cv*abs(Cv) = 1.733e12*ThermoSysPro.Functions.ThermoSquare(Q, eps)/rho^2;
  
  /* Cv as a function of the valve position */
  if (mode_caract == 0) then
    Cv = Ouv.signal*Cvmax;
  elseif (mode_caract == 1) then
    Cv = ThermoSysPro.Functions.LinearInterpolation(caract[:, 1], caract[:, 2], Ouv.signal);
  else
    assert(false, "ControlValve: invalid option");
  end if;
  
  /* Fluid thermodynamic properties */
  Pm = (C1.P + C2.P)/2;
  
  pro = ThermoSysPro.Properties.Fluid.Ph(Pm, h, mode, fluid);
  
  T = pro.T;
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
end ControlValve;
