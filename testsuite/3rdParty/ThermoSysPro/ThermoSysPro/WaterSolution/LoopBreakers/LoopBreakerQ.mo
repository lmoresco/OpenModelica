within ThermoSysPro.WaterSolution.LoopBreakers;
model LoopBreakerQ "Mass flow loop breaker for the water solution connector" 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(Polygon(points=[0, 100; 100, 0; 0, -100; -100, 0; 0, 100], style(
          color=77,
          rgbcolor={127,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})),
                                      Line(points=[0,100; 0,-100], style(color=
              3, rgbcolor={0,0,255})),
      Text(
        extent=[-42,38; 38,-42],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
    Icon(
      Polygon(points=[0, 100; 100, 0; 0, -100; -100, 0; 0, 100], style(
          color=77,
          rgbcolor={127,0,255},
          fillColor=44,
          rgbfillColor={255,170,170})),
      Line(points=[0,100; 0,-100], style(color=3, rgbcolor={0,0,255})),
      Text(
        extent=[-40,38; 40,-42],
        style(color=3, rgbcolor={0,0,255}),
        string="Q")),
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
    Benoît Bride</li>
<li>
    Daniel Bouskela</li>
</html>
"));
  
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionInlet Ce 
    annotation (extent=[-110,-10; -90,10]);
  ThermoSysPro.WaterSolution.Connectors.WaterSolutionOutlet Cs 
    annotation (extent=[90,-10; 110,10]);
equation 
  
  Cs.P = Ce.P;
  Cs.T = Ce.T;
  Cs.Xh2o = Ce.Xh2o;
  
end LoopBreakerQ;
