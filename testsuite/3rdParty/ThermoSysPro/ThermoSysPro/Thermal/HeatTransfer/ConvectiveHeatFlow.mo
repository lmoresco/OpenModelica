within ThermoSysPro.Thermal.HeatTransfer;
model ConvectiveHeatFlow "Convective heat flow" 
  parameter Modelica.SIunits.Area A[:]={1} "Heat exchange surface";
  parameter Modelica.SIunits.CoefficientOfHeatTransfer k[:]={1000} 
    "Heat exchange coefficient";
  
protected 
  parameter Integer N=size(A, 1);
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Polygon(points=[-15, 65; 15, 65; 0, 90; -15, 65], style(color=41,
            fillColor=41)),
      Line(points=[0, 70; 0, 40; -20, 30; 20, 10; -20, -10; 20, -30; 0, -40; 0,
             -70], style(
          color=41,
          thickness=2,
          fillColor=41)),
      Polygon(points=[-15, -65; 15, -65; 0, -90; -15, -65], style(color=41,
            fillColor=41))),
    Diagram(
      Polygon(points=[-15, 65; 15, 65; 0, 90; -15, 65], style(color=41,
            fillColor=41)),
      Line(points=[0, 70; 0, 40; -20, 30; 20, 10; -20, -10; 20, -30; 0, -40; 0,
             -70], style(
          color=41,
          thickness=2,
          fillColor=41)),
      Polygon(points=[-15, -65; 15, -65; 0, -90; -15, -65], style(color=41,
            fillColor=41))),
    Window(
      x=0.24,
      y=0.27,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.Thermal.Connectors.ThermalPort C1       annotation (extent=[-10, 90; 10, 110]);
  ThermoSysPro.Thermal.Connectors.ThermalPort C2       annotation (extent=[-10, -110; 10, -90]);
equation 
  
  C1.W = k*A*(C1.T - C2.T);
  C1.W = -C2.W;
  
end ConvectiveHeatFlow;
