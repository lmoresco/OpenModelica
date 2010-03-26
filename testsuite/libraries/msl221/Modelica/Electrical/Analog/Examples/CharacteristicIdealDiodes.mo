within Modelica.Electrical.Analog.Examples;
model CharacteristicIdealDiodes "Characteristic of ideal diodes"
  extends Modelica.Icons.Example;
  annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-88,48},{92,102}}, textString="Characteristic Ideal Diodes", fontName="Arial")}), Documentation(info="<HTML>
<P>
Three examples of ideal diodes are shown:<br><br>
the <b>totally ideal diode</b> (Ideal) with all parameters to be zero <br>
the <b>nearly ideal diode</b> with <i>Ron=0.1</i> and <i>Goff=0.1</i> <br>
the nearly ideal but <b>displaced diode</b> with <i>Vknee=5</i> and <i>Ron=0.1</i> and 
<i>Goff=0.1</i> <br><br>
The resistance and conductance are chosen untypically high since the slopes should
be seen in the graphics.
</P>
<P>
Simulate until T=1 s.
</P>
<P>
Plot in separate windows:<br> <br>
Ideal.i versus Ideal.v <br>
With_Ron_Goff.i versus With_Ron_Goff.v<br>
With_Ron_Goff_Vknee.i versus With_Ron_Goff_Vknee.v<br>
</P>
 
</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  annotation(Documentation(info="<HTML>
<P>
Three examples of ideal diodes are shown:<br><br>
the <b>totally ideal diode</b> (Ideal) with all parameters to be zero <br>
the <b>nearly ideal diode</b> with <i>Ron=0.1</i> and <i>Goff=0.1</i> <br>
the nearly ideal but <b>displaced diode</b> with <i>Vknee=5</i> and <i>Ron=0.1</i> and 
<i>Goff=0.1</i> <br><br>
The resistance and conductance are chosen untypically high since the slopes should
be seen in the graphics.
</P>
<P>
Simulate until T=1 s.
</P>
<P>
Plot in separate windows:<br> <br>
Ideal.i versus Ideal.v <br>
With_Ron_Goff.i versus With_Ron_Goff.v<br>
With_Ron_Goff_Vknee.i versus With_Ron_Goff_Vknee.v<br>
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>Mai 7, 2004   </i>
       by Christoph Clauss<br> realized<br>
       </li>
</ul>
</HTML>
"), experiment(StopTime=1));
  Modelica.Electrical.Analog.Ideal.IdealDiode Ideal(Ron=0, Goff=0) annotation(Placement(visible=true, transformation(origin={10,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealDiode With_Ron_Goff(Ron=0.1, Goff=0.1) annotation(Placement(visible=true, transformation(origin={10,10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Ideal.IdealDiode With_Ron_Goff_Vknee(Ron=0.2, Goff=0.2, Vknee=5) annotation(Placement(visible=true, transformation(origin={10,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage1(V=10, offset=-9) annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Basic.Ground Ground1 annotation(Placement(visible=true, transformation(origin={-40,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R1(R=0.001) annotation(Placement(visible=true, transformation(origin={70,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R2(R=0.001) annotation(Placement(visible=true, transformation(origin={70,10}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Basic.Resistor R3(R=0.001) annotation(Placement(visible=true, transformation(origin={70,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage2(V=10, offset=0) annotation(Placement(visible=true, transformation(origin={-60,40}, extent={{-10,-10},{10,10}}, rotation=270)));
  Modelica.Electrical.Analog.Sources.SineVoltage SineVoltage3(V=10, offset=0) annotation(Placement(visible=true, transformation(origin={-20,-40}, extent={{-10,-10},{10,10}}, rotation=270)));
equation 
  connect(SineVoltage3.n,Ground1.p) annotation(Line(visible=true, points={{-20,-50},{-20,-60},{-40,-60}}, color={0,0,255}));
  connect(With_Ron_Goff_Vknee.p,SineVoltage3.p) annotation(Line(visible=true, points={{0,-30},{-20,-30}}, color={0,0,255}));
  connect(SineVoltage1.p,With_Ron_Goff.p) annotation(Line(visible=true, points={{-40,10},{0,10}}, color={0,0,255}));
  connect(SineVoltage2.n,Ground1.p) annotation(Line(visible=true, points={{-60,30},{-60,-60},{-40,-60}}, color={0,0,255}));
  connect(SineVoltage2.p,Ideal.p) annotation(Line(visible=true, points={{-60,50},{0,50}}, color={0,0,255}));
  connect(R3.n,Ground1.p) annotation(Line(visible=true, points={{80,-30},{80,-60},{-40,-60}}, color={0,0,255}));
  connect(R2.n,R3.n) annotation(Line(visible=true, points={{80,10},{80,-30}}, color={0,0,255}));
  connect(R1.n,R2.n) annotation(Line(visible=true, points={{80,50},{80,10}}, color={0,0,255}));
  connect(With_Ron_Goff_Vknee.n,R3.p) annotation(Line(visible=true, points={{20,-30},{60,-30}}, color={0,0,255}));
  connect(With_Ron_Goff.n,R2.p) annotation(Line(visible=true, points={{20,10},{60,10}}, color={0,0,255}));
  connect(Ideal.n,R1.p) annotation(Line(visible=true, points={{20,50},{60,50}}, color={0,0,255}));
  connect(Ground1.p,SineVoltage1.n) annotation(Line(visible=true, points={{-40,-60},{-40,-10}}, color={0,0,255}));
end CharacteristicIdealDiodes;
