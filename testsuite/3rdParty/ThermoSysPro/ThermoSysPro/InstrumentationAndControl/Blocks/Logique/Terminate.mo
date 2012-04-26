within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Terminate 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-80, 0; 40, 0]),
      Line(points=[40, 40; 40, -40]),
      Rectangle(extent=[-100, -100; 100, 102], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Polygon(points=[-70, -20; -70, 40; -30, 80; 30, 80; 70, 40; 70, -20; 30,
            -60; -30, -60; -70, -20], style(color=0)),
      Text(
        extent=[-48, 40; 50, -20],
        string="STOP",
        style(color=0))),
    Diagram(Polygon(points=[-70, -20; -70, 40; -30, 80; 30, 80; 70, 40; 70, -20;
             30, -60; -30, -60; -70, -20], style(color=0)), Text(
        extent=[-48, 40; 50, -20],
        string="STOP",
        style(color=0))),
    Window(
      x=0.25,
      y=0.16,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL 
                                          annotation (extent=[-120, -10; -100, 10]);
algorithm 
  
  when uL.signal then
    terminate("Fin de la simulation");
  end when;
end Terminate;
