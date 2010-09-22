within Modelica.Blocks;
package Interfaces "Connectors and partial models for input/output blocks"
  import Modelica.SIunits;
  extends Modelica.Icons.Library;
  annotation(preferedView="info", Documentation(info="<HTML>
<p>
This package contains interface definitions for
<b>continuous</b> input/output blocks with Real,
Integer and Boolean signals. Furthermore, it contains
partial models for continuous and discrete blocks.
</p>

</HTML>
", revisions="<html>
<ul>
<li><i>Oct. 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added several new interfaces. <a href=\"../Documentation/ChangeNotes1.5.html\">Detailed description</a> available.
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       RealInputSignal renamed to RealInput. RealOutputSignal renamed to
       output RealOutput. GraphBlock renamed to BlockIcon. SISOreal renamed to
       SISO. SOreal renamed to SO. I2SOreal renamed to M2SO.
       SignalGenerator renamed to SignalSource. Introduced the following
       new models: MIMO, MIMOs, SVcontrol, MVcontrol, DiscreteBlockIcon,
       DiscreteBlock, DiscreteSISO, DiscreteMIMO, DiscreteMIMOs,
       BooleanBlockIcon, BooleanSISO, BooleanSignalSource, MI2BooleanMOs.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{0,0},{733,-491}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  connector RealSignal "Real port (both input/output possible)"
    replaceable type SignalType= Real annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    extends SignalType;
    annotation(Documentation(info="<html>
<p>
Connector with one signal of type Real (no icon, no input/output prefix).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end RealSignal;

  connector BooleanSignal= Boolean "Boolean port (both input/output possible)" annotation(Documentation(info="<html>
<p>
Connector with one signal of type Boolean (no icon, no input/output prefix).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  connector IntegerSignal= Integer "Integer port (both input/output possible)" annotation(Documentation(info="<html>
<p>
Connector with one signal of type Icon (no icon, no input/output prefix).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  connector RealInput= input RealSignal "'input Real' as connector" annotation(defaultComponentName="u", Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={0,0,127}, fillPattern=FillPattern.Solid, points={{0,50},{100,0},{0,-50},{0,50}}),Text(visible=true, fillColor={0,0,127}, extent={{-120,60},{100,105}}, textString="%name", fontName="Arial")}));
  connector RealOutput= output RealSignal "'output Real' as connector" annotation(defaultComponentName="y", Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{0,0},{-100,-50},{-100,50}}),Text(visible=true, fillColor={0,0,127}, extent={{-100,60},{130,140}}, textString="%name", fontName="Arial")}));
  connector BooleanInput= input BooleanSignal "'input Boolean' as connector" annotation(defaultComponentName="u", Documentation(info="<html>
<p>
Connector with one input signal of type Boolean.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{0,50},{100,0},{0,-50},{0,50}}),Text(visible=true, fillColor={255,0,255}, extent={{-120,60},{100,105}}, textString="%name", fontName="Arial")}));
  connector BooleanOutput= output BooleanSignal "'output Boolean' as connector" annotation(defaultComponentName="y", Documentation(info="<html>
<p>
Connector with one output signal of type Boolean.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{0,0},{-100,-50},{-100,50}}),Text(visible=true, fillColor={255,0,255}, extent={{-100,60},{130,140}}, textString="%name", fontName="Arial")}));
  connector IntegerInput= input IntegerSignal "'input Integer' as connector" annotation(defaultComponentName="u", Documentation(info="<html>
<p>
Connector with one input signal of type Integer.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,127,0}, fillColor={255,127,0}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,127,0}, fillColor={255,127,0}, fillPattern=FillPattern.Solid, points={{0,50},{100,0},{0,-50},{0,50}}),Text(visible=true, fillColor={255,127,0}, extent={{-120,60},{100,105}}, textString="%name", fontName="Arial")}));
  connector IntegerOutput= output IntegerSignal "'output Integer' as connector" annotation(defaultComponentName="y", Documentation(info="<html>
<p>
Connector with one output signal of type Integer.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,100},{100,0},{-100,-100},{-100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{0,0},{-100,-50},{-100,50}}),Text(visible=true, fillColor={255,127,0}, extent={{-100,60},{130,140}}, textString="%name", fontName="Arial")}));
  partial block BlockIcon "Basic graphical layout of input/output block"
    annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end BlockIcon;

  partial block SO "Single Output continuous control block"
    extends BlockIcon;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
