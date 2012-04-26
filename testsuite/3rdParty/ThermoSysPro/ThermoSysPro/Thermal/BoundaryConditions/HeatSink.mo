model HeatSink "Heat sink" 
  
  parameter Integer N=1;
  
public 
  ThermoSysPro.Units.AbsoluteTemperature T[N] "Sink temperature";
  Modelica.SIunits.Power W[N] "Heat power received by the sink";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=45)),
      Text(extent=[-40,40; 40,-38],   string="C", 
        style(color=3, rgbcolor={0,0,255})),
      Line(points=[0, -40; 0, -88]),
      Line(points=[-12,-60; 0,-40]),
      Line(points=[12,-60; 0,-40])),
    Diagram(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=45)),
      Line(points=[0, -40; 0, -88]),
      Line(points=[-12,-60; 0,-40]),
      Text(extent=[-40,40; 40,-38],   string="C", 
        style(color=3, rgbcolor={0,0,255})),
      Line(points=[12,-60; 0,-40])),
    Window(
      x=0.33,
      y=0.21,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 3.0</b></p>
</HTML>
"));
public 
  input ThermoSysPro.Thermal.Connectors.ThermalPort C[N] 
                                                       annotation (extent=[-10, -108; 10, -88]);
equation 
  
  T = C.T;
  W = C.W;
  
end HeatSink;
