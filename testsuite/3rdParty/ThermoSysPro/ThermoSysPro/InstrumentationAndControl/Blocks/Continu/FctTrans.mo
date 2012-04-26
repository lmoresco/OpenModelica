within ThermoSysPro.InstrumentationAndControl.Blocks.Continu;
block FctTrans 
  parameter Real b[:]={1} 
    "Coefficients numérateurs de la fonction de transfert (par puissances décroissantes)";
  parameter Real a[:]={1,1} 
    "Coefficients dénominateurs de la fonction de transfert (par puissances décroissantes)";
  parameter Real U0=0 
    "Valeur de la sortie à l'instant initial (si non permanent et si u0 non connecté)";
  parameter Boolean permanent=false "Calcul du permanent";
  
protected 
  parameter Integer na=size(a, 1);
  parameter Integer nb(max=na) = size(b, 1);
  parameter Integer nx=na - 1;
  Real x[nx];
  Real x1dot;
  Real xn;
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Diagram(
      Rectangle(extent=[-60, 60; 60, -60], style(fillColor=30, fillPattern=1)),
      Line(points=[-100, 0; -60, 0]),
      Line(points=[62, 0; 102, 0]),
      Line(points=[-50, 0; 50, 0], style(color=0)),
      Text(
        extent=[-55, 55; 55, 5],
        string="b(s)",
        style(color=0)),
      Text(
        extent=[-55, -5; 55, -55],
        string="a(s)",
        style(color=0))),
    Icon(
      Rectangle(extent=[-100, -100; 100, 100], style(
          color=3,
          pattern=1,
          thickness=1,
          arrow=0,
          fillPattern=0)),
      Text(extent=[-150, 150; 150, 110], string="%name"),
      Rectangle(extent=[-100, -100; 100, 100], style(color=3, fillColor=7)),
      Text(extent=[-90, 10; 90, 90], string="b(s)"),
      Line(points=[-80, 0; 80, 0]),
      Text(extent=[-90, -10; 90, -90], string="a(s)")),
    Window(
      x=0.12,
      y=0.11,
      width=0.69,
      height=0.81),
    Documentation(info="<html>
<p><b>Adapted from the Modelica.Blocks.Continuous library</b></p>
</HTML>
<html>
<p><b>Version 1.7</b></p>
</HTML>
"));
  
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u 
                                      annotation (extent=[-120, -10; -100, 10]);
  ThermoSysPro.InstrumentationAndControl.Connectors.OutputReal y 
                                       annotation (extent=[100, -10; 120, 10]);
public 
  ThermoSysPro.InstrumentationAndControl.Connectors.InputReal u0 
                                       annotation (extent=[-120,-90; -100,-70]);
initial equation 
  if permanent then
    der(x) = zeros(nx);
  elseif (nx > 0) then
    transpose([zeros(na - nb, 1); b])*[x1dot; x] = [u0.signal];
  end if;
  
equation 
  if (cardinality(u0) == 0) then
    u0.signal = U0;
  end if;
  
  [der(x); xn] = [x1dot; x];
  [u.signal] = transpose([a])*[x1dot; x];
  [y.signal] = transpose([zeros(na - nb, 1); b])*[x1dot; x];
end FctTrans;
