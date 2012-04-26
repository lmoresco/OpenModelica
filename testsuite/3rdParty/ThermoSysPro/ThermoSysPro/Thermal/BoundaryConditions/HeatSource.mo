within ThermoSysPro.Thermal.BoundaryConditions;
model HeatSource "Heat source" 
  parameter ThermoSysPro.Units.AbsoluteTemperature T0[:]={300} 
    "Source temperature (active if option_temperature=1)";
  parameter Modelica.SIunits.Power W0[:]={2e6} 
    "Heat power emitted by the source (active if option_temperature=2)";
  parameter Integer option_temperature=1 
    "1:temperature fixed - 2:heat power fixed";
  
protected 
  parameter Integer N=size(T0,1);
  
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=45)),
      Text(extent=[-40,40; 40,-38],   string="C"),
      Line(points=[0, -40; 0, -88]),
      Line(points=[0, -88; 12, -68]),
      Line(points=[0,-88; -14,-68])),
    Diagram(
      Rectangle(extent=[-40, 40; 40, -40], style(fillColor=45)),
      Line(points=[0, -40; 0, -88]),
      Line(points=[0,-88; -14,-68]),
      Line(points=[0, -88; 12, -68]),
      Text(extent=[-40,40; 40,-38],   string="C")),
    Window(
      x=0.33,
      y=0.21,
      width=0.6,
      height=0.6),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
public 
  ThermoSysPro.Thermal.Connectors.ThermalPort C[N]     annotation (extent=[-10, -108; 10, -88]);
  InstrumentationAndControl.Connectors.InputReal ISignal 
    annotation (extent=[10,60; -10,40], rotation=90);
equation 
  
  if (cardinality(ISignal) == 0) then
    if (option_temperature == 1) then
      C.T = T0;
    elseif (option_temperature == 2) then
      C.W = -W0;
    else
      assert(false, "HeatSource : incorrect option");
    end if;
    
    ISignal.signal = 0;
  else
    if (option_temperature == 1) then
      C.T = fill(ISignal.signal, N);
    elseif (option_temperature == 2) then
      C.W = fill(-ISignal.signal, N);
    else
      assert(false, "HeatSource : incorrect option");
    end if;
  end if;
  
end HeatSource;
