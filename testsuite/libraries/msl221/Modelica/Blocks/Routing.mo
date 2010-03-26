within Modelica.Blocks;
package Routing "Blocks to combine and extract signals"
  extends Icons.Library;
  block ExtractSignal "Extract signals from an input signal vector"
    extends Modelica.Blocks.Interfaces.MIMO;
    parameter Integer extract[nout]=1:nout "Extracting vector";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-100,-100},{100,100}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-50},{-50,50}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{50,-50},{90,50}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-94.4104,1.90792},{-94.4104,-2.09208},{-90.4104,-0.0920762},{-94.4104,1.90792}}),Line(visible=true, points={{-72,2},{-60.1395,12.907},{-49.1395,12.907}}),Line(visible=true, points={{-73,4},{-59,40},{-49,40}}),Line(visible=true, points={{-112,0},{-75.0373,-0.0180176}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80.0437,-4.90745},{-70.0437,4.59255}}),Line(visible=true, points={{-73,-5},{-60,-40},{-49,-40}}),Line(visible=true, points={{-72,-2},{-60.0698,-12.907},{-49.0698,-12.907}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.8808,-11},{-48.8808,-15},{-44.8808,-13},{-48.8808,-11}}),Line(visible=true, points={{-46,13},{-35,13},{35,-30},{45,-30}}),Line(visible=true, points={{-45,40},{-35,40},{35,0},{44,0}}),Line(visible=true, points={{-45,-40},{-34,-40},{35,30},{44,30}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-49,42},{-49,38},{-45,40},{-49,42}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.8728,-38.0295},{-48.8728,-42.0295},{-44.8728,-40.0295},{-48.8728,-38.0295}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.9983,14.8801},{-48.9983,10.8801},{-44.9983,12.8801},{-48.9983,14.8801}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{70.3052,-5.37257},{80.3052,4.12743}}),Line(visible=true, points={{80,0},{100,0}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.1618,32.3085},{44.1618,28.3085},{48.1618,30.3085},{44.1618,32.3085}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.2575,1.80443},{44.2575,-2.19557},{48.2575,-0.195573},{44.2575,1.80443}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.8805,-28.1745},{44.8805,-32.1745},{48.8805,-30.1745},{44.8805,-28.1745}}),Line(visible=true, points={{48,0},{70,0}}),Line(visible=true, points={{47,30},{60,30},{73,3}}),Line(visible=true, points={{49,-30},{60,-30},{74,-4}}),Text(visible=true, extent={{-150,-150},{150,-110}}, textString="extract=%extract", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-90,-50},{-50,50}}),Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{50,-50},{90,50}}),Polygon(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-94.4104,1.90792},{-94.4104,-2.09208},{-90.4104,-0.0920762},{-94.4104,1.90792}}),Line(visible=true, points={{-72,2},{-60.1395,12.907},{-49.1395,12.907}}, color={0,0,255}),Line(visible=true, points={{-73,4},{-59,40},{-49,40}}, color={0,0,255}),Line(visible=true, points={{-112,0},{-75.0373,-0.0180176}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-80.0437,-4.90745},{-70.0437,4.59255}}),Line(visible=true, points={{-73,-5},{-60,-40},{-49,-40}}, color={0,0,255}),Line(visible=true, points={{-72,-2},{-60.0698,-12.907},{-49.0698,-12.907}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.8808,-11},{-48.8808,-15},{-44.8808,-13},{-48.8808,-11}}),Line(visible=true, points={{-46,13},{-35,13},{35,-30},{45,-30}}, color={0,0,255}),Line(visible=true, points={{-45,40},{-35,40},{35,0},{44,0}}, color={0,0,255}),Line(visible=true, points={{-45,-40},{-34,-40},{35,30},{44,30}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-49,42},{-49,38},{-45,40},{-49,42}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.8728,-38.0295},{-48.8728,-42.0295},{-44.8728,-40.0295},{-48.8728,-38.0295}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-48.9983,14.8801},{-48.9983,10.8801},{-44.9983,12.8801},{-48.9983,14.8801}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{70.3052,-5.37257},{80.3052,4.12743}}),Line(visible=true, points={{80,0},{105,0}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.1618,32.3085},{44.1618,28.3085},{48.1618,30.3085},{44.1618,32.3085}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.2575,1.80443},{44.2575,-2.19557},{48.2575,-0.195573},{44.2575,1.80443}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{44.8805,-28.1745},{44.8805,-32.1745},{48.8805,-30.1745},{44.8805,-28.1745}}),Line(visible=true, points={{48,0},{70,0}}, color={0,0,255}),Line(visible=true, points={{47,30},{60,30},{73,3}}, color={0,0,255}),Line(visible=true, points={{49,-30},{60,-30},{74,-4}}, color={0,0,255}),Rectangle(visible=true, extent={{-100,-81},{100,80}})}), Documentation(info="<HTML>
<p>Extract signals from the input connector and transfer them
to the output connector.</p>
<p>The extracting scheme is given by the integer vector 'extract'.
This vector specifies, which input signals are taken and in which
order they are transfered to the output vector. Note, that the
dimension of 'extract' has to match the number of outputs.
Additionally, the dimensions of the input connector signals and
the output connector signals have to be explicitly defined via the
parameters 'nin' and 'nout'.</p>
<p>Example:</p>
<pre>     nin = 7 \"Number of inputs\";
     nout = 4 \"Number of outputs\";
     extract[nout] = {6,3,3,2} \"Extracting vector\";
</pre>
<p>extracts four output signals (nout=4) from the seven elements of the
input vector (nin=7):</p>
<pre>   output no. 1 is set equal to input no. 6
   output no. 2 is set equal to input no. 3
   output no. 3 is set equal to input no. 3
   output no. 4 is set equal to input no. 2
</pre>
</HTML>
"));
  equation 
    for i in 1:nout loop
      y[i]=u[extract[i]];
    end for;
  end ExtractSignal;

  block Extractor "Extract scalar signal out of signal vector dependent on IntegerRealInput index"
    extends Modelica.Blocks.Interfaces.MISO;
    parameter Boolean allowOutOfRange=false "Index may be out of range";
    parameter Real outOfRangeValue=10000000000.0 "Output signal if index is out of range";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-80,-50},{-40,50}}),Polygon(visible=true, lineColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-84.4104,1.9079},{-84.4104,-2.09208},{-80.4104,-0.09208},{-84.4104,1.9079}}),Line(visible=true, points={{-62,2},{-50.1395,12.907},{-39.1395,12.907}}, color={0,0,255}),Line(visible=true, points={{-63,4},{-49,40},{-39,40}}, color={0,0,255}),Line(visible=true, points={{-102,0},{-65.0373,-0.01802}}, color={0,0,255}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-70.0437,-4.90745},{-60.0437,4.5925}}),Line(visible=true, points={{-63,-5},{-50,-40},{-39,-40}}, color={0,0,255}),Line(visible=true, points={{-62,-2},{-50.0698,-12.907},{-39.0698,-12.907}}, color={0,0,255}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-38.8808,-11},{-38.8808,-15},{-34.8808,-13},{-38.8808,-11}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-39,42},{-39,38},{-35,40},{-39,42}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-38.8728,-38.0295},{-38.8728,-42.0295},{-34.8728,-40.0295},{-38.8728,-38.0295}}),Polygon(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-38.9983,14.8801},{-38.9983,10.8801},{-34.9983,12.8801},{-38.9983,14.8801}}),Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-30,-50},{30,50}}),Line(visible=true, points={{100,0},{0,0}}, color={127,0,255}),Line(visible=true, points={{0,2},{0,-104}}, color={255,127,0}),Line(visible=true, points={{-35,40},{-20,40}}, color={127,0,255}),Line(visible=true, points={{-35,13},{-20,13}}, color={127,0,255}),Line(visible=true, points={{-35,-13},{-20,-13}}, color={127,0,255}),Line(visible=true, points={{-35,-40},{-20,-40}}, color={127,0,255}),Polygon(visible=true, lineColor={127,0,255}, fillPattern=FillPattern.Solid, points={{0,0},{-18,13},{-20,13},{-2,0},{0,0}}),Ellipse(visible=true, lineColor={255,127,0}, fillColor={255,127,0}, fillPattern=FillPattern.Solid, extent={{-6,-6},{6,6}})}), Documentation(info="<html>
<p>This block extracts a scalar output signal out the
vector of input signals dependent on the Integer
value of the additional u index:</p>
<pre>    y = u [ index ] ;
</pre>
<p>where index is an additional Integer input signal.</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Modelica.Blocks.Interfaces.IntegerInput index annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=-270), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=-270)));
  protected 
    Real k[nin];
  equation 
    when {initial(),change(index)} then
      for i in 1:nin loop
        k[i]=if index == i then 1 else 0;
      end for;
    end when;
    y=if not allowOutOfRange or index > 0 and index <= nin then k*u else outOfRangeValue;
  end Extractor;

  block Multiplex2 "Multiplexer block for two input connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of input signal connector 1";
    parameter Integer n2=1 "dimension of input signal connector 2";
    annotation(Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the two input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1 and n2.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-98,60},{-60,60},{-4,6}}),Line(visible=true, points={{-98,-60},{-60,-60},{-4,-4}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-98,60},{-60,60},{-4,6}}),Line(visible=true, points={{-98,-60},{-60,-60},{-4,-4}}),Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}})}));
    Modelica.Blocks.Interfaces.RealInput u1[n1] "Connector of Real input signals 1" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u2[n2] "Connector of Real input signals 2" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n1 + n2] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [y]=[u1;u2];
  end Multiplex2;

  block Multiplex3 "Multiplexer block for three input connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of input signal connector 1";
    parameter Integer n2=1 "dimension of input signal connector 2";
    parameter Integer n3=1 "dimension of input signal connector 3";
    annotation(Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the three input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2 and n3.
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{8,0},{102,0}}),Line(visible=true, points={{-100,70},{-60,70},{-4,6}}),Line(visible=true, points={{-100,0},{-12,0}}),Line(visible=true, points={{-100,-70},{-62,-70},{-4,-4}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,70},{-60,70},{-4,6}}),Line(visible=true, points={{-100,-70},{-62,-70},{-4,-4}}),Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-100,0},{-12,0}})}));
    Modelica.Blocks.Interfaces.RealInput u1[n1] "Connector of Real input signals 1" annotation(Placement(visible=true, transformation(origin={-120,70}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,70}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u2[n2] "Connector of Real input signals 2" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u3[n3] "Connector of Real input signals 3" annotation(Placement(visible=true, transformation(origin={-120,-70}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-70}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n1 + n2 + n3] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [y]=[u1;u2;u3];
  end Multiplex3;

  block Multiplex4 "Multiplexer block for four input connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of input signal connector 1";
    parameter Integer n2=1 "dimension of input signal connector 2";
    parameter Integer n3=1 "dimension of input signal connector 3";
    parameter Integer n4=1 "dimension of input signal connector 4";
    annotation(Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the four input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{8,0},{102,0}}),Line(visible=true, points={{-100,90},{-60,90},{-3,4}}),Line(visible=true, points={{-100,30},{-60,30},{-9,0}}),Line(visible=true, points={{-99,-30},{-59,-30},{-10,-5}}),Line(visible=true, points={{-100,-90},{-60,-90},{-5,-6}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,90},{-60,90},{-3,4}}),Line(visible=true, points={{-100,-90},{-60,-90},{-5,-6}}),Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}}),Line(visible=true, points={{-100,30},{-60,30},{-9,0}}),Line(visible=true, points={{-99,-30},{-59,-30},{-10,-5}})}));
    Modelica.Blocks.Interfaces.RealInput u1[n1] "Connector of Real input signals 1" annotation(Placement(visible=true, transformation(origin={-120,90}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,90}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u2[n2] "Connector of Real input signals 2" annotation(Placement(visible=true, transformation(origin={-120,30}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,30}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u3[n3] "Connector of Real input signals 3" annotation(Placement(visible=true, transformation(origin={-120,-30}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-30}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u4[n4] "Connector of Real input signals 4" annotation(Placement(visible=true, transformation(origin={-120,-90}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-90}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n1 + n2 + n3 + n4] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [y]=[u1;u2;u3;u4];
  end Multiplex4;

  block Multiplex5 "Multiplexer block for five input connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of input signal connector 1";
    parameter Integer n2=1 "dimension of input signal connector 2";
    parameter Integer n3=1 "dimension of input signal connector 3";
    parameter Integer n4=1 "dimension of input signal connector 4";
    parameter Integer n5=1 "dimension of input signal connector 5";
    annotation(Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the five input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3, n4 and n5.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{8,0},{102,0}}),Line(visible=true, points={{-100,100},{-60,100},{-4,6}}),Line(visible=true, points={{-99,50},{-60,50},{-8,5}}),Line(visible=true, points={{-100,0},{-7,0}}),Line(visible=true, points={{-99,-50},{-60,-50},{-9,-6}}),Line(visible=true, points={{-100,-100},{-60,-100},{-4,-4}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,100},{-60,100},{-4,6}}),Line(visible=true, points={{-100,-100},{-60,-100},{-4,-4}}),Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}}),Line(visible=true, points={{-99,50},{-60,50},{-8,5}}),Line(visible=true, points={{-100,0},{-7,0}}),Line(visible=true, points={{-99,-50},{-60,-50},{-9,-6}})}));
    Modelica.Blocks.Interfaces.RealInput u1[n1] "Connector of Real input signals 1" annotation(Placement(visible=true, transformation(origin={-120,100}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,100}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u2[n2] "Connector of Real input signals 2" annotation(Placement(visible=true, transformation(origin={-120,50}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,50}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u3[n3] "Connector of Real input signals 3" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u4[n4] "Connector of Real input signals 4" annotation(Placement(visible=true, transformation(origin={-120,-50}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-50}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u5[n5] "Connector of Real input signals 5" annotation(Placement(visible=true, transformation(origin={-120,-100}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-100}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n1 + n2 + n3 + n4 + n5] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [y]=[u1;u2;u3;u4;u5];
  end Multiplex5;

  block Multiplex6 "Multiplexer block for six input connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of input signal connector 1";
    parameter Integer n2=1 "dimension of input signal connector 2";
    parameter Integer n3=1 "dimension of input signal connector 3";
    parameter Integer n4=1 "dimension of input signal connector 4";
    parameter Integer n5=1 "dimension of input signal connector 5";
    parameter Integer n6=1 "dimension of input signal connector 6";
    annotation(Documentation(info="<HTML>
<p>
The output connector is the <b>concatenation</b> of the six input connectors.
Note, that the dimensions of the input connector signals have to be
explicitly defined via parameters n1, n2, n3, n4, n5 and n6.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}}),Line(visible=true, points={{-99,85},{-61,85},{-3,11}}),Line(visible=true, points={{-100,51},{-61,51},{-7,6}}),Line(visible=true, points={{-101,17},{-60,17},{-9,2}}),Line(visible=true, points={{-100,-18},{-60,-18},{-11,-4}}),Line(visible=true, points={{-99,-50},{-60,-50},{-9,-6}}),Line(visible=true, points={{-100,-85},{-60,-85},{-3,-10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-99,85},{-61,85},{-3,11}}),Line(visible=true, points={{-100,-85},{-60,-85},{-3,-10}}),Line(visible=true, points={{8,0},{102,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-15,-15},{15,15}}),Line(visible=true, points={{-100,51},{-61,51},{-7,6}}),Line(visible=true, points={{-99,-50},{-60,-50},{-9,-6}}),Line(visible=true, points={{-101,17},{-60,17},{-9,2}}),Line(visible=true, points={{-100,-18},{-60,-18},{-11,-4}})}));
    Modelica.Blocks.Interfaces.RealInput u1[n1] "Connector of Real input signals 1" annotation(Placement(visible=true, transformation(origin={-112,85}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,85}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u2[n2] "Connector of Real input signals 2" annotation(Placement(visible=true, transformation(origin={-112,51}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,51}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u3[n3] "Connector of Real input signals 3" annotation(Placement(visible=true, transformation(origin={-112,17}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,17}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u4[n4] "Connector of Real input signals 4" annotation(Placement(visible=true, transformation(origin={-112,-17}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,-17}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u5[n5] "Connector of Real input signals 5" annotation(Placement(visible=true, transformation(origin={-112,-51}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,-51}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u6[n6] "Connector of Real input signals 6" annotation(Placement(visible=true, transformation(origin={-112,-85}, extent={{-12,-12},{12,12}}, rotation=0), iconTransformation(origin={-112,-85}, extent={{-12,-12},{12,12}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n1 + n2 + n3 + n4 + n5 + n6] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [y]=[u1;u2;u3;u4;u5;u6];
  end Multiplex6;

  block DeMultiplex2 "DeMultiplexer block for two output connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of output signal connector 1";
    parameter Integer n2=1 "dimension of output signal connector 2";
    annotation(Documentation(info="<HTML>
<p>
The input connector is <b>splitted</b> up into two output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1 and n2.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{100,60},{60,60},{10,8}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{100,-60},{60,-60},{8,-8}}),Line(visible=true, points={{-100,0},{-6,0}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{100,60},{60,60},{10,8}}),Line(visible=true, points={{100,-60},{60,-60},{8,-8}}),Line(visible=true, points={{-100,0},{-6,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}})}));
    Modelica.Blocks.Interfaces.RealInput u[n1 + n2] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1[n1] "Connector of Real output signals 1" annotation(Placement(visible=true, transformation(origin={110,60}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,60}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2[n2] "Connector of Real output signals 2" annotation(Placement(visible=true, transformation(origin={110,-60}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-60}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [u]=[y1;y2];
  end DeMultiplex2;

  block DeMultiplex3 "DeMultiplexer block for three output connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of output signal connector 1";
    parameter Integer n2=1 "dimension of output signal connector 2";
    parameter Integer n3=1 "dimension of output signal connector 3";
    annotation(Documentation(info="<HTML>
<p>
The input connector is <b>splitted</b> up into three output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2 and n3.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-100,0},{-6,0}}),Line(visible=true, points={{100,70},{60,70},{4,5}}),Line(visible=true, points={{0,0},{101,0}}),Line(visible=true, points={{100,-70},{61,-70},{5,-5}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{100,70},{60,70},{4,5}}),Line(visible=true, points={{100,-70},{61,-70},{5,-5}}),Line(visible=true, points={{-100,0},{-6,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-16,-15},{14,15}}),Line(visible=true, points={{0,0},{101,0}})}));
    Modelica.Blocks.Interfaces.RealInput u[n1 + n2 + n3] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1[n1] "Connector of Real output signals 1" annotation(Placement(visible=true, transformation(origin={110,70}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,70}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2[n2] "Connector of Real output signals 2" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y3[n3] "Connector of Real output signals 3" annotation(Placement(visible=true, transformation(origin={110,-70}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [u]=[y1;y2;y3];
  end DeMultiplex3;

  block DeMultiplex4 "DeMultiplexer block for four output connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of output signal connector 1";
    parameter Integer n2=1 "dimension of output signal connector 2";
    parameter Integer n3=1 "dimension of output signal connector 3";
    parameter Integer n4=1 "dimension of output signal connector 4";
    annotation(Documentation(info="<HTML>
<p>
The input connector is <b>splitted</b> up into four output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3 and n4.
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-100,0},{-6,0}}),Line(visible=true, points={{100,90},{60,90},{6,5}}),Line(visible=true, points={{100,30},{60,30},{9,2}}),Line(visible=true, points={{100,-30},{60,-30},{8,-4}}),Line(visible=true, points={{99,-90},{60,-90},{6,-6}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{100,90},{60,90},{6,5}}),Line(visible=true, points={{99,-90},{60,-90},{6,-6}}),Line(visible=true, points={{-100,0},{-6,0}}),Line(visible=true, points={{100,30},{60,30},{9,2}}),Line(visible=true, points={{100,-30},{60,-30},{8,-4}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-16,-15},{14,15}})}));
    Modelica.Blocks.Interfaces.RealInput u[n1 + n2 + n3 + n4] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1[n1] "Connector of Real output signals 1" annotation(Placement(visible=true, transformation(origin={110,90}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2[n2] "Connector of Real output signals 2" annotation(Placement(visible=true, transformation(origin={110,30}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,30}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y3[n3] "Connector of Real output signals 3" annotation(Placement(visible=true, transformation(origin={110,-30}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y4[n4] "Connector of Real output signals 4" annotation(Placement(visible=true, transformation(origin={110,-90}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [u]=[y1;y2;y3;y4];
  end DeMultiplex4;

  block DeMultiplex5 "DeMultiplexer block for five output connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of output signal connector 1";
    parameter Integer n2=1 "dimension of output signal connector 2";
    parameter Integer n3=1 "dimension of output signal connector 3";
    parameter Integer n4=1 "dimension of output signal connector 4";
    parameter Integer n5=1 "dimension of output signal connector 5";
    annotation(Documentation(info="<HTML>
<p>
The input connector is <b>splitted</b> up into five output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3, n4 and n5.
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-100,0},{-6,0}}),Line(visible=true, points={{99,80},{60,80},{6,5}}),Line(visible=true, points={{100,40},{60,40},{10,3}}),Line(visible=true, points={{100,0},{10,0}}),Line(visible=true, points={{100,-40},{61,-40},{11,-7}}),Line(visible=true, points={{100,-80},{60,-80},{7,-5}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{99,80},{60,80},{6,5}}),Line(visible=true, points={{100,-80},{60,-80},{7,-5}}),Line(visible=true, points={{-100,0},{-6,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-15},{16,15}}),Line(visible=true, points={{100,40},{60,40},{10,3}}),Line(visible=true, points={{100,0},{10,0}}),Line(visible=true, points={{100,-40},{61,-40},{11,-7}})}));
    Modelica.Blocks.Interfaces.RealInput u[n1 + n2 + n3 + n4 + n5] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1[n1] "Connector of Real output signals 1" annotation(Placement(visible=true, transformation(origin={110,80}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,80}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2[n2] "Connector of Real output signals 2" annotation(Placement(visible=true, transformation(origin={110,40}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,40}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y3[n3] "Connector of Real output signals 3" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y4[n4] "Connector of Real output signals 4" annotation(Placement(visible=true, transformation(origin={110,-40}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-40}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y5[n5] "Connector of Real output signals 5" annotation(Placement(visible=true, transformation(origin={110,-80}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-80}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [u]=[y1;y2;y3;y4;y5];
  end DeMultiplex5;

  block DeMultiplex6 "DeMultiplexer block for six output connectors"
    extends Modelica.Blocks.Interfaces.BlockIcon;
    parameter Integer n1=1 "dimension of output signal connector 1";
    parameter Integer n2=1 "dimension of output signal connector 2";
    parameter Integer n3=1 "dimension of output signal connector 3";
    parameter Integer n4=1 "dimension of output signal connector 4";
    parameter Integer n5=1 "dimension of output signal connector 5";
    parameter Integer n6=1 "dimension of output signal connector 6";
    annotation(Documentation(info="<HTML>
<p>
The input connector is <b>splitted</b> up into six output connectors.
Note, that the dimensions of the output connector signals have to be
explicitly defined via parameters n1, n2, n3, n4, n5 and n6.
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-14},{16,16}}),Line(visible=true, points={{-100,0},{-6,0}}),Line(visible=true, points={{99,90},{60,90},{5,10}}),Line(visible=true, points={{100,53},{60,53},{8,6}}),Line(visible=true, points={{100,18},{59,18},{7,2}}),Line(visible=true, points={{100,-19},{60,-19},{13,-2}}),Line(visible=true, points={{99,-54},{60,-54},{9,-1}}),Line(visible=true, points={{100,-91},{60,-91},{3,-7}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{99,90},{60,90},{5,10}}),Line(visible=true, points={{100,-91},{60,-91},{3,-7}}),Line(visible=true, points={{-100,0},{-6,0}}),Ellipse(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-14,-15},{16,15}}),Line(visible=true, points={{100,53},{60,53},{8,6}}),Line(visible=true, points={{99,-54},{60,-54},{9,-1}}),Line(visible=true, points={{100,18},{59,18},{7,2}}),Line(visible=true, points={{100,-19},{60,-19},{13,-2}})}));
    Modelica.Blocks.Interfaces.RealInput u[n1 + n2 + n3 + n4 + n5 + n6] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y1[n1] "Connector of Real output signals 1" annotation(Placement(visible=true, transformation(origin={110,90}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y2[n2] "Connector of Real output signals 2" annotation(Placement(visible=true, transformation(origin={110,54}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,54}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y3[n3] "Connector of Real output signals 3" annotation(Placement(visible=true, transformation(origin={110,18}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,18}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y4[n4] "Connector of Real output signals 4" annotation(Placement(visible=true, transformation(origin={110,-18}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-18}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y5[n5] "Connector of Real output signals 5" annotation(Placement(visible=true, transformation(origin={110,-54}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-54}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y6[n6] "Connector of Real output signals 6" annotation(Placement(visible=true, transformation(origin={110,-90}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    [u]=[y1;y2;y3;y4;y5;y6];
  end DeMultiplex6;

  annotation(Documentation(info="<html>
<p>
This package contains blocks to combine and extract signals.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
end Routing;
