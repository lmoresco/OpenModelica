within ThermoSysPro.Examples;
package CombinedCyclePowerPlant 


annotation (
  Coordsys(
    extent=[0, 0; 312, 210],
    grid=[2, 2],
    component=[20, 20]),
  Window(
    x=0.05,
    y=0.01,
    width=0.25,
    height=0.25,
    library=1,
    autolayout=1),
  Icon(
    Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
    Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
          fillColor=30, fillPattern=1)),
    Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
          fillColor=30, fillPattern=1)),
    Text(
      extent=[-120, 135; 120, 70],
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
    Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0)),
    Polygon(points=[16, -71; 29, -67; 29, -74; 16, -71], style(
        color=0,
        fillColor=0,
        fillPattern=1)),
    Polygon(points=[-32, -21; -46, -17; -46, -25; -32, -21], style(
        color=0,
        fillColor=0,
        fillPattern=1))),
  Documentation(info="<html>
<p><b><font style=\"font-size: 12pt; color: #008000; \">Combined cycle power plant model </font></b></p>
<p><h4>Licensed by EDF under the Modelica License 2. </h4></p>
<p>Copyright &copy; EDF 2002 - 2012</p>
<p><i>This Modelica package is free software and the use is completely at your own risk; it can be redistributed and/or modified under the terms of the Modelica License 2. For license conditions (including the disclaimer of warranty) see <u>ThermoSysPro.UsersGuide.ModelicaLicense2</u> or visit <a href=\"http://www.modelica.org/licenses/ModelicaLicense2\">http://www.modelica.org/licenses/ModelicaLicense2</a></i>. </p>
</html>"));
end CombinedCyclePowerPlant;
