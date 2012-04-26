within ThermoSysPro.Properties;
package FlueGases "Flue gases properties library"


annotation (
  Icon(
    Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
    Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
          fillColor=30, fillPattern=1)),
    Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
          fillColor=30, fillPattern=1)),
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
    Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0)),
    Text(
      extent=[-108, 125; 132, 60],
      string="%name",
      style(color=1))),
  Coordsys(
    extent=[0, 0; 442, 394],
    grid=[2, 2],
    component=[20, 20]),
  Window(
    x=0.45,
    y=0.01,
    width=0.44,
    height=0.65,
    library=1,
    autolayout=1));
end FlueGases;
