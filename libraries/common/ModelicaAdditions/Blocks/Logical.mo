package Logical
   extends Modelica.Icons.Library;
   annotation (Documentation(info="<html>
 <p>
 This package contains components to operate on <b>Boolean signals</b>.
 </p>
 
 <p>
 This package is not part of the Modelica standard library, because it is
 planned to vectorize all components and to support alternatively
 the American symbols for the logical operators.
 </p>
 
 <dl>
 <dt><b>Main Author:</b>
 <dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
     Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
     Institut f&uuml;r Robotik und Mechatronik<br>
     Postfach 1116<br>
     D-82230 Wessling<br>
     Germany<br>
     email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
 </dl>
 <br>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>October 21, 2002</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
        and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
        New components TriggeredTrapezoid, Hysteresis, OnOffController, Compare and ZeroCrossing added.
        New interfaces BooleanMIRealMOs and RealMIBooleanMOs added.</li>
 <li><i>June 14, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized based on an existing Dymola library of
        Dieter Moormann and Hilding Elmqvist.</li>
 </ul>
 <br>
 
 
 <p><b>Copyright &copy; 2000-2002, DLR.</b></p>
 
 <p><i>
 The ModelicaAdditions.Blocks.Logical package is <b>free</b> software;
 it can be redistributed and/or modified
 under the terms of the <b>Modelica license</b>, see the license conditions
 and the accompanying <b>disclaimer</b> in the documentation of package
 Modelica in file \"Modelica/package.mo\".
 </i></p>
 </HTML>
 "));
   package Interfaces
      extends Modelica.Icons.Library;
      partial block BooleanSI2SO "2 Single Input / 1 Single Output Boolean control block"
         extends Modelica.Blocks.Interfaces.BooleanBlockIcon;
         Modelica.Blocks.Interfaces.BooleanInPort inPort1(final n=1) "Connector of Boolean input signal 1" annotation (Placement(transformation(x=-120.,y=60.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=60.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.BooleanInPort inPort2(final n=1) "Connector of Boolean input signal 2" annotation (Placement(transformation(x=-120.,y=-60.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=-60.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=1) "Connector of Boolean output signal" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-70.,-70.},{70.,70.}},lineColor={255,0,255},pattern=LinePattern.Solid,fillColor={235,235,235},fillPattern=FillPattern.Solid)}));
         
      protected
         Boolean u1=inPort1.signal[1] "Input signal 1";
         Boolean u2=inPort2.signal[1] "Input signal 2";
         Boolean y=outPort.signal[1] "Output signal";
      end BooleanSI2SO;
      partial block Comparison "Base class for compare operations"
         extends Modelica.Blocks.Interfaces.BooleanBlockIcon;
         parameter Real threshold=0 "Comparison with respect to threshold";
         Modelica.Blocks.Interfaces.InPort inPort(final n=1) "Connector of Real input signal" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=1) "Connector of Boolean output signal" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         
      protected
         Real u=inPort.signal[1] "Input signal";
         Boolean y=outPort.signal[1] "Output signal";
      end Comparison;
      partial block Comparision "For compatibility reasons only (as identifier is wrong)"
         extends Modelica.Blocks.Interfaces.BooleanBlockIcon;
         parameter Real threshold=0 "Comparison with respect to threshold";
         Modelica.Blocks.Interfaces.InPort inPort(final n=1) "Connector of Real input signal" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=1) "Connector of Boolean output signal" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         
      protected
         Real u=inPort.signal[1] "Input signal";
         Boolean y=outPort.signal[1] "Output signal";
      end Comparision;
      partial block BooleanMIRealMOs "Multiple Boolean Input Multiple Real Output continuous control block with same number of inputs and outputs"
         extends Modelica.Blocks.Interfaces.BlockIcon;
         parameter Integer n=1 "Number of inputs (= number of outputs)";
         Modelica.Blocks.Interfaces.BooleanInPort inPort(final n=n) "Connector of Boolean input signals" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort(final n=n) "Connector of Real output signals" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         output Real y[n] "Output signals";
         annotation (Documentation(info="<HTML>
 <p>
 Block has a Boolean input and a continuous output signal vector
 where the signal sizes of the input and output vector are identical.
 </p>
 </HTML>
 "));
         
      protected
         Boolean u[n]=inPort.signal "Boolean input signals";
         
      equation
         y = outPort.signal;
      end BooleanMIRealMOs;
      partial block RealMIBooleanMOs "Multiple Real Input Multiple Boolean Output continuous control block with same number of inputs and outputs"
         extends Modelica.Blocks.Interfaces.BooleanBlockIcon;
         parameter Integer n=1 "Number of inputs (= number of outputs)";
         Modelica.Blocks.Interfaces.InPort inPort(final n=n) "Connector of Real input signals" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=n) "Connector of Boolean output signals" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         output Boolean y[n] "Boolean output signals";
         annotation (Documentation(info="<HTML>
 <p>
 Block has a continuous input and a Boolean output signal vector
 where the signal sizes of the input and output vector are identical.
 </p>
 </HTML>
 "));
         
      protected
         Real u[n]=inPort.signal "Input signals";
         
      equation
         y = outPort.signal;
      end RealMIBooleanMOs;
   end Interfaces;
   block NOT "Logical NOT Block"
      extends Modelica.Blocks.Interfaces.BooleanSISO;
      annotation (Documentation(info="
 Logical NOT Block
 
 The output y is true, if the input u is false.
 The output y is false, if the input u is true.
 
 +---------------------------+
 |   input         output    |
 |            ->             |
 |     u             y       |
 +---------------------------+
 |    true          false    |
 |    false         true     |
 +----------------------------
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-70.,-70.},{70.,70.}},lineColor={255,0,255},pattern=LinePattern.Solid,fillColor={235,235,235},fillPattern=FillPattern.Solid),Text(extent={{-100.,32.},{100.,-28.}},textString="1",fillColor={0,0,0}),Ellipse(extent={{-90.,20.},{-50.,-20.}},lineColor={0,0,0},fillColor={255,0,0},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Line(points={{-100.,0.},{-90.,0.}},color={255,0,255}),Line(points={{70.,0.},{100.,0.}},color={255,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={255,0,255},fillColor={235,235,235},fillPattern=FillPattern.Solid),Text(extent={{-100.,20.},{100.,-20.}},textString="1",fillColor={0,0,0}),Ellipse(extent={{-80.,20.},{-40.,-20.}},lineColor={0,0,0},lineThickness=0.5,fillColor={255,0,0},pattern=LinePattern.None,fillPattern=FillPattern.VerticalCylinder),Line(points={{-100.,0.},{-80.,0.}},color={255,0,255}),Line(points={{60.,0.},{100.,0.}},color={255,0,255})}));
      
   equation
      y = not u;
   end NOT;
   block OR "Logical OR Block"
      extends Interfaces.BooleanSI2SO;
      annotation (Documentation(info="
 Logical OR Block
 
 The output y is false, if the first input u1 and the
 second input u2 are both false.
 In all other cases the output y is true.
 
 +---------------------------------+
 |     input             output    |
 |                  ->             |
 |   u1     u2            y        |
 +---------------------------------+
 |   true   true          true     |
 |   true   false         true     |
 |   false  true          true     |
 |   false  false         false    |
 +---------------------------------+
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-100.,70.},{100.,10.}},textString="1",fillColor={0,0,0}),Line(points={{70.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-70.,60.}},color={255,0,255}),Line(points={{-70.,-60.},{-100.,-60.}},color={255,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={255,0,255},fillColor={235,235,235},fillPattern=FillPattern.Solid),Text(extent={{-100.,60.},{100.,20.}},textString="1",fillColor={0,0,0}),Line(points={{60.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-60.,60.}},color={255,0,255}),Line(points={{-100.,-60.},{-60.,-60.}},color={255,0,255})}));
      
   equation
      y = u1 or u2;
   end OR;
   block AND "Logical AND Block"
      extends Interfaces.BooleanSI2SO;
      annotation (Documentation(info="
 Logical AND Block
 
 The output y is true, if the first input u1 and
 the second input u2 are both true.
 In all other cases the output y is false.
 
 +---------------------------------+
 |     input             output    |
 |                  ->             |
 |   u1     u2            y        |
 +---------------------------------+
 |   true   true          true     |
 |   true   false         false    |
 |   false  true          false    |
 |   false  false         false    |
 +---------------------------------+
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-100.,70.},{100.,10.}},textString="&",fillColor={0,0,0}),Line(points={{70.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-70.,60.}},color={255,0,255}),Line(points={{-100.,-60.},{-70.,-60.}},color={255,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={255,0,255},fillColor={235,235,235},fillPattern=FillPattern.Solid),Text(extent={{-100.,60.},{100.,20.}},textString="&",fillColor={0,0,0}),Line(points={{60.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-60.,60.}},color={255,0,255}),Line(points={{-100.,-58.},{-60.,-58.}},color={255,0,255})}));
      
   equation
      y = u1 and u2;
   end AND;
   block XOR "Logical Exclusive OR Block"
      extends Interfaces.BooleanSI2SO;
      annotation (Documentation(info="
 Logical Exclusive OR Block
 
 The output y is false, if the first input u1 and
 the second input u2 are both false or both true.
 In all other cases the output y is true.
 
 +---------------------------------+
 |     input             output    |
 |                  ->             |
 |   u1     u2            y        |
 +---------------------------------+
 |   true   true          false    |
 |   true   false         true     |
 |   false  true          true     |
 |   false  false         false    |
 +---------------------------------+
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-100.,70.},{100.,10.}},textString="=1",fillColor={0,0,0}),Line(points={{70.,0.},{100.,0.}},color={255,0,127}),Line(points={{-100.,60.},{-70.,60.}},color={255,0,127}),Line(points={{-100.,-60.},{-70.,-60.}},color={255,0,127})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={255,0,255},fillColor={235,235,235},fillPattern=FillPattern.Solid),Text(extent={{-100.,60.},{100.,20.}},textString="=1",fillColor={0,0,0}),Line(points={{60.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-60.,60.}},color={255,0,255}),Line(points={{-100.,-60.},{-60.,-60.}},color={255,0,255})}));
      
   equation
      y = if u1 and u2 or not u1 and not u2 then
         false
      else
         true;
   end XOR;
   block NOR "Logical NOR Block"
      extends Interfaces.BooleanSI2SO;
      NOT logicalNOT annotation (Placement(transformation(x=56.,y=0.,scale=0.3,aspectRatio=1.),iconTransformation(x=56.,y=0.,scale=0.3,aspectRatio=1.)));
      OR logicalOR annotation (Placement(transformation(x=-30.,y=0.,scale=0.3,aspectRatio=1.),iconTransformation(x=-30.,y=0.,scale=0.3,aspectRatio=1.)));
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="
 Logical NOR Block
 
 The output y is true, if the first input u1 and
 the second input u2 are both false.
 In all other cases the output y is true.
 
 +---------------------------------+
 |     input             output    |
 |                  ->             |
 |   u1     u2            y        |
 +---------------------------------+
 |   true   true          false    |
 |   true   false         false    |
 |   false  true          false    |
 |   false  false         true     |
 +---------------------------------+
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-100.,70.},{100.,10.}},textString="1",fillColor={0,0,0}),Ellipse(extent={{50.,20.},{90.,-20.}},lineColor={0,0,0},fillColor={255,0,0},pattern=LinePattern.None,fillPattern=FillPattern.Sphere),Line(points={{90.,0.},{100.,0.}},color={255,0,255}),Line(points={{-100.,60.},{-70.,60.}},color={255,0,255}),Line(points={{-100.,-60.},{-70.,-60.}},color={255,0,255})}));
      
   equation
      connect(logicalOR.outPort, logicalNOT.inPort) annotation (Line(points={{3.,0.},{20.,0.}},color={255,0,255},thickness=0.5));
      connect(logicalNOT.outPort, outPort) annotation (Line(points={{89.,0.},{110.,0.}},color={255,0,255},thickness=0.5));
      connect(inPort1, logicalOR.inPort1) annotation (Line(points={{-120.,60.},{-80.,60.},{-80.,18.},{-66.,18.}},color={255,0,255},thickness=0.5));
      connect(inPort2, logicalOR.inPort2) annotation (Line(points={{-120.,-60.},{-80.,-60.},{-80.,-18.},{-66.,-18.}},color={255,0,255},thickness=0.5));
   end NOR;
   block NAND "Logical NAND Block"
      extends Interfaces.BooleanSI2SO;
      NOT logicalNOT annotation (Placement(transformation(x=50.,y=0.,scale=0.3,aspectRatio=1.),iconTransformation(x=50.,y=0.,scale=0.3,aspectRatio=1.)));
      AND logicalAND annotation (Placement(transformation(x=-30.,y=0.,scale=0.3,aspectRatio=1.),iconTransformation(x=-30.,y=0.,scale=0.3,aspectRatio=1.)));
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}})),Documentation(info="
 Logical NAND Block
 
 The output y is false, if the first input u1 and
 the second input u2 are both true.
 In all other cases the output y is true.
 
 +---------------------------------+
 |     input             output    |
 |                  ->             |
 |   u1     u2            y        |
 +---------------------------------+
 |   true   true          false    |
 |   true   false         true     |
 |   false  true          true     |
 |   false  false         true     |
 +---------------------------------+
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-100.,70.},{100.,10.}},textString="&",fillColor={0,0,0}),Ellipse(extent={{50.,20.},{90.,-20.}},lineColor={0,0,0},fillColor={255,0,0},pattern=LinePattern.None,fillPattern=FillPattern.Sphere),Line(points={{90.,0.},{100.,0.}},color={255,0,127}),Line(points={{-100.,60.},{-70.,60.}},color={255,0,127}),Line(points={{-100.,-60.},{-70.,-60.}},color={255,0,127})}));
      
   equation
      connect(logicalNOT.outPort, outPort) annotation (Line(points={{83.,0.},{110.,0.}},color={255,0,255},thickness=0.5));
      connect(inPort1, logicalAND.inPort1) annotation (Line(points={{-120.,60.},{-80.,60.},{-80.,18.},{-66.,18.}},color={255,0,255},thickness=0.5));
      connect(inPort2, logicalAND.inPort2) annotation (Line(points={{-120.,-60.},{-80.,-60.},{-80.,-18.},{-66.,-18.}},color={255,0,255},thickness=0.5));
      connect(logicalAND.outPort, logicalNOT.inPort) annotation (Line(points={{3.,0.},{14.,0.}},color={255,0,255},thickness=0.5));
   end NAND;
   block LogicalSwitch "Logical Switch"
      extends Modelica.Blocks.Interfaces.BooleanBlockIcon;
      Modelica.Blocks.Interfaces.BooleanInPort inPort1(final n=1,signal(final start={true})) "Connector of Boolean input signal 1" annotation (Placement(transformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.BooleanInPort inPort2(final n=1,signal(final start={true})) "Connector of Boolean input signal 2" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.BooleanInPort inPort3(final n=1,signal(final start={true})) "Connector of Boolean input signal 3" annotation (Placement(transformation(x=-120.,y=-70.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=-70.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.BooleanOutPort outPort(final n=1,signal(final start={true})) "Connector of Boolean output signal" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
      annotation (Documentation(info="<html>
 <p>The LogicalSwitch switches, depending on the
 Boolean inPort2 connector (the middle connector),
 between the two possible input signals
 inPort1 (upper connector) and inPort3 (lower connector).</p>
 
 <p>If inPort2 is true, outPort is set equal to
 inPort1, else it is set equal to inPort2.</p>
 </html>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{12.,0.},{100.,0.}},color={255,0,255},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-100.,0.},{-40.,0.}},color={255,0,255},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-100.,-70.},{-40.,-70.},{-40.,-70.}},color={255,0,255},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-40.,12.},{-40.,-10.}},color={255,0,255}),Line(points={{-100.,70.},{-40.,70.}},color={255,0,255}),Line(points={{-40.,70.},{6.,2.}},color={255,0,127},thickness=1.),Ellipse(extent={{2.,8.},{18.,-6.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-58.,60.},{60.,-60.}},lineColor={255,0,127},fillColor={235,235,235},fillPattern=FillPattern.Solid),Line(points={{-100.,0.},{-60.,0.}},color={0,0,255}),Line(points={{62.,0.},{100.,0.}},color={0,0,255}),Line(points={{36.,0.},{100.,0.}},color={255,0,127},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-100.,0.},{-40.,0.}},color={255,0,127},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-40.,12.},{-40.,-10.}},color={255,0,127}),Line(points={{-22.,40.},{6.,-2.}},color={255,0,255},thickness=1.),Ellipse(extent={{-2.,6.},{14.,-8.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{-98.,70.},{-74.,70.},{-74.,42.},{-24.,42.}},color={255,0,127}),Line(points={{-98.,-70.},{-72.,-70.},{-72.,-38.},{-18.,-38.}},color={255,0,127})}));
      
   protected
      Boolean u1(start=true)=inPort1.signal[1] "Input signal 1";
      Boolean u2(start=true)=inPort2.signal[1] "Input signal 2";
      Boolean u3(start=true)=inPort3.signal[1] "Input signal 3";
      Boolean y(start=true)=outPort.signal[1] "Output signal";
      
   equation
      y = if u2 then
         u1
      else
         u3;
   end LogicalSwitch;
   block Switch "Switch between two Real signal vectors"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Integer n=1 "size of input and output Real signal vectors";
      Modelica.Blocks.Interfaces.InPort inPort1(final n=n) "Connector of Real input signal 1" annotation (Placement(transformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=70.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.BooleanInPort inPort2(final n=1,signal(final start={true})) "Connector of Boolean input signal 2" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.InPort inPort3(final n=n) "Connector of Real input signal 3" annotation (Placement(transformation(x=-120.,y=-70.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=-70.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.OutPort outPort(final n=n) "Connector of Real output signal" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
      annotation (Documentation(info="<html>
 <p>The Logical.Switch switches, depending on the
 logical connector inPort2 (the middle connector)
 between the two possible input signals
 inPort1 (upper connector) and inPort3 (lower connector).</p>
 
 <p>If inPort2 is true, the outPort is set equal to
 inPort1, else it is set equal to inPort3.</p>
 </html>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{12.,0.},{100.,0.}},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None},color={0,0,255}),Line(points={{-100.,0.},{-40.,0.}},color={255,0,127},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None}),Line(points={{-100.,-70.},{-40.,-70.},{-40.,-70.}},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None},color={0,0,255}),Line(points={{-40.,12.},{-40.,-10.}},color={255,0,127}),Line(points={{-98.,70.},{-38.,70.}},color={0,0,255}),Line(points={{-38.,70.},{6.,2.}},thickness=1.,color={0,0,255}),Ellipse(extent={{2.,8.},{18.,-6.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-58.,60.},{60.,-60.}},fillColor={235,235,235},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{-100.,0.},{-40.,0.}},color={255,0,127}),Line(points={{62.,0.},{100.,0.}},color={0,0,255}),Line(points={{36.,0.},{100.,0.}},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None},color={0,0,255}),Line(points={{-40.,12.},{-40.,-10.}},color={255,0,127}),Line(points={{-22.,40.},{6.,-2.}},thickness=1.,color={0,0,255}),Ellipse(extent={{-2.,6.},{14.,-8.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{-102.,80.},{-74.,80.},{-74.,40.},{-22.,40.}},color={0,0,255}),Line(points={{-102.,-80.},{-72.,-80.},{-72.,-38.},{-18.,-38.}},color={0,0,255})}));
      
   protected
      Real u1[n]=inPort1.signal "Input signal 1";
      Boolean u2(start=true)=inPort2.signal[1] "Input signal 2";
      Real u3[n]=inPort3.signal "Input signal 3";
      Real y[n]=outPort.signal "Output signal";
      
   equation
      y = if u2 then
         u1
      else
         u3;
   end Switch;
   block TriggeredTrapezoid "Triggered trapezoid generator"
      parameter Real amplitude[:]={1} "Amplitudes of trapezoids";
      parameter SI.Time rising[n](final min=0)=zeros(n) "Rising durations of trapezoids";
      parameter SI.Time falling[n](final min=0)=rising "Falling durations of trapezoids";
      parameter Real offset[n]=zeros(n) "Offsets of output signals";
      extends Interfaces.BooleanMIRealMOs(final n=size(amplitude,1));
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-60.,-70.},{-60.,-70.},{-30.,40.},{8.,40.},{40.,-70.},{40.,-70.}},color={0,0,255}),Line(points={{-90.,-70.},{82.,-70.}},color={192,192,192}),Line(points={{-80.,68.},{-80.,-80.}},color={192,192,192}),Polygon(points={{90.,-70.},{68.,-62.},{68.,-78.},{90.,-70.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Polygon(points={{-80.,90.},{-88.,68.},{-72.,68.},{-80.,90.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-80.,-70.},{-60.,-70.},{-60.,24.},{8.,24.},{8.,-70.},{60.,-70.}},color={255,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-80.,-20.},{-60.,-20.},{-30.,40.},{8.,40.},{40.,-20.},{60.,-20.}},color={0,0,255}),Line(points={{-90.,-70.},{82.,-70.}},color={0,0,0}),Line(points={{-80.,68.},{-80.,-80.}},color={0,0,0}),Polygon(points={{90.,-70.},{68.,-62.},{68.,-78.},{90.,-70.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-80.,90.},{-88.,68.},{-72.,68.},{-80.,90.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Line(points={{-80.,-68.},{-60.,-68.},{-60.,-42.},{8.,-42.},{8.,-68.},{60.,-68.}},color={255,0,255}),Line(points={{-60.,40.},{-60.,-42.}},color={0,0,0},pattern=LinePattern.Dot),Line(points={{8.,-42.},{8.,40.}},color={0,0,0},pattern=LinePattern.Dot),Line(points={{-60.,40.},{-30.,40.}},color={0,0,0}),Line(points={{8.,-20.},{40.,-20.}},color={0,0,0}),Line(points={{-20.,40.},{-20.,-20.}},color={0,0,0}),Line(points={{-20.,-20.},{-20.,-70.}},color={0,0,0}),Text(extent={{-44.,50.},{-44.,40.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,textString="rising"),Text(extent={{24.,-10.},{24.,-20.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,textString="falling"),Polygon(points={{-60.,40.},{-56.,42.},{-56.,38.},{-60.,40.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-30.,40.},{-34.,42.},{-34.,38.},{-30.,40.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{8.,-20.},{12.,-18.},{12.,-22.},{8.,-20.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{40.,-20.},{36.,-18.},{36.,-22.},{40.,-20.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-22.,-24.},{-20.,-20.},{-18.,-24.},{-22.,-24.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-18.,-66.},{-22.,-66.},{-20.,-70.},{-18.,-66.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-22.,36.},{-20.,40.},{-18.,36.},{-22.,36.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-18.,-16.},{-22.,-16.},{-20.,-20.},{-18.,-16.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,6.},{0.,-4.}},lineColor={255,255,255},fillColor={255,255,255},fillPattern=FillPattern.Solid),Text(extent={{-20.,6.},{-20.,-4.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,textString="amplitude"),Rectangle(extent={{-40.,-48.},{0.,-58.}},lineColor={255,255,255},fillColor={255,255,255},fillPattern=FillPattern.Solid),Text(extent={{-20.,-48.},{-20.,-58.}},fillColor={0,0,0},fillPattern=FillPattern.Solid,textString="offset")}),Documentation(info="<HTML>
 <p>The block TriggeredTrapezoid has a boolean input and a real
 output, both of size n, and requires the parameter vectors <i>amplitude</i>,
 <i>rising</i>, <i>falling</i> and <i>offset</i>, all of size n also. The
 output represents a trapezoidal signal dependent on the input.</p>
 
 <p>The behaviour is as follows: Assume the initial input to be false. In this
 case, the output will be <i>offset</i>. After a rising edge (i.e. the input
 changes from false to true), the output is rising during <i>rising</i> to the
 sum of <i>offset</i> and <i>amplitude</i>. In contrast, after a falling
 edge (i.e. the input changes from true to false), the output is falling
 during <i>falling</i> to a value of <i>offset</i>.</p>
 
 <p>Note, that the case of edges before expiration of rising or falling is
 handled properly.</p>
 </HTML>
 "));
      
   protected
      discrete Real endValue[n] "Value of y at time of recent edge";
      discrete Real rate[n] "Current rising/falling rate";
      discrete SI.Time T[n] "Predicted time of output reaching endValue";
      
   initial equation
      pre(y) = fill(0,n);
      
   equation
      for i in 1:n loop
         y[i] = if time < T[i] then
            endValue[i]-(T[i]-time)*rate[i]
         else
            endValue[i];
         when {initial(),u[i],not u[i]} then
            endValue[i] = if u[i] then
               offset[i]+amplitude[i]
            else
               offset[i];
            rate[i] = if u[i] and rising[i] > 0 then
               amplitude[i]/rising[i]
            else
               if not u[i] and falling[i] > 0 then
                  -amplitude[i]/falling[i]
               else
                  0;
            T[i] = if ((u[i] and not rising[i] > 0 or not u[i] and not falling[i] > 0) or not abs(amplitude[i]) > 0) or initial() then
               time
            else
               time+(endValue[i]-pre(y[i]))/rate[i];
         end when;
      end for;
   end TriggeredTrapezoid;
   block Boolean2Real "Convert Boolean to Real signals"
      extends Modelica.Blocks.Interfaces.BlockIcon;
      parameter Integer n=1 "size of input and output signal vectors";
      parameter Real realTrue=1. "Output signal for true Boolean input";
      parameter Real realFalse=0. "Output signal for false Boolean input";
      Modelica.Blocks.Interfaces.BooleanInPort inPort(final n=n) "Connector of Boolean input signals" annotation (Placement(transformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.),iconTransformation(x=-120.,y=0.,scale=0.2,aspectRatio=1.)));
      Modelica.Blocks.Interfaces.OutPort outPort(final n=n) "Connector of Real output signals" annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
      annotation (Documentation(info="<html>
 <p>The Boolean2Real block transforms Boolean to Real signals.</p>
 
 <p>If the Boolean input is true, the Real output is
 the value of parameter realTrue, otherwise it is realFalse.</p>
 </html>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-62.,-8.},{138.,-48.}},textString="Signal",fillColor={0,0,255}),Text(extent={{-130.,48.},{70.,8.}},textString="Logical",fillColor={255,0,0}),Text(extent={{-100.,20.},{100.,-20.}},textString="=>",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-60.,60.},{60.,-60.}},fillColor={235,235,235},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{-100.,0.},{-60.,0.}},color={0,0,255}),Line(points={{62.,0.},{100.,0.}},color={0,0,255}),Line(points={{60.,0.},{100.,0.}},pattern=LinePattern.Solid,thickness=0.25,arrow={Arrow.None,Arrow.None},color={0,0,255}),Text(extent={{-94.,30.},{26.,10.}},textString="Logical",fillColor={255,0,0}),Text(extent={{-60.,10.},{60.,-10.}},textString="=>",fillColor={0,0,255}),Text(extent={{-28.,-10.},{92.,-30.}},textString="Signal",fillColor={0,0,255})}));
      
   protected
      Boolean u[n](start=fill(true,n))=inPort.signal "Input signals";
      Real y[n]=outPort.signal "Output signals";
      
   equation
      for i in 1:n loop
         y[i] = if u[i] then
            realTrue
         else
            realFalse;
      end for;
   end Boolean2Real;
   block GreaterThan "Outputs true, if input is greater than threshold"
      extends Interfaces.Comparison;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-70.,-50.},{70.,50.}},textString="> %threshold",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-80.,-40.},{80.,40.}},textString="> %threshold",fillColor={0,0,0})}));
      
   equation
      y = u > threshold;
   end GreaterThan;
   block GreaterEqual "Outputs true, if input is greater than or equal to threshold"
      extends Interfaces.Comparison;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-70.,-50.},{70.,50.}},textString=">= %threshold",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-80.,-40.},{80.,40.}},textString=">= %threshold",fillColor={0,0,0},pattern=LinePattern.None)}));
      
   equation
      y = u >= threshold;
   end GreaterEqual;
   block LessThan "Outputs true, if input is less than threshold"
      extends Interfaces.Comparison;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-70.,-50.},{70.,50.}},textString="< %threshold",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-80.,-40.},{80.,40.}},textString="< %threshold",fillColor={0,0,0})}));
      
   equation
      y = u < threshold;
   end LessThan;
   block LessEqual "Outputs true, if input is less than or equal to threshold"
      extends Interfaces.Comparison;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-70.,-50.},{70.,50.}},textString="<= %threshold",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{-80.,-40.},{80.,40.}},textString="<= %threshold",fillColor={0,0,0})}));
      
   equation
      y = u <= threshold;
   end LessEqual;
   block Hysteresis "Transform Real to Boolean with Hysteresis"
      extends Interfaces.RealMIBooleanMOs(final n=size(uLow,1),y(each start=false,each fixed=true));
      parameter Real[:] uLow={0} "if y=true and u<=uLow, switch to y=false";
      parameter Real[n] uHigh={1} "if y=false and u>=uHigh, switch to y=true";
      annotation (Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-65.,89.},{-73.,67.},{-57.,67.},{-65.,89.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-65.,67.},{-65.,-81.}},color={192,192,192}),Line(points={{-90.,-70.},{82.,-70.}},color={192,192,192}),Polygon(points={{90.,-70.},{68.,-62.},{68.,-78.},{90.,-70.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Text(extent={{70.,-80.},{94.,-100.}},textString="time",fillColor={160,160,160}),Text(extent={{-59.,93.},{-6.,75.}},textString="outPort",fillColor={160,160,160}),Line(points={{-80.,-70.},{30.,-70.}},color={0,0,0},thickness=0.5),Line(points={{-50.,10.},{80.,10.}},color={0,0,0},thickness=0.5),Line(points={{-50.,10.},{-50.,-70.}},color={0,0,0},thickness=0.5),Line(points={{30.,10.},{30.,-70.}},color={0,0,0},thickness=0.5),Line(points={{-10.,-65.},{0.,-70.},{-10.,-75.}},color={0,0,0},thickness=0.5),Line(points={{-10.,15.},{-20.,10.},{-10.,5.}},color={0,0,0},thickness=0.5),Line(points={{-55.,-20.},{-50.,-30.},{-44.,-20.}},color={0,0,0},thickness=0.5),Line(points={{25.,-30.},{30.,-19.},{35.,-30.}},color={0,0,0},thickness=0.5),Text(extent={{-99.,2.},{-70.,18.}},textString="true",fillColor={160,160,160}),Text(extent={{-98.,-87.},{-66.,-73.}},textString="false",fillColor={160,160,160}),Text(extent={{19.,-87.},{44.,-70.}},textString="uHigh",fillColor={0,0,0}),Text(extent={{-63.,-88.},{-38.,-71.}},textString="uLow",fillColor={0,0,0}),Line(points={{-69.,10.},{-60.,10.}},color={160,160,160})}),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-80.,90.},{-88.,68.},{-72.,68.},{-80.,90.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-80.,68.},{-80.,-29.}},color={192,192,192}),Polygon(points={{92.,-29.},{70.,-21.},{70.,-37.},{92.,-29.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-79.,-29.},{84.,-29.}},color={192,192,192}),Line(points={{-79.,-29.},{41.,-29.}},color={0,0,0}),Line(points={{-15.,-21.},{1.,-29.},{-15.,-36.}},color={0,0,0}),Line(points={{41.,51.},{41.,-29.}},color={0,0,0}),Line(points={{33.,3.},{41.,22.},{50.,3.}},color={0,0,0}),Line(points={{-49.,51.},{81.,51.}},color={0,0,0}),Line(points={{-4.,59.},{-19.,51.},{-4.,43.}},color={0,0,0}),Line(points={{-59.,29.},{-49.,11.},{-39.,29.}},color={0,0,0}),Line(points={{-49.,51.},{-49.,-29.}},color={0,0,0}),Text(extent={{-92.,-49.},{-9.,-92.}},textString="%uLow",fillColor={192,192,192}),Text(extent={{2.,-49.},{91.,-92.}},textString="%uHigh",fillColor={192,192,192}),Rectangle(extent={{-91.,-49.},{-8.,-92.}},lineColor={192,192,192}),Line(points={{-49.,-29.},{-49.,-49.}},color={192,192,192}),Rectangle(extent={{2.,-49.},{91.,-92.}},lineColor={192,192,192}),Line(points={{41.,-29.},{41.,-49.}},color={192,192,192})}),Documentation(info="<HTML>
 <p>
 This block transforms a <b>Real</b> input signal into a <b>Boolean</b>
 output signal:
 </p>
 
 <ul>
 <li> When the output was <b>false</b> and the input becomes
      <b>greater</b> than parameter <b>uHigh</b>, the output
      switches to <b>true</b>.</li>
 <li> When the output was <b>true</b> and the input becomes
      <b>less</b> than parameter <b>uLow</b>, the output
      switches to <b>false</b>.</li>
 </ul>
 
 <p>
 The fixed start value of the output is <b>false</b>.
 If needed, it can be changed via a modification, e.g.,
 </p>
 
 <pre>
     Hysteresis hyst(y(start=<b>true</b>));
 </pre>
 
 </HTML>
 "));
      
   equation
      for i in 1:n loop
         y[i] = u[i] > uHigh[i] or pre(y[i]) and u[i] >= uLow[i];
      end for;
   end Hysteresis;
   block OnOffController "On-off controller"
      extends Modelica.Blocks.Interfaces.MI2BooleanMOs(final n=1);
      parameter Real bandwidth=0.1 "Bandwidth around reference signal";
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-100.},{100.,100.}},lineColor={255,0,255},fillColor={255,255,255},fillPattern=FillPattern.Solid),Text(extent={{-90.,80.},{-30.,60.}},textString="Reference",lineThickness=0.5,fillColor={0,0,255}),Text(extent={{-88.,-60.},{-28.,-80.}},textString="Input        ",fillColor={0,0,255}),Line(points={{-80.,0.},{-70.,20.},{-52.,42.},{-28.,60.},{-8.,66.},{16.,58.},{32.,50.},{48.,38.},{66.,20.},{78.,0.}},thickness=0.5,color={0,0,255}),Line(points={{-80.,30.},{-8.,50.},{80.,20.}},color={255,0,0},thickness=0.5),Line(points={{-80.,38.},{-8.,56.},{80.,26.}},color={255,0,0},pattern=LinePattern.Dash),Line(points={{-80.,24.},{-8.,42.},{80.,12.}},color={255,0,0},pattern=LinePattern.Dash),Line(points={{-80.,-20.},{-46.,-20.},{-46.,-60.},{68.,-60.},{68.,-20.},{80.,-20.}},color={255,0,255},thickness=0.5)}),Documentation(info="<html>
 <p>The block OnOffController sets the output signal to true when
 the input signal falls below the reference signal minus half of
 the bandwidth and sets the output signal to false when the input
 signal exceeds the reference signal plus half of the bandwidth.</p>
 
 <p>The reference signal is represented by inPort1 and the input
 signal by inPort2.</p>
 </html>
 "));
      
   protected
      Real u=inPort2.signal[1] "Input signal";
      Real uRef=inPort1.signal[1] "Reference input signal";
      Boolean y=outPort.signal[1] "Output signal";
      
   equation
      y = pre(y) and u < uRef+bandwidth/2 or u < uRef-bandwidth/2;
   end OnOffController;
   block Compare "True, if signal of inPort1 is larger than signal of inPort2"
      extends Modelica.Blocks.Interfaces.MI2BooleanMOs;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-40.,42.},{-40.,27.},{23.,1.},{-40.,-25.},{-40.,-40.},{39.,-5.},{39.,8.},{-40.,42.}},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Ellipse(extent={{-90.,10.},{-70.,-10.}},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Ellipse(extent={{70.,10.},{90.,-10.}},fillPattern=FillPattern.Solid,lineColor={0,0,255}),Line(points={{-100.,60.},{-80.,60.},{-80.,0.}},color={0,0,255}),Line(points={{-100.,-60.},{80.,-60.},{80.,0.}},color={0,0,255})}),Documentation(info="<html>
 <p>Compares <b>u1</b> element-wise to <b>u2</b> and sets output y[i]=outPort.signal[i] to
 true, if u1[i]=inPort1.signal[i] is greater than u2[i]=inPort2.signal[i]:</p>
 
 <pre>    y[i] = u1[i] &gt; u2[i] ;
 </pre>
 </html>
 "));
      
   equation
      for i in 1:n loop
         outPort.signal[i] = inPort1.signal[i] > inPort2.signal[i];
      end for;
   end Compare;
   block ZeroCrossing "Trigger zero crossing of input signal"
      extends Interfaces.RealMIBooleanMOs(outPort(signal(each fixed=true)));
      annotation (Documentation(info="<HTML>
 <p>
 The output signal (= outPort.signal[1]) is <b>true</b> at the
 time instant when the input signal (= inPort.signal[1]) becomes
 zero, provided the enable input (= enable.signal[1]) is
 <b>true</b>. At all other time instants, the output signal is <b>false</b>.
 If the input signal is zero at a time instant when the enable
 input changes its value, then the output is <b>false</b>.
 </p>
 
 <p>
 Note, that in the plot window of a Modelica simulator, the output of
 this block is usually identically to <b>false</b>, because the output
 may only be <b>true</b> at an event instant, but not during
 continuous integration. In order to check that this component is
 actually working as expected, one should connect its output to, e.g.,
 component <i>ModelicaAdditions.Blocks.Discrete.TriggeredSampler</i>.
 </p>
 
 </HTML>"),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-78.,68.},{-78.,-80.}},color={192,192,192}),Polygon(points={{-78.,90.},{-86.,68.},{-70.,68.},{-78.,90.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-88.,0.},{70.,0.}},color={192,192,192}),Line(points={{-78.,0.},{-73.2,32.3},{-70.,50.3},{-66.7,64.5},{-63.5,74.2},{-60.3,79.3},{-57.1,79.6},{-53.9,75.3},{-50.7,67.1},{-46.6,52.2},{-41.,25.8},{-33.,-13.9},{-28.2,-33.7},{-24.1,-45.9},{-20.1,-53.2},{-16.1,-55.3},{-12.1,-52.5},{-8.1,-45.3},{-3.23,-32.1},{10.44,13.7},{15.3,26.4},{20.1,34.8},{24.1,38.},{28.9,37.2},{33.8,31.8},{40.2,19.4},{53.1,-10.5},{59.5,-21.2},{65.1,-25.9},{70.7,-25.9},{77.2,-20.5},{82.,-13.8}},color={192,192,192}),Polygon(points={{92.,0.},{70.,8.},{70.,-8.},{92.,0.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-36.,-59.},{-36.,81.}},color={255,0,255}),Line(points={{6.,-59.},{6.,81.}},color={255,0,255}),Line(points={{49.,-59.},{49.,81.}},color={255,0,255}),Line(points={{-78.,0.},{70.,0.}},color={255,0,255})}));
      Modelica.Blocks.Interfaces.BooleanInPort enable(final n=1) "Zero input crossing is triggered if the enable input signal is true" annotation (Placement(transformation(x=0.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90),iconTransformation(x=0.,y=-120.,scale=0.2,aspectRatio=1.,rotation=90)));
      
   protected
      Boolean enabled(fixed=true)=enable.signal[1];
      Boolean disabled(fixed=true)=not enable.signal[1];
      Boolean u_pos[n](each fixed=true);
      
   equation
      for i in 1:n loop
         u_pos[i] = enabled and u[i] >= 0;
         y[i] = (change(u_pos[i]) and not edge(enabled)) and not edge(disabled);
      end for;
   end ZeroCrossing;
end Logical;