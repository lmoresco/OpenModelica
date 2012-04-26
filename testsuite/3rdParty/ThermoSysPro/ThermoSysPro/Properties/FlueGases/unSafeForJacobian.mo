within ThermoSysPro.Properties.FlueGases;
partial model unSafeForJacobian 
  "Icon to mark functions that may not be used if analytic Jacobians are desired" 
extends Modelica.Icons.Function;
  annotation (Icon(graphics={Rectangle(
          extent={{-30,64},{32,-76}},
          lineColor={255,255,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-100,100},{100,-100}},
          lineColor={255,0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="f")}));
end unSafeForJacobian;
