within ThermoSysPro.Thermal;
package Connectors "Connectors" 
  connector ThermalPort "Thermal connector" 
    ThermoSysPro.Units.AbsoluteTemperature T "Temperature";
    flow Modelica.SIunits.HeatFlowRate W 
      "Thermal flow rate. Positive when going into the component";
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Diagram,
      Icon(Rectangle(extent=[-100, 100; 100, -100], style(
            color=46,
            gradient=3,
            fillColor=45))),
      Window(
        x=0.12,
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
  end ThermalPort;
end Connectors;
