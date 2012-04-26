within ThermoSysPro.WaterSteam.Junctions;
model StaticDrum "Staic drum" 
  parameter Real x=1 "Vapor separation efficiency at the outlet";
  
public 
  ThermoSysPro.Units.AbsoluteTemperature T "Fluid temperature";
  ThermoSysPro.Units.AbsolutePressure P(start=10.e5) "Fluid pressure";
  ThermoSysPro.Units.SpecificEnthalpy hl(start=100000) 
    "Liquid phase specific enthalpy";
  ThermoSysPro.Units.SpecificEnthalpy hv(start=2800000) 
    "Gas phase specific enthalpy";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[0, 90; 0, -100]),
      Ellipse(extent=[-98,96; 98,-96],   style(fillColor=6, rgbfillColor={255,
              255,0})),
      Line(points=[-86, -44; 86, -44], style(pattern=2)),
      Line(points=[-44, -86; 44, -86], style(pattern=2)),
      Line(points=[-64, -72; 64, -72], style(pattern=2)),
      Line(points=[-78, -58; 76, -58], style(pattern=2)),
      Text(extent=[-56, 94; -56, 92], string="Esteam")),
    Icon(
      Line(points=[0, 90; 0, -100]),
      Ellipse(extent=[-98, 96; 98, -96], style(fillColor=6, rgbfillColor={255,
              255,0})),
      Line(points=[-86, -44; 86, -44], style(pattern=2)),
      Line(points=[-44, -86; 44, -86], style(pattern=2)),
      Line(points=[-64, -72; 64, -72], style(pattern=2)),
      Line(points=[-78, -58; 76, -58], style(pattern=2))),
    Window(
      x=0.33,
      y=0.08,
      width=0.66,
      height=0.69),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
public 
  Connectors.FluidInlet Ce_eva 
    annotation (extent=[-104, -44; -84, -24]);
  Connectors.FluidInlet Ce_eco 
    annotation (extent=[-50, -104; -30, -84]);
  Connectors.FluidOutlet Cs_sup 
    annotation (extent=[84, 24; 104, 44]);
  Connectors.FluidOutlet Cs_eva 
    annotation (extent=[30, -104; 50, -84]);
  Connectors.FluidOutlet Cs_sur 
    annotation (extent=[28, 84; 48, 104]);
  Connectors.FluidOutlet Cs_purg 
    annotation (extent=[84, -44; 104, -24]);
  Connectors.FluidInlet Ce_steam 
    annotation (extent=[-48, 84; -28, 104]);
  Connectors.FluidInlet Ce_sup 
    annotation (extent=[-104, 26; -84, 46]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat lsat 
    annotation (extent=[-104, 66; -78, 98]);
  ThermoSysPro.Properties.WaterSteam.Common.PropThermoSat vsat 
    annotation (extent=[72, 68; 100, 100]);
  Thermal.Connectors.ThermalPort              Cth 
                                     annotation (extent=[-10,-10; 10,10]);
equation 
  /* Unconnected connectors */
  
  /* Steam input */
  if (cardinality(Ce_steam) == 0) then
    Ce_steam.Q = 0;
    Ce_steam.h = 1.e5;
    Ce_steam.b = true;
  end if;
  
  /* Extra input */
  if (cardinality(Ce_sup) == 0) then
    Ce_sup.Q = 0;
    Ce_sup.h = 1.e5;
    Ce_sup.b = true;
  end if;
  
  /* Input from evaporator */
  if (cardinality(Ce_eva) == 0) then
    Ce_eva.Q = 0;
    Ce_eva.h = 1.e5;
    Ce_eva.b = true;
  end if;
  
  /* Input from the economizer */
  if (cardinality(Ce_eco) == 0) then
    Ce_eco.Q = 0;
    Ce_eco.h = 1.e5;
    Ce_eco.b = true;
  end if;
  
  /* Output to the evaporator  */
  if (cardinality(Cs_eva) == 0) then
    Cs_eva.Q = 0;
    Cs_eva.h = 1.e5;
    Cs_eva.a = true;
  end if;
  
  /* Purges du ballon  */
  if (cardinality(Cs_purg) == 0) then
    Cs_purg.Q = 0;
    Cs_purg.h = 1.e5;
    Cs_purg.a = true;
  end if;
  
  /* Extra output  */
  if (cardinality(Cs_sup) == 0) then
    Cs_sup.Q = 0;
    Cs_sup.h = 1.e5;
    Cs_sup.a = true;
  end if;
  
  /* Output to reheater */
  if (cardinality(Cs_sur) == 0) then
    Cs_sur.Q = 0;
    Cs_sur.h = 1.e5;
    Cs_sur.a = true;
  end if;
  
  /* Fluid pressure */
  P = Ce_steam.P;
  P = Ce_sup.P;
  P = Ce_eva.P;
  P = Ce_eco.P;
  P = Cs_eva.P;
  P = Cs_purg.P;
  P = Cs_sup.P;
  P = Cs_sur.P;
  
  /* Fluid specific enthalpies at the inlets and outlets */
  Ce_sup.h_vol = hl;
  Ce_eva.h_vol = hl;
  Ce_eco.h_vol = hl;
  Ce_steam.h_vol = hv;
  
  Cs_purg.h_vol = hl;
  Cs_sup.h_vol = hl;
  Cs_eva.h_vol = hl;
  Cs_sur.h_vol = (1 - x)*hl + x*hv;
  
  /* Mass balance equation */
  Ce_eco.Q + Ce_steam.Q + Ce_sup.Q + Ce_eva.Q - Cs_eva.Q - Cs_sur.Q - Cs_purg.Q - Cs_sup.Q = 0;
  
  /* Energy balance equation */
  Ce_eco.Q*Ce_eco.h + Ce_steam.Q*Ce_steam.h + Ce_sup.Q*Ce_sup.h + Ce_eva.Q*Ce_eva.h - Cs_eva.Q*Cs_eva.h
  - Cs_sur.Q*Cs_sur.h - Cs_purg.Q*Cs_purg.h - Cs_sup.Q*Cs_sup.h + Cth.W = 0;
  
  /* Fluid thermodynamic properties */
  (lsat,vsat) = ThermoSysPro.Properties.WaterSteam.IF97.Water_sat_P(P);
  
  hl = lsat.h;
  hv = vsat.h;
  T = lsat.T;
  
  Cth.T = T;
  
end StaticDrum;
