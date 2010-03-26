within Modelica.Electrical;
package Digital "Library for digital electrical components based on the VHDL standard with 9-valued logic and conversion to 2-,3-,4-valued logic"
  package UsersGuide "Users Guide"
    annotation(DocumentationClass=true, Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Users Guide of package Electrical.Digital</font></h3>
<p>
Library <b>Electrical.Digital</b> is a <b>free</b> Modelica package providing
components to model <b>digital</b> electronic
systems based on combinational and sequential logic in a convenient
way. This package contains the <b>users guide</b> for
the library and has the following content:
</p>
<ol>
<li><a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.OverView\">Overview of library</a>
     gives an overview of the library.</li>
<li> <a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.FirstExample\">A first example</a>
     demonstrates at hand of a first example how to use this library.</li>
<li> <a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.ApplicationExample\">An
     application example</a> demonstrates a generic n-bit adder.
     .</li>
<li><a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the differences between different versions of this library.</li>
<li><a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.Literature\">Literature</a>
    provides references that have been used to design and implement this
    library.</li>
<li><a href=\"Modelica://Modelica.Electrical.Digital.UsersGuide.Contact\">Contact</a>
    provides information about the authors of the library as well as
    acknowledgments.</li>
</ol>
</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    class OverView "Overview of library"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Overview of Library Electrical.Digital</font></h3>
<p>
In this section, an overview of the most important features
of this library is given.
</p>
<p>(will be added as soon as possible). </p>
</html>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end OverView;

    class FirstExample "A first example"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>A first example</font></h3>
<p>
A first example will be given here (not yet done).
</p>
</html>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end FirstExample;

    class ApplicationExample "An application example"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>An application example</font></h3>
<p>
An application example will be given here (not yet done).
</p>
</html>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end ApplicationExample;

    class ReleaseNotes "Release notes"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Release notes</font></h3>
<h3><font color=\"#008000\">Version 1.0.7, 2005-07-01</font></h3>
<ul>
<li> xxxx</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.6, 2004-10-18</font></h3>
<ul>
<li> Missing HTML tags added (problems with mismatched pre tags fixed).</li>
<li> CVS ID string deleted.</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.5, 2004-10-01</font></h3>
<ul>
<li> Wrong identifiers x0 and Tdel in HalfAdder example fixed.</li>
<li> Experiment command in FlipFlop example deleted.</li>
<li> Known issue: Pulse source causes a warning in Dymola. It is recommended to use Clock source.</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.4, 2004-09-30</font></h3>
<ul>
<li> Documentation improved.</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.3, 2004-09-21</font></h3>
<ul>
<li> Table names changed from \"map\" to \"Table\".</li>
<li> Icons for converters modified.</li>
<li> LogicValueType renamed to Logic. For the Electrical.Digital library
     the type Logic has a fundamental meaning. Logic is similar to
     Real, Integer or Boolean in other packages. Names for converters
     are now more consistent (LogicToBoolean, RealToLogic etc.).</li>
<li> Icons for gates and sources improved.</li>
<li> New examples added.</li>
<li> Internal names for signals and ports unified.</li>
<li> Simple Clock source added in addition to Pulse source (for convenience reasons).</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.2, 2004-09-13</font></h3>
<ul>
<li> First prerelease for discussions at the 40th Modelica Design Meeting.</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.1, 2004-06-01</font></h3>
<ul>
<li> Packages Tables, Basic, and Gates implemented.</li>
<li> Transport and inertial delay implemented and successfully tested.</li>
</ul>
<h3><font color=\"#008000\">Version 1.0.0, 2003-05-01</font></h3>
<ul>
<li> A first version has been implemented for case studies.</li>
</ul>
</html>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end ReleaseNotes;

    class Literature "Literature"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Literature</font></h3>
<p>
The Electrical.Digital library is based on the following references:
</p>
<dl>
<dt>Ashenden, P. J.:</dt>
<dd> <b>The Designer's Guide to VHDL.</b> San Francisco: Morgan Kaufmann, 1995, 688 p. ISBN 1-55860-270-4.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>IEEE 1076-1993:</dt>
<dd> <b>IEEE Standard VHDL Language Reference Manual (ANSI).</b> 288 p. ISBN 1-55937-376-8. IEEE Ref. SH16840-NYF.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>IEEE 1164-1993:</dt>
<dd> <b>IEEE Standard Multivalue Logic System for VHDL Model Interoperability (Std_logic_1164).</b> 24 p. ISBN 1-55937-299-0. IEEE Ref. SH16097-NYF.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>Lipsett, R.; Schaefer, C.; Ussery, C.:</dt>
<dd> <b>VHDL: Hardware Description and Design.</b> Boston: Kluwer, 1989, 299 p. ISBN 079239030X.
     <br>&nbsp;</dd>
</dl>
<dl>
<dt>Navabi, Z:</dt>
<dd> <b>VHDL: Analysis and Modeling of Digital Systems.</b> New York: McGraw-Hill, 1993, 375 p. ISBN 0070464723.
     <br>&nbsp;</dd>
</dl>
</html>
 "), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Literature;

    class Contact "Contact"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Contact</font></h3>
<dl>
<dt><b>Main Authors:</b>
<dd><a href=\"http://people.eas.iis.fraunhofer.de/Christoph.Clauss/\">Christoph Clau&szlig;</a>
    &lt;<A HREF=\"mailto:Christoph.Clauss@eas.iis.fraunhofer.de\">Christoph.Clauss@eas.iis.fraunhofer.de</A>&gt;<br>
    <a href=\"http://people.eas.iis.fraunhofer.de/Andre.Schneider/\">Andr&eacute; Schneider</a>
    &lt;<A HREF=\"mailto:Andre.Schneider@eas.iis.fraunhofer.de\">Andre.Schneider@eas.iis.fraunhofer.de</A>&gt;<br>
    Fraunhofer Institute for Integrated Circuits (IIS)<br>
    Design Automation Department (EAS)<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>
    Germany<br>
</dl>
<br>
<br>
<dl>
<dt><b>Acknowledgements:</b></dt>
<dd>
    We thank our colleague <a href=\"http://people.eas.iis.fraunhofer.de/Ulrich.Donath/\">Ulrich Donath</a>
    &lt;<a href=\"mailto:Ulrich.Donath@eas.iis.fraunhofer.de\">Ulrich.Donath@eas.iis.fraunhofer.de</a>&gt;
    for his support and fruitful discussions regarding all questions on VHDL and the IEEE 1164 standard
    logic libraries. Furthermore, we thank our students Teresa Schlegel and Enrico Weber for implementing
    and carefully testing many models and examples.<br>
</dd>
</dl>
</html>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Contact;

  end UsersGuide;

  annotation(Documentation(info="<html>
<p>
This library contains packages for digital electrical components. Both, type system
and models are based on the VHDL standard (IEEE Std 1076-1987 VHDL, IEEE Std 1076-1993 VHDL,
IEEE Std 1164 Multivalue Logic System):
<ul>
<li>Interfaces: Definition of signals and interfaces</li>
<li>Tables: All truth tables needed</li>
<li>Delay: Transport and inertial delay</li>
<li>Basic: Basic logic without delay</li>
<li>Gates: Basic gates composed by basic components and inertial delay</li>
<li>Tristate: (not yet available)</li>
<li>FlipFlops: (not yet available) </li>
<li>Latches: (not yet available)</li>
<li>TransferGates: (not yet available)</li>
<li>Multiplexers (not yet available)</li>
<li>Memory: Ram, Rom, (not yet available)</li>
<li>Sources: Time-dependend signal sources</li>
<li>Converters</li>
<li>Examples</li>
</ul>
</p>
<p>
The logic values are coded by integer values. The following code table is necessary
for both setting of input and interpreting the output values.
</p>
<p><b>Code Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>

<p>
The library will be developed in two main steps. The first step contains the basic components and
the gates. In the next step the more complicated devices will be added. Currently the first step of
the library is implemented and released for public use.
</p>

<p>
Copyright &copy; 1998-2006, Modelica Association and Fraunhofer-Gesellschaft.
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>

</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,-100.0},{-100.0,50.0},{80.0,50.0},{80.0,-100.0},{-100.0,-100.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-52.0,4.0},{-32.0,-36.0}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{8.0,-46.0},{28.0,-86.0}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{8.0,4.0},{28.0,-36.0}}),Line(visible=true, points={{-72.0,-6.0},{-52.0,-6.0}}),Line(visible=true, points={{-72.0,-28.0},{-52.0,-28.0}}),Ellipse(visible=true, extent={{-32.0,-14.0},{-28.0,-18.0}}),Ellipse(visible=true, extent={{28.0,-14.0},{32.0,-18.0}}),Line(visible=true, points={{-28.0,-16.0},{8.0,-16.0}}),Line(visible=true, points={{-28.0,-16.0},{-12.0,-16.0},{-12.0,-56.0},{8.0,-56.0}}),Line(visible=true, points={{8.0,-76.0},{-72.0,-76.0}}),Line(visible=true, points={{32.0,-16.0},{48.0,-16.0}}),Line(visible=true, points={{28.0,-66.0},{48.0,-66.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-52.0,-8.0},{-32.0,0.0}}, textString="&", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{8.0,-10.0},{28.0,-2.0}}, textString="1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{8.0,-58.0},{28.0,-50.0}}, textString="=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-90.0,10.0},{70.0,40.0}}, textString="Library", fontName="Arial")}));
  package Examples "Examples that demonstrate the usage of the Digital electrical components"
    model Multiplexer "4 to 1 Bit Multiplexer Example"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      annotation(Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>4 to 1 Bit Multiplexer</font></h3>
<P>
The multiplexer converts a parallel 4 bit signal in a sequential
1 bit stream.
</P>
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-100.0,100.0},{100.0,-100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=250), experimentSetupOutput);
      Modelica.Electrical.Digital.Sources.Clock CLK(period=20) annotation(Placement(visible=true, transformation(origin={-70.0,-46.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table D0(y0=3, x={4,3,4,3}, t={50,100,145,200}) annotation(Placement(visible=true, transformation(origin={-70.0,68.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table D1(y0=3, x={4,3,4,3}, t={22,140,150,180}) annotation(Placement(visible=true, transformation(origin={-70.0,42.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.MUX4 MUX annotation(Placement(visible=true, transformation(origin={30.0,40.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table D2(y0=3, x={4,3,4,3}, t={22,140,150,180}) annotation(Placement(visible=true, transformation(origin={-70.0,16.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table D3(y0=3, x={4,3,4,3}, t={22,140,150,180}) annotation(Placement(visible=true, transformation(origin={-70.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.JKFF FF annotation(Placement(visible=true, transformation(origin={-10.0,-52.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Set Enable annotation(Placement(visible=true, transformation(origin={-70.0,-72.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    equation 
      connect(FF.q,MUX.a1) annotation(Line(visible=true, points={{0.0,-45.0},{2.0,-45.0},{2.0,-22.0},{-20.0,-22.0},{-20.0,12.0},{-10.0,12.0}}, color={127,0,127}));
      connect(D3.y,MUX.d3) annotation(Line(visible=true, points={{-60.0,-10.0},{-46.0,-10.0},{-46.0,36.8},{-10.0,36.8}}, color={127,0,127}));
      connect(D2.y,MUX.d2) annotation(Line(visible=true, points={{-60.0,16.0},{-50.0,16.0},{-50.0,47.2},{-10.0,47.2}}, color={127,0,127}));
      connect(D1.y,MUX.d1) annotation(Line(visible=true, points={{-60.0,42.0},{-54.0,42.0},{-54.0,57.6},{-10.0,57.6}}, color={127,0,127}));
      connect(D0.y,MUX.d0) annotation(Line(visible=true, points={{-60.0,68.0},{-10.0,68.0}}, color={127,0,127}));
      connect(CLK.y,MUX.a0) annotation(Line(visible=true, points={{-60.0,-46.0},{-36.0,-46.0},{-36.0,22.4},{-10.0,22.4}}, color={127,0,127}));
      connect(Enable.y,FF.j) annotation(Line(visible=true, points={{-60.0,-72.0},{-30.0,-72.0},{-30.0,-45.0},{-20.0,-45.0}}, color={127,0,127}));
      connect(Enable.y,FF.k) annotation(Line(visible=true, points={{-60.0,-72.0},{-30.0,-72.0},{-30.0,-59.0},{-20.0,-59.0}}, color={127,0,127}));
      connect(CLK.y,FF.clk) annotation(Line(visible=true, points={{-60.0,-46.0},{-36.0,-46.0},{-36.0,-52.0},{-20.0,-52.0}}, color={127,0,127}));
    end Multiplexer;

    model FlipFlop "Pulse Triggered Master Slave Flip-Flop"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      annotation(Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>FlipFlop</font></h3>
<P>
Pulse-triggered master-slave flip-flop.
</P>
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-100.0,100.0},{100.0,-100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=250), experimentSetupOutput);
      Modelica.Electrical.Digital.Examples.Utilities.JKFF FF annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Clock CLK(period=10) annotation(Placement(visible=true, transformation(origin={-70.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table J(y0=3, x={4,3,4,3}, t={50,100,145,200}) annotation(Placement(visible=true, transformation(origin={-70.0,28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table K(y0=3, x={4,3,4,3}, t={22,140,150,180}) annotation(Placement(visible=true, transformation(origin={-70.0,-28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    equation 
      connect(K.y,FF.k) annotation(Line(visible=true, points={{-60.0,-28.0},{-10.0,-28.0}}, color={127,0,127}));
      connect(CLK.y,FF.clk) annotation(Line(visible=true, points={{-60.0,0.0},{-10.0,0.0}}, color={127,0,127}));
      connect(J.y,FF.j) annotation(Line(visible=true, points={{-60.0,28.0},{-10.0,28.0}}, color={127,0,127}));
    end FlipFlop;

    model HalfAdder "adding circuit for binary numbers without input carry bit"
      import Modelica.Electrical.Digital;
      annotation(Documentation(info="<HTML>
<P>
This example demonstrates an adding circuit for binary numbers, which internally realizes the interconnection to
And and to Xor in the final sum.
<br>
<br>
1 + 0 = 1<br>
0 + 1 = 1<br>
1 + 1 = 10<br>
0 + 0 = 0
<br>
<br>
<b>a</b> + <b>b</b> = <b>s</b>
<br>(The carry of this adding is <b>c</b>.)
<br>
<br>and
<br>
<br>
<b>a</b> * <b>b</b> = <b>s</b>
<br>  (It is an interconnection to And.)
<br>
<br>
<b>a</b> * <b>b</b> + <b>a</b> * <b>b</b> = <b>a</b> Xor <b>b</b> = <b>c</b>
<br>(It is an interconnection to Xor.)
<br>
<br>
<pre>  <b>a</b>     <b>b</b>     <b>c</b>      <b>s</b>     <b>t</b></pre>

 <pre>  1     0     1      0     1</pre>
 <pre>  0     1     1      0     2</pre>
 <pre>  1     1     0      1     3</pre>
 <pre>  0     0     0      0     4</pre>

<br>
<br>
<b>t</b> is the pick-up instant of the next bit(s) in the simulation.
The simulation stop time should be 5 seconds.
</P>
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-88.0,100.0},{90.0,-100.0}}),Line(visible=true, points={{40.0,54.0},{40.0,60.0},{-40.0,60.0},{10.0,0.0},{-40.0,-60.0},{40.0,-60.0},{40.0,-52.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=5), experimentSetupOutput);
      Modelica.Electrical.Digital.Sources.Table a(t={1,2,3,4}, x={4,3,4,3}, y0=3) annotation(Placement(visible=true, transformation(origin={-70.0,28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table b(x={4,3}, t={2,4}, y0=3) annotation(Placement(visible=true, transformation(origin={-70.0,-28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.HalfAdder Adder(delayTime=0.3) annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal s annotation(Placement(visible=true, transformation(origin={70.0,28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal c annotation(Placement(visible=true, transformation(origin={70.0,-28.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    equation 
      connect(Adder.c,c.x[1]) annotation(Line(visible=true, points={{40.0,-28.0},{65.0,-28.0}}, color={127,0,127}));
      connect(Adder.s,s.x[1]) annotation(Line(visible=true, points={{40.0,28.0},{65.0,28.0}}, color={127,0,127}));
      connect(a.y,Adder.a) annotation(Line(visible=true, points={{-60.0,28.0},{-40.0,28.0}}, color={127,0,127}));
      connect(b.y,Adder.b) annotation(Line(visible=true, points={{-60.0,-28.0},{-40.0,-28.0}}, color={127,0,127}));
    end HalfAdder;

    model FullAdder "Full 1 Bit Adder Example"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      annotation(Documentation(info="<HTML>
<P>
<br>It is an adding circuit for binary numbers with input carry bit, which consists of two HalfAdders.
<br>
<br>
<b>a</b>.y, <b>b</b>.y and <b>c</b>.y are the inputs of the FullAdder.
<br>
<b>c</b>out = <b>Or1</b>.y and <b>h</b>.s are the outputs of the Fulladder.
<br>
<br>
<b>t</b> is the pick-up instant of the next bit(s) in the simulation.
<pre>   <b>a</b>.y      <b>b</b>.y      <b>c</b>.y     <b>c</b>out        <b>h</b>.s        <b>t</b> </pre>

<pre>
     1        0        0        0          1        1
     0        1        0        0          1        2
     0        0        1        0          1        3
     1        1        0        1          0        4
     0        1        1        1          0        5
     1        0        1        1          0        6
     1        1        1        1          1        7
     0        0        0        0          0        8
</pre>
</P>
The simulation stop time should be 10 seconds.
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-100.0,100.0},{100.0,-100.0}}),Line(visible=true, points={{40.0,54.0},{40.0,60.0},{-40.0,60.0},{10.0,0.0},{-40.0,-60.0},{40.0,-60.0},{40.0,-52.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=10), experimentSetupOutput(states=false, derivatives=false, inputs=false));
      Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder1 annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-30.0,-30.0},{30.0,30.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal s annotation(Placement(visible=true, transformation(origin={80.0,22.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal c_out annotation(Placement(visible=true, transformation(origin={80.0,-22.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.Counter3 Counter annotation(Placement(visible=true, transformation(origin={-40.0,2.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Set Enable(x=L.'1') annotation(Placement(visible=true, transformation(origin={-80.0,16.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Clock CLK annotation(Placement(visible=true, transformation(origin={-80.0,-12.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    equation 
      connect(Counter.q0,Adder1.c_in) annotation(Line(visible=true, points={{-20.0,-12.0},{-10.0,-12.0},{-10.0,-21.0},{0.0,-21.0}}, color={127,0,127}));
      connect(Counter.q1,Adder1.b) annotation(Line(visible=true, points={{-20.0,2.0},{-10.0,2.0},{-10.0,9.0},{0.0,9.0}}, color={127,0,127}));
      connect(Counter.q2,Adder1.a) annotation(Line(visible=true, points={{-20.0,16.0},{-10.0,16.0},{-10.0,21.0},{0.0,21.0}}, color={127,0,127}));
      connect(Enable.y,Counter.enable) annotation(Line(visible=true, points={{-70.0,16.0},{-60.0,16.0}}, color={127,0,127}));
      connect(CLK.y,Counter.count) annotation(Line(visible=true, points={{-70.0,-12.0},{-60.0,-12.0}}, color={127,0,127}));
      connect(Adder1.c_out,c_out.x[1]) annotation(Line(visible=true, points={{60.0,-21.0},{68.0,-21.0},{68.0,-22.0},{75.0,-22.0}}, color={127,0,127}));
      connect(Adder1.s,s.x[1]) annotation(Line(visible=true, points={{60.3,21.0},{68.0,21.0},{68.0,22.0},{75.0,22.0}}, color={127,0,127}));
    end FullAdder;

    model Adder4 "4 Bit Adder Example"
      import Modelica.Electrical.Digital;
      annotation(Documentation(info="<HTML>
<P>
Four Fulladders are combined to built a four bit adder unit.
<br>
<br>
In dependence on time five additions are carried out:
<br>
<pre>
at t = 0                            at t = 1
 a       0 0 0 0                       a      1 1 1 0
 b    +  0 0 0 0                       b   +  1 0 1 1
 <b>s     0 0 0 0 0</b>                      <b>s     1 0 0 1 0</b>
at t = 2                             at t = 3
 a       0 1 1 0                       a      1 1 1 0
 b    +  0 0 1 1                       b   +  1 0 1 0
 <b>s     1 0 1 0 0</b>                      <b>s     0 0 0 1 1</b>

at t = 4
 a      1 1 0 0
 b   +  1 1 1 0
 <b>s    0 0 1 0 1</b>
 </pre>
To show the influence of delay a large delay time of 0.1s is choosen.
Furthermore, all signals are initialized with U, the unitialized value.
Please remember, that the nine logic values are coded by the numbers 1,...,9.
The summands a and b can be found at the output signals of the taba and tabb sources.
The result can be seen in the output signals of the Fulladders according to:
<pre>
      a                       <b>a4</b>.y      <b>a3</b>.y      <b>a2</b>.y      <b>a1</b>.y
      b                       <b>b4</b>.y      <b>b3</b>.y      <b>b2</b>.y      <b>b1</b>.y
      sum   <b>Adder4</b>.c_out  <b>Adder4.s</b>  <b>Adder3.s</b>  <b>Adder2.s</b>  <b>Adder1.s</b>
</pre>
The simulation stop time has to be 5s.

</P>
</HTML>
"), Icon(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-200.0,200.0},{200.0,-200.0}})}), Diagram(coordinateSystem(extent={{-200.0,-200.0},{200.0,200.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=5), experimentSetupOutput(states=false, derivatives=false, inputs=false));
      Modelica.Electrical.Digital.Sources.Table b4(y0=3, x={4,3}, t={1,3}) annotation(Placement(visible=true, transformation(origin={90.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table b1(x={4,3,4}, y0=3, t={1,2,3}) annotation(Placement(visible=true, transformation(origin={-150.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table b2(y0=3, x={4}, t={4}) annotation(Placement(visible=true, transformation(origin={-70.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table b3(y0=3, x={4}, t={1}) annotation(Placement(visible=true, transformation(origin={10.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table a1(y0=3, x={4,3,4}, t={1,2,3}) annotation(Placement(visible=true, transformation(origin={-150.0,60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table a2(y0=3, x={4}, t={1}) annotation(Placement(visible=true, transformation(origin={-70.0,60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table a3(y0=3, x={4,3}, t={1,4}) annotation(Placement(visible=true, transformation(origin={11.0,60.0}, extent={{-19.0,-20.0},{19.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Table a4(y0=3, x={3}, t={1}) annotation(Placement(visible=true, transformation(origin={90.0,60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Set Set(x=3) annotation(Placement(visible=true, transformation(origin={-150.0,-74.0}, extent={{20.0,20.0},{-20.0,-20.0}}, rotation=-180)));
      Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder1 annotation(Placement(visible=true, transformation(origin={-80.0,-60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder2 annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder3 annotation(Placement(visible=true, transformation(origin={80.0,-60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder4 annotation(Placement(visible=true, transformation(origin={160.0,-60.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
    equation 
      connect(a4.y,Adder4.a) annotation(Line(visible=true, points={{110.0,60.0},{130.0,60.0},{130.0,-46.0},{140.0,-46.0}}, color={127,0,127}));
      connect(b4.y,Adder4.b) annotation(Line(visible=true, points={{110.0,0.0},{120.0,0.0},{120.0,-54.0},{140.0,-54.0}}, color={127,0,127}));
      connect(a3.y,Adder3.a) annotation(Line(visible=true, points={{30.0,60.0},{50.0,60.0},{50.0,-46.0},{60.0,-46.0}}, color={127,0,127}));
      connect(b3.y,Adder3.b) annotation(Line(visible=true, points={{30.0,0.0},{40.0,0.0},{40.0,-54.0},{60.0,-54.0}}, color={127,0,127}));
      connect(a2.y,Adder2.a) annotation(Line(visible=true, points={{-50.0,60.0},{-30.0,60.0},{-30.0,-46.0},{-20.0,-46.0}}, color={127,0,127}));
      connect(b2.y,Adder2.b) annotation(Line(visible=true, points={{-50.0,0.0},{-40.0,0.0},{-40.0,-54.0},{-20.0,-54.0}}, color={127,0,127}));
      connect(Adder3.c_out,Adder4.c_in) annotation(Line(visible=true, points={{100.0,-74.0},{140.0,-74.0}}, color={127,0,127}));
      connect(Adder2.c_out,Adder3.c_in) annotation(Line(visible=true, points={{20.0,-74.0},{60.0,-74.0}}, color={127,0,127}));
      connect(Adder1.c_out,Adder2.c_in) annotation(Line(visible=true, points={{-60.0,-74.0},{-20.0,-74.0}}, color={127,0,127}));
      connect(Set.y,Adder1.c_in) annotation(Line(visible=true, points={{-130.0,-74.0},{-100.0,-74.0}}, color={127,0,127}));
      connect(a1.y,Adder1.a) annotation(Line(visible=true, points={{-130.0,60.0},{-110.0,60.0},{-110.0,-46.0},{-100.0,-46.0}}, color={127,0,127}));
      connect(b1.y,Adder1.b) annotation(Line(visible=true, points={{-130.0,0.0},{-120.0,0.0},{-120.0,-54.0},{-100.0,-54.0}}, color={127,0,127}));
    end Adder4;

    model Counter3 "3 Bit Counter Example"
      import D = Modelica.Electrical.Digital;
      annotation(Documentation(info="<HTML>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-100.0,100.0},{100.0,-100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=10), experimentSetupOutput(states=false, derivatives=false, inputs=false));
      Modelica.Electrical.Digital.Sources.Step Enable annotation(Placement(visible=true, transformation(origin={-70.0,28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Clock Clock annotation(Placement(visible=true, transformation(origin={-70.0,-28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.Counter3 Counter annotation(Placement(visible=true, transformation(origin={10.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
    equation 
      connect(Clock.y,Counter.count) annotation(Line(visible=true, points={{-50.0,-28.0},{-30.0,-28.0}}, color={127,0,127}));
      connect(Enable.y,Counter.enable) annotation(Line(visible=true, points={{-50.0,28.0},{-30.0,28.0}}, color={127,0,127}));
    end Counter3;

    model Counter "Generic N Bit Counter Example"
      import D = Modelica.Electrical.Digital;
      annotation(Documentation(info="<HTML>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-100.0,100.0},{100.0,-100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=100), experimentSetupOutput(states=false, derivatives=false, inputs=false));
      Modelica.Electrical.Digital.Sources.Step Enable annotation(Placement(visible=true, transformation(origin={-70.0,28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Sources.Clock Clock annotation(Placement(visible=true, transformation(origin={-70.0,-28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Examples.Utilities.Counter Counter(n=4) annotation(Placement(visible=true, transformation(origin={10.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal Q0 annotation(Placement(visible=true, transformation(origin={76.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal Q1 annotation(Placement(visible=true, transformation(origin={76.0,-10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal Q2 annotation(Placement(visible=true, transformation(origin={76.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Converters.LogicToReal Q3 annotation(Placement(visible=true, transformation(origin={76.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    equation 
      connect(Q3.x[1],Counter.q[4]) annotation(Line(visible=true, points={{71.0,30.0},{60.0,30.0},{60.0,24.0},{50.0,0.0}}, color={127,0,127}));
      connect(Q2.x[1],Counter.q[3]) annotation(Line(visible=true, points={{71.0,10.0},{60.0,10.0},{60.0,8.0},{50.0,0.0}}, color={127,0,127}));
      connect(Q1.x[1],Counter.q[2]) annotation(Line(visible=true, points={{71.0,-10.0},{60.0,-10.0},{60.0,-8.0},{50.0,0.0}}, color={127,0,127}));
      connect(Q0.x[1],Counter.q[1]) annotation(Line(visible=true, points={{71.0,-30.0},{58.0,-30.0},{58.0,-24.0},{50.0,0.0}}, color={127,0,127}));
      connect(Clock.y,Counter.count) annotation(Line(visible=true, points={{-50.0,-28.0},{-30.0,-28.0}}, color={127,0,127}));
      connect(Enable.y,Counter.enable) annotation(Line(visible=true, points={{-50.0,28.0},{-30.0,28.0}}, color={127,0,127}));
    end Counter;

    package Utilities "Utility components used by package Examples"
      model MUX4 "4 to 1 Bit Multiplexer"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,60.0},{-64.0,80.0}}, textString="D0", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,-8.0},{86.0,12.0}}, textString="D", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-60.0,40.0},{60.0,100.0}}, textString="MUX", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-80.0},{-64.0,-60.0}}, textString="A1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,34.0},{-64.0,54.0}}, textString="D1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,8.0},{-64.0,28.0}}, textString="D2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-18.0},{-64.0,2.0}}, textString="D3", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-56.0},{-64.0,-36.0}}, textString="A0", fontName="Arial")}));
        parameter Modelica.SIunits.Time delayTime=0.001;
        parameter D.Interfaces.Logic q0=L.'0';
        Modelica.Electrical.Digital.Interfaces.DigitalInput d0 annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput d1 annotation(Placement(visible=true, transformation(origin={-100.0,44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput d2 annotation(Placement(visible=true, transformation(origin={-100.0,18.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,18.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput d3 annotation(Placement(visible=true, transformation(origin={-100.0,-8.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-8.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput a0 annotation(Placement(visible=true, transformation(origin={-100.0,-44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput a1 annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput d annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Or Or1(n=4) annotation(Placement(visible=true, transformation(origin={60.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And1(n=3) annotation(Placement(visible=true, transformation(origin={-10.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And2(n=3) annotation(Placement(visible=true, transformation(origin={-10.0,44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And3(n=3) annotation(Placement(visible=true, transformation(origin={-10.0,18.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And4(n=3) annotation(Placement(visible=true, transformation(origin={-10.0,-8.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Not Not1 annotation(Placement(visible=true, transformation(origin={-66.0,-44.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Not Not2 annotation(Placement(visible=true, transformation(origin={-66.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(a1,And3.x[1]) annotation(Line(visible=true, points={{-100.0,-70.0},{-80.0,-70.0},{-80.0,-90.0},{-30.0,-90.0},{-30.0,12.6667},{-16.0,18.0}}, color={127,0,127}));
        connect(a1,And4.x[1]) annotation(Line(visible=true, points={{-100.0,-70.0},{-80.0,-70.0},{-80.0,-90.0},{-30.0,-90.0},{-30.0,-13.3333},{-16.0,-8.0}}, color={127,0,127}));
        connect(a0,And2.x[3]) annotation(Line(visible=true, points={{-100.0,-44.0},{-80.0,-44.0},{-80.0,49.3333},{-16.0,44.0}}, color={127,0,127}));
        connect(a0,And4.x[3]) annotation(Line(visible=true, points={{-100.0,-44.0},{-80.0,-44.0},{-80.0,-2.6667},{-16.0,-8.0}}, color={127,0,127}));
        connect(Not2.y,And2.x[1]) annotation(Line(visible=true, points={{-56.0,-70.0},{-40.0,-70.0},{-40.0,38.6667},{-16.0,44.0}}, color={127,0,127}));
        connect(Not2.y,And1.x[1]) annotation(Line(visible=true, points={{-56.0,-70.0},{-40.0,-70.0},{-40.0,64.6667},{-16.0,70.0}}, color={127,0,127}));
        connect(Not1.y,And3.x[3]) annotation(Line(visible=true, points={{-56.0,-44.0},{-50.0,-44.0},{-50.0,23.3333},{-16.0,18.0}}, color={127,0,127}));
        connect(Not1.y,And1.x[3]) annotation(Line(visible=true, points={{-56.0,-44.0},{-50.0,-44.0},{-50.0,75.3333},{-16.0,70.0}}, color={127,0,127}));
        connect(Or1.y,d) annotation(Line(visible=true, points={{70.0,30.0},{80.0,30.0},{80.0,0.0},{100.0,0.0}}, color={127,0,127}));
        connect(And1.y,Or1.x[4]) annotation(Line(visible=true, points={{0.0,70.0},{40.0,70.0},{40.0,36.0},{54.0,30.0}}, color={127,0,127}));
        connect(And2.y,Or1.x[3]) annotation(Line(visible=true, points={{0.0,44.0},{20.0,44.0},{20.0,32.0},{54.0,30.0}}, color={127,0,127}));
        connect(And3.y,Or1.x[2]) annotation(Line(visible=true, points={{0.0,18.0},{20.0,18.0},{20.0,28.0},{54.0,30.0}}, color={127,0,127}));
        connect(And4.y,Or1.x[1]) annotation(Line(visible=true, points={{0.0,-8.0},{40.0,-8.0},{40.0,24.0},{54.0,30.0}}, color={127,0,127}));
        connect(d3,And4.x[2]) annotation(Line(visible=true, points={{-100.0,-8.0},{-58.0,-8.0},{-58.0,-8.0},{-16.0,-8.0}}, color={127,0,127}));
        connect(d2,And3.x[2]) annotation(Line(visible=true, points={{-100.0,18.0},{-16.0,18.0}}, color={127,0,127}));
        connect(d1,And2.x[2]) annotation(Line(visible=true, points={{-100.0,44.0},{-16.0,44.0}}, color={127,0,127}));
        connect(d0,And1.x[2]) annotation(Line(visible=true, points={{-100.0,70.0},{-58.0,70.0},{-58.0,70.0},{-16.0,70.0}}, color={127,0,127}));
        connect(a1,Not2.x) annotation(Line(visible=true, points={{-100.0,-70.0},{-72.0,-70.0}}, color={127,0,127}));
        connect(a0,Not1.x) annotation(Line(visible=true, points={{-100.0,-44.0},{-72.0,-44.0}}, color={127,0,127}));
      end MUX4;

      model RS "Unclocked RS FlipFlop"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,40.0},{100.0,100.0}}, textString="RS", fontName="Arial"),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-80.0},{-64.0,-60.0}}, textString="R", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,60.0},{-64.0,80.0}}, textString="S", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,60.0},{86.0,80.0}}, textString="Q", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,-80.0},{86.0,-60.0}}, textString="QN", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial")}));
        parameter Modelica.SIunits.Time delayTime=0 "delay time";
        parameter D.Interfaces.Logic q0=L.'U' "initial value of output";
        Modelica.Electrical.Digital.Basic.Nor Nor1 annotation(Placement(visible=true, transformation(origin={-20.0,62.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Nor Nor2 annotation(Placement(visible=true, transformation(origin={-20.0,-62.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput s annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput r annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput qn annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Delay.TransportDelay TD1(delayTime=delayTime, y0=q0) annotation(Placement(visible=true, transformation(origin={-50.0,-54.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(TD1.x,Nor1.y) annotation(Line(visible=true, points={{-56.0,-54.0},{-70.0,-54.0},{-70.0,-20.0},{20.0,20.0},{20.0,62.0},{0.0,62.0}}, color={127,0,127}));
        connect(TD1.y,Nor2.x[2]) annotation(Line(visible=true, points={{-40.0,-54.0},{-32.0,-62.0}}, color={127,0,127}));
        connect(Nor2.y,q) annotation(Line(visible=true, points={{0.0,-62.0},{70.0,-62.0},{70.0,70.0},{100.0,70.0}}, color={127,0,127}));
        connect(Nor1.y,qn) annotation(Line(visible=true, points={{0.0,62.0},{50.0,62.0},{50.0,-70.0},{100.0,-70.0}}, color={127,0,127}));
        connect(Nor2.y,Nor1.x[1]) annotation(Line(visible=true, points={{0.0,-62.0},{20.0,-62.0},{20.0,-20.0},{-70.0,20.0},{-70.0,54.0},{-32.0,62.0}}, color={127,0,127}));
        connect(r,Nor2.x[1]) annotation(Line(visible=true, points={{-100.0,-70.0},{-32.0,-62.0}}, color={127,0,127}));
        connect(s,Nor1.x[2]) annotation(Line(visible=true, points={{-100.0,70.0},{-32.0,62.0}}, color={127,0,127}));
      end RS;

      model RSFF "Unclocked RS FlipFlop"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,40.0},{100.0,100.0}}, textString="RS", fontName="Arial"),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-80.0},{-64.0,-60.0}}, textString="R", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,60.0},{-64.0,80.0}}, textString="S", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,60.0},{86.0,80.0}}, textString="Q", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,-80.0},{86.0,-60.0}}, textString="QN", fontName="Arial"),Line(visible=true, points={{-90.0,20.0},{-60.0,0.0},{-90.0,-20.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial")}));
        parameter Modelica.SIunits.Time delayTime=0.01;
        parameter D.Interfaces.Logic q0=L.'U';
        Modelica.Electrical.Digital.Interfaces.DigitalInput s annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput r annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput qn "not Q" annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput clk annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.RS RS1(delayTime=delayTime, q0=q0) annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And1 annotation(Placement(visible=true, transformation(origin={-50.0,28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And2 annotation(Placement(visible=true, transformation(origin={-50.0,-28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      equation 
        connect(RS1.qn,qn) annotation(Line(visible=true, points={{70.0,-28.0},{80.0,-28.0},{80.0,-70.0},{100.0,-70.0}}, color={127,0,127}));
        connect(RS1.q,q) annotation(Line(visible=true, points={{70.0,28.0},{80.0,28.0},{80.0,70.0},{100.0,70.0}}, color={127,0,127}));
        connect(r,And2.x[1]) annotation(Line(visible=true, points={{-100.0,-70.0},{-70.0,-70.0},{-70.0,-36.0},{-62.0,-28.0}}, color={127,0,127}));
        connect(clk,And2.x[2]) annotation(Line(visible=true, points={{-100.0,0.0},{-70.0,0.0},{-70.0,-20.0},{-62.0,-28.0}}, color={127,0,127}));
        connect(clk,And1.x[1]) annotation(Line(visible=true, points={{-100.0,0.0},{-70.0,0.0},{-70.0,20.0},{-62.0,28.0}}, color={127,0,127}));
        connect(s,And1.x[2]) annotation(Line(visible=true, points={{-100.0,70.0},{-70.0,70.0},{-70.0,36.0},{-62.0,28.0}}, color={127,0,127}));
        connect(And1.y,RS1.s) annotation(Line(visible=true, points={{-30.0,28.0},{-10.0,28.0}}, color={127,0,127}));
        connect(And2.y,RS1.r) annotation(Line(visible=true, points={{-30.0,-28.0},{-10.0,-28.0}}, color={127,0,127}));
      end RSFF;

      model DFF "D FlipFlop"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-86.0,80.0},{-64.0,60.0}}, textString="D", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{64.0,80.0},{86.0,60.0}}, textString="Q", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{64.0,-60.0},{86.0,-80.0}}, textString="QN", fontName="Arial"),Line(visible=true, points={{-90.0,20.0},{-60.0,0.0},{-90.0,-20.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{-150.0,-100.0},{150.0,-160.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, extent={{-100.0,100.0},{100.0,40.0}}, textString="D", fontName="Arial")}));
        parameter Modelica.SIunits.Time Tdel=0.01;
        parameter Digital.Interfaces.Logic QInit=L.'U';
        Modelica.Electrical.Digital.Interfaces.DigitalInput d annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput qn "not Q" annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput clk annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.RSFF RSFF1 annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-40.0,-40.0},{40.0,40.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Not Not1 annotation(Placement(visible=true, transformation(origin={-50.0,-28.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      equation 
        connect(d,RSFF1.s) annotation(Line(visible=true, points={{-100.0,70.0},{-80.0,70.0},{-80.0,28.0},{-10.0,28.0}}, color={127,0,127}));
        connect(d,Not1.x) annotation(Line(visible=true, points={{-100.0,70.0},{-80.0,70.0},{-80.0,-28.0},{-62.0,-28.0}}, color={127,0,127}));
        connect(clk,RSFF1.clk) annotation(Line(visible=true, points={{-100.0,0.0},{-10.0,0.0}}, color={127,0,127}));
        connect(Not1.y,RSFF1.r) annotation(Line(visible=true, points={{-30.0,-28.0},{-10.0,-28.0}}, color={127,0,127}));
        connect(RSFF1.qn,qn) annotation(Line(visible=true, points={{70.0,-28.0},{80.0,-28.0},{80.0,-70.0},{100.0,-70.0}}, color={127,0,127}));
        connect(RSFF1.q,q) annotation(Line(visible=true, points={{70.0,28.0},{80.0,28.0},{80.0,70.0},{100.0,70.0}}, color={127,0,127}));
      end DFF;

      model JKFF "JK FlipFlop"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,60.0},{-64.0,80.0}}, textString="J", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,60.0},{86.0,80.0}}, textString="Q", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,-80.0},{86.0,-60.0}}, textString="QN", fontName="Arial"),Line(visible=true, points={{-90.0,20.0},{-60.0,0.0},{-90.0,-20.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, origin={0.0,0.0}, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,40.0},{100.0,100.0}}, textString="JK", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-80.0},{-64.0,-60.0}}, textString="K", fontName="Arial")}));
        parameter Modelica.SIunits.Time delayTime=0.001;
        parameter D.Interfaces.Logic q0=L.'0';
        Modelica.Electrical.Digital.Interfaces.DigitalInput j annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput qn "not Q" annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput clk annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput k annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.RS RS1(delayTime=delayTime, q0=q0) annotation(Placement(visible=true, transformation(origin={50.0,-4.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.RS RS2(delayTime=delayTime, q0=q0) annotation(Placement(visible=true, transformation(origin={-24.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And1(n=3) annotation(Placement(visible=true, transformation(origin={-60.0,14.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And2(n=3) annotation(Placement(visible=true, transformation(origin={-60.0,-14.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And3 annotation(Placement(visible=true, transformation(origin={14.0,10.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.And And4 annotation(Placement(visible=true, transformation(origin={14.0,-18.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Basic.Not Not1 annotation(Placement(visible=true, transformation(origin={-24.0,-56.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(RS1.q,qn) annotation(Line(visible=true, points={{70.0,10.0},{80.0,10.0},{80.0,-70.0},{100.0,-70.0}}, color={127,0,127}));
        connect(RS1.qn,q) annotation(Line(visible=true, points={{70.0,-18.0},{86.0,-18.0},{86.0,70.0},{100.0,70.0}}, color={127,0,127}));
        connect(RS1.qn,And1.x[3]) annotation(Line(visible=true, points={{70.0,-18.0},{86.0,-18.0},{86.0,36.0},{-70.0,36.0},{-70.0,19.3333},{-66.0,14.0}}, color={127,0,127}));
        connect(RS1.q,And2.x[1]) annotation(Line(visible=true, points={{70.0,10.0},{80.0,10.0},{80.0,-36.0},{-70.0,-36.0},{-70.0,-19.3333},{-66.0,-14.0}}, color={127,0,127}));
        connect(j,And1.x[2]) annotation(Line(visible=true, points={{-100.0,70.0},{-74.0,70.0},{-74.0,14.0},{-66.0,14.0}}, color={127,0,127}));
        connect(Not1.y,And4.x[1]) annotation(Line(visible=true, points={{-14.0,-56.0},{2.0,-56.0},{2.0,-22.0},{8.0,-18.0}}, color={127,0,127}));
        connect(Not1.y,And3.x[1]) annotation(Line(visible=true, points={{-14.0,-56.0},{2.0,-56.0},{2.0,6.0},{8.0,10.0}}, color={127,0,127}));
        connect(clk,Not1.x) annotation(Line(visible=true, points={{-100.0,0.0},{-80.0,0.0},{-80.0,-56.0},{-30.0,-56.0}}, color={127,0,127}));
        connect(RS2.q,And3.x[2]) annotation(Line(visible=true, points={{-4.0,14.0},{8.0,10.0}}, color={127,0,127}));
        connect(RS2.qn,And4.x[2]) annotation(Line(visible=true, points={{-4.0,-14.0},{8.0,-18.0}}, color={127,0,127}));
        connect(And3.y,RS1.s) annotation(Line(visible=true, points={{24.0,10.0},{30.0,10.0}}, color={127,0,127}));
        connect(And4.y,RS1.r) annotation(Line(visible=true, points={{24.0,-18.0},{30.0,-18.0}}, color={127,0,127}));
        connect(k,And2.x[2]) annotation(Line(visible=true, points={{-100.0,-70.0},{-74.0,-70.0},{-74.0,-14.0},{-66.0,-14.0}}, color={127,0,127}));
        connect(clk,And1.x[1]) annotation(Line(visible=true, points={{-100.0,0.0},{-74.0,0.0},{-74.0,8.6667},{-66.0,14.0}}, color={127,0,127}));
        connect(clk,And2.x[3]) annotation(Line(visible=true, points={{-100.0,0.0},{-74.0,0.0},{-74.0,-8.6667},{-66.0,-14.0}}, color={127,0,127}));
        connect(And1.y,RS2.s) annotation(Line(visible=true, points={{-50.0,14.0},{-44.0,14.0}}, color={127,0,127}));
        connect(And2.y,RS2.r) annotation(Line(visible=true, points={{-50.0,-14.0},{-44.0,-14.0}}, color={127,0,127}));
      end JKFF;

      model HalfAdder
        parameter Real delayTime=0;
        Modelica.Electrical.Digital.Interfaces.DigitalInput b annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput s annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90.0,60.0},{-60.0,80.0}}, textString="a", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-90.0,-80.0},{-60.0,-60.0}}, textString="b", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60.0,60.0},{90.0,80.0}}, textString="s", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{60.0,-80.0},{90.0,-60.0}}, textString="c", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, origin={0.0,-50.0}, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,0.0},{100.0,100.0}}, textString="+", fontName="Arial"),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5)}), Documentation(info="<html>
  
</html>"));
        Modelica.Electrical.Digital.Interfaces.DigitalInput a annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput c annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Gates.AndGate AND(tLH=delayTime, tHL=delayTime) annotation(Placement(visible=true, transformation(origin={0.0,-70.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Gates.XorGate XOR(tLH=delayTime, tHL=delayTime) annotation(Placement(visible=true, transformation(origin={-0.0,70.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      equation 
        connect(a,AND.x[2]) annotation(Line(visible=true, points={{-100.0,70.0},{-40.0,70.0},{-40.0,-60.0},{-12.0,-70.0}}, color={127,0,127}));
        connect(AND.y,c) annotation(Line(visible=true, origin={60.0,-70.0}, points={{-40.0,0.0},{40.0,0.0}}, color={127,0,127}));
        connect(b,AND.x[1]) annotation(Line(visible=true, origin={-56.0,-70.0}, points={{-44.0,0.0},{44.0,0.0}}, color={127,0,127}));
        connect(b,XOR.x[1]) annotation(Line(visible=true, origin={0.0,-10.0}, points={{-100.0,-60.0},{-30.0,-60.0},{-30.0,70.0},{-12.0,80.0}}, color={127,0,127}));
        connect(a,XOR.x[2]) annotation(Line(visible=true, origin={-56.0,62.9668}, points={{-44.0,7.0332},{44.0,7.0332}}, color={127,0,127}));
        connect(XOR.y,s) annotation(Line(visible=true, origin={60.0,70.0}, points={{-40.0,0.0},{40.0,0.0}}, color={127,0,127}));
      end HalfAdder;

      model FullAdder "adding circuit for binary numbers with input carry bit"
        annotation(Documentation(info="<HTML>
<P>
 <pre>
  <b>a     b     c in     c out     s</b>

         1     1     1     0
         0     0     0     0
         1     0     0     1
         0     1     0     1
 </pre>


</P>
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-151.0},{150.0,-96.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,60.0},{-64.0,80.0}}, textString="a", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,20.0},{-64.0,40.0}}, textString="b", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-86.0,-80.0},{-64.0,-60.0}}, textString="c_in", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{60.0,-80.0},{90.0,-60.0}}, textString="c_out", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,60.0},{86.0,80.0}}, textString="s", fontName="Arial"),Text(visible=true, origin={0.0,0.0}, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-100.0,0.0},{100.0,100.0}}, textString="+", fontName="Arial"),Line(visible=true, points={{-60.0,100.0},{-60.0,-100.0}}, thickness=0.5),Line(visible=true, points={{60.0,100.0},{60.0,-100.0}}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Modelica.Electrical.Digital.Examples.Utilities.HalfAdder Adder2(delayTime=0.001) annotation(Placement(visible=true, transformation(origin={30.0,56.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.HalfAdder Adder1(delayTime=0.001) annotation(Placement(visible=true, transformation(origin={-40.0,56.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput a annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput b annotation(Placement(visible=true, transformation(origin={-100.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180), iconTransformation(origin={-100.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput c_in annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-180)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput s annotation(Placement(visible=true, transformation(origin={101.0,70.0}, extent={{11.0,-10.0},{-11.0,10.0}}, rotation=-180), iconTransformation(origin={101.0,70.0}, extent={{11.0,-10.0},{-11.0,10.0}}, rotation=-180)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput c_out annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-180), iconTransformation(origin={100.0,-70.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=-180)));
        Modelica.Electrical.Digital.Basic.Or OR annotation(Placement(visible=true, transformation(origin={30.0,-70.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      equation 
        connect(c_in,Adder2.b) annotation(Line(visible=true, points={{-100.0,-70.0},{0.0,-70.0},{0.0,42.0},{10.0,42.0}}, color={127,0,127}));
        connect(Adder1.c,OR.x[1]) annotation(Line(visible=true, points={{-20.0,42.0},{-10.0,42.0},{-10.0,-78.0},{18.0,-70.0}}, color={127,0,127}));
        connect(Adder1.s,Adder2.a) annotation(Line(visible=true, points={{-20.0,70.0},{10.0,70.0}}, color={127,0,127}));
        connect(b,Adder1.b) annotation(Line(visible=true, points={{-100.0,30.0},{-70.0,30.0},{-70.0,42.0},{-60.0,42.0}}, color={127,0,127}));
        connect(Adder1.a,a) annotation(Line(visible=true, points={{-60.0,70.0},{-100.0,70.0}}, color={127,0,127}));
        connect(Adder2.s,s) annotation(Line(visible=true, points={{50.0,70.0},{101.0,70.0}}, color={127,0,127}));
        connect(Adder2.c,OR.x[2]) annotation(Line(visible=true, points={{50.0,42.0},{70.0,42.0},{70.0,-40.0},{10.0,-40.0},{10.0,-62.0},{18.0,-70.0}}, color={127,0,127}));
        connect(c_out,OR.y) annotation(Line(visible=true, points={{100.0,-70.0},{50.0,-70.0}}, color={127,0,127}));
      end FullAdder;

      model Adder "Generic N Bit Adder"
        import Modelica.Electrical.Digital;
        annotation(Documentation(info="<HTML>
  
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{68.0,60.0},{88.0,80.0}}, textString="S", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,20.0},{40.0,60.0}}, textString="Adder", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{48.0,-80.0},{88.0,-60.0}}, textString="Cout", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,-80.0},{-50.0,-60.0}}, textString="Cin", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-88.0,60.0},{-68.0,80.0}}, textString="A", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-88.0,20.0},{-68.0,40.0}}, textString="B", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=5), experimentSetupOutput(states=false, derivatives=false, inputs=false), DymolaStoredErrors);
        parameter Integer n=2;
        Modelica.Electrical.Digital.Examples.Utilities.FullAdder Adder[n] annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput a[n] annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput b[n] annotation(Placement(visible=true, transformation(origin={-100.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput c_in annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput s[n] annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput c_out annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(Adder[n].c_out,c_out);
        connect(c_in,Adder[1].c_in);
        for i in 1:n loop
          connect(a[i],Adder[i].a);
          connect(b[i],Adder[i].b);
          connect(Adder[i].a,s[i]);
          if i > 1 then
            connect(Adder[i - 1].c_out,Adder[i].c_in);
          end if;
        end for;
      end Adder;

      model Counter3 "3 Bit Counter"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
  
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-80.0,60.0},{-40.0,80.0}}, textString="ENABLE", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,60.0},{86.0,80.0}}, textString="Q2", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{64.0,-80.0},{86.0,-60.0}}, textString="Q0", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-60.0,0.0},{60.0,40.0}}, textString="Counter3", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-80.0,-80.0},{-40.0,-60.0}}, textString="COUNT", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{62.0,-12.0},{84.0,8.0}}, textString="Q1", fontName="Arial")}));
        Modelica.Electrical.Digital.Interfaces.DigitalInput enable annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q2 annotation(Placement(visible=true, transformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput count annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.JKFF FF1 annotation(Placement(visible=true, transformation(origin={-54.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.JKFF FF2 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Examples.Utilities.JKFF FF3 annotation(Placement(visible=true, transformation(origin={54.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q1 annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q0 annotation(Placement(visible=true, transformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(FF2.q,q1) annotation(Line(visible=true, points={{20.0,14.0},{24.0,14.0},{24.0,-50.0},{86.0,-50.0},{86.0,0.0},{100.0,0.0}}, color={127,0,127}));
        connect(FF1.q,q0) annotation(Line(visible=true, points={{-34.0,14.0},{-30.0,14.0},{-30.0,-70.0},{100.0,-70.0}}, color={127,0,127}));
        connect(FF3.q,q2) annotation(Line(visible=true, points={{74.0,14.0},{80.0,14.0},{80.0,70.0},{100.0,70.0}}, color={127,0,127}));
        connect(FF3.j,enable) annotation(Line(visible=true, points={{34.0,14.0},{28.0,14.0},{28.0,70.0},{-100.0,70.0}}, color={127,0,127}));
        connect(FF3.k,FF3.j) annotation(Line(visible=true, points={{34.0,-14.0},{28.0,-14.0},{28.0,14.0},{34.0,14.0}}, color={127,0,127}));
        connect(FF2.k,FF2.j) annotation(Line(visible=true, points={{-20.0,-14.0},{-26.0,-14.0},{-26.0,14.0},{-20.0,14.0}}, color={127,0,127}));
        connect(FF2.j,enable) annotation(Line(visible=true, points={{-20.0,14.0},{-26.0,14.0},{-26.0,70.0},{-100.0,70.0}}, color={127,0,127}));
        connect(FF2.q,FF3.clk) annotation(Line(visible=true, points={{20.0,14.0},{24.0,14.0},{24.0,0.0},{34.0,0.0}}, color={127,0,127}));
        connect(FF1.q,FF2.clk) annotation(Line(visible=true, points={{-34.0,14.0},{-30.0,14.0},{-30.0,0.0},{-20.0,0.0}}, color={127,0,127}));
        connect(count,FF1.clk) annotation(Line(visible=true, points={{-100.0,-70.0},{-86.0,-70.0},{-86.0,0.0},{-74.0,0.0}}, color={127,0,127}));
        connect(enable,FF1.k) annotation(Line(visible=true, points={{-100.0,70.0},{-80.0,70.0},{-80.0,-14.0},{-74.0,-14.0}}, color={127,0,127}));
        connect(enable,FF1.j) annotation(Line(visible=true, points={{-100.0,70.0},{-80.0,70.0},{-80.0,14.0},{-74.0,14.0}}, color={127,0,127}));
      end Counter3;

      model Counter "Generic N Bit Counter"
        import D = Modelica.Electrical.Digital;
        import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
        annotation(Documentation(info="<HTML>
  
</HTML>
"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{90.0,80.0},{110.0,-80.0}})}), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{90.0,80.0},{110.0,-80.0}}),Rectangle(visible=true, fillColor={255,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-90.0,100.0},{90.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-80.0,60.0},{-40.0,80.0}}, textString="ENABLE", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{66.0,-12.0},{88.0,8.0}}, textString="Q", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-40.0,0.0},{40.0,40.0}}, textString="Counter", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-80.0,-80.0},{-40.0,-60.0}}, textString="COUNT", fontName="Arial")}));
        parameter Integer n=3;
        parameter Modelica.SIunits.Time delayTime=0.001;
        parameter D.Interfaces.Logic q0=L.'0';
        Modelica.Electrical.Digital.Interfaces.DigitalInput enable annotation(Placement(visible=true, transformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Electrical.Digital.Interfaces.DigitalInput count annotation(Placement(visible=true, transformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-100.0,-70.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        D.Examples.Utilities.JKFF FF[n](each delayTime=delayTime, each q0=q0);
        Modelica.Electrical.Digital.Interfaces.DigitalOutput q[n] annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-80.0},{10.0,80.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-80.0},{10.0,80.0}}, rotation=0)));
      equation 
        connect(FF[1].q,q[1]);
        connect(count,FF[1].clk);
        connect(enable,FF[1].k);
        connect(enable,FF[1].j);
        for i in 2:n loop
          connect(enable,FF[i].j);
          connect(enable,FF[i].k);
          connect(FF[i - 1].q,FF[i].clk);
          connect(FF[i].q,q[i]);
        end for;
      end Counter;

      annotation(Documentation(info="<html>
<p>
This package contains utility components used by package Examples.
</p>

</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Utilities;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
<p>
This package contains examples that demonstrate the usage of the
components of the Electrical.Digital library.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Examples;

  package Interfaces "Connectors for Digital electrical components"
    type Logic= Integer(min=1, max=9) "Signal type in package Digital according to the IEEE 1164 STD_ULOGIC type" annotation(Documentation(info="<html>
 
<p>
A variable of type Logic is an Integer in the range 1-9.
The Integer values have the following meaning:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>

</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    record LogicValue "Logic values and their coding"
      extends Modelica.Icons.Enumeration;
      constant Integer min=1;
      constant Integer max=9;
      constant Integer 'U'=1 "Uninitialized";
      constant Integer 'X'=2 "Forcing Unknown";
      constant Integer '0'=3 "Forcing 0";
      constant Integer '1'=4 "Forcing 1";
      constant Integer 'Z'=5 "High Impedance";
      constant Integer 'W'=6 "Weak    Unknown";
      constant Integer 'L'=7 "Weak    0";
      constant Integer 'H'=8 "Weak    1";
      constant Integer '-'=9 "Don't care";
      annotation(Documentation(info="<html>
<p><b>Code Table:</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>


</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end LogicValue;

    connector DigitalSignal= Logic "Digital port (both input/output possible)" annotation(Documentation(info="<html>

</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    connector DigitalInput= input DigitalSignal "input DigitalSignal as connector" annotation(defaultComponentName="x", Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}));
    connector DigitalOutput= output DigitalSignal "output DigitalSignal as connector" annotation(defaultComponentName="y", Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0},{-100.0,100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100.0,100.0},{100.0,0.0},{-100.0,-100.0},{-100.0,100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, extent={{-150.0,-160.0},{150.0,-100.0}}, textString="%name", fontName="Arial")}));
    partial block SISO "Single input, single output"
      import D = Modelica.Electrical.Digital;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x "Connector of Digital input signal" annotation(Placement(visible=true, transformation(origin={-60.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-60.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y "Connector of Digital output signal" annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Line(visible=true, points={{50.0,0.0},{92.0,0.0}}, color={127,0,127})}), Documentation(info="<html>
 
</html>"));
    end SISO;

    partial block MISO "Multiple input - single output"
      import D = Modelica.Electrical.Digital;
      parameter Integer n(final min=2)=2 "Number of inputs";
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] "Connector of Digital input signal vector" annotation(Placement(visible=true, transformation(origin={-60.0,0.0}, extent={{-10.0,-80.0},{10.0,80.0}}, rotation=0), iconTransformation(origin={-60.0,0.0}, extent={{-10.0,-80.0},{10.0,80.0}}, rotation=0)));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y "Connector of Digital output signal" annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-50,100},{50,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={255,255,255}),Line(points={{50,0},{90,0}}, color={127,0,127})}), Diagram, Documentation(info="<html>
 
</html>"));
    end MISO;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
<p>
This package contains interface definitions
(connectors) digital electrical components.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Interfaces;

  package Tables "Truth tables for all components of package Digital"
    import D = Modelica.Electrical.Digital;
    import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
    constant D.Interfaces.Logic AndTable[L.max,L.max]=[L.'U',L.'U',L.'0',L.'U',L.'U',L.'U',L.'0',L.'U',L.'U';L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X';L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X';L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X';L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0',L.'0';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'U',L.'X',L.'0',L.'X',L.'X',L.'X',L.'0',L.'X',L.'X'] "9-value logic for 'and'";
    constant D.Interfaces.Logic OrTable[L.max,L.max]=[L.'U',L.'U',L.'U',L.'1',L.'U',L.'U',L.'U',L.'1',L.'U';L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1';L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X';L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1',L.'1';L.'U',L.'X',L.'X',L.'1',L.'X',L.'X',L.'X',L.'1',L.'X'] "9-value logic for 'or'";
    constant D.Interfaces.Logic NotTable[L.max]={L.'U',L.'X',L.'1',L.'0',L.'X',L.'X',L.'1',L.'0',L.'X'} "9-value logic for 'not'";
    constant D.Interfaces.Logic XorTable[L.max,L.max]=[L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U',L.'U';L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'U',L.'X',L.'1',L.'0',L.'X',L.'X',L.'1',L.'0',L.'X';L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X';L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X';L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X';L.'U',L.'X',L.'1',L.'0',L.'X',L.'X',L.'1',L.'0',L.'X';L.'U',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X',L.'X'] "9-value logic for 'xor'";
    constant D.Interfaces.Logic X01Table[L.max]={L.'X',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'};
    constant D.Interfaces.Logic X01ZTable[L.max]={L.'X',L.'X',L.'0',L.'1',L.'Z',L.'X',L.'0',L.'1',L.'Z'};
    constant D.Interfaces.Logic UX01Table[L.max]={L.'U',L.'X',L.'0',L.'1',L.'X',L.'X',L.'0',L.'1',L.'X'};
    constant Integer DelayTable[9,9]=[0,0,-1,1,0,0,-1,1,0;0,0,-1,1,0,0,-1,1,0;1,1,0,1,1,1,0,1,1;-1,-1,-1,0,-1,-1,-1,0,-1;0,0,-1,1,0,0,-1,1,0;0,0,-1,1,0,0,-1,1,0;1,1,0,1,1,1,0,1,1;-1,-1,-1,0,-1,-1,-1,0,-1;0,0,-1,1,0,0,-1,1,0];
    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Tables;

  package Delay "Transport and inertial delay blocks"
    partial block DelayParams "Definition of delay parameters"
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter Modelica.SIunits.Time tLH=0 "rise inertial delay";
      parameter Modelica.SIunits.Time tHL=0 "fall inertial delay";
      parameter Digital.Interfaces.Logic y0=L.'U' "initial value of output";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    algorithm 
      annotation(Documentation(info="<html>
   
</html>"));
    end DelayParams;

    model TransportDelay "Transport delay with initial parameter"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.SISO;
      parameter Modelica.SIunits.Time delayTime=0 "delay time";
      parameter D.Interfaces.Logic y0=L.'U' "initial value of output";
      annotation(Documentation(info="<HTML>
<P>
Provide the input as output exactly delayed by <i>Tdel</i>.
If time less than <i>Tdel</i> the initial value <i>initout</i> holds.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 11, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Polygon(visible=true, points={{-6.0,60.0},{-16.0,40.0},{4.0,40.0},{-6.0,60.0}}),Line(visible=true, points={{0.0,60.0},{20.0,60.0}}),Line(visible=true, points={{10.0,60.0},{10.0,40.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,-40.0},{50.0,-20.0}}, textString="Transport", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,-60.0},{50.0,-40.0}}, textString="Delay", fontName="Arial")}));
    protected 
      D.Interfaces.Logic x_delayed;
    algorithm 
      x_delayed:=integer(delay(x, delayTime));
      y:=if delayTime > 0 then if time >= delayTime then x_delayed else y0 else x;
    end TransportDelay;

    block InertialDelay "Inertial delay with initial parameter"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.SISO;
      parameter Modelica.SIunits.Time delayTime=0 "Minimum time to hold value";
      parameter D.Interfaces.Logic y0=L.'U' "Initial value of output y";
      annotation(Documentation(info="<HTML>
<P>
Provides the input as output delayed by <i>Tdel</i> if the input holds its value for a longer time than <i>Tdel</i>.
If time is less than <i>Tdel</i> the initial value <i>initout</i> holds.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 12, 2003   </i>
       by Christoph Clauss<br>
       reviced</li>
<li><i>March 19, 2003</i>
       by Martin Otter<br>
       initially modelled.</li>
</ul>
</HTML>"), Diagram, Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{152,-160},{-148,-100}}, textString="%name", fillColor={0,0,255}),Rectangle(extent={{-50,100},{50,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={213,170,255}),Polygon(points={{-6,60},{-16,40},{4,40},{-6,60}}, lineColor={0,0,0}),Line(points={{10,60},{10,40}}, color={0,0,0}),Line(points={{0,60},{20,60}}, color={0,0,0}),Text(lineColor={0,0,255}, extent={{-50,-40},{50,-20}}, fillColor={0,0,0}, lineThickness=0.5, textString="Inertial"),Text(lineColor={0,0,255}, extent={{-50,-60},{50,-40}}, fillColor={0,0,0}, lineThickness=0.5, textString="Delay")}));
    protected 
      D.Interfaces.Logic y_auxiliary(start=y0, fixed=true);
      D.Interfaces.Logic x_old(start=y0, fixed=true);
      discrete Modelica.SIunits.Time t_next(start=delayTime, fixed=true);
    algorithm 
      when delayTime > 0 and change(x) then
              x_old:=x;
        t_next:=time + delayTime;
      elsewhen time >= t_next then
        y_auxiliary:=x;
      end when;
      y:=if delayTime > 0 then y_auxiliary else x;
    end InertialDelay;

    model InertialDelaySensitive "Provide the input as output if it holds its value for a specific amount of time"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.SISO;
      parameter Modelica.SIunits.Time tLH=0 "rise inertial delay";
      parameter Modelica.SIunits.Time tHL=0 "fall inertial delay";
      parameter D.Interfaces.Logic y0=L.'U' "initial value of output";
      annotation(Documentation(info="<HTML>
<P>
Provides the input as output delayed by <i>Tdel</i> if the input holds its value for a longer time than <i>Tdel</i>.
If the time is less than <i>Tdel</i> the initial value <i>initout</i> holds.<br>
The delay <i>Tdel</i> depends on the values of the signal change. To calculate <i>Tdel</i>, the delaymap specified in
Digital.Tables is used. If the corresponding value is 1, then <i>tLH</i> is used, if it is -1, then <i>tHL</i>
is used, if it is zero, the input is not delayed.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>January 13, 2005  </i> improved when-conditions and declaration of delayTable
       by Dynasim<br>
       </li>
<li><i>September 15, 2004  </i> color changed, names changed
       by Christoph Clauss<br>
       </li>
<li><i>May 12, 2004  </i> test <i>if Tdel=0</i> replaced
       by Christoph Clauss<br>
       </li>
<li><i>February 5, 2004 </i> handling of <i>tHL=0</i> or <i>tLH=0</i> revised
       by Christoph Clauss<br>
       </li>
<li><i>October 12, 2003   </i>
       by Christoph Clauss<br>
       initially modelled</li>
</HTML>"), Diagram, Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,-40.0},{50.0,-20.0}}, textString="Inertial", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,-60.0},{50.0,-40.0}}, textString="Delay", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,-80.0},{50.0,-60.0}}, textString="sensitive", fontName="Arial"),Polygon(visible=true, points={{-6.0,60.0},{-16.0,40.0},{4.0,40.0},{-6.0,60.0}}),Line(visible=true, points={{10.0,60.0},{10.0,40.0}}),Line(visible=true, points={{0.0,60.0},{20.0,60.0}})}));
    protected 
      Integer delayTable[:,:]=D.Tables.DelayTable "specification of delay according to signal change";
      Modelica.SIunits.Time delayTime;
      D.Interfaces.Logic y_auxiliary(start=y0, fixed=true);
      D.Interfaces.Logic x_old(start=y0, fixed=true);
      Integer lh;
      discrete Modelica.SIunits.Time t_next;
    algorithm 
      when {initial(),(tLH > 0 or tHL > 0) and change(x) and not initial()} then
              x_old:=if initial() or pre(x) == 0 then y0 else pre(x);
        lh:=delayTable[x_old,x];
        delayTime:=if lh > 0 then tLH else if lh < 0 then tHL else 0;
        t_next:=time + delayTime;
        if lh == 0 or abs(delayTime) < Modelica.Constants.small then 
          y_auxiliary:=x;
        end if;
      elsewhen time >= t_next then
        y_auxiliary:=x;
      end when;
      y:=if tLH > 0 or tHL > 0 then y_auxiliary else x;
    end InertialDelaySensitive;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Delay;

  package Basic "Basic logic blocks without delays"
    model Not "Not Logic"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.SISO;
      annotation(Documentation(info="<HTML>
<P>
Not with 1 input value, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 14, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary(start=L.'0');
    equation 
      auxiliary=D.Tables.NotTable[x];
      y=pre(auxiliary);
    end Not;

    model And "And logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
And with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="&", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial")}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.AndTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(auxiliary[n]);
    end And;

    model Nand "Nand logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
Nand with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="&", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.AndTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(D.Tables.NotTable[auxiliary[n]]);
    end Nand;

    model Or "Or logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
Or with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by  Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString=">=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial")}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.OrTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(auxiliary[n]);
    end Or;

    model Nor "Nor logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
Nor with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString=">=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.OrTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(D.Tables.NotTable[auxiliary[n]]);
    end Nor;

    model Xor "Xor logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
Xor with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial")}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.XorTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(auxiliary[n]);
    end Xor;

    model Xnor "Xnor logic with multiple input and one output"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      extends D.Interfaces.MISO;
      annotation(Documentation(info="<HTML>
<P>
XNor with n input values, without delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial")}), Diagram);
    protected 
      D.Interfaces.Logic auxiliary[n](each start=L.'U');
    equation 
      auxiliary[1]=x[1];
      for i in 1:n - 1 loop
        auxiliary[i + 1]=D.Tables.XorTable[auxiliary[i],x[i + 1]];
      end for;
      y=pre(D.Tables.NotTable[auxiliary[n]]);
    end Xnor;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Basic;

  package Gates "Logic gates including delays"
    model InvGate "InvGate with 1 input value, composed by Not and sensitive intertial delay"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.SISO;
      Modelica.Electrical.Digital.Basic.Not G1 annotation(Placement(visible=true, transformation(origin={-40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
InvGate with 1 input value, composed by Not and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 14, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{152.0,-160.0},{-148.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-18.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}));
    equation 
      connect(G2.y,y) annotation(Line(visible=true, origin={80.0,0.0}, points={{-20.0,0.0},{20.0,0.0}}, color={127,0,127}));
      connect(G1.x,x) annotation(Line(visible=true, points={{-52.0,0.0},{-60.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{-20.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end InvGate;

    model AndGate "AndGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Interfaces.MISO;
      extends D.Delay.DelayParams;
      Modelica.Electrical.Digital.Basic.And G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
AndGate with n input values, composed by And and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="&", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      connect(y,G2.y) annotation(Line(visible=true, points={{100.0,0.0},{60.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, origin={-46.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end AndGate;

    model NandGate "NandGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.MISO;
      annotation(extent=[0,-20;40,20], Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-40.0,40.0},{40.0,80.0}}, textString="&", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}), Documentation(revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>", info="<HTML>
<P>
NandGate with n input values, composed by Nand and sensitive intertial delay.
</P>
</HTML>"));
      annotation(Documentation(info="<HTML>
<P>
NandGate with n input values, composed by Nand and sensitive intertial delay.
</P>
<p><b>Release Notes:</b></p>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       realized.</li>
</ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(lineColor={0,0,255}, extent={{-40,80},{40,40}}, fillColor={0,0,0}, lineThickness=0.5, textString="&"),Text(lineColor={0,0,255}, extent={{-20,-40},{20,-80}}, fillColor={0,0,0}, lineThickness=0.5, textString="Gate"),Ellipse(extent={{60,-10},{40,10}}, lineColor={0,0,0}, lineThickness=0.5)}), Diagram, DymolaStoredErrors);
      Modelica.Electrical.Digital.Basic.Nand G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
    equation 
      connect(G2.y,y) annotation(Line(visible=true, points={{60.0,0.0},{100.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, origin={-46.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end NandGate;

    model OrGate "OrGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.MISO;
      Modelica.Electrical.Digital.Basic.Or G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
OrGate with n input values, composed by Or and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString=">=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      connect(y,G2.y) annotation(Line(visible=true, points={{100.0,0.0},{60.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, origin={-46.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end OrGate;

    model NorGate "NorGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.MISO;
      Modelica.Electrical.Digital.Basic.Nor G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
NorGate with n input values, composed by Nor and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString=">=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial"),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{50.0,6.0},{62.0,-6.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      connect(y,G2.y) annotation(Line(visible=true, points={{100.0,0.0},{60.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, origin={-46.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end NorGate;

    model XorGate "XorGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.MISO;
      Modelica.Electrical.Digital.Basic.Xor G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
XorGate with n input values, composed by Xor and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="=1", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      connect(G2.y,y) annotation(Line(visible=true, points={{60.0,0.0},{100.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, origin={-46.0,0.0}, points={{-14.0,0.0},{14.0,0.0}}, color={127,0,127}));
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
    end XorGate;

    model XnorGate "XnorGate with multiple input"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.MISO;
      Modelica.Electrical.Digital.Basic.Xnor G1(n=n) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G2(tLH=tLH, tHL=tHL, y0=y0) annotation(Placement(visible=true, transformation(origin={40.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
XNorGate with n input values, composed by XNor and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004</i> vector approach used for all fixed numbers of inputs
       by Christoph Clauss<br>
       </li>
<li><i>October 22, 2003</i>
       by Liane Jacobi<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-40.0,40.0},{40.0,80.0}}, textString="=", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-20.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), DymolaStoredErrors);
    equation 
      connect(G1.y,G2.x) annotation(Line(visible=true, points={{0.0,0.0},{28.0,0.0}}, color={127,0,127}));
      connect(G2.y,y) annotation(Line(visible=true, points={{60.0,0.0},{100.0,0.0}}, color={127,0,127}));
      connect(x,G1.x) annotation(Line(visible=true, points={{-60.0,0.0},{-32.0,0.0}}, color={127,0,127}));
    end XnorGate;

    model BufGate "BufGate with 1 input value, composed by Not and sensitive intertial delay"
      import D = Modelica.Electrical.Digital;
      extends D.Delay.DelayParams;
      extends D.Interfaces.SISO;
      Modelica.Electrical.Digital.Delay.InertialDelaySensitive G1(tLH=tLH, tHL=tHL) annotation(Placement(visible=true, transformation(origin={-10.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
BufGate with 1 input value, composed by Not and sensitive intertial delay.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>September 21, 2004</i>
       by Andre Schneider<br>
       initially modelled.</li>
</ul>
</HTML>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, extent={{152.0,-160.0},{-148.0,-100.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={213,170,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-18.0,-100.0},{20.0,-60.0}}, textString="Gate", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="1", fontName="Arial")}));
    equation 
      connect(G1.x,x) annotation(Line(visible=true, points={{-22.0,0.0},{-60.0,0.0}}, color={127,0,127}));
      connect(G1.y,y) annotation(Line(visible=true, points={{10.0,0.0},{100.0,0.0}}, color={127,0,127}));
    end BufGate;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Gates;

  package Sources "Time-dependend digital signal sources"
    block Set "Digital Set Source"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter D.Interfaces.Logic x=L.'1' "Logic value to be set";
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
Sets a nine valued digital signal, which is specified by the <i>setval</i> parameter.
</P>
<P>
To specify <i>setval</i>, the integer code has to be used.
</P>
<p><b>Code Table</b></p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>

<P>
If the logic values are imported by <br><b> import L = Modelica.Electrical.Digital.Interfaces.LogicValue; </b> <br>
they can be used to specify the parameter, e.g. <b>L.'0'</b> for forcing 0.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 20, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={213,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{-50.0,40.0},{50.0,80.0}}, textString="SET", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{50.0,0.0},{90.0,0.0}}, color={127,0,127})}));
    algorithm 
      assert(x >= L.min and x <= L.max, "Parameter is no logic value");
      y:=x;
    end Set;

    block Step "Digital Step Source"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter D.Interfaces.Logic before=L.'0' "Logic value before step";
      parameter D.Interfaces.Logic after=L.'1' "Logic value after step";
      parameter Real stepTime=1 "step time";
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
The step source output signal steps from the value <i>before</i> to the value <i>after</i>
at the time <i>stepTime</i>.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>
<P>
If the logic values are imported by <br><b> import L = Modelica.Electrical.Digital.Interfaces.LogicValue; </b> <br>
they can be used to specify the parameter, e.g. <b>L.'0'</b> for forcing 0.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 20, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={213,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-30.0,40.0},{0.0,40.0},{0.0,80.0},{30.0,80.0}}),Line(visible=true, points={{50.0,0.0},{90.0,0.0}}, color={127,0,127})}), Diagram);
    algorithm 
      assert(before >= L.min and before <= L.max, "Parameter is no logic value");
      assert(after >= L.min and after <= L.max, "Parameter is no logic value");
      when initial() then
              y:=before;
      end when;
      if stepTime <= time then 
        y:=after;
      else
        y:=before;
      end if;
    end Step;

    block Table "Digital Tabular Source"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter D.Interfaces.Logic x[:]={1};
      parameter Real t[size(x, 1)]={1};
      parameter D.Interfaces.Logic y0=L.'U';
      final parameter Integer n=size(x, 1);
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
The table source output signal <i>y</i> steps to the values of the  <i>x</i> table at the corresponding
timepoints in the <i>t</i> table. <br>The initial value is specified by <i>y0</i>.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>
<P>
If the logic values are imported by <br><b> import L = Modelica.Electrical.Digital.Interfaces.LogicValue; </b> <br>
they can be used to specify the parameter, e.g. <b>L.'0'</b> for forcing 0.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>August 20, 2003</i>
       by Teresa Schlegel<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={213,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{50.0,0.0},{90.0,0.0}}, color={127,0,127}),Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-30.0,80.0},{32.0,70.0}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-30.0,70.0},{32.0,40.0}}),Line(visible=true, points={{0.0,80.0},{0.0,40.0}}),Line(visible=true, points={{-30.0,60.0},{32.0,60.0}}),Line(visible=true, points={{-30.0,50.0},{32.0,50.0}})}), Diagram);
    algorithm 
      if initial() then 
        assert(y0 >= L.min and y0 <= L.max, "Parameter y0 is not of type Logic");
        assert(n > 0, "Invalid size of table (n < 1)");
        for i in 1:n loop
          assert(x[i] >= L.min and x[i] <= L.max, "Table element is not of type Logic");
        end for;
      end if;
      y:=y0;
      for i in 1:n loop
        if time >= t[i] then 
          y:=x[i];
        end if;
      end for;
    end Table;

    model Pulse "Digital Pulse Source"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter Real width(final min=Modelica.Constants.small, final max=100)=50 "Widths of pulses in % of periods";
      parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
      parameter Modelica.SIunits.Time startTime=0 "Output = offset for time < startTime";
      parameter D.Interfaces.Logic pulse=L.'0';
      parameter D.Interfaces.Logic quiet=L.'1';
      Modelica.SIunits.Time T0(final start=startTime) "Start time of current period";
      parameter Integer nperiod=-1 "Number of periods (< 0 means infinite number of periods)";
      Integer np(start=0);
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
The pulse source forms pulses between the  <i>quiet</i> value and the <i>pulse</i> value.
The pulse length <i>width</i> is specified in percent of the period length <i>period</i>.
The number of periods is specified by <i>nperiod</i>. If <i>nperiod</i> is less than zero,
the number of periods is unlimited.
</P>
<P>
To specify the logic value parameters, the integer code has to be used.
</P>
<p><b>Code Table</b></p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td><b>Logic value</b></td>
      <td><b>Integer code</b></td>
      <td><b>Meaning</b></td>
  </tr>
                         
  <tr><td>'U'</td> <td>1</td> <td>Uninitialized</td></tr>
  <tr><td>'X'</td> <td>2</td> <td>Forcing Unknown</td></tr>
  <tr><td>'0'</td> <td>3</td> <td>Forcing 0</td></tr>
  <tr><td>'1'</td> <td>4</td> <td>Forcing 1</td></tr>
  <tr><td>'Z'</td> <td>5</td> <td>High Impedance</td></tr>
  <tr><td>'W'</td> <td>6</td> <td>Weak Unknown</td></tr>
  <tr><td>'L'</td> <td>7</td> <td>Weak 0</td></tr>
  <tr><td>'H'</td> <td>8</td> <td>Weak 1</td></tr>
  <tr><td>'-'</td> <td>9</td> <td>Don't care</td></tr>
</table>
<P>
If the logic values are imported by <br><b> import L = Modelica.Electrical.Digital.Interfaces.LogicValue; </b> <br>
they can be used to specify the parameter, e.g. <b>L.'0'</b> for forcing 0.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>September 2, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={213,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{50.0,0.0},{90.0,0.0}}, color={127,0,127}),Line(visible=true, points={{-36.0,40.0},{-30.0,40.0},{-30.0,40.0},{-18.0,40.0},{-18.0,40.0},{-14.0,40.0},{-14.0,80.0},{14.0,80.0},{14.0,40.0},{14.0,40.0},{14.0,40.0},{28.0,40.0},{30.0,40.0},{36.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial")}));
    algorithm 
      if nperiod == 0 then 
        y:=quiet;
      elseif nperiod >= np or nperiod < 0 then
        when sample(startTime, period) then
                  T0:=time;
          if nperiod > 0 then 
            np:=np + 1;
          end if;
        end when;
        y:=if time < startTime or time >= T0 + width*period/100 or not (nperiod >= np or nperiod < 0) then quiet else pulse;
      else
        y:=quiet;
      end if;
    end Pulse;

    model Clock "Digital Clock Source"
      import D = Modelica.Electrical.Digital;
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      parameter Modelica.SIunits.Time startTime=0 "Output = offset for time < startTime";
      parameter Modelica.SIunits.Time period(final min=Modelica.Constants.small)=1 "Time for one period";
      parameter Real width(final min=Modelica.Constants.small, final max=100)=50 "Width of pulses in % of period";
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y "Connector of Digital output signal" annotation(Placement(visible=true, transformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
The clock source forms pulses between the  <i>'0'</i> value (forcing 0) and the <i>'1'</i> value (forcing 1).
The pulse length <i>width</i> is specified in percent of the period length <i>period</i>.
The number of periods is unlimited. The first pulse starts at startTime.
</P>
<P> The clock source is a special but often used variant of the pulse source.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>   </i>
       by ...<br>
       </li>
<li><i>September 18, 2004</i>
       by Andre Schneider<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={213,255,170}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-50.0,100.0},{50.0,-100.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-160.0},{152.0,-100.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{50.0,0.0},{90.0,0.0}}, color={127,0,127}),Line(visible=true, points={{-36.0,40.0},{-30.0,40.0},{-30.0,80.0},{-18.0,80.0},{-18.0,40.0},{-6.0,40.0},{-6.0,80.0},{6.0,80.0},{6.0,40.0},{18.0,40.0},{18.0,80.0},{30.0,80.0},{30.0,40.0},{36.0,40.0}})}), DymolaStoredErrors);
    protected 
      Modelica.SIunits.Time t_i(final start=startTime) "Start time of current period";
      Modelica.SIunits.Time t_width=period*width/100;
    algorithm 
      when sample(startTime, period) then
              t_i:=time;
      end when;
      y:=if time < startTime or time >= t_i + t_width then L.'0' else L.'1';
    end Clock;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Sources;

  package Converters "Converters between 2-,3-,4- and 9-valued logic"
    block LogicToXO1 "Conversion to XO1"
      import D = Modelica.Electrical.Digital;
      import T = Modelica.Electrical.Digital.Tables;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      parameter Integer n(final min=1)=1 "signal width";
      annotation(Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a X01 digital output without
any delay according to IEEE 1164 To_X01 function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
                          input                  output
                          'U' (coded by 1)       'X'  (coded by 2)
                          'X' (coded by 2)       'X'  (coded by 2)
                          '0' (coded by 3)       '0'  (coded by 3)
                          '1' (coded by 4)       '1'  (coded by 4)
                          'Z' (coded by 5)       'X'  (coded by 2)
                          'W' (coded by 6)       'X'  (coded by 2)
                          'L' (coded by 7)       '0'  (coded by 3)
                          'H' (coded by 8)       '1'  (coded by 4)
                          '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01 into LogicToX01<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{-40.0,40.0},{40.0,40.0},{-40.0,-40.0}}),Polygon(visible=true, lineColor={127,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, points={{-40.0,-40.0},{40.0,-40.0},{40.0,40.0},{-40.0,-40.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{0.0,-40.0},{40.0,-20.0}}, textString="X01", fontName="Arial"),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram);
    algorithm 
      for i in 1:n loop
        y[i]:=T.X01Table[x[i]];
      end for;
    end LogicToXO1;

    block LogicToXO1Z "Conversion to XO1Z"
      import D = Modelica.Electrical.Digital;
      import T = Modelica.Electrical.Digital.Tables;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      parameter Integer n(final min=1)=1 "signal width";
      annotation(Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a X01Z digital output without
any delay according to IEEE 1164 To_X01Z function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
                          input                  output
                          'U' (coded by 1)       'X'  (coded by 2)
                          'X' (coded by 2)       'X'  (coded by 2)
                          '0' (coded by 3)       '0'  (coded by 3)
                          '1' (coded by 4)       '1'  (coded by 4)
                          'Z' (coded by 5)       'Z'  (coded by 5)
                          'W' (coded by 6)       'X'  (coded by 2)
                          'L' (coded by 7)       '0'  (coded by 3)
                          'H' (coded by 8)       '1'  (coded by 4)
                          '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_x01z into LogicToX01Z<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{-40.0,40.0},{40.0,40.0},{-40.0,-40.0}}),Polygon(visible=true, lineColor={127,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, points={{-40.0,-40.0},{40.0,-40.0},{40.0,40.0},{-40.0,-40.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{0.0,-40.0},{40.0,-20.0}}, textString="X01Z", fontName="Arial"),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram);
    algorithm 
      for i in 1:n loop
        y[i]:=T.X01ZTable[x[i]];
      end for;
    end LogicToXO1Z;

    block LogicToUX01 "Conversion to UXO1"
      import D = Modelica.Electrical.Digital;
      import T = Modelica.Electrical.Digital.Tables;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      parameter Integer n(final min=1)=1 "signal width";
      annotation(Documentation(info="<HTML>
<P>
Conversion of a nine valued digital input into a UX01 digital output without
any delay according to IEEE 1164 To_UX01 function.
</P>
<p><b>Conversion Table:</b></p>
<pre>
                          input                  output
                          'U' (coded by 1)       'U'  (coded by 1)
                          'X' (coded by 2)       'X'  (coded by 2)
                          '0' (coded by 3)       '0'  (coded by 3)
                          '1' (coded by 4)       '1'  (coded by 4)
                          'Z' (coded by 5)       'X'  (coded by 2)
                          'W' (coded by 6)       'X'  (coded by 2)
                          'L' (coded by 7)       '0'  (coded by 3)
                          'H' (coded by 8)       '1'  (coded by 4)
                          '-' (coded by 9)       'X'  (coded by 2)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss name converted from cvt_to_ux01 into LogicToUX01<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{-40.0,40.0},{40.0,40.0},{-40.0,-40.0}}),Polygon(visible=true, lineColor={127,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, points={{-40.0,-40.0},{40.0,-40.0},{40.0,40.0},{-40.0,-40.0}}),Text(visible=true, lineColor={0,0,255}, lineThickness=0.5, extent={{0.0,-40.0},{40.0,-20.0}}, textString="UX01", fontName="Arial"),Rectangle(visible=true, origin={0.0,0.0}, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram);
    algorithm 
      for i in 1:n loop
        y[i]:=T.UX01Table[x[i]];
      end for;
    end LogicToUX01;

    block BooleanToLogic "Boolean to Logic converter"
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      Modelica.Blocks.Interfaces.BooleanInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
Conversion of a Boolean input into a digital output without any delay according to:
</P>
<pre>
                          input      output
                          true       '1'  (coded by 4)
                          false      '0'  (coded by 3)
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 4, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), extent=[-60,-10;-40,10], DymolaStoredErrors, Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{40.0,40.0},{40.0,-40.0},{-40.0,-40.0}}),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-40.0,40.0},{40.0,40.0},{-40.0,-40.0},{-40.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(extent=[40,-10;60,10]);
      annotation(Diagram);
      parameter Integer n(final min=1)=1 "signal width";
    algorithm 
      for i in 1:n loop
        y[i]:=if x[i] then L.'1' else L.'0';
      end for;
    end BooleanToLogic;

    block LogicToBoolean "Logic to Boolean converter"
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Interfaces.BooleanOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
Conversion of a digital input into a Boolean output without any delay according to:
</P>
<pre>
                          input                 output
                          'U'  (coded by 1)     false
                          'X'  (coded by 2)     false
                          '0'  (coded by 3)     false
                          '1'  (coded by 4)     true
                          'Z'  (coded by 5)     false
                          'W'  (coded by 6)     false
                          'L'  (coded by 7)     false
                          'H'  (coded by 8)     true
                          '-'  (coded by 9)     false
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 4, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,40.0},{40.0,40.0},{-40.0,-40.0},{-40.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{40.0,-40.0},{40.0,40.0},{-40.0,-40.0}}),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter Integer n(final min=1)=1 "signal width";
    algorithm 
      for i in 1:n loop
        y[i]:=if x[i] == 4 or x[i] == 8 then true else false;
      end for;
    end LogicToBoolean;

    block RealToLogic "Real to Logic converter"
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      Modelica.Blocks.Interfaces.RealInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
Conversion of a real input into a digital output without any delay according to:
</P>
<pre>
                                 condition            output
      first check:               input greater upp    lupp
      second check:              input larger low     llow
                                 else                 lmid
</pre>
<P>
If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), extent=[-60,-10;-40,10], DymolaStoredErrors, Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{40.0,40.0},{40.0,-40.0},{-40.0,-40.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-40.0,40.0},{40.0,40.0},{-40.0,-40.0},{-40.0,40.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-152.0,-100.0},{148.0,-40.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Electrical.Digital.Interfaces.DigitalOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(extent=[40,-10;60,10]);
      annotation(Diagram);
      parameter Integer n(final min=1)=1 "signal width";
      parameter Real upper_limit=1 "upper limit";
      parameter Real lower_limit=0 "lower limit";
      parameter Digital.Interfaces.Logic upper_value=L.'1' "output if input > upper_limit";
      parameter Digital.Interfaces.Logic lower_value=L.'0' "output if input < lower_limit";
      parameter Digital.Interfaces.Logic middle_value=L.'X' "output else";
    algorithm 
      for i in 1:n loop
        y[i]:=if x[i] > upper_limit then upper_value else if x[i] < lower_limit then lower_value else middle_value;
      end for;
    end RealToLogic;

    block LogicToReal "Logic to Real converter"
      import L = Modelica.Electrical.Digital.Interfaces.LogicValue;
      Modelica.Electrical.Digital.Interfaces.DigitalInput x[n] annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y[n] annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={50.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      annotation(Documentation(info="<HTML>
<P>
Conversion of a digital input into a Real output without any delay according to:
</P>
<pre>
                          input                 output
                          'U'  (coded by 1)     val_U
                          'X'  (coded by 2)     val_X
                          '0'  (coded by 3)     val_0
                          '1'  (coded by 4)     val_1
                          'Z'  (coded by 5)     val_Z
                          'W'  (coded by 6)     val_W
                          'L'  (coded by 7)     val_L
                          'H'  (coded by 8)     val_H
                          '-'  (coded by 9)     val_m
</pre>
<P>
The values val... are given by parameters.</P>
<P>If the signal width is greater than 1 this conversion is done for each signal.
</P>
</HTML>
", revisions="<HTML>
<ul>
<li><i>September 15, 2004   </i>
       by Christoph Clauss colors changed<br>
       </li>
<li><i>November 5, 2003</i>
       by Christoph Clauss<br>
       initially modelled.</li>
</ul>
</HTML>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={127,0,127}, fillColor={127,0,127}, fillPattern=FillPattern.Solid, points={{-40.0,40.0},{40.0,40.0},{-40.0,-40.0},{-40.0,40.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-40.0,-40.0},{40.0,-40.0},{40.0,40.0},{-40.0,-40.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-148.0,-100.0},{152.0,-40.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineThickness=0.5, extent={{-40.0,40.0},{40.0,-40.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      parameter Integer n(final min=1)=1 "signal width";
      parameter Real value_U=0.5 "value for digital U (uninitialized)";
      parameter Real value_X=0.5 "value for digital X (Forcing Unknown)";
      parameter Real value_0=0 "value for digital 0   (Forcing 0)";
      parameter Real value_1=1 "value for digital 1 (Forcing 1)";
      parameter Real value_Z=0.5 "value for digital Z (High Impedance)";
      parameter Real value_W=0.5 "value for digital W (Weak    Unknown)";
      parameter Real value_L=0 "value for digital L (Weak    0)";
      parameter Real value_H=1 "value for digital H (Weak    1)";
      parameter Real value_m=0.5 "value for digital m (Don´t care)";
    algorithm 
      for i in 1:n loop
        y[i]:=if x[i] == L.'U' then value_U else if x[i] == L.'X' then value_X else if x[i] == L.'0' then value_0 else if x[i] == L.'1' then value_1 else if x[i] == L.'Z' then value_Z else if x[i] == L.'W' then value_W else if x[i] == L.'L' then value_L else if x[i] == L.'H' then value_H else value_m;
      end for;
    end LogicToReal;

    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{80.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100.0,50.0},{-80.0,70.0},{100.0,70.0},{80.0,50.0},{-100.0,50.0}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100.0,70.0},{100.0,-80.0},{80.0,-100.0},{80.0,50.0},{100.0,70.0}}),Text(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85.0,-85.0},{65.0,35.0}}, textString="Library", fontName="Arial"),Text(visible=true, lineColor={0,0,255}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, extent={{-120.0,73.0},{120.0,122.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Converters;

end Digital;
