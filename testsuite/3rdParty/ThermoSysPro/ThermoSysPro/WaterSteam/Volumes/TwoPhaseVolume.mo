within ThermoSysPro.WaterSteam.Volumes;
model TwoPhaseVolume "TwoPhaseVolume" 
  parameter Modelica.SIunits.Volume V=1 "Cavity volume";
  parameter Modelica.SIunits.Area A=1 "Cavity cross-sectional area";
  parameter Real Vf0=0.5 
    "Fraction of initial water volume in the drum (active if steady_state=false)";
  parameter ThermoSysPro.Units.AbsolutePressure P0=0.1e5 
    "Fluid initial pressure (active if steady_state=false)";
  parameter Real Ccond=0.01 "Condensation coefficient";
  parameter Real Cevap=0.09 "Evaporation coefficient";
  parameter Real Xlo=0.0025 
    "Vapor mass fraction in the liquid phase from which the liquid starts to evaporate";
  parameter Real Xvo=0.9975 
    "Vapor mass fraction in the gas phase from which the liquid starts to condensate";
  parameter Modelica.SIunits.Area Avl=A 
    "Heat exchange surface between the liquid and gas phases";
  parameter Real Kvl=1000 
    "Heat exchange coefficient between the liquid and gas phases";
  parameter Boolean steady_state=true 
    "true: start from steady state - false: start from (P0, Vl0)";
  
