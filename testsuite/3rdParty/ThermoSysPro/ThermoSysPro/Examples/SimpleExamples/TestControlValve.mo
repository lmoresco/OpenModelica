within ThermoSysPro.Examples.SimpleExamples;
model TestControlValve 
  
  annotation (Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]), Window(
      x=0.45,
      y=0.01,
      width=0.35,
      height=0.49),
    Diagram);
  ThermoSysPro.WaterSteam.BoundaryConditions.SourceP SourceP1 
    annotation (extent=[-100, 20; -80, 40]);
  ThermoSysPro.WaterSteam.BoundaryConditions.SinkP PuitsP1 
                                          annotation (extent=[60, 20; 80, 40]);
  ThermoSysPro.WaterSteam.PressureLosses.ControlValve ControlValve(mode_caract=1, caract=[
        0,0; 0.5,3000; 0.75,7000; 1,8000]) 
                                          annotation (extent=[-20,26; 0,46]);
  ThermoSysPro.InstrumentationAndControl.Blocks.Sources.Constante Constante1(
                                            k=0.5) 
    annotation (extent=[-40, 60; -20, 80]);
equation 
  connect(ControlValve.C2, PuitsP1.C) 
    annotation (points=[0,30; 40,30; 40,30; 60,30],          style(color=3));
  connect(Constante1.y, ControlValve.Ouv) 
    annotation (points=[-19,70; -10,70; -10,47],  style(color=3));
  connect(SourceP1.C, ControlValve.C1) 
    annotation (points=[-80,30; -20,30], style(color=3, rgbcolor={0,0,255}));
end TestControlValve;
