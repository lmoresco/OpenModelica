within ThermoSysPro.InstrumentationAndControl.Blocks.Tables;


block Table1D 
  parameter Real Table[:, 2]=[0, 0; 0, 0] 
    "Table (entrées = première colonne, sorties = deuxième colonne)";
  
protected 
  parameter Real Tu[:]=Table[:, 1] "Entrées de la table";
  parameter Real Ty[:]=Table[:, 2] "Sorties de la table";
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-80, 80; 80, -80], style(fillPattern=0)),
      Line(points=[80, 0; 100, 0]),
      Line(points=[28, 40; 28, -40], style(color=0)),
      Rectangle(extent=[-26, 40; 0, 20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26, 20; 0, 0], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26, 0; 0, -20], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26, -20; 0, -40], style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Text(extent=[-24, 56; -6, 44], string="u"),
      Text(extent=[2, 56; 26, 44], string="y"),
      Text(extent=[-98, 14; -80, 2], string="u"),
      Text(extent=[78, 14; 102, 2], string="y"),
      Line(points=[-80, 0; -100, 0]),
      Line(points=[0, 40; 28, 40], style(color=0, fillColor=0)),
      Line(points=[0, 20; 28, 20], style(color=0, fillColor=0)),
      Line(points=[0, 0; 28, 0], style(color=0)),
      Line(points=[0, -20; 28, -20], style(color=0)),
      Line(points=[0, -40; 28, -40], style(color=0))),
    Icon(
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-80, 80; 80, -80], style(fillPattern=0)),
      Line(points=[80, 0; 100, 0]),
      Line(points=[28,40; 28,-40],   style(color=0)),
      Rectangle(extent=[-26,40; 0,20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26,20; 0,0],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26,0; 0,-20],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Rectangle(extent=[-26,-20; 0,-40],   style(
          color=0,
          fillColor=6,
          fillPattern=1)),
      Text(extent=[-24,56; -6,44],   string="u"),
      Text(extent=[2,56; 26,44],   string="y"),
      Text(extent=[-98, 14; -80, 2], string="u"),
      Text(extent=[78, 14; 102, 2], string="y"),
      Line(points=[-80, 0; -100, 0]),
      Line(points=[0,40; 28,40],   style(color=0, fillColor=0)),
      Line(points=[0,20; 28,20],   style(color=0, fillColor=0)),
      Line(points=[0,0; 28,0],   style(color=0)),
      Line(points=[0,-20; 28,-20],   style(color=0)),
      Line(points=[0,-40; 28,-40],   style(color=0))),
    Window(
      x=0.17,
      y=0.19,
      width=0.83,
      height=0.6),
    Documentation(info="<html>
<p><b>Adapted from the ModelicaAdditions.Blocks.Tables library</b></p>
</HTML>
<html>
<p><b>Version 1.2</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
equation 
  
  y.signal = ThermoSysPro.Functions.LinearInterpolation(Tu, Ty, u.signal);
  
end Table1D;
