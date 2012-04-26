within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Selecteur 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[12, 0; 100, 0], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-100, 0; -40, 0], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-98, -80; -40, -80], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-40, 10; -40, -10], style(color=0)),
      Line(points=[-98, 80; -40, 80], style(color=0)),
      Line(points=[-40, 80; 10, 0], style(color=0)),
      Ellipse(extent=[2, 8; 18, -8], style(
          color=9,
          fillColor=9,
          fillPattern=1)),
      Line(points=[-40, 70; -40, 80], style(color=0)),
      Line(points=[-40, 80; -30, 76], style(color=0))),
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
      Line(points=[12, 0; 100, 0], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-100, 0; -40, 0], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-98, -80; -40, -80], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Line(points=[-40, 10; -40, -10], style(color=0)),
      Line(points=[-98, 80; -40, 80], style(color=0)),
      Line(points=[-40, 80; 10, 0], style(color=0)),
      Ellipse(extent=[2, 8; 18, -8], style(
          color=9,
          fillColor=9,
          fillPattern=1)),
      Line(points=[-40, 70; -40, 80], style(color=0)),
      Line(points=[-40, 80; -30, 76], style(color=0))),
    Window(
      x=0.23,
      y=0.22,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uCond 
                                             annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL1 
                                           annotation (extent=[-120, 70; -100, 90]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL2 
                                           annotation (extent=[-120, -90; -100, -70]);
algorithm 
  
  yL.signal := if uCond.signal then uL1.signal else uL2.signal;
end Selecteur;
