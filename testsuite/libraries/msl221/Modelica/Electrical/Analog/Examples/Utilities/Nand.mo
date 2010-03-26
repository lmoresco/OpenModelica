within Modelica.Electrical.Analog.Examples.Utilities;
model Nand "CMOS NAND Gate (see Tietze/Schenk, page 157)"
  annotation(Documentation(info="<html>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>
</dd>
</dl>

</HTML>
", revisions="<html>
<dl>
<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://people.eas.iis.fhg.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://people.eas.iis.fhg.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-50.0,-70.0},{50.0,70.0}}),Ellipse(visible=true, pattern=LinePattern.None, extent={{50.0,-5.0},{60.0,5.0}}),Text(visible=true, extent={{-16.0,20.0},{14.0,50.0}}, textString="&", fontName="Arial"),Line(visible=true, points={{60.0,0.0},{100.0,0.0}}, color={0,0,255}),Line(visible=true, points={{0.0,70.0},{0.0,100.0}}, color={0,0,255}),Line(visible=true, points={{-50.0,50.0},{-100.0,50.0}}, color={0,0,255}),Line(visible=true, points={{-50.0,-50.0},{-100.0,-50.0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{50.0,-5.0},{60.0,5.0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,24.0},{-90.0,34.0}}, textString="x1", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-75.0},{-90.0,-65.0}}, textString="x2", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{90.0,-25.0},{100.0,-15.0}}, textString="y", fontName="Arial")}));
  Semiconductors.PMOS TP1(W=6.5e-06, L=3.1e-06, Beta=1.05e-05, Vt=-1, K2=0.41, K5=0.8385, dW=-2.5e-06, dL=-2.1e-06) annotation(Placement(visible=true, transformation(origin={20,70}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.PMOS TP2(W=6.5e-06, L=3.1e-06, Beta=1.05e-05, Vt=-1, K2=0.41, K5=0.8385, dW=-2.5e-06, dL=-2.1e-06) annotation(Placement(visible=true, transformation(origin={-30,55}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.NMOS TN1(W=6.5e-06, L=3.1e-06, Beta=4.1e-05, Vt=0.8, K2=1.144, K5=0.7311, dW=-2.5e-06, dL=-1.5e-06) annotation(Placement(visible=true, transformation(origin={20,25}, extent={{-10,-10},{10,10}}, rotation=0)));
  Semiconductors.NMOS TN2(W=6.5e-06, L=3.1e-06, Beta=4.1e-05, Vt=0.8, K2=1.144, K5=0.7311, dW=-2.5e-06, dL=-1.5e-06) annotation(Placement(visible=true, transformation(origin={20,-15}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Ground Gnd annotation(Placement(visible=true, transformation(origin={45,-20}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd2 annotation(Placement(visible=true, transformation(origin={60,5}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd3 annotation(Placement(visible=true, transformation(origin={55,-75}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd6 annotation(Placement(visible=true, transformation(origin={-10,35}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd7 annotation(Placement(visible=true, transformation(origin={45,20}, extent={{-5,-5},{5,5}}, rotation=0)));
  Basic.Ground Gnd8 annotation(Placement(visible=true, transformation(origin={45,65}, extent={{-5,-5},{5,5}}, rotation=0)));
  Interfaces.Pin x1 annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin x2 annotation(Placement(visible=true, transformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin Vdd annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=0)));
  Interfaces.Pin y annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  Basic.Capacitor C4(C=4e-14) annotation(Placement(visible=true, transformation(origin={60,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
  Basic.Capacitor C7(C=4e-14) annotation(Placement(visible=true, transformation(origin={55,-50}, extent={{-10,-10},{10,10}}, rotation=-90)));
equation 
  connect(TP2.D,Vdd) annotation(Line(visible=true, points={{-20.0,60.0},{-20.0,80.0},{0.0,80.0},{0.0,100.0}}, color={0,0,255}));
  connect(Vdd,TP1.D) annotation(Line(visible=true, points={{0.0,100.0},{0.0,80.0},{30.0,80.0},{30.0,75.0}}, color={0,0,255}));
  connect(TP2.S,TN1.D) annotation(Line(visible=true, points={{-20.0,50.0},{30.0,50.0},{30.0,30.0}}, color={0,0,255}));
  connect(TN1.G,x2) annotation(Line(visible=true, points={{10.0,20.0},{-70.0,20.0},{-70.0,-50.0},{-100.0,-50.0}}, color={0,0,255}));
  connect(TP2.G,TN2.G) annotation(Line(visible=true, points={{-40.0,50.0},{-40.0,-20.0},{10.0,-20.0}}, color={0,0,255}));
  connect(TP2.G,x1) annotation(Line(visible=true, points={{-40.0,50.0},{-100.0,50.0}}, color={0,0,255}));
  connect(TP1.B,Gnd8.p) annotation(Line(visible=true, points={{30.0,70.0},{45.0,70.0}}, color={0,0,255}));
  connect(TN1.B,Gnd7.p) annotation(Line(visible=true, points={{30.0,25.0},{45.0,25.0}}, color={0,0,255}));
  connect(TP2.B,Gnd6.p) annotation(Line(visible=true, points={{-20.0,55.0},{-10.0,55.0},{-10.0,40.0}}, color={0,0,255}));
  connect(TP1.G,TN1.G) annotation(Line(visible=true, points={{10.0,65.0},{10.0,20.0}}, color={0,0,255}));
  connect(TP1.S,TN1.D) annotation(Line(visible=true, points={{30.0,65.0},{30.0,30.0}}, color={0,0,255}));
  connect(TN2.S,Gnd.p) annotation(Line(visible=true, points={{30.0,-20.0},{38.0,-20.0},{38.0,-15.0},{45.0,-15.0}}, color={0,0,255}));
  connect(TN2.B,Gnd.p) annotation(Line(visible=true, points={{30.0,-15.0},{38.0,-15.0},{38.0,-15.0},{45.0,-15.0}}, color={0,0,255}));
  connect(TN1.S,TN2.D) annotation(Line(visible=true, points={{30.0,20.0},{30.0,-10.0}}, color={0,0,255}));
  connect(C4.n,Gnd2.p) annotation(Line(visible=true, points={{60.0,20.0},{60.0,10.0}}, color={0,0,255}));
  connect(TN1.D,C4.p) annotation(Line(visible=true, points={{30.0,30.0},{30.0,50.0},{60.0,50.0},{60.0,40.0}}, color={0,0,255}));
  connect(C4.p,y) annotation(Line(visible=true, points={{60.0,40.0},{60.0,50.0},{80.0,50.0},{80.0,0.0},{100.0,0.0}}, color={0,0,255}));
  connect(TN2.D,C7.p) annotation(Line(visible=true, points={{30.0,-10.0},{55.0,-10.0},{55.0,-40.0}}, color={0,0,255}));
  connect(C7.n,Gnd3.p) annotation(Line(visible=true, points={{55.0,-60.0},{55.0,-70.0}}, color={0,0,255}));
end Nand;
