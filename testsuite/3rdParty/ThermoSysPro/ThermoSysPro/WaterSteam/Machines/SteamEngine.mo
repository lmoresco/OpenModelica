within ThermoSysPro.WaterSteam.Machines;
model SteamEngine 
  parameter Real caract[:, 2]=[0, 0; 15e5, 20.0] 
    "Engine charateristics Q=f(deltaP)";
  parameter Real eta_is=0.85 "Isentropic efficiency";
  parameter Real W_frot=0.0 
    "Power losses due to hydrodynamic friction (percent)";
  parameter Real eta_stato=1.0 
    "Efficiency to account for cinetic losses (<= 1) (s.u.)";
  parameter Integer mode_e=0 
    "Inlet IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  parameter Integer mode_s=0 
    "Outlet IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  Modelica.SIunits.Power W "Power produced by the engine";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.SpecificEnthalpy His 
    "Fluid specific enthalpy after isentropic expansion";
  ThermoSysPro.Units.DifferentialPressure deltaP "Pressure loss";
  ThermoSysPro.Units.AbsolutePressure Pe(start=10e5) "Pressure at the inlet";
  ThermoSysPro.Units.AbsolutePressure Ps(start=10e5) "Pressure at the outlet";
  ThermoSysPro.Units.AbsoluteTemperature Te "Temperature at the inlet";
  ThermoSysPro.Units.AbsoluteTemperature Ts "Temperature at the outlet";
  Real xm(start=1.0,min=0) "Average vapor mass fraction (n.u.)";
  
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proe 
    annotation (extent=[-80,80; -60,100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pros 
    annotation (extent=[60,80; 80,100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
         Polygon(points=[-60,100; -60,-100; 60,-100; 60,100; -60,100], style(
            fillColor=53, rgbfillColor={128,255,0})),
      Rectangle(extent=[-20,100; 20,12], style(fillColor=7, rgbfillColor={255,
              255,255})),
      Ellipse(extent=[-22,-16; 30,-66], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1)),
      Line(points=[0,60; 24,-42], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1)),
      Rectangle(extent=[-20,80; 20,40], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=7))),
    Icon(Polygon(points=[-60,100; -60,-100; 60,-100; 60,100; -60,100], style(
            fillColor=53, rgbfillColor={128,255,0})),
      Rectangle(extent=[-20,100; 20,20], style(fillColor=7, rgbfillColor={255,
              255,255})),
      Ellipse(extent=[-22,-16; 30,-66], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1)),
      Line(points=[0,60; 24,-42], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=1)),
      Rectangle(extent=[-20,80; 20,40], style(
          fillColor=7,
          rgbfillColor={255,255,255},
          fillPattern=7))),
    Window(
      x=0.17,
      y=0.1,
      width=0.76,
      height=0.76),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Benoît Bride</li>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
  Connectors.FluidInlet C1 
    annotation (extent=[-80,-10; -60,10]);
  Connectors.FluidOutlet C2      annotation (extent=[60,-10; 80,10]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ps props 
    annotation (extent=[-80,40; -60,60]);
equation 
  
  Pe = C1.P;
  Ps = C2.P;
  deltaP = Pe - Ps;
  
  C1.Q = C2.Q;
  Q = C1.Q;
  
  /* No flow reversal */
  0 = C1.h - C1.h_vol;
  
  /* Average vapor mass fraction during the expansion */
  xm = (proe.x + pros.x)/2.0;
  
  /* Mass flow */
  Q = ThermoSysPro.Functions.LinearInterpolation(caract[:, 1], caract[:, 2], deltaP);
  
  /* Fluid specific enthalpy at the outlet */
  C2.h - C1.h = xm*eta_is*(His - C1.h);
  
  /* Mechanical power produced by the engine */
  W = Q*eta_stato*(C1.h - C2.h)*(1 - W_frot/100);
  
  /* Fluid thermodynamic properties before the expansion */
  proe = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pe, C1.h, mode_e);
  Te = proe.T;
  
  /* Fluid thermodynamic properties after the expansion */
  pros = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Ps, C2.h, mode_s);
  Ts = pros.T;
  
  /* Fluid thermodynamic properties after the isentropic expansion */
  props = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ps(Ps, proe.s, mode_s);
  His = props.h;
  
end SteamEngine;
