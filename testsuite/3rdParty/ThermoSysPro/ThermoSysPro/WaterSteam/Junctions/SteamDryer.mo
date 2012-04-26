within ThermoSysPro.WaterSteam.Junctions;
model SteamDryer "Steam dryer" 
  parameter Real eta=1 "Steam dryer efficiency (0 < eta <= 1)";
  parameter Integer mode_e=0 
    "IF97 region at the inlet. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsolutePressure P(start=10e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  Real xe(start=1.0) "Vapor mass fraction at the inlet";
  
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proe 
    annotation (extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-98,40; -18,-100; 22,-100; 102,40; -98,40], style(
            fillColor=6, rgbfillColor={255,255,0}))),
    Icon(   Polygon(points=[-100,40; -20,-100; 20,-100; 100,40; -100,40], style(
            fillColor=6, rgbfillColor={255,255,0}))),
    Window(
      x=0.17,
      y=0.1,
      width=0.76,
      height=0.76),
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
  Connectors.FluidInlet Cev 
    annotation (extent=[-109,30; -89,50]);
  Connectors.FluidOutlet Csv               annotation (extent=[89,30; 109,50]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat lsat1 
    annotation (extent=[-100,-98; -80,-78]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat vsat1 
    annotation (extent=[-76,-98; -56,-78]);
  Connectors.FluidOutlet Csl               annotation (extent=[-9,-110; 11,-90]);
  
equation 
  assert((eta > 0) and (eta <= 1), "SteamDryer - Parameter eta should be > 0 and <= 1");
  
  /* Fluid pressure */
  P = Cev.P;
  P = Csv.P;
  P = Csl.P;
  
  /* Fluid specific enthalpy (singular if all flows = 0) */
  Cev.h_vol = h;
  Csv.h_vol = h;
  Csl.h_vol = lsat1.h;
  
  /* Mass flow at the vapor outlet */
  Csv.Q = Cev.Q*xe/eta;
  
  /* Mass balance equation */
  0 = Cev.Q - Csv.Q - Csl.Q;
  
  /* Energy balance equation */
  0 = Cev.Q*Cev.h - Csv.Q*Csv.h - Csl.Q*Csl.h;
  
  /* Fluid thermodynamic properties */
  proe = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Cev.P, Cev.h, mode_e);
  
  /* Vapor mass fraction at the inlet */
  xe = proe.x;
  
  /* Fluid thermodynamic properties at the saturation point */
  (lsat1,vsat1) = ThermoSysPro.Properties.WaterSteam.IF97.Water_sat_P(Cev.P);
  
end SteamDryer;
