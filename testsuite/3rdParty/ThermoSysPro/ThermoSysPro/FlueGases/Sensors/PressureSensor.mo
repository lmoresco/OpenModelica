within ThermoSysPro.FlueGases.Sensors;
model PressureSensor "Pressure sensor" 
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Ellipse(extent=[-60,92; 60,-28], style(
          fillColor=2,
          rgbfillColor={0,255,0},
          fillPattern=8)),
      Line(points=[0,-28; 0,-80]),
      Line(points=[-98, -80; 102, -80]),
      Text(extent=[-60,60; 60,0],    string="P")),
    Window(
      x=0.62,
      y=0.25,
      width=0.35,
      height=0.49),
    Diagram(
      Ellipse(extent=[-60,92; 60,-28], style(
          fillColor=2,
          rgbfillColor={0,255,0},
          fillPattern=8)),
      Line(points=[0,-28; 0,-80]),
      Line(points=[-98, -80; 102, -80]),
      Text(extent=[-60,60; 60,0],    string="P")),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal Mesure 
    annotation (extent=[-10,92; 10,112],    rotation=90);
  Connectors.FlueGasesInlet C1 
                          annotation (extent=[-110, -90; -90, -70]);
  Connectors.FlueGasesOutlet C2 
                          annotation (extent=[90,-90; 110,-70]);
equation 
  
  C1.P = C2.P;
  C1.T = C2.T;
  C1.Q = C2.Q;
  C1.Xco2 = C2.Xco2;
  C1.Xh2o = C2.Xh2o;
  C1.Xo2  = C2.Xo2;
  C1.Xso2 = C2.Xso2;
  
  /* Sensor signal */
  Mesure.signal = C1.P;
  
end PressureSensor;
