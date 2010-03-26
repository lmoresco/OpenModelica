within Modelica.Electrical.Analog.Examples.Utilities;
model NonlinearResistor "Chua's resistor"
  extends Interfaces.OnePort;
  annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-70.0,-30.0},{70.0,30.0}}),Line(visible=true, points={{-90.0,0.0},{-70.0,0.0}}, color={0,0,255}),Line(visible=true, points={{70.0,0.0},{90.0,0.0}}, color={0,0,255}),Line(visible=true, points={{-50.0,-60.0},{50.0,60.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}, arrowSize=12),Text(visible=true, fillColor={0,0,255}, extent={{-100.0,70.0},{100.0,100.0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-70.0,-30.0},{70.0,30.0}}),Line(visible=true, points={{-100.0,0.0},{-70.0,0.0}}, color={0,0,255}),Line(visible=true, points={{70.0,0.0},{100.0,0.0}}, color={0,0,255}),Line(visible=true, points={{-50.0,-60.0},{50.0,60.0}}, color={0,0,255}, arrow={Arrow.None,Arrow.Filled}, arrowSize=12)}));
  parameter SI.Conductance Ga;
  parameter SI.Conductance Gb;
  parameter SI.Voltage Ve;
equation 
  i=if v < -Ve then Gb*(v + Ve) - Ga*Ve else if v > Ve then Gb*(v - Ve) + Ga*Ve else Ga*v;
end NonlinearResistor;
