within ThermoSysPro.InstrumentationAndControl.Blocks.Math;
block Polynome 
  parameter Real a[:]={1,1} "Vecteur des coefficients du polynome";
  
protected 
  parameter Integer n=size(a, 1) - 1;
  Real xp[n + 1];
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -68; -74, 2; 66, 58], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=8)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Text(
        extent=[-138, -72; 162, -32],
        string="K=%k",
        style(color=0)),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-80, 80; -77.6, 61.1; -74.4, 39.3; -71.2, 20.7; -67.1, 1.29;
             -63.1, -14.6; -58.3, -29.8; -52.7, -43.5; -46.2, -55.1; -39, -64.3;
             -30.2, -71.7; -18.9, -77.1; -4.42, -79.9; 10.9, -79.1; 23.7, -75.2;
             34.2, -68.7; 42.2, -60.6; 48.6, -51.2; 54.3, -40; 59.1, -27.5;
            63.1, -14.6; 67.1, 1.29; 71.2, 20.7; 74.4, 39.3; 77.6, 61.1; 80, 80],
           style(color=0)),
      Text(
        extent=[-36, 14; 36, -34],
        string="pol",
        style(color=8))),
    Diagram(
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -68; -74, 2; 66, 58], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=8)),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-80, 80; -77.6, 61.1; -74.4, 39.3; -71.2, 20.7; -67.1, 1.29;
             -63.1, -14.6; -58.3, -29.8; -52.7, -43.5; -46.2, -55.1; -39, -64.3;
             -30.2, -71.7; -18.9, -77.1; -4.42, -79.9; 10.9, -79.1; 23.7, -75.2;
             34.2, -68.7; 42.2, -60.6; 48.6, -51.2; 54.3, -40; 59.1, -27.5;
            63.1, -14.6; 67.1, 1.29; 71.2, 20.7; 74.4, 39.3; 77.6, 61.1; 80, 80],
           style(color=0)),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -68; -74, 2; 66, 58], style(thickness=1)),
      Text(
        extent=[-32, 70; 0, 42],
        string="PI",
        style(color=8)),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Line(points=[-74, 64; -74, -80], style(color=8)),
      Polygon(points=[-72, 86; -80, 64; -64, 64; -72, 84; -72, 86], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-74, -80; 70, -80], style(color=8)),
      Polygon(points=[92, -80; 70, -72; 70, -88; 92, -80], style(
          color=8,
          fillColor=8,
          fillPattern=1)),
      Line(points=[-80, 80; -77.6, 61.1; -74.4, 39.3; -71.2, 20.7; -67.1, 1.29;
             -63.1, -14.6; -58.3, -29.8; -52.7, -43.5; -46.2, -55.1; -39, -64.3;
             -30.2, -71.7; -18.9, -77.1; -4.42, -79.9; 10.9, -79.1; 23.7, -75.2;
             34.2, -68.7; 42.2, -60.6; 48.6, -51.2; 54.3, -40; 59.1, -27.5;
            63.1, -14.6; 67.1, 1.29; 71.2, 20.7; 74.4, 39.3; 77.6, 61.1; 80, 80],
           style(color=0)),
      Text(
        extent=[-69, 86; -42, 66],
        string="y",
        style(color=9)),
      Text(
        extent=[68, -46; 92, -66],
        string="u",
        style(color=9))),
    Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  xp[1] = 1;
  
  for i in 1:n loop
    xp[i + 1] = xp[i]*u.signal;
  end for;
  
  y.signal = a*xp;
end Polynome;
