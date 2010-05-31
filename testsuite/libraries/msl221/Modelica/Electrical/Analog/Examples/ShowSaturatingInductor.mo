within Modelica.Electrical.Analog.Examples;
model ShowSaturatingInductor "Simple demo to show behaviour of SaturatingInductor component"
  extends Modelica.Icons.Example;
  parameter Modelica.SIunits.Inductance Lzer=2;
  parameter Modelica.SIunits.Inductance Lnom=1;
  parameter Modelica.SIunits.Current Inom=1;
  parameter Modelica.SIunits.Inductance Linf=0.5;
  parameter Modelica.SIunits.Voltage U=1.25;
  parameter Modelica.SIunits.Frequency f=1/(2*Modelica.Constants.pi);
  parameter Modelica.SIunits.Angle phase=Modelica.Constants.pi/2;
  output Modelica.SIunits.Voltage v;
  output Modelica.SIunits.Current i;
  annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=6.2832, Interval=0.01), experimentSetupOutput(doublePrecision=true), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  Modelica.Electrical.Analog.Basic.SaturatingInductor SaturatingInductance1(Lzer=Lzer, Lnom=Lnom, Inom=Inom, Linf=Linf) annotation(Placement(visible=true, transformation(origin={30,10}, extent={{10,-10},{-10,10}}, rotation=-270)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-20,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V=U, phase=phase, freqHz=f) annotation(Placement(visible=true, transformation(origin={-20,10}, extent={{-10,-10},{10,10}}, rotation=630)));
equation 
  connect(SaturatingInductance1.p,SineVoltage1.p) annotation(Line(visible=true, points={{30,20},{30,30},{-20,30},{-20,20}}, color={0,0,255}));
  connect(SineVoltage1.n,Ground1.p) annotation(Line(visible=true, points={{-20,0},{-20,-20}}, color={0,0,255}));
  connect(SineVoltage1.n,SaturatingInductance1.n) annotation(Line(visible=true, points={{-20,0},{-20,-10},{30,-10},{30,0}}, color={0,0,255}));
  v=SaturatingInductance1.v;
  i=SaturatingInductance1.i;
end ShowSaturatingInductor;
