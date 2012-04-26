within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Constante 
  parameter Boolean K=true;
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Polygon(points=[-80, 90; -88, 68; -72, 68; -80, 90], style(color=8,
            fillColor=8)),
      Line(points=[-80, 68; -80, -80], style(color=8)),
      Line(points=[-80, 0; 80, 0], style(color=0, thickness=2)),
      Line(points=[-90, -70; 82, -70], style(color=8)),
      Polygon(points=[90, -70; 68, -62; 68, -78; 90, -70], style(color=8,
            fillColor=8)),
      Text(
        extent=[-93, 90; -40, 72],
        string="y",
        style(color=9)),
      Text(
        extent=[70, -80; 94, -100],
        string="temps",
        style(color=9)),
      Text(
        extent=[-101, 8; -81, -12],
        string="K",
        style(color=9))),
    Icon(
      Rectangle(extent=[-100, -100; 100, 102], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Text(
        extent=[-154, -14; 146, 26],
        string="%K",
        style(color=0)),
      Text(extent=[-150, 150; 150, 110], string="%name")),
    Window(
      x=0.1,
      y=0.22,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  yL.signal := K;
end Constante;
