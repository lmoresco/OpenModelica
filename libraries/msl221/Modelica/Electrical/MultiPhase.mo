within Modelica.Electrical;
package MultiPhase "Library for electrical components with 2, 3 or more phases"
  extends Modelica.Icons.Library2;
  annotation(version="1.1", versionDate="2006-01-12", classOrder={"Examples","*"}, preferedView="info", Documentation(info="<HTML>
<p>
This package contains packages for electrical multiphase components, based on Modelica.Electrical.Analog:
<ul>
<li>Basic: basic components (resistor, capacitor, inductor, ...)</li>
<li>Ideal: ideal elements (switches, diode, transformer, ...)</li>
<li>Sensors: sensors to measure potentials, voltages, and currents</li>
<li>Sources: time-dependend and controlled voltage and current sources</li>
</ul>
This package is intended to be used the same way as Modelica.Electrical.Analog 
but to make design of multiphase models easier.<br>
The package is based on the plug: a composite connector containing m pins.<br>
It is possible to connect plugs to plugs or single pins of a plug to single pins.<br>
Potentials may be accessed as <tt>plug.pin[].v</tt>, currents may be accessed as <tt>plug.pin[].i</tt>.
</p>
<p>
Further development:
<ul>
<li>temperature-dependent resistor</li>
<li>lines (m-phase models)</li>
</ul>
</p>
<dl>
<p>
  <dt><b>Main Author:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
</dl>
<p>
Copyright &copy; 1998-2005, Modelica Association and Anton Haumer.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>", revisions="<html>
  <ul>
  <li>v1.0 2004/10/01 Anton Haumer</li>
  <li>v1.1 2006/01/12 Anton Haumer<br>
      added Sensors.PowerSensor</li>
  </ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-90},{40,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40,-34},{-20,-14}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{0,-34},{20,-14}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-20,-74},{0,-54}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Basic "Basic components for electrical multiphase models"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains basic analog electrical multiphase components.
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80,-70},{60,-10}}),Line(visible=true, points={{60,-40},{80,-40}}, color={0,0,255}),Line(visible=true, points={{-100,-40},{-80,-40}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model Star "Star-connection"
      parameter Integer m(final min=1)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Connects all pins of plug_p to pin_n, thus establishing a so-called star-connection.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{80,0},{0,0}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{0,0},{-39,68}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{0,0},{-38,-69}}, color={0,0,255}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, extent={{-100,-110},{100,-70}}, textString="m=%m", fontName="Arial"),Line(visible=true, points={{-90,0},{-40,0}}, color={0,0,255}),Line(visible=true, points={{80,0},{90,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      for j in 1:m loop
        connect(plug_p.pin[j],pin_n);
      end for;
    end Star;

    model Delta "Delta (polygon) connection"
      parameter Integer m(final min=2)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Connects in a cyclic way plug_n.pin[j] to plug_p.pin[j+1], 
thus establishing a so-called delta (or polygon) connection 
when used in parallel to another component.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150,60},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-40,68},{-40,-70},{79,0},{-40,68},{-40,67}}, color={0,0,255}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, extent={{-100,-110},{100,-70}}, textString="m=%m", fontName="Arial"),Line(visible=true, points={{-90,0},{-40,0}}, color={0,0,255}),Line(visible=true, points={{80,0},{90,0}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      for j in 1:m loop
        if j < m then
          connect(plug_n.pin[j],plug_p.pin[j + 1]);
        else
          connect(plug_n.pin[j],plug_p.pin[1]);
        end if;
      end for;
    end Delta;

    model PlugToPin_p "Connect one (positive) Pin"
      parameter Integer m(final min=1)=3 "number of phases";
      parameter Integer k(final min=1, final max=m)=1 "phase index";
      annotation(Documentation(info="<HTML>
<p>
Connects pin <i>k</i> of plug_p to pin_p, leaving the other pins of plug_p unconnected.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="k = %k", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-100,10},{90,0},{-100,-10},{-100,10}})}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Interfaces.PositivePin pin_p annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      pin_p.v=plug_p.pin[k].v;
      for j in 1:m loop
        plug_p.pin[j].i=if j == k then -pin_p.i else 0;
      end for;
    end PlugToPin_p;

    model PlugToPin_n "Connect one (negative) Pin"
      parameter Integer m(final min=1)=3 "number of phases";
      parameter Integer k(final min=1, final max=m)=1 "phase index";
      annotation(Documentation(info="<HTML>
<p>
Connects pin <i>k</i> of plug_n to pin_n, leaving the other pins of plug_n unconnected.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{92,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="k = %k", fontName="Arial"),Polygon(visible=true, lineColor={0,0,255}, points={{-100,10},{92,0},{-100,-10},{-100,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Interfaces.NegativePin pin_n annotation(Placement(visible=true, transformation(origin={102,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={102,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      pin_n.v=plug_n.pin[k].v;
      for j in 1:m loop
        plug_n.pin[j].i=if j == k then -pin_n.i else 0;
      end for;
    end PlugToPin_n;

    model Resistor "Ideal linear electrical resistors"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance R[m]=fill(1, m) "Resistance";
      annotation(Documentation(info="<HTML>
<p>
Contains m resistors (Modelica.Electrical.Analog.Basic.Resistor)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-30},{70,30}}),Line(visible=true, points={{-90,0},{-70,0}}, color={0,0,255}),Line(visible=true, points={{70,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.Resistor resistor[m](final R=R) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(resistor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(resistor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
    end Resistor;

    model Conductor "Ideal linear electrical conductors"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance G[m]=fill(1, m) "Conductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m conductors (Modelica.Electrical.Analog.Basic.Conductor)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-30},{70,30}}),Line(visible=true, points={{-90,0},{-70,0}}, color={0,0,255}),Line(visible=true, points={{70,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.Conductor conductor[m](final G=G) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(plug_n.pin,conductor.n) annotation(Line(visible=true, origin={55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(plug_p.pin,conductor.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
    end Conductor;

    model Capacitor "Ideal linear electrical capacitors"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Capacitance C[m]=fill(1, m) "Capacitance";
      annotation(Documentation(info="<HTML>
<p>
Contains m capacitors (Modelica.Electrical.Analog.Basic.Capacitor)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-14,28},{-14,-28}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{14,28},{14,-28}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{-90,0},{-14,0}}, color={0,0,255}),Line(visible=true, points={{14,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.Capacitor capacitor[m](final C=C) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(capacitor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(capacitor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
    end Capacitor;

    model Inductor "Ideal linear electrical inductors"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Inductance L[m]=fill(1, m) "Inductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m inductors (Modelica.Electrical.Analog.Basic.Inductor)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-15},{-30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30,-15},{0,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{0,-15},{30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{30,-15},{60,15}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-30},{60,0}}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-90,0},{-60,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.Inductor inductor[m](final L=L) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(inductor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(inductor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
    end Inductor;

    model SaturatingInductor "Simple model of inductors with saturation"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Current Inom[m]=fill(1, m) "Nominal current";
      parameter Modelica.SIunits.Inductance Lnom[m]=fill(1, m) "Nominal inductance at Nominal current";
      parameter Modelica.SIunits.Inductance Lzer[m]=array(2*Lnom[j] for j in 1:m) "Inductance near current=0";
      parameter Modelica.SIunits.Inductance Linf[m]=array(Lnom[j]/2 for j in 1:m) "Inductance at large currents";
      annotation(Documentation(info="<HTML>
<p>
Contains m saturating inductors (Modelica.Electrical.Analog.Basic.SaturatingInductor)
</p>
<p>
<b>Attention!!!</b><br>
Each element of the array of saturatingInductors is only dependent on the current flowing through this element.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-15},{-30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30,-15},{0,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{0,-15},{30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{30,-15},{60,15}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-20},{60,0}}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-90,0},{-60,0}}, color={0,0,255}),Rectangle(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Sphere, extent={{-60,-20},{60,-10}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Analog.Basic.SaturatingInductor saturatingInductor[m](final Inom=Inom, final Lnom=Lnom, final Lzer=Lzer, final Linf=Linf) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(saturatingInductor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(saturatingInductor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
    end SaturatingInductor;

    model Transformer "Multiphase Transformer"
      extends Interfaces.FourPlug;
      parameter Modelica.SIunits.Inductance L1[m]=fill(1, m) "Primary inductance";
      parameter Modelica.SIunits.Inductance L2[m]=fill(1, m) "Secondary inductance";
      parameter Modelica.SIunits.Inductance M[m]=fill(1, m) "Coupling inductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m transformers (Modelica.Electrical.Analog.Basic.Transformer)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-50},{-20,-25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-25},{-20,0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,0},{-20,25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,25},{-20,50}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-72,-60},{-33,60}}),Line(visible=true, points={{-90,50},{-32,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-32,-50}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-50},{45,-25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-25},{45,0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,0},{45,25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,25},{45,50}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{33,-60},{72,60}}),Line(visible=true, points={{32,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{32,-50},{90,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-20},{-58,20}}, textString="L1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60,-20},{100,20}}, textString="L2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-20,-20},{20,20}}, textString="M", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-80,-100},{80,-60}}, textString="m=%m", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,50},{100,110}}, textString="%name", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.Transformer transformer[m](final L1=L1, final L2=L2, final M=M) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(plug_n2.pin,transformer.n2) annotation(Line(visible=true, points={{100,-100},{10,-100},{10,-5}}, color={0,0,255}));
      connect(plug_n1.pin,transformer.n1) annotation(Line(visible=true, points={{-100,-100},{-10,-100},{-10,-5}}, color={0,0,255}));
      connect(plug_p2.pin,transformer.p2) annotation(Line(visible=true, points={{100,100},{10,100},{10,5}}, color={0,0,255}));
      connect(plug_p1.pin,transformer.p1) annotation(Line(visible=true, points={{-100,100},{-10,100},{-10,5}}, color={0,0,255}));
    end Transformer;

    model VariableResistor "Ideal linear electrical resistors with variable resistance"
      extends Interfaces.TwoPlug;
      annotation(Documentation(info="<HTML>
<p>
Contains m variable resistors (Modelica.Electrical.Analog.Basic.VariableResistor)
</p>
<P>
<b>Attention!!!</b><br>
  It is recomended that none of the R_Port signals should not cross the zero value. 
  Otherwise depending on the surrounding circuit the probability of singularities is high.
</P>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-70,0}}, color={0,0,255}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-30},{70,30}}),Line(visible=true, points={{70,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,30}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,40},{100,80}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.VariableResistor variableResistor[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput R[m](redeclare type SignalType= Modelica.SIunits.Resistance ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(variableResistor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(variableResistor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(R,variableResistor.R) annotation(Line(visible=true, points={{0,100},{0,11}}, color={0,0,255}));
    end VariableResistor;

    model VariableConductor "Ideal linear electrical conductors with variable conductance"
      extends Interfaces.TwoPlug;
      annotation(Documentation(info="<HTML>
<p>
Contains m variable conductors (Modelica.Electrical.Analog.Basic.VariableConductor)
</p>
<P>
<b>Attention!!!</b><br>
  It is recomended that none of the G_Port signals should not cross the zero value. 
  Otherwise depending on the surrounding circuit the probability of singularities is high.
</P>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-70,0}}, color={0,0,255}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-30},{70,30}}),Line(visible=true, points={{70,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,30}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,40},{100,80}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Basic.VariableConductor variableConductor[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput G[m](redeclare type SignalType= Modelica.SIunits.Conductance ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(variableConductor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(variableConductor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(G,variableConductor.G) annotation(Line(visible=true, points={{0,100},{0,11}}, color={0,0,255}));
    end VariableConductor;

    model VariableCapacitor "Ideal linear electrical capacitors with variable capacitance"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Capacitance Cmin[m]=fill(Modelica.Constants.eps, m);
      annotation(Documentation(info="<HTML>
<p>
Contains m variable capacitors (Modelica.Electrical.Analog.Basic.VariableCapacitor)
</p>
<P>
It is required that each C_Port.signal &ge; 0, otherwise an 
assertion is raised. To avoid a variable index system,<br>
C = Cmin, if 0 &le; C_Port.signal &lt; Cmin, where
Cmin is a parameter with default value Modelica.Constants.eps.
</P>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,90},{0,30}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,40},{100,80}}, textString="m=%m", fontName="Arial"),Line(visible=true, points={{-90,0},{-14,0}}, color={0,0,255}),Line(visible=true, points={{14,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{-14,28},{-14,-28}}, color={0,0,255}, thickness=0.5),Line(visible=true, points={{14,28},{14,-28}}, color={0,0,255}, thickness=0.5)}));
      Modelica.Electrical.Analog.Basic.VariableCapacitor variableCapacitor[m](final Cmin=Cmin) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput C[m](redeclare type SignalType= Modelica.SIunits.Capacitance ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(variableCapacitor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(variableCapacitor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(C,variableCapacitor.C) annotation(Line(visible=true, points={{0,100},{0,11}}, color={0,0,255}));
    end VariableCapacitor;

    model VariableInductor "Ideal linear electrical inductors with variable inductance"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Inductance Lmin[m]=fill(Modelica.Constants.eps, m);
      annotation(Documentation(info="<HTML>
<p>
Contains m variable inductors (Modelica.Electrical.Analog.Basic.VariableInductor)
</p>
<P>
It is required that each L_Port.signal &ge; 0, otherwise an 
assertion is raised. To avoid a variable index system,<br>
L = Lmin, if 0 &le; L_Port.signal &lt; Lmin, where
Lmin is a parameter with default value Modelica.Constants.eps.
</P>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,40},{100,80}}, textString="m=%m", fontName="Arial"),Line(visible=true, points={{-90,0},{-60,0}}, color={0,0,255}),Line(visible=true, points={{60,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,8}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-15},{-30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-30,-15},{0,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{0,-15},{30,15}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{30,-15},{60,15}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-30},{60,0}})}));
      Modelica.Electrical.Analog.Basic.VariableInductor variableInductor[m](final Lmin=Lmin) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput L[m](redeclare type SignalType= Modelica.SIunits.Inductance ) annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(variableInductor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(variableInductor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(L,variableInductor.L) annotation(Line(visible=true, points={{0,100},{0,10.8}}, color={0,0,255}));
    end VariableInductor;

  end Basic;

  package Examples "Multiphase test examples"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains test examples of analog electrical multiphase circuits.
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={128,128,128}, extent={{-60,-88},{40,12}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-30,-10},{-30,-66},{28,-38},{-30,-10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model TransformerYY "Test example with multiphase components"
      annotation(Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a Y-Y-transformer with internal impedance (RT, LT) a load resistor RT.<br>
Using f=5 Hz LT=3mH defines nominal voltage drop of approximately 10 %.<br>
Simulate for 1 second (2 periods) and compare voltages and currents of source, transformer and load.
</p>
</HTML>"), experiment(StopTime=1.0), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      extends Modelica.Icons.Example;
      parameter Integer m=3 "Number of phases";
      parameter Modelica.SIunits.Voltage V=1 "Amplitude of Star-Voltage";
      parameter Modelica.SIunits.Frequency f=5 "Frequency";
      parameter Modelica.SIunits.Inductance LT=0.003 "Transformer stray inductance";
      parameter Modelica.SIunits.Resistance RT=0.05 "Transformer resistance";
      parameter Modelica.SIunits.Resistance RL=1 "Load Resistance";
      Sources.SineVoltage SineVoltage1(V=fill(V, m), freqHz=fill(f, m), m=m) annotation(Placement(visible=true, transformation(origin={-80,20}, extent={{-10,-10},{10,10}}, rotation=180)));
      Modelica.Electrical.Analog.Basic.Ground GroundS1 annotation(Placement(visible=true, transformation(origin={-90,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Ideal.IdealTransformer IdealTransformer1(m=m) annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground GroundT2 annotation(Placement(visible=true, transformation(origin={-20,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Resistor RT1(m=m, R=fill(RT, m)) annotation(Placement(visible=true, transformation(origin={10,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Inductor LT1(m=m, L=fill(LT, m)) annotation(Placement(visible=true, transformation(origin={40,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Resistor RL1(m=m, R=fill(RL, m)) annotation(Placement(visible=true, transformation(origin={80,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground GroundT1 annotation(Placement(visible=true, transformation(origin={-40,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Star StarT2(m=m) annotation(Placement(visible=true, transformation(origin={-20,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarT1(m=m) annotation(Placement(visible=true, transformation(origin={-40,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarS1(m=m) annotation(Placement(visible=true, transformation(origin={-90,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarL1(m=m) annotation(Placement(visible=true, transformation(origin={90,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(LT1.plug_n,RL1.plug_p) annotation(Line(visible=true, points={{50,20},{70,20}}, color={0,0,255}));
      connect(RT1.plug_n,LT1.plug_p) annotation(Line(visible=true, points={{20,20},{30,20}}, color={0,0,255}));
      connect(IdealTransformer1.plug_p2,RT1.plug_p) annotation(Line(visible=true, points={{-20,20},{0,20}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,IdealTransformer1.plug_p1) annotation(Line(visible=true, points={{-70,20},{-40,20}}, color={0,0,255}));
      connect(StarT2.pin_n,GroundT2.p) annotation(Line(visible=true, points={{-20,-72.5},{-20,-80}}, color={0,0,255}));
      connect(StarT2.plug_p,IdealTransformer1.plug_n2) annotation(Line(visible=true, points={{-20,-52.5},{-20,0}}, color={0,0,255}));
      connect(StarT1.pin_n,GroundT1.p) annotation(Line(visible=true, points={{-40,-72.5},{-40,-72},{-40,-80}}, color={0,0,255}));
      connect(IdealTransformer1.plug_n1,StarT1.plug_p) annotation(Line(visible=true, points={{-40,0},{-40,-52.5}}, color={0,0,255}));
      connect(StarS1.pin_n,GroundS1.p) annotation(Line(visible=true, points={{-90,-72.5},{-90,-80}}, color={0,0,255}));
      connect(StarS1.plug_p,SineVoltage1.plug_n) annotation(Line(visible=true, points={{-90,-52.5},{-90,20},{-90,20}}, color={0,0,255}));
      connect(RL1.plug_n,StarL1.plug_p) annotation(Line(visible=true, points={{90,20},{90,-52.5}}, color={0,0,255}));
    end TransformerYY;

    model TransformerYD "Test example with multiphase components"
      extends Modelica.Icons.Example;
      parameter Integer m=3 "Number of phases";
      parameter Modelica.SIunits.Voltage V=1 "Amplitude of Star-Voltage";
      parameter Modelica.SIunits.Frequency f=5 "Frequency";
      parameter Modelica.SIunits.Inductance LT=0.003 "Transformer stray inductance";
      parameter Modelica.SIunits.Resistance RT=0.05 "Transformer resistance";
      parameter Modelica.SIunits.Resistance RL=1 "Load Resistance";
      parameter Real nT=1/sqrt((1 - cos(2*Modelica.Constants.pi/m))^2 + sin(2*Modelica.Constants.pi/m)^2) "Transformer ratio";
      annotation(Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a Y-D-transformer with internal impedance (RT, LT) a load resistor RT.<br>
Using f=5 Hz LT=3mH defines nominal voltage drop of approximately 10 %.<br>
Simulate for 1 second (2 periods) and compare voltages and currents of source, transformer and load.
</p>
</HTML>"), experiment(StopTime=1.0), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Sources.SineVoltage SineVoltage1(V=fill(V, m), freqHz=fill(f, m), m=m) annotation(Placement(visible=true, transformation(origin={-80,20}, extent={{-10,-10},{10,10}}, rotation=180)));
      Modelica.Electrical.Analog.Basic.Ground GroundS1 annotation(Placement(visible=true, transformation(origin={-90,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Ideal.IdealTransformer IdealTransformer1(m=m, n=fill(nT, m)) annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Delta Delta1(m=m) annotation(Placement(visible=true, transformation(origin={50,10}, extent={{10,-10},{-10,10}}, rotation=90)));
      Modelica.Electrical.Analog.Basic.Ground GroundT1 annotation(Placement(visible=true, transformation(origin={-40,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Resistor RT1(m=m, R=fill(RT/nT^2, m)) annotation(Placement(visible=true, transformation(origin={0,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Inductor LT1(m=m, L=fill(LT/nT^2, m)) annotation(Placement(visible=true, transformation(origin={30,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Resistor RL1(m=m, R=fill(RL, m)) annotation(Placement(visible=true, transformation(origin={80,20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground GroundL1 annotation(Placement(visible=true, transformation(origin={90,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Basic.Star StarT1(m=m) annotation(Placement(visible=true, transformation(origin={-40,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarL1(m=m) annotation(Placement(visible=true, transformation(origin={90,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarS1(m=m) annotation(Placement(visible=true, transformation(origin={-90,-62.5}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(Delta1.plug_p,RL1.plug_p) annotation(Line(visible=true, points={{50,20},{70,20}}, color={0,0,255}));
      connect(Delta1.plug_n,IdealTransformer1.plug_n2) annotation(Line(visible=true, points={{50,0},{-20,0}}, color={0,0,255}));
      connect(LT1.plug_n,Delta1.plug_p) annotation(Line(visible=true, points={{40,20},{50,20}}, color={0,0,255}));
      connect(RT1.plug_n,LT1.plug_p) annotation(Line(visible=true, points={{10,20},{20,20}}, color={0,0,255}));
      connect(IdealTransformer1.plug_p2,RT1.plug_p) annotation(Line(visible=true, points={{-20,20},{-10,20}}, color={0,0,255}));
      connect(SineVoltage1.plug_p,IdealTransformer1.plug_p1) annotation(Line(visible=true, points={{-70,20},{-40,20}}, color={0,0,255}));
      connect(GroundT1.p,StarT1.pin_n) annotation(Line(visible=true, points={{-40,-80},{-40,-72.5}}, color={0,0,255}));
      connect(IdealTransformer1.plug_n1,StarT1.plug_p) annotation(Line(visible=true, points={{-40,0},{-40,-52.5}}, color={0,0,255}));
      connect(RL1.plug_n,StarL1.plug_p) annotation(Line(visible=true, points={{90,20},{90,-52},{90,-52.5}}, color={0,0,255}));
      connect(StarL1.pin_n,GroundL1.p) annotation(Line(visible=true, points={{90,-72.5},{90,-80}}, color={0,0,255}));
      connect(GroundS1.p,StarS1.pin_n) annotation(Line(visible=true, points={{-90,-80},{-90,-72.5}}, color={0,0,255}));
      connect(StarS1.plug_p,SineVoltage1.plug_n) annotation(Line(visible=true, points={{-90,-52.5},{-90,20},{-90,20}}, color={0,0,255}));
    end TransformerYD;

    model Rectifier "Test example with multiphase components"
      extends Modelica.Icons.Example;
      parameter Integer m=3 "Number of phases";
      parameter Modelica.SIunits.Voltage V=1 "Amplitude of Star-Voltage";
      parameter Modelica.SIunits.Frequency f=5 "Frequency";
      parameter Modelica.SIunits.Inductance L=0.001 "Line Inductance";
      parameter Modelica.SIunits.Resistance RL=2 "Load Resistance";
      parameter Modelica.SIunits.Capacitance C=0.05 "Total DC-Capacitance";
      parameter Modelica.SIunits.Resistance RE=1000000.0 "Earthing Resistance";
      annotation(Documentation(info="<HTML>
<p>
Test example with multiphase components:<br>
Star-connected voltage source feeds via a line reactor a diode bridge rectifier with a DC burden.<br>
Using f=5 Hz, simulate for 1 second (2 periods) and compare voltages and currents of source and DC burden, 
neglecting initial transient.
</p>
</HTML>"), experiment(StopTime=1.0, NumberOfIntervals=1000), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Sources.SineVoltage SineVoltage1(m=m, V=fill(V, m), freqHz=fill(f, m)) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      Basic.Inductor L1(m=m, L=fill(L, m)) annotation(Placement(visible=true, transformation(origin={-42,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Basic.Ground GroundDC annotation(Placement(visible=true, transformation(origin={90,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
      Ideal.IdealDiode IdealDiode1(m=m) annotation(Placement(visible=true, transformation(origin={10,20}, extent={{-10,-10},{10,10}}, rotation=-270)));
      Basic.Star Star1(m=m) annotation(Placement(visible=true, transformation(origin={10,50}, extent={{-10,-10},{10,10}}, rotation=-270)));
      Basic.Star Star2(m=m) annotation(Placement(visible=true, transformation(origin={10,-50}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Basic.Star StarS(m=m) annotation(Placement(visible=true, transformation(origin={-90,-50}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Ideal.IdealDiode IdealDiode2(m=m) annotation(Placement(visible=true, transformation(origin={10,-20}, extent={{-10,-10},{10,10}}, rotation=-270)));
      Modelica.Electrical.Analog.Basic.Resistor RLoad(R=RL) annotation(Placement(visible=true, transformation(origin={50,0}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor2(C=2*C) annotation(Placement(visible=true, transformation(origin={70,-30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Modelica.Electrical.Analog.Basic.Capacitor Capacitor1(C=2*C) annotation(Placement(visible=true, transformation(origin={70,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
    equation 
      connect(SineVoltage1.plug_p,L1.plug_p) annotation(Line(visible=true, points={{-70,0},{-52,0}}, color={0,0,255}));
      connect(IdealDiode1.plug_p,L1.plug_n) annotation(Line(visible=true, points={{10,10},{10,0},{-32,0}}, color={0,0,255}));
      connect(IdealDiode1.plug_n,Star1.plug_p) annotation(Line(visible=true, points={{10,30},{10,40}}, color={0,0,255}));
      connect(StarS.plug_p,SineVoltage1.plug_n) annotation(Line(visible=true, points={{-90,-40},{-90,0}}, color={0,0,255}));
      connect(IdealDiode2.plug_n,L1.plug_n) annotation(Line(visible=true, points={{10,-10},{10,0},{-32,0}}, color={0,0,255}));
      connect(IdealDiode2.plug_p,Star2.plug_p) annotation(Line(visible=true, points={{10,-30},{10,-40}}, color={0,0,255}));
      connect(Star2.pin_n,RLoad.n) annotation(Line(visible=true, points={{10,-60},{50,-60},{50,-10}}, color={0,0,255}));
      connect(Star1.pin_n,RLoad.p) annotation(Line(visible=true, points={{10,60},{50,60},{50,10}}, color={0,0,255}));
      connect(Star2.pin_n,Capacitor2.n) annotation(Line(visible=true, points={{10,-60},{70,-60},{70,-40}}, color={0,0,255}));
      connect(Capacitor1.n,Capacitor2.p) annotation(Line(visible=true, points={{70,20},{70,-20}}, color={0,0,255}));
      connect(Capacitor1.n,GroundDC.p) annotation(Line(visible=true, points={{70,20},{70,0},{90,0},{90,-60}}, color={0,0,255}));
      connect(Star1.pin_n,Capacitor1.p) annotation(Line(visible=true, points={{10,60},{70,60},{70,40}}, color={0,0,255}));
    end Rectifier;

  end Examples;

  package Ideal "Multiphase components with idealized behaviour"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains analog electrical multiphase components with idealized behaviour, 
like thyristor, diode, switch, transformer.
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-40},{80,-40}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{20,-40},{-40,0},{-40,-80},{20,-40}}),Line(visible=true, points={{20,0},{20,-80}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model IdealThyristor "Multiphase ideal thyristor"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed thyristor resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened thyristor conductance";
      parameter Modelica.SIunits.Voltage Vknee[m](final min=zeros(m))=zeros(m) "Treshold voltage";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal thyristors (Modelica.Electrical.Analog.Ideal.IdealThyristor).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{60,30}}, color={0,0,255}),Line(visible=true, points={{30,20},{70,60},{70,90}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{60,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Ideal.IdealThyristor idealThyristor[m](final Ron=Ron, final Goff=Goff, final Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput fire[m] annotation(Placement(visible=true, transformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealThyristor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,idealThyristor.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(fire,idealThyristor.fire) annotation(Line(visible=true, points={{70,110},{70,80},{7,80},{7,11}}, color={255,0,255}));
    end IdealThyristor;

    model IdealGTOThyristor "Multiphase ideal GTO thyristor"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed thyristor resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened thyristor conductance";
      parameter Modelica.SIunits.Voltage Vknee[m](final min=zeros(m))=zeros(m) "Treshold voltage";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal GTO thyristors (Modelica.Electrical.Analog.Ideal.IdealGTOThyristor).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{60,30}}, color={0,0,255}),Line(visible=true, points={{30,20},{70,60},{70,90}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{60,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Ideal.IdealGTOThyristor idealGTOThyristor[m](final Ron=Ron, final Goff=Goff, final Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput fire[m] annotation(Placement(visible=true, transformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={70,110}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealGTOThyristor.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(idealGTOThyristor.p,plug_p.pin) annotation(Line(visible=true, origin={-55,0}, points={{45,0},{-45,0}}, color={0,0,255}));
      connect(fire,idealGTOThyristor.fire) annotation(Line(visible=true, points={{70,110},{70,80},{7,80},{7,11}}, color={255,0,255}));
    end IdealGTOThyristor;

    model IdealCommutingSwitch "Multiphase ideal commuting switch"
      parameter Integer m(final min=1)=3 "number of phases";
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened switch conductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal commuting switches (Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255})}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n2(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n1(final m=m) annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Ideal.IdealCommutingSwitch idealCommutingSwitch[m](final Ron=Ron, final Goff=Goff) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput control[m] "true => p--n2 connected, false => p--n1 connected" annotation(Placement(visible=true, transformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealCommutingSwitch.n1,plug_n1.pin) annotation(Line(visible=true, points={{10,5},{10,50},{100,50}}, color={0,0,255}));
      connect(idealCommutingSwitch.n2,plug_n2.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(plug_p.pin,idealCommutingSwitch.p) annotation(Line(visible=true, points={{-100,0},{-10,0}}, color={0,0,255}));
      connect(control,idealCommutingSwitch.control) annotation(Line(visible=true, points={{0,80},{0,8}}, color={255,0,255}));
    end IdealCommutingSwitch;

    model IdealIntermediateSwitch "Multiphase ideal intermediate switch"
      parameter Integer m(final min=1)=3 "number of phases";
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened switch conductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal intermediate switches (Modelica.Electrical.Analog.Ideal.IdealIntermediateSwitch).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial"),Ellipse(visible=true, lineColor={0,0,255}, extent={{-4,22},{4,30}}),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Line(visible=true, points={{-90,50},{-44,50}}, color={0,0,255}),Line(visible=true, points={{-44,0},{40,50}}, color={0,0,255}),Line(visible=true, points={{-44,50},{40,0}}, color={0,0,255}),Line(visible=true, points={{40,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{0,90},{0,25}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255})}));
      Interfaces.PositivePlug plug_p1(final m=m) annotation(Placement(visible=true, transformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.PositivePlug plug_p2(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n2(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n1(final m=m) annotation(Placement(visible=true, transformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Ideal.IdealIntermediateSwitch idealIntermediateSwitch[m](final Ron=Ron, final Goff=Goff) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput control[m] "true => p1--n2, p2--n1 connected, otherwise p1--n1, p2--n2 connected" annotation(Placement(visible=true, transformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,80}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealIntermediateSwitch.n1,plug_n1.pin) annotation(Line(visible=true, points={{10,5},{10,50},{100,50}}, color={0,0,255}));
      connect(idealIntermediateSwitch.p1,plug_p1.pin) annotation(Line(visible=true, points={{-10,5},{-10,50},{-100,50}}, color={0,0,255}));
      connect(idealIntermediateSwitch.n2,plug_n2.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(plug_p2.pin,idealIntermediateSwitch.p2) annotation(Line(visible=true, points={{-100,0},{-10,0}}, color={0,0,255}));
      connect(control,idealIntermediateSwitch.control) annotation(Line(visible=true, points={{0,80},{0,8}}, color={255,0,255}));
    end IdealIntermediateSwitch;

    model IdealDiode "Multiphase ideal diode"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed diode resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened diode conductance";
      parameter Modelica.SIunits.Voltage Vknee[m](final min=zeros(m))=zeros(m) "Treshold voltage";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal diodes (Modelica.Electrical.Analog.Ideal.IdealDiode).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{40,0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{30,0},{-30,40},{-30,-40},{30,0}}),Line(visible=true, points={{30,40},{30,-40}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-80,60},{80,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Ideal.IdealDiode idealDiode[m](final Ron=Ron, final Goff=Goff, final Vknee=Vknee) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(idealDiode.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,idealDiode.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
    end IdealDiode;

    model IdealTransformer "Multiphase ideal transformer"
      extends Interfaces.FourPlug;
      parameter Real n[m]=fill(1, m) "Turns ratio";
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-50},{-20,-25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,-25},{-20,0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,0},{-20,25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-45,25},{-20,50}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-72,-60},{-33,60}}),Line(visible=true, points={{-90,50},{-32,50}}, color={0,0,255}),Line(visible=true, points={{-90,-50},{-32,-50}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-50},{45,-25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,-25},{45,0}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,0},{45,25}}),Ellipse(visible=true, lineColor={0,0,255}, extent={{20,25},{45,50}}),Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{33,-60},{72,60}}),Line(visible=true, points={{32,50},{90,50}}, color={0,0,255}),Line(visible=true, points={{32,-50},{90,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-80,60},{80,100}}, textString="m=%m", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-100,-110},{100,-50}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Contains m ideal transformers (Modelica.Electrical.Analog.Ideal.IdealTransformer).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Analog.Ideal.IdealTransformer idealTransformer[m](final n=n) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(plug_n2.pin,idealTransformer.n2) annotation(Line(visible=true, points={{100,-100},{10,-100},{10,-5}}, color={0,0,255}));
      connect(plug_n1.pin,idealTransformer.n1) annotation(Line(visible=true, points={{-100,-100},{-10,-100},{-10,-5}}, color={0,0,255}));
      connect(plug_p2.pin,idealTransformer.p2) annotation(Line(visible=true, points={{100,100},{10,100},{10,5}}, color={0,0,255}));
      connect(plug_p1.pin,idealTransformer.p1) annotation(Line(visible=true, points={{-100,100},{-10,100},{-10,5}}, color={0,0,255}));
    end IdealTransformer;

    model Idle "Multiphase idle branch"
      extends Interfaces.TwoPlug;
      annotation(Documentation(info="<HTML>
<p>
Contains m idles (Modelica.Electrical.Analog.Ideal.Idle)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,50},{150,110}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-90,0},{-41,0}}, color={0,0,255}),Line(visible=true, points={{91,0},{40,0}}, color={0,0,255})}));
      Modelica.Electrical.Analog.Ideal.Idle idle[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(idle.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,idle.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
    end Idle;

    model Short "Multiphase short cut branch"
      extends Interfaces.TwoPlug;
      annotation(Documentation(info="<HTML>
<p>
Contains m short cuts (Modelica.Electrical.Analog.Ideal.Short)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,50},{150,110}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{100,-60}}, textString="m=%m", fontName="Arial"),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-60},{60,60}}),Line(visible=true, points={{-90,0},{90,0}}, color={0,0,255})}));
      Modelica.Electrical.Analog.Ideal.Short short[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(short.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,short.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
    end Short;

    model IdealOpeningSwitch "Multiphase ideal opener"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened switch conductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal opening switches (Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch).
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{0,88},{0,26}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial"),Line(visible=true, points={{40,20},{40,0}}, color={0,0,255})}));
      Modelica.Electrical.Analog.Ideal.IdealOpeningSwitch idealOpeningSwitch[m](final Ron=Ron, final Goff=Goff) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput control[m] "true => switch open, false => p--n connected" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealOpeningSwitch.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,idealOpeningSwitch.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(control,idealOpeningSwitch.control) annotation(Line(visible=true, points={{0,70},{0,7}}, color={255,0,255}));
    end IdealOpeningSwitch;

    model IdealClosingSwitch "Multiphase ideal closer"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Resistance Ron[m](final min=zeros(m))=fill(1e-05, m) "Closed switch resistance";
      parameter Modelica.SIunits.Conductance Goff[m](final min=zeros(m))=fill(1e-05, m) "Opened switch conductance";
      annotation(Documentation(info="<HTML>
<p>
Contains m ideal closing switches (Modelica.Electrical.Analog.Ideal.IdealClosingSwitch).
</p><
/HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-100},{150,-40}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-90,0},{-44,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, extent={{-44,-4},{-36,4}}),Line(visible=true, points={{-37,2},{40,50}}, color={0,0,255}),Line(visible=true, points={{0,88},{0,26}}, color={0,0,255}),Line(visible=true, points={{40,0},{90,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Ideal.IdealClosingSwitch idealClosingSwitch[m](final Ron=Ron, final Goff=Goff) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanInput control[m] "true => p--n connected, false => switch open" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(idealClosingSwitch.n,plug_n.pin) annotation(Line(visible=true, origin={55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(plug_p.pin,idealClosingSwitch.p) annotation(Line(visible=true, origin={-55,0}, points={{-45,0},{45,0}}, color={0,0,255}));
      connect(control,idealClosingSwitch.control) annotation(Line(visible=true, points={{0,70},{0,7}}, color={255,0,255}));
    end IdealClosingSwitch;

  end Ideal;

  package Interfaces "Interfaces for electrical multiphase models"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains connectors and interfaces (partial models) for
electrical multiphase components, based on Modelica.Electrical.Analog.
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, extent={{-60,-90},{40,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40,-34},{-20,-14}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{0,-34},{20,-14}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-20,-74},{0,-54}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    connector Plug "Plug with m pins for an electric component"
      parameter Integer m(final min=1)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical. 
The only difference is that the icons are different in order 
to identify more easily the plugs of a component. 
Usually, connector PositivePlug is used for the positive and 
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Analog.Interfaces.Pin pin[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    end Plug;

    connector PositivePlug "Positive plug with m pins"
      extends Plug;
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-100,-179},{100,-99}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical. 
The only difference is that the icons are different in order 
to identify more easily the plugs of a component. 
Usually, connector PositivePlug is used for the positive and 
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"));
    end PositivePlug;

    connector NegativePlug "Negative plug with m pins"
      extends Plug;
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-100,-180},{100,-100}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
<p>
Connectors PositivePlug and NegativePlug are nearly identical. 
The only difference is that the icons are different in order 
to identify more easily the plugs of a component. 
Usually, connector PositivePlug is used for the positive and 
connector NegativePlug for the negative plug of an electrical component.<br>
Connector Plug is a composite connector containing m Pins (Modelica.Electrical.Analog.Interfaces.Pin).
</p>
</HTML>"));
    end NegativePlug;

    partial model TwoPlug "Component with one m-phase electric port"
      parameter Integer m(min=1)=3 "number of phases";
      Modelica.SIunits.Voltage v[m] "Voltage drops between the two plugs";
      Modelica.SIunits.Current i[m] "Currents flowing into positive plugs";
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> electrical plugs: 
the positive plug connector <i>plug_p</i>, and the negative plug connector <i>plug_n</i>. 
The currents flowing into plug_p are provided explicitly as currents i[m].
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      v=plug_p.pin.v - plug_n.pin.v;
      i=plug_p.pin.i;
    end TwoPlug;

    partial model OnePort "Component with two electrical plugs and currents from plug_p to plug_n"
      extends TwoPlug;
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>two</b> electrical plugs: 
the positive plug connector <i>plug_p</i>, and the negative plug connector <i>plug_n</i>. 
The currents flowing into plug_p are provided explicitly as currents i[m]. 
It is assumed that the currents flowing into plug_p are identical to the currents flowing out of plug_n.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      plug_p.pin.i + plug_n.pin.i=zeros(m);
    end OnePort;

    partial model FourPlug "Component with two m-phase electric ports"
      parameter Integer m(final min=1)=3 "number of phases";
      Modelica.SIunits.Voltage v1[m] "Voltage drops over the left port";
      Modelica.SIunits.Voltage v2[m] "Voltage drops over the right port";
      Modelica.SIunits.Current i1[m] "Current flowing into positive plug of the left port";
      Modelica.SIunits.Current i2[m] "Current flowing into positive plug of the right port";
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>four</b> electrical plugs.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      PositivePlug plug_p1(final m=m) annotation(Placement(visible=true, transformation(origin={-100,100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,100}, extent={{-10,-10},{10,10}}, rotation=0)));
      PositivePlug plug_p2(final m=m) annotation(Placement(visible=true, transformation(origin={100,100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,100}, extent={{-10,-10},{10,10}}, rotation=0)));
      NegativePlug plug_n1(final m=m) annotation(Placement(visible=true, transformation(origin={-100,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
      NegativePlug plug_n2(final m=m) annotation(Placement(visible=true, transformation(origin={100,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      v1=plug_p1.pin.v - plug_n1.pin.v;
      v2=plug_p2.pin.v - plug_n2.pin.v;
      i1=plug_p1.pin.i;
      i2=plug_p2.pin.i;
    end FourPlug;

    partial model TwoPort "Component with two m-phase electric ports, including currents"
      extends FourPlug;
      annotation(Documentation(info="<HTML>
<p>
Superclass of elements which have <b>four</b> electrical plugs. 
It is assumed that the currents flowing into plug_p1 are identical to the currents flowing out of plug_n1, 
and that the currents flowing into plug_p2 are identical to the currents flowing out of plug_n2.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      plug_p1.pin.i + plug_n1.pin.i=zeros(m);
      plug_p2.pin.i + plug_n2.pin.i=zeros(m);
    end TwoPort;

  end Interfaces;

  package Sensors "Multiphase potential, voltage and current Sensors"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains multiphase potential, voltage, and current sensors.
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li>v1.0 2004/10/01 Anton Haumer</li>
  <li>v1.1 2006/01/12 Anton Haumer<br>
      added PowerSensor</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-90},{40,10}}),Line(visible=true, points={{-50,-16},{-36,-25}}),Line(visible=true, points={{-35,0},{-25,-14}}),Line(visible=true, points={{-10,7},{-10,-10}}),Line(visible=true, points={{15,0},{5,-14}}),Line(visible=true, points={{30,-15},{16,-25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-15,-45},{-5,-35}}),Line(visible=true, points={{-10,-40},{-6,-26}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-12,-24},{-0.5,-27},{2,1.5},{-12,-24}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model PotentialSensor "Multiphase potential sensor"
      extends Modelica.Icons.RotationalSensor;
      parameter Integer m(final min=1)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Contains m potential sensors (Modelica.Electrical.Analog.Sensors.PotentialSensor), 
thus measuring the m potentials <i>phi[m]</i> of the m pins of plug_p.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{70,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{-70,0},{-90,0}}),Text(visible=true, lineColor={0,0,255}, extent={{-100,-110},{100,-70}}, textString="m=%m", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.PositivePlug plug_p(m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput phi[m](redeclare type SignalType= Modelica.SIunits.ElectricPotential ) "Absolute voltage potential as output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Sensors.PotentialSensor potentialSensor[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(potentialSensor.phi,phi) annotation(Line(visible=true, points={{11,0},{110,0}}, color={0,0,255}));
      connect(potentialSensor.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
    end PotentialSensor;

    model VoltageSensor "Multiphase voltage sensor"
      extends Modelica.Icons.RotationalSensor;
      parameter Integer m(final min=1)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Contains m voltage sensors (Modelica.Electrical.Analog.Sensors.VoltageSensor), 
thus measuring the m potential differences <i>v[m]</i> between the m pins of plug_p and plug_n. 
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="V", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100,60},{100,120}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{-20,-60}}, textString="m=", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{20,-100},{100,-60}}, textString="%m", fontName="Arial")}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput v[m](redeclare type SignalType= Modelica.SIunits.Voltage ) "Voltage between pin p and n (= p.v - n.v) as output signal" annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Modelica.Electrical.Analog.Sensors.VoltageSensor voltageSensor[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(voltageSensor.v,v) annotation(Line(visible=true, points={{0,-10},{0,-110}}, color={0,0,255}));
      connect(voltageSensor.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
      connect(voltageSensor.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
    end VoltageSensor;

    model CurrentSensor "Multiphase current sensor"
      extends Modelica.Icons.RotationalSensor;
      parameter Integer m(final min=1)=3 "number of phases";
      annotation(Documentation(info="<HTML>
<p>
Contains m current sensors (Modelica.Electrical.Analog.Sensors.CurrentSensor), 
thus measuring the m currents <i>i[m]</i> flowing from the m pins of plug_p to the m pins of plug_n. 
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="A", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,120}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,-100},{-20,-60}}, textString="m=", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, extent={{20,-100},{100,-60}}, textString="%m", fontName="Arial")}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Sensors.CurrentSensor currentSensor[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput i[m](redeclare type SignalType= Modelica.SIunits.Current ) "current in the branch from p to n as output signal" annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      connect(currentSensor.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(plug_p.pin,currentSensor.p) annotation(Line(visible=true, points={{-100,0},{-10,0}}, color={0,0,255}));
      connect(currentSensor.i,i) annotation(Line(visible=true, points={{0,-10},{0,-110}}, color={0,0,255}));
    end CurrentSensor;

    model PowerSensor "Multiphase instantaneous power sensor"
      parameter Integer m(min=1)=3 "number of phases";
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html><p>
This power sensor measures instantaneous electrical power of a multiphase system and has a separated voltage and current path. The plugs of the voltage path are <code>pv</code> and <code>nv</code>, the plugs of the current path are <code>pc</code> and <code>nc</code>. The internal resistance of each current path is zero, the internal resistance of each voltage path is infinite. 
</p></html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,100},{0,70}}, color={0,0,255}),Line(visible=true, points={{0,-70},{0,-100}}, color={0,0,255}),Line(visible=true, points={{-80,-100},{-80,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,120},{150,160}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{0,-120},{140,-80}}, textString="m=%m", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}}),Text(visible=true, lineColor={0,0,255}, extent={{-29,-70},{30,-11}}, textString="P", fontName="Arial"),Line(visible=true, points={{-100,0},{100,0}}, color={0,0,255})}));
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug pc(final m=m) "Positive plug, current path" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,10},{10,-10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug nc(final m=m) "Negative plug, current path" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,10},{10,-10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.PositivePlug pv(final m=m) "Positive plug, voltage path" annotation(Placement(visible=true, transformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,100}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.MultiPhase.Interfaces.NegativePlug nv(final m=m) "Negative plug, voltage path" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,10},{10,-10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput power(redeclare type SignalType= Modelica.SIunits.Power ) annotation(Placement(visible=true, transformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Modelica.Electrical.MultiPhase.Sensors.CurrentSensor currentSensor(final m=m) annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Math.Sum sum(final nin=m, final k=ones(m)) annotation(Placement(visible=true, transformation(origin={-30,-70}, extent={{-10,10},{10,-10}}, rotation=-90)));
      Modelica.Blocks.Math.Product product[m] annotation(Placement(visible=true, transformation(origin={-30,-40}, extent={{-10,-10},{10,10}}, rotation=-450)));
      Modelica.Electrical.MultiPhase.Sensors.VoltageSensor voltageSensor(final m=m) annotation(Placement(visible=true, transformation(origin={0,-20}, extent={{10,10},{-10,-10}}, rotation=-270)));
    equation 
      connect(sum.y,power) annotation(Line(visible=true, points={{-30,-81},{-30,-90},{-80,-90},{-80,-110}}, color={0,0,191}));
      connect(currentSensor.plug_n,nc) annotation(Line(visible=true, points={{-30,0},{100,0}}, color={0,0,255}));
      connect(pc,currentSensor.plug_p) annotation(Line(visible=true, points={{-100,0},{-50,0}}, color={0,0,255}));
      connect(currentSensor.i,product.u2) annotation(Line(visible=true, points={{-40,-11},{-40,-20},{-36,-20},{-36,-28}}, color={0,0,191}));
      connect(product.y,sum.u) annotation(Line(visible=true, points={{-30,-51},{-30,-58}}, color={0,0,191}));
      connect(voltageSensor.plug_p,pv) annotation(Line(visible=true, points={{0,-10},{0,-10},{0,100}}, color={0,0,255}));
      connect(voltageSensor.plug_n,nv) annotation(Line(visible=true, points={{0,-30},{0,-30},{0,-100}}, color={0,0,255}));
      connect(product.u1,voltageSensor.v) annotation(Line(visible=true, points={{-24,-28},{-24,-20},{-11,-20}}, color={0,0,191}));
    end PowerSensor;

  end Sensors;

  package Sources "Multiphase voltage and current sources"
    extends Modelica.Icons.Library2;
    annotation(Documentation(info="<HTML>
<p>
This package contains time-dependend and controlled multiphase voltage and current sources:
<ul>
<li>SignalVoltage: fed by Modelica.Blocks.Sources arbitrary waveforms of voltages are possible</li>
<li>SineVoltage : phase shift between consecutive voltages by default <tt>= pi/m</tt></li>
<li>SignalCurrent: fed by Modelica.Blocks.Sources arbitrary waveforms of currents are possible</li>
<li>SineCurrent : phase shift between consecutive currents by default <tt>= pi/m</tt></li>
</ul>
</p>

</HTML>", revisions="<html>
<dl>
<p>
  <dt><b>Main Authors:</b></dt>
  <dd>
  <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
  Technical Consulting & Electrical Engineering<br>
  A-3423 St.Andrae-Woerdern<br>Austria<br>
  email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a>
  </dd>
</p>
<p>
  <dt><b>Release Notes:</b></dt>
  <dd>
  <ul>
  <li> v1.0 2004/10/01 Anton Haumer</li>
  </ul>
  </dd>
<p>
  <dt><b>Copyright:</b></dt>
  <dd>Copyright &copy; 1998-2006, Modelica Association and Anton Haumer.<br>
  <i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
  under the terms of the <b>Modelica license</b>, see the license conditions
  and the accompanying <b>disclaimer</b> in the documentation of package
  Modelica in file \"Modelica/package.mo\".</i></dd>
</p>
</dl>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-40},{-60,-40}}, color={0,0,255}),Line(visible=true, points={{-60,-40},{40,-40}}, color={0,0,255}),Line(visible=true, points={{40,-40},{80,-40}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-60,-90},{40,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model SignalVoltage "Multiphase signal voltage source"
      parameter Integer m(min=1)=3 "number of phases";
      Modelica.SIunits.Current i[m] "Currents flowing into positive plugs";
      annotation(Documentation(info="<HTML>
<p>
Contains m signal controlled voltage sources (Modelica.Electrical.Analog.Sources.SignalVoltage)
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-50,0},{50,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial")}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealInput v[m](redeclare type SignalType= Modelica.SIunits.Voltage ) "Voltage between pin p and n (= p.v - n.v) as input signal" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
      Modelica.Electrical.Analog.Sources.SignalVoltage signalVoltage[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(signalVoltage.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
      connect(signalVoltage.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(v,signalVoltage.v) annotation(Line(visible=true, points={{0,70},{0,7}}, color={0,0,255}));
      i=plug_p.pin.i;
    end SignalVoltage;

    model ConstantVoltage "Multiphase constant voltage source"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Voltage V[m]=fill(1, m) "Value of constant voltage";
      annotation(Documentation(info="<HTML>
<p>
Contains m constant voltage sources (Modelica.Electrical.Analog.Sources.ConstantVoltage) 
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-50,0},{50,0}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{100,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Sources.ConstantVoltage constantVoltage[m](final V=V) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(constantVoltage.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(constantVoltage.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
    end ConstantVoltage;

    model SineVoltage "Multiphase sine voltage source"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Voltage V[m]=fill(1, m) "Amplitudes of sine waves";
      parameter Modelica.SIunits.Angle phase[m]=-array((j - 1)/m*2*Modelica.Constants.pi for j in 1:m) "Phases of sine waves";
      parameter Modelica.SIunits.Frequency freqHz[m]=fill(1, m) "Frequencies of sine waves";
      parameter Modelica.SIunits.Voltage offset[m]=zeros(m) "Voltage offsets";
      parameter Modelica.SIunits.Time startTime[m]=zeros(m) "Time offsets";
      annotation(Documentation(info="<HTML>
<p>
Contains m sine voltage sources (Modelica.Electrical.Analog.Sources.SineVoltage) 
with a default phase shift of -(j-1)/m * 2*pi for j in 1:m.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{-50,0},{50,0}}, color={0,0,255}),Line(visible=true, points={{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}}, color={192,192,192}, smooth=Smooth.Bezier),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{100,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Sources.SineVoltage sineVoltage[m](final V=V, final phase=phase, final freqHz=freqHz, final offset=offset, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(sineVoltage.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(sineVoltage.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
    end SineVoltage;

    model SignalCurrent "Multiphase sine current source"
      parameter Integer m(min=1)=3 "number of phases";
      Modelica.SIunits.Voltage v[m] "Voltage drops between the two plugs";
      annotation(Documentation(info="<HTML>
<p>
Contains m signal controlled current sources (Modelica.Electrical.Analog.Sources.SignalCurrent) 
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{0,50},{0,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{-20,100}}, textString="m=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{20,60},{100,100}}, textString="%m", fontName="Arial")}));
      Interfaces.PositivePlug plug_p(final m=m) annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.NegativePlug plug_n(final m=m) annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent[m] annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=-360)));
      Modelica.Blocks.Interfaces.RealInput i[m](redeclare type SignalType= Modelica.SIunits.Current ) "Current flowing from pin p to pin n as input signal" annotation(Placement(visible=true, transformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,70}, extent={{-20,-20},{20,20}}, rotation=-90)));
    equation 
      connect(signalCurrent.p,plug_p.pin) annotation(Line(visible=true, points={{-10,-2.44921e-15},{-100,0}}, color={0,0,255}));
      connect(signalCurrent.n,plug_n.pin) annotation(Line(visible=true, points={{10,2.44921e-15},{100,0}}, color={0,0,255}));
      connect(i,signalCurrent.i) annotation(Line(visible=true, points={{0,70},{-1.71445e-15,7}}, color={0,0,255}));
      v=plug_p.pin.v - plug_n.pin.v;
    end SignalCurrent;

    model ConstantCurrent "Multiphase constant current source"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Current I[m]=fill(1, m) "Value of constant current";
      annotation(Documentation(info="<HTML>
<p>
Contains m constant current sources (Modelica.Electrical.Analog.Sources.ConstantCurrent) 
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{0,50},{0,-50}}, color={0,0,255}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{100,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Sources.ConstantCurrent constantCurrent[m](final I=I) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(constantCurrent.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(constantCurrent.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
    end ConstantCurrent;

    model SineCurrent "Multiphase sine current source"
      extends Interfaces.TwoPlug;
      parameter Modelica.SIunits.Current I[m]=fill(1, m) "Amplitudes of sine waves";
      parameter Modelica.SIunits.Angle phase[m]=-array((j - 1)/m*2*Modelica.Constants.pi for j in 1:m) "Phases of sine waves";
      parameter Modelica.SIunits.Frequency freqHz[m]=fill(1, m) "Frequencies of sine waves";
      parameter Modelica.SIunits.Voltage offset[m]=zeros(m) "Voltage offsets";
      parameter Modelica.SIunits.Time startTime[m]=zeros(m) "Time offsets";
      annotation(Documentation(info="<HTML>
<p>
Contains m sine current sources (Modelica.Electrical.Analog.Sources.SineCurrent) 
with a default phase shift of -(j-1)/m * 2*pi for j in 1:m.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-50,0}}, color={0,0,255}),Line(visible=true, points={{50,0},{90,0}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,50}}),Line(visible=true, points={{0,50},{0,-50}}, color={0,0,255}),Line(visible=true, points={{-70,0},{-60.2,29.9},{-53.8,46.5},{-48.2,58.1},{-43.3,65.2},{-38.3,69.2},{-33.4,69.8},{-28.5,67},{-23.6,61},{-18.6,52},{-13,38.6},{-5.98,18.6},{8.79,-26.9},{15.1,-44},{20.8,-56.2},{25.7,-64},{30.6,-68.6},{35.5,-70},{40.5,-67.9},{45.4,-62.5},{50.3,-54.1},{55.9,-41.3},{63,-21.7},{70,0}}, color={192,192,192}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-50}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100,60},{100,100}}, textString="m=%m", fontName="Arial")}));
      Modelica.Electrical.Analog.Sources.SineCurrent sineCurrent[m](final I=I, final phase=phase, final freqHz=freqHz, final offset=offset, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(sineCurrent.n,plug_n.pin) annotation(Line(visible=true, points={{10,0},{100,0}}, color={0,0,255}));
      connect(sineCurrent.p,plug_p.pin) annotation(Line(visible=true, points={{-10,0},{-100,0}}, color={0,0,255}));
    end SineCurrent;

  end Sources;

end MultiPhase;
