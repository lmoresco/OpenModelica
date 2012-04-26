within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block AND3 
  
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
      Text(
        extent=[-54, 20; 50, -20],
        string="&",
        style(color=0)),
      Text(extent=[-150, 150; 150, 110], string="%name")),
    Diagram(Text(
        extent=[-54, 20; 50, -20],
        string="&",
        style(color=0))),
    Window(
      x=0.17,
      y=0.15,
      width=0.76,
      height=0.65),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL1 
                                           annotation (extent=[-120, 70; -100, 90]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL2 
                                           annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL3 
                                           annotation (extent=[-120, -90; -100, -70]);
algorithm 
  
  yL.signal := uL1.signal and uL2.signal and uL3.signal;
end AND3;
