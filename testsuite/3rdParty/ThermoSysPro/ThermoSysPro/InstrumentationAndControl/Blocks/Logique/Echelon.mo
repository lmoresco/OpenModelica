within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Echelon 
  parameter Real startTime=0 "Instant de l'impulsion";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 102], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-154, -14; 146, 26],
        string="%K",
        style(color=0)),
      Rectangle(extent=[-100, -100; 100, 102], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Line(points=[-80, -70; 0, -70; 0, 46; 78, 46], style(color=0))),
    Diagram(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-78, 90; -37, 70],
        string="y",
        style(color=9)),
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, -70; 0, -70; 0, 46; 78, 46], style(color=0)),
      Text(
        extent=[-21, -72; 25, -90],
        string="startTime",
        style(color=9)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Text(
        extent=[-108, 54; -76, 40],
        string="true",
        style(color=9)),
      Line(points=[0, 46; -80, 46], style(color=9, pattern=2)),
      Text(
        extent=[-108, -56; -76, -70],
        string="false",
        style(color=9))),
    Window(
      x=0.05,
      y=0.32,
      width=0.75,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Sources library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  yL.signal := (if time < startTime then false else true);
end Echelon;
