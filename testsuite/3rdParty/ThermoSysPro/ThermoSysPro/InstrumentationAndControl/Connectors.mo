within ThermoSysPro.InstrumentationAndControl;
package Connectors "Connectors" 
  
  annotation (
    Coordsys(
      extent=[0, 0; 311, 211],
      grid=[2, 2],
      component=[20, 20]),
    Window(
      x=0.05,
      y=0.26,
      width=0.25,
      height=0.25,
      library=1,
      autolayout=1),
    Icon(
      Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
      Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-120, 135; 120, 70],
        string="%name",
        style(color=1)),
      Text(
        extent=[-90, 40; 70, 10],
        string="Library",
        style(
          color=9,
          fillColor=0,
          fillPattern=1)),
      Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
      Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
      Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
      Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0)),
      Polygon(points=[16, -71; 29, -67; 29, -74; 16, -71], style(
          color=0,
          fillColor=0,
          fillPattern=1)),
      Polygon(points=[-32, -21; -46, -17; -46, -25; -32, -21], style(
          color=0,
          fillColor=0,
          fillPattern=1))),
    Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
  connector InputDateAndTime 
    input ThermoSysPro.InstrumentationAndControl.Common.DateEtHeure 
                             signal;
    annotation (
      Coordsys(
        extent=[-1, -1; 1, 1],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.37,
        y=0.02,
        width=0.49,
        height=0.65),
      Icon(Polygon(points=[-1, 1; 1, 0; -1, -1; -1, 1], style(fillColor=0,
              fillPattern=1))),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputDateAndTime;
  
  connector OutputDateAndTime 
    output ThermoSysPro.InstrumentationAndControl.Common.DateEtHeure 
                              signal;
    annotation (
      Coordsys(
        extent=[-1, -1; 1, 1],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.29,
        y=0.11,
        width=0.6,
        height=0.6),
      Icon(Polygon(points=[-1, 1; 1, 0; -1, -1; -1, 1], style(fillColor=8))),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputDateAndTime;
  
  connector InputReal 
    input Real signal;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Diagram,
      Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
              fillColor=69))),
      Window(
        x=0.34,
        y=0.2,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputReal;
  
  connector InputLogical 
     input Boolean signal;
     annotation (
       Coordsys(
         extent=[-100, -100; 100, 100],
         grid=[2, 2],
         component=[20, 20]),
       Window(
         x=0.37,
         y=0.02,
         width=0.49,
         height=0.65),
       Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
               fillColor=49))),
       Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end InputLogical;
  
  connector InputInteger 
    input Integer signal;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Diagram,
      Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
              fillColor=5, rgbfillColor={255,0,255}))),
      Window(
        x=0.34,
        y=0.2,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
    
  end InputInteger;
  
  connector OuputInteger 
    output Integer signal;
    annotation (
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
              fillColor=85, rgbfillColor={255,0,128}))),
      Window(
        x=0.34,
        y=0.18,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Version 1.6</b></p>
</HTML>
"));
  end OuputInteger;
  
  connector OutputLogical 
      output Boolean signal;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.29,
          y=0.11,
          width=0.6,
          height=0.6),
        Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
                fillColor=53))),
        Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputLogical;
  
  connector OutputReal 
      output Real signal;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Polygon(points=[-100, 100; -100, -100; 100, 0; -100, 100], style(
                fillColor=65))),
        Window(
          x=0.34,
          y=0.18,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  end OutputReal;
end Connectors;
