within ThermoSysPro.InstrumentationAndControl.Blocks.NonLineaire;
block Switch 
  parameter Real C1=1 "Valeur de la sortie pour sel=1 si u1 non connecté";
  parameter Real C2=1 "Valeur de la sortie pour sel=2 si u2 non connecté";
  parameter Real C3=1 "Valeur de la sortie pour sel=3 si u3 non connecté";
  parameter Real C4=1 "Valeur de la sortie pour sel=4 si u4 non connecté";
  parameter Real C5=1 
    "Valeur de la sortie pour des autres valeur de sel si u5 non connecté";
  parameter Integer Sel0=1 "Valeur de sel s'il n'est pas connecté";
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Line(points=[-98, -80; -40, -80], style(
          color=0,
          pattern=1,
          thickness=1,
          arrow=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Line(points=[-100,80; -40,80], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-100,40; -40,40], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,0; -40,0], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,-40; -40,-40], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,-80; -40,-80], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-40,70; -40,80], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-40,80; -30,76], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-40,80; 10,0], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Ellipse(extent=[2,8; 18,-8], style(
          color=10,
          rgbcolor={95,95,95},
          fillColor=9,
          rgbfillColor={160,160,164},
          fillPattern=1)),
      Line(points=[18,0; 100,0], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[10,-8; 10,-84], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Text(
        extent=[-68,98; -30,76],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C1"),
      Text(
        extent=[-68,60; -30,38],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C2"),
      Text(
        extent=[-68,20; -30,-2],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C3"),
      Text(
        extent=[-68,-20; -30,-42],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C4"),
      Text(
        extent=[-68,-60; -30,-82],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C5"),
      Text(
        extent=[12,-60; 50,-82],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="sel")),
    Diagram(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Line(points=[18,0; 100,0], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,-80; -40,-80], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,80; -40,80], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-40, 80; 10, 0], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Ellipse(extent=[2, 8; 18, -8], style(
          color=10,
          rgbcolor={95,95,95},
          fillColor=9,
          rgbfillColor={160,160,164},
          fillPattern=1)),
      Line(points=[-40, 70; -40, 80], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-40, 80; -30, 76], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Line(points=[-100,40; -40,40], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,0; -40,0], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[-100,-40; -40,-40], style(
          color=0,
          rgbcolor={0,0,0},
          pattern=1,
          thickness=2,
          arrow=0)),
      Line(points=[10,-8; 10,-84], style(
          color=0,
          rgbcolor={0,0,0},
          thickness=2)),
      Text(
        extent=[-70,60; -32,38],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C2"),
      Text(
        extent=[-70,20; -32,-2],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C3"),
      Text(
        extent=[-70,-20; -32,-42],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C4"),
      Text(
        extent=[-70,-60; -32,-82],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C5"),
      Text(
        extent=[10,-60; 48,-82],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="sel"),
      Text(
        extent=[-70,98; -32,76],
        style(
          color=10,
          rgbcolor={95,95,95},
          thickness=2,
          fillColor=85,
          rgbfillColor={255,0,128},
          fillPattern=1),
        string="C1")),
    Window(
      x=0.35,
      y=0.11,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Version 1.6</b></p>
<par>
Selection entre plusieurs valeurs :
<ul>
<li>   y==u1 (ou C1 si u1 n'est pas connecté) si Sel == 1; <\\li>
<li>   y==u2 (ou C2 si u2 n'est pas connecté) si Sel == 2; <\\li>
<li>   y==u3 (ou C3 si u3 n'est pas connecté) si Sel == 3; <\\li>
<li>   y==u4 (ou C4 si u4 n'est pas connecté) si Sel == 4; <\\li>
<li>   y==u5 (ou C5 si u5 n'est pas connecté) dans tous les autres cas; <\\li>
<\\ul>
<\\par>
</HTML>
"));
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u1 
                                    annotation (extent=[-120, 70; -100, 90]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u2 
                                    annotation (extent=[-120,30; -100,50]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                   annotation (extent=[100, -10; 120, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u3 
                                    annotation (extent=[-120,-10; -100,10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u4 
                                    annotation (extent=[-120,-50; -100,-30]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u5 
                                    annotation (extent=[-120,-90; -100,-70]);
  ThermoSysPro.InstrumentationAndControl.Connectors.InputInteger sel 
                                           annotation (extent=[0,-100; 20,-80], rotation=90);
equation 
  
  if (cardinality(u1) == 0) then
    u1.signal = C1;
  end if;
  
  if (cardinality(u2) == 0) then
    u2.signal = C2;
  end if;
  
  if (cardinality(u3) == 0) then
    u3.signal = C3;
  end if;
  
  if (cardinality(u4) == 0) then
    u4.signal = C4;
  end if;
  
  if (cardinality(u5) == 0) then
    u5.signal = C5;
  end if;
  
  if (cardinality(sel) == 0) then
    sel.signal = Sel0;
  end if;
  
  y.signal = if (sel.signal == 1) then u1.signal else 
             if (sel.signal == 2) then u2.signal else 
             if (sel.signal == 3) then u3.signal else 
             if (sel.signal == 4) then u4.signal else 
                                   u5.signal;
  
end Switch;