protected 
  constant Modelica.SIunits.Acceleration g=Modelica.Constants.g_n 
    "Gravity constant";
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid average pressure";
  ThermoSysPro.Units.AbsolutePressure Pfond 
    "Fluid pressure at the bottom of the cavity";
  ThermoSysPro.Units.SpecificEnthalpy hl "Liquid phase spepcific enthalpy";
  ThermoSysPro.Units.SpecificEnthalpy hv "Gas phase spepcific enthalpy";
  ThermoSysPro.Units.AbsoluteTemperature Tl "Liquid phase temperature";
  ThermoSysPro.Units.AbsoluteTemperature Tv "Gas phase temperature";
  Modelica.SIunits.Volume Vl "Liquid phase volume";
  Modelica.SIunits.Volume Vv "Gas phase volume";
  Real xl(start=0.5) "Mass vapor fraction in the liquid phase";
  Real xv(start=0) "Mass vapor fraction in the gas phase";
  Modelica.SIunits.Density rhol(start=996) "Liquid phase density";
  Modelica.SIunits.Density rhov(start=1.5) "Gas phase density";
  Modelica.SIunits.MassFlowRate BQl 
    "Right hand side of the mass balance equation of the liquid phase";
  Modelica.SIunits.MassFlowRate BQv 
    "Right hand side of the mass balance equation of the gas phaser";
  Modelica.SIunits.Power BHl 
    "Right hand side of the energy balance equation of the liquid phase";
  Modelica.SIunits.Power BHv 
    "Right hand side of the energy balance equation of the gas phase";
  Modelica.SIunits.MassFlowRate Qcond 
    "Condensation mass flow rate from the vapor phase";
  Modelica.SIunits.MassFlowRate Qevap 
    "Evaporation mass flow rate from the liquid phase";
  Modelica.SIunits.Power Wvl 
    "Thermal power exchanged from the gas phase to the liquid phase";
  
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph prol 
    "Propriétés de l'eau dans le ballon" annotation (extent=[-60, 40; -20, 80]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph prov 
    "Propriétés de la vapeur dans le ballon" annotation (extent=[0, 40; 40, 80]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat lsat 
    annotation (extent=[-60, -80; -20, -40]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat vsat 
                                           annotation (extent=[0, -80; 40, -40]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram,
    Icon(
      Polygon(points=[0, 100; -20, 98; -40, 92; -60, 80; -80, 60; -92, 40; -98,
             20; -100, 0; -98, -20; 98, -20; 100, 0; 98, 20; 92, 40; 80, 60; 60,
             80; 40, 92; 20, 98; 0, 100], style(fillColor=7)),
      Ellipse(extent=[-100, 100; 100, -100], style(fillColor=71, rgbfillColor={
              85,170,255})),
      Polygon(points=[0, 100; -20, 98; -40, 92; -60, 80; -80, 60; -92, 40; -98,
             20; -100, 0; -98, -20; 98, -20; 100, 0; 98, 20; 92, 40; 80, 60; 60,
             80; 40, 92; 20, 98; 0, 100], style(fillColor=68, rgbfillColor={170,
              213,255}))),
    Window(
      x=0.11,
      y=0.06,
      width=0.78,
      height=0.88),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Daniel Bouskela</li>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
  Connectors.FluidInlet Cv "Steam input" 
                                    annotation (extent=[-10, 90; 10, 110]);
  Connectors.FluidOutlet Cl "Water output" 
                                     annotation (extent=[-10,-110; 10,-90]);
  ThermoSysPro.Thermal.Connectors.ThermalPort Cth 
                                     annotation (extent=[-10, 10; 10, 30]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal yLevel 
    "Water level"                        annotation (extent=[100, -10; 120, 10]);
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph prod 
    annotation (extent=[-60,-20; -20,20]);
  Connectors.FluidInlet Ce "Water input" 
                                    annotation (extent=[-110,-10; -90,10]);
initial equation 
  if steady_state then
    der(hl) = 0;
    der(hv) = 0;
    der(Vl) = 0;
    der(P) = 0;
  else
    hl = lsat.h;
    hv = vsat.h;
    Vl = Vf0*V;
    P = P0;
  end if;
  
equation 
  /* Unconnected connectors */
  if (cardinality(Cl) == 0) then
    Cl.Q = 0;
    Cl.h = 1.e5;
    Cl.b = true;
  end if;
  
  if (cardinality(Cv) == 0) then
    Cv.Q = 0;
    Cv.h = 1.e5;
    Cv.a = true;
  end if;
  
  if (cardinality(Ce) == 0) then
    Ce.Q = 0;
    Ce.h = 1.e5;
    Ce.b = true;
  end if;
  
  Cl.P = Pfond;
  Cv.P = P;
  Ce.P = P;
  
  V = Vl + Vv;
  
  /* Pressure at the bottom of the cavity */
  Pfond = P + prod.d*g*Vl/A;
  
  /* Liquid phase mass balance equation */
  BQl = -Cl.Q + Qcond - Qevap + Ce.Q;
  rhol*der(Vl) + Vl*(prol.ddph*der(P) + prol.ddhp*der(hl)) = BQl;
  
  /* Vapor phase mass balance equation */
  BQv = Cv.Q + Qevap - Qcond;
  rhov*der(Vv) + Vv*(prov.ddph*der(P) + prov.ddhp*der(hv)) = BQv;
  
  /* Liquid phase energy balance equation */
  BHl = -Cl.Q*(Cl.h - (hl - P/rhol)) + Qcond*(lsat.h - (hl - P/rhol)) - Qevap*(vsat.h - (hl - P/rhol)) + Ce.Q*(Ce.h - (hl - P/rhol)) + Wvl;
  Vl*((P/rhol*prol.ddph - 1)*der(P) + (P/rhol*prol.ddhp + rhol)*der(hl)) = BHl;
  
  Cl.h_vol = hl;
  Ce.h_vol = hl;
  
  /* Gas phase energy balance equation */
  BHv = Cv.Q*(Cv.h - (hv - P/rhov)) + Qevap*(vsat.h - (hv - P/rhov)) - Qcond*(lsat.h - (hv - P/rhov)) - Wvl + Cth.W;
  Vv*((P/rhov*prov.ddph - 1)*der(P) + (P/rhov*prov.ddhp + rhov)*der(hv)) = BHv;
  
  Cv.h_vol = hv;
  
  /* Heat exchange between liquid and gas phases */
  Wvl = Kvl*Avl*(Tv - Tl);
  
  /* Condensation and evaporation mass flow rates */
  Qcond = if (xv < Xvo) then Ccond*rhov*Vv*(Xvo - xv) else 0;
  Qevap = if (xl > Xlo) then Cevap*rhol*Vl*(xl - Xlo) else 0;
  
  /* Water leval */
  yLevel.signal = Vl/A;
  
  /* Fluid thermodynamic properties */
  prol = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph((P + Pfond)/2, hl);
  prov = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(P, hv);
  prod = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Pfond, Cl.h);
  (lsat,vsat) = ThermoSysPro.Properties.WaterSteam.IF97.Water_sat_P(P);
  
  Tl = prol.T;
  rhol = prol.d;
  xl = prol.x;
  
  Tv = prov.T;
  rhov = prov.d;
  xv = prov.x;
  
  Cth.T = Tv;
  
end TwoPhaseVolume;
