model PlugA "Plug" 
  
public 
  ThermoSysPro.Units.AbsolutePressure P "Fluid pressure";
  Modelica.SIunits.MassFlowRate Q "Mass flow rate";
  ThermoSysPro.Units.SpecificEnthalpy h "Fluid specific enthalpy";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]), 
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3, 
          rgbcolor={0,0,255}, 
          fillColor=53, 
          rgbfillColor={128,255,0}))),
    Icon(
      Line(points=[40,0; 90,0; 72,10]),
      Line(points=[90,0; 72,-10]), 
      Ellipse(extent=[-40,40; 40,-40], style(
          color=3, 
          rgbcolor={0,0,255}, 
          fillColor=53, 
          rgbfillColor={128,255,0}))),
    Window(
      x=0.23,
      y=0.15,
      width=0.81,
      height=0.71),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 3.0</b></p>
</HTML>
", revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
  Connectors.FluidOutlet C                annotation (extent=[90,-10; 110,10]);
equation 
  
  C.P = P;
  C.Q = Q;
  C.h_vol = h;
  
end PlugA;
