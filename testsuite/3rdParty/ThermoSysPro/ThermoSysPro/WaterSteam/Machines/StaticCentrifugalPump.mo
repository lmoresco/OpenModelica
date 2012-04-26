within ThermoSysPro.WaterSteam.Machines;
model StaticCentrifugalPump "Static centrifugal pump" 
  parameter ThermoSysPro.Units.RotationVelocity VRot=1400 
    "Fixed rotational speed (active if fixed_rot_or_power=1 and rpm_or_mpower connector not connected)";
  parameter Modelica.SIunits.Power MPower=0.1e6 
    "Fixed mechanical power (active if fixed_rot_or_power=2 and rpm_or_mpower connector not connected)";
  parameter ThermoSysPro.Units.RotationVelocity VRotn=1400 
    "Nominal rotational speed";
  parameter Real rm=0.85 
    "Product of the pump mechanical and electrical efficiencies";
  parameter Integer fixed_rot_or_power=1 
    "1: fixed rotational speed - 2: fixed mechanical power";
  parameter Boolean adiabatic_compression=false 
    "true: adiabatic compression - false: non adiabatic compression";
  parameter Boolean continuous_flow_reversal=false 
    "true: continuous flow reversal - false: discontinuous flow reversal";
  parameter Integer fluid=1 "1: water/steam - 2: C3H3F5";
  parameter Modelica.SIunits.Density p_rho=0 "If > 0, fixed fluid density";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
  parameter Real a1=-88.67 
    "x^2 coef. of the pump characteristics hn = f(vol_flow) (s2/m5)";
  parameter Real a2=0 
    "x coef. of the pump characteristics hn = f(vol_flow) (s/m2)";
  parameter Real a3=43.15 
    "Constant coef. of the pump characteristics hn = f(vol_flow) (m)";
  
  parameter Real b1=-3.7751 
    "x^2 coef. of the pump efficiency characteristics rh = f(vol_flow) (s2/m6)";
  parameter Real b2=3.61 
    "x coef. of the pump efficiency characteristics rh = f(vol_flow) (s/m3)";
  parameter Real b3=-0.0075464 
    "Constant coef. of the pump efficiency characteristics rh = f(vol_flow) (s.u.)";
  
protected 
  constant Modelica.SIunits.Acceleration g=Modelica.Constants.g_n 
    "Gravity constant";
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Real eps=1.e-6 "Small number";
  parameter Real rhmin=0.05 "Minimum efficiency to avoid zero crossings";
  parameter Modelica.SIunits.MassFlowRate Qeps=1.e-3 
    "Small mass flow for continuous flow reversal";
  
public 
  Real rh "Hydraulic efficiency";
  Modelica.SIunits.Height hn(start=10) "Pump head";
  Real R(start=VRot/VRotn) "Reduced rotational speed";
  Modelica.SIunits.MassFlowRate Q(start=500) "Mass flow rate";
  Modelica.SIunits.VolumeFlowRate Qv(start=0.5) "Volume flow rate";
  Modelica.SIunits.Power Wh "Hydraulic power";
  Modelica.SIunits.Power Wm "Mechanical power";
  ThermoSysPro.Units.RotationVelocity Vr "Rotational speed";
  Modelica.SIunits.Density rho(start=998) "Fluid density";
  ThermoSysPro.Units.DifferentialPressure deltaP 
    "Pressure variation between the outlet and the inlet";
  ThermoSysPro.Units.SpecificEnthalpy deltaH 
    "Specific enthalpy variation between the outlet and the inlet";
  ThermoSysPro.Units.AbsolutePressure Pm(start=1.e5) "Fluid average pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=100000) 
    "Fluid average specific enthalpy";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Ellipse(extent=[-100,100; 100,-100],   style(
          gradient=0,
          fillColor=53,
          fillPattern=1)),
      Line(points=[-80, 0; 80, 0]),
      Line(points=[80, 0; 2, 60]),
      Line(points=[80, 0; 0, -60])),
    Window(
      x=0.03,
      y=0.02,
      width=0.95,
      height=0.95),
    Icon(
      Ellipse(extent=[-100,100; 100,-100],   style(
          gradient=0,
          fillColor=53,
          fillPattern=1)),
      Line(points=[-80, 0; 80, 0]),
      Line(points=[80, 0; 2, 60]),
      Line(points=[80, 0; 0, -60])),
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
"), DymolaStoredErrors);
  Connectors.FluidInlet C1 
                          annotation(extent=[-110, -10; -90, 10]);
  Connectors.FluidOutlet C2 
                          annotation(extent=[90,-10; 110,10]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pro 
    annotation(extent=[-100, 80; -80, 100]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal rpm_or_mpower 
    annotation (extent=[-10,-120; 10,-100],
                                          rotation=90);
equation 
  if (cardinality(rpm_or_mpower) == 0) then
    if (fixed_rot_or_power == 1) then
      rpm_or_mpower.signal = VRot;
    elseif (fixed_rot_or_power == 2) then
      rpm_or_mpower.signal = MPower;
    else
      assert(false, "StaticCentrifugalPump: incorrect option");
    end if;
  end if;
  
  deltaP = C2.P - C1.P;
  deltaH = C2.h - C1.h;
  
  deltaP = rho*g*hn;
  
  C1.Q = C2.Q;
  Q = C1.Q;
  Q = Qv*rho;
  
  /* Flow reversal */
  if continuous_flow_reversal then
    0 = noEvent(if (Q > Qeps) then C1.h - C1.h_vol else if (Q < -Qeps) then 
      C2.h - C2.h_vol else C1.h - 0.5*((C1.h_vol - C2.h_vol)*Modelica.Math.sin(pi
      *Q/2/Qeps) + C1.h_vol + C2.h_vol));
  else
    0 = if (Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  end if;
  
  /* Fixed rotational speed or fixed mechanical power */
  if (fixed_rot_or_power == 1) then
    Vr = rpm_or_mpower.signal;
  elseif (fixed_rot_or_power == 2) then
    Wm = rpm_or_mpower.signal;
  else
    assert(false, "StaticCentrifugalPump: incorrect option");
  end if;
  
  /* Energy balance equation */
  if adiabatic_compression then
    deltaH = 0;
  else
    deltaH = g*hn/rh;
  end if;
  
  /* Reduced rotational speed */
  R = Vr/VRotn;
  
  /* Pump characteristics */
  hn = noEvent(a1*Qv*abs(Qv) + a2*Qv*R + a3*R^2);
  rh = noEvent(max(if (abs(R) > eps) then b1*Qv*abs(Qv)/R^2 + b2*Qv/R + b3 else b3, rhmin));
  
  /* Mechanical power */
  Wm = Q*deltaH/rm;
  
  /* Hydraulic power */
  Wh = Qv*deltaP/rh;
  
  /* Fluid thermodynamic properties */
  Pm = (C1.P + C2.P)/2;
  h = (C1.h + C2.h)/2;
  
  pro = ThermoSysPro.Properties.Fluid.Ph(Pm, h, mode, fluid);
  
  if (p_rho > 0) then
    rho = p_rho;
  else
    rho = pro.d;
  end if;
end StaticCentrifugalPump;
