within ThermoSysPro.InstrumentationAndControl.Blocks.Discret;
block PI 
  parameter Real k=1 "Gain";
  parameter Real Ti=1 "Constante de temps";
  parameter Real initialCond=0 "Condition initiale";
  parameter Real SampleOffset=0 "Instant de départ de l'échantillonnage (s)";
  parameter Real SampleInterval=0.01 "Période d'échantillonnage (s)";
  
protected 
  Real x(start=initialCond);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=8)),
      Line(points=[-74, 64; -74, -80], style(color=0)),
      Line(points=[-74, -80; 70, -80], style(color=0)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=9,
          fillPattern=1)),
      Line(points=[-74, -68; -74, 2; 66, 58], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=9)),
      Text(extent=[-154, 142; 146, 102], string="%name"),
      Text(
        extent=[-38, 10; 52, -30],
        string="K=%k",
        style(color=0)),
      Text(
        extent=[-36, -34; 54, -74],
        string="Ti=%Ti",
        style(color=0)),
      Polygon(points=[-74, 86; -82, 64; -66, 64; -74, 86], style(
          color=8,
          fillColor=10,
          fillPattern=1))),
    Window(
      x=0.26,
      y=0.13,
      width=0.78,
      height=0.7),
    Diagram(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-100, 0; -60, 0]),
      Line(points=[62, 0; 100, 0]),
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Text(
        extent=[-68, 24; -24, -18],
        string="k",
        style(color=0)),
      Text(
        extent=[-32, 48; 60, 0],
        string="T s + 1",
        style(color=0)),
      Text(
        extent=[-30, -8; 52, -40],
        string="T s",
        style(color=0)),
      Line(points=[-24, 0; 54, 0], style(color=0))),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
algorithm 
  
  when sample(SampleOffset, SampleInterval) then
    x := pre(x) + SampleInterval/Ti*pre(u.signal);
    y.signal := k*(x + u.signal);
  end when;
end PI;
