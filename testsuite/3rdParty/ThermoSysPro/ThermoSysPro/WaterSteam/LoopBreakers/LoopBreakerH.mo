within ThermoSysPro.WaterSteam.LoopBreakers;
model LoopBreakerH 
  "Specific enthalpy loop breaker for the water/steam connector" 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[0, 100; 100, 0; 0, -100; -100, 0; 0, 100], style(
          color=77,
          rgbcolor={127,0,255},
          gradient=3,
          fillColor=6,
          rgbfillColor={255,255,0})),
      Text(
        extent=[-38,38; 42,-42],
        style(color=3, rgbcolor={0,0,255}),
        string="h"),
      Line(points=[0,100; 0,-100], style(color=3, rgbcolor={0,0,255}))),
    Icon(
      Polygon(points=[0, 100; 100, 0; 0, -100; -100, 0; 0, 100], style(
          color=77,
          rgbcolor={127,0,255},
          gradient=3,
          fillColor=6,
          rgbfillColor={255,255,0})),
      Text(
        extent=[-38,38; 42,-42],
        style(color=3, rgbcolor={0,0,255}),
        string="h"),
      Line(points=[0,100; 0,-100], style(color=3, rgbcolor={0,0,255}))),
    Window(
      x=0.33,
      y=0.09,
      width=0.71,
      height=0.88),
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
    Baligh El Hefni</li>
<li>
    Daniel Bouskela</li>
</ul>
</html>
"));
  
public 
  Connectors.FluidInlet C1 
    annotation (extent=[-110, -10; -90, 10]);
  Connectors.FluidOutlet C2 
    annotation (extent=[90, -10; 110, 10]);
equation 
  
  C1.Q = C2.Q;
  C1.P = C2.P;
  
  /* Flow reversal */
  0 = if (C1.Q > 0) then C1.h - C1.h_vol else C2.h - C2.h_vol;
  
end LoopBreakerH;
