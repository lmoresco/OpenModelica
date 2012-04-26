within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block Pre 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Text(
        extent=[-40, 28; 46, -24],
        string="PRE",
        style(color=0))),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 102], style(
          color=3,
          pattern=1,
          thickness=1,
          gradient=0,
          arrow=0,
          fillColor=30,
          fillPattern=1)),
      Text(
        extent=[-40, 28; 46, -24],
        string="PRE",
        style(color=0))),
    Window(
      x=0.3,
      y=0.16,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL 
                                          annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  yL.signal := pre(uL.signal);
end Pre;
