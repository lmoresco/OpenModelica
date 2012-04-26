within ThermoSysPro.WaterSteam.Junctions;
model SteamExtractionSplitter "Splitter for steam extraction" 
  parameter Real alpha = 1 "Steam extraction rate (0 <= alpha <= 1)";
  parameter Integer mode_e=0 
    "IF97 region at the inlet. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  Real x_ex(start=0.99) "Vapor mass fraction at the extraction outlet";
  ThermoSysPro.Units.AbsolutePressure P(start=10e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy h(start=10e5) "Fluid specific enthalpy";
  
public 
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proe 
    annotation (extent=[-100, 80; -80, 100]);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[-100,30; -100,-30; -40,-30; 20,-100; 20,-100; 60,
            -100; 70,-100; 0,-30; 100,-30; 100,30; -100,30], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0}))),
    Icon(Polygon(points=[-100,28; -100,-32; -40,-32; 20,-102; 20,-102; 60,-102;
            70,-102; 0,-32; 100,-32; 100,28; -100,28], style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=6,
          rgbfillColor={255,255,0}))),
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
  Connectors.FluidInlet Ce 
    annotation (extent=[-113,-10; -93,10]);
  Connectors.FluidOutlet Cs      annotation (extent=[93,-10; 113,10]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat lsat 
    annotation (extent=[-60,80; -40,100]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat vsat 
    annotation (extent=[-20,80; 0,100]);
  Connectors.FluidOutlet Cex "Extraction outlet" 
                                 annotation (extent=[30,-110; 50,-90]);
equation 
  
  /* Fluid pressure */
  P = Ce.P;
  P = Cs.P;
  P = Cex.P;
  
  /* Fluid specific enthalpy (singular if all flows = 0) */
  Ce.h_vol = h;
  Cs.h_vol = h;
  Cex.h_vol = if noEvent(x_ex < 1) then (1 - x_ex)*lsat.h + x_ex*vsat.h else h;
  
  /* Mass balance equation */
  0 = Ce.Q - Cs.Q - Cex.Q;
  
  /* Energy balance equation */
  0 = Ce.Q*Ce.h - Cs.Q*Cs.h - Cex.Q*Cex.h;
  
  /* Fluid thermodynamic properties at the inlet */
  proe = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(P, Ce.h, mode_e);
  
  /* Fluid thermodynamic properties at the saturation point */
  (lsat,vsat) = ThermoSysPro.Properties.WaterSteam.IF97.Water_sat_P(P);
  
  /* Vapor mass fraction at the extraction outlet */
  x_ex = 1 - alpha*(1 - proe.x);
  
end SteamExtractionSplitter;
