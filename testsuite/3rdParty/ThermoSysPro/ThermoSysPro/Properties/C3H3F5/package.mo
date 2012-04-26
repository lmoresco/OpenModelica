within ThermoSysPro.Properties;
package C3H3F5 "C3H3F5 properties library"


annotation (Icon(
    Rectangle(extent=[-90,-90; 90,60],     style(fillColor=30, fillPattern=1)),
    Polygon(points=[-90,60; -70,80; 110,80; 90,60; -90,60],        style(
          fillColor=30, fillPattern=1)),
    Polygon(points=[110,80; 110,-70; 90,-90; 90,60; 110,80],       style(
          fillColor=30, fillPattern=1)),
    Text(
      extent=[-100,135; 140,70],
      string="%name",
      style(color=1)),
    Text(
      extent=[-80,50; 80,20],
      string="Library",
      style(
        color=9,
        fillColor=0,
        fillPattern=1)),
    Rectangle(extent=[-22,4; 26,-25],    style(color=0)),
    Rectangle(extent=[-22,-46; 26,-75],   style(color=0)),
    Line(points=[26,-10; 59,-10; 59,-61; 26,-61],     style(color=0)),
    Line(points=[-22,-62; -54,-62; -54,-11; -22,-11],     style(color=0))));
end C3H3F5;
