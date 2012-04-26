within ThermoSysPro.InstrumentationAndControl.Blocks.Tables;
block Table2D 
  parameter Real Tu1[:,1]=[0; 0] "Entrées lignes de la table";
  parameter Real Tu2[1,:]=[0, 0] "Entrées colonnes de la table";
  parameter Real Ty[size(Tu1, 1), size(Tu2, 2)]=[0, 0; 0, 0] 
    "Sorties de la table";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-80, 80; 80, -80], style(fillPattern=0)),
      Line(points=[-54, 40; -54, -40; 54, -40; 54, 40; 28, 40; 28, -40; -28, -40;
             -28, 40; -54, 40; -54, 20; 54, 20; 54, 0; -54, 0; -54, -20; 54, -20;
             54, -40; -54, -40; -54, 40; 54, 40; 54, -40], style(color=0)),
      Line(points=[0, 40; 0, -40], style(color=0)),
      Rectangle(extent=[-54, 20; -28, 0], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54, 0; -28, -20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54, -20; -28, -40], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-28, 40; 0, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[0, 40; 28, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[28, 40; 54, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Line(points=[-54, 40; -28, 20], style(color=0)),
      Line(points=[-28, 40; -54, 20], style(color=0)),
      Text(extent=[-54, -40; -30, -56], string="u1"),
      Text(extent=[28, 58; 52, 44], string="u2"),
      Text(extent=[-4, 12; 30, -22], string="y"),
      Line(points=[80,0; 100,0]),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-100,60; -80,60]),
      Line(points=[-80, -60; -100, -60])),
    Window(
      x=0.13,
      y=0.18,
      width=0.73,
      height=0.6),
    Diagram(
      Rectangle(extent=[-80, 80; 80, -80], style(fillPattern=0)),
      Line(points=[-54, 40; -54, -40; 54, -40; 54, 40; 28, 40; 28, -40; -28, -40;
             -28, 40; -54, 40; -54, 20; 54, 20; 54, 0; -54, 0; -54, -20; 54, -20;
             54, -40; -54, -40; -54, 40; 54, 40; 54, -40], style(color=0)),
      Line(points=[0, 40; 0, -40], style(color=0)),
      Rectangle(extent=[-54, 20; -28, 0], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54, 0; -28, -20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54, -20; -28, -40], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-28, 40; 0, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[0, 40; 28, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[28, 40; 54, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Line(points=[-54, 40; -28, 20], style(color=0)),
      Line(points=[-28, 40; -54, 20], style(color=0)),
      Text(extent=[-54, -40; -30, -56], string="u1"),
      Text(extent=[28, 58; 52, 44], string="u2"),
      Text(extent=[-4, 12; 30, -22], string="y"),
      Line(points=[80,0; 100,0]),
      Line(points=[-80, -60; -100, -60]),
      Line(points=[-100,60; -80,60])),
    Documentation(info="<html>
<p><b>Adapted from the ModelicaAdditions.Blocks.Tables library</b></p>
</HTML>
<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u1 
                                       annotation (extent=[-120, 50; -100, 70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u2 
                                       annotation (extent=[-120, -70; -100, -50]);
equation 
  
  y.signal = ThermoSysPro.Functions.TableLinearInterpolation(Tu1[:, 1], Tu2[1, :], Ty, u1.signal, u2.signal);
  
  annotation (Icon(
      Rectangle(extent=[-80,80; 80,-80],   style(fillPattern=0)),
      Line(points=[-54,40; -54,-40; 54,-40; 54,40; 28,40; 28,-40; -28,-40; -28,
            40; -54,40; -54,20; 54,20; 54,0; -54,0; -54,-20; 54,-20; 54,-40;
            -54,-40; -54,40; 54,40; 54,-40],               style(color=0)),
      Line(points=[0,40; 0,-40],   style(color=0)),
      Rectangle(extent=[-54,20; -28,0],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54,0; -28,-20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54,-20; -28,-40],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-28,40; 0,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[0,40; 28,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[28,40; 54,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Line(points=[-54,40; -28,20],   style(color=0)),
      Line(points=[-28,40; -54,20],   style(color=0)),
      Text(extent=[-54,-40; -30,-56],   string="u1"),
      Text(extent=[56,38; 80,24],   string="u2"),
      Text(extent=[0,0; 28,-20],     string="y"),
      Line(points=[80,0; 100,0]),
      Line(points=[-100,60; -80,60]),
      Line(points=[-80,-60; -100,-60])), Diagram(
      Rectangle(extent=[-80,80; 80,-80],   style(fillPattern=0)),
      Line(points=[-54,40; -54,-40; 54,-40; 54,40; 28,40; 28,-40; -28,-40; -28,
            40; -54,40; -54,20; 54,20; 54,0; -54,0; -54,-20; 54,-20; 54,-40;
            -54,-40; -54,40; 54,40; 54,-40],               style(color=0)),
      Line(points=[0,40; 0,-40],   style(color=0)),
      Rectangle(extent=[-54,20; -28,0],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54,0; -28,-20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-54,-20; -28,-40],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-28,40; 0,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[0,40; 28,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[28,40; 54,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Line(points=[-54,40; -28,20],   style(color=0)),
      Line(points=[-28,40; -54,20],   style(color=0)),
      Text(extent=[-54,-40; -30,-56],   string="u1"),
      Text(extent=[56,38; 80,24],   string="u2"),
      Text(extent=[0,0; 28,-20],     string="y"),
      Line(points=[80,0; 100,0]),
      Line(points=[-100,60; -80,60]),
      Line(points=[-80,-60; -100,-60])));
end Table2D;
