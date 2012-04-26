within ThermoSysPro.WaterSteam.Boilers;
model ElectricBoiler "Electric boiler" 
  parameter Modelica.SIunits.Power W=1e6 "Electrical power";
  parameter Real eta = 100 "Boiler efficiency (percent)";
  parameter ThermoSysPro.Units.DifferentialPressure deltaP=0 "Pressure loss";
  parameter Integer mode=0 
    "IF97 region. 1:liquid - 2:steam - 4:saturation line - 0:automatic";
  
public 
  ThermoSysPro.Units.AbsoluteTemperature Te(start=300) "Inlet temperature";
  ThermoSysPro.Units.AbsoluteTemperature Ts(start=500) "Outlet temperature";
  Modelica.SIunits.MassFlowRate Q(start=100) "Mass flow";
  ThermoSysPro.Units.SpecificEnthalpy deltaH 
    "Specific enthalpy variation between the outlet and the inlet";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100,80; 100,-80], style(fillColor=6, rgbfillColor={255,
              255,0})),
      Line(points=[22,54; -30,2; 30,2; -24,-52; -28,-56], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=2)),
      Polygon(points=[-26,-50; -22,-54; -28,-56; -26,-50], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=2,
          fillColor=1,
          rgbfillColor={255,0,0},
          fillPattern=1))),
    Diagram(
      Rectangle(extent=[-100,80; 100,-80], style(fillColor=6, rgbfillColor={255,
              255,0})),
      Polygon(points=[-26,-48; -20,-54; -28,-56; -26,-48], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4,
          fillColor=1,
          rgbfillColor={255,0,0})),
      Line(points=[22,54; -30,2; 30,2; -24,-52; -28,-56], style(
          color=1,
          rgbcolor={255,0,0},
          thickness=4))),
    Window(
      x=0.05,
      y=0.01,
      width=0.93,
      height=0.87),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b> </p>
<p><b>ThermoSysPro Version 2.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
public 
  Connectors.FluidInlet Ce 
                          annotation(extent=[-110, -10; -90, 10]);
  Connectors.FluidOutlet Cs 
                          annotation(extent=[90, -8; 110, 12]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph proe 
    annotation(extent=[-100, 80; -80, 100]);
  ThermoSysPro.Properties.WaterSteam.Common.ThermoProperties_ph pros 
    annotation(extent=[80,80; 100,100]);
equation 
  
  Ce.P - Cs.P = deltaP;
  
  Ce.Q = Cs.Q;
  Q = Ce.Q;
  
  Cs.h - Ce.h = deltaH;
  
  /* Flow reversal */
  0 = if (Q > 0) then Ce.h - Ce.h_vol else Cs.h - Cs.h_vol;
  
  /* Calcul de l'enthalpie en sortie */
  W = Q*deltaH/eta/100;
  
  /* Fluid thermodynamic properties */
  proe = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Ce.P, Ce.h, mode);
  pros = ThermoSysPro.Properties.WaterSteam.IF97.Water_Ph(Cs.P, Cs.h, mode);
  
  Te = proe.T;
  Ts = pros.T;
  
end ElectricBoiler;
