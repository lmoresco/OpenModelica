within ThermoSysPro.InstrumentationAndControl.Blocks.Sources;
block ConstanteEntier 
  parameter Integer k=1 "Valeur de la sortie entiere";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Line(points=[-80, 0; 80, 0], style(color=0)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Text(
        extent=[-89, 90; -36, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9))),
    Icon(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, 0; 80, 0], style(color=0)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-148, 14; 152, 54],
        string="%k",
        style(color=0))),
    Window(
      x=0.42,
      y=0.22,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OuputInteger y 
                                          annotation (extent=[100,-10; 120,10]);
equation 
  
  y.signal = k;
end ConstanteEntier;
