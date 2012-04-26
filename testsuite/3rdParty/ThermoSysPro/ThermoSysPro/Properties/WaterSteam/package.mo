within ThermoSysPro.Properties;
package WaterSteam "Water/steam properties library"


  replaceable package IF97 = 
      ThermoSysPro.Properties.WaterSteam.IF97_packages.IF97_wAJ;


annotation (
  Coordsys(
    extent=[0, 0; 312, 210],
    grid=[2, 2],
    component=[20, 20]),
  Icon(
    Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
    Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
          fillColor=30, fillPattern=1)),
    Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
          fillColor=30, fillPattern=1)),
    Text(
      extent=[-110, 125; 130, 60],
      string="%name",
      style(color=1)),
    Text(
      extent=[-90, 40; 70, 10],
      string="Library",
      style(
        color=9,
        fillColor=0,
        fillPattern=1)),
    Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
    Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
    Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
    Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0))),
  Window(
    x=0.05,
    y=0.26,
    width=0.25,
    height=0.25,
    library=1,
    autolayout=1),
  Documentation(info="<html>
<p><b>Version 1.2</b></p>
</HTML>
"));
end WaterSteam;
