within ThermoSysPro.Properties.WaterSteam;
package InitLimits 
  constant Real MINPOS=1.0e-9 
    "minimal value for physical variables which are always > 0.0";
  
  constant Modelica.SIunits.Area AMIN=MINPOS "Minimum surface";
  constant Modelica.SIunits.Area AMAX=1.0e5 "Maximum surface";
  constant Modelica.SIunits.Area ANOM=1.0 "Nominal surface";
  constant Modelica.SIunits.Density DMIN=MINPOS "Minimum density";
  constant Modelica.SIunits.Density DMAX=1.0e5 "Maximum densitye";
  constant Modelica.SIunits.Density DNOM=998.0 "Nominal density";
  constant Modelica.SIunits.ThermalConductivity LAMMIN=MINPOS 
    "Minimum thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LAMNOM=1.0 
    "Nominal thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LAMMAX=1000.0 
    "Maximum thermal conductivity";
  constant Modelica.SIunits.DynamicViscosity ETAMIN=MINPOS 
    "Minimum dynamic viscosity";
  constant Modelica.SIunits.DynamicViscosity ETAMAX=1.0e8 
    "Maximum dynamic viscosity";
  constant Modelica.SIunits.DynamicViscosity ETANOM=100.0 
    "Nominal dynamic viscosity";
  constant Modelica.SIunits.Energy EMIN=-1.0e10 "Minimum energy";
  constant Modelica.SIunits.Energy EMAX=1.0e10 "Maximum energy";
  constant Modelica.SIunits.Energy ENOM=1.0e3 "Nominal energy";
  constant Modelica.SIunits.Entropy SMIN=-1.0e6 "Minimum entropy";
  constant Modelica.SIunits.Entropy SMAX=1.0e6 "Maximum entropy";
  constant Modelica.SIunits.Entropy SNOM=1.0e3 "Nominal entropy";
  constant Modelica.SIunits.MassFlowRate MDOTMIN=-1.0e5 
    "Minimum mass flow rate";
  constant Modelica.SIunits.MassFlowRate MDOTMAX=1.0e5 "Maximum mass flow rate";
  constant Modelica.SIunits.MassFlowRate MDOTNOM=1.0 "Nominal mass flow rate";
  constant ThermoSysPro.Units.MassFraction MASSXMIN=-1.0*MINPOS 
    "Minimum mass fraction";
  constant ThermoSysPro.Units.MassFraction MASSXMAX=1.0 "Maximum mass fraction";
  constant ThermoSysPro.Units.MassFraction MASSXNOM=0.1 "Nominal mass fraction";
  constant Modelica.SIunits.Mass MMIN=1.0*MINPOS "Minimum mass";
  constant Modelica.SIunits.Mass MMAX=1.0e8 "Maximum mass";
  constant Modelica.SIunits.Mass MNOM=1.0 "Nominal mass";
  constant Modelica.SIunits.Power POWMIN=-1.0e8 "Minimum power";
  constant Modelica.SIunits.Power POWMAX=1.0e8 "Maximum power";
  constant Modelica.SIunits.Power POWNOM=1.0e3 "Nominal power";
  constant ThermoSysPro.Units.AbsolutePressure PMIN=100.0 "Minimum pressure";
  constant ThermoSysPro.Units.AbsolutePressure PMAX=1.0e9 "Maximum pressure";
  constant ThermoSysPro.Units.AbsolutePressure PNOM=1.0e5 "Nominal pressure";
  constant ThermoSysPro.Units.AbsolutePressure COMPPMIN=-1.0*MINPOS 
    "Minimum pressure";
  constant ThermoSysPro.Units.AbsolutePressure COMPPMAX=1.0e8 
    "Maximum pressure";
  constant ThermoSysPro.Units.AbsolutePressure COMPPNOM=1.0e5 
    "Nominal pressure";
  constant Modelica.SIunits.RatioOfSpecificHeatCapacities KAPPAMIN=1.0 
    "Minimum isentropic exponent";
  constant Modelica.SIunits.RatioOfSpecificHeatCapacities KAPPAMAX=Modelica.Constants.inf 
    "Maximum isentropic exponent";
  constant Modelica.SIunits.RatioOfSpecificHeatCapacities KAPPANOM=1.2 
    "Nominal isentropic exponent";
  constant Modelica.SIunits.SpecificEnergy SEMIN=-1.0e8 
    "Minimum specific energy";
  constant Modelica.SIunits.SpecificEnergy SEMAX=1.0e8 
    "Maximum specific energy";
  constant Modelica.SIunits.SpecificEnergy SENOM=1.0e6 
    "Nominal specific energy";
  constant ThermoSysPro.Units.SpecificEnthalpy SHMIN=-1.0e6 
    "Minimum specific enthalpy";
  constant ThermoSysPro.Units.SpecificEnthalpy SHMAX=1.0e8 
    "Maximum specific enthalpy";
  constant ThermoSysPro.Units.SpecificEnthalpy SHNOM=1.0e6 
    "Nominal specific enthalpy";
  constant Modelica.SIunits.SpecificEntropy SSMIN=-1.0e6 
    "Minimum specific entropy";
  constant Modelica.SIunits.SpecificEntropy SSMAX=1.0e6 
    "Maximum specific entropy";
  constant Modelica.SIunits.SpecificEntropy SSNOM=1.0e3 
    "Nominal specific entropy";
  constant Modelica.SIunits.SpecificHeatCapacity CPMIN=MINPOS 
    "Minimum specific heat capacity";
  constant Modelica.SIunits.SpecificHeatCapacity CPMAX=Modelica.Constants.inf 
    "Maximum specific heat capacity";
  constant Modelica.SIunits.SpecificHeatCapacity CPNOM=1.0e3 
    "Nominal specific heat capacity";
  constant ThermoSysPro.Units.AbsoluteTemperature TMIN=200 
    "Minimum temperature";
  constant ThermoSysPro.Units.AbsoluteTemperature TMAX=6000 
    "Maximum temperature";
  constant ThermoSysPro.Units.AbsoluteTemperature TNOM=320.0 
    "Nominal temperature";
  constant Modelica.SIunits.ThermalConductivity LMIN=MINPOS 
    "Minimum thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LMAX=500.0 
    "Maximum thermal conductivity";
  constant Modelica.SIunits.ThermalConductivity LNOM=1.0 
    "Nominal thermal conductivity";
  constant Modelica.SIunits.Velocity VELMIN=-1.0e5 "Minimum velocity";
  constant Modelica.SIunits.Velocity VELMAX=Modelica.Constants.inf 
    "Maximum velocity";
  constant Modelica.SIunits.Velocity VELNOM=1.0 "Nominal velocity";
  constant Modelica.SIunits.Volume VMIN=0.0 "Minimum volume";
  constant Modelica.SIunits.Volume VMAX=1.0e5 "Maximum volume";
  constant Modelica.SIunits.Volume VNOM=1.0e-3 "Nominal volume";
  
  annotation (
    Icon(
      Text(
        extent=[-120, 135; 120, 70],
        string="%name",
        style(color=1)),
      Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
      Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-90, 40; 70, 10],
        string="Library",
        style(
          color=9,
          fillColor=0,
          fillPattern=1)),
      Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
      Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
      Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
      Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0))),
    Window(
      x=0.45,
      y=0.01,
      width=0.51,
      height=0.74,
      library=1,
      autolayout=1),
    Documentation(info="<html>
<p><b>Adapted from the ThermoFlow library  (H. Tummescheit)</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
end InitLimits;
