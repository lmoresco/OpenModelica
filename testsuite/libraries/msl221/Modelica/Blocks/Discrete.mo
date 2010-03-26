within Modelica.Blocks;
package Discrete "Discrete input/output blocks with fixed sample period"
  extends Modelica.Icons.Library;
  annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains <b>discrete control blocks</b>
with <b>fixed sample period</b>.
Every component of this package is structured in the following way:
</p>
<ol>
<li> A component has <b>continuous real</b> input and output signals.</li>
<li> The <b>input</b> signals are <b>sampled</b> by the given sample period
     defined via parameter <b>samplePeriod</b>.
     The first sample instant is defined by parameter <b>startTime</b>.
<li> The <b>output</b> signals are computed from the sampled input signals.
</ol>
<p>
A <b>sampled data system</b> may consist of components of package <b>Discrete</b>
and of every other purely <b>algebraic</b> input/output block, such
as the components of packages <b>Modelica.Blocks.Math</b>,
<b>Modelica.Blocks.Nonlinear</b> or <b>Modelica.Blocks.Sources</b>.
</p>

</HTML>
", revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New components TriggeredSampler and TriggeredMax added.</li>
<li><i>June 18, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized based on a corresponding library of Dieter Moormann and
       Hilding Elmqvist.</li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  block Sampler "Ideal sampling of continuous signals"
    extends Interfaces.DiscreteSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{-35,0},{30,35}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{-35,0},{30,35}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Samples the continues input signal with a sampling rate defined
