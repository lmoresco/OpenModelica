within ThermoSysPro.InstrumentationAndControl.Blocks;
package Commun 
  
  annotation (
    Coordsys(
      extent=[0, 0; 313, 206],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
      Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-90, 40; 70, 10],
        string="Unites",
        style(
          color=9,
          fillColor=0,
          fillPattern=1)),
      Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
      Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
      Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
      Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0)),
      Text(
        extent=[-120, 135; 120, 70],
        string="%name",
        style(color=1))),
    Window(
      x=0.05,
      y=0.26,
      width=0.25,
      height=0.25,
      library=1,
      autolayout=1),
    Documentation(info="<html>
<p><b>Version 1.1</b></p>
</HTML>
"));
  
  function rand "rand" 
    output Integer y;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.45,
        y=0.01,
        width=0.35,
        height=0.49),
      Icon(
        Text(
          extent=[-84, 18; 84, -30],
          string="fonction",
          style(color=45)),
        Text(extent=[-134, 104; 142, 44], string="%name"),
        Ellipse(extent=[-100, 40; 100, -100], style(color=45, fillPattern=0)),
        Text(
          extent=[-82, -22; 86, -70],
          string="externe",
          style(color=45))),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  external "C" y=  rand(0);
  end rand;
  
  function srand "rand" 
    input Integer u;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.26,
        y=0.28,
        width=0.6,
        height=0.6),
      Icon(
        Text(extent=[-134, 104; 142, 44], string="%name"),
        Ellipse(extent=[-100, 40; 100, -100], style(color=45, fillPattern=0)),
        Text(
          extent=[-84, 18; 84, -30],
          string="fonction",
          style(color=45)),
        Text(
          extent=[-82, -22; 86, -70],
          string="externe",
          style(color=45))),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  external "C" srand(u);
  end srand;
  
  function fmod "fmod" 
    input Real u1;
    input Real u2;
    output Real y;
    annotation (Icon(
        Text(extent=[-134,104; 142,44],   string="%name"),
        Ellipse(extent=[-100,40; 100,-100],   style(color=45, fillPattern=0)),
        Text(
          extent=[-84,18; 84,-30],
          string="fonction",
          style(color=45)),
        Text(
          extent=[-82,-22; 86,-70],
          string="externe",
          style(color=45))), Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  external "C" y=  fmod(u1, u2);
  end fmod;
end Commun;
