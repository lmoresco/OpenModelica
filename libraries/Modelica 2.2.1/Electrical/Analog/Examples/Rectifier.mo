within Modelica.Electrical.Analog.Examples;
model Rectifier "B6 diode bridge"
  extends Modelica.Icons.Example;
  import Modelica.Electrical.Analog.Ideal;
  parameter Modelica.SIunits.Voltage VAC=400 "RMS line-to-line";
  parameter Modelica.SIunits.Frequency f=50 "line frequency";
  parameter Modelica.SIunits.Inductance LAC=6e-05 "line inductor";
  parameter Modelica.SIunits.Resistance Ron=0.001 "diode forward resistance";
  parameter Modelica.SIunits.Conductance Goff=0.001 "diode backward conductance";
  parameter Modelica.SIunits.Voltage Vknee=2 "diode threshold voltage";
  parameter Modelica.SIunits.Capacitance CDC=0.015 "DC capacitance";
  parameter Modelica.SIunits.Current IDC=500 "load current";
  output Modelica.SIunits.Voltage uDC;
  output Modelica.SIunits.Current iAC[3];
  output Modelica.SIunits.Voltage uAC[3];
  output Modelica.SIunits.Power Losses;
  annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-80,70},{80,90}}, textString="Rectifier", fontName="Arial"),Line(visible=true, points={{-16,18},{-16,2},{-18,6},{-14,6},{-16,2}}),Line(visible=true, points={{-30,22},{-26,20},{-30,18},{-30,22}}),Line(visible=true, points={{32,30},{32,-30},{30,-26},{34,-26},{32,-30}}),Text(visible=true, extent={{-38,8},{-22,16}}, textString="iAC", fontName="Arial"),Text(visible=true, extent={{-14,0},{2,8}}, textString="uAC", fontName="Arial"),Text(visible=true, extent={{22,-24},{38,-16}}, textString="uDC", fontName="Arial")}), experiment(StopTime=0.1, Interval=1e-05), experimentSetupOutput(doublePrecision=true, states=false, derivatives=false, inputs=false, auxiliaries=false), Documentation(info="<HTML>
<P>
The rectifier example shows a B6 diode bridge fed by a three phase sinusoidal voltage, loaded by a DC current.<br>
DC capacitors start at ideal no-load voltage, thus making easier initial transient.
</P>
<P>
Simulate until T=0.1 s.<br><br>
Plot in separate windows:<br><br>
uDC ... DC-voltage<br>
iAC ... AC-currents 1..3<br>
uAC ... AC-voltages 1..3 (distorted)<br>
Try different load currents iDC = 0..approximately 500 A.
</P>
<p>
You may watch Losses (of the whole diode bridge) trying different diode parameters.
</p>
 
</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Anton Haumer<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage2(freqHz=f, phase=-2/3*Modelica.Constants.pi, V=VAC*sqrt(2/3)) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{10,-10},{-10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage3(freqHz=f, phase=-4/3*Modelica.Constants.pi, V=VAC*sqrt(2/3)) annotation(Placement(visible=true, transformation(origin={-80,-20}, extent={{10,-10},{-10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor Inductor1(L=LAC) annotation(Placement(visible=true, transformation(origin={-50,20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor Inductor2(L=LAC) annotation(Placement(visible=true, transformation(origin={-50,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Inductor Inductor3(L=LAC) annotation(Placement(visible=true, transformation(origin={-50,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={50,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Blocks.Sources.Constant Constant1(k=IDC) annotation(Placement(visible=true, transformation(origin={90,0}, extent={{10,-10},{-10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(freqHz=f, V=VAC*sqrt(2/3)) annotation(Placement(visible=true, transformation(origin={-80,20}, extent={{10,-10},{-10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Capacitor Capacitor2(C=2*CDC) annotation(Placement(visible=true, transformation(origin={40,-40}, extent={{-10,-10},{10,10}}, rotation=630)));
  Ideal.IdealDiode IdealDiode6(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={20,-40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Ideal.IdealDiode IdealDiode5(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={0,-40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Ideal.IdealDiode IdealDiode4(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={-20,-40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Ideal.IdealDiode IdealDiode1(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={-20,40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Ideal.IdealDiode IdealDiode2(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={-2.77556e-16,40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Ideal.IdealDiode IdealDiode3(Ron=Ron, Goff=Goff, Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={20,40}, extent={{-10,-10},{10,10}}, rotation=450)));
  Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C=2*CDC) annotation(Placement(visible=true, transformation(origin={40,40}, extent={{-10,-10},{10,10}}, rotation=630)));
  Modelica.Electrical.Analog.Sources.SignalCurrent SignalCurrent1 annotation(Placement(visible=true, transformation(origin={60,0}, extent={{-10,-10},{10,10}}, rotation=1710)));
initial equation 
  Capacitor1.v=VAC*sqrt(2)/2;
  Capacitor2.v=VAC*sqrt(2)/2;
equation 
  connect(SineVoltage3.p,Inductor3.p) annotation(Line(visible=true, points={{-70,-20},{-60,-20}}, color={0,0,255}));
  connect(SineVoltage2.p,Inductor2.p) annotation(Line(visible=true, points={{-70,0},{-60,0}}, color={0,0,255}));
  connect(SineVoltage2.n,SineVoltage3.n) annotation(Line(visible=true, points={{-90,0},{-90,-20}}, color={0,0,255}));
  connect(SineVoltage1.n,SineVoltage2.n) annotation(Line(visible=true, points={{-90,20},{-90,0}}, color={0,0,255}));
  connect(SineVoltage1.p,Inductor1.p) annotation(Line(visible=true, points={{-70,20},{-60,20}}, color={0,0,255}));
  connect(Capacitor2.n,IdealDiode6.p) annotation(Line(visible=true, points={{40,-50},{20,-50}}, color={0,0,255}));
  connect(IdealDiode5.p,IdealDiode6.p) annotation(Line(visible=true, points={{-3.06152e-15,-50},{20,-50}}, color={0,0,255}));
  connect(IdealDiode4.p,IdealDiode5.p) annotation(Line(visible=true, points={{-20,-50},{-3.06152e-15,-50}}, color={0,0,255}));
  connect(IdealDiode1.p,IdealDiode4.n) annotation(Line(visible=true, points={{-20,30},{-20,-30}}, color={0,0,255}));
  connect(Inductor1.n,IdealDiode1.p) annotation(Line(visible=true, points={{-40,20},{-20,20},{-20,30}}, color={0,0,255}));
  connect(IdealDiode2.p,IdealDiode5.n) annotation(Line(visible=true, points={{-3.33907e-15,30},{-6.12303e-16,16},{0,0},{0,-30},{3.06152e-15,-30}}, color={0,0,255}));
  connect(IdealDiode1.n,IdealDiode2.n) annotation(Line(visible=true, points={{-20,50},{2.78396e-15,50}}, color={0,0,255}));
  connect(Inductor2.n,IdealDiode2.p) annotation(Line(visible=true, points={{-40,0},{-6.12303e-16,0},{-3.33907e-15,30}}, color={0,0,255}));
  connect(IdealDiode3.p,IdealDiode6.n) annotation(Line(visible=true, points={{20,30},{20,-30}}, color={0,0,255}));
  connect(IdealDiode2.n,IdealDiode3.n) annotation(Line(visible=true, points={{2.78396e-15,50},{20,50}}, color={0,0,255}));
  connect(Inductor3.n,IdealDiode3.p) annotation(Line(visible=true, points={{-40,-20},{20,-20},{20,30}}, color={0,0,255}));
  connect(IdealDiode3.n,Capacitor1.p) annotation(Line(visible=true, points={{20,50},{40,50}}, color={0,0,255}));
  connect(Capacitor1.n,Capacitor2.p) annotation(Line(visible=true, points={{40,30},{40,-30}}, color={0,0,255}));
  connect(Capacitor1.p,SignalCurrent1.p) annotation(Line(visible=true, points={{40,50},{60,50},{60,10}}, color={0,0,255}));
  connect(SignalCurrent1.n,Capacitor2.n) annotation(Line(visible=true, points={{60,-10},{60,-50},{40,-50}}, color={0,0,255}));
  connect(Constant1.y,SignalCurrent1.i) annotation(Line(visible=true, points={{79,0},{79,4.28612e-16},{67,4.29087e-15}}, color={0,0,255}));
  connect(Capacitor2.p,Ground1.p) annotation(Line(visible=true, points={{40,-30},{40,0},{50,0},{50,-60}}, color={0,0,255}));
  uDC=Capacitor1.v + Capacitor2.v;
  iAC={Inductor1.i,Inductor2.i,Inductor3.i};
  uAC[1]=Inductor1.n.v - Inductor2.n.v;
  uAC[2]=Inductor2.n.v - Inductor3.n.v;
  uAC[3]=Inductor3.n.v - Inductor1.n.v;
  Losses=IdealDiode1.v*IdealDiode1.i + IdealDiode2.v*IdealDiode2.i + IdealDiode3.v*IdealDiode3.i + IdealDiode4.v*IdealDiode4.i + IdealDiode5.v*IdealDiode5.i + IdealDiode6.v*IdealDiode6.i;
end Rectifier;
