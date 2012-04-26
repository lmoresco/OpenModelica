within ThermoSysPro.ElectroMechanics;
package Connectors "Connectors" 
  connector MechanichalTorque "Mechanical torque" 
    Modelica.SIunits.Torque Ctr "Torque";
    Modelica.SIunits.AngularVelocity w "Angular velocity";
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.25,
        y=0.14,
        width=0.6,
        height=0.6),
      Diagram,
      Icon(Polygon(points=[-100, 60; 0, 60; 100, 0; 0, -60; -100, -60; -100, 60],
             style(fillColor=49))),
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
  end MechanichalTorque;
end Connectors;
