within ThermoSysPro.Correlations.Misc;
record Pro_FlueGases 
  "Flue gases properties for the computation of correlations" 
  Modelica.SIunits.Density rhoMF(start=.5) "Flue gases average density";
  Modelica.SIunits.SpecificHeatCapacity cpMF(start=500) 
    "Flue gases average specific heat capacity";
  Modelica.SIunits.DynamicViscosity muMF(start=1.e-5) 
    "Flue gases average dynamic viscosity";
  Modelica.SIunits.ThermalConductivity kMF(start=0.10) 
    "Flue gases average thermal conductivity";
  Modelica.SIunits.SpecificHeatCapacity cpMFF(start=500) 
    "Film specific heat capacity";
  Modelica.SIunits.DynamicViscosity muMFF(start=1.e-5) "Film dynamic viscosity";
  Modelica.SIunits.ThermalConductivity kMFF(start=0.10) 
    "Film thermal conductivity";
  Real Xtot " ";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Window(
      x=0.11,
      y=0.17,
      width=0.6,
      height=0.6),
    Icon(
      Rectangle(extent=[-100, 50; 100, -100], style(fillColor=51, fillPattern=1)),
      Text(extent=[-127, 115; 127, 55], string="%name"),
      Line(points=[-100, -50; 100, -50], style(color=0)),
      Line(points=[-100, 0; 100, 0], style(color=0)),
      Line(points=[0, 50; 0, -100], style(color=0))),
    Documentation(revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
", info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  
end Pro_FlueGases;
