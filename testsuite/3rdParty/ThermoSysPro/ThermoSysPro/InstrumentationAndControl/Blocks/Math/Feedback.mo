within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Feedback "Différence entre la commande et le feedback" 
  
  annotation (
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Math library</b></p>
</HTML>
<html>
<p><b>Version 1.6</b></p>
</HTML>
"), Icon(
      Ellipse(extent=[-20, 20; 20, -20], style(
          pattern=1,
          thickness=1,
          fillColor=30,
          fillPattern=1)),
      Line(points=[-100,0; -20,0]),
      Line(points=[20,0; 100,0]),
      Line(points=[0,-20; 0,-100]),
      Text(
        extent=[-16,-18; 44,-52],
        style(color=3, rgbcolor={0,0,255}),
        string="-"),
      Text(
        extent=[-56,4; -6,-24],
        style(color=3, rgbcolor={0,0,255}),
        string="+"),
      Text(extent=[-150,150; 150,110],   string="%name")),
    Diagram(
      Ellipse(extent=[-20, 20; 20, -20], style(
          pattern=1,
          thickness=1,
          fillColor=30,
          fillPattern=1)),
      Line(points=[-100,0; -20,0]),
      Line(points=[20,0; 100,0]),
      Line(points=[0,-20; 0,-100]),
      Text(
        extent=[-54,2; -4,-26],
        style(color=3, rgbcolor={0,0,255}),
        string="+"),
      Text(
        extent=[-14,-20; 46,-54],
        style(color=3, rgbcolor={0,0,255}),
        string="-"),
      Text(
        extent=[-100,26; -72,10],
        style(color=3, rgbcolor={0,0,255}),
        string="u1"),
      Text(
        extent=[4,-84; 42,-94],
        style(color=3, rgbcolor={0,0,255}),
        string="u2"),
      Text(
        extent=[70,26; 98,10],
        style(color=3, rgbcolor={0,0,255}),
        string="y")));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u2 
    annotation (extent=[-10,-120; 10,-100],rotation=90);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
    annotation (extent=[100,-10; 120,10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u1 
    annotation (extent=[-120,-10; -100,10]);
equation 
  y.signal = u1.signal - u2.signal;
end Feedback;
