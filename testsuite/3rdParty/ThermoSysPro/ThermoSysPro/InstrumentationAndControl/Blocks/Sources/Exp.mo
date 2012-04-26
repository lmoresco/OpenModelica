within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block Exp 
  parameter Real ymax=1 "Hauteur de la sortie pour riseTime infini";
  parameter Real riseTime(min=0) = 0.5 "Durée du front montant";
  parameter Real riseTimeConst(min=Modelica.Constants.small) = 0.1 
    "Constante du front montant";
  parameter Real fallTimeConst(min=Modelica.Constants.small) = 0.1 
    "Constante du front descendant";
  parameter Real offset=0 "Décalage de la sortie";
  parameter Real startTime=0 "Instant de départ de l'exponentielle";
  
protected 
  Real y_riseTime;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-90, -70; 68, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Line(points=[-80, -70; -77.2, -55.3; -74.3, -42.1; -70.8, -27.6; -67.3, -15;
             -63.7, -4.08; -59.5, 7.18; -55.3, 16.7; -50.3, 26; -44.6, 34.5; -38.3,
             42.1; -31.2, 48.6; -22.7, 54.3; -12.1, 59.2; -10, 60; -7.88, 47.5;
             -5.05, 32.7; -2.22, 19.8; 0.606, 8.45; 4.14, -3.7; 7.68, -14; 11.9,
             -24.2; 16.2, -32.6; 21.1, -40.5; 26.8, -47.4; 33.1, -53.3; 40.9, -58.5;
             50.8, -62.8; 60, -65.4], style(color=0)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8))),
    Window(
      x=0.23,
      y=0.27,
      width=0.6,
      height=0.6),
    Diagram(
      Line(points=[-100, -70; 84, -70], style(color=8)),
      Polygon(points=[100, -70; 84, -64; 84, -76; 100, -70], style(color=8,
            fillColor=8)),
      Line(points=[-40, -30; -37.2, -15.3; -34.3, -2.1; -30.8, 12.4; -27.3, 25;
             -23.7, 35.92; -19.5, 47.18; -15.3, 56.7; -10.3, 66; -4.6, 74.5;
            1.7, 82.1; 8.8, 88.6; 17.3, 94.3; 27.9, 99.2; 30, 100; 32.12, 87.5;
             34.95, 72.7; 37.78, 59.8; 40.606, 48.45; 44.14, 36.3; 47.68, 26;
            51.9, 15.8; 56.2, 7.4; 61.1, -0.5; 66.8, -7.4; 73.1, -13.3; 80.9, -18.5;
             90.8, -22.8; 100, -25.4], style(color=0, thickness=2)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Text(
        extent=[-82, 91; -41, 71],
        string="y",
        style(color=9)),
      Text(
        extent=[-78, -43; -46, -56],
        string="offset",
        style(color=9)),
      Polygon(points=[-40, -70; -43, -60; -38, -60; -40, -70; -40, -70], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-40, -29; -40, -60], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[-40, -30; -42, -40; -37, -40; -40, -30], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-39, -30; -80, -30], style(color=0, thickness=2)),
      Text(
        extent=[-59, -71; -13, -89],
        string="startTime",
        style(color=9)),
      Polygon(points=[-41, -30; -32, -28; -32, -32; -41, -30], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-40, -30; 29, -30], style(
          color=8,
          pattern=1,
          thickness=1,
          arrow=0)),
      Polygon(points=[29, -30; 21, -28; 21, -32; 29, -30], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Text(
        extent=[-26, -12; 19, -28],
        string="riseTime",
        style(color=9)),
      Text(
        extent=[78, -76; 102, -96],
        string="temps",
        style(color=9)),
      Line(points=[30, 100; 30, -34], style(color=8, pattern=2))),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.7</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y_riseTime = ymax*(1 - Modelica.Math.exp(-riseTime/riseTimeConst));
  
  y.signal = offset + (if (time < startTime) then 0 else if (time < (startTime
     + riseTime)) then ymax*(1 - exp(-(time - startTime)/riseTimeConst)) else 
    y_riseTime*Modelica.Math.exp(-(time - startTime - riseTime)/fallTimeConst));
  
end Exp;
