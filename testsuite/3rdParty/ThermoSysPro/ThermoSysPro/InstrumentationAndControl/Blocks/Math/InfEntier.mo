within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block InfEntier 
  parameter Integer C1=0 "Valeur de u1 si u1 non connecté";
  parameter Integer C2=0 "Valeur de u2 si u2 non connecté";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[-100, 60; -52, 60]),
      Line(points=[-100, -60; -52, -60]),
      Text(
        extent=[-36, 34; 40, -34],
        string="<",
        style(color=0)),
      Text(
        extent=[-100,100; -38,68],
        style(color=3, rgbcolor={0,0,255}),
        string="C1"),
      Text(
        extent=[-100,-68; -38,-100],
        style(color=3, rgbcolor={0,0,255}),
        string="C2")),
    Window(
      x=0.27,
      y=0.13,
      width=0.6,
      height=0.6),
    Diagram(
      Line(points=[50, 0; 100, 0]),
      Line(points=[50, 0; 100, 0]),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[80, 0; 100, 0]),
      Ellipse(extent=[-80, 80; 80, -80]),
      Line(points=[-100, 60; -52, 60]),
      Line(points=[-100, -60; -52, -60]),
      Text(
        extent=[-36, 34; 40, -34],
        string="<",
        style(color=0)),
      Text(
        extent=[-100,100; -38,68],
        style(color=3, rgbcolor={0,0,255}),
        string="C1"),
      Text(
        extent=[-100,-68; -38,-100],
        style(color=3, rgbcolor={0,0,255}),
        string="C2")),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Math library</b></p>
</HTML>
<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputLogical yL 
                                     annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputInteger u1 
                                          annotation (extent=[-120,50; -100,70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputInteger u2 
                                          annotation (extent=[-120,-70; -100,-50]);
equation 
  
  if (cardinality(u1) == 0) then
    u1.signal = C1;
  end if;
  
  if (cardinality(u2) == 0) then
    u2.signal = C2;
  end if;
  
  yL.signal = (u1.signal < u2.signal);
end InfEntier;
