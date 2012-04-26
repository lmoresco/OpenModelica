within ThermoSysPro.InstrumentationAndControl.Blocks.Logique;
block AND4 
  
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
      x=0.16,
      y=0.18,
      width=0.76,
      height=0.65),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL1 
                                           annotation (extent=[-120, 80; -100, 100]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL2 
                                           annotation (extent=[-120, 20; -100, 40]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                           annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL3 
                                           annotation (extent=[-120, -40; -100, -20]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputLogical uL4 
                                           annotation (extent=[-120, -100; -100, -80]);
algorithm 
  
  yL.signal := uL1.signal and uL2.signal and uL3.signal and uL4.signal;
end AND4;