via parameter <b>samplePeriod</b>.
</p>
</HTML>
"));
  equation 
    when {sampleTrigger,initial()} then
      y=u;
    end when;
  end Sampler;

  block ZeroOrderHold "Zero order hold of a sampled-data system"
    extends Interfaces.DiscreteSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-78,-42},{-52,-42},{-52,0},{-26,0},{-26,24},{-6,24},{-6,64},{18,64},{18,20},{38,20},{38,0},{44,0},{44,0},{62,0}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  protected 
    Real ySample;
    annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-78,-42},{-52,-42},{-52,0},{-26,0},{-26,24},{-6,24},{-6,64},{18,64},{18,20},{38,20},{38,0},{44,0},{44,0},{62,0}})}), Documentation(info="<HTML>
<p>
The output is identical to the sampled input signal at sample
time instants and holds the output at the value of the last
sample instant during the sample points.
</p>
</HTML>
"));
  equation 
    when {sampleTrigger,initial()} then
      ySample=u;
    end when;
    y=pre(ySample);
  end ZeroOrderHold;

  block FirstOrderHold "First order hold of a sampled-data system"
    extends Interfaces.DiscreteSISO;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-79,-41},{-59,-33},{-40,1},{-20,9},{0,63},{21,20},{41,10},{60,20}}),Line(visible=true, points={{60,19},{81,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  protected 
    Real ySample;
    Real tSample;
    Real c;
    annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-79,-41},{-59,-33},{-40,1},{-20,9},{0,63},{21,20},{41,10},{60,20}}),Line(points={{60,19},{81,10}})}), Documentation(info="<HTML>
<p>
The output signal is the extrapolation through the
values of the last two sampled input signals.
</p>
</HTML>
"));
  equation 
    when sampleTrigger then
      ySample=u;
      tSample=time;
      c=if firstTrigger then 0 else (ySample - pre(ySample))/samplePeriod;
    end when;
    y=pre(ySample) + pre(c)*(time - tSample);
  end FirstOrderHold;

  block UnitDelay "Unit Delay Block"
    parameter Real y_start=0 "Initial value of output signal";
    extends Interfaces.DiscreteSISO;
    annotation(Documentation(info="<html>
<p>
This block describes a unit delay:
</p>
<pre>
          1
     y = --- * u
          z
</pre>
<p>
that is, the output signal y is the input signal u of the
previous sample instant. Before the second sample instant,
the output y is identical to parameter yStart.
</p>

</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-30,0},{30,0}}),Text(visible=true, extent={{-90,10},{90,90}}, textString="1", fontName="Arial"),Text(visible=true, extent={{-90,-90},{90,-10}}, textString="z", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-60,-60},{60,60}}),Text(visible=true, extent={{-160,-10},{-140,10}}, textString="u", fontName="Arial"),Text(visible=true, extent={{115,-10},{135,10}}, textString="y", fontName="Arial"),Line(visible=true, points={{-100,0},{-60,0}}, color={0,0,255}),Line(visible=true, points={{60,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{40,0},{-40,0}}),Text(visible=true, extent={{-55,5},{55,55}}, textString="1", fontName="Arial"),Text(visible=true, extent={{-55,-55},{55,-5}}, textString="z", fontName="Arial")}));
  equation 
    when sampleTrigger then
      y=pre(u);
    end when;
  initial equation 
    y=y_start;
  end UnitDelay;

  block TransferFunction "Discrete Transfer Function block"
    parameter Real b[:]={1} "Numerator coefficients of transfer function.";
    parameter Real a[:]={1,1} "Denominator coefficients of transfer function.";
    extends Interfaces.DiscreteSISO;
    output Real x[size(a, 1) - 1] "State of transfer function from controller canonical form";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{82,0},{-84,0}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, extent={{-92,12},{86,92}}, textString="b(z)", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, extent={{-90,-90},{90,-12}}, textString="a(z)", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-60,-60},{60,60}}),Line(visible=true, points={{40,0},{-44,0}}, thickness=0.5),Text(visible=true, extent={{-54,4},{54,54}}, textString="b(z)", fontName="Arial"),Text(visible=true, extent={{-54,-56},{56,-6}}, textString="a(z)", fontName="Arial"),Line(visible=true, points={{-100,0},{-60,0}}),Line(visible=true, points={{60,0},{100,0}})}));
  protected 
    parameter Integer nb=size(b, 1) "Size of Numerator of transfer function";
    parameter Integer na=size(a, 1) "Size of Denominator of transfer function";
    Real x1;
    Real xext[size(a, 1)];
    annotation(Documentation(info="<html>
<p>The <b>discrete transfer function</b> block defines the
transfer function between the input signal u and the output
signal y. The numerator has the order nb-1, the denominator
has the order na-1.</p>
<pre>          b(1)*z^(nb-1) + b(2)*z^(nb-2) + ... + b(nb)
   y(z) = -------------------------------------------- * u(z)
          a(1)*z^(na-1) + a(2)*z^(na-2) + ... + a(na)
</pre>
<p>State variables <b>x</b> are defined according to
<b>controller canonical</b> form. Initial values of the
states can be set as start values of <b>x</b>.<p>
<p>Example:</p>
<pre>     Blocks.Discrete.TransferFunction g(b = {2,4}, a = {1,3});
</pre>
<p>results in the following transfer function:</p>
<pre>        2*z + 4
   y = --------- * u
         z + 3
</pre>

</HTML>
", revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>November 15, 2000</i>
    by <a href=\"http://www.dynasim.se\">Hans Olsson</a>:<br>
    Converted to when-semantics of Modelica 1.4 with special
    care to avoid unnecessary algebraic loops.</li>
<li><i>June 18, 2000</i>
    by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
    Realized based on a corresponding model of Dieter Moormann
    and Hilding Elmqvist.</li>
</ul>
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{82,0},{-84,0}}, color={0,0,255}),Text(extent={{-92,92},{86,12}}, textString="b(z)", fillColor={0,0,255}),Text(extent={{-90,-12},{90,-90}}, textString="a(z)", fillColor={0,0,255})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-60,60},{60,-60}}, fillPattern=FillPattern.None),Line(points={{40,0},{-44,0}}, color={0,0,0}, thickness=0.5),Text(extent={{-54,54},{54,4}}, textString="b(z)", fillColor={0,0,0}),Text(extent={{-54,-6},{56,-56}}, textString="a(z)", fillColor={0,0,0}),Line(points={{-100,0},{-60,0}}),Line(points={{60,0},{100,0}})}));
  equation 
    when sampleTrigger then
      x1=(u - a[2:size(a, 1)]*pre(x))/a[1];
      xext=vector([x1;pre(x)]);
      x=xext[1:size(x, 1)];
      y=vector([zeros(na - nb, 1);b])*xext;
    end when;
  end TransferFunction;

  block StateSpace "Discrete State Space block"
    parameter Real A[:,size(A, 1)]=[1,0;0,1] "Matrix A of state space model";
    parameter Real B[size(A, 1),:]=[1;1] "Matrix B of state space model";
    parameter Real C[:,size(A, 1)]=[1,1] "Matrix C of state space model";
    parameter Real D[size(C, 1),size(B, 2)]=zeros(size(C, 1), size(B, 2)) "Matrix D of state space model";
    extends Interfaces.DiscreteMIMO(final nin=size(B, 2), final nout=size(C, 1));
    output Real x[size(A, 1)] "State vector";
    annotation(Documentation(info="<html>
<p>
The <b>discrete state space</b> block defines the relation
between the input u=inPort.signal and the output
y=outPort.signal in state space form:
</p>
<pre>
    x = A * pre(x) + B * u
    y = C * pre(x) + D * u
</pre>
<p>
where pre(x) is the value of the discrete state x at
the previous sample time instant.
The input is a vector of length nu, the output is a vector
of length ny and nx is the number of states. Accordingly
</p>
<pre>
        A has the dimension: A(nx,nx),
        B has the dimension: B(nx,nu),
        C has the dimension: C(ny,nx),
        D has the dimension: D(ny,nu)
</pre>
<p>
Example:
</p>
<pre>
     parameter: A = [0.12, 2;3, 1.5]
     parameter: B = [2, 7;3, 1]
     parameter: C = [0.1, 2]
     parameter: D = zeros(ny,nu)

results in the following equations:
  [x[1]]   [0.12  2.00] [pre(x[1])]   [2.0  7.0] [u[1]]
  [    ] = [          ]*[         ] + [        ]*[    ]
  [x[2]]   [3.00  1.50] [pre(x[2])]   [0.1  2.0] [u[2]]
                             [pre(x[1])]            [u[1]]
       y[1]   = [0.1  2.0] * [         ] + [0  0] * [    ]
                             [pre(x[2])]            [u[2]]
</pre>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-90,15},{-15,90}}, textString="A", fontName="Arial"),Text(visible=true, extent={{15,15},{90,90}}, textString="B", fontName="Arial"),Text(visible=true, extent={{-52,-20},{54,28}}, textString="z", fontName="Arial"),Text(visible=true, extent={{-90,-90},{-15,-15}}, textString="C", fontName="Arial"),Text(visible=true, extent={{15,-90},{90,-15}}, textString="D", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-60,-60},{60,60}}),Text(visible=true, extent={{-54,-10},{52,50}}, textString="zx=Ax+Bu", fontName="Arial"),Text(visible=true, extent={{-56,-50},{54,14}}, textString="  y=Cx+Du", fontName="Arial"),Line(visible=true, points={{-102,0},{-60,0}}),Line(visible=true, points={{60,0},{100,0}})}));
  equation 
    when sampleTrigger then
      x=A*pre(x) + B*u;
      y=C*pre(x) + D*u;
    end when;
  end StateSpace;

  block TriggeredSampler "Triggered sampling of continuous signals"
    extends Interfaces.DiscreteBlockIcon;
    replaceable type SignalType= Real "type of input and output signal" annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    parameter SignalType y_start=0 "initial value of output signal";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{0,-100},{0,-26}}, color={255,0,255}),Line(visible=true, points={{-35,0},{28,-48}}, color={0,0,255})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{-35,0},{28,-48}}, color={0,0,255}),Line(visible=true, points={{0,-100},{0,-26}}, color={255,0,255})}), Documentation(info="<HTML>
<p>
Samples the continuous input signal whenever the trigger input
signal is rising (i.e., trigger changes from <b>false</b> to
<b>true</b>) and provides the sampled input signal as output.
Before the first sampling, the output signal is equal to
the initial value defined via parameter <b>y0</b>.
</p>
</HTML>
"));
    Modelica.Blocks.Interfaces.RealInput u(redeclare type SignalType= SignalType ) "Connector with an input signal of type SignalType" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y(redeclare type SignalType= SignalType ) "Connector with an output signal of type SignalType" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput trigger annotation(Placement(visible=true, transformation(origin={1.77636e-15,-120}, extent={{-20,-20},{20,20}}, rotation=-270), iconTransformation(origin={0,-120}, extent={{-20,-20},{20,20}}, rotation=-270)));
  equation 
    when trigger then
      y=u;
    end when;
  initial equation 
    y=y_start;
  end TriggeredSampler;

  block TriggeredMax "Compute maximum, absolute value of continuous signal at trigger instants"
    extends Interfaces.DiscreteBlockIcon;
    replaceable type SignalType= Real "type of input and output signal" annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{0,-100},{0,-26}}, color={255,0,255}),Line(visible=true, points={{-35,0},{28,-48}}, color={0,0,255}),Text(visible=true, extent={{-86,24},{82,82}}, textString="max", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-45,-10},{-25,10}}),Ellipse(visible=true, lineColor={0,0,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{25,-10},{45,10}}),Line(visible=true, points={{-100,0},{-45,0}}, color={0,0,255}),Line(visible=true, points={{45,0},{100,0}}, color={0,0,255}),Line(visible=true, points={{-35,0},{28,-48}}, color={0,0,255}),Line(visible=true, points={{0,-100},{0,-26}}, color={255,0,255})}), Documentation(info="<HTML>
<p>
Samples the continuous input signal whenever the trigger input
signal is rising (i.e., trigger changes from <b>false</b> to
<b>true</b>). The maximum, absolute value of the input signal
at the sampling point is provided as output signal.
</p>
</HTML>
"));
    Modelica.Blocks.Interfaces.RealInput u(redeclare type SignalType= SignalType ) "Connector with an input signal of type SignalType" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Modelica.Blocks.Interfaces.RealOutput y(redeclare type SignalType= SignalType ) "Connector with an output signal of type SignalType" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Blocks.Interfaces.BooleanInput trigger annotation(Placement(visible=true, transformation(origin={-2.66454e-15,-120}, extent={{-20,-20},{20,20}}, rotation=-270), iconTransformation(origin={-4.44089e-16,-120}, extent={{-20,-20},{20,20}}, rotation=-270)));
  equation 
    when trigger then
      y=max(pre(y), abs(u));
    end when;
  initial equation 
    y=0;
  end TriggeredMax;

end Discrete;