<p>
Block has one continuous Real output signal.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end SO;

  partial block MO "Multiple Output continuous control block"
    extends BlockIcon;
    parameter Integer nout(min=1)=1 "Number of outputs";
    annotation(Documentation(info="<html>
<p>
Block has one continuous Real output signal vector.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealOutput y[nout] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MO;

  partial block SISO "Single Input Single Output continuous control block"
    extends BlockIcon;
    annotation(Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Real output signal.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u "Connector of Real input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end SISO;

  partial block SI2SO "2 Single Input / 1 Single Output continuous control block"
    extends BlockIcon;
    annotation(Documentation(info="<html>
<p>
Block has two continuous Real input signals u1 and u2 and one
continuous Real output signal y.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u1 "Connector of Real input signal 1" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealInput u2 "Connector of Real input signal 2" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end SI2SO;

  partial block SIMO "Single Input Multiple Output continuous control block"
    extends BlockIcon;
    parameter Integer nout=1 "Number of outputs";
    annotation(Documentation(info="<HTML>
<p> Block has one continuous Real input signal and a
    vector of continuous Real output signals.</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u "Connector of Real input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y[nout] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end SIMO;

  partial block MISO "Multiple Input Single Output continuous control block"
    extends BlockIcon;
    parameter Integer nin=1 "Number of inputs";
    annotation(Documentation(info="<HTML>
<p>
Block has a vector of continuous Real input signals and
one continuous Real output signal.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u[nin] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y "Connector of Real output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MISO;

  partial block MIMO "Multiple Input Multiple Output continuous control block"
    extends BlockIcon;
    parameter Integer nin=1 "Number of inputs";
    parameter Integer nout=1 "Number of outputs";
    annotation(Documentation(info="<HTML>
<p>
Block has a continuous Real input and a continuous Real output signal vector.
The signal sizes of the input and output vector may be different.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u[nin] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y[nout] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MIMO;

  partial block MIMOs "Multiple Input Multiple Output continuous control block with same number of inputs and outputs"
    extends BlockIcon;
    parameter Integer n=1 "Number of inputs (= number of outputs)";
    annotation(Documentation(info="<HTML>
<p>
Block has a continuous Real input and a continuous Real output signal vector
where the signal sizes of the input and output vector are identical.
</p>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u[n] "Connector of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y[n] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MIMOs;

  partial block MI2MO "2 Multiple Input / Multiple Output continuous control block"
    extends BlockIcon;
    parameter Integer n=1 "Dimension of input and output vectors.";
    annotation(Documentation(info="<html>
<p>
Block has two continuous Real input vectors u1 and u2 and one
continuous Real output vector y.
All vectors have the same number of elements.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u1[n] "Connector 1 of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealInput u2[n] "Connector 2 of Real input signals" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y[n] "Connector of Real output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MI2MO;

  partial block SignalSource "Base class for continuous signal source"
    extends SO;
    parameter Real offset=0 "offset of output signal";
    parameter SIunits.Time startTime=0 "output = offset for time < startTime";
    annotation(Documentation(info="<html>
<p>
Basic block for Real sources of package Blocks.Sources.
This component has one continuous Real output signal y
and two parameters (offset, startTime) to shift the
generated signal.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end SignalSource;

  partial block SVcontrol "Single-Variable continuous controller"
    extends BlockIcon;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-142,24},{-102,34}}, textString="(setpoint)", fontName="Arial"),Text(visible=true, extent={{100,14},{140,24}}, textString="(actuator)", fontName="Arial"),Text(visible=true, extent={{-83,-112},{-33,-102}}, textString=" (measurement)", fontName="Arial")}), Documentation(info="<html>
<p>
Block has two continuous Real input signals and one
continuous Real output signal. The block is designed
to be used as base class for a corresponding controller.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u_s "Connector of setpoint input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y "Connector of actuator output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    RealInput u_m "Connector of measurement input signal" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90)));
  end SVcontrol;

  partial block MVcontrol "Multi-Variable continuous controller"
    extends BlockIcon;
    parameter Integer nu_s=1 "Number of setpoint inputs";
    parameter Integer nu_m=1 "Number of measurement inputs";
    parameter Integer ny=1 "Number of actuator outputs";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-140,26},{-100,36}}, textString="(setpoint)", fontName="Arial"),Text(visible=true, extent={{102,14},{142,24}}, textString="(actuator)", fontName="Arial"),Text(visible=true, extent={{-75,-108},{-25,-98}}, textString=" (measurement)", fontName="Arial")}), Documentation(info="<html>
<p>
Block has two continuous Real input signal vectors and one
continuous Real output signal vector. The block is designed
to be used as base class for a corresponding controller.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u_s[nu_s] "Connector of setpoint input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y[ny] "Connector of actuator output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    RealInput u_m[nu_m] "Connector of measurement input signals" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90)));
  end MVcontrol;

  partial block DiscreteBlockIcon "Graphical layout of discrete block component icon"
    annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
discrete block (no declarations, no equations), e.g.,
from Blocks.Discrete.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={223,223,159}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end DiscreteBlockIcon;

  partial block DiscreteBlock "Base class of discrete control blocks"
    extends DiscreteBlockIcon;
    parameter SI.Time samplePeriod(min=100*Modelica.Constants.eps)=0.1 "Sample period of component";
    parameter SI.Time startTime=0 "First sample time instant";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  protected 
    output Boolean sampleTrigger "True, if sample time instant";
    output Boolean firstTrigger "Rising edge signals first sample instant";
  equation 
    sampleTrigger=sample(startTime, samplePeriod);
    when sampleTrigger then
      firstTrigger=time <= startTime + samplePeriod/2;
    end when;
    annotation(Documentation(info="<html>
<p>
Basic definitions of a discrete block of library
Blocks.Discrete.
</p>
</html>"));
  end DiscreteBlock;

  partial block DiscreteSISO "Single Input Single Output discrete control block"
    extends DiscreteBlock;
    annotation(Documentation(info="<html>
<p>
Block has one continuous input and one continuous output signal
which are sampled due to the defined <b>samplePeriod</b> parameter.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Modelica.Blocks.Interfaces.RealInput u "Continuous input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y "Continuous output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end DiscreteSISO;

  partial block DiscreteMIMO "Multiple Input Multiple Output discrete control block"
    extends DiscreteBlock;
    parameter Integer nin=1 "Number of inputs";
    parameter Integer nout=1 "Number of outputs";
    annotation(Documentation(info="<html>
<p>
Block has a continuous input and a continuous output signal vector
which are sampled due to the defined <b>samplePeriod</b> parameter.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Modelica.Blocks.Interfaces.RealInput u[nin] "Continuous input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[nout] "Continuous output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end DiscreteMIMO;

  partial block DiscreteMIMOs "Multiple Input Multiple Output discrete control block"
    parameter Integer n=1 "Number of inputs (= number of outputs)";
    extends DiscreteBlock;
    annotation(Documentation(info="<html>
<p>
Block has a continuous input and a continuous output signal vector
where the signal sizes of the input and output vector are identical.
These signals are sampled due to the defined <b>samplePeriod</b> parameter.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Modelica.Blocks.Interfaces.RealInput u[n] "Continuous input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[n] "Continuous output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end DiscreteMIMOs;

  partial block SVdiscrete "Discrete Single-Variable controller"
    extends DiscreteBlock;
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-140,24},{-100,34}}, textString="(setpoint)", fontName="Arial"),Text(visible=true, extent={{100,14},{130,22}}, textString="(actuator)", fontName="Arial"),Text(visible=true, extent={{-70,-112},{-20,-102}}, textString=" (measurement)", fontName="Arial")}), Documentation(info="<html>
<p>
Block has two continuous Real input signals and one
continuous Real output signal
that are sampled due to the defined <b>samplePeriod</b> parameter.
The block is designed
to be used as base class for a corresponding controller.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Discrete.Sampler sampler_s(final samplePeriod=samplePeriod, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={-90,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Discrete.Sampler sampler_m(final samplePeriod=samplePeriod, final startTime=startTime) annotation(Placement(visible=true, transformation(origin={0,-90}, extent={{-10,-10},{10,10}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealInput u_s "Continuous scalar setpoint input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y "Continuous scalar actuator output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u_m "Continuous scalar measurement input signal" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90)));
  equation 
    connect(u_s,sampler_s.u) annotation(Line(visible=true, points={{-120,0},{-102,0}}));
    connect(u_m,sampler_m.u) annotation(Line(visible=true, points={{0,-120},{0,-111},{0,-102},{0,-78}}));
  end SVdiscrete;

  partial block MVdiscrete "Discrete Multi-Variable controller"
    extends DiscreteBlock;
    parameter Integer nu_s=1 "Number of setpoint inputs";
    parameter Integer nu_m=1 "Number of measurement inputs";
    parameter Integer ny=1 "Number of actuator outputs";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-100,-30},{-80,-10}}, textString="u_s", fontName="Arial"),Text(visible=true, extent={{-138,24},{-98,34}}, textString="(setpoint)", fontName="Arial"),Text(visible=true, extent={{98,14},{138,24}}, textString="(actuator)", fontName="Arial"),Text(visible=true, extent={{-62,-110},{-12,-100}}, textString=" (measurement)", fontName="Arial")}), Documentation(info="<html>
<p>
Block has two continuous Real input signal vectors and one
continuous Real output signal vector. The vector signals
are sampled due to the defined <b>samplePeriod</b> parameter.
The block is designed
to be used as base class for a corresponding controller.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Discrete.Sampler sampler_s[nu_s](each final samplePeriod=samplePeriod, each final startTime=startTime) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Discrete.Sampler sampler_m[nu_m](each final samplePeriod=samplePeriod, each final startTime=startTime) annotation(Placement(visible=true, transformation(origin={0,-80}, extent={{-10,-10},{10,10}}, rotation=-90)));
    Modelica.Blocks.Interfaces.RealInput u_s[nu_s] "Continuous setpoint input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y[ny] "Continuous actuator output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealInput u_m[nu_m] "Continuous measurement input signals" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=90)));
  equation 
    connect(u_s,sampler_s.u) annotation(Line(visible=true, points={{-120,0},{-92,0}}));
    connect(u_m,sampler_m.u) annotation(Line(visible=true, points={{0,-120},{0,-106},{0,-92},{0,-68}}));
  end MVdiscrete;

  partial block BooleanBlockIcon "Basic graphical layout of Boolean block"
    annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end BooleanBlockIcon;

  partial block BooleanSISO "Single Input Single Output control block with signals of type Boolean"
    extends BooleanBlockIcon;
    annotation(Documentation(info="<html>
<p>
Block has one continuous Boolean input and one continuous Boolean output signal.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    BooleanInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end BooleanSISO;

  partial block BooleanMIMOs "Multiple Input Multiple Output continuous control block with same number of inputs and outputs of boolean type"
    extends BooleanBlockIcon;
    parameter Integer n=1 "Number of inputs (= number of outputs)";
    annotation(Documentation(info="<HTML>
<p>
Block has a continuous Boolean input and a continuous Boolean output signal vector
where the signal sizes of the input and output vector are identical.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    BooleanInput u[n] "Connector of Boolean input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    BooleanOutput y[n] "Connector of Boolean output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end BooleanMIMOs;

  partial block MI2BooleanMOs "2 Multiple Input / Boolean Multiple Output block with same signal lengths"
    extends BooleanBlockIcon;
    parameter Integer n=1 "Dimension of input and output vectors.";
    annotation(Documentation(info="<html>
<p>Block has two Boolean input vectors u1 and u2 and one Boolean output
vector y. All vectors have the same number of elements.</p>
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u1[n] "Connector 1 of Boolean input signals" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealInput u2[n] "Connector 2 of Boolean input signals" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
    BooleanOutput y[n] "Connector of Boolean output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end MI2BooleanMOs;

  partial block SI2BooleanSO "2 Single Input / Boolean Single Output block"
    extends BooleanBlockIcon;
    annotation(Documentation(info="<html>
<p>
Block has two Boolean input signals u1 and u2 and one Boolean output signal y.
</p>
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    input RealInput u1 "Connector 1 of Boolean input signals" annotation(Placement(visible=true, transformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,60}, extent={{-20,-20},{20,20}}, rotation=0)));
    input RealInput u2 "Connector 2 of Boolean input signals" annotation(Placement(visible=true, transformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-60}, extent={{-20,-20},{20,20}}, rotation=0)));
    output BooleanOutput y "Connector of Boolean output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end SI2BooleanSO;

  partial block BooleanSignalSource "Base class for Boolean signal sources"
    extends BooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,68},{-80,-80}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,90},{-88,68},{-72,68},{-80,90}}),Line(visible=true, points={{-90,-70},{68,-70}}, color={192,192,192}),Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
<p>
Basic block for Boolean sources of package Blocks.Sources.
This component has one continuous Boolean output signal y.
</p>
</html>"));
    BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end BooleanSignalSource;

  partial block IntegerBlockIcon "Basic graphical layout of Integer block"
    annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Integer block (no declarations, no equations).
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end IntegerBlockIcon;

  partial block IntegerSO "Single Integer Output continuous control block"
    extends IntegerBlockIcon;
    annotation(Documentation(info="<html>
<p>
Block has one continuous Integer output signal.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    IntegerOutput y "Connector of Integer output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end IntegerSO;

  partial block IntegerMO "Multiple Integer Output continuous control block"
    extends IntegerBlockIcon;
    parameter Integer nout(min=1)=1 "Number of outputs";
    annotation(Documentation(info="<html>
<p>
Block has one continuous Integer output signal vector.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    IntegerOutput y[nout] "Connector of Integer output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end IntegerMO;

  partial block IntegerSignalSource "Base class for continuous Integer signal source"
    extends IntegerSO;
    parameter Integer offset=0 "offset of output signal";
    parameter SI.Time startTime=0 "y = offset for time < startTime";
    annotation(Documentation(info="<html>
<p>
Basic block for Integer sources of package Blocks.Sources.
This component has one continuous Integer output signal y
and two parameters (offset, startTime) to shift the
generated signal.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end IntegerSignalSource;

  partial block IntegerSIBooleanSO "Integer Input Boolean Output continuous control block"
    extends BooleanBlockIcon;
    annotation(Documentation(info="<HTML>
<p>
Block has a continuous Integer input and a continuous Boolean output signal.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    IntegerInput u "Connector of Integer input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end IntegerSIBooleanSO;

  partial block IntegerMIBooleanMOs "Multiple Integer Input Multiple Boolean Output continuous control block with same number of inputs and outputs"
    extends BooleanBlockIcon;
    parameter Integer n=1 "Number of inputs (= number of outputs)";
    annotation(Documentation(info="<HTML>
<p>
Block has a continuous Integer input and a continuous Boolean output signal vector
where the signal sizes of the input and output vector are identical.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    IntegerInput u[n] "Connector of Integer input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    BooleanOutput y[n] "Connector of Boolean output signals" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end IntegerMIBooleanMOs;

  partial block partialBooleanBlockIcon "Basic graphical layout of logical block"
    annotation(Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output,
Boolean block (no declarations, no equations) used especially
in the Blocks.Logical library.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={210,210,210}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end partialBooleanBlockIcon;

  partial block partialBooleanSISO "partialSingle Input / Single Output Boolean block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-7},{-71,7}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Documentation(info="<html>
<p>
Block has one continuous Boolean input and one continuous Boolean output signal
with a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanSISO;

  partial block partialBooleanSI2SO "partial2 Single Input / 1 Single Output Boolean block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-7},{-71,7}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-88},{-71,-74}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Documentation(info="<html>
<p>
Block has two continuous Boolean input and one continuous Boolean output signal
with a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.BooleanInput u1 "Connector of first Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanInput u2 "Connector of second Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanSI2SO;

  partial block partialBooleanSI3SO "partial2 Single Input / 1 Single Output Boolean block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,74},{-71,88}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-7},{-71,7}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-88},{-71,-74}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Documentation(info="<html>
Block has three continuous Boolean input and one continuous Boolean output signal
with a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.BooleanInput u1 "Connector of first Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanInput u2 "Connector of second Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanInput u3 "Connector of third Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanSI3SO;

  partial block partialBooleanSI "partialSingle Input Boolean block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{-85,-7},{-71,7}})}), Documentation(info="<html>
<p>
Block has one continuous Boolean input signal
with a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.BooleanInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
  end partialBooleanSI;

  partial block partialBooleanSO "partialSingle Output Boolean block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Documentation(info="<html>
<p>
Block has one continuous Boolean output signal
with a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanSO;

  partial block partialBooleanSource "partialBoolean source block"
    extends partialBooleanBlockIcon;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{-80,88},{-88,66},{-72,66},{-80,88}}),Line(visible=true, points={{-80,66},{-80,-82}}, color={255,0,255}),Line(visible=true, points={{-90,-70},{72,-70}}, color={255,0,255}),Polygon(visible=true, lineColor={255,0,255}, fillColor={255,0,255}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-80,80},{-88,58},{-72,58},{-80,80}}),Line(visible=true, points={{-80,58},{-80,-90}}),Line(visible=true, points={{-90,-70},{68,-70}}),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{90,-70},{68,-62},{68,-78},{90,-70}}),Text(visible=true, extent={{54,-96},{106,-84}}, textString="time", fontName="Arial"),Text(visible=true, extent={{-108,64},{-92,80}}, textString="y", fontName="Arial")}), Documentation(info="<html>
<p>
Basic block for Boolean sources of package Blocks.Sources.
This component has one continuous Boolean output signal y
and a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanSource;

  partial block partialBooleanThresholdComparison "partialBoolean block to compare the Real input u with a threshold"
    parameter Real threshold=0 "Comparison with respect to threshold";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={210,210,210}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-150,-140},{150,-110}}, textString="%threshold", fontName="Arial"),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{71,-7},{85,7}})}), Documentation(info="<html>
<p>
Block has one continuous Real input and one continuous Boolean output signal
as well as a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u "Connector of Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanThresholdComparison;

  partial block partialBooleanComparison "partialBoolean block to compare two Real inputs u1 and u2"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={210,210,210}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100,-100},{100,100}}),Ellipse(visible=true, fillColor={235,235,235}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{73,-7},{87,7}}),Ellipse(visible=true, fillColor={0,0,255}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, extent={{32,-10},{52,10}}),Line(visible=true, points={{-100,-80},{42,-80},{42,0}}, color={0,0,255})}), Documentation(info="<html>
<p>
Block has two continuous Real input and one continuous Boolean output signal
as a result of the comparision of the two input signals. The block
has a 3D icon (e.g. used in Blocks.Logical library).
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Blocks.Interfaces.RealInput u1 "Connector of first Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.RealInput u2 "Connector of second Boolean input signal" annotation(Placement(visible=true, transformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,-80}, extent={{-20,-20},{20,20}}, rotation=0)));
    Blocks.Interfaces.BooleanOutput y "Connector of Boolean output signal" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end partialBooleanComparison;

  package Adaptors "Components to send signals to a bus or receive signals from a bus"
    extends Modelica.Icons.Library;
    block SendReal "Send Real signal to bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-100,-30},{100,30}}, textString="send", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      RealOutput toBus annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      RealInput u annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    equation 
      toBus=u;
    end SendReal;

    block SendBoolean "Send Boolean signal to bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={255,0,255}, extent={{-100,-30},{100,30}}, textString="send", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      BooleanOutput toBus annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      BooleanInput u annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    equation 
      toBus=u;
    end SendBoolean;

    block SendInteger "Send Integer signal to bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={255,127,0}, extent={{-100,-30},{100,30}}, textString="send", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      IntegerOutput toBus annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      IntegerInput u annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    equation 
      toBus=u;
    end SendInteger;

    block ReceiveReal "Receive Real signal from bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, fillColor={0,0,255}, extent={{-100,-30},{100,30}}, textString="receive", fontName="Arial"),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      RealInput fromBus annotation(Placement(visible=true, transformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      RealOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      y=fromBus;
    end ReceiveReal;

    block ReceiveBoolean "Receive Boolean signal from bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, fillColor={255,0,255}, extent={{-100,-30},{100,30}}, textString="receive", fontName="Arial"),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      BooleanInput fromBus annotation(Placement(visible=true, transformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      BooleanOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      y=fromBus;
    end ReceiveBoolean;

    block ReceiveInteger "Receive Integer signal from bus"
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, fillColor={255,127,0}, extent={{-100,-30},{100,30}}, textString="receive", fontName="Arial"),Text(visible=true, extent={{-144,46},{144,96}}, textString="%name", fontName="Arial")}), Documentation(info="<HTML>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      IntegerInput fromBus annotation(Placement(visible=true, transformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      IntegerOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      y=fromBus;
    end ReceiveInteger;

    model AdaptorReal "Adaptor between 'old' and 'new' Real signal connectors"
      RealPort oldReal(final n=1) annotation(extent=[-120,-10;-100,10]);
      annotation(structurallyIncomplete, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-88,-24},{88,22}}, textString="adaptor", fontName="Arial"),Text(visible=true, extent={{-216,-80},{36,-58}}, textString="port.signal", fontName="Arial")}), Documentation(info=""), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      connector RealPort "Connector with signals of type Real"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Real "type of signal";
        SignalType signal[n] "Real signals" annotation(Hide=true);
      end RealPort;

      RealSignal newReal annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    protected 
      connector RealPort "Connector with signals of type Real"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Real "type of signal";
        SignalType signal[n] "Real signals" annotation(Hide=true);
      end RealPort;

    equation 
      newReal=oldReal.signal[1];
    end AdaptorReal;

    model AdaptorBoolean "Adaptor between 'old' and 'new' Boolean signal connectors"
      BooleanPort oldBoolean(final n=1) annotation(extent=[-120,-10;-100,10]);
      annotation(structurallyIncomplete, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="", fontName="Arial"),Text(visible=true, fillColor={255,0,255}, extent={{-88,-24},{88,22}}, textString="adaptor", fontName="Arial"),Text(visible=true, extent={{-216,-80},{36,-58}}, textString="port.signal", fontName="Arial")}), Documentation(info=""), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      connector BooleanPort "Connector with signals of type Boolean"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Boolean "type of signal";
        SignalType signal[n] "Boolean signals" annotation(Hide=true);
      end BooleanPort;

      BooleanSignal newBoolean annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    protected 
      connector BooleanPort "Connector with signals of type Boolean"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Boolean "type of signal";
        SignalType signal[n] "Boolean signals" annotation(Hide=true);
      end BooleanPort;

    equation 
      newBoolean=oldBoolean.signal[1];
    end AdaptorBoolean;

    model AdaptorInteger "Adaptor between 'old' and 'new' Integer signal connectors"
      IntegerPort oldInteger(final n=1) annotation(extent=[-120,-10;-100,10]);
      annotation(structurallyIncomplete, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-144,46},{144,96}}, textString="", fontName="Arial"),Text(visible=true, fillColor={255,127,0}, extent={{-88,-24},{88,22}}, textString="adaptor", fontName="Arial"),Text(visible=true, extent={{-216,-80},{36,-58}}, textString="port.signal", fontName="Arial")}), Documentation(info="
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      connector IntegerPort "Connector with signals of type Integer"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Integer "type of signal";
        SignalType signal[n] "Integer signals" annotation(Hide=true);
      end IntegerPort;

      IntegerSignal newInteger annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    protected 
      connector IntegerPort "Connector with signals of type Integer"
        parameter Integer n=1 "Dimension of signal vector" annotation(Hide=true);
        replaceable type SignalType= Integer "type of signal";
        SignalType signal[n] "Integer signals" annotation(Hide=true);
      end IntegerPort;

    equation 
      newInteger=oldInteger.signal[1];
    end AdaptorInteger;

    annotation(Documentation(info="<html>
<p>
The components of this package should no longer be used.
They are only provided for backward compatibility issues.
Modelica language at release 2.2) should be the basis
to define signal buses.
</p>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Adaptors;

  partial block PartialConversionBlock "Partial block defining the interface for conversion blocks"
    annotation(Documentation(info="<html>
<p>
This block defines the interface of a conversion block that
converts from one unit into another one.
</p>

</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Line(visible=true, points={{-90,0},{30,0}}, color={127,0,0}),Polygon(visible=true, lineColor={127,0,0}, fillColor={127,0,0}, fillPattern=FillPattern.Solid, points={{90,0},{30,20},{30,-20},{90,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-115,105},{115,155}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    RealInput u "Connector of Real input signal to be converted" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    RealOutput y "Connector of Real output signal containing input signal u in another unit" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  end PartialConversionBlock;

end Interfaces;
