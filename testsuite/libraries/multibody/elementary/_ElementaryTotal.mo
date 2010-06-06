package ModelicaServices
  "Models and functions used in the Modelica Standard Library requiring a tool specific implementation"
annotation (preferredView="info",
version="1.0",
versionDate="2009-06-21",
versionBuild=2,
revisionId="$Id: package.mo,v 1.1.1.2 2009/08/18 12:40:29 Dag Exp $",
  Documentation(info="<html>
<p>
This package contains a set of functions and models to be used in the
Modelica Standard Library that requires a tool specific implementation.
These are:
</p>

<ul>
<li> <a href=\"Modelica://ModelicaServices.Animation.Shape\">ModelicaServices.Animation.Shape</a>.
     provides a 3-dim. visualization of
     mechanical objects. It is used in
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>
     via inheritance.</li>
</ul>

<p>
<b>Licensed by DLR and Dynasim under the Modelica License 2</b><br>
Copyright &copy; 2009, DLR and Dynasim.
</p>

<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty)
<a href=\"Modelica://ModelicaServices.UsersGuide.ModelicaLicense2\">here</a></u>
or at
<a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">
http://www.Modelica.org/licenses/ModelicaLicense2</a>.
</p>

</html>"),
  uses(Modelica(version="3.1")));

package Animation "Models and functions for 3-dim. animation"

model Shape
  "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"
  extends
    Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;

    import T = Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
    import SI = Modelica.SIunits;
    import Modelica.Mechanics.MultiBody.Frames;
    import Modelica.Mechanics.MultiBody.Types;

      function PackShape
        input Types.ShapeType shapeType;
        output Real pack;
      algorithm 
        pack := 1.2;
        annotation(Inline=true);
      end PackShape;

      function PackMaterial
        input Real material1;
        input Real material2;
        input Real material3;
        input Types.SpecularCoefficient sp;
        output Real mat;
      algorithm 
        mat := material1 + material2 + material3 + sp;
        annotation(Inline=true);
      end PackMaterial;

protected
  Real abs_n_x(final unit="1")=Modelica.Math.Vectors.length(
                             lengthDirection) annotation (HideResult=true);
  Real e_x[3](each final unit="1")=noEvent(if abs_n_x < 1.e-10 then {1,0,0} else lengthDirection
      /abs_n_x) annotation (HideResult=true);
  Real n_z_aux[3](each final unit="1")=cross(e_x, widthDirection) annotation (HideResult=true);
  Real e_y[3](each final unit="1")=noEvent(cross(Modelica.Math.Vectors.normalize(
                                             cross(e_x, if n_z_aux*n_z_aux
       > 1.0e-6 then widthDirection else (if abs(e_x[1]) > 1.0e-6 then {0,1,
      0} else {1,0,0}))), e_x)) annotation (HideResult=true);
  output Real Form annotation (HideResult=false);
public
  output Real rxvisobj[3](each final unit="1")
    "x-axis unit vector of shape, resolved in world frame" 
    annotation (HideResult=false);
  output Real ryvisobj[3](each final unit="1")
    "y-axis unit vector of shape, resolved in world frame" 
    annotation (HideResult=false);
  output SI.Position rvisobj[3]
    "position vector from world frame to shape frame, resolved in world frame" 
    annotation (HideResult=false);

protected
  output SI.Length size[3] "{length,width,height} of shape" 
    annotation (HideResult=false);
  output Real Material annotation (HideResult=false);
  output Real Extra annotation (HideResult=false);

  annotation (
    Icon(coordinateSystem(
        preserveAspectRatio=true,
        extent={{-100,-100},{100,100}},
        grid={2,2}), graphics={
          Rectangle(
            extent={{-100,-100},{80,60}},
            lineColor={0,0,255},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}},
            lineColor={0,0,255},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Polygon(
            points={{100,100},{100,-60},{80,-100},{80,60},{100,100}},
            lineColor={0,0,255},
            fillColor={160,160,164},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-100,-100},{80,60}},
            lineColor={0,0,0},
            textString="%shapeType"),
          Text(
            extent={{-132,160},{128,100}},
            textString="%name",
            lineColor={0,0,255})}),
    Documentation(info="<html>

<p>
This model is documented at
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>.
</p>


</html>
"));
equation
  /* Outputs to file. */
  Form = (987000 + PackShape(shapeType))*1E20;
  /*
  rxry = Frames.TransformationMatrices.to_exy(
    Frames.TransformationMatrices.absoluteRotation(R.T,
    Frames.TransformationMatrices.from_nxy(lengthDirection, widthDirection)));
  rxvisobj = rxry[:, 1];
  ryvisobj = rxry[:, 2];
*/
  rxvisobj = transpose(R.T)*e_x;
  ryvisobj = transpose(R.T)*e_y;
  rvisobj = r + T.resolve1(R.T, r_shape);
  size = {length,width,height};
  Material = PackMaterial(color[1]/255.0, color[2]/255.0, color[3]/255.0,
    specularCoefficient);
  Extra = extra;
end Shape;
end Animation;
end ModelicaServices;

package Modelica "Modelica Standard Library (Version 3.1)"
extends Modelica.Icons.Library;

  package Blocks
  "Library of basic input/output control blocks (continuous, discrete, logical, table blocks)"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;

    package Interfaces
    "Library of connectors and partial models for input/output blocks"
      import Modelica.SIunits;
        extends Modelica.Icons.Library;
        annotation (
          Documentation(info="<HTML>
<p>
This package contains interface definitions for
<b>continuous</b> input/output blocks with Real,
Integer and Boolean signals. Furthermore, it contains
partial models for continuous and discrete blocks.
</p>

</HTML>
",     revisions="<html>
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
"));

    connector RealInput = input Real "'input Real' as connector" 
      annotation (defaultComponentName="u",
      Icon(graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid)},
           coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.2)),
      Diagram(coordinateSystem(
            preserveAspectRatio=true, initialScale=0.2,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{0,50},{100,0},{0,-50},{0,50}},
              lineColor={0,0,127},
              fillColor={0,0,127},
              fillPattern=FillPattern.Solid), Text(
              extent={{-10,85},{-10,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one input signal of type Real.
</p>
</html>"));

    connector RealOutput = output Real "'output Real' as connector" 
      annotation (defaultComponentName="y",
      Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,100},{100,0},{-100,-100},{-100,100}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid)}),
      Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={Polygon(
              points={{-100,50},{0,0},{-100,-50},{-100,50}},
              lineColor={0,0,127},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid), Text(
              extent={{30,110},{30,60}},
              lineColor={0,0,127},
              textString="%name")}),
        Documentation(info="<html>
<p>
Connector with one output signal of type Real.
</p>
</html>"));

        partial block BlockIcon "Basic graphical layout of input/output block"

          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={Rectangle(
                extent={{-100,-100},{100,100}},
                lineColor={0,0,127},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid), Text(
                extent={{-150,150},{150,110}},
                textString="%name",
                lineColor={0,0,255})}),
          Documentation(info="<html>
<p>
Block that has only the basic icon for an input/output
block (no declarations, no equations). Most blocks
of package Modelica.Blocks inherit directly or indirectly
from this block.
</p>
</html>"));

        end BlockIcon;

        partial block SO "Single Output continuous control block"
          extends BlockIcon;

          RealOutput y "Connector of Real output signal" 
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));
          annotation (
            Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics),
          Documentation(info="<html>
<p>
Block has one continuous Real output signal.
</p>
</html>"));

        end SO;

        partial block MO "Multiple Output continuous control block"
          extends BlockIcon;

          parameter Integer nout(min=1) = 1 "Number of outputs";
          RealOutput y[nout] "Connector of Real output signals" 
            annotation (Placement(transformation(extent={{100,-10},{120,10}},
                rotation=0)));
          annotation (
            Documentation(info="<html>
<p>
Block has one continuous Real output signal vector.
</p>
</html>"));

        end MO;
    end Interfaces;

    package Sources
    "Library of signal source blocks generating Real and Boolean signals"
      import Modelica.Blocks.Interfaces;
      import Modelica.SIunits;
          extends Modelica.Icons.Library;
          annotation (
            Documentation(info="<HTML>
<p>
This package contains <b>source</b> components, i.e., blocks which
have only output signals. These blocks are used as signal generators
for Real, Integer and Boolean signals.
</p>

<p>
All Real source signals (with the exception of the Constant source)
have at least the following two parameters:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>offset</b></td>
      <td valign=\"top\">Value which is added to the signal</td>
  </tr>
  <tr><td valign=\"top\"><b>startTime</b></td>
      <td valign=\"top\">Start time of signal. For time &lt; startTime,
                the output y is set to offset.</td>
  </tr>
</table>

<p>
The <b>offset</b> parameter is especially useful in order to shift
the corresponding source, such that at initial time the system
is stationary. To determine the corresponding value of offset,
usually requires a trimming calculation.
</p>
</HTML>
",     revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Integer sources added. Step, TimeTable and BooleanStep slightly changed.</li>
<li><i>Nov. 8, 1999</i>
       by <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <A HREF=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</A>,
       <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New sources: Exponentials, TimeTable. Trapezoid slightly enhanced
       (nperiod=-1 is an infinite number of periods).</li>
<li><i>Oct. 31, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       <a href=\"mailto:clauss@eas.iis.fhg.de\">Christoph Clau&szlig;</a>,
       <A HREF=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</A>,
       All sources vectorized. New sources: ExpSine, Trapezoid,
       BooleanConstant, BooleanStep, BooleanPulse, SampleTrigger.
       Improved documentation, especially detailed description of
       signals in diagram layer.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));

          block Constant "Generate constant signal of type Real"
            parameter Real k(start=1) "Constant output value";
            extends Interfaces.SO;

            annotation (defaultComponentName="const",
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
              Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,0},{80,0}}, color={0,0,0}),
              Text(
                extent={{-150,-150},{150,-110}},
                lineColor={0,0,0},
                textString="k=%k")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
              Polygon(
                points={{-80,90},{-86,68},{-74,68},{-80,90}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
              Line(
                points={{-80,0},{80,0}},
                color={0,0,255},
                thickness=0.5),
              Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
              Polygon(
                points={{90,-70},{68,-64},{68,-76},{90,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-83,92},{-30,74}},
                lineColor={0,0,0},
                textString="y"),
              Text(
                extent={{70,-80},{94,-100}},
                lineColor={0,0,0},
                textString="time"),
              Text(
                extent={{-101,8},{-81,-12}},
                lineColor={0,0,0},
                textString="k")}),
          Documentation(info="<html>
<p>
The Real output y is a constant signal:
</p>

<p>
<img src=\"../Images/Blocks/Sources/Constant.png\">
</p>
</html>"));
          equation
            y = k;
          end Constant;

          block Sine "Generate sine signal"
            parameter Real amplitude=1 "Amplitude of sine wave";
            parameter SIunits.Frequency freqHz(start=1)
        "Frequency of sine wave";
            parameter SIunits.Angle phase=0 "Phase of sine wave";
            parameter Real offset=0 "Offset of output signal";
            parameter SIunits.Time startTime=0
        "Output = offset for time < startTime";
            extends Interfaces.SO;
    protected
            constant Real pi=Modelica.Constants.pi;
            annotation (
              Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{68,0}}, color={192,192,192}),
              Polygon(
                points={{90,0},{68,8},{68,-8},{90,0}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,
                    74.6},{-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,
                    59.4},{-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,
                    -64.2},{29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},
                    {57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,0}),
              Text(
                extent={{-147,-152},{153,-112}},
                lineColor={0,0,0},
                textString="freqHz=%freqHz")}),
              Diagram(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={1,1}), graphics={
              Line(points={{-80,-90},{-80,84}}, color={95,95,95}),
              Polygon(
                points={{-80,97},{-84,81},{-76,81},{-80,97}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{-99,-40},{85,-40}}, color={95,95,95}),
              Polygon(
                points={{97,-40},{81,-36},{81,-45},{97,-40}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(
                points={{-41,-2},{-31.6,34.2},{-26.1,53.1},{-21.3,66.4},{-17.1,74.6},
                    {-12.9,79.1},{-8.64,79.8},{-4.42,76.6},{-0.201,69.7},{4.02,59.4},
                    {8.84,44.1},{14.9,21.2},{27.5,-30.8},{33,-50.2},{37.8,-64.2},{
                    42,-73.1},{46.2,-78.4},{50.5,-80},{54.7,-77.6},{58.9,-71.5},{
                    63.1,-61.9},{67.9,-47.2},{74,-24.8},{80,0}},
                color={0,0,255},
                thickness=0.5),
              Line(
                points={{-41,-2},{-80,-2}},
                color={0,0,255},
                thickness=0.5),
              Text(
                extent={{-87,12},{-40,0}},
                lineColor={0,0,0},
                textString="offset"),
              Line(points={{-41,-2},{-41,-40}}, color={95,95,95}),
              Text(
                extent={{-60,-43},{-14,-54}},
                lineColor={0,0,0},
                textString="startTime"),
              Text(
                extent={{75,-47},{100,-60}},
                lineColor={0,0,0},
                textString="time"),
              Text(
                extent={{-80,99},{-40,82}},
                lineColor={0,0,0},
                textString="y"),
              Line(points={{-9,79},{43,79}}, color={95,95,95}),
              Line(points={{-41,-2},{50,-2}}, color={95,95,95}),
              Polygon(
                points={{33,79},{30,66},{37,66},{33,79}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{37,57},{83,39}},
                lineColor={0,0,0},
                textString="amplitude"),
              Polygon(
                points={{33,-2},{30,11},{36,11},{33,-2},{33,-2}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{33,77},{33,-2}}, color={95,95,95})}),
          Documentation(info="<html>
<p>
The Real output y is a sine signal:
</p>

<p>
<img src=\"../Images/Blocks/Sources/Sine.png\">
</p>
</html>"));

          equation
            y = offset + (if time < startTime then 0 else amplitude*
              Modelica.Math.sin(2*pi*freqHz*(time - startTime) + phase));
          end Sine;

      model CombiTimeTable
      "Table look-up with respect to time and linear/perodic extrapolation methods (data from matrix/file)"

        parameter Boolean tableOnFile=false
        "= true, if table is defined on file or in function usertab" 
          annotation(Dialog(group="table data definition"));
        parameter Real table[:, :] = fill(0.0,0,2)
        "Table matrix (time = first column; e.g. table=[0,2])" 
             annotation(Dialog(group="table data definition", enable = not tableOnFile));
        parameter String tableName="NoName"
        "Table name on file or in function usertab (see docu)" 
             annotation(Dialog(group="table data definition", enable = tableOnFile));
        parameter String fileName="NoName" "File where matrix is stored" 
             annotation(Dialog(group="table data definition", enable = tableOnFile,
                               __Dymola_loadSelector(filter="Text files (*.txt);;Matlab files (*.mat)",
                               caption="Open file in which table is present")));
        parameter Integer columns[:]=2:size(table, 2)
        "Columns of table to be interpolated" 
        annotation(Dialog(group="table data interpretation"));
        parameter Modelica.Blocks.Types.Smoothness smoothness=Modelica.Blocks.Types.Smoothness.LinearSegments
        "Smoothness of table interpolation" 
        annotation(Dialog(group="table data interpretation"));
        parameter Modelica.Blocks.Types.Extrapolation extrapolation=Modelica.Blocks.Types.Extrapolation.LastTwoPoints
        "Extrapolation of data outside the definition range" 
        annotation(Dialog(group="table data interpretation"));
        parameter Real offset[:]={0} "Offsets of output signals" 
        annotation(Dialog(group="table data interpretation"));
        parameter Modelica.SIunits.Time startTime=0
        "Output = offset for time < startTime" 
        annotation(Dialog(group="table data interpretation"));
        extends Modelica.Blocks.Interfaces.MO(final nout=max([size(columns, 1); size(offset, 1)]));
        final parameter Real t_min(fixed=false)
        "Minimum abscissa value defined in table";
        final parameter Real t_max(fixed=false)
        "Maximum abscissa value defined in table";

        annotation (
          Documentation(info="<HTML>
<p>
This block generates an output signal y[:] by <b>linear interpolation</b> in
a table. The time points and function values are stored in a matrix
<b>table[i,j]</b>, where the first column table[:,1] contains the
time points and the other columns contain the data to be interpolated.
</p>

<p>
<img src=\"../Images/Blocks/Sources/CombiTimeTable.png\">
</p>

<p>
Via parameter <b>columns</b> it can be defined which columns of the
table are interpolated. If, e.g., columns={2,4}, it is assumed that
2 output signals are present and that the first output is computed
by interpolation of column 2 and the second output is computed
by interpolation of column 4 of the table matrix.
The table interpolation has the following properties:
</p>
<ul>
<li>The time points need to be <b>monotonically increasing</b>. </li>
<li><b>Discontinuities</b> are allowed, by providing the same
    time point twice in the table. </li>
<li>Values <b>outside</b> of the table range, are computed by
    extrapolation according to the setting of parameter
    <b>extrapolation</b>:
<pre>
  extrapolation = 0: hold the first or last value of the table,
                     if outside of the range.
                = 1: extrapolate through the last or first two
                     points of the table.
                = 2: periodically repeat the table data
                     (periodical function).
</pre></li>
<li>Via parameter <b>smoothness</b> it is defined how the data is interpolated:
<pre>
  smoothness = 0: linear interpolation
             = 1: smooth interpolation with Akima Splines such
                  that der(y) is continuous.
</pre></li>
<li>If the table has only <b>one row</b>, no interpolation is performed and
    the table values of this row are just returned.</li>
<li>Via parameters <b>startTime</b> and <b>offset</b> the curve defined
    by the table can be shifted both in time and in the ordinate value.
    The time instants stored in the table are therefore <b>relative</b>
    to <b>startTime</b>.
    If time &lt; startTime, no interpolation is performed and the offset
    is used as ordinate value for all outputs.
<li>The table is implemented in a numerically sound way by
    generating <b>time events</b> at interval boundaries,
    in order to not integrate over a discontinuous or not differentiable
    points.
<li>For special applications it is sometimes needed to know the minimum
    and maximum time instant defined in the table as a parameter. For this
    reason parameters <b>t_min</b> and <b>t_max</b> are provided and can be access from
    the outside of the table object.
</li>
</ul>
<p>
Example:
</p>
<pre>
   table = [0  0
            1  0
            1  1
            2  4
            3  9
            4 16]; extrapolation = 1 (default)
If, e.g., time = 1.0, the output y =  0.0 (before event), 1.0 (after event)
    e.g., time = 1.5, the output y =  2.5,
    e.g., time = 2.0, the output y =  4.0,
    e.g., time = 5.0, the output y = 23.0 (i.e. extrapolation via last 2 points).
</pre>
<p>
The table matrix can be defined in the following ways:
</p>
<ol>
<li> Explicitly supplied as <b>parameter matrix</b> \"table\",
     and the other parameters have the following values:
<pre>
   tableName is \"NoName\" or has only blanks,
   fileName  is \"NoName\" or has only blanks.
</pre></li>
<li> <b>Read</b> from a <b>file</b> \"fileName\" where the matrix is stored as
      \"tableName\". Both ASCII and binary file format is possible.
      (the ASCII format is described below).
      It is most convenient to generate the binary file from Matlab
      (Matlab 4 storage format), e.g., by command
<pre>
   save tables.mat tab1 tab2 tab3 -V4
</pre>
      when the three tables tab1, tab2, tab3 should be
      used from the model.</li>
<li>  Statically stored in function \"usertab\" in file \"usertab.c\".
      The matrix is identified by \"tableName\". Parameter
      fileName = \"NoName\" or has only blanks.</li>
</ol>
<p>
Table definition methods (1) and (3) do <b>not</b> allocate dynamic memory,
and do not access files, whereas method (2) does. Therefore (1) and (3)
are suited for hardware-in-the-loop simulation (e.g. with dSpace hardware).
When the constant \"NO_FILE\" is defined in \"usertab.c\", all parts of the
source code of method (2) are removed by the C-preprocessor, such that
no dynamic memory allocation and no access to files takes place.
</p>
<p>
If tables are read from an ASCII-file, the file need to have the
following structure (\"-----\" is not part of the file content):
</p>
<pre>
-----------------------------------------------------
#1
double tab1(6,2)   # comment line
  0   0
  1   0
  1   1
  2   4
  3   9
  4  16
double tab2(6,2)   # another comment line
  0   0
  2   0
  2   2
  4   8
  6  18
  8  32
-----------------------------------------------------
</pre>
<p>
Note, that the first two characters in the file need to be
\"#1\". Afterwards, the corresponding matrix has to be declared
with type, name and actual dimensions. Finally, in successive
rows of the file, the elements of the matrix have to be given.
Several matrices may be defined one after another.
</p>

</HTML>
",     revisions="<html>
<p><b>Release Notes:</b></p>
<ul>
<li><i>March 31, 2001</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Used CombiTableTime as a basis and added the
       arguments <b>extrapolation, columns, startTime</b>.
       This allows periodic function definitions. </li>
</ul>
</html>"),Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                  100}}), graphics={
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,68},{-80,-80}}, color={192,192,192}),
              Line(points={{-90,-70},{82,-70}}, color={192,192,192}),
              Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={192,192,192},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-48,70},{2,-50}},
                lineColor={255,255,255},
                fillColor={255,255,0},
                fillPattern=FillPattern.Solid),
              Line(points={{-48,-50},{-48,70},{52,70},{52,-50},{-48,-50},{-48,-20},
                    {52,-20},{52,10},{-48,10},{-48,40},{52,40},{52,70},{2,70},{2,-51}},
                  color={0,0,0})}),
          Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                  100,100}}), graphics={
              Polygon(
                points={{-80,90},{-88,68},{-72,68},{-80,90}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{-80,68},{-80,-80}}, color={95,95,95}),
              Line(points={{-90,-70},{82,-70}}, color={95,95,95}),
              Polygon(
                points={{90,-70},{68,-62},{68,-78},{90,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Rectangle(
                extent={{-20,90},{20,-30}},
                lineColor={255,255,255},
                fillColor={192,192,192},
                fillPattern=FillPattern.Solid),
              Line(points={{-20,-30},{-20,90},{80,90},{80,-30},{-20,-30},{-20,0},{
                    80,0},{80,30},{-20,30},{-20,60},{80,60},{80,90},{20,90},{20,-30}},
                  color={0,0,0}),
              Text(
                extent={{-71,-42},{-32,-54}},
                lineColor={0,0,0},
                textString="offset"),
              Polygon(
                points={{-31,-30},{-33,-40},{-28,-40},{-31,-30}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Polygon(
                points={{-31,-70},{-34,-60},{-29,-60},{-31,-70},{-31,-70}},
                lineColor={95,95,95},
                fillColor={95,95,95},
                fillPattern=FillPattern.Solid),
              Line(points={{-31,-31},{-31,-70}}, color={95,95,95}),
              Line(points={{-20,-30},{-20,-70}}, color={95,95,95}),
              Text(
                extent={{-42,-74},{6,-84}},
                lineColor={0,0,0},
                textString="startTime"),
              Line(points={{-20,-30},{-80,-30}}, color={95,95,95}),
              Text(
                extent={{-73,93},{-44,74}},
                lineColor={0,0,0},
                textString="y"),
              Text(
                extent={{66,-81},{92,-92}},
                lineColor={0,0,0},
                textString="time"),
              Text(
                extent={{-19,83},{20,68}},
                lineColor={0,0,0},
                textString="time"),
              Text(
                extent={{21,82},{50,68}},
                lineColor={0,0,0},
                textString="y[1]"),
              Line(points={{50,90},{50,-30}}, color={0,0,0}),
              Line(points={{80,0},{100,0}}, color={0,0,255}),
              Text(
                extent={{34,-30},{71,-42}},
                textString="columns",
                lineColor={0,0,255}),
              Text(
                extent={{51,82},{80,68}},
                lineColor={0,0,0},
                textString="y[2]")}));
    protected
        final parameter Real p_offset[nout]=(if size(offset, 1) == 1 then ones(nout)
             *offset[1] else offset);

        Integer tableID;

        function tableTimeInit
        "Initialize 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input String tableName;
          input String fileName;
          input Real table[ :, :];
          input Real startTime;
          input Modelica.Blocks.Types.Smoothness smoothness;
          input Modelica.Blocks.Types.Extrapolation extrapolation;
          output Integer tableID;
        external "C" tableID = ModelicaTables_CombiTimeTable_init(
                       tableName, fileName, table, size(table, 1), size(table, 2),
                       startTime, smoothness, extrapolation);
          annotation(Library="ModelicaExternalC");
        end tableTimeInit;

        function tableTimeIpo
        "Interpolate 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          input Integer icol;
          input Real timeIn;
          output Real value;
        external "C" value = 
                           ModelicaTables_CombiTimeTable_interpolate(tableID, icol, timeIn);
          annotation(Library="ModelicaExternalC");
        end tableTimeIpo;

        function tableTimeTmin
        "Return minimum time value of 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          output Real Tmin "minimum time value in table";
        external "C" Tmin = 
                          ModelicaTables_CombiTimeTable_minimumTime(tableID);
          annotation(Library="ModelicaExternalC");
        end tableTimeTmin;

        function tableTimeTmax
        "Return maximum time value of 1-dim. table where first column is time (for details see: Modelica/C-Sources/ModelicaTables.h)"
          input Integer tableID;
          output Real Tmax "maximum time value in table";
        external "C" Tmax = 
                          ModelicaTables_CombiTimeTable_maximumTime(tableID);
          annotation(Library="ModelicaExternalC");
        end tableTimeTmax;

      equation
        if tableOnFile then
          assert(tableName<>"NoName", "tableOnFile = true and no table name given");
        end if;
        if not tableOnFile then
          assert(size(table,1) > 0 and size(table,2) > 0, "tableOnFile = false and parameter table is an empty matrix");
        end if;
        for i in 1:nout loop
          y[i] = p_offset[i] + tableTimeIpo(tableID, columns[i], time);
        end for;
        when initial() then
          tableID=tableTimeInit((if not tableOnFile then "NoName" else tableName),
                                (if not tableOnFile then "NoName" else fileName), table,
                                startTime, smoothness, extrapolation);
        end when;
      initial equation
          t_min=tableTimeTmin(tableID);
          t_max=tableTimeTmax(tableID);
      end CombiTimeTable;
    end Sources;

    package Types
    "Library of constants and types with choices, especially to build menus"
      extends Modelica.Icons.Library;
      annotation ( Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"));

      type Smoothness = enumeration(
        LinearSegments "Table points are linearly interpolated",
        ContinuousDerivative
          "Table points are interpolated such that the first derivative is continuous")
      "Enumeration defining the smoothness of table interpolation" 
        annotation (Documentation(info="<html>

</html>"));

    type Extrapolation = enumeration(
        HoldLastPoint "Hold the last table point outside of the table scope",
        LastTwoPoints
          "Extrapolate linearly through the last two table points outside of the table scope", 

        Periodic "Repeat the table scope periodically")
      "Enumeration defining the extrapolation of time table interpolation" 
            annotation ( Documentation(info="<html>

</html>"));
    end Types;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(extent={{-32,-6},{16,-35}}, lineColor={0,0,0}),
        Rectangle(extent={{-32,-56},{16,-85}}, lineColor={0,0,0}),
        Line(points={{16,-20},{49,-20},{49,-71},{16,-71}}, color={0,0,0}),
        Line(points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}, color={0,0,0}),
        Polygon(
          points={{16,-71},{29,-67},{29,-74},{16,-71}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
                            Documentation(info="<html>
<p>
This library contains input/output blocks to build up block diagrams.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>
</HTML>
",   revisions="<html>
<ul>
<li><i>June 23, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced new block connectors and adapated all blocks to the new connectors.
       Included subpackages Continuous, Discrete, Logical, Nonlinear from
       package ModelicaAdditions.Blocks.
       Included subpackage ModelicaAdditions.Table in Modelica.Blocks.Sources
       and in the new package Modelica.Blocks.Tables.
       Added new blocks to Blocks.Sources and Blocks.Logical.
       </li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New subpackage Examples, additional components.
       </li>
<li><i>June 20, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
       Michael Tiller:<br>
       Introduced a replaceable signal type into
       Blocks.Interfaces.RealInput/RealOutput:
<pre>
   replaceable type SignalType = Real
</pre>
       in order that the type of the signal of an input/output block
       can be changed to a physical type, for example:
<pre>
   Sine sin1(outPort(redeclare type SignalType=Modelica.SIunits.Torque))
</pre>
      </li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed to Blocks. New subpackages Math, Nonlinear.
       Additional components in subpackages Interfaces, Continuous
       and Sources. </li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version, based on an existing Dymola library
       of Dieter Moormann and Hilding Elmqvist.</li>
</ul>
</html>"));
  end Blocks;

  package Mechanics
  "Library of 1-dim. and 3-dim. mechanical components (multi-body, rotational, translational)"
  extends Modelica.Icons.Library2;

    package MultiBody "Library to model 3-dimensional mechanical systems"
    import SI = Modelica.SIunits;
    extends Modelica.Icons.Library;

    model World
      "World coordinate system + gravity field + default animation definition"

      import SI = Modelica.SIunits;
      import Modelica.Mechanics.MultiBody.Types.GravityTypes;
      import Modelica.Mechanics.MultiBody.Types;

        Interfaces.Frame_b frame_b
        "Coordinate system fixed in the origin of the world frame" 
                                   annotation (Placement(transformation(extent={{84,
                -16},{116,16}}, rotation=0)));

      annotation (
        defaultComponentName="world",
        defaultComponentPrefixes="inner",
        missingInnerMessage="No \"world\" component is defined. A default world
component with the default gravity field will be used
(g=9.81 in negative y-axis). If this is not desired,
drag Modelica.Mechanics.MultiBody.World into the top level of your model.",
        Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics={
            Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-100,-118},{-100,61}},
              color={0,0,0},
              thickness=0.5),
            Polygon(
              points={{-100,100},{-120,60},{-80,60},{-100,100},{-100,100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Line(
              points={{-119,-100},{59,-100}},
              color={0,0,0},
              thickness=0.5),
            Polygon(
              points={{99,-100},{59,-80},{59,-120},{99,-100}},
              lineColor={0,0,0},
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-140,165},{140,103}},
              textString="%name",
              lineColor={0,0,255}),
            Text(
              extent={{95,-113},{144,-162}},
              lineColor={0,0,0},
              textString="%label1"),
            Text(
              extent={{-170,127},{-119,77}},
              lineColor={0,0,0},
              textString="%label2"),
            Line(points={{-56,78},{-56,-26}}, color={0,0,255}),
            Polygon(
              points={{-68,-26},{-56,-66},{-44,-26},{-68,-26}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{2,78},{2,-26}}, color={0,0,255}),
            Polygon(
              points={{-10,-26},{2,-66},{14,-26},{-10,-26}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Line(points={{66,80},{66,-26}}, color={0,0,255}),
            Polygon(
              points={{54,-26},{66,-66},{78,-26},{54,-26}},
              fillColor={0,0,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}),
        Diagram(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={2,2}), graphics),
        Documentation(info="<HTML>
<p>
Model <b>World</b> represents a global coordinate system fixed in
ground. This model serves several purposes:
<ul>
<li> It is used as <b>inertial system</b> in which
     the equations of all elements of the MultiBody library
     are defined.</li>
<li> It is the world frame of an <b>animation window</b> in which
     all elements of the MultiBody library are visualized.</li>
<li> It is used to define the <b>gravity field</b> in which a
     multi-body model is present. Default is a uniform gravity
     field where the gravity acceleration vector g is the
     same at every position. Additionally, a point gravity field
     can be selected.</li>
<li> It is used to define <b>default settings</b> of animation properties
     (e.g. the diameter of a sphere representing by default
     the center of mass of a body, or the diameters of the cylinders
     representing a revolute joint).</li>
<li> It is used to define a <b>visual representation</b> of the
     world model (= 3 coordinate axes with labels) and of the defined
     gravity field.<br>
    <IMG SRC=\"../Images/MultiBody/world.png\" ALT=\"MultiBodys.World\">
</li>
</ul>
<p>
Since the gravity field function is required from all bodies with mass
and the default settings of animation properties are required
from nearly every component, exactly one instance of model World needs
to be present in every model on the top level. The basic declaration
needs to be:
</p>
<pre>
    <b>inner</b> Modelica.Mechanics.MultiBody.World world
</pre>
<p>
Note, it must be an <b>inner</b> declaration with instance name <b>world</b>
in order that this world object can be accessed from all objects in the
model. When dragging the \"World\" object from the package browser into
the diagram layer, this declaration is automatically generated
(this is defined via annotations in model World).
</p>
<p>
All vectors and tensors of a mechanical system are resolved in a
frame that is local to the corresponding component. Usually,
if all relative joint coordinates vanish, the local frames
of all components are parallel to each other, as well as to the
world frame (this holds as long as a Parts.FixedRotation,
component is <b>not</b> used). In this \"reference configuration\"
it is therefore
alternatively possible to resolve all vectors in the world
frame, since all frames are parallel to each other.
This is often very convenient. In order to give some visual
support in such a situation, in the icon of a World instance
two axes of the world frame are shown and the labels
of these axes can be set via parameters.
</p>
</HTML>
"));

      parameter Boolean enableAnimation=true
        "= true, if animation of all components is enabled";
      parameter Boolean animateWorld=true
        "= true, if world coordinate system shall be visualized" annotation(Dialog(enable=enableAnimation));
      parameter Boolean animateGravity=true
        "= true, if gravity field shall be visualized (acceleration vector or field center)"
                                                                                              annotation(Dialog(enable=enableAnimation));
      parameter Types.AxisLabel label1="x" "Label of horizontal axis in icon";
      parameter Types.AxisLabel label2="y" "Label of vertical axis in icon";
      parameter Types.GravityTypes gravityType=GravityTypes.UniformGravity
        "Type of gravity field"                                                                                                     annotation (Evaluate=true);
      parameter SI.Acceleration g=9.81 "Constant gravity acceleration" 
        annotation (Dialog(enable=gravityType == GravityTypes.UniformGravity));
      parameter Types.Axis n={0,-1,0}
        "Direction of gravity resolved in world frame (gravity = g*n/length(n))"
        annotation (Evaluate=true, Dialog(enable=gravityType == Modelica.Mechanics.
              MultiBody.Types.GravityTypes.UniformGravity));
      parameter Real mue(
        unit="m3/s2",
        min=0) = 3.986e14
        "Gravity field constant (default = field constant of earth)" 
        annotation (Dialog(enable=gravityType == Types.GravityTypes.PointGravity));
      parameter Boolean driveTrainMechanics3D=true
        "= true, if 3-dim. mechanical effects of Parts.Mounting1D/Rotor1D/BevelGear1D shall be taken into account";

      parameter SI.Distance axisLength=nominalLength/2
        "Length of world axes arrows" 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
      parameter SI.Distance axisDiameter=axisLength/defaultFrameDiameterFraction
        "Diameter of world axes arrows" 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
      parameter Boolean axisShowLabels=true "= true, if labels shall be shown" 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
      input Types.Color axisColor_x=Modelica.Mechanics.MultiBody.Types.Defaults.FrameColor
        "Color of x-arrow" 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
      input Types.Color axisColor_y=axisColor_x 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));
      input Types.Color axisColor_z=axisColor_x "Color of z-arrow" 
        annotation (Dialog(tab="Animation", group="if animateWorld = true", enable=enableAnimation and animateWorld));

      parameter SI.Position gravityArrowTail[3]={0,0,0}
        "Position vector from origin of world frame to arrow tail, resolved in world frame"
        annotation (Dialog(tab="Animation", group=
              "if animateGravity = true and gravityType = UniformGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
      parameter SI.Length gravityArrowLength=axisLength/2
        "Length of gravity arrow" 
        annotation (Dialog(tab="Animation", group=
              "if animateGravity = true and gravityType = UniformGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
      parameter SI.Diameter gravityArrowDiameter=gravityArrowLength/
          defaultWidthFraction "Diameter of gravity arrow" annotation (Dialog(tab=
              "Animation", group=
              "if animateGravity = true and gravityType = UniformGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
      input Types.Color gravityArrowColor={0,230,0} "Color of gravity arrow" 
        annotation (Dialog(tab="Animation", group=
              "if animateGravity = true and gravityType = UniformGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity));
      parameter SI.Diameter gravitySphereDiameter=12742000
        "Diameter of sphere representing gravity center (default = mean diameter of earth)"
        annotation (Dialog(tab="Animation", group=
              "if animateGravity = true and gravityType = PointGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity));
      input Types.Color gravitySphereColor={0,230,0} "Color of gravity sphere" 
        annotation (Dialog(tab="Animation", group=
              "if animateGravity = true and gravityType = PointGravity",
              enable=enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity));

      parameter SI.Length nominalLength=1
        "\"Nominal\" length of multi-body system" 
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultAxisLength=nominalLength/5
        "Default for length of a frame axis (but not world frame)" 
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultJointLength=nominalLength/10
        "Default for the fixed length of a shape representing a joint" 
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultJointWidth=nominalLength/20
        "Default for the fixed width of a shape representing a joint" 
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultForceLength=nominalLength/10
        "Default for the fixed length of a shape representing a force (e.g. damper)"
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultForceWidth=nominalLength/20
        "Default for the fixed width of a shape represening a force (e.g. spring, bushing)"
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultBodyDiameter=nominalLength/9
        "Default for diameter of sphere representing the center of mass of a body"
        annotation (Dialog(tab="Defaults"));
      parameter Real defaultWidthFraction=20
        "Default for shape width as a fraction of shape length (e.g., for Parts.FixedTranslation)"
        annotation (Dialog(tab="Defaults"));
      parameter SI.Length defaultArrowDiameter=nominalLength/40
        "Default for arrow diameter (e.g., of forces, torques, sensors)" 
        annotation (Dialog(tab="Defaults"));
      parameter Real defaultFrameDiameterFraction=40
        "Default for arrow diameter of a coordinate system as a fraction of axis length"
        annotation (Dialog(tab="Defaults"));
      parameter Real defaultSpecularCoefficient(min=0) = 0.7
        "Default reflection of ambient light (= 0: light is completely absorbed)"
        annotation (Dialog(tab="Defaults"));
      parameter Real defaultN_to_m(unit="N/m", min=0) = 1000
        "Default scaling of force arrows (length = force/defaultN_to_m)" 
        annotation (Dialog(tab="Defaults"));
      parameter Real defaultNm_to_m(unit="N.m/m", min=0) = 1000
        "Default scaling of torque arrows (length = torque/defaultNm_to_m)" 
        annotation (Dialog(tab="Defaults"));

      /* The World object can only use the Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape model, but no
     other models in package Modelica.Mechanics.MultiBody.Visualizers, since the other models access
     data of the "outer Modelica.Mechanics.MultiBody.World world" object, i.e., there are
     mutually dependent classes. For this reason, the higher level visualization
     objects cannot be used.
  */
    protected
      parameter Integer ndim=if enableAnimation and animateWorld then 1 else 0;
      parameter Integer ndim2=if enableAnimation and animateWorld and 
          axisShowLabels then 1 else 0;

      // Parameters to define axes
      parameter SI.Length headLength=min(axisLength, axisDiameter*Types.Defaults.
          FrameHeadLengthFraction);
      parameter SI.Length headWidth=axisDiameter*Types.Defaults.
          FrameHeadWidthFraction;
      parameter SI.Length lineLength=max(0, axisLength - headLength);
      parameter SI.Length lineWidth=axisDiameter;

      // Parameters to define axes labels
      parameter SI.Length scaledLabel=Modelica.Mechanics.MultiBody.Types.Defaults.FrameLabelHeightFraction*
          axisDiameter;
      parameter SI.Length labelStart=1.05*axisLength;

      // x-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        color=axisColor_x,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape x_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={1,0,0},
        widthDirection={0,1,0},
        color=axisColor_x,
        r={lineLength,0,0},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines x_label(
        lines=scaledLabel*{[0, 0; 1, 1],[0, 1; 1, 0]},
        diameter=axisDiameter,
        color=axisColor_x,
        r_lines={labelStart,0,0},
        n_x={1,0,0},
        n_y={0,1,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // y-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={0,1,0},
        widthDirection={1,0,0},
        color=axisColor_y,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape y_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={0,1,0},
        widthDirection={1,0,0},
        color=axisColor_y,
        r={0,lineLength,0},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines y_label(
        lines=scaledLabel*{[0, 0; 1, 1.5],[0, 1.5; 0.5, 0.75]},
        diameter=axisDiameter,
        color=axisColor_y,
        r_lines={0,labelStart,0},
        n_x={0,1,0},
        n_y={-1,0,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // z-axis
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowLine(
        shapeType="cylinder",
        length=lineLength,
        width=lineWidth,
        height=lineWidth,
        lengthDirection={0,0,1},
        widthDirection={0,1,0},
        color=axisColor_z,
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape z_arrowHead(
        shapeType="cone",
        length=headLength,
        width=headWidth,
        height=headWidth,
        lengthDirection={0,0,1},
        widthDirection={0,1,0},
        color=axisColor_z,
        r={0,0,lineLength},
        specularCoefficient=0) if enableAnimation and animateWorld;
      Modelica.Mechanics.MultiBody.Visualizers.Internal.Lines z_label(
        lines=scaledLabel*{[0, 0; 1, 0],[0, 1; 1, 1],[0, 1; 1, 0]},
        diameter=axisDiameter,
        color=axisColor_z,
        r_lines={0,0,labelStart},
        n_x={0,0,1},
        n_y={0,1,0},
        specularCoefficient=0) if enableAnimation and animateWorld and axisShowLabels;

      // Uniform gravity visualization
      parameter SI.Length gravityHeadLength=min(gravityArrowLength,
          gravityArrowDiameter*Types.Defaults.ArrowHeadLengthFraction);
      parameter SI.Length gravityHeadWidth=gravityArrowDiameter*Types.Defaults.ArrowHeadWidthFraction;
      parameter SI.Length gravityLineLength=max(0, gravityArrowLength - gravityHeadLength);
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowLine(
        shapeType="cylinder",
        length=gravityLineLength,
        width=gravityArrowDiameter,
        height=gravityArrowDiameter,
        lengthDirection=n,
        widthDirection={0,1,0},
        color=gravityArrowColor,
        r_shape=gravityArrowTail,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravityArrowHead(
        shapeType="cone",
        length=gravityHeadLength,
        width=gravityHeadWidth,
        height=gravityHeadWidth,
        lengthDirection=n,
        widthDirection={0,1,0},
        color=gravityArrowColor,
        r_shape=gravityArrowTail + Modelica.Math.Vectors.normalize(
                                                    n)*gravityLineLength,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.UniformGravity;

      // Point gravity visualization
      parameter Integer ndim_pointGravity=if enableAnimation and animateGravity
           and gravityType == 2 then 1 else 0;
      Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape gravitySphere(
        shapeType="sphere",
        r_shape={-gravitySphereDiameter/2,0,0},
        lengthDirection={1,0,0},
        length=gravitySphereDiameter,
        width=gravitySphereDiameter,
        height=gravitySphereDiameter,
        color=gravitySphereColor,
        specularCoefficient=0) if enableAnimation and animateGravity and gravityType == GravityTypes.PointGravity;

      function gravityAcceleration = gravityAccelerationTypes (
          gravityType=gravityType,
          g=g*Modelica.Math.Vectors.normalize(
                                         n),
          mue=mue);

    protected
      function gravityAccelerationTypes
        "Gravity field acceleration depending on field type and position"
        import Modelica.Mechanics.MultiBody.Types.GravityTypes;
        extends Modelica.Icons.Function;
        input SI.Position r[3]
          "Position vector from world frame to actual point, resolved in world frame";
        input GravityTypes gravityType "Type of gravity field";
        input SI.Acceleration g[3]
          "Constant gravity acceleration, resolved in world frame, if gravityType=1";
        input Real mue(unit="m3/s2")
          "Field constant of point gravity field, if gravityType=2";
        output SI.Acceleration gravity[3]
          "Gravity acceleration at point r, resolved in world frame";
      algorithm
        gravity := if gravityType == GravityTypes.UniformGravity then g else 
                   if gravityType == GravityTypes.PointGravity then 
                      -(mue/(r*r))*(r/Modelica.Math.Vectors.length(
                                                    r)) else 
                        zeros(3);
      end gravityAccelerationTypes;
    equation
      Connections.root(frame_b.R);

      assert(Modelica.Math.Vectors.length(
                           n) > 1.e-10,
        "Parameter n of World object is wrong (lenght(n) > 0 required)");
      frame_b.r_0 = zeros(3);
      frame_b.R = Frames.nullRotation();
    end World;

      package Examples
      "Examples that demonstrate the usage of the MultiBody library"
      extends Modelica.Icons.Library;

        package Elementary
        "Elementary examples to demonstrate various features of the MultiBody library"
        extends Modelica.Icons.Library;

          model DoublePendulum
          "Simple double pendulum with two revolute joints and two bodies"

            extends Modelica.Icons.Example;
            annotation (
              experiment(StopTime=3),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This example demonstrates that by using joint and body
elements animation is automatically available. Also the revolute
joints are animated. Note, that animation of every component
can be switched of by setting the first parameter <b>animation</b>
to <b>false</b> or by setting <b>enableAnimation</b> in the <b>world</b>
object to <b>false</b> to switch off animation of all components.
</p>

<table border=0 cellspacing=0 cellpadding=0><tr><td valign=\"top\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/DoublePendulum.png\"
ALT=\"model Examples.Elementary.DoublePendulum\">
</td></tr></table>

</HTML>"));
            inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
                  transformation(extent={{-88,0},{-68,20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(useAxisFlange=true,phi(fixed=true),
                w(fixed=true))                                             annotation (Placement(transformation(extent={{-48,0},
                      {-28,20}}, rotation=0)));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1) 
              annotation (Placement(transformation(extent={{-48,40},{-28,60}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody1(r={0.5,0,0}, width=0.06) 
              annotation (Placement(transformation(extent={{-10,0},{10,20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed=true), w(
                  fixed=true))                                     annotation (Placement(transformation(extent={{32,0},{
                      52,20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody2(r={0.5,0,0}, width=0.06) 
              annotation (Placement(transformation(extent={{74,0},{94,20}}, rotation=0)));
          equation

            connect(damper.flange_b, revolute1.axis) annotation (Line(points={{-28,50},{
                    -24,50},{-24,28},{-38,28},{-38,20}}, color={0,0,0}));
            connect(revolute1.support, damper.flange_a) annotation (Line(points={{-44,20},
                    {-44,28},{-58,28},{-58,50},{-48,50}}, color={0,0,0}));
            connect(revolute1.frame_b, boxBody1.frame_a) 
              annotation (Line(
                points={{-28,10},{-10,10}},
                color={95,95,95},
                thickness=0.5));
            connect(revolute2.frame_b, boxBody2.frame_a) 
              annotation (Line(
                points={{52,10},{74,10}},
                color={95,95,95},
                thickness=0.5));
            connect(boxBody1.frame_b, revolute2.frame_a) 
              annotation (Line(
                points={{10,10},{32,10}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, revolute1.frame_a) 
              annotation (Line(
                points={{-68,10},{-48,10}},
                color={95,95,95},
                thickness=0.5));
          end DoublePendulum;

          model ForceAndTorque "Demonstrate usage of ForceAndTorque element"
            extends Modelica.Icons.Example;
            inner World world(animateGravity=false) annotation (Placement(transformation(
                    extent={{-90,30},{-70,50}}, rotation=0)));
            annotation (
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={1,1}), graphics),
              Documentation(info="<HTML>
In this example the usage of the general force element
\"<a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.ForceAndTorque\">ForceAndTorque</a>\"
is shown. A \"ForceAndTorque\" element is connected
between a body and a fixed point in the world system. The force and torque
is defined by the \"Constant\" block. The two vectors are resolved in the
coordinate system defined by the \"fixedRotation\" component that is
fixed in the world system:
</p>
<p>
The animation view at time = 0 is shown in the figure below.
The yellow line is directed from frame_a to frame_b of the
forceAndTorque component. The green arrow characterizes the
force acting at the body whereas the green double arrow characterizes
the torque acting at the body. The lengths of the two vectors
are proportional to the lengths of the force and torque vectors
(constant scaling factors are defined as parameters in the
forceAndTorque component):
</p>
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/ForceAndTorque.png\">
</HTML>
"));
            Parts.BodyCylinder body(r={1,0,0}) annotation (Placement(transformation(
                    extent={{0,30},{20,50}}, rotation=0)));
            Parts.Fixed fixed1(r={0,-0.5,0}, width=0.03) 
              annotation (Placement(transformation(extent={{-90,-10},{-70,10}}, rotation=
                      0)));
            Parts.FixedRotation fixedRotation(n={0,0,1}, angle=30) 
              annotation (Placement(transformation(extent={{-8,-30},{12,-10}}, rotation=0)));
            Forces.ForceAndTorque forceAndTorque(Nm_to_m=120, N_to_m=1200,
              resolveInFrame=Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve) 
              annotation (Placement(transformation(extent={{60,50},{40,30}}, rotation=0)));
            Joints.Revolute revolute2(n={0,1,0},
              phi(fixed=true),
              w(fixed=true))        annotation (Placement(transformation(
                  origin={-20,20},
                  extent={{-10,-10},{10,10}},
                  rotation=90)));
            Modelica.Blocks.Sources.Constant torque[3](k={-100,100,0}) 
              annotation (Placement(transformation(
                  origin={40,-10},
                  extent={{10,-10},{-10,10}},
                  rotation=270)));
            Joints.Revolute revolute1(phi(fixed=true), w(fixed=true)) 
              annotation (Placement(transformation(extent={{-60,-10},{-40,10}}, rotation=
                      0)));
            Parts.Fixed fixed2(width=0.03, r={1.5,0.25,0}) 
              annotation (Placement(transformation(extent={{100,30},{80,50}}, rotation=0)));
            Modelica.Blocks.Sources.Constant force[3](k={0,1000,0}) 
              annotation (Placement(transformation(
                  origin={80,-10},
                  extent={{10,-10},{-10,10}},
                  rotation=270)));
          equation
            connect(revolute2.frame_b, body.frame_a) annotation (Line(
                points={{-20,30},{-20,40},{0,40}},
                color={95,95,95},
                thickness=0.5));
            connect(forceAndTorque.frame_b, body.frame_b) 
              annotation (Line(
                points={{40,40},{20,40}},
                color={95,95,95},
                thickness=0.5));
            connect(fixed1.frame_b, revolute1.frame_a) 
              annotation (Line(
                points={{-70,0},{-60,0}},
                color={95,95,95},
                thickness=0.5));
            connect(revolute1.frame_b, revolute2.frame_a) 
              annotation (Line(
                points={{-40,0},{-20,0},{-20,10}},
                color={95,95,95},
                thickness=0.5));
            connect(fixed2.frame_b, forceAndTorque.frame_a) 
              annotation (Line(
                points={{80,40},{60,40}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedRotation.frame_a, fixed1.frame_b) annotation (Line(
                points={{-8,-20},{-65,-20},{-65,0},{-70,0}},
                color={95,95,95},
                thickness=0.5));
            connect(forceAndTorque.frame_resolve, fixedRotation.frame_b) annotation (Line(
                points={{42,30},{42,30},{20,30},{20,-20},{12,-20}},
                color={95,95,95},
                pattern=LinePattern.Dot));
            connect(force.y, forceAndTorque.force) annotation (Line(
                points={{80,1},{80,10},{58,10},{58,28}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(torque.y, forceAndTorque.torque) annotation (Line(
                points={{40,1},{40,10},{50,10},{50,28}},
                color={0,0,127},
                smooth=Smooth.None));
          end ForceAndTorque;

          model FreeBody
          "Free flying body attached by two springs to environment"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            annotation (
              experiment(StopTime=10),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This example demonstrates:
</p>
<ul>
<li>The animation of spring and damper components</li>
<li>A body can be freely moving without any connection to a joint.
    In this case body coordinates are used automatically as
    states (whenever joints are present, it is first tried to
    use the generalized coordinates of the joints as states).</li>
<li>If a body is freely moving, the initial position and velocity of the body
    can be defined with the \"Initialization\" menu as shown with the
    body \"body1\" in the left part (click on \"Initialization\").</li>
</ul>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/FreeBody.png\"
ALT=\"model Examples.Elementary.FreeBody\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
                  transformation(extent={{-60,20},{-40,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(r={0.8,0,0}, animation=false) 
              annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              s_unstretched=0) annotation (Placement(transformation(
                  origin={-20,6},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.BodyShape body(
              m=1,
              I_11=1,
              I_22=1,
              I_33=1,
              r={0.4,0,0},
              r_CM={0.2,0,0},
              width=0.05,
              r_0(start={0.2,-0.5,0.1}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              angles_start={0.174532925199433,0.174532925199433,0.174532925199433}) 
              annotation (Placement(transformation(extent={{0,-40},{20,-20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=20,
              s_unstretched=0,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5) annotation (Placement(transformation(
                  origin={40,6},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
          equation
            connect(bar2.frame_a, world.frame_b) 
              annotation (Line(
                points={{0,30},{-40,30}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_b, body.frame_a) annotation (Line(
                points={{-20,-4},{-20,-30},{0,-30}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, spring2.frame_a) 
              annotation (Line(
                points={{20,30},{40,30},{40,16}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_a, world.frame_b) annotation (Line(
                points={{-20,16},{-20,30},{-40,30}},
                color={95,95,95},
                thickness=0.5));
            connect(body.frame_b, spring2.frame_b) annotation (Line(
                points={{20,-30},{40,-30},{40,-4}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
          end FreeBody;

          model InitSpringConstant
          "Determine spring constant such that system is in steady state at given position"

            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.
                  UniformGravity) annotation (Placement(transformation(extent={{-80,0},{
                      -60,20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute rev(useAxisFlange=true,n={0,0,1},
              phi(fixed=true),
              w(fixed=true),
              a(fixed=true))                         annotation (Placement(transformation(
                    extent={{-40,0},{-20,20}}, rotation=0)));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1) 
              annotation (Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.BodyShape body(
              r={1,0,0},
              r_CM={0.5,0,0},
              m=1) annotation (Placement(transformation(extent={{0,0},{20,20}}, rotation=
                      0)));
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed(r={1,0.2,0}, width=0.02) 
              annotation (Placement(transformation(
                  origin={50,70},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring(s_unstretched=0.1, c(fixed=false) = 100) 
              annotation (Placement(transformation(
                  origin={50,30},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));

            annotation (Documentation(info="<html>
<p>
This example demonstrates a non-standard type of initialization
by calculating a spring constant such
that a simple pendulum is at a defined position in steady state.
</p>
<p>
The goal is that the pendulum should be in steady state
when the rotation angle of the pendulum is zero. The spring
constant of the spring shall be calculated during initialization
such that this goal is reached.
</p>
<p>
The pendulum has one degree of freedom, i.e., two states.
Therefore, two additional equations have to be provided
for initialization. However, parameter \"c\" of the spring
component is defined with attribute \"fixed = <b>false</b>\", i.e.,
the value of this parameter is computed during initialization.
Therefore, there is one additional equation required during
initialization. The 3 initial equations are the rotational
angle of the revolute joint and its first and second
derivative. The latter ones are zero, in order to initialize
in steady state. By setting the start values of phi, w, a to zero and
their fixed attributes to true, the required
3 initial equations are defined.
</p>
<p>
After translation, this model is initialized in steady-state.
The spring constant is computed as c = 49.05 N/m.
An animation of this simulation is shown in the figure below.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/InitSpringConstant.png\"
ALT=\"model Examples.Elementary.InitSpringConstant\">
</p>
</html>"),           Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics));
          equation

            connect(world.frame_b, rev.frame_a) 
              annotation (Line(
                points={{-60,10},{-40,10}},
                color={95,95,95},
                thickness=0.5));
            connect(damper.flange_b, rev.axis) annotation (Line(points={{-20,50},{-16,50},
                    {-16,26},{-30,26},{-30,20}}, color={0,0,0}));
            connect(rev.support, damper.flange_a) annotation (Line(points={{-36,20},{-36,
                    26},{-48,26},{-48,50},{-40,50}}, color={0,0,0}));
            connect(rev.frame_b, body.frame_a) 
              annotation (Line(
                points={{-20,10},{0,10}},
                color={95,95,95},
                thickness=0.5));
            connect(fixed.frame_b, spring.frame_a) 
              annotation (Line(
                points={{50,60},{50,40}},
                color={95,95,95},
                thickness=0.5));
            connect(body.frame_b, spring.frame_b) 
              annotation (Line(
                points={{20,10},{50,10},{50,20}},
                color={95,95,95},
                thickness=0.5));
          end InitSpringConstant;

          model LineForceWithTwoMasses
          "Demonstrate line force with two point masses using a JointUPS and alternatively a LineForceWithTwoMasses component"

            import SI = Modelica.SIunits;

            extends Modelica.Icons.Example;
            parameter Modelica.SIunits.Mass m=1 "Mass of point masses";
            SI.Force rod_f_diff[3]=rod1.frame_b.f - rod3.frame_b.f
            "Difference of cut-forces in rod1 and rod3";
            SI.Force body_f_diff[3]=bodyBox1.frame_b.f - bodyBox2.frame_b.f
            "Difference of cut-forces in bodyBox1 and bodyBox2";
            annotation (
              experiment(StopTime=3),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={1,1}), graphics),
              Documentation(info="<html>
<p>
It is demonstrated how to implement line force components
that shall have mass properties. Two alternative implementations
are given:
</p>
<ul>
<li> With
     <a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS\">JointUPS</a>:<br>
     Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS is an aggregation
     of a universal, a prismatic and a spherical joint that approximates
     a real force component, such as a hydraulic cylinder. At the two
     frames of the prismatic joint (frame_ia, frame_ib of jointUPS)
     two bodies are attached. The parameters are selected such that
     the center of masses of the two bodies are located on the line
     connecting frame_a and frame_b of the jointUPS component.
     Both bodies have the same mass and the inertia tensor is set to zero,
     i.e., the two bodies are treated as point masses.</li>
<li> With <a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses\">
     LineForceWithTwoMasses</a>:<br>
     Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses is a line force component
     with the built-in property that two point masses are located
     on the line on which the line force is acting.
     The parameters are selected in such a way that the same
     system as with the jointUPS component is described.</li>
</ul>
<p>
In both cases, a linear 1-dimensional translational damper from the
Modelica.Mechanics.Translational library is used as
line force between the two attachment points. Simulate
this system and plot the differences of the cut forces at both sides
of the line force component (\"rod_f_diff\" and \"body_f_diff\").
Both vectors should be zero
(depending on the choosen relative tolerance of the integration,
the difference is in the order of 1.e-10 ... 1.e-15).
</p>
<p>
Note, that the implementation with the LineForceWithTwoMasses
component is simpler and more convenient.
An animation of this simulation is shown in the figure below.
The system on the left side in the front is the animation with
the LineForceWithTwoMasses component whereas the system on the right
side in the back is the animation with the JointUPS component.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/LineForceWithTwoMasses2.png\">
</p>
</html>"));

            inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
                  transformation(extent={{-80,60},{-60,80}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(fixed=true), w(
                  fixed=true))      annotation (Placement(transformation(extent={{-20,60},
                      {0,80}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox1(r={0.7,0,0}) 
              annotation (Placement(transformation(extent={{20,60},{40,80}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod1(
              r={0,-0.9,0},
              width=0.01,
              animation=false) annotation (Placement(transformation(
                  origin={-40,54},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS jointUPS(nAxis_ia={0.7,1.2,0}, animation=
                 true) annotation (Placement(transformation(extent={{0,50},{20,30}},
                    rotation=0)));
            annotation (Diagram);
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              r_CM=0.2*jointUPS.eAxis_ia,
              cylinderDiameter=0.05,
              animation=true,
              m=m,
              I_11=0,
              I_22=0,
              I_33=0) annotation (Placement(transformation(extent={{-14,14},{-34,34}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              r_CM=-0.2*jointUPS.eAxis_ia,
              cylinderDiameter=0.05,
              animation=true,
              m=m,
              I_11=0,
              I_22=0,
              I_33=0) annotation (Placement(transformation(extent={{32,14},{52,34}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod2(
              r={0,0.3,0},
              width=0.01,
              animation=false) annotation (Placement(transformation(
                  origin={-40,84},
                  extent={{10,-10},{-10,10}},
                  rotation=270)));
            Modelica.Mechanics.Translational.Components.Damper damper1(
                                                            d=3) 
              annotation (Placement(transformation(extent={{0,24},{20,4}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed=true), w(
                  fixed=true))      annotation (Placement(transformation(extent={{-20,-40},
                      {0,-20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.BodyBox bodyBox2(r={0.7,0,0}) 
              annotation (Placement(transformation(extent={{20,-40},{40,-20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod3(
              width=0.01,
              r={0,-0.9,0.3},
              animation=false) annotation (Placement(transformation(
                  origin={-40,-46},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod4(
              width=0.01,
              r={0,0.3,0.3},
              animation=false) annotation (Placement(transformation(
                  origin={-40,-16},
                  extent={{10,-10},{-10,10}},
                  rotation=270)));
            Modelica.Mechanics.Translational.Components.Damper damper2(
                                                            d=3) 
              annotation (Placement(transformation(extent={{0,-76},{20,-96}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses
            lineForceWithTwoMasses(
              L_a=0.2,
              L_b=0.2,
              cylinderLength_a=0.2,
              cylinderLength_b=1.2,
              massDiameterFaction=2.2,
              m_a=m,
              m_b=m) annotation (Placement(transformation(extent={{0,-50},{20,-70}},
                    rotation=0)));
          equation
            connect(jointUPS.bearing, damper1.flange_a) 
              annotation (Line(points={{6,30},{6,20},{0,20},{0,14}}, color={0,191,0}));
            connect(jointUPS.axis, damper1.flange_b) 
              annotation (Line(points={{14,30},{14,20},{20,20},{20,14}}, color={0,191,0}));
            connect(jointUPS.frame_ib, body2.frame_a) 
              annotation (Line(
                points={{18,30},{18,24},{32,24}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, rod2.frame_a) annotation (Line(
                points={{-60,70},{-40,70},{-40,74}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, rod1.frame_a) annotation (Line(
                points={{-60,70},{-40,70},{-40,64}},
                color={95,95,95},
                thickness=0.5));
            connect(rod2.frame_b, revolute1.frame_a) annotation (Line(
                points={{-40,94},{-40,98},{-28,98},{-28,70},{-20,70}},
                color={95,95,95},
                thickness=0.5));
            connect(revolute1.frame_b, bodyBox1.frame_a) 
              annotation (Line(
                points={{0,70},{20,70}},
                color={95,95,95},
                thickness=0.5));
            connect(bodyBox1.frame_b, jointUPS.frame_b) annotation (Line(
                points={{40,70},{46,70},{46,40},{20,40}},
                color={95,95,95},
                thickness=0.5));
            connect(body1.frame_a, jointUPS.frame_ia) 
              annotation (Line(
                points={{-14,24},{2,24},{2,30}},
                color={95,95,95},
                thickness=0.5));
            connect(rod1.frame_b, jointUPS.frame_a) annotation (Line(
                points={{-40,44},{-40,40},{0,40}},
                color={95,95,95},
                thickness=0.5));
            connect(rod4.frame_b, revolute2.frame_a) annotation (Line(
                points={{-40,-6},{-40,-2},{-28,-2},{-28,-30},{-20,-30}},
                color={95,95,95},
                thickness=0.5));
            connect(revolute2.frame_b, bodyBox2.frame_a) 
              annotation (Line(
                points={{0,-30},{20,-30}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, rod4.frame_a) annotation (Line(
                points={{-60,70},{-52,70},{-52,-32},{-40,-32},{-40,-26}},
                color={95,95,95},
                thickness=0.5));
            connect(rod3.frame_a, rod4.frame_a) 
              annotation (Line(
                points={{-40,-36},{-40,-26}},
                color={0,0,0},
                thickness=0.5));
            connect(lineForceWithTwoMasses.frame_a, rod3.frame_b) annotation (Line(
                points={{0,-60},{-40,-60},{-40,-56}},
                color={95,95,95},
                thickness=0.5));
            connect(lineForceWithTwoMasses.frame_b, bodyBox2.frame_b) annotation (Line(
                points={{20,-60},{54,-60},{54,-30},{40,-30}},
                color={95,95,95},
                thickness=0.5));
            connect(lineForceWithTwoMasses.flange_b, damper2.flange_b) 
              annotation (Line(points={{16,-71},{20,-71},{20,-86}}, color={0,191,0}));
            connect(lineForceWithTwoMasses.flange_a, damper2.flange_a) 
              annotation (Line(points={{4,-71},{0,-71},{0,-86}}, color={0,191,0}));
          end LineForceWithTwoMasses;

          model Pendulum "Simple pendulum with one revolute joint and one body"
            extends Modelica.Icons.Example;
            annotation (
              experiment(StopTime=5),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This simple model demonstrates that by just dragging components
default animation is defined that shows the structure of the
assembled system.
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/Pendulum.png\"
ALT=\"model Examples.Elementary.Pendulum\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world(gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.
                  UniformGravity) annotation (Placement(transformation(extent={{-60,0},{
                      -40,20}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute rev(n={0,0,1},useAxisFlange=true,
              phi(fixed=true),
              w(fixed=true))             annotation (Placement(transformation(extent={{
                      -20,0},{0,20}}, rotation=0)));
            Modelica.Mechanics.Rotational.Components.Damper damper(
                                                        d=0.1) 
              annotation (Placement(transformation(extent={{-20,40},{0,60}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body(m=1.0, r_CM={0.5,0,0}) 
              annotation (Placement(transformation(extent={{20,0},{40,20}}, rotation=0)));
          equation
            connect(world.frame_b, rev.frame_a) 
              annotation (Line(
                points={{-40,10},{-20,10}},
                color={95,95,95},
                thickness=0.5));
            connect(damper.flange_b, rev.axis) annotation (Line(points={{0,50},{4,50},{4,
                    26},{-10,26},{-10,20}}, color={0,0,0}));
            connect(rev.support, damper.flange_a) annotation (Line(points={{-16,20},{-16,
                    26},{-28,26},{-28,50},{-20,50}}, color={0,0,0}));
            connect(body.frame_a, rev.frame_b) annotation (Line(
                points={{20,10},{0,10}},
                color={95,95,95},
                thickness=0.5,
                fillPattern=FillPattern.HorizontalCylinder));
          end Pendulum;

          model PendulumWithSpringDamper "Simple spring/damper/mass system"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            annotation (
              experiment(StopTime=10),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
A body is attached on a revolute and prismatic joint.
A 3-dim. spring and a 3-dim. damper are connected between the body
and a point fixed in the world frame:
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/PendulumWithSpringDamper.png\"
ALT=\"model Examples.Elementary.PendulumWithSpringDamper\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world(axisLength=0.6) 
              annotation (Placement(transformation(extent={{-80,20},{-60,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              animation=animation,
              I_11=1,
              I_22=1,
              I_33=1,
              r_CM={0,0,0},
              cylinderDiameter=0.05,
              sphereDiameter=0.2) annotation (Placement(transformation(
                  origin={72,30},
                  extent={{10,-10},{-10,10}},
                  rotation=180)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0}) 
              annotation (Placement(transformation(extent={{-46,20},{-26,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              coilWidth=0.01,
              numberOfWindings=5,
              c=20,
              s_unstretched=0.2) annotation (Placement(transformation(extent={{0,-46},{20,
                      -26}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Damper damper1(
              d=1,
              length_a=0.1,
              diameter_a=0.08,
              animation=false) annotation (Placement(transformation(extent={{0,-20},{20,0}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute(phi(fixed=true), w(
                  fixed=true))      annotation (Placement(transformation(extent={{-12,20},
                      {8,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic(
              boxWidth=0.04,
              boxColor={255,65,65},
              s(fixed=true, start=0.5),
              v(fixed=true)) 
              annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
          equation
            connect(world.frame_b, bar1.frame_a) 
              annotation (Line(
                points={{-60,30},{-46,30}},
                color={95,95,95},
                thickness=0.5));
            connect(revolute.frame_a, bar1.frame_b) 
              annotation (Line(
                points={{-12,30},{-26,30}},
                color={95,95,95},
                thickness=0.5));
            connect(prismatic.frame_a, revolute.frame_b) 
              annotation (Line(
                points={{20,30},{8,30}},
                color={95,95,95},
                thickness=0.5));
            connect(damper1.frame_a, bar1.frame_b) annotation (Line(
                points={{0,-10},{-18,-10},{-18,30},{-26,30}},
                color={95,95,95},
                thickness=0.5));
            connect(damper1.frame_b, prismatic.frame_b) annotation (Line(
                points={{20,-10},{44,-10},{44,30},{40,30}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_a, bar1.frame_b) annotation (Line(
                points={{0,-36},{-18,-36},{-18,30},{-26,30}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_b, prismatic.frame_b) annotation (Line(
                points={{20,-36},{44,-36},{44,30},{40,30}},
                color={95,95,95},
                thickness=0.5));
            connect(body1.frame_a, prismatic.frame_b) 
              annotation (Line(
                points={{62,30},{40,30}},
                color={95,95,95},
                thickness=0.5));
          end PendulumWithSpringDamper;

          model PointGravity "Two point masses in a point gravity field"
            import SI = Modelica.SIunits;
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(
              mue=1,
              gravitySphereDiameter=0.1,
              gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity) 
                                         annotation (Placement(transformation(extent={{
                      -20,-20},{0,0}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              sphereDiameter=0.1,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0,0.6,0}, each fixed=true),
              v_0(start={1,0,0}, each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0}) 
              annotation (Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              sphereDiameter=0.1,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0.6,0.6,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0}) 
              annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
          equation

            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                      100}}),
                      graphics),
              experiment(StopTime=5),
              Documentation(info="<HTML>
<p>
This model demonstrates a point gravity field. Two bodies
are placed in the gravity field. The initial positions and velocities of
these bodies are selected such that one body rotates on a circle and
the other body rotates on an ellipse around the center of the
point gravity field.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/PointGravity.png\"
ALT=\"model Examples.Elementary.PointGravity\">
</p>
</HTML>"));
          end PointGravity;

          model PointGravityWithPointMasses
          "Two point masses in a point gravity field (rotation of bodies is neglected)"
            import SI = Modelica.SIunits;
            extends Modelica.Icons.Example;
            inner Modelica.Mechanics.MultiBody.World world(
              mue=1,
              gravitySphereDiameter=0.1,
              gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity) 
                                         annotation (Placement(transformation(extent={{
                      -20,-20},{0,0}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.PointMass body1(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0,0.6,0}, each fixed=true),
              v_0(start={1,0,0}, each fixed=true)) 
              annotation (Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.PointMass body2(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0.6,0.6,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true))
              annotation (Placement(transformation(extent={{20,20},{40,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.PointMass body3(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0,0.8,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true)) 
              annotation (Placement(transformation(extent={{-20,60},{0,80}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.PointMass body4(
              m=1,
              sphereDiameter=0.1,
              r_0(start={0.3,0.8,0}, each fixed=true),
              v_0(start={0.6,0,0}, each fixed=true)) 
              annotation (Placement(transformation(extent={{20,60},{40,80}}, rotation=0)));
            Forces.Spring spring(showMass=false, c=10) annotation (Placement(
                  transformation(extent={{0,60},{20,80}}, rotation=0)));
          equation

            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}),
                      graphics),
              experiment(StopTime=2),
              Documentation(info="<HTML>
<p>
This model demonstrates the usage of model Parts.PointMass in a
point gravity field. The PointMass model has the feature that
that rotation is not taken into account and can therefore also not be
calculated. This example demonstrates two cases where this does not matter:
If a PointMass is not connected (body1, body2), the orientation object in
these point masses is set to a unit rotation.
If a PointMass is connected by a line force element, such as
the used Forces.LineForceWithMass component, then the orientation object
is set to a unit rotation within the line force element.
These are the two cases where the rotation is automatically set to
a default value, when the physical system does not provide the equations.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/PointGravityWithPointMasses.png\">
</p>
</HTML>"));
            connect(spring.frame_a, body3.frame_a) annotation (Line(
                points={{0,70},{-10,70}},
                color={95,95,95},
                thickness=0.5));
            connect(spring.frame_b, body4.frame_a) annotation (Line(
                points={{20,70},{30,70}},
                color={95,95,95},
                thickness=0.5));
          end PointGravityWithPointMasses;

          model PointGravityWithPointMasses2
          "Rigidly connected point masses in a point gravity field"
            extends Modelica.Icons.Example;
            model PointMass = Modelica.Mechanics.MultiBody.Parts.PointMass (m=1, sphereColor={
                    255,0,0}) "Point mass used at all places of this example";

            PointMass pointMass1(r_0(start={3,0,0}, each fixed=true), v_0(start={0,0,-1}, each fixed=true)) annotation (Placement(transformation(extent={{60,-10},{80,10}}, rotation=0)));

            PointMass pointMass2 annotation (Placement(transformation(extent={{-60,-10},{
                      -40,10}}, rotation=0)));
            PointMass pointMass3(r_0(start={2,1,0}, each fixed=true), v_0(start={0,0,-1},
                  each fixed=true))   annotation (Placement(transformation(extent={{60,20},{80,
                      40}}, rotation=0)));
            PointMass pointMass4 annotation (Placement(transformation(extent={{-50,-40},{
                      -30,-20}}, rotation=0)));
            PointMass pointMass5 annotation (Placement(transformation(extent={{0,80},{20,
                      100}}, rotation=0)));
            PointMass pointMass6 annotation (Placement(transformation(extent={{0,-100},{
                      20,-80}}, rotation=0)));

            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation(                                                    r={1,0,0}) 
                            annotation (Placement(transformation(extent={{20,-10},{40,10}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation1(                                                    r={-1,0,0}) 
                           annotation (Placement(transformation(extent={{0,-10},{-20,10}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation2(                                                    r={0,1,0}) 
                           annotation (Placement(transformation(extent={{20,20},{40,40}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation3(                                                    r={0,-1,0}) 
                           annotation (Placement(transformation(extent={{0,-40},{-20,-20}},
                    rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation4(                                                    r={0,0,1}) 
                           annotation (Placement(transformation(
                  origin={10,60},
                  extent={{-10,-10},{10,10}},
                  rotation=90)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation5(                                                    r={0,0,-1}) 
                           annotation (Placement(transformation(
                  origin={10,-60},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,
                      -100},{100,100}}),
                                graphics),
              experiment(StopTime=3, Tolerance=1e-006),
              Documentation(info="<html>
<p>
This model demonstrates the usage of model Parts.PointMass in a
point gravity field. 6 point masses are connected rigidly together.
Translating such a model results in an error, because point masses do
not define an orientation object. The example demonstrates that in such
a case (when the orientation object is not defined by an object that
is connected to a point mass), a \"MultiBody.Joints.FreeMotion\" joint
has to be used, to define the the degrees of freedom of this structure.
</p>

<p>
In order to demonstrate that this approach is correct, in model
\"referenceSystem\", the same system is again provided, but this time
modeled with a generic body (Parts.Body) where the inertia tensor is
set to zero. In this case, no FreeMotion object is needed because every
body provides its absolute translational and rotational position and
velocity as potential states.
</p>

<p>
The two systems should move exactly in the same way. The system with the PointMasses
object visulizes the point masses in \"red\", whereas the \"referenceSystem\" shows
its bodies in \"blue\".
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/PointGravityWithPointMasses2.png\">
</p>
</html>"));

            inner World world(                             gravityType=Modelica.Mechanics.MultiBody.Types.GravityTypes.PointGravity, mue=
                  5) 
              annotation (Placement(transformation(extent={{-80,60},{-60,80}}, rotation=0)));
            Joints.FreeMotion freeMotion annotation (Placement(transformation(extent={{
                      -40,60},{-20,80}}, rotation=0)));

          model SystemWithStandardBodies
            "For comparison purposes, an equivalent model with Bodies instead of PointMasses"
            extends Modelica.Icons.Example;
            model PointMass = Modelica.Mechanics.MultiBody.Parts.Body(m=1,I_11=0,I_22=0,I_33=0)
              "Body used all places of the comparision model with zero inertia tensor";

            PointMass pointMass1(
                r_0(start={3,0,0}, each fixed=true),
                v_0(start={0,0,-1}, each fixed=true),
                angles_fixed=true,
                w_0_fixed=true,
                r_CM={0,0,0})    annotation (Placement(transformation(extent={{40,-20},{
                        60,0}}, rotation=0)));
            PointMass pointMass2(r_CM={0,0,0}) 
                                 annotation (Placement(transformation(extent={{-60,-20},{
                        -80,0}}, rotation=0)));
            PointMass pointMass3(r_CM={0,0,0}) 
                                 annotation (Placement(transformation(extent={{40,10},{60,
                        30}}, rotation=0)));
            PointMass pointMass4(r_CM={0,0,0}) 
                                 annotation (Placement(transformation(extent={{-50,-50},{
                        -70,-30}}, rotation=0)));
            PointMass pointMass5(r_CM={0,0,0}) 
                                 annotation (Placement(transformation(extent={{0,60},{20,
                        80}}, rotation=0)));
            PointMass pointMass6(r_CM={0,0,0}) 
                                 annotation (Placement(transformation(extent={{2,-102},{
                        22,-82}}, rotation=0)));

            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation(                                                   r={1,0,0}) 
                            annotation (Placement(transformation(extent={{0,-20},{20,0}},
                      rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation1(                                                   r={-1,0,0}) 
                           annotation (Placement(transformation(extent={{-20,-20},{-40,0}},
                      rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation2(                                                   r={0,1,0}) 
                           annotation (Placement(transformation(extent={{0,10},{20,30}},
                      rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation3(                                                   r={0,-1,0}) 
                           annotation (Placement(transformation(extent={{-20,-50},{-40,
                        -30}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation4(                                                   r={0,0,1}) 
                           annotation (Placement(transformation(
                    origin={-10,50},
                    extent={{-10,-10},{10,10}},
                    rotation=90)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
              fixedTranslation5(                                                   r={0,0,-1}) 
                           annotation (Placement(transformation(
                    origin={-10,-70},
                    extent={{10,-10},{-10,10}},
                    rotation=90)));

            annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                        -100},{100,100}}),
                                graphics),
                                 Documentation(info="<html>
<p>
In order to compare the results of the \"PointMass\" example where
6 point masses are rigidly connected together, in this comparision model,
an equivalent system is setup, with the only difference that the
point masses are replaced by Bodies with zero inertia.
</p>
</html>"));

          equation
            connect(fixedTranslation1.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                  points={{-20,-10},{0,-10}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a) 
                                                                    annotation (Line(
                  points={{-20,-10},{-10,-10},{-10,20},{0,20}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation3.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                  points={{-20,-40},{-10,-40},{-10,-10},{0,-10}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a) 
                                                                    annotation (Line(
                  points={{-20,-10},{-10,-10},{-10,40}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation5.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                  points={{-10,-60},{-10,-10},{0,-10}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation2.frame_b, pointMass3.frame_a) 
                                                                annotation (Line(
                  points={{20,20},{40,20}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation3.frame_b, pointMass4.frame_a) 
                                                                annotation (Line(
                  points={{-40,-40},{-50,-40}},
                  color={95,95,95},
                  thickness=0.5));
            connect(pointMass5.frame_a, fixedTranslation4.frame_b) 
                                                                annotation (Line(
                  points={{0,70},{-10,70},{-10,60}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation5.frame_b, pointMass6.frame_a) 
                                                                annotation (Line(
                  points={{-10,-80},{-10,-92},{2,-92}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation.frame_b, pointMass1.frame_a) 
                                                               annotation (Line(
                  points={{20,-10},{40,-10}},
                  color={95,95,95},
                  thickness=0.5));
            connect(fixedTranslation1.frame_b, pointMass2.frame_a) 
                                                                annotation (Line(
                  points={{-40,-10},{-60,-10}},
                  color={95,95,95},
                  thickness=0.5));
          end SystemWithStandardBodies;

            SystemWithStandardBodies referenceSystem annotation (Placement(transformation(
                    extent={{60,-60},{80,-40}}, rotation=0)));
          equation
            connect(fixedTranslation1.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                points={{0,0},{20,0}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation1.frame_a, fixedTranslation2.frame_a) 
                                                                    annotation (Line(
                points={{0,0},{10,0},{10,30},{20,30}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation3.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                points={{0,-30},{10,-30},{10,0},{20,0}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation1.frame_a, fixedTranslation4.frame_a) 
                                                                    annotation (Line(
                points={{0,0},{10,0},{10,50}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation5.frame_a, fixedTranslation.frame_a) 
                                                                   annotation (Line(
                points={{10,-50},{10,0},{20,0}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation2.frame_b, pointMass3.frame_a) 
                                                                annotation (Line(
                points={{40,30},{70,30}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation3.frame_b, pointMass4.frame_a) 
                                                                annotation (Line(
                points={{-20,-30},{-40,-30}},
                color={95,95,95},
                thickness=0.5));
            connect(pointMass5.frame_a, fixedTranslation4.frame_b) 
                                                                annotation (Line(
                points={{10,90},{10,70}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation5.frame_b, pointMass6.frame_a) 
                                                                annotation (Line(
                points={{10,-70},{10,-90}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation.frame_b, pointMass1.frame_a) 
                                                               annotation (Line(
                points={{40,0},{70,0}},
                color={95,95,95},
                thickness=0.5));
            connect(fixedTranslation1.frame_b, pointMass2.frame_a) 
                                                                annotation (Line(
                points={{-20,0},{-50,0}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, freeMotion.frame_a) annotation (Line(
                points={{-60,70},{-40,70}},
                color={95,95,95},
                thickness=0.5));
            connect(freeMotion.frame_b, fixedTranslation1.frame_a) annotation (Line(
                points={{-20,70},{-10,70},{-10,20},{10,20},{10,0},{0,0}},
                color={95,95,95},
                thickness=0.5));
          end PointGravityWithPointMasses2;

          model SpringDamperSystem "Simple spring/damper/mass system"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            annotation (
              experiment(StopTime=10),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This example demonstrates:
</p>
<ul>
<li>The animation of spring and damper components</li>
<li>A body can be freely moving without any connection to a joint.
    In this case body coordinates are used automatically as
    states (whenever joints are present, it is first tried to
    use the generalized coordinates of the joints as states).</li>
<li>If a body is freely moving, the initial position and velocity of the body
    can be defined with the \"Initialization\" menu as shown with the
    body \"body1\" in the left part (click on \"Initialization\").</li>
</ul>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/SpringDamperSystem.png\"
ALT=\"model Examples.Elementary.SpringDamperSystem\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
                  transformation(extent={{-80,20},{-60,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              animation=animation,
              r_CM={0,-0.2,0},
              cylinderDiameter=0.05,
              sphereDiameter=0.15,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              r_0(start={0.3,-0.2,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              w_0_start(each displayUnit="deg/s") = {0,0,0.03490658503988659}) 
                        annotation (Placement(transformation(
                  origin={-20,-50},
                  extent={{-10,10},{10,-10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0}) 
              annotation (Placement(transformation(extent={{-46,20},{-26,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0.6,0,0}) 
              annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              animation=animation,
              cylinderDiameter=0.05,
              sphereDiameter=0.15,
              r_CM={0,0,0})        annotation (Placement(transformation(
                  origin={50,-50},
                  extent={{-10,10},{10,-10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Joints.Prismatic p2(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              stateSelect=StateSelect.always,
              v(fixed=true),
              s(fixed=true, start=0.1)) 
                             annotation (Placement(transformation(
                  origin={50,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=30,
              s_unstretched=0.1,
              coilWidth=0.01,
              width=0.1) annotation (Placement(transformation(
                  origin={82,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              s_unstretched=0.1,
              coilWidth=0.01,
              c=30,
              numberOfWindings=10,
              width=0.1) annotation (Placement(transformation(
                  origin={-6,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Damper damper1(d=2) 
              annotation (Placement(transformation(
                  origin={-30,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
          equation
            connect(world.frame_b, bar1.frame_a) 
              annotation (Line(
                points={{-60,30},{-46,30}},
                color={95,95,95},
                thickness=0.5));
            connect(bar1.frame_b, bar2.frame_a) 
              annotation (Line(
                points={{-26,30},{0,30}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, p2.frame_a) 
              annotation (Line(
                points={{20,30},{50,30},{50,0}},
                color={95,95,95},
                thickness=0.5));
            connect(p2.frame_b, body2.frame_a) 
              annotation (Line(
                points={{50,-20},{50,-40}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, spring2.frame_a) 
              annotation (Line(
                points={{20,30},{82,30},{82,0}},
                color={95,95,95},
                thickness=0.5));
            connect(body2.frame_a, spring2.frame_b) annotation (Line(
                points={{50,-40},{82,-40},{82,-20}},
                color={95,95,95},
                thickness=0.5));
            connect(damper1.frame_a, bar1.frame_b) annotation (Line(
                points={{-30,0},{-30,10},{-20,10},{-20,30},{-26,30}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_a, bar1.frame_b) annotation (Line(
                points={{-6,0},{-6,10},{-20,10},{-20,30},{-26,30}},
                color={95,95,95},
                thickness=0.5));
            connect(damper1.frame_b, body1.frame_a) annotation (Line(
                points={{-30,-20},{-30,-28},{-20,-28},{-20,-40}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.frame_b, body1.frame_a) annotation (Line(
                points={{-6,-20},{-6,-28},{-20,-28},{-20,-40}},
                color={95,95,95},
                thickness=0.5));
          end SpringDamperSystem;

          model SpringMassSystem
          "Mass attached with a spring to the world frame"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            annotation (
              experiment(StopTime=5),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This example shows the two different ways how force laws
can be utilized:
</p>
<ul>
<li>In the left system a body is attached via a prismatic
    joint to the world frame. The prismatic joint has two
    1-dimensional translational flanges (called \"support\" and \"axis\")
    that allows to connect elements from the Modelica.Mechanics.Translational
    library between the support and the axis connector. The effect is
    that the force generated by the 1-dimensional elements acts as driving
    force in the axis of the prismatic joint. In the example a simple
    spring is used.<br>
    The advantage of this approach is that the many elements from the
    Translational library can be easily used here and that this implementation
    is usually more efficient as when using 3-dimensional springs.</li>
<li>In the right system the same model is defined. The difference is
    that a 3-dimensional spring from the Modelica.Mechanics.MultiBody.Forces library is used.
    This has the advantage to get a nice animation of the force component.</li>
</ul>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/SpringMassSystem.png\"
ALT=\"model Examples.Elementary.SpringMassSystem\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world annotation (Placement(
                  transformation(extent={{-80,20},{-60,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Joints.Prismatic p1(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              s(fixed=true, start=0.1),
              v(fixed=true)) annotation (Placement(transformation(
                  origin={-20,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.Translational.Components.Spring spring1(
                                                            c=30, s_rel0=0.1) 
              annotation (Placement(transformation(
                  origin={10,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              m=1,
              sphereDiameter=0.2,
              animation=animation,
              r_CM={0,0,0})        annotation (Placement(transformation(
                  origin={-20,-50},
                  extent={{-10,10},{10,-10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0}) 
              annotation (Placement(transformation(extent={{-46,20},{-26,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0.3,0,0}) 
              annotation (Placement(transformation(extent={{0,20},{20,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              m=1,
              sphereDiameter=0.2,
              animation=animation,
              r_CM={0,0,0})        annotation (Placement(transformation(
                  origin={50,-50},
                  extent={{-10,10},{10,-10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Joints.Prismatic p2(useAxisFlange=true,
              n={0,-1,0},
              animation=animation,
              boxWidth=0.05,
              stateSelect=StateSelect.always,
              s(fixed=true, start=0.1),
              v(fixed=true)) annotation (Placement(transformation(
                  origin={50,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              c=30,
              s_unstretched=0.1,
              width=0.1) annotation (Placement(transformation(
                  origin={90,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
          equation
            connect(body1.frame_a, p1.frame_b) 
              annotation (Line(
                points={{-20,-40},{-20,-35},{-20,-35},{-20,-30},{-20,-20},{-20,-20}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, bar1.frame_a) 
              annotation (Line(
                points={{-60,30},{-46,30}},
                color={95,95,95},
                thickness=0.5));
            connect(bar1.frame_b, p1.frame_a) annotation (Line(
                points={{-26,30},{-20,30},{-20,0}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.flange_b, p1.axis) annotation (Line(points={{10,-20},{10,-30},
                    {-8,-30},{-8,-18},{-14,-18}}, color={0,191,0}));
            connect(bar1.frame_b, bar2.frame_a) 
              annotation (Line(
                points={{-26,30},{0,30}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, p2.frame_a) 
              annotation (Line(
                points={{20,30},{50,30},{50,0}},
                color={95,95,95},
                thickness=0.5));
            connect(p2.frame_b, body2.frame_a) 
              annotation (Line(
                points={{50,-20},{50,-40}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, spring2.frame_a) 
              annotation (Line(
                points={{20,30},{90,30},{90,0}},
                color={95,95,95},
                thickness=0.5));
            connect(body2.frame_a, spring2.frame_b) annotation (Line(
                points={{50,-40},{90,-40},{90,-20}},
                color={95,95,95},
                thickness=0.5));
            connect(spring1.flange_a, p1.support) annotation (Line(
                points={{10,0},{-8,0},{-8,-6},{-14,-6}},
                color={0,127,0},
                smooth=Smooth.None));
          end SpringMassSystem;

          model SpringWithMass "Point mass hanging on a spring"
            extends Modelica.Icons.Example;
            annotation (experiment(StopTime=5), Documentation(info="<html>
<p>
This example shows that a force component may have a mass.
The 3-dimensional spring as used in this example, has an optional
point mass between the two points where the spring is attached.
In the animation, this point mass is represented by a small,
light blue, sphere.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/SpringWithMass.png\"
ALT=\"model Examples.Elementary.SpringWithMass\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world(animateGravity=false) 
              annotation (Placement(transformation(extent={{-40,40},{-20,60}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring(
              s_unstretched=0.2,
              m=0.5,
              c=40,
              width=0.1,
              massDiameter=0.07) annotation (Placement(transformation(
                  origin={10,30},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.Body body(
              r_0(start={0,-0.3,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true,
              r_CM={0,0,0},
              m=1)                    annotation (Placement(transformation(
                  origin={10,-10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
          equation
            connect(world.frame_b, spring.frame_a) 
              annotation (Line(
                points={{-20,50},{10,50},{10,40}},
                color={95,95,95},
                thickness=0.5));
            connect(body.frame_a, spring.frame_b) 
              annotation (Line(
                points={{10,0},{10,10},{10,20}},
                color={95,95,95},
                thickness=0.5));
          end SpringWithMass;

          model ThreeSprings "3-dim. springs in series and parallel connection"
            extends Modelica.Icons.Example;
            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            annotation (
              experiment(StopTime=10),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={2,2}), graphics),
              Documentation(info="<html>
<p>
This example demonstrates that <b>3-dimensional line force</b> elements
(here: Modelica.Mechanics.MultiBody.Forces.Spring elements) can be connected together
in <b>series</b> without having a body with mass at the
connection point (as usually required by multi-body programs).
This is advantageous since stiff systems can be avoided, say, due to
a stiff spring and a small mass at the connection point.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/ThreeSprings.png\"
ALT=\"model Examples.Elementary.ThreeSprings\">
</p>
</html>"));
            inner Modelica.Mechanics.MultiBody.World world(animateWorld=animation) 
              annotation (Placement(transformation(extent={{-60,20},{-40,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              animation=animation,
              r_CM={0,-0.2,0},
              m=0.8,
              I_11=0.1,
              I_22=0.1,
              I_33=0.1,
              sphereDiameter=0.2,
              r_0(start={0.5,-0.3,0}, each fixed=true),
              v_0(each fixed=true),
              angles_fixed=true,
              w_0_fixed=true)     annotation (Placement(transformation(
                  origin={30,-70},
                  extent={{-10,10},{10,-10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar1(animation=animation, r={0.3,0,0}) 
              annotation (Placement(transformation(extent={{-20,20},{0,40}}, rotation=0)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring1(
              lineForce(r_rel_0(start={-0.2,-0.2,0.2})),
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              animation=animation) annotation (Placement(transformation(
                  origin={30,10},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation bar2(animation=animation, r={0,0,0.3}) 
              annotation (Placement(transformation(
                  origin={-30,-10},
                  extent={{10,-10},{-10,10}},
                  rotation=90)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring2(
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=40,
              animation=animation) annotation (Placement(transformation(
                  origin={30,-38},
                  extent={{-10,-10},{10,10}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Forces.Spring spring3(
              s_unstretched=0.1,
              width=0.1,
              coilWidth=0.005,
              numberOfWindings=5,
              c=20,
              animation=animation) annotation (Placement(transformation(extent={{-20,-42},
                      {0,-22}}, rotation=0)));
          equation
            connect(world.frame_b, bar1.frame_a) 
              annotation (Line(
                points={{-40,30},{-20,30}},
                color={95,95,95},
                thickness=0.5));
            connect(world.frame_b, bar2.frame_a) annotation (Line(
                points={{-40,30},{-30,30},{-30,0}},
                color={95,95,95},
                thickness=0.5));
            connect(bar1.frame_b, spring1.frame_a) 
              annotation (Line(
                points={{0,30},{30,30},{30,20}},
                color={95,95,95},
                thickness=0.5));
            connect(bar2.frame_b, spring3.frame_a) annotation (Line(
                points={{-30,-20},{-30,-32},{-20,-32}},
                color={95,95,95},
                thickness=0.5));
            connect(spring2.frame_b, body1.frame_a) 
              annotation (Line(
                points={{30,-48},{30,-51},{30,-60}},
                color={0,0,0},
                thickness=0.5));
            connect(spring3.frame_b, spring1.frame_b) 
              annotation (Line(
                points={{0,-32},{30,-14},{30,0}},
                color={95,95,95},
                thickness=0.5));
            connect(spring2.frame_a, spring1.frame_b) 
              annotation (Line(
                points={{30,-28},{30,-21},{30,-21},{30,-14},{30,0},{30,0}},
                color={95,95,95},
                thickness=0.5));
          end ThreeSprings;

          model RollingWheel
          "Single wheel rolling on ground starting from an initial speed"
             extends Modelica.Icons.Example;

            Modelica.Mechanics.MultiBody.Parts.RollingWheel wheel1(
              wheelRadius=0.3,
              wheelMass=2,
              wheel_I_axis=0.06,
              wheel_I_long=0.12,
              hollowFraction=0.6,
              x(start=0.2),
              y(start=0.2),
              der_angles(start={0,5,1})) 
              annotation (Placement(transformation(extent={{-20,0},{0,20}})));
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1}) 
              annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                      100}}),      graphics),
              experiment(StopTime=4),
              __Dymola_experimentSetupOutput,
              Documentation(info="<html>

</html>"));
            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(length=4) 
              annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
          end RollingWheel;

          model RollingWheelSetDriving
          "Rolling wheel set that is driven by torques driving the wheels"
             extends Modelica.Icons.Example;

            annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics),
              experiment(StopTime=3),
              __Dymola_experimentSetupOutput,
              Documentation(info="<html>

</html>"));
            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(
                          length=3, groundColor={0,255,0}) 
              annotation (Placement(transformation(extent={{-20,-60},{0,-40}})));
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1}) 
              annotation (Placement(transformation(extent={{-80,-60},{-60,-40}})));
            Modelica.Mechanics.MultiBody.Parts.RollingWheelSet wheelSet(
              wheelRadius=0.1,
              wheelMass=0.5,
              wheel_I_axis=0.01,
              wheel_I_long=0.02,
              wheelDistance=0.5,
              x(start=0.1, fixed=true),
              y(start=0.1, fixed=true),
              phi(fixed=true),
              theta1(fixed=true),
              theta2(fixed=true),
              der_theta1(fixed=true),
              der_theta2(fixed=true)) 
              annotation (Placement(transformation(extent={{-20,-20},{0,0}})));
            Modelica.Mechanics.MultiBody.Parts.Body body(m=0.01, r_CM={0,0,0},
              animation=false) 
              annotation (Placement(transformation(extent={{40,56},{60,76}})));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation(    r={0.2,0,0},
              animation=true,
              width=0.04) 
              annotation (Placement(transformation(extent={{0,56},{20,76}})));
            Modelica.Blocks.Sources.Sine sine1(freqHz=1, amplitude=2) 
              annotation (Placement(transformation(extent={{-80,20},{-60,40}})));
            Modelica.Blocks.Sources.Sine sine2(
              freqHz=1,
              amplitude=2,
              phase=1.5707963267949) 
              annotation (Placement(transformation(extent={{60,20},{40,40}})));
            Modelica.Mechanics.Rotational.Sources.Torque2 torque1 
              annotation (Placement(transformation(extent={{-40,4},{-20,24}})));
            Modelica.Mechanics.Rotational.Sources.Torque2 torque2 
              annotation (Placement(transformation(extent={{24,4},{4,24}})));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final shapeType="pipe",
              final r_shape={0,-wheelSet.wheelWidth,0},
              final length=2*wheelSet.wheelWidth,
              final width=2*wheelSet.wheelRadius,
              final height=2*wheelSet.wheelRadius,
              final color={0,128,255},
              final extra=0.8)        annotation (Placement(transformation(extent={{-10,-10},
                      {10,10}},
                  rotation=0,
                  origin={50,90})));
          equation
            connect(fixedTranslation.frame_a, wheelSet.frameMiddle) annotation (Line(
                points={{0,66},{-8,66},{-8,-6},{-10,-6},{-10,-10}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(fixedTranslation.frame_b, body.frame_a) annotation (Line(
                points={{20,66},{40,66}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(wheelSet.axis1, torque1.flange_a) annotation (Line(
                points={{-20,0},{-40,0},{-40,14}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(torque1.flange_b, wheelSet.support) annotation (Line(
                points={{-20,14},{-10,14},{-10,-1.8}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(wheelSet.axis2, torque2.flange_a) annotation (Line(
                points={{0,0},{24,0},{24,14}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(wheelSet.support, torque2.flange_b) annotation (Line(
                points={{-10,-1.8},{-10,14},{4,14}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(sine1.y, torque1.tau) annotation (Line(
                points={{-59,30},{-30,30},{-30,18}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(sine2.y, torque2.tau) annotation (Line(
                points={{39,30},{14,30},{14,18}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(shape.frame_a, fixedTranslation.frame_b) annotation (Line(
                points={{40,90},{28,90},{28,66},{20,66}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
          end RollingWheelSetDriving;

          model RollingWheelSetPulling
          "Rolling wheel set that is pulled by a force"
             extends Modelica.Icons.Example;

            Modelica.Mechanics.MultiBody.Forces.WorldForce force(animation=false) 
              annotation (Placement(transformation(extent={{-20,60},{0,80}})));
            annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics),
              experiment(StopTime=3),
              __Dymola_experimentSetupOutput,
              Documentation(info="<html>

</html>"));
            Modelica.Mechanics.MultiBody.Visualizers.Ground ground(
                          length=3) 
              annotation (Placement(transformation(extent={{-20,-40},{0,-20}})));
            inner Modelica.Mechanics.MultiBody.World world(label2="z", n={0,0,-1}) 
              annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
            Modelica.Mechanics.MultiBody.Parts.RollingWheelSet wheelSet(
              wheelRadius=0.1,
              wheelMass=0.5,
              wheel_I_axis=0.01,
              wheel_I_long=0.02,
              wheelDistance=0.5,
              x(start=0.1, fixed=true),
              y(start=0.1, fixed=true),
              phi(fixed=true),
              theta1(fixed=true),
              theta2(fixed=true),
              der_theta1(fixed=true),
              der_theta2(fixed=true)) 
              annotation (Placement(transformation(extent={{-20,0},{0,20}})));
            Modelica.Mechanics.MultiBody.Parts.Body body(m=0.01, r_CM={0,0,0},
              animation=false) 
              annotation (Placement(transformation(extent={{42,20},{62,40}})));
            Modelica.Blocks.Sources.CombiTimeTable combiTimeTable(table=[0,1,0,0; 1,1,
                  0,0; 2,0,2,0; 3,0,2,0]) 
              annotation (Placement(transformation(extent={{-80,70},{-60,90}})));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation
            fixedTranslation(    r={0.2,0,0},
              animation=true,
              width=0.04) 
              annotation (Placement(transformation(extent={{0,20},{20,40}})));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape(
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final shapeType="pipe",
              final r_shape={0,-wheelSet.wheelWidth,0},
              final length=2*wheelSet.wheelWidth,
              final width=2*wheelSet.wheelRadius,
              final height=2*wheelSet.wheelRadius,
              final color={0,128,255},
              final extra=0.8)        annotation (Placement(transformation(extent={{-10,-10},
                      {10,10}},
                  rotation=0,
                  origin={52,54})));
          equation
            connect(combiTimeTable.y, force.force) annotation (Line(
                points={{-59,80},{-42,80},{-42,70},{-22,70}},
                color={0,0,127},
                smooth=Smooth.None));
            connect(fixedTranslation.frame_a, wheelSet.frameMiddle) annotation (Line(
                points={{0,30},{-6,30},{-6,14},{-10,14},{-10,10}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(fixedTranslation.frame_b, body.frame_a) annotation (Line(
                points={{20,30},{42,30}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(force.frame_b, fixedTranslation.frame_b) annotation (Line(
                points={{0,70},{34,70},{34,30},{20,30}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(shape.frame_a, fixedTranslation.frame_b) annotation (Line(
                points={{42,54},{34,54},{34,30},{20,30}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
          end RollingWheelSetPulling;
        annotation ( Documentation(info="<HTML>
<p>
This package contains elementary example models to demonstrate
the usage of the MultiBody library
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.DoublePendulum\">DoublePendulum</a></td>
      <td valign=\"top\"> Simple double pendulum with two revolute joints and two bodies.<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/DoublePendulumSmall.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.ForceAndTorque\">ForceAndTorque</a></td>
      <td valign=\"top\"> Demonstrates usage of Forces.ForceAndTorque element.<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/ForceAndTorque_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.FreeBody\">FreeBody</a></td>
      <td valign=\"top\"> Free flying body attached by two springs to environment.<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/FreeBody_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.InitSpringConstant\">InitSpringConstant</a></td>
      <td valign=\"top\"> Determine spring constant such that system is in steady state
           at given position.<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/InitSpringConstant_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.LineForceWithTwoMasses\">LineForceWithTwoMasses</a></td>
      <td valign=\"top\"> Demonstrates a line force with two point masses using a
           Joints.Assemblies.JointUPS and alternatively a
           Forces.LineForceWithTwoMasses component.<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/LineForceWithTwoMasses_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.Pendulum\">Pendulum</a></td>
      <td valign=\"top\"> Simple pendulum with one revolute joint and one body. <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/Pendulum_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PendulumWithSpringDamper\">PendulumWithSpringDamper</a></td>
      <td valign=\"top\"> Simple spring/damper/mass system <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/PendulumWithSpringDamper_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravity\">PointGravity</a></td>
      <td valign=\"top\"> Two bodies in a point gravity field <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/PointGravity_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravityWithPointMasses\">PointGravityWithPointMasses</a></td>
      <td valign=\"top\"> Two point masses in a point gravity field (rotation of bodies is neglected) <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/PointGravityWithPointMasses_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.PointGravityWithPointMasses2\">PointGravityWithPointMasses2</a></td>
      <td valign=\"top\"> Rigidly connected point masses in a point gravity field <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/PointGravityWithPointMasses2_small.png\">
      </td>
  </tr>

  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheel\">RollingWheel</a></td>
      <td valign=\"top\"> Single wheel rolling on ground starting from an initial speed <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/RollingWheel.png\">
      </td>
  </tr>


  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheelSetDriving\">RollingWheelSetDriving</a></td>
      <td valign=\"top\"> Rolling wheel set that is driven by torques driving the wheels <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/RollingWheelSetDriving.png\">
      </td>
  </tr>


  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.RollingWheelSetPulling\">RollingWheelSetPulling</a></td>
      <td valign=\"top\"> Rolling wheel set that is pulled by a force <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/RollingWheelSetPulling.png\">
      </td>
  </tr>


  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringDamperSystem\">SpringDamperSystem</a></td>
      <td valign=\"top\"> Spring/damper system with a prismatic joint and
           attached on free flying body <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/SpringDamperSystem_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringMassSystem\">SpringMassSystem</a></td>
      <td valign=\"top\"> Mass attached via a prismatic joint and a spring to the world frame <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/SpringMassSystem_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.SpringWithMass\">SpringWithMass</a></td>
      <td valign=\"top\"> Point mass hanging on a spring <br>
      <img src=\"../Images/MultiBody/Examples/Elementary/SpringWithMass_small.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.ThreeSprings\">ThreeSprings</a></td>
      <td valign=\"top\"> 3-dimensional springs in series and parallel connection<br>
      <img src=\"../Images/MultiBody/Examples/Elementary/ThreeSprings_small.png\">
      </td>
  </tr>
</table>
</HTML>"));
        end Elementary;
      annotation ( Documentation(info="<html>
<p>
This package contains example models to demonstrate the usage of the
MultiBody package. Open the models and
simulate them according to the provided description in the models.
</p>

</HTML>
"));
      end Examples;

      package Forces
      "Components that exert forces and/or torques between frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
This package contains components that exert forces and torques
between two frame connectors, e.g., between two parts.
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.WorldForce\">WorldForce</a></td>
      <td valign=\"top\"> External force acting at the frame to which this component
           is connected and defined by 3 input signals,
           that are interpreted as one vector resolved in frame world, frame_b or frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowForce.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.WorldTorque\">WorldTorque</a></td>
      <td valign=\"top\"> External torque acting at the frame to which this component
           is connected and defined by 3 input signals,
           that are interpreted as one vector resolved in frame world, frame_b or frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowTorque.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.WorldForceAndTorque\">WorldForceAndTorque</a></td>
      <td valign=\"top\"> External force and external torque acting at the frame
           to which this component
           is connected and defined by 3+3 input signals,
           that are interpreted as a force and as a torque vector
           resolved in frame world, frame_b or frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowForce.png\"><br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowTorque.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.Force\">Force</a></td>
      <td valign=\"top\"> Force acting between two frames defined by 3 input signals
           resolved in frame world, frame_a, frame_b or in frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowForce2.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.Torque\">Torque</a></td>
      <td valign=\"top\"> Torque acting between two frames defined by 3 input signals
           resolved in frame world, frame_a, frame_b or in frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowTorque2.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.ForceAndTorque\">ForceAndTorque</a></td>
      <td valign=\"top\"> Force and torque acting between two frames defined by 3+3 input signals
           resolved in frame world, frame_a, frame_b or in frame_resolve. <br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowForce2.png\"><br>
           <IMG SRC=\"../Images/MultiBody/Forces/ArrowTorque2.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.LineForceWithMass\">LineForceWithMass</a></td>
      <td valign=\"top\">  General line force component with an optional point mass
            on the connection line. The force law can be defined by a
            component of Modelica.Mechanics.Translational<br>
           <IMG SRC=\"../Images/MultiBody/Forces/LineForceWithMass.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.LineForceWithTwoMasses\">LineForceWithTwoMasses</a></td>
      <td valign=\"top\">  General line force component with two optional point masses
            on the connection line. The force law can be defined by a
            component of Modelica.Mechanics.Translational<br>
           <IMG SRC=\"../Images/MultiBody/Forces/LineForceWithTwoMasses.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.Spring\">Spring</a></td>
      <td valign=\"top\"> Linear translational spring with optional mass <br>
           <IMG SRC=\"../Images/MultiBody/Forces/Spring2.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.Damper\">Damper</a></td>
      <td valign=\"top\"> Linear (velocity dependent) damper <br>
           <IMG SRC=\"../Images/MultiBody/Forces/Damper2.png\"></td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.SpringDamperParallel\">SpringDamperParallel</a></td>
      <td valign=\"top\"> Linear spring and damper in parallel connection </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Forces.SpringDamperSeries\">SpringDamperSeries</a></td>
      <td valign=\"top\"> Linear spring and damper in series connection </td>
  </tr>
</table>
</HTML>"));

        model WorldForce
        "External force acting at frame_b, defined by 3 input signals and resolved in frame world, frame_b or frame_resolve"

          import SI = Modelica.SIunits;
          extends Interfaces.PartialOneFrame_b;
          Interfaces.Frame_resolve frame_resolve if 
               resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve
          "The input signals are optionally resolved in this frame" 
            annotation (Placement(transformation(
                origin={0,-100},
                extent={{-16,-16},{16,16}},
                rotation=270)));
          Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
            final unit =   "N")
          "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame"
            annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                  rotation=0)));
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameB
          resolveInFrame=
            Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world
          "Frame in which input force is resolved (1: world, 2: frame_b, 3: frame_resolve)";
          parameter Real N_to_m(unit="N/m") = world.defaultN_to_m
          "Force arrow scaling (length = force/N_to_m)" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Diameter diameter=world.defaultArrowDiameter
          "Diameter of force arrow"   annotation (Dialog(group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ForceColor
          "Color of arrow" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(group="if animation = true", enable=animation));

          annotation (defaultComponentName="force",
            Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                    100,100}}), graphics),
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                    100}}), graphics={
                Text(
                  extent={{-89,-46},{91,-76}},
                  lineColor={192,192,192},
                  textString="resolve"),
                Polygon(
                  points={{-100,10},{50,10},{50,31},{94,0},{50,-31},{50,-10},{-100,-10},
                      {-100,10}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-149,103},{136,42}},
                  textString="%name",
                  lineColor={0,0,255}),
                Line(
                  points={{0,-10},{0,-95}},
                  color={95,95,95},
                  pattern=LinePattern.Dot)}),
            Documentation(info="<HTML>

<p>
The <b>3</b> signals of the <b>force</b> connector are interpreted
as the x-, y- and z-coordinates of a <b>force</b> acting at the frame
connector to which frame_b of this component is attached.
Via parameter <b>resolveInFrame</b> it is defined, in which frame these
coordinates shall be resolved:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve input force in world frame (= default)</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve input force in frame_b</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve input force in frame_resolve (frame_resolve must be connected)</td></tr>
</table>

<p>
If resolveInFrame = Types.ResolveInFrameB.frame_resolve, the force coordinates
are with respect to the frame, that is connected to <b>frame_resolve</b>.
<p>

<p>
If force={100,0,0}, and for all parameters the default setting is used,
then the interpretation is that a force of 100 N is acting along the positive
x-axis of frame_b.
</p>

<p>
Note, the cut-torque in frame_b (frame_b.t) is always set to zero.
Conceptually, a force and torque acts on the world frame in such a way that
the force and torque balance between world.frame_b and frame_b is fulfilled.
For efficiency reasons, this reaction torque is, however, not computed.
</p>

<p>
This force component is by default visualized as an arrow
acting at the connector to which it is connected. The diameter
and color of the arrow can be defined via
variables <b>diameter</b> and <b>color</b>. The arrow
points in the direction defined by the
force signal. The length of the arrow is proportional
to the length of the force vector using parameter
<b>N_to_m</b> as scaling factor. For example, if N_to_m = 100 N/m,
then a force of 350 N is displayed as an arrow of length 3.5 m.
</p>
<p>
An example how to use this model is given in the
following figure:
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Forces/WorldForce1.png\">
</p>
<p>
This leads to the following animation
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Forces/WorldForce2.png\">
</p>

</HTML>
"));

      protected
          SI.Position f_in_m[3]=frame_b.f/N_to_m
          "Force mapped from N to m for animation";
          Visualizers.Advanced.Arrow arrow(
            diameter=diameter,
            color=color,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=f_in_m,
            r_head=-f_in_m) if world.enableAnimation and animation;

      public
          Internal.BasicWorldForce basicWorldForce(resolveInFrame=resolveInFrame) 
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
      protected
          Interfaces.ZeroPosition zeroPosition if 
               not (resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.frame_resolve) 
            annotation (Placement(transformation(extent={{20,-40},{40,-20}})));
        equation
          connect(basicWorldForce.frame_b, frame_b) annotation (Line(
              points={{10,0},{100,0}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(basicWorldForce.force, force) annotation (Line(
              points={{-12,0},{-120,0}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(basicWorldForce.frame_resolve, frame_resolve) annotation (Line(
              points={{0,-10},{0,-100}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(zeroPosition.frame_resolve, basicWorldForce.frame_resolve) 
            annotation (Line(
              points={{20,-30},{0,-30},{0,-10}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
        end WorldForce;

        model ForceAndTorque
        "Force and torque acting between two frames, defined by 3+3 input signals and resolved in frame world, frame_a, frame_b or frame_resolve"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;

          Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
            final unit =   "N")
          "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame"
            annotation (Placement(transformation(
                origin={-80,120},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Blocks.Interfaces.RealInput torque[3](each final quantity="Torque", each
            final unit =   "N.m")
          "x-, y-, z-coordiantes of torque resolved in frame defined by resolveInFrame"
            annotation (Placement(transformation(
                origin={0,120},
                extent={{-20,-20},{20,20}},
                rotation=270)));
          Interfaces.Frame_resolve frame_resolve if 
               resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve
          "The input signals are optionally resolved in this frame" 
            annotation (Placement(transformation(
                origin={80,100},
                extent={{-16,-16},{16,16}},
                rotation=90)));

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
          resolveInFrame=
            Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
          "Frame in which input force and torque are resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";
          parameter Real N_to_m(unit="N/m") = world.defaultN_to_m
          "Force arrow scaling (length = force/N_to_m)" 
            annotation (Dialog(group="if animation = true", enable=animation));
          parameter Real Nm_to_m(unit="N.m/m") = world.defaultNm_to_m
          "Torque arrow scaling (length = torque/Nm_to_m)" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Diameter forceDiameter=world.defaultArrowDiameter
          "Diameter of force arrow"   annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Diameter torqueDiameter=forceDiameter
          " Diameter of torque arrow"   annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Diameter connectionLineDiameter=forceDiameter
          "Diameter of line connecting frame_a and frame_b" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.Color forceColor=Modelica.Mechanics.MultiBody.Types.Defaults.ForceColor
          "Color of force arrow"   annotation (Dialog(group="if animation = true", enable=animation));
          input Types.Color torqueColor=Modelica.Mechanics.MultiBody.Types.Defaults.TorqueColor
          "Color of torque arrow"   annotation (Dialog(group="if animation = true", enable=animation));
          input Types.Color connectionLineColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          "Color of line connecting frame_a and frame_b" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(group="if animation = true", enable=animation));

          annotation (
            Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                    100,100}},
                grid={2,2}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                    100}},
                grid={2,2}), graphics={
                Rectangle(
                  extent={{-98,99},{99,-98}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-59,55},{72,30}},
                  lineColor={192,192,192},
                  textString="resolve"),
                Text(
                  extent={{-136,-52},{149,-113}},
                  textString="%name",
                  lineColor={0,0,255}),
                Polygon(
                  points={{100,21},{84,55},{69,39},{100,21}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{80,100},{80,0}},
                  color={95,95,95},
                  pattern=LinePattern.Dot),
                Polygon(
                  points={{-95,1},{-64,11},{-64,-10},{-95,1}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{-100,20},{-86,53},{-70,42},{-100,20}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{-80,100},{80,100}},
                  color={95,95,95},
                  pattern=LinePattern.Dot),
                Polygon(
                  points={{94,0},{65,12},{65,-11},{94,0}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{-64,0},{-20,0}}, color={0,0,0}),
                Line(points={{20,0},{65,0}}, color={0,0,0}),
                Line(points={{-79,47},{-70,61},{-59,72},{-45,81},{-32,84},{-20,85}},
                    color={0,0,0}),
                Line(points={{76,47},{66,60},{55,69},{49,74},{41,80},{31,84},{20,85}},
                    color={0,0,0}),
                Text(
                  extent={{-144,124},{-106,102}},
                  lineColor={0,0,0},
                  textString="f"),
                Text(
                  extent={{20,124},{58,102}},
                  lineColor={0,0,0},
                  textString="t")}),
            Documentation(info="<HTML>
The <b>3</b> signals of the <b>force</b> connector and the
<b>3</b> signals of the <b>torque</b> connector
are interpreted
as the x-, y- and z-coordinates of a <b>force</b> and of a
<b>torque</b> acting at the frame
connector to which frame_b of this component is attached.
Via parameter <b>resolveInFrame</b> it is defined, in which frame these
coordinates shall be resolved:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameAB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve input force/torque in world frame</td></tr>

<tr><td valign=\"top\">frame_a</td>
    <td valign=\"top\">Resolve input force/torque in frame_a</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve input force/torque in frame_b (= default)</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve input force/torque in frame_resolve (frame_resolve must be connected)</td></tr>
</table>

<p>
If resolveInFrame = ResolveInFrameAB.frame_resolve, the force and torque coordinates
are with respect to the frame, that is connected to <b>frame_resolve</b>.
<p>

<p>
If force={100,0,0}, and for all parameters the default setting is used,
then the interpretation is that a force of 100 N is acting along the positive
x-axis of frame_b.
</p>

<p>
Note, a force and torque acts on frame_a in such a way that
the force and torque balance between frame_a and frame_b is fulfilled.
</p>

<p>
An example how to use this model is given in the
following figure:
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Forces/ForceAndTorque1.png\">
</p>
<p>
This leads to the following animation (the yellow cylinder
characterizes the line between frame_a and frame_b of the
ForceAndTorque component, i.e., the force and torque acts with
negative sign
also on the opposite side of this cylinder, but for
clarity this is not shown in the animation):
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Forces/ForceAndTorque2.png\">
</p>
</HTML>
"));

      protected
          SI.Position f_in_m[3]=frame_b.f/N_to_m
          "Force mapped from N to m for animation";
          SI.Position t_in_m[3]=frame_b.t/Nm_to_m
          "Torque mapped from Nm to m for animation";
          Visualizers.Advanced.Arrow forceArrow(
            diameter=forceDiameter,
            color=forceColor,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=f_in_m,
            r_head=-f_in_m) if world.enableAnimation and animation;
          Visualizers.Advanced.DoubleArrow torqueArrow(
            diameter=torqueDiameter,
            color=torqueColor,
            specularCoefficient=specularCoefficient,
            R=frame_b.R,
            r=frame_b.r_0,
            r_tail=t_in_m,
            r_head=-t_in_m) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape connectionLine(
            shapeType="cylinder",
            lengthDirection=basicForce.r_0,
            widthDirection={0,1,0},
            length=Modelica.Math.Vectors.length(
                                 basicForce.r_0),
            width=connectionLineDiameter,
            height=connectionLineDiameter,
            color=connectionLineColor,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0) if world.enableAnimation and animation;

      public
          Internal.BasicForce basicForce(resolveInFrame=resolveInFrame) 
            annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
          Internal.BasicTorque basicTorque(resolveInFrame=resolveInFrame) 
            annotation (Placement(transformation(extent={{-4,10},{16,30}})));
      protected
          Interfaces.ZeroPosition zeroPosition if 
               not (resolveInFrame == Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_resolve) 
            annotation (Placement(transformation(extent={{20,30},{40,50}})));
        equation
          connect(basicForce.frame_a, frame_a) annotation (Line(
              points={{-84,0},{-100,0}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(basicForce.frame_b, frame_b) annotation (Line(
              points={{-64,0},{100,0}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(basicTorque.frame_b, frame_b) annotation (Line(
              points={{16,20},{68,20},{68,0},{100,0}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(basicTorque.frame_a, frame_a) annotation (Line(
              points={{-4,20},{-90,20},{-90,0},{-100,0}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
          connect(basicForce.force, force) annotation (Line(
              points={{-80,12},{-80,120}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(basicTorque.torque, torque) annotation (Line(
              points={{0,32},{0,120}},
              color={0,0,127},
              smooth=Smooth.None));
          connect(basicTorque.frame_resolve, frame_resolve) annotation (Line(
              points={{10,30},{10,80},{80,80},{80,100}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(basicForce.frame_resolve, frame_resolve) annotation (Line(
              points={{-70,10},{-70,80},{80,80},{80,100}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(zeroPosition.frame_resolve, basicTorque.frame_resolve)  annotation (
              Line(
              points={{20,40},{10,40},{10,30}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
          connect(zeroPosition.frame_resolve, basicForce.frame_resolve) annotation (
              Line(
              points={{20,40},{-70,40},{-70,10}},
              color={95,95,95},
              pattern=LinePattern.Dot,
              smooth=Smooth.None));
        end ForceAndTorque;

        model LineForceWithMass
        "General line force component with an optional point mass on the connection line"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Interfaces.PartialTwoFrames;
          Modelica.Mechanics.Translational.Interfaces.Flange_a flange_b
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)"
            annotation (Placement(transformation(
                origin={60,100},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica.Mechanics.Translational.Interfaces.Flange_b flange_a
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)"
            annotation (Placement(transformation(
                origin={-60,100},
                extent={{-10,-10},{10,10}},
                rotation=90)));

          parameter Boolean animateLine=true
          "= true, if a line shape between frame_a and frame_b shall be visualized";
          parameter Boolean animateMass=true
          "= true, if point mass shall be visualized as sphere provided m > 0";
          parameter SI.Mass m(min=0)=0
          "Mass of point mass on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter Real lengthFraction(
            unit="1",
            min=0,
            max=1) = 0.5
          "Location of point mass with respect to frame_a as a fraction of the distance from frame_a to frame_b";
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation"));
          parameter Types.ShapeType lineShapeType="cylinder"
          " Type of shape visualizing the line from frame_a to frame_b" 
            annotation (Dialog(tab="Animation", group="if animateLine = true", enable=animateLine));
          input SI.Length lineShapeWidth=world.defaultArrowDiameter
          " Width of shape" 
            annotation (Dialog(tab="Animation", group="if animateLine = true", enable=animateLine));
          input SI.Length lineShapeHeight=lineShapeWidth " Height of shape" 
            annotation (Dialog(tab="Animation", group="if animateLine = true", enable=animateLine));
          parameter Types.ShapeExtra lineShapeExtra=0.0
          " Extra parameter for shape" 
            annotation (Dialog(tab="Animation", group="if animateLine = true", enable=animateLine));
          input Types.Color lineShapeColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          " Color of line shape" 
            annotation (Dialog(tab="Animation", group="if animateLine = true", enable=animateLine));
          input Real massDiameter=world.defaultBodyDiameter
          " Diameter of point mass sphere" 
            annotation (Dialog(tab="Animation", group="if animateMass = true", enable=animateMass));
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of point mass" 
            annotation (Dialog(tab="Animation", group="if animateMass = true", enable=animateMass));
          parameter SI.Position s_small=1.E-10
          " Prevent zero-division if distance between frame_a and frame_b is zero"
            annotation (Dialog(tab="Advanced"));
          SI.Distance length
          "Distance between the origin of frame_a and the origin of frame_b";
          SI.Position r_rel_0[3]
          "Position vector from frame_a to frame_b resolved in world frame";
          Real e_rel_0[3](each final unit="1")
          "Unit vector in direction from frame_a to frame_b, resolved in world frame";
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Ellipse(
                  extent={{-95,-40},{-15,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{-85,-30},{-25,30}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{15,-40},{95,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{23,-30},{83,29}},
                  lineColor={128,128,128},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-145,-53},{145,-113}},
                  textString="%name",
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-40,41},{44,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-70,15},{-41,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{40,14},{69,-14}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Line(points={{-56,0},{-56,23},{-30,23},{-30,70},{-60,70},{-60,101}},
                    color={0,0,0}),
                Line(points={{55,-1},{55,20},{30,20},{30,70},{60,70},{60,100}}, color=
                     {0,0,0}),
                Line(
                  points={{-56,0},{55,-1}},
                  color={0,0,0},
                  pattern=LinePattern.Dot),
                Ellipse(
                  extent={{-8,8},{8,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-60,80},{46,80}}, color={0,0,255}),
                Polygon(
                  points={{60,80},{45,86},{45,74},{60,80}},
                  lineColor={0,0,255},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-22,100},{20,76}},
                  textString="length",
                  lineColor={0,0,255}),
                Ellipse(
                  extent={{-100,-40},{-20,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{-90,-30},{-30,30}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{20,-40},{100,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{31,-29},{91,30}},
                  lineColor={128,128,128},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-50,39},{50,-41}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-74,15},{-45,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{45,15},{74,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Line(points={{-60,0},{-60,24},{-40,24},{-40,60},{-60,60},{-60,100}},
                    color={0,0,0}),
                Line(points={{60,1},{60,21},{40,21},{40,60},{60,60},{60,100}}, color=
                      {0,0,0}),
                Line(
                  points={{-60,0},{60,0}},
                  color={0,0,0},
                  pattern=LinePattern.Dot),
                Ellipse(
                  extent={{-8,8},{8,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{-60,0},{-31,0}}, color={0,0,255}),
                Polygon(points={{-19,0},{-31,3},{-31,-3},{-19,0}}, lineColor={0,0,255}),
                Line(points={{-60,16},{0,16}}, color={0,0,255}),
                Line(points={{0,0},{0,20}}, color={0,0,255}),
                Text(
                  extent={{-43,-8},{-7,-33}},
                  lineColor={0,0,0},
                  textString="e_rel_0"),
                Polygon(points={{0,16},{-12,19},{-12,13},{0,16}}, lineColor={0,0,255}),
                Text(
                  extent={{-50,35},{51,26}},
                  lineColor={0,0,0},
                  textString="length*lengthFraction"),
                Line(
                  points={{-17,26},{-26,16}},
                  pattern=LinePattern.Dot,
                  color={0,0,255}),
                Line(
                  points={{-31,-13},{-40,0}},
                  pattern=LinePattern.Dot,
                  color={0,0,255})}),
            Documentation(info="<html>
<p>
This component is used to exert a <b>line force</b>
between the origin of frame_a and the origin of frame_b
by attaching components of the <b>1-dimensional translational</b>
mechanical library of Modelica (Modelica.Mechanics.Translational)
between the two flange connectors <b>flange_a</b> and
<b>flange_b</b>. Optionally, there is a <b>point mass</b> on the line
connecting the origin of frame_a and the origin of frame_b.
This point mass approximates the <b>mass</b> of the <b>force element</b>.
The distance of the point mass from frame_a as a fraction of the
distance between frame_a and frame_b is defined via
parameter <b>lengthFraction</b> (default is 0.5, i.e., the point
mass is in the middle of the line).
</p>
<p>
In the translational library there is the implicit assumption that
forces of components that have only one flange connector act with
opposite sign on the bearings of the component. This assumption
is also used in the LineForceWithMass component: If a connection
is present to only one of the flange connectors, then the force
in this flange connector acts implicitly with opposite sign also
in the other flange connector.
</p>
</html>"));

      protected
          SI.Force fa "Force from flange_a";
          SI.Force fb "Force from flange_b";
          SI.Position r_CM_0[3](each stateSelect=StateSelect.avoid)
          "Position vector from world frame to point mass, resolved in world frame";
          SI.Velocity v_CM_0[3](each stateSelect=StateSelect.avoid)
          "First derivative of r_CM_0";
          SI.Acceleration ag_CM_0[3] "der(v_CM_0) - gravityAcceleration";

          Visualizers.Advanced.Shape lineShape(
            shapeType=lineShapeType,
            color=lineShapeColor,
            specularCoefficient=specularCoefficient,
            length=length,
            width=lineShapeWidth,
            height=lineShapeHeight,
            lengthDirection=e_rel_0,
            widthDirection=Frames.resolve1(frame_a.R, {0,1,0}),
            extra=lineShapeExtra,
            r=frame_a.r_0) if world.enableAnimation and animateLine;

          Visualizers.Advanced.Shape massShape(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r_shape=e_rel_0*(length*lengthFraction - massDiameter/2),
            r=frame_a.r_0) if world.enableAnimation and animateMass and m > 0;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);
          assert(noEvent(length > s_small), "
The distance between the origin of frame_a and the origin of frame_b
of a LineForceWithMass component became smaller as parameter s_small
(= a small number, defined in the \"Advanced\" menu). The distance is
set to s_small, although it is smaller, to avoid a division by zero
when computing the direction of the line force. Possible reasons
for this situation:
- At initial time the distance may already be zero: Change the initial
  positions of the bodies connected by this element.
- Hardware stops are not modeled or are modeled not stiff enough.
  Include stops, e.g., stiff springs, or increase the stiffness
  if already present.
- Another error in your model may lead to unrealistically large forces
  and torques that would in reality destroy the stops.
- The flange_b connector might be defined by a pre-defined motion,
  e.g., with Modelica.Mechanics.Translational.Position and the
  predefined flange_b.s is zero or negative.
");

          // Determine relative position vector between the two frames
          r_rel_0 = frame_b.r_0 - frame_a.r_0;
          length = Modelica.Math.Vectors.length(
                                 r_rel_0);
          flange_a.s = 0;
          flange_b.s = length;
          e_rel_0 = r_rel_0/Frames.Internal.maxWithoutEvent(length, s_small);

          // Determine translational flange forces
          if cardinality(flange_a) > 0 and cardinality(flange_b) > 0 then
            fa = flange_a.f;
            fb = flange_b.f;
          elseif cardinality(flange_a) > 0 and cardinality(flange_b) == 0 then
            fa = flange_a.f;
            fb = -fa;
          elseif cardinality(flange_a) == 0 and cardinality(flange_b) > 0 then
            fa = -fb;
            fb = flange_b.f;
          else
            fa = 0;
            fb = 0;
          end if;

          /* Force and torque balance of point mass
     - Kinematics for center of mass CM of point mass including gravity
       r_CM_0 = frame_a.r0 + r_rel_CM_0;
       v_CM_0 = der(r_CM_0);
       ag_CM_0 = der(v_CM_0) - world.gravityAcceleration(r_CM_0);
     - Power balance for the connection line
       (f1=force on frame_a side, f2=force on frame_b side, h=lengthFraction)
       0 = f1*va - m*ag_CM*(va+(vb-va)*h) + f2*vb
         = (f1 - m*ag_CM*(1-h))*va + (f2 - m*ag_CM*h)*vb
       since va and vb are completely indepedent from other
       the paranthesis must vanish:
         f1 := m*ag_CM*(1-h)
         f2 := m*ag_CM*h
     - Force balance on frame_a and frame_b finally results in
         0 = frame_a.f + e_rel_a*fa - f1_a
         0 = frame_b.f + e_rel_b*fb - f2_b
       and therefore
         frame_a.f = -e_rel_a*fa + m*ag_CM_a*(1-h)
         frame_b.f = -e_rel_b*fb + m*ag_CM_b*h
  */
          if m > 0 then
            r_CM_0 = frame_a.r_0 + r_rel_0*lengthFraction;
            v_CM_0 = der(r_CM_0);
            ag_CM_0 = der(v_CM_0) - world.gravityAcceleration(r_CM_0);
            frame_a.f = Frames.resolve2(frame_a.R, (m*(1 - lengthFraction))*ag_CM_0
               - e_rel_0*fa);
            frame_b.f = Frames.resolve2(frame_b.R, (m*lengthFraction)*ag_CM_0 -
              e_rel_0*fb);
          else
            r_CM_0 = zeros(3);
            v_CM_0 = zeros(3);
            ag_CM_0 = zeros(3);
            frame_a.f = -Frames.resolve2(frame_a.R, e_rel_0*fa);
            frame_b.f = -Frames.resolve2(frame_b.R, e_rel_0*fb);
          end if;

          // Provide appropriate equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;
        end LineForceWithMass;

        model LineForceWithTwoMasses
        "General line force component with two optional point masses on the connection line"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          extends Interfaces.PartialTwoFrames;
          Modelica.Mechanics.Translational.Interfaces.Flange_a flange_b
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)"
            annotation (Placement(transformation(
                origin={60,110},
                extent={{-10,-10},{10,10}},
                rotation=90)));
          Modelica.Mechanics.Translational.Interfaces.Flange_b flange_a
          "1-dim. translational flange (connect force of Translational library between flange_a and flange_b)"
            annotation (Placement(transformation(
                origin={-60,110},
                extent={{-10,-10},{10,10}},
                rotation=90)));

          parameter Boolean animate=true
          "= true, if animation shall be enabled";
          parameter Boolean animateMasses=true
          "= true, if point masses shall be visualized provided animate=true and m_a, m_b > 0";
          parameter SI.Mass m_a(min=0)=0
          "Mass of point mass a on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter SI.Mass m_b(min=0)=0
          "Mass of point mass b on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter SI.Position L_a=0
          "Distance between point mass a and frame_a (positive, if in direction of frame_b)";
          parameter SI.Position L_b=L_a
          "Distance between point mass b and frame_b (positive, if in direction of frame_a)";
          input SI.Diameter cylinderDiameter_a=world.defaultForceWidth
          " Diameter of cylinder at frame_a" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_a if animation = true", enable=animate));
          parameter SI.Length cylinderLength_a=2*L_a
          " Length of cylinder at frame_a" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_a if animation = true", enable=animate));
          input Types.Color color_a={155,155,155}
          " Color of cylinder at frame_a" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_a if animation = true", enable=animate));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_a if animation = true", enable=animate));
          input Real diameterFraction=0.8
          " Diameter of cylinder at frame_b with respect to diameter of cylinder at frame_a"
            annotation (Dialog(tab="Animation", group="Cylinder at frame_b if animation = true", enable=animate));
          parameter SI.Length cylinderLength_b=2*L_b
          " Length of cylinder at frame_b" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_b if animation = true", enable=animate));
          input Types.Color color_b={100,100,100}
          " Color of cylinder at frame_b" 
            annotation (Dialog(tab="Animation", group="Cylinder at frame_b if animation = true", enable=animate));
          input Real massDiameterFaction=1.7
          " Diameter of point mass spheres with respect to cylinderDiameter_a" 
            annotation (Dialog(tab="Animation", group="if animation = true and animateMasses = true", enable=animate and animateMasses));
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of point masses" 
            annotation (Dialog(tab="Animation", group="if animation = true and animateMasses = true", enable=animate and animateMasses));
          parameter SI.Position s_small=1.E-10
          " Prevent zero-division if distance between frame_a and frame_b is zero"
            annotation (Dialog(tab="Advanced"));
          SI.Distance length
          "Distance between the origin of frame_a and the origin of frame_b";
          SI.Position r_rel_0[3]
          "Position vector from frame_a to frame_b resolved in world frame";
          Real e_rel_0[3](each final unit="1")
          "Unit vector in direction from frame_a to frame_b, resolved in world frame";
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Ellipse(
                  extent={{-100,-40},{-20,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{-90,-30},{-30,30}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{20,-40},{100,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{31,-29},{91,30}},
                  lineColor={128,128,128},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-145,-53},{145,-113}},
                  textString="%name",
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-52,40},{48,-40}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-74,15},{-45,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{45,14},{74,-14}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Line(points={{-60,0},{-60,23},{-30,23},{-30,70},{-60,70},{-60,101}},
                    color={0,0,0}),
                Line(points={{60,0},{60,20},{30,20},{30,70},{60,70},{60,100}}, color=
                      {0,0,0}),
                Line(
                  points={{-23,0},{25,0}},
                  color={0,0,0},
                  pattern=LinePattern.Dot),
                Ellipse(
                  extent={{23,8},{39,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-39,8},{-23,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{-60,0},{-29,0}}, color={0,0,0}),
                Line(points={{29,0},{60,0}}, color={0,0,0})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-60,80},{46,80}}, color={0,0,255}),
                Polygon(
                  points={{60,80},{45,86},{45,74},{60,80}},
                  lineColor={0,0,255},
                  fillColor={0,0,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-22,100},{20,76}},
                  textString="length",
                  lineColor={0,0,255}),
                Ellipse(
                  extent={{-100,-40},{-20,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{-90,-30},{-30,30}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{20,-40},{100,40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{31,-29},{91,30}},
                  lineColor={128,128,128},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-49,39},{51,-41}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-74,15},{-45,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Ellipse(
                  extent={{45,15},{74,-13}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={192,192,192}),
                Line(points={{-60,0},{-60,24},{-40,24},{-40,60},{-60,60},{-60,110}},
                    color={0,0,0}),
                Line(points={{60,1},{60,21},{40,21},{40,60},{60,60},{60,110}}, color=
                      {0,0,0}),
                Line(
                  points={{-60,0},{60,0}},
                  color={0,0,0},
                  pattern=LinePattern.Dot),
                Ellipse(
                  extent={{20,8},{36,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{-18,-18},{11,-18}}, color={0,0,255}),
                Polygon(points={{23,-18},{11,-15},{11,-21},{23,-18}}, lineColor={0,0,
                      255}),
                Line(points={{-60,16},{-37,16}}, color={0,0,255}),
                Line(points={{-25,0},{-25,20}}, color={0,0,255}),
                Text(
                  extent={{-16,-19},{20,-44}},
                  lineColor={0,0,0},
                  textString="e_rel_0"),
                Polygon(points={{-25,16},{-37,19},{-37,13},{-25,16}}, lineColor={0,0,
                      255}),
                Text(
                  extent={{-39,31},{-22,21}},
                  lineColor={0,0,0},
                  textString="L_a"),
                Ellipse(
                  extent={{-33,7},{-17,-9}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{29,3},{29,22}}, color={0,0,255}),
                Line(points={{29,16},{60,16}}, color={0,0,255}),
                Polygon(points={{29,16},{41,19},{41,13},{29,16}}, lineColor={0,0,255}),
                Text(
                  extent={{15,36},{32,26}},
                  lineColor={0,0,0},
                  textString="L_b"),
                Line(
                  points={{37,18},{30,27}},
                  pattern=LinePattern.Dot,
                  color={0,0,255})}),
            Documentation(info="<html>
<p>
This component is used to exert a <b>line force</b>
between the origin of frame_a and the origin of frame_b
by attaching components of the <b>1-dimensional translational</b>
mechanical library of Modelica (Modelica.Mechanics.Translational)
between the two flange connectors <b>flange_a</b> and
<b>flange_b</b>. Optionally, there are <b>two point masses</b> on the line
connecting the origin of frame_a and the origin of frame_b.
These point masses approximate the <b>masses</b> of the <b>force element</b>.
The locations of the two point masses are defined by their
(fixed) distances of L_a relative to frame_a and of L_b relative
to frame_b, respectively.
</p>
<p>
In example
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples.Elementary.LineForceWithTwoMasses\">
MultiBody.Examples.Elementary.LineForceWithTwoMasses</a> the usage of this
line force element is shown and is compared with an alternative
implementation using a
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS\">
MultiBody.Joints.Assemblies.JointUPS</a> component.
The composition diagram of this example
is displayed in the figure below.
</p>
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/LineForceWithTwoMasses1.png\">
<p>
The animation view at time = 0 is shown in the next figure.
The system on the left side in the front is the animation with
the LineForceWithTwoMasses component whereas the system on the right
side in the back is the animation with the JointUPS component.
Both implementations yield the same result. However, the implementation
with the LineForceWithTwoMasses component is simpler.
</p>
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/LineForceWithTwoMasses2.png\">
<p>
In the translational library there is the implicit assumption that
forces of components that have only one flange connector act with
opposite sign on the bearings of the component. This assumption
is also used in the LineForceWithTwoMasses component: If a connection
is present to only one of the flange connectors, then the force
in this flange connector acts implicitly with opposite sign also
in the other flange connector.
</p>
</html>"));

      protected
          SI.Force fa "Force from flange_a";
          SI.Force fb "Force from flange_b";
          SI.Position r_CM1_0[3](each stateSelect=StateSelect.avoid) "Position vector from world frame to point mass 1, resolved in world frame";
          SI.Position r_CM2_0[3](each stateSelect=StateSelect.avoid) "Position vector from world frame to point mass 2, resolved in world frame";
          SI.Velocity v_CM1_0[3](each stateSelect=StateSelect.avoid) "der(r_CM_1_0) - velocity of point mass 1";
          SI.Velocity v_CM2_0[3](each stateSelect=StateSelect.avoid) "der(r_CM_2_0) - velocity of point mass 2";
          SI.Acceleration ag_CM1_0[3] "der(v_CM1_0) - gravityAcceleration(r_CM1_0)";
          SI.Acceleration ag_CM2_0[3] "der(v_CM2_0) - gravityAcceleration(r_CM2_0)";
          SI.Force aux1_0[3] "Auxiliary force 1";
          SI.Force aux2_0[3] "Auxiliary force 2";

          input SI.Length cylinderDiameter_b=cylinderDiameter_a*diameterFraction;
          input SI.Length massDiameter=cylinderDiameter_a*massDiameterFaction;
          parameter Boolean animateMasses2=world.enableAnimation and animate and animateMasses and m_a > 0 and m_b > 0;
          Visualizers.Advanced.Shape cylinder_a(
            shapeType="cylinder",
            color=color_a,
            specularCoefficient=specularCoefficient,
            length=cylinderLength_a,
            width=cylinderDiameter_a,
            height=cylinderDiameter_a,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r=frame_a.r_0) if world.enableAnimation and animate;

          Visualizers.Advanced.Shape cylinder_b(
            shapeType="cylinder",
            color=color_b,
            specularCoefficient=specularCoefficient,
            length=cylinderLength_b,
            width=cylinderDiameter_b,
            height=cylinderDiameter_b,
            lengthDirection=-e_rel_0,
            widthDirection={0,1,0},
            r=frame_b.r_0) if world.enableAnimation and animate;

          Visualizers.Advanced.Shape sphere_a(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=e_rel_0,
            widthDirection={0,1,0},
            r_shape=e_rel_0*(L_a - massDiameter/2),
            r=frame_a.r_0) if animateMasses2;

          Visualizers.Advanced.Shape sphere_b(
            shapeType="sphere",
            color=massColor,
            specularCoefficient=specularCoefficient,
            length=massDiameter,
            width=massDiameter,
            height=massDiameter,
            lengthDirection=-e_rel_0,
            widthDirection={0,1,0},
            r_shape=-e_rel_0*(L_b - massDiameter/2),
            r=frame_b.r_0) if animateMasses2;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);
          assert(noEvent(length > s_small), "
The distance between the origin of frame_a and the origin of frame_b
of a LineForceWithTwoMasses component became smaller as parameter s_small
(= a small number, defined in the \"Advanced\" menu). The distance is
set to s_small, although it is smaller, to avoid a division by zero
when computing the direction of the line force. Possible reasons
for this situation:
- At initial time the distance may already be zero: Change the initial
  positions of the bodies connected by this element.
- Hardware stops are not modeled or are modeled not stiff enough.
  Include stops, e.g., stiff springs, or increase the stiffness
  if already present.
- Another error in your model may lead to unrealistically large forces
  and torques that would in reality destroy the stops.
- The flange_b connector might be defined by a pre-defined motion,
  e.g., with Modelica.Mechanics.Translational.Position and the
  predefined flange_b.s is zero or negative.
");

          // Determine relative position vector between the two frames
          r_rel_0 = frame_b.r_0 - frame_a.r_0;
          length = Modelica.Math.Vectors.length(
                                 r_rel_0);
          flange_a.s = 0;
          flange_b.s = length;
          e_rel_0 = r_rel_0/Frames.Internal.maxWithoutEvent(length, s_small);

          // Determine translational flange forces
          if cardinality(flange_a) > 0 and cardinality(flange_b) > 0 then
            fa = flange_a.f;
            fb = flange_b.f;
          elseif cardinality(flange_a) > 0 and cardinality(flange_b) == 0 then
            fa = flange_a.f;
            fb = -fa;
          elseif cardinality(flange_a) == 0 and cardinality(flange_b) > 0 then
            fa = -fb;
            fb = flange_b.f;
          else
            fa = 0;
            fb = 0;
          end if;

          /* Force and torque balance of the two point masses
     - Kinematics for center of masses CM1, CM2 of point masses including gravity
       (L = length, va = der(frame_a.r_0), vb = der(frame_b.r_0))
       r_CM1_0 = frame_a.r_0 + e_rel_0*L_a;
       r_CM2_0 = frame_b.r_0 - e_rel_0*L_b;
       v_CM1_0 = der(r_CM1_0);
       v_CM2_0 = der(r_CM2_0);
       ag_CM1_0 = der(v_CM1_0) - world.gravityAcceleration(r_CM1_0);
       ag_CM2_0 = der(v_CM2_0) - world.gravityAcceleration(r_CM2_0);
       der(e_rel_0) = der(r_rel_0/sqrt(r_rel_0*r_rel_0))
                    = 1/L*(I - e_rel_0*e_rel_0')*der(r_rel_0)
                    = 1/L*(I - e_rel_0*e_rel_0')*(vb - va)
       v_CM1_0 = va + L_a/L*(I - e_rel_0*e_rel_0')*(vb - va)
       v_CM2_0 = vb - L_b/L*(I - e_rel_0*e_rel_0')*(vb - va)
     - Power balance for the connection line
       (f1=force on frame_a side, f2=force on frame_b side)
       0 = f1*va - m_a*ag_CM1*v_CM1 + f2*vb - m_b*ag_CM2*v_CM2
         = f1*va - m_a*ag_CM1*(va + L_a/L*(I - e_rel*e_rel')*(vb - va)) +
           f2*vb - m_b*ag_CM2*(vb - L_b/L*(I - e_rel*e_rel')*(vb - va))
         = (f1 - m_a*ag_CM1*(I - L_a/L*(I - e_rel*e_rel'))
               - m_b*ag_CM2*(L_b/L*(I - e_rel*e_rel')))*va +
           (f2 - m_b*ag_CM2*(I - L_b/L*(I - e_rel_0*e_rel_0'))
               - m_a*ag_CM1*(L_a/L*(I - e_rel*e_rel')))*vb
         = va*(f1 - m_a*ag_CM1 +
               (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')) +
           vb*(f2 - m_b*ag_CM2 +
               (m_b*ag_CM2*L_b/L - m_a*ag_CM1*L_a/L)*(I - e_rel*e_rel'))
       since va and vb are completely independent from other
       the paranthesis must vanish:
         f1 := m_a*ag_CM1 - (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')
         f2 := m_b*ag_CM2 + (m_a*ag_CM1*L_a/L - m_b*ag_CM2*L_b/L)*(I - e_rel*e_rel')
       or
         aux1 := ag_CM1*(m_a*L_a/L) - ag_CM2*(m_b*L_b/L);
         aux2 := aux1 - (aux1'*e_rel)*e_rel
         f1 := m_a*ag_CM1 - aux2
         f2 := m_b*ag_CM2 + aux2
     - Force balance on frame_a and frame_b finally results in
         0 = frame_a.f + e_rel_a*fa - f1_a
         0 = frame_b.f + e_rel_b*fb - f2_b
       and therefore
         frame_a.f = -e_rel_a*fa + m_a*ag_CM1 - aux2
         frame_b.f = -e_rel_b*fb + m_b*ag_CM2 + aux2
  */
          if m_a > 0 or m_b > 0 then
            r_CM1_0 = frame_a.r_0 + e_rel_0*L_a;
            r_CM2_0 = frame_b.r_0 - e_rel_0*L_b;
            v_CM1_0 = der(r_CM1_0);
            v_CM2_0 = der(r_CM2_0);
            ag_CM1_0 = der(v_CM1_0) - world.gravityAcceleration(r_CM1_0);
            ag_CM2_0 = der(v_CM2_0) - world.gravityAcceleration(r_CM2_0);
            aux1_0 = ag_CM1_0*(m_a*L_a/length) - ag_CM2_0*(m_b*L_b/length);
            aux2_0 = aux1_0 - (aux1_0*e_rel_0)*e_rel_0;
            frame_a.f = Frames.resolve2(frame_a.R, m_a*ag_CM1_0 - aux2_0 - e_rel_0*fa);
            frame_b.f = Frames.resolve2(frame_b.R, m_b*ag_CM2_0 + aux2_0 - e_rel_0*fb);
          else
            r_CM1_0 = zeros(3);
            r_CM2_0 = zeros(3);
            v_CM1_0 = zeros(3);
            v_CM2_0 = zeros(3);
            ag_CM1_0 = zeros(3);
            ag_CM2_0 = zeros(3);
            aux1_0 = zeros(3);
            aux2_0 = zeros(3);
            frame_a.f = -Frames.resolve2(frame_a.R, e_rel_0*fa);
            frame_b.f = -Frames.resolve2(frame_b.R, e_rel_0*fb);
          end if;

          // Provide appropriate equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;
        end LineForceWithTwoMasses;

        model Spring "Linear translational spring with optional mass"
          import Modelica.Mechanics.MultiBody.Types;
          extends Interfaces.PartialTwoFrames;
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Boolean showMass=true
          "= true, if point mass shall be visualized as sphere if animation=true and m>0";

          parameter SI.TranslationalSpringConstant c(final min=0)
          "Spring constant";
          parameter SI.Length s_unstretched=0 "Unstretched spring length";
          parameter SI.Mass m(min=0)=0
          "Spring mass located on the connetion line between the origin of frame_a and the origin of frame_b";
          parameter Real lengthFraction(
            min=0,
            max=1) = 0.5
          "Location of spring mass with respect to frame_a as a fraction of the distance from frame_a to frame_b (=0: at frame_a; =1: at frame_b)";
          input SI.Distance width=world.defaultForceWidth " Width of spring" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input SI.Distance coilWidth=width/10 " Width of spring coil" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Integer numberOfWindings=5 " Number of spring windings" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.SpringColor
          " Color of spring" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input SIunits.Diameter massDiameter=max(0, (width - 2*coilWidth)*0.9)
          " Diameter of mass point sphere"   annotation (Dialog(tab="Animation", group=
                  "if animation = true and showMass = true", enable=animation and showMass));
          input Types.Color massColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of mass point"   annotation (Dialog(tab="Animation", group=
                  "if animation = true and showMass = true", enable=animation and showMass));

          Forces.LineForceWithMass lineForce(
            animateLine=animation,
            animateMass=showMass,
            m=m,
            lengthFraction=lengthFraction,
            lineShapeType="spring",
            lineShapeHeight=coilWidth*2,
            lineShapeWidth=width,
            lineShapeExtra=numberOfWindings,
            lineShapeColor=color,
            specularCoefficient=specularCoefficient,
            massDiameter=massDiameter,
            massColor=massColor) annotation (Placement(transformation(extent={{-20,
                    -20},{20,20}}, rotation=0)));
          Modelica.Mechanics.Translational.Components.Spring spring(
                                                         s_rel0=s_unstretched, c=c) 
            annotation (Placement(transformation(extent={{-8,40},{12,60}}, rotation=0)));

          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                    100}}), graphics={
                Line(
                  points={{-100,0},{-58,0},{-43,-30},{-13,30},{17,-30},{47,30},{62,0},
                      {100,0}},
                  color={0,0,0},
                  pattern=LinePattern.Solid,
                  thickness=0.25,
                  arrow={Arrow.None,Arrow.None}),
                Text(
                  extent={{-130,49},{132,109}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-141,-92},{125,-51}},
                  lineColor={0,0,0},
                  textString="c=%c"),
                Ellipse(
                  extent={{-8,8},{8,-8}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}),
                    graphics),
            Documentation(info="<HTML>
<p>
<b>Linear spring</b> acting as line force between frame_a and frame_b.
A <b>force f</b> is exerted on the origin of frame_b and with opposite sign
on the origin of frame_a along the line from the origin of frame_a to the origin
of frame_b according to the equation:
</p>
<pre>
   f = c*(s - s_unstretched);
</pre>
<p>
where \"c\" and \"s_unstretched\" are parameters and \"s\" is the
distance between the origin of frame_a and the origin of frame_b.
</p>
<p>
Optionally, the mass of the spring is taken into account by a
point mass located on the line between frame_a and frame_b
(default: middle of the line). If the spring mass is zero, the
additional equations to handle the mass are removed.
</p>
<p>
In the following figure a typical animation of the
spring is shown. The blue sphere in the middle of the
spring characterizes the location of the point mass.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Examples/Elementary/SpringWithMass.png\"
ALT=\"model Examples.Elementary.SpringWithMass\">
</p>
</HTML>"));
        equation
          connect(lineForce.frame_a, frame_a) 
            annotation (Line(
              points={{-20,0},{-100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(lineForce.frame_b, frame_b) 
            annotation (Line(
              points={{20,0},{100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(spring.flange_b, lineForce.flange_b) 
            annotation (Line(points={{12,50},{12,20}}, color={0,191,0}));
          connect(spring.flange_a, lineForce.flange_a) 
            annotation (Line(points={{-8,50},{-12,50},{-12,20}}, color={0,191,0}));

        end Spring;

        model Damper "Linear (velocity dependent) damper"
          import Modelica.Mechanics.MultiBody.Types;
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.TranslationalDampingConstant d(final min=0, start = 0)
          "Damping constant";
          parameter SI.Distance length_a=world.defaultForceLength
          " Length of cylinder at frame_a side" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input SIunits.Diameter diameter_a=world.defaultForceWidth
          " Diameter of cylinder at frame_a side" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input SIunits.Diameter diameter_b=0.6*diameter_a
          " Diameter of cylinder at frame_b side" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color_a={100,100,100} " Color at frame_a" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation, colorSelector));
          input Types.Color color_b={155,155,155} " Color at frame_b" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation, colorSelector));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          extends Interfaces.PartialLineForce;
          annotation (
            Documentation(info="<HTML>
<p>
<b>Linear damper</b> acting as line force between frame_a and frame_b.
A <b>force f</b> is exerted on the origin of frame_b and with opposite sign
on the origin of frame_a along the line from the origin of frame_a to the origin
of frame_b according to the equation:
</p>
<pre>
   f = d*<b>der</b>(s);
</pre>
<p>
where \"d\" is a parameter, \"s\" is the
distance between the origin of frame_a and the origin of frame_b
and der(s) is the time derivative of \"s\".
</p>
<p>
In the following figure a typical animation is shown
where a mass is hanging on a damper.
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Forces/Damper.png\">
</p>
</HTML>"),  Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-101,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{100,0}}, color={0,0,0}),
                Text(
                  extent={{-140,47},{145,105}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-156,-96},{152,-53}},
                  lineColor={0,0,0},
                  textString="d=%d")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-100,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{100,0}}, color={0,0,0}),
                Line(points={{-50,60},{50,60}}, color={128,128,128}),
                Text(
                  extent={{-20,60},{10,85}},
                  lineColor={128,128,128},
                  textString="der(s)"),
                Polygon(
                  points={{64,60},{42,68},{42,52},{62,60},{64,60}},
                  lineColor={128,128,128},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid)}));

      protected
          SI.Position r0_b[3]=e_a*noEvent(min(length_a, s));
          Visualizers.Advanced.Shape shape_a(
            shapeType="cylinder",
            color=color_a,
            specularCoefficient=specularCoefficient,
            length=noEvent(min(length_a, s)),
            width=diameter_a,
            height=diameter_a,
            lengthDirection=e_a,
            widthDirection={0,1,0},
            r=frame_a.r_0,
            R=frame_a.R) if 
                           world.enableAnimation and animation;
          Visualizers.Advanced.Shape shape_b(
            shapeType="cylinder",
            color=color_b,
            specularCoefficient=specularCoefficient,
            length=noEvent(max(s - length_a, 0)),
            width=diameter_b,
            height=diameter_b,
            lengthDirection=e_a,
            widthDirection={0,1,0},
            r_shape=r0_b,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          f = d*der(s);
        end Damper;

        package Internal "Internal package, should not be used by user"

          model BasicForce
          "Force acting between two frames, defined by 3 input signals"

            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB;
            extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame" 
              annotation (Placement(transformation(
                  origin={40,100},
                  extent={{-16,-16},{16,16}},
                  rotation=90)));
            Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
              final unit = "N")
            "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame"
              annotation (Placement(transformation(
                  origin={-60,120},
                  extent={{-20,-20},{20,20}},
                  rotation=270)));
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
            "Frame in which force is resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";

            Modelica.SIunits.Position r_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            Modelica.SIunits.Force f_b_0[3] "frame_b.f resoved in world frame";

            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}),
                      graphics),
              Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                      100,100}}), graphics={
                  Rectangle(
                    extent={{-98,99},{99,-98}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-92,61},{87,35}},
                    lineColor={192,192,192},
                    textString="resolve"),
                  Text(
                    extent={{-136,-52},{149,-113}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Line(
                    points={{40,100},{40,0}},
                    color={95,95,95},
                    pattern=LinePattern.Dot),
                  Polygon(
                    points={{-94,0},{-64,11},{-64,-10},{-94,0}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-60,100},{40,100}},
                    color={95,95,95},
                    pattern=LinePattern.Dot),
                  Polygon(
                    points={{94,0},{65,12},{65,-11},{94,0}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Line(points={{-64,0},{-20,0}}, color={0,0,0}),
                  Line(points={{20,0},{65,0}}, color={0,0,0})}),
              Documentation(info="<HTML>
<p>
The <b>3</b> signals of the <b>force</b> connector are interpreted
as the x-, y- and z-coordinates of a <b>force</b> acting at the frame
connector to which frame_b of this component is attached.
Via parameter <b>resolveInFrame</b> it is defined, in which frame these
coordinates shall be resolved:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameAB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve input force in world frame</td></tr>

<tr><td valign=\"top\">frame_a</td>
    <td valign=\"top\">Resolve input force in frame_a</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve input force in frame_b (= default)</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve input force in frame_resolve (frame_resolve must be connected)</td></tr>
</table>

<p>
If resolveInFrame = ResolveInFrameAB.frame_resolve, the force coordinates
are with respect to the frame, that is connected to <b>frame_resolve</b>.
<p>

<p>
If resolveInFrame is not ResolveInFrameAB.frame_resolve, then the position
vector and the orientation object of frame_resolve must be set to constant
values from the outside in order that the model remains balanced
(these constant values are ignored).
</p>

</HTML>
"));
          equation
            assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
            frame_resolve.f = zeros(3);
            frame_resolve.t = zeros(3);

             if resolveInFrame == ResolveInFrameAB.frame_a then
                f_b_0     = -Frames.resolve1(frame_a.R, force);
                frame_b.f =  Frames.resolve2(frame_b.R, f_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_b then
                f_b_0     = -Frames.resolve1(frame_b.R, force);
                frame_b.f = -force;
             elseif resolveInFrame == ResolveInFrameAB.world then
                f_b_0     = -force;
                frame_b.f =  Frames.resolve2(frame_b.R, f_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_resolve then
                f_b_0     = -Frames.resolve1(frame_resolve.R, force);
                frame_b.f = Frames.resolve2(frame_b.R, f_b_0);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                f_b_0     = zeros(3);
                frame_b.f = zeros(3);
             end if;
             frame_b.t = zeros(3);

             // Force and torque balance
             r_0 = frame_b.r_0 - frame_a.r_0;
             zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_b_0);
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(r_0, f_b_0));
          end BasicForce;

          model BasicTorque
          "Torque acting between two frames, defined by 3 input signals"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB;
            extends Modelica.Mechanics.MultiBody.Interfaces.PartialTwoFrames;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame" 
              annotation (Placement(transformation(
                  origin={40,100},
                  extent={{-16,-16},{16,16}},
                  rotation=90)));

            Modelica.Blocks.Interfaces.RealInput torque[3](each final quantity="Torque", each
              final unit = "N.m")
            "x-, y-, z-coordiantes of torque resolved in frame defined by resolveInFrame"
              annotation (Placement(transformation(
                  origin={-60,120},
                  extent={{-20,-20},{20,20}},
                  rotation=270)));
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameAB.frame_b
            "Frame in which torque is resolved (1: world, 2: frame_a, 3: frame_b, 4: frame_resolve)";

            SI.Position r_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            SI.Torque t_b_0[3] "frame_b.t resoved in world frame";

            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}),
                      graphics),
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}), graphics={
                  Rectangle(
                    extent={{-98,99},{99,-98}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-59,55},{72,30}},
                    lineColor={192,192,192},
                    textString="resolve"),
                  Text(
                    extent={{-139,-27},{146,-88}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Polygon(
                    points={{100,20},{84,52},{69,39},{100,20}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{40,100},{76,46}},
                    color={95,95,95},
                    pattern=LinePattern.Dot),
                  Polygon(
                    points={{-99,20},{-86,53},{-70,42},{-99,20}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-60,100},{40,100}},
                    color={95,95,95},
                    pattern=LinePattern.Dot),
                  Line(points={{-79,47},{-70,61},{-59,72},{-45,81},{-32,84},{-20,85}},
                      color={0,0,0}),
                  Line(points={{77,45},{66,60},{55,69},{49,74},{41,80},{31,84},{20,85}},
                      color={0,0,0})}),
              Documentation(info="<HTML>
<p>
The <b>3</b> signals of the <b>torque</b> connector are interpreted
as the x-, y- and z-coordinates of a <b>torque</b> acting at the frame
connector to which frame_b of this component is attached.
Via parameter <b>resolveInFrame</b> it is defined, in which frame these
coordinates shall be resolved:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameAB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve input torque in world frame</td></tr>

<tr><td valign=\"top\">frame_a</td>
    <td valign=\"top\">Resolve input torque in frame_a</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve input torque in frame_b (= default)</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve input torque in frame_resolve (frame_resolve must be connected)</td></tr>
</table>

<p>
If resolveInFrame = ResolveInFrameAB.frame_resolve, the torque coordinates
are with respect to the frame, that is connected to <b>frame_resolve</b>.
<p>

<p>
If resolveInFrame is not ResolveInFrameAB.frame_resolve, then the position
vector and the orientation object of frame_resolve must be set to constant
values from the outside in order that the model remains balanced
(these constant values are ignored).
</p>
</HTML>
"));

          equation
            assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
            frame_resolve.f = zeros(3);
            frame_resolve.t = zeros(3);

            r_0 = frame_b.r_0 - frame_a.r_0;
            frame_a.f = zeros(3);
            frame_b.f = zeros(3);

             if resolveInFrame == ResolveInFrameAB.frame_a then
                t_b_0     = -Frames.resolve1(frame_a.R, torque);
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_b then
                t_b_0     = -Frames.resolve1(frame_b.R, torque);
                frame_b.t = -torque;
             elseif resolveInFrame == ResolveInFrameAB.world then
                t_b_0     = -torque;
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             elseif resolveInFrame == ResolveInFrameAB.frame_resolve then
                t_b_0     = -Frames.resolve1(frame_resolve.R, torque);
                frame_b.t =  Frames.resolve2(frame_b.R, t_b_0);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                t_b_0     = zeros(3);
                frame_b.t = zeros(3);
             end if;

             // torque balance
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, t_b_0);
          end BasicTorque;

          model BasicWorldForce
          "External force acting at frame_b, defined by 3 input signals"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types.ResolveInFrameB;
            extends Interfaces.PartialOneFrame_b;
            Interfaces.Frame_resolve frame_resolve
            "The input signals are optionally resolved in this frame" 
              annotation (Placement(transformation(
                  origin={0,-100},
                  extent={{-16,-16},{16,16}},
                  rotation=270)));

            Modelica.Blocks.Interfaces.RealInput force[3](each final quantity="Force", each
              final unit = "N")
            "x-, y-, z-coordinates of force resolved in frame defined by resolveInFrame"
              annotation (Placement(transformation(extent={{-140,-20},{-100,20}},
                    rotation=0)));
            parameter Modelica.Mechanics.MultiBody.Types.ResolveInFrameB
            resolveInFrame=
              Modelica.Mechanics.MultiBody.Types.ResolveInFrameB.world
            "Frame in which force is resolved (1: world, 2: frame_b, 3: frame_resolve)";

            annotation (
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}), graphics={Polygon(
                    points={{-100,10},{50,10},{50,31},{97,0},{50,-31},{50,-10},{-100,
                        -10},{-100,10}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid), Line(
                    points={{0,-10},{0,-97}},
                    color={95,95,95},
                    pattern=LinePattern.Dot)}),
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}), graphics={
                  Text(
                    extent={{-89,-46},{91,-76}},
                    lineColor={192,192,192},
                    textString="resolve"),
                  Polygon(
                    points={{-100,10},{50,10},{50,31},{94,0},{50,-31},{50,-10},{-100,
                        -10},{-100,10}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-149,103},{136,42}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Line(
                    points={{0,-10},{0,-95}},
                    color={95,95,95},
                    pattern=LinePattern.Dot)}),
              Documentation(info="<HTML>
<p>
The 3 signals of the <b>force</b> connector are interpreted
as the x-, y- and z-coordinates of a <b>force</b> acting at the frame
connector to which this component is attached.
Via parameter <b>resolveInFrame</b> it is defined, in which frame these
coordinates shall be resolved:
</p>

<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve input force in world frame (= default)</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve input force in frame_b</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve input force in frame_resolve (frame_resolve must be connected)</td></tr>
</table>

<p>
If resolveInFrame = Types.ResolveInFrameB.frame_resolve, the force coordinates
are with respect to the frame, that is connected to <b>frame_resolve</b>.
<p>

<p>
If resolveInFrame is not Types.ResolveInFrameB.frame_resolve, then the position
vector and the orientation object of frame_resolve must be set to constant
values from the outside in order that the model remains balanced
(these constant values are ignored).
</p>

</HTML>
"));

          equation
             assert(cardinality(frame_resolve) > 0, "Connector frame_resolve must be connected at least once and frame_resolve.r_0/.R must be set");
             frame_resolve.f = zeros(3);
             frame_resolve.t = zeros(3);

             if resolveInFrame == ResolveInFrameB.world then
                frame_b.f = -Frames.resolve2(frame_b.R, force);
             elseif resolveInFrame == ResolveInFrameB.frame_b then
                frame_b.f = -force;
             elseif resolveInFrame == ResolveInFrameB.frame_resolve then
                frame_b.f = -Frames.resolveRelative(force, frame_resolve.R, frame_b.R);
             else
                assert(false, "Wrong value for parameter resolveInFrame");
                frame_b.f = zeros(3);
             end if;
             frame_b.t = zeros(3);
          end BasicWorldForce;
        end Internal;
      end Forces;

      package Frames "Functions to transform rotational frame quantities"
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
Package <b>Frames</b> contains type definitions and
functions to transform rotational frame quantities. The basic idea is to
hide the actual definition of an <b>orientation</b> in this package
by providing essentially type <b>Orientation</b> together with
<b>functions</b> operating on instances of this type.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Frames.Orientation R, R1, R2, R_rel, R_inv;
   Real[3,3]   T, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, e, e_x, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation R;</b></td>
      <td valign=\"top\">New type defining an orientation object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(R);</td>
      <td valign=\"top\">Return the constraints between the variables of an orientation object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(R);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          orientation object R.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(R);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          orientation object R.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(R,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(R,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolveRelative</b>(v1,R1,R2);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2
          using absolute orientation objects R1 of frame 1 and R2 of frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">D1 = <b>resolveDyade1</b>(R,D2);</td>
      <td valign=\"top\">Transform second order tensor D2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">D2 = <b>resolveDyade2</b>(R,D1);</td>
      <td valign=\"top\">Transform second order tensor D1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">R = <b>nullRotation</b>()</td>
      <td valign=\"top\">Return orientation object R that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">R_inv = <b>inverseRotation</b>(R);</td>
      <td valign=\"top\">Return inverse orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">R_rel = <b>relativeRotation</b>(R1,R2);</td>
      <td valign=\"top\">Return relative orientation object from two absolute
          orientation objects.
      </td>
  </tr>
  <tr><td valign=\"top\">R2 = <b>absoluteRotation</b>(R1,R_rel);</td>
      <td valign=\"top\">Return absolute orientation object from another
          absolute<br> and a relative orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>planarRotation</b>(e, angle, der_angle);</td>
      <td valign=\"top\">Return orientation object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">angle = <b>planarRotationAngle</b>(e, v1, v2);</td>
      <td valign=\"top\">Return angle of a planar rotation, given the rotation axis<br>
        and the representations of a vector in frame 1 and frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>axisRotation</b>(axis, angle, der_angle);</td>
      <td valign=\"top\">Return orientation object R to rotate around angle along axis of frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>axesRotations</b>(sequence, angles, der_angles);</td>
      <td valign=\"top\">Return rotation object to rotate in sequence around 3 axes. Example:<br>
          R = axesRotations({1,2,3},{pi/2,pi/4,-pi}, zeros(3));
      </td>
  </tr>
  <tr><td valign=\"top\">angles = <b>axesRotationsAngles</b>(R, sequence);</td>
      <td valign=\"top\">Return the 3 angles to rotate in sequence around 3 axes to<br>
          construct the given orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(R);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation R.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_nxy</b>(n_x, n_y);</td>
      <td valign=\"top\">Return orientation object from n_x and n_y vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_nxz</b>(n_x, n_z);</td>
      <td valign=\"top\">Return orientation object from n_x and n_z vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T</b>(T,w);</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T and
          its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T2</b>(T,der(T));</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T and
          its derivative der(T).
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T_inv</b>(T_inv,w);</td>
      <td valign=\"top\">Return orientation object R from inverse transformation matrix T_inv and
          its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_Q</b>(Q,w);</td>
      <td valign=\"top\">Return orientation object R from quaternion orientation object Q
          and its angular velocity w.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(R);</td>
      <td valign=\"top\">Return transformation matrix T from orientation object R.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(R);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>to_Q</b>(R);</td>
      <td valign=\"top\">Return quaternione orientation object Q from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">exy = <b>to_exy</b>(R);</td>
      <td valign=\"top\">Return [e_x, e_y] matrix of an orientation object R, <br>
          with e_x and e_y vectors of frame 2, resolved in frame 1.
  </tr>
  <tr><td valign=\"top\">L = <b>length</b>(n_x);</td>
      <td valign=\"top\">Return length L of a vector n_x.
      </td>
  </tr>
  <tr><td valign=\"top\">e_x = <b>normalize</b>(n_x);</td>
      <td valign=\"top\">Return normalized vector e_x of n_x such that length of e_x is one.
      </td>
  </tr>
  <tr><td valign=\"top\">e = <b>axis</b>(i);</td>
      <td valign=\"top\">Return unit vector e directed along axis i
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Frames.Quaternions\">Quaternions</a></td>
      <td valign=\"top\"><b>Package</b> with functions to transform rotational frame quantities based
          on quaternions (also called Euler parameters).
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Frames.TransformationMatrices\">TransformationMatrices</a></td>
      <td valign=\"top\"><b>Package</b> with functions to transform rotational frame quantities based
          on transformation matrices.
      </td>
  </tr>
</table>
</HTML>"));

        record Orientation
        "Orientation object defining rotation from a frame 1 into a frame 2"

          import SI = Modelica.SIunits;
          extends Modelica.Icons.Record;
          Real T[3, 3] "Transformation matrix from world frame to local frame";
          SI.AngularVelocity w[3]
          "Absolute angular velocity of local frame, resolved in local frame";

          encapsulated function equalityConstraint
          "Return the constraint residues to express that two frames have the same orientation"

            import Modelica;
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Frames.Orientation R1
            "Orientation object to rotate frame 0 into frame 1";
            input Frames.Orientation R2
            "Orientation object to rotate frame 0 into frame 2";
            output Real residue[3]
            "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
            annotation(Inline=true);
          algorithm
            residue := {
               Modelica.Math.atan2(cross(R1.T[1, :], R1.T[2, :])*R2.T[2, :],R1.T[1,:]*R2.T[1,:]),
               Modelica.Math.atan2(-cross(R1.T[1, :],R1.T[2, :])*R2.T[1, :],R1.T[2,:]*R2.T[2,:]),
               Modelica.Math.atan2(R1.T[2, :]*R2.T[1, :],R1.T[3,:]*R2.T[3,:])};
          end equalityConstraint;

          annotation (Documentation(info="<html>
<p>
This object describes the <b>rotation</b> from a <b>frame 1</b> into a <b>frame 2</b>.
An instance of this type should never be directly accessed but
only with the access functions provided
in package Modelica.Mechanics.MultiBody.Frames. As a consequence, it is not necessary to know
the internal representation of this object as described in the next paragraphs.
</p>
<p>
\"Orientation\" is defined to be a record consisting of two
elements: \"Real T[3,3]\", the transformation matrix to rotate frame 1
into frame 2 and \"Real w[3]\", the angular velocity of frame 2 with
respect to frame 1, resolved in frame 2. Element \"T\"
has the following interpretation:
</p>
<pre>
   Orientation R;
   <b>R.T</b> = [<b>e</b><sub>x</sub>, <b>e</b><sub>y</sub>, <b>e</b><sub>z</sub>];
       e.g., <b>R.T</b> = [1,0,0; 0,1,0; 0,0,1]
</pre>
<p>
where <b>e</b><sub>x</sub>,<b>e</b><sub>y</sub>,<b>e</b><sub>z</sub>
are unit vectors in the direction of the x-axis, y-axis, and z-axis
of frame 1, resolved in frame 2, respectively. Therefore, if <b>v</b><sub>1</sub>
is vector <b>v</b> resolved in frame 1 and <b>v</b><sub>2</sub> is
vector <b>v</b> resolved in frame 2, the following relationship holds:
</p>
<pre>
    <b>v</b><sub>2</sub> = <b>R.T</b> * <b>v</b><sub>1</sub>
</pre>
</p>
The <b>inverse</b> orientation
<b>R_inv.T</b> = <b>R.T</b><sup>T</sup> describes the rotation
from frame 2 into frame 1.
</p>
<p>
Since the orientation is described by 9 variables, there are
6 constraints between these variables. These constraints
are defined in function <b>Frames.orientationConstraint</b>.
</p>
<p>
R.w is the angular velocity of frame 2 with respect to frame 1, resolved
in frame 2. Formally, R.w is defined as:<br>
<b>skew</b>(R.w) = R.T*<b>der</b>(transpose(R.T))
with
</p>
<pre>
             |   0   -w[3]  w[2] |
   <b>skew</b>(w) = |  w[3]   0   -w[1] |
             | -w[2]  w[1]     0 |
</pre>

</html>
"));

        end Orientation;

        function angularVelocity1
        "Return angular velocity resolved in frame 1 from orientation object"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity of frame 2 with respect to frame 1 resolved in frame 1";
          annotation(Inline=true);
        algorithm
          w := resolve1(R, R.w);
        end angularVelocity1;

        function angularVelocity2
        "Return angular velocity resolved in frame 2 from orientation object"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
          annotation(Inline=true);
        algorithm
          w := R.w;
        end angularVelocity2;

        function resolve1 "Transform vector from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real v2[3] "Vector in frame 2";
          output Real v1[3] "Vector in frame 1";
          annotation (derivative(noDerivative=R) = Internal.resolve1_der,
              __Dymola_InlineAfterIndexReduction=true);
        algorithm
          v1 := transpose(R.T)*v2;
        end resolve1;

        function resolve2 "Transform vector from frame 1 to frame 2"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real v1[3] "Vector in frame 1";
          output Real v2[3] "Vector in frame 2";
          annotation (derivative(noDerivative=R) = Internal.resolve2_der,
              __Dymola_InlineAfterIndexReduction=true);
        algorithm
          v2 := R.T*v1;
        end resolve2;

        function resolveRelative
        "Transform vector from frame 1 to frame 2 using absolute orientation objects of frame 1 and of frame 2"

          extends Modelica.Icons.Function;
          input Real v1[3] "Vector in frame 1";
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
          output Real v2[3] "Vector in frame 2";
          annotation (derivative(noDerivative=R1, noDerivative=R2) = Internal.resolveRelative_der,
              __Dymola_InlineAfterIndexReduction=true);
        algorithm
          v2 := resolve2(R2, resolve1(R1, v1));
        end resolveRelative;

        function resolveDyade1
        "Transform second order tensor from frame 2 to frame 1"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Real D2[3, 3] "Second order tensor resolved in frame 2";
          output Real D1[3, 3] "Second order tensor resolved in frame 1";
          annotation(Inline=true);
        algorithm
          D1 := transpose(R.T)*D2*R.T;
        end resolveDyade1;

        function nullRotation
        "Return orientation object that does not rotate a frame"
          extends Modelica.Icons.Function;
          output Orientation R
          "Orientation object such that frame 1 and frame 2 are identical";
          annotation(Inline=true);
        algorithm
          R := Orientation(T=identity(3),w= zeros(3));
        end nullRotation;

        function inverseRotation "Return inverse orientation object"
          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          output Orientation R_inv
          "Orientation object to rotate frame 2 into frame 1";
          annotation(Inline=true);
        algorithm
          R_inv := Orientation(T=transpose(R.T),w= -resolve1(R, R.w));
        end inverseRotation;

        function relativeRotation "Return relative orientation object"
          extends Modelica.Icons.Function;
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
          output Orientation R_rel
          "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          R_rel := Orientation(T=R2.T*transpose(R1.T),w= R2.w - resolve2(R2, resolve1(
             R1, R1.w)));
        end relativeRotation;

        function absoluteRotation
        "Return absolute orientation object from another absolute and a relative orientation object"

          extends Modelica.Icons.Function;
          input Orientation R1
          "Orientation object to rotate frame 0 into frame 1";
          input Orientation R_rel
          "Orientation object to rotate frame 1 into frame 2";
          output Orientation R2
          "Orientation object to rotate frame 0 into frame 2";
          annotation(Inline=true);
        algorithm
          R2 := Orientation(T=R_rel.T*R1.T,w= resolve2(R_rel, R1.w) + R_rel.w);
        end absoluteRotation;

        function planarRotation
        "Return orientation object of a planar rotation"
          import Modelica.Math;
          extends Modelica.Icons.Function;
          input Real e[3](each final unit="1")
          "Normalized axis of rotation (must have length=1)";
          input Modelica.SIunits.Angle angle
          "Rotation angle to rotate frame 1 into frame 2 along axis e";
          input Modelica.SIunits.AngularVelocity der_angle "= der(angle)";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          R := Orientation(T=[e]*transpose([e]) + (identity(3) - [e]*transpose([e]))*
            Math.cos(angle) - skew(e)*Math.sin(angle),w= e*der_angle);

        end planarRotation;

        function planarRotationAngle
        "Return angle of a planar rotation, given the rotation axis and the representations of a vector in frame 1 and frame 2"

          extends Modelica.Icons.Function;
          input Real e[3](each final unit="1")
          "Normalized axis of rotation to rotate frame 1 around e into frame 2 (must have length=1)";
          input Real v1[3]
          "A vector v resolved in frame 1 (shall not be parallel to e)";
          input Real v2[3]
          "Vector v resolved in frame 2, i.e., v2 = resolve2(planarRotation(e,angle),v1)";
          output Modelica.SIunits.Angle angle
          "Rotation angle to rotate frame 1 into frame 2 along axis e in the range: -pi <= angle <= pi";
          annotation (Inline=true, Documentation(info="<HTML>
<p>
A call to this function of the form
</p>
<pre>
    Real[3]                e, v1, v2;
    Modelica.SIunits.Angle angle;
  <b>equation</b>
    angle = <b>planarRotationAngle</b>(e, v1, v2);
</pre>
<p>
computes the rotation angle \"<b>angle</b>\" of a planar
rotation along unit vector <b>e</b>, rotating frame 1 into frame 2, given
the coordinate representations of a vector \"v\" in frame 1 (<b>v1</b>)
and in frame 2 (<b>v2</b>). Therefore, the result of this function
fulfills the following equation:
</p>
<pre>
    v2 = <b>resolve2</b>(<b>planarRotation</b>(e,angle), v1)
</pre>
<p>
The rotation angle is returned in the range
</p>
<pre>
    -<font face=\"Symbol\">p</font> &lt;= angle &lt;= <font face=\"Symbol\">p</font>
</pre>
<p>
This function makes the following assumptions on the input arguments
</p>
<ul>
<li> Vector <b>e</b> has length 1, i.e., length(e) = 1</li>
<li> Vector \"v\" is not parallel to <b>e</b>, i.e.,
     length(cross(e,v1)) &ne; 0</li>
</ul>
<p>
The function does not check the above assumptions. If these
assumptions are violated, a wrong result will be returned
and/or a division by zero will occur.
</p>
</HTML>"));
        algorithm
          /* Vector v is resolved in frame 1 and frame 2 according to:
        (1)  v2 = (e*transpose(e) + (identity(3) - e*transpose(e))*cos(angle) - skew(e)*sin(angle))*v1;
                = e*(e*v1) + (v1 - e*(e*v1))*cos(angle) - cross(e,v1)*sin(angle)
       Equation (1) is multiplied with "v1" resulting in (note: e*e = 1)
            v1*v2 = (e*v1)*(e*v2) + (v1*v1 - (e*v1)*(e*v1))*cos(angle)
       and therefore:
        (2) cos(angle) = ( v1*v2 - (e*v1)*(e*v2)) / (v1*v1 - (e*v1)*(e*v1))
       Similiarly, equation (1) is multiplied with cross(e,v1), i.e., a
       a vector that is orthogonal to e and to v1:
              cross(e,v1)*v2 = - cross(e,v1)*cross(e,v1)*sin(angle)
       and therefore:
          (3) sin(angle) = -cross(e,v1)*v2/(cross(e,v1)*cross(e,v1));
       We have e*e=1; Therefore:
          (4) v1*v1 - (e*v1)*(e*v1) = |v1|^2 - (|v1|*cos(e,v1))^2
       and
          (5) cross(e,v1)*cross(e,v1) = (|v1|*sin(e,v1))^2
                                      = |v1|^2*(1 - cos(e,v1)^2)
                                      = |v1|^2 - (|v1|*cos(e,v1))^2
       The denominators of (2) and (3) are identical, according to (4) and (5).
       Furthermore, the denominators are always positive according to (5).
       Therefore, in the equation "angle = atan2(sin(angle), cos(angle))" the
       denominators of sin(angle) and cos(angle) can be removed,
       resulting in:
          angle = atan2(-cross(e,v1)*v2, v1*v2 - (e*v1)*(e*v2));
    */
          angle := Modelica.Math.atan2(-cross(e, v1)*v2, v1*v2 - (e*v1)*(e*v2));
        end planarRotationAngle;

        function axesRotations
        "Return fixed rotation object to rotate in sequence around fixed angles along 3 axes"

          import TM =
          Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
          extends Modelica.Icons.Function;
          input Integer sequence[3](
            min={1,1,1},
            max={3,3,3}) = {1,2,3}
          "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input Modelica.SIunits.Angle angles[3]
          "Rotation angles around the axes defined in 'sequence'";
          input Modelica.SIunits.AngularVelocity der_angles[3] "= der(angles)";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          /*
  R := absoluteRotation(absoluteRotation(axisRotation(sequence[1], angles[1],
    der_angles[1]), axisRotation(sequence[2], angles[2], der_angles[2])),
    axisRotation(sequence[3], angles[3], der_angles[3]));
*/
          R := Orientation(T=TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(
            sequence[2], angles[2])*TM.axisRotation(sequence[1], angles[1]),w=
            Frames.axis(sequence[3])*der_angles[3] + TM.resolve2(TM.axisRotation(
            sequence[3], angles[3]), Frames.axis(sequence[2])*der_angles[2]) +
            TM.resolve2(TM.axisRotation(sequence[3], angles[3])*TM.axisRotation(
            sequence[2], angles[2]), Frames.axis(sequence[1])*der_angles[1]));
        end axesRotations;

        function axesRotationsAngles
        "Return the 3 angles to rotate in sequence around 3 axes to construct the given orientation object"

          import SI = Modelica.SIunits;

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Integer sequence[3](
            min={1,1,1},
            max={3,3,3}) = {1,2,3}
          "Sequence of rotations from frame 1 to frame 2 along axis sequence[i]";
          input SI.Angle guessAngle1=0
          "Select angles[1] such that |angles[1] - guessAngle1| is a minimum";
          output SI.Angle angles[3]
          "Rotation angles around the axes defined in 'sequence' such that R=Frames.axesRotation(sequence,angles); -pi < angles[i] <= pi";
          annotation (Documentation(info="<HTML>
<p>
A call to this function of the form
</p>
<pre>
    Frames.Orientation     R;
    <b>parameter</b> Integer      sequence[3] = {1,2,3};
    Modelica.SIunits.Angle angles[3];
  <b>equation</b>
    angle = <b>axesRotationAngles</b>(R, sequence);
</pre>
<p>
computes the rotation angles \"<b>angles</b>[1:3]\" to rotate frame 1
into frame 2 along axes <b>sequence</b>[1:3], given the orientation
object <b>R</b> from frame 1 to frame 2. Therefore, the result of
this function fulfills the following equation:
</p>
<pre>
    R = <b>axesRotation</b>(sequence, angles)
</pre>
<p>
The rotation angles are returned in the range
</p>
<pre>
    -<font face=\"Symbol\">p</font> &lt;= angles[i] &lt;= <font face=\"Symbol\">p</font>
</pre>
<p>
There are <b>two solutions</b> for \"angles[1]\" in this range.
Via the third argument <b>guessAngle1</b> (default = 0) the
returned solution is selected such that |angles[1] - guessAngle1| is
minimal. The orientation object R may be in a singular configuration, i.e.,
there is an infinite number of angle values leading to the same R. The returned solution is
selected by setting angles[1] = guessAngle1. Then angles[2]
and angles[3] can be uniquely determined in the above range.
</p>
<p>
Note, that input argument <b>sequence</b> has the restriction that
only values 1,2,3 can be used and that sequence[1] &ne; sequence[2]
and sequence[2] &ne; sequence[3]. Often used values are:
</p>
<pre>
  sequence = <b>{1,2,3}</b>  // Cardan angle sequence
           = <b>{3,1,3}</b>  // Euler angle sequence
           = <b>{3,2,1}</b>  // Tait-Bryan angle sequence
</pre>
</HTML>"));
      protected
          Real e1_1[3](each final unit="1")
          "First rotation axis, resolved in frame 1";
          Real e2_1a[3](each final unit="1")
          "Second rotation axis, resolved in frame 1a";
          Real e3_1[3](each final unit="1")
          "Third rotation axis, resolved in frame 1";
          Real e3_2[3](each final unit="1")
          "Third rotation axis, resolved in frame 2";
          Real A
          "Coefficient A in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          Real B
          "Coefficient B in the equation A*cos(angles[1])+B*sin(angles[1]) = 0";
          SI.Angle angle_1a "Solution 1 for angles[1]";
          SI.Angle angle_1b "Solution 2 for angles[1]";
          TransformationMatrices.Orientation T_1a
          "Orientation object to rotate frame 1 into frame 1a";
        algorithm
          /* The rotation object R is constructed by:
     (1) Rotating frame 1 along axis e1 (= axis sequence[1]) with angles[1]
         arriving at frame 1a.
     (2) Rotating frame 1a along axis e2 (= axis sequence[2]) with angles[2]
         arriving at frame 1b.
     (3) Rotating frame 1b along axis e3 (= axis sequence[3]) with angles[3]
         arriving at frame 2.
     The goal is to determine angles[1:3]. This is performed in the following way:
     1. e2 and e3 are perpendicular to each other, i.e., e2*e3 = 0;
        Both vectors are resolved in frame 1 (T_ij is transformation matrix
        from frame j to frame i; e1_1*e2_1a = 0, since the vectors are
        perpendicular to each other):
           e3_1 = T_12*e3_2
                = R[sequence[3],:];
           e2_1 = T_11a*e2_1a
                = ( e1_1*transpose(e1_1) + (identity(3) - e1_1*transpose(e1_1))*cos(angles[1])
                    + skew(e1_1)*sin(angles[1]) )*e2_1a
                = e2_1a*cos(angles[1]) + cross(e1_1, e2_1a)*sin(angles[1]);
        From this follows finally an equation for angles[1]
           e2_1*e3_1 = 0
                     = (e2_1a*cos(angles[1]) + cross(e1_1, e2_1a)*sin(angles[1]))*e3_1
                     = (e2_1a*e3_1)*cos(angles[1]) + cross(e1_1, e2_1a)*e3_1*sin(angles[1])
                     = A*cos(angles[1]) + B*sin(angles[1])
                       with A = e2_1a*e3_1, B = cross(e1_1, e2_1a)*e3_1
        This equation has two solutions in the range -pi < angles[1] <= pi:
           sin(angles[1]) =  k*A/sqrt(A*A + B*B)
           cos(angles[1]) = -k*B/sqrt(A*A + B*B)
                        k = +/-1
           tan(angles[1]) = k*A/(-k*B)
        that is:
           angles[1] = atan2(k*A, -k*B)
        If A and B are both zero at the same time, there is a singular configuration
        resulting in an infinite number of solutions for angles[1] (every value
        is possible).
     2. angles[2] is determined with function Frames.planarRotationAngle.
        This function requires to provide e_3 in frame 1a and in frame 1b:
          e3_1a = Frames.resolve2(planarRotation(e1_1,angles[1]), e3_1);
          e3_1b = e3_2
     3. angles[3] is determined with function Frames.planarRotationAngle.
        This function requires to provide e_2 in frame 1b and in frame 2:
          e2_1b = e2_1a
          e2_2  = Frames.resolve2( R, Frames.resolve1(planarRotation(e1_1,angles[1]), e2_1a));
  */
          assert(sequence[1] <> sequence[2] and sequence[2] <> sequence[3],
            "input argument 'sequence[1:3]' is not valid");
          e1_1 := if sequence[1] == 1 then {1,0,0} else if sequence[1] == 2 then {0,1,
            0} else {0,0,1};
          e2_1a := if sequence[2] == 1 then {1,0,0} else if sequence[2] == 2 then {0,
            1,0} else {0,0,1};
          e3_1 := R.T[sequence[3], :];
          e3_2 := if sequence[3] == 1 then {1,0,0} else if sequence[3] == 2 then {0,1,
            0} else {0,0,1};

          A := e2_1a*e3_1;
          B := cross(e1_1, e2_1a)*e3_1;
          if abs(A) <= 1.e-12 and abs(B) <= 1.e-12 then
            angles[1] := guessAngle1;
          else
            angle_1a := Modelica.Math.atan2(A, -B);
            angle_1b := Modelica.Math.atan2(-A, B);
            angles[1] := if abs(angle_1a - guessAngle1) <= abs(angle_1b - guessAngle1) then 
                    angle_1a else angle_1b;
          end if;
          T_1a := TransformationMatrices.planarRotation(e1_1, angles[1]);
          angles[2] := planarRotationAngle(e2_1a, TransformationMatrices.resolve2(
            T_1a, e3_1), e3_2);
          angles[3] := planarRotationAngle(e3_2, e2_1a,
            TransformationMatrices.resolve2(R.T, TransformationMatrices.resolve1(T_1a,
             e2_1a)));

        end axesRotationsAngles;

        function from_nxy
        "Return fixed orientation object from n_x and n_y vectors"
          extends Modelica.Icons.Function;
          input Real n_x[3](each final unit="1")
          "Vector in direction of x-axis of frame 2, resolved in frame 1";
          input Real n_y[3](each final unit="1")
          "Vector in direction of y-axis of frame 2, resolved in frame 1";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          annotation (Documentation(info="<html>
<p>
It is assumed that the two input vectors n_x and n_y are
resolved in frame 1 and are directed along the x and y axis
of frame 2 (i.e., n_x and n_y are orthogonal to each other)
The function returns the orientation object R to rotate from
frame 1 to frame 2.
</p>
<p>
The function is robust in the sense that it returns always
an orientation object R, even if n_y is not orthogonal to n_x.
This is performed in the following way:
</p>
<p>
If n_x and n_y are not orthogonal to each other, first a unit
vector e_y is determined that is orthogonal to n_x and is lying
in the plane spanned by n_x and n_y. If n_x and n_y are parallel
or nearly parallel to each other, a vector e_y is selected
arbitrarily such that e_x and e_y are orthogonal to each other.
</p>
</html>"));
      protected
          Real abs_n_x=sqrt(n_x*n_x);
          Real e_x[3](each final unit="1")=if abs_n_x < 1.e-10 then {1,0,0} else n_x/abs_n_x;
          Real n_z_aux[3](each final unit="1")=cross(e_x, n_y);
          Real n_y_aux[3](each final unit="1")=if n_z_aux*n_z_aux > 1.0e-6 then n_y else (if abs(e_x[1])
               > 1.0e-6 then {0,1,0} else {1,0,0});
          Real e_z_aux[3](each final unit="1")=cross(e_x, n_y_aux);
          Real e_z[3](each final unit="1")=e_z_aux/sqrt(e_z_aux*e_z_aux);
        algorithm
          R := Orientation(T={e_x,cross(e_z, e_x),e_z},w= zeros(3));
        end from_nxy;

        function from_T
        "Return orientation object R from transformation matrix T"
          extends Modelica.Icons.Function;
          input Real T[3, 3]
          "Transformation matrix to transform vector from frame 1 to frame 2 (v2=T*v1)";
          input Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity from frame 2 with respect to frame 1, resolved in frame 2 (skew(w)=T*der(transpose(T)))";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          R := Orientation(T=T,w= w);
        end from_T;

        function from_Q
        "Return orientation object R from quaternion orientation object Q"

          extends Modelica.Icons.Function;
          input Quaternions.Orientation Q
          "Quaternions orientation object to rotate frame 1 into frame 2";
          input Modelica.SIunits.AngularVelocity w[3]
          "Angular velocity from frame 2 with respect to frame 1, resolved in frame 2";
          output Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          /*
  T := (2*Q[4]*Q[4] - 1)*identity(3) + 2*([Q[1:3]]*transpose([Q[1:3]]) - Q[4]*
    skew(Q[1:3]));
*/
          R := Orientation([2*(Q[1]*Q[1] + Q[4]*Q[4]) - 1, 2*(Q[1]*Q[2] + Q[3]*Q[4]),
             2*(Q[1]*Q[3] - Q[2]*Q[4]); 2*(Q[2]*Q[1] - Q[3]*Q[4]), 2*(Q[2]*Q[2] + Q[4]
            *Q[4]) - 1, 2*(Q[2]*Q[3] + Q[1]*Q[4]); 2*(Q[3]*Q[1] + Q[2]*Q[4]), 2*(Q[3]
            *Q[2] - Q[1]*Q[4]), 2*(Q[3]*Q[3] + Q[4]*Q[4]) - 1],w= w);
        end from_Q;

        function to_Q
        "Return quaternion orientation object Q from orientation object R"

          extends Modelica.Icons.Function;
          input Orientation R
          "Orientation object to rotate frame 1 into frame 2";
          input Quaternions.Orientation Q_guess=Quaternions.nullRotation()
          "Guess value for output Q (there are 2 solutions; the one closer to Q_guess is used";
          output Quaternions.Orientation Q
          "Quaternions orientation object to rotate frame 1 into frame 2";
          annotation(Inline=true);
        algorithm
          Q := Quaternions.from_T(R.T, Q_guess);
        end to_Q;

        function axis "Return unit vector for x-, y-, or z-axis"
          extends Modelica.Icons.Function;
          input Integer axis(min=1, max=3) "Axis vector to be returned";
          output Real e[3](each final unit="1") "Unit axis vector";
          annotation(Inline=true);
        algorithm
          e := if axis == 1 then {1,0,0} else (if axis == 2 then {0,1,0} else {0,0,1});
        end axis;

        package Quaternions
        "Functions to transform rotational frame quantities based on quaternions (also called Euler parameters)"
          extends Modelica.Icons.Library;
          annotation ( Documentation(info="<HTML>
<p>
Package <b>Frames.Quaternions</b> contains type definitions and
functions to transform rotational frame quantities with quaternions.
Functions of this package are currently only utilized in
MultiBody.Parts.Body components, when quaternions shall be used
as parts of the body states.
Some functions are also used in a new Modelica package for
B-Spline interpolation that is able to interpolate paths consisting of
position vectors and orientation objects.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Quaternions.Orientation Q, Q1, Q2, Q_rel, Q_inv;
   Real[3,3]   T, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation Q;</b></td>
      <td valign=\"top\">New type defining a quaternion object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\"><b>der_Orientation</b> der_Q;</td>
      <td valign=\"top\">New type defining the first time derivative
         of Frames.Quaternions.Orientation.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(Q);</td>
      <td valign=\"top\">Return the constraints between the variables of a quaternion object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(Q, der_Q);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          quaternion object Q<br> and its derivative der_Q.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(Q, der_Q);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          quaternion object Q<br> and its derivative der_Q.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(Q,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(Q,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">[v1,w1] = <b>multipleResolve1</b>(Q, [v2,w2]);</td>
      <td valign=\"top\">Transform several vectors from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">[v2,w2] = <b>multipleResolve2</b>(Q, [v1,w1]);</td>
      <td valign=\"top\">Transform several vectors from frame 1 to frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>nullRotation</b>()</td>
      <td valign=\"top\">Return quaternion object R that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">Q_inv = <b>inverseRotation</b>(Q);</td>
      <td valign=\"top\">Return inverse quaternion object.
      </td>
  </tr>
  <tr><td valign=\"top\">Q_rel = <b>relativeRotation</b>(Q1,Q2);</td>
      <td valign=\"top\">Return relative quaternion object from two absolute
          quaternion objects.
      </td>
  </tr>
  <tr><td valign=\"top\">Q2 = <b>absoluteRotation</b>(Q1,Q_rel);</td>
      <td valign=\"top\">Return absolute quaternion object from another
          absolute<br> and a relative quaternion object.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>planarRotation</b>(e, angle);</td>
      <td valign=\"top\">Return quaternion object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(Q);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>from_T</b>(T);</td>
      <td valign=\"top\">Return quaternion object Q from transformation matrix T.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>from_T_inv</b>(T_inv);</td>
      <td valign=\"top\">Return quaternion object Q from inverse transformation matrix T_inv.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(Q);</td>
      <td valign=\"top\">Return transformation matrix T from quaternion object Q.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(Q);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from quaternion object Q.
      </td>
  </tr>
</table>
</HTML>"));

          type Orientation
          "Orientation type defining rotation from a frame 1 into a frame 2 with quaternions {p1,p2,p3,p0}"

            extends Internal.QuaternionBase;
            annotation ( Documentation(info="<html>
<p>
This type describes the <b>rotation</b> to rotate a frame 1 into
a frame 2 using quaternions (also called <b>Euler parameters</b>)
according to the following definition:
</p>
<pre>
   Quaternions.Orientation Q;
   Real  n[3];
   Real  phi(unit=\"rad\");
   Q = [ n*sin(phi/2)
           cos(phi/2) ]
</pre>
<p>
where \"n\" is the <b>axis of rotation</b> to rotate frame 1 into
frame 2 and \"phi\" is the <b>rotation angle</b> for this rotation.
Vector \"n\" is either resolved in frame 1 or in frame 2
(the result is the same since the coordinates of \"n\" with respect to
frame 1 are identical to its coordinates with respect to frame 2).
<p>
<p>
The term \"quaternions\" is prefered over the historically
more reasonable \"Euler parameters\" in order to not get
confused with Modelica \"parameters\".
</p>
</html>
"));

            encapsulated function equalityConstraint
            "Return the constraint residues to express that two frames have the same quaternion orientation"

              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.Quaternions;
              extends Modelica.Icons.Function;
              input Quaternions.Orientation Q1
              "Quaternions orientation object to rotate frame 0 into frame 1";
              input Quaternions.Orientation Q2
              "Quaternions orientation object to rotate frame 0 into frame 2";
              output Real residue[3]
              "The half of the rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (shall be zero)";
              annotation(Inline=true);
            algorithm
              residue := [Q1[4], Q1[3], -Q1[2], -Q1[1]; -Q1[3], Q1[4], Q1[1], -Q1[2];
                 Q1[2], -Q1[1], Q1[4], -Q1[3]]*Q2;
            end equalityConstraint;

          end Orientation;

          type der_Orientation = Real[4] (each unit="1/s")
          "First time derivative of Quaternions.Orientation";

          function orientationConstraint
          "Return residues of orientation constraints (shall be zero)"
            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
            output Real residue[1] "Residue constraint (shall be zero)";
            annotation(Inline=true);
          algorithm
            residue := {Q*Q - 1};
          end orientationConstraint;

          function angularVelocity2
          "Compute angular velocity resolved in frame 2 from quaternions orientation object and its derivative"

            extends Modelica.Icons.Function;
            input Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
            input der_Orientation der_Q "Derivative of Q";
            output Modelica.SIunits.AngularVelocity w[3]
            "Angular velocity of frame 2 with respect to frame 1 resolved in frame 2";
            annotation(Inline=true);
          algorithm
            w := 2*([Q[4], Q[3], -Q[2], -Q[1]; -Q[3], Q[4], Q[1], -Q[2]; Q[2], -Q[1],
               Q[4], -Q[3]]*der_Q);
          end angularVelocity2;

          function nullRotation
          "Return quaternions orientation object that does not rotate a frame"

            extends Modelica.Icons.Function;
            output Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm
            Q := {0,0,0,1};
          end nullRotation;

          function from_T
          "Return quaternions orientation object Q from transformation matrix T"

            extends Modelica.Icons.Function;
            input Real T[3, 3]
            "Transformation matrix to transform vector from frame 1 to frame 2 (v2=T*v1)";
            input Quaternions.Orientation Q_guess=nullRotation()
            "Guess value for Q (there are 2 solutions; the one close to Q_guess is used";
            output Quaternions.Orientation Q
            "Quaternions orientation object to rotate frame 1 into frame 2 (Q and -Q have same transformation matrix)";
        protected
            Real paux;
            Real paux4;
            Real c1;
            Real c2;
            Real c3;
            Real c4;
            constant Real p4limit=0.1;
            constant Real c4limit=4*p4limit*p4limit;
          algorithm
            /*
   Note, for quaternions, Q and -Q have the same transformation matrix.
   Calculation of quaternions from transformation matrix T:
   It is guaranteed that c1>=0, c2>=0, c3>=0, c4>=0 and
   that not all of them can be zero at the same time
   (e.g. if 3 of them are zero, the 4th variable is 1).
   Since the sqrt(..) has to be performed on one of these variables,
   it is applied on a variable which is far enough from zero.
   This guarantees that the sqrt(..) is never taken near zero
   and therefore the derivative of sqrt(..) can never be infinity.
   There is an ambiguity for quaternions, since Q and -Q
   lead to the same transformation matrix. The ambiguity
   is resolved here by selecting the Q that is closer to
   the input argument Q_guess.
*/
            c1 := 1 + T[1, 1] - T[2, 2] - T[3, 3];
            c2 := 1 + T[2, 2] - T[1, 1] - T[3, 3];
            c3 := 1 + T[3, 3] - T[1, 1] - T[2, 2];
            c4 := 1 + T[1, 1] + T[2, 2] + T[3, 3];

            if c4 > c4limit or (c4 > c1 and c4 > c2 and c4 > c3) then
              paux := sqrt(c4)/2;
              paux4 := 4*paux;
              Q := {(T[2, 3] - T[3, 2])/paux4,(T[3, 1] - T[1, 3])/paux4,(T[1, 2] - T[
                2, 1])/paux4,paux};

            elseif c1 > c2 and c1 > c3 and c1 > c4 then
              paux := sqrt(c1)/2;
              paux4 := 4*paux;
              Q := {paux,(T[1, 2] + T[2, 1])/paux4,(T[1, 3] + T[3, 1])/paux4,(T[2, 3]
                 - T[3, 2])/paux4};

            elseif c2 > c1 and c2 > c3 and c2 > c4 then
              paux := sqrt(c2)/2;
              paux4 := 4*paux;
              Q := {(T[1, 2] + T[2, 1])/paux4,paux,(T[2, 3] + T[3, 2])/paux4,(T[3, 1]
                 - T[1, 3])/paux4};

            else
              paux := sqrt(c3)/2;
              paux4 := 4*paux;
              Q := {(T[1, 3] + T[3, 1])/paux4,(T[2, 3] + T[3, 2])/paux4,paux,(T[1, 2]
                 - T[2, 1])/paux4};
            end if;

            if Q*Q_guess < 0 then
              Q := -Q;
            end if;
          end from_T;
        end Quaternions;

        package TransformationMatrices "Functions for transformation matrices"
          extends Modelica.Icons.Library;

          type Orientation
          "Orientation type defining rotation from a frame 1 into a frame 2 with a transformation matrix"

            extends Internal.TransformationMatrix;
            annotation (Documentation(info="<html>
<p>
This type describes the <b>rotation</b> from a <b>frame 1</b> into a <b>frame 2</b>.
An instance <b>R</b> of type <b>Orientation</b> has the following interpretation:
</p>
<pre>
   <b>T</b> = [<b>e</b><sub>x</sub>, <b>e</b><sub>y</sub>, <b>e</b><sub>z</sub>];
       e.g., <b>T</b> = [1,0,0; 0,1,0; 0,0,1]
</pre>
<p>
where <b>e</b><sub>x</sub>,<b>e</b><sub>y</sub>,<b>e</b><sub>z</sub>
are unit vectors in the direction of the x-axis, y-axis, and z-axis
of frame 1, resolved in frame 2, respectively. Therefore, if <b>v</b><sub>1</sub>
is vector <b>v</b> resolved in frame 1 and <b>v</b><sub>2</sub> is
vector <b>v</b> resolved in frame 2, the following relationship holds:
</p>
<pre>
    <b>v</b><sub>2</sub> = <b>T</b> * <b>v</b><sub>1</sub>
</pre>
</p>
The <b>inverse</b> orientation
<b>T_inv</b> = <b>T</b><sup>T</sup> describes the rotation
from frame 2 into frame 1.
</p>
<p>
Since the orientation is described by 9 variables, there are
6 constraints between these variables. These constraints
are defined in function <b>TransformationMatrices.orientationConstraint</b>.
</p>
<p>
Note, that in the MultiBody library the rotation object is
never directly accessed but only with the access functions provided
in package TransformationMatrices. As a consequence, other implementations of
Rotation can be defined by adapting this package correspondingly.
</p>
</html>
"));

            encapsulated function equalityConstraint
            "Return the constraint residues to express that two frames have the same orientation"

              import Modelica;
              import Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
              extends Modelica.Icons.Function;
              input TransformationMatrices.Orientation T1
              "Orientation object to rotate frame 0 into frame 1";
              input TransformationMatrices.Orientation T2
              "Orientation object to rotate frame 0 into frame 2";
              output Real residue[3]
              "The rotation angles around x-, y-, and z-axis of frame 1 to rotate frame 1 into frame 2 for a small rotation (should be zero)";
              annotation(Inline=true);
            algorithm
              residue := {cross(T1[1, :], T1[2, :])*T2[2, :],-cross(T1[1, :], T1[2, :])
                *T2[1, :],T1[2, :]*T2[1, :]};
            end equalityConstraint;
          end Orientation;

          function resolve1 "Transform vector from frame 2 to frame 1"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector in frame 2";
            output Real v1[3] "Vector in frame 1";
            annotation(Inline=true);
          algorithm
            v1 := transpose(T)*v2;
          end resolve1;

          function resolve2 "Transform vector from frame 1 to frame 2"
            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector in frame 1";
            output Real v2[3] "Vector in frame 2";
            annotation(Inline=true);
          algorithm
            v2 := T*v1;
          end resolve2;

          function absoluteRotation
          "Return absolute orientation object from another absolute and a relative orientation object"

            extends Modelica.Icons.Function;
            input TransformationMatrices.Orientation T1
            "Orientation object to rotate frame 0 into frame 1";
            input TransformationMatrices.Orientation T_rel
            "Orientation object to rotate frame 1 into frame 2";
            output TransformationMatrices.Orientation T2
            "Orientation object to rotate frame 0 into frame 2";
            annotation(Inline=true);
          algorithm
            T2 := T_rel*T1;
          end absoluteRotation;

          function planarRotation
          "Return orientation object of a planar rotation"
            import Modelica.Math;
            extends Modelica.Icons.Function;
            input Real e[3](each final unit="1")
            "Normalized axis of rotation (must have length=1)";
            input Modelica.SIunits.Angle angle
            "Rotation angle to rotate frame 1 into frame 2 along axis e";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm
            T := [e]*transpose([e]) + (identity(3) - [e]*transpose([e]))*Math.cos(
              angle) - skew(e)*Math.sin(angle);
          end planarRotation;

          function axisRotation
          "Return rotation object to rotate around one frame axis"
            import Modelica.Math.*;
            extends Modelica.Icons.Function;
            input Integer axis(min=1, max=3) "Rotate around 'axis' of frame 1";
            input Modelica.SIunits.Angle angle
            "Rotation angle to rotate frame 1 into frame 2 along 'axis' of frame 1";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            annotation(Inline=true);
          algorithm
            T := if axis == 1 then [1, 0, 0; 0, cos(angle), sin(angle); 0, -sin(angle),
               cos(angle)] else if axis == 2 then [cos(angle), 0, -sin(angle); 0, 1,
              0; sin(angle), 0, cos(angle)] else [cos(angle), sin(angle), 0; -sin(
              angle), cos(angle), 0; 0, 0, 1];
          end axisRotation;

          function from_nxy
          "Return orientation object from n_x and n_y vectors"
            extends Modelica.Icons.Function;
            input Real n_x[3](each final unit="1")
            "Vector in direction of x-axis of frame 2, resolved in frame 1";
            input Real n_y[3](each final unit="1")
            "Vector in direction of y-axis of frame 2, resolved in frame 1";
            output TransformationMatrices.Orientation T
            "Orientation object to rotate frame 1 into frame 2";
            annotation (Documentation(info="<html>
<p>
It is assumed that the two input vectors n_x and n_y are
resolved in frame 1 and are directed along the x and y axis
of frame 2 (i.e., n_x and n_y are orthogonal to each other)
The function returns the orientation object T to rotate from
frame 1 to frame 2.
</p>
<p>
The function is robust in the sense that it returns always
an orientation object T, even if n_y is not orthogonal to n_x.
This is performed in the following way:
</p>
<p>
If n_x and n_y are not orthogonal to each other, first a unit
vector e_y is determined that is orthogonal to n_x and is lying
in the plane spanned by n_x and n_y. If n_x and n_y are parallel
or nearly parallel to each other, a vector e_y is selected
arbitrarily such that e_x and e_y are orthogonal to each other.
</p>
</html>"));
        protected
            Real abs_n_x=sqrt(n_x*n_x);
            Real e_x[3](each final unit="1")=if abs_n_x < 1.e-10 then {1,0,0} else n_x/abs_n_x;
            Real n_z_aux[3](each final unit="1")=cross(e_x, n_y);
            Real n_y_aux[3](each final unit="1")=if n_z_aux*n_z_aux > 1.0e-6 then n_y else (if abs(e_x[1])
                 > 1.0e-6 then {0,1,0} else {1,0,0});
            Real e_z_aux[3](each final unit="1")=cross(e_x, n_y_aux);
            Real e_z[3](each final unit="1")=e_z_aux/sqrt(e_z_aux*e_z_aux);
          algorithm
            T := {e_x,cross(e_z, e_x),e_z};
          end from_nxy;
          annotation (Documentation(info="<HTML>
<p>
Package <b>Frames.TransformationMatrices</b> contains type definitions and
functions to transform rotational frame quantities using
transformation matrices.
</p>
<h4>Content</h4>
<p>In the table below an example is given for every function definition.
The used variables have the following declaration:
</p>
<pre>
   Orientation T, T1, T2, T_rel, T_inv;
   Real[3]     v1, v2, w1, w2, n_x, n_y, n_z, e, e_x, res_ori, phi;
   Real[6]     res_equal;
   Real        L, angle;
</pre>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Function/type</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><b>Orientation T;</b></td>
      <td valign=\"top\">New type defining an orientation object that describes<br>
          the rotation of frame 1 into frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\"><b>der_Orientation</b> der_T;</td>
      <td valign=\"top\">New type defining the first time derivative
         of Frames.Orientation.
      </td>
  </tr>
  <tr><td valign=\"top\">res_ori = <b>orientationConstraint</b>(T);</td>
      <td valign=\"top\">Return the constraints between the variables of an orientation object<br>
      (shall be zero).</td>
  </tr>
  <tr><td valign=\"top\">w1 = <b>angularVelocity1</b>(T, der_T);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 1 from
          orientation object T<br> and its derivative der_T.
     </td>
  </tr>
  <tr><td valign=\"top\">w2 = <b>angularVelocity2</b>(T, der_T);</td>
      <td valign=\"top\">Return angular velocity resolved in frame 2 from
          orientation object T<br> and its derivative der_T.
     </td>
  </tr>
  <tr><td valign=\"top\">v1 = <b>resolve1</b>(T,v2);</td>
      <td valign=\"top\">Transform vector v2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">v2 = <b>resolve2</b>(T,v1);</td>
      <td valign=\"top\">Transform vector v1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">[v1,w1] = <b>multipleResolve1</b>(T, [v2,w2]);</td>
      <td valign=\"top\">Transform several vectors from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">[v2,w2] = <b>multipleResolve2</b>(T, [v1,w1]);</td>
      <td valign=\"top\">Transform several vectors from frame 1 to frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">D1 = <b>resolveDyade1</b>(T,D2);</td>
      <td valign=\"top\">Transform second order tensor D2 from frame 2 to frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">D2 = <b>resolveDyade2</b>(T,D1);</td>
      <td valign=\"top\">Transform second order tensor D1 from frame 1 to frame 2.
     </td>
  </tr>
  <tr><td valign=\"top\">T= <b>nullRotation</b>()</td>
      <td valign=\"top\">Return orientation object T that does not rotate a frame.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>inverseRotation</b>(T);</td>
      <td valign=\"top\">Return inverse orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">T_rel = <b>relativeRotation</b>(T1,T2);</td>
      <td valign=\"top\">Return relative orientation object from two absolute
          orientation objects.
      </td>
  </tr>
  <tr><td valign=\"top\">T2 = <b>absoluteRotation</b>(T1,T_rel);</td>
      <td valign=\"top\">Return absolute orientation object from another
          absolute<br> and a relative orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>planarRotation</b>(e, angle);</td>
      <td valign=\"top\">Return orientation object of a planar rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">angle = <b>planarRotationAngle</b>(e, v1, v2);</td>
      <td valign=\"top\">Return angle of a planar rotation, given the rotation axis<br>
        and the representations of a vector in frame 1 and frame 2.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>axisRotation</b>(i, angle);</td>
      <td valign=\"top\">Return orientation object T for rotation around axis i of frame 1.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>axesRotations</b>(sequence, angles);</td>
      <td valign=\"top\">Return rotation object to rotate in sequence around 3 axes. Example:<br>
          T = axesRotations({1,2,3},{90,45,-90});
      </td>
  </tr>
  <tr><td valign=\"top\">angles = <b>axesRotationsAngles</b>(T, sequence);</td>
      <td valign=\"top\">Return the 3 angles to rotate in sequence around 3 axes to<br>
          construct the given orientation object.
      </td>
  </tr>
  <tr><td valign=\"top\">phi = <b>smallRotation</b>(T);</td>
      <td valign=\"top\">Return rotation angles phi valid for a small rotation.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_nxy</b>(n_x, n_y);</td>
      <td valign=\"top\">Return orientation object from n_x and n_y vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_nxz</b>(n_x, n_z);</td>
      <td valign=\"top\">Return orientation object from n_x and n_z vectors.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T</b>(T);</td>
      <td valign=\"top\">Return orientation object R from transformation matrix T.
      </td>
  </tr>
  <tr><td valign=\"top\">R = <b>from_T_inv</b>(T_inv);</td>
      <td valign=\"top\">Return orientation object R from inverse transformation matrix T_inv.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>from_Q</b>(Q);</td>
      <td valign=\"top\">Return orientation object T from quaternion orientation object Q.
      </td>
  </tr>
  <tr><td valign=\"top\">T = <b>to_T</b>(R);</td>
      <td valign=\"top\">Return transformation matrix T from orientation object R.
  </tr>
  <tr><td valign=\"top\">T_inv = <b>to_T_inv</b>(R);</td>
      <td valign=\"top\">Return inverse transformation matrix T_inv from orientation object R.
      </td>
  </tr>
  <tr><td valign=\"top\">Q = <b>to_Q</b>(T);</td>
      <td valign=\"top\">Return quaternione orientation object Q from orientation object T.
      </td>
  </tr>
  <tr><td valign=\"top\">exy = <b>to_exy</b>(T);</td>
      <td valign=\"top\">Return [e_x, e_y] matrix of an orientation object T, <br>
          with e_x and e_y vectors of frame 2, resolved in frame 1.
  </tr>
</table>
</HTML>"));
        end TransformationMatrices;

        package Internal
        "Internal definitions that may be removed or changed (do not use)"
          extends Modelica.Icons.Library;

          type TransformationMatrix = Real[3, 3];

          type QuaternionBase = Real[4];

          function maxWithoutEvent
          "Maximum of the input arguments, without event and without warning message when differentiating"

            input Real u1;
            input Real u2;
            output Real y;
            annotation (Inline=false,
          derivative=maxWithoutEvent_d, Documentation(info="<html>
<p>
Function <b>maxWithoutEvent</b> returns the maximum of its two
input arguments. This functions is used instead of the Modelica
built-in function \"max\" or an if-statement with \"noEvent(..)\",
because Dymola prints a warning message when differentiating
in these cases. For the special cases as used in the MultiBody
library, these warning messages are irrelevant but will potentially
irritate the user. The C-function \"maxWithoutEvent\" and its
derivatives provided as additional functions \"maxWithoutEvent_d\"
and \"maxWithoutEvent_dd\" will not lead to such warning
messages.
</p>
</html>"));
            //  annotation (Header="#include \"MultiBody.h\"");
        protected
            Integer dummy;
          algorithm
            y := if u1 > u2 then u1 else u2;
            dummy := 0;
          end maxWithoutEvent;

          function maxWithoutEvent_d
          "First derivative of function maxWithoutEvent(..)"
            input Real u1;
            input Real u2;
            input Real u1_d;
            input Real u2_d;
            output Real y_d;
            annotation (Inline=false, derivative(order=2) = maxWithoutEvent_dd);
            //annotation (Header="#include \"MultiBody.h\"");
        protected
            Integer dummy;
          algorithm
            y_d := if u1 > u2 then u1_d else u2_d;
            dummy := 0;
          end maxWithoutEvent_d;

          function maxWithoutEvent_dd
          "First derivative of function maxWithoutEvent_d(..)"
            input Real u1;
            input Real u2;
            input Real u1_d;
            input Real u2_d;
            input Real u1_dd;
            input Real u2_dd;
            output Real y_dd;
          algorithm
            y_dd := if u1 > u2 then u1_dd else u2_dd;
          end maxWithoutEvent_dd;

          function resolve1_der "Derivative of function Frames.resolve1(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R
            "Orientation object to rotate frame 1 into frame 2";
            input Real v2[3] "Vector resolved in frame 2";
            input Real v2_der[3] "= der(v2)";
            output Real v1_der[3] "Derivative of vector v resolved in frame 1";
            annotation(Inline=true);
          algorithm
            v1_der := Frames.resolve1(R, v2_der + cross(R.w, v2));
          end resolve1_der;

          function resolve2_der "Derivative of function Frames.resolve2(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Orientation R
            "Orientation object to rotate frame 1 into frame 2";
            input Real v1[3] "Vector resolved in frame 1";
            input Real v1_der[3] "= der(v1)";
            output Real v2_der[3] "Derivative of vector v resolved in frame 2";
            annotation(Inline=true);
          algorithm
            v2_der := Frames.resolve2(R, v1_der) - cross(R.w, Frames.resolve2(R, v1));
          end resolve2_der;

          function resolveRelative_der
          "Derivative of function Frames.resolveRelative(..)"
            import Modelica.Mechanics.MultiBody.Frames;
            extends Modelica.Icons.Function;
            input Real v1[3] "Vector in frame 1";
            input Orientation R1
            "Orientation object to rotate frame 0 into frame 1";
            input Orientation R2
            "Orientation object to rotate frame 0 into frame 2";
            input Real v1_der[3] "= der(v1)";
            output Real v2_der[3] "Derivative of vector v resolved in frame 2";
            annotation(Inline=true);
          algorithm
            v2_der := Frames.resolveRelative(v1_der+cross(R1.w,v1), R1, R2)
                      - cross(R2.w, Frames.resolveRelative(v1, R1, R2));

            /* skew(w) = T*der(T'), -skew(w) = der(T)*T'

     v2 = T2*(T1'*v1)
     der(v2) = der(T2)*T1'*v1 + T2*der(T1')*v1 + T2*T1'*der(v1)
             = der(T2)*T2'*T2*T1'*v1 + T2*T1'*T1*der(T1')*v1 + T2*T1'*der(v1)
             = -w2 x (T2*T1'*v1) + T2*T1'*(w1 x v1) + T2*T1'*der(v1)
             = T2*T1'*(der(v1) + w1 x v1) - w2 x (T2*T1'*v1)
  */
          end resolveRelative_der;
        end Internal;
      end Frames;

      package Interfaces
      "Connectors and partial models for 3-dim. mechanical components"
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<html>
<p>
This package contains connectors and partial models (i.e. models
that are only used to build other models) of the MultiBody library.
</p>
</html>"));

        connector Frame
        "Coordinate system fixed to the component with one cut-force and cut-torque (no icon)"
          import SI = Modelica.SIunits;
          SI.Position r_0[3]
          "Position vector from world frame to the connector frame origin, resolved in world frame";
          Frames.Orientation R
          "Orientation object to rotate the world frame into the connector frame";
          flow SI.Force f[3] "Cut-force resolved in connector frame" annotation (
              unassignedMessage="All Forces cannot be uniquely calculated.
The reason could be that the mechanism contains
a planar loop or that joints constrain the
same motion. For planar loops, use for one
revolute joint per loop the joint
Joints.RevolutePlanarLoopConstraint instead of
Joints.Revolute.");
          flow SI.Torque t[3] "Cut-torque resolved in connector frame";
          annotation (Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting. This component has no icon definition
and is only used by inheritance from frame connectors to define
different icons.
</p>
</html>"));
        end Frame;

        connector Frame_a
        "Coordinate system fixed to the component with one cut-force and cut-torque (filled rectangular icon)"
          extends Frame;

          annotation (defaultComponentName="frame_a",
           Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Rectangle(
                  extent={{-10,10},{10,-10}},
                  lineColor={95,95,95},
                  lineThickness=0.5), Rectangle(
                  extent={{-30,100},{30,-100}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid)}),
           Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Text(
                  extent={{-140,-50},{140,-88}},
                  lineColor={0,0,0},
                  textString="%name"), Rectangle(
                  extent={{-12,40},{12,-40}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid)}),
            Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting.
This component has a filled rectangular icon.
</p>
</html>"));
        end Frame_a;

        connector Frame_b
        "Coordinate system fixed to the component with one cut-force and cut-torque (non-filled rectangular icon)"
          extends Frame;

          annotation (defaultComponentName="frame_b",
           Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Rectangle(
                  extent={{-10,10},{10,-10}},
                  lineColor={95,95,95},
                  lineThickness=0.5), Rectangle(
                  extent={{-30,100},{30,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
           Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Text(
                  extent={{-140,-50},{140,-88}},
                  lineColor={0,0,0},
                  textString="%name"), Rectangle(
                  extent={{-12,40},{12,-40}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
            Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting. This component has a non-filled rectangular icon.
</p>
</html>"));
        end Frame_b;

      connector Frame_resolve "Coordinate system fixed to the component used to express in which
coordinate system a vector is resolved (non-filled rectangular icon)"
        extends Frame;

        annotation (defaultComponentName="frame_resolve",
          Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Rectangle(
                  extent={{-10,10},{10,-10}},
                  lineColor={95,95,95},
                  pattern=LinePattern.Dot), Rectangle(
                  extent={{-30,100},{30,-100}},
                  lineColor={95,95,95},
                  pattern=LinePattern.Dot,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1},
                initialScale=0.16), graphics={Text(
                  extent={{-140,-50},{140,-88}},
                  lineColor={0,0,0},
                  textString="%name"), Rectangle(
                  extent={{-12,40},{12,-40}},
                  lineColor={95,95,95},
                  pattern=LinePattern.Dot,
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
          Documentation(info="<html>
<p>
Basic definition of a coordinate system that is fixed to a mechanical
component. In the origin of the coordinate system the cut-force
and the cut-torque is acting. This coordinate system is used to
express in which coordinate system a vector is resolved.
A component that uses a Frame_resolve connector has to set the
cut-force and cut-torque of this frame to zero. When connecting
from a Frame_resolve connector to another frame connector,
by default the connecting line has line style \"dotted\".
This component has a non-filled rectangular icon.
</p>
</html>"));
      end Frame_resolve;

        partial model PartialTwoFrames
        "Base model for components providing two frame connectors + outer world + assert to guarantee that the component is connected"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of component is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Text(
                  extent={{-136,-25},{-100,-50}},
                  lineColor={128,128,128},
                  textString="a"), Text(
                  extent={{100,-25},{136,-50}},
                  lineColor={128,128,128},
                  textString="b")}),
            Documentation(info="<HTML>
<p>
This partial model provides two frame connectors, access to the world
object and an assert to check that both frame connectors are connected.
Therefore, inherit from this partial model if the two frame connectors are
needed and if the two frame connectors should be connected for a correct model.
</p>
</HTML>"),  Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));

        end PartialTwoFrames;

        partial model PartialTwoFramesDoubleSize
        "Base model for components providing two frame connectors + outer world + assert to guarantee that the component is connected (default icon size is factor 2 larger as usual)"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
           annotation (Placement(transformation(extent={{-108,-8},{-92,8}})));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
            annotation (Placement(transformation(extent={{92,-8},{108,8}})));

          annotation (
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                initialScale=0.2)),
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                initialScale=0.2), graphics={Text(
                  extent={{-117,-13},{-106,-23}},
                  lineColor={128,128,128},
                  textString="a"), Text(
                  extent={{110,-15},{122,-25}},
                  lineColor={128,128,128},
                  textString="b")}),
            Documentation(info="<HTML>
<p>
This partial model provides two frame connectors, access to the world
object and an assert to check that both frame connectors are connected.
Therefore, inherit from this partial model if the two frame connectors are
needed and if the two frame connectors should be connected for a correct model.
</p>
<p>
When dragging \"PartialTwoFrames\", the default size is a factor of two
larger as usual. This partial model is used by the Joint.Assemblies
joint aggregation models.
</p>
</HTML>"));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of component is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");
        end PartialTwoFramesDoubleSize;

        partial model PartialOneFrame_b
        "Base model for components providing one frame_b connector + outer world + assert to guarantee that the component is connected"

          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
            annotation (Placement(transformation(extent={{84,-16},{116,16}}, rotation=
                   0)));
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of component is not connected");
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={Text(
                  extent={{94,-20},{130,-45}},
                  lineColor={128,128,128},
                  textString="b")}),
            Documentation(info="<HTML>
<p>
This partial model provides one frame_b connector, access to the world
object and an assert to check that the frame_b connector is connected.
Therefore, inherit from this partial model if the frame_b connector is
needed and if this connector should be connected for a correct model.
</p>
</HTML>"),  Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));

        end PartialOneFrame_b;

        partial model PartialElementaryJoint
        "Base model for elementary joints (has two frames + outer world + assert to guarantee that the joint is connected)"

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the joint with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the joint with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of joint object is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of joint object is not connected");
          annotation (Documentation(info="<HTML>
<p>
All <b>elementary joints</b> should inherit from this base model, i.e.,
joints that are directly defined by equations, provided they compute
either the rotation object of frame_b from the rotation object of frame_a
and from relative quantities (or vice versa), or there is a constraint
equation between the rotation objects of the two frames.
In other cases, a joint object should inherit from
<b>Interfaces.PartialTwoFrames</b> (e.g., joint Spherical, because there
is no constraint between the rotation objects of frame_a and frame_b
or joint Cylindrical because it is not an elementary joint).
</p>
<p>
This partial model provides two frame connectors, a \"Connections.branch\"
between frame_a and frame_b, access to the world
object and an assert to check that both frame connectors are connected.
</p>
</HTML>
 "),       Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));
        end PartialElementaryJoint;

        partial model PartialLineForce "Base model for line force elements"
          import SI = Modelica.SIunits;
          parameter SI.Position s_small=1.E-6
          " Prevent zero-division if relative distance s=0" 
            annotation (Dialog(tab="Advanced"));
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the force element with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the force element with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));
          SI.Force f
          "Line force acting on frame_a and on frame_b (positive, if acting on frame_b and directed from frame_a to frame_b)";
          SI.Position s
          "(Guarded) distance between the origin of frame_a and the origin of frame_b (>= s_small))";
          Real e_a[3](each final unit="1")
          "Unit vector on the line connecting the origin of frame_a with the origin of frame_b resolved in frame_a (directed from frame_a to frame_b)";
          Modelica.SIunits.Position r_rel_a[3]
          "Position vector from origin of frame_a to origin of frame_b, resolved in frame_a";
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          Connections.potentialRoot(frame_a.R, 100);
          Connections.potentialRoot(frame_b.R, 100);

          assert(cardinality(frame_a) > 0,
            "Connector frame_a of line force object is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of line force object is not connected");

          // Determine distance s and n_a
          r_rel_a = Frames.resolve2(frame_a.R, frame_b.r_0 - frame_a.r_0);
          s = noEvent(max(Modelica.Math.Vectors.length(
                                        r_rel_a), s_small));
          e_a = r_rel_a/s;

          /* Determine forces and torques at frame_a and frame_b */
          frame_a.f = -e_a*f;
          frame_b.f = -Frames.resolve2(Frames.relativeRotation(frame_a.R, frame_b.R),
             frame_a.f);

          // Additional equations, if direct connections of line forces
          if Connections.isRoot(frame_a.R) then
            frame_a.R = Frames.nullRotation();
          else
            frame_a.t = zeros(3);
          end if;

          if Connections.isRoot(frame_b.R) then
            frame_b.R = Frames.nullRotation();
          else
            frame_b.t = zeros(3);
          end if;

          annotation (Documentation(info="<HTML>
<p>
All <b>line force</b> elements should be based on this base model.
This model defines frame_a and frame_b, computes the relative
distance <b>s</b> and provides the force and torque
balance of the cut-forces and cut-torques at frame_a and
frame_b, respectively. In sub-models, only the line force <b>f</b>,
acting at frame_b on the line from frame_a to frame_b, as a function
of the relative distance <b>s</b> and its derivative <b>der</b>(<b>s</b>)
has to be defined. Example:
</p>
<pre>
   <b>model</b> Spring
      <b>parameter</b> Real c \"spring constant\",
      <b>parameter</b> Real s_unstretched \"unstretched spring length\";
      <b>extends</b> Modelica.Mechanics.MultiBody.Interfaces.PartialLineForce;
   <b>equation</b>
      f = c*(s-s_unstretched);
   <b>end</b> Spring;
</pre>
</HTML>"),       Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                    {100,100}}), graphics={Text(
                  extent={{-136,44},{-100,19}},
                  lineColor={128,128,128},
                  textString="a"), Text(
                  extent={{100,42},{136,17}},
                  lineColor={128,128,128},
                  textString="b")}));
        end PartialLineForce;

        partial model PartialVisualizer
        "Base model for visualizers (has a frame_a on the left side + outer world + assert to guarantee that the component is connected)"

          Interfaces.Frame_a frame_a
          "Coordinate system in which visualization data is resolved"                            annotation (Placement(
                transformation(extent={{-116,-16},{-84,16}}, rotation=0)));
      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          assert(cardinality(frame_a) > 0,
            "Connector frame_a of visualizer object is not connected");
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}),
                           graphics),
                            Documentation(info="<html>
<p>
This partial model provides one frame_a connector, access to the world
object and an assert to check that the frame_a connector is connected.
It is used by inheritance from all visualizer objects.
</p>
</html>"));
        end PartialVisualizer;

        model ZeroPosition
        "Set absolute position vector of frame_resolve to a zero vector and the orientation object to a null rotation"
           extends Modelica.Blocks.Interfaces.BlockIcon;
          Interfaces.Frame_resolve frame_resolve 
            annotation (Placement(transformation(extent={{-116,-16},{-84,16}})));
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={Text(
                  extent={{-74,24},{80,-20}},
                  lineColor={0,0,0},
                  textString="r = 0")}), Diagram(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                graphics));
        equation
          Connections.root(frame_resolve.R);
          frame_resolve.R = Modelica.Mechanics.MultiBody.Frames.nullRotation();
          frame_resolve.r_0 = zeros(3);
        end ZeroPosition;
      end Interfaces;

      package Joints "Components that constrain the motion between two frames"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
This package contains <b>joint components</b>,
that is, idealized, massless elements that constrain
the motion between frames. In subpackage <b>Assemblies</b>
aggregation joint components are provided to handle
kinematic loops analytically (this means that non-linear systems
of equations occuring in these joint aggregations are analytically
solved, i.e., robustly and efficiently).
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Prismatic\">Prismatic</a>
      <td valign=\"top\">Prismatic joint and actuated prismatic joint
          (1 translational degree-of-freedom, 2 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Prismatic.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Revolute\">Revolute</a>
 </td>
      <td valign=\"top\">Revolute and actuated revolute joint
          (1 rotational degree-of-freedom, 2 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Revolute.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Cylindrical\">Cylindrical</a></td>
      <td valign=\"top\">Cylindrical joint (2 degrees-of-freedom, 4 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Cylindrical.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Universal\">Universal</a></td>
      <td valign=\"top\">Universal joint (2 degrees-of-freedom, 4 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Universal.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Planar\">Planar</a></td>
      <td valign=\"top\">Planar joint (3 degrees-of-freedom, 6 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Planar.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Spherical\">Spherical</a></td>
      <td valign=\"top\">Spherical joint (3 constraints and no potential states, or 3 degrees-of-freedom and 3 states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/Spherical.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.FreeMotion\">FreeMotion</a></td>
      <td valign=\"top\">Free motion joint (6 degrees-of-freedom, 12 potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/FreeMotion.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.SphericalSpherical\">SphericalSpherical</a></td>
      <td valign=\"top\">Spherical - spherical joint aggregation (1 constraint,
          no potential states) with an optional point mass in the middle<br>
      <IMG SRC=\"../Images/MultiBody/Joints/SphericalSpherical.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.UniversalSpherical\">UniversalSpherical</a></td>
      <td valign=\"top\">Universal - spherical joint aggregation (1 constraint, no potential states)<br>
      <IMG SRC=\"../Images/MultiBody/Joints/UniversalSpherical.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.GearConstraint\">GearConstraint</a></td>
      <td valign=\"top\">Ideal 3-dim. gearbox (arbitrary shaft directions)
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies\">MultiBody.Joints.Assemblies</a></td>
      <td valign=\"top\"><b>Package</b> of joint aggregations for analytic loop handling.
      </td>
  </tr>
</table>
</HTML>"));

        model Prismatic
        "Prismatic joint (1 translational degree-of-freedom, 2 potential states, optional axis flange)"

          import SI = Modelica.SIunits;
          extends
          Modelica.Mechanics.MultiBody.Interfaces.PartialElementaryJoint;
          Modelica.Mechanics.Translational.Interfaces.Flange_a axis if useAxisFlange
          "1-dim. translational flange that drives the joint" 
            annotation (Placement(transformation(extent={{90,50},{70,70}}, rotation=0)));
          Modelica.Mechanics.Translational.Interfaces.Flange_b support if useAxisFlange
          "1-dim. translational flange of the drive drive support (assumed to be fixed in the world frame, NOT in the joint)"
            annotation (Placement(transformation(extent={{-30,50},{-50,70}}, rotation=
                   0)));

          parameter Boolean useAxisFlange=false
          "= true, if axis flange is enabled" 
            annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
          "Axis of translation resolved in frame_a (= same as in frame_b)" 
            annotation (Evaluate=true);
          constant SI.Position s_offset=0
          "Relative distance offset (distance between frame_a and frame_b = s_offset + s)"
            annotation (Evaluate=false);
          parameter Types.Axis boxWidthDirection={0,1,0}
          "Vector in width direction of box, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter SI.Distance boxWidth=world.defaultJointWidth
          "Width of prismatic joint box" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance boxHeight=boxWidth
          "Height of prismatic joint box" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color boxColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
          "Color of prismatic joint box" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use distance s and v=der(s) as states"   annotation(Dialog(tab="Advanced"));
          final parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                     n)
          "Unit vector in direction of prismatic axis n";

          SI.Position s(start=0, final stateSelect=stateSelect)
          "Relative distance between frame_a and frame_b" 
            annotation (unassignedMessage="
The relative distance s of a prismatic joint cannot be determined.
Possible reasons:
- A non-zero mass might be missing on either side of the parts
  connected to the prismatic joint.
- Too many StateSelect.always are defined and the model
  has less degrees of freedom as specified with this setting
  (remove all StateSelect.always settings).
");

          SI.Velocity v(start=0,final stateSelect=stateSelect)
          "First derivative of s (relative velocity)";
          SI.Acceleration a(start=0)
          "Second derivative of s (relative acceleration)";
          SI.Force f "Actuation force in direction of joint axis";

          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-100,-50},{-30,41}},
                  pattern=LinePattern.None,
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-100,40},{-30,50}},
                  pattern=LinePattern.None,
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-30,-30},{100,20}},
                  pattern=LinePattern.None,
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-30,20},{100,30}},
                  pattern=LinePattern.None,
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Line(points={{-30,-50},{-30,50}}, color={0,0,0}),
                Line(points={{100,-30},{100,21}}, color={0,0,0}),
                Text(
                  extent={{60,12},{96,-13}},
                  lineColor={128,128,128},
                  textString="b"),
                Text(
                  extent={{-95,13},{-60,-9}},
                  lineColor={128,128,128},
                  textString="a"),
                Text(
                  visible=useAxisFlange,
                  extent={{-150,-155},{150,-95}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-150,-93},{150,-54}},
                  lineColor={0,0,0},
                  textString="n=%n"),
                Rectangle(
                  visible=useAxisFlange,
                  extent={{90,30},{100,70}},
                  pattern=LinePattern.None,
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid,
                  lineColor={0,0,255}),
                Text(
                  visible=not useAxisFlange,
                  extent={{-150,55},{150,115}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
            Documentation(info="<HTML>
<p>
Joint where frame_b is translated along axis n which is fixed in frame_a.
The two frames coincide when the relative distance \"s = 0\".
</p>

<p>
Optionally, two additional 1-dimensional mechanical flanges
(flange \"axis\" represents the driving flange and
flange \"support\" represents the bearing) can be enabled via
parameter <b>useAxisFlange</b>. The enabled axis flange can be
driven with elements of the
<a href=\"Modelica://Modelica.Mechanics.Translational\">Modelica.Mechanics.Translational</a>
library.

</p>

<p>
In the \"Advanced\" menu it can be defined via parameter <b>stateSelect</b>
that the relative distance \"s\" and its derivative shall be definitely
used as states by setting stateSelect=StateSelect.always.
Default is StateSelect.prefer to use the relative distance and its
derivative as preferred states. The states are usually selected automatically.
In certain situations, especially when closed kinematic loops are present,
it might be slightly more efficient, when using the StateSelect.always setting.
</p>

<p>
In the following figure the animation of a prismatic
joint is shown. The light blue coordinate system is
frame_a and the dark blue coordinate system is
frame_b of the joint. The black arrow is parameter
vector \"n\" defining the translation axis
(here: n = {1,1,0}).
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Joints/Prismatic.png\">
</p>

</HTML>
"));

      protected
          Visualizers.Advanced.Shape box(
            shapeType="box",
            color=boxColor,
            specularCoefficient=specularCoefficient,
            length=if noEvent(abs(s + s_offset) > 1.e-6) then s + s_offset else 1.e-6,
            width=boxWidth,
            height=boxHeight,
            lengthDirection=e,
            widthDirection=boxWidthDirection,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Translational.Components.Fixed fixed 
            annotation (Placement(transformation(extent={{-50,30},{-30,50}})));
          Translational.Interfaces.InternalSupport internalAxis(f = f) 
            annotation (Placement(transformation(extent={{70,50},{90,30}})));
          Translational.Sources.ConstantForce constantForce(f_constant=0) if not useAxisFlange 
            annotation (Placement(transformation(extent={{40,30},{60,50}})));
        equation
          v = der(s);
          a = der(v);

          // relationships between kinematic quantities of frame_a and of frame_b
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, e*(s_offset + s));
          frame_b.R = frame_a.R;

          // Force and torque balance
          zeros(3) = frame_a.f + frame_b.f;
          zeros(3) = frame_a.t + frame_b.t + cross(e*(s_offset + s), frame_b.f);

          // d'Alemberts principle
          f = -e*frame_b.f;

          // Connection to internal connectors
          s = internalAxis.s;

          connect(fixed.flange, support) annotation (Line(
              points={{-40,40},{-40,60}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(internalAxis.flange, axis)    annotation (Line(
              points={{80,40},{80,60}},
              color={0,127,0},
              smooth=Smooth.None));
          connect(constantForce.flange, internalAxis.flange)    annotation (Line(
              points={{60,40},{80,40}},
              color={0,127,0},
              smooth=Smooth.None));
        end Prismatic;

        model Revolute
        "Revolute joint (1 rotational degree-of-freedom, 2 potential states, optional axis flange)"

          import SI = Modelica.SIunits;

          Modelica.Mechanics.Rotational.Interfaces.Flange_a axis if useAxisFlange
          "1-dim. rotational flange that drives the joint" 
            annotation (Placement(transformation(extent={{10,90},{-10,110}}, rotation=
                   0)));
          Modelica.Mechanics.Rotational.Interfaces.Flange_b support if useAxisFlange
          "1-dim. rotational flange of the drive support (assumed to be fixed in the world frame, NOT in the joint)"
            annotation (Placement(transformation(extent={{-70,90},{-50,110}},
                  rotation=0)));

          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
          "Coordinate system fixed to the joint with one cut-force and cut-torque"
            annotation (Placement(transformation(extent={{-116,-16},{-84,16}},
                  rotation=0)));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_b
          "Coordinate system fixed to the joint with one cut-force and cut-torque"
            annotation (Placement(transformation(extent={{84,-16},{116,16}},
                  rotation=0)));

          parameter Boolean useAxisFlange=false
          "= true, if axis flange is enabled" 
            annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show axis as cylinder)";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={0,0,1}
          "Axis of rotation resolved in frame_a (= same as in frame_b)" 
            annotation (Evaluate=true);
          constant SI.Angle phi_offset=0
          "Relative angle offset (angle = phi_offset + phi)";
          parameter SI.Distance cylinderLength=world.defaultJointLength
          "Length of cylinder representing the joint axis" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance cylinderDiameter=world.defaultJointWidth
          "Diameter of cylinder representing the joint axis" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Modelica.Mechanics.MultiBody.Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
          "Color of cylinder representing the joint axis" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Modelica.Mechanics.MultiBody.Types.SpecularCoefficient
          specularCoefficient =                                                              world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use joint angle phi and w=der(phi) as states"   annotation(Dialog(tab="Advanced"));

          SI.Angle phi(start=0, final stateSelect=stateSelect)
          "Relative rotation angle from frame_a to frame_b" 
             annotation (unassignedMessage="
The rotation angle phi of a revolute joint cannot be determined.
Possible reasons:
- A non-zero mass might be missing on either side of the parts
  connected to the revolute joint.
- Too many StateSelect.always are defined and the model
  has less degrees of freedom as specified with this setting
  (remove all StateSelect.always settings).
");
          SI.AngularVelocity w(start=0, stateSelect=stateSelect)
          "First derivative of angle phi (relative angular velocity)";
          SI.AngularAcceleration a(start=0)
          "Second derivative of angle phi (relative angular acceleration)";
          SI.Torque tau "Driving torque in direction of axis of rotation";
          SI.Angle angle "= phi_offset + phi";
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-100,-60},{-30,60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={192,192,192}),
                Rectangle(
                  extent={{30,-60},{100,60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={192,192,192}),
                Rectangle(extent={{-100,59},{-30,-60}}, lineColor={0,0,0}),
                Rectangle(extent={{30,60},{100,-60}}, lineColor={0,0,0}),
                Text(
                  extent={{-90,14},{-54,-11}},
                  lineColor={128,128,128},
                  textString="a"),
                Text(
                  extent={{51,11},{87,-14}},
                  lineColor={128,128,128},
                  textString="b"),
                Line(
                  visible=useAxisFlange,
                  points={{-20,80},{-20,60}},
                  color={0,0,0}),
                Line(
                  visible=useAxisFlange,
                  points={{20,80},{20,60}},
                  color={0,0,0}),
                Rectangle(
                  visible=useAxisFlange,
                  extent={{-10,100},{10,50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.VerticalCylinder,
                  fillColor={192,192,192}),
                Polygon(
                  visible=useAxisFlange,
                  points={{-10,30},{10,30},{30,50},{-30,50},{-10,30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-30,11},{30,-10}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  visible=useAxisFlange,
                  points={{10,30},{30,50},{30,-50},{10,-30},{10,30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-150,-117},{150,-77}},
                  lineColor={0,0,0},
                  textString="n=%n"),
                Text(
                  visible=useAxisFlange,
                  extent={{-150,-175},{150,-115}},
                  textString="%name",
                  lineColor={0,0,255}),
                Line(
                  visible=useAxisFlange,
                  points={{-20,70},{-60,70},{-60,60}},
                  color={0,0,0},
                  smooth=Smooth.None),
                Line(
                  visible=useAxisFlange,
                  points={{20,70},{50,70},{50,60}},
                  color={0,0,0},
                  smooth=Smooth.None),
                Line(
                  visible=useAxisFlange,
                  points={{-90,100},{-30,100}},
                  color={0,0,0}),
                Line(
                  visible=useAxisFlange,
                  points={{-30,100},{-50,80}},
                  color={0,0,0}),
                Line(
                  visible=useAxisFlange,
                  points={{-49,100},{-70,80}},
                  color={0,0,0}),
                Line(
                  visible=useAxisFlange,
                  points={{-70,100},{-90,80}},
                  color={0,0,0}),
                Text(
                  visible=not useAxisFlange,
                  extent={{-150,70},{150,130}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
            Documentation(info="<html>

<p>
Joint where frame_b rotates around axis n which is fixed in frame_a.
The two frames coincide when the rotation angle \"phi = 0\".
</p>

<p>
Optionally, two additional 1-dimensional mechanical flanges
(flange \"axis\" represents the driving flange and
flange \"support\" represents the bearing) can be enabled via
parameter <b>useAxisFlange</b>. The enabled axis flange can be
driven with elements of the
<a href=\"Modelica://Modelica.Mechanics.Rotational\">Modelica.Mechanics.Rotational</a>
library.

</p>

<p>
In the \"Advanced\" menu it can be defined via parameter <b>stateSelect</b>
that the rotation angle \"phi\" and its derivative shall be definitely
used as states by setting stateSelect=StateSelect.always.
Default is StateSelect.prefer to use the joint angle and its
derivative as preferred states. The states are usually selected automatically.
In certain situations, especially when closed kinematic loops are present,
it might be slightly more efficient, when using the StateSelect.always setting.
</p>
<p>
If a <b>planar loop</b> is present, e.g., consisting of 4 revolute joints
where the joint axes are all parallel to each other, then there is no
longer a unique mathematical solution and the symbolic algorithms will
fail. Usually, an error message will be printed pointing out this
situation. In this case, one revolute joint of the loop has to be replaced
by a Joints.RevolutePlanarLoopConstraint joint. The
effect is that from the 5 constraints of a usual revolute joint,
3 constraints are removed and replaced by appropriate known
variables (e.g., the force in the direction of the axis of rotation is
treated as known with value equal to zero; for standard revolute joints,
this force is an unknown quantity).
</p>

<p>
In the following figure the animation of a revolute
joint is shown. The light blue coordinate system is
frame_a and the dark blue coordinate system is
frame_b of the joint. The black arrow is parameter
vector \"n\" defining the translation axis
(here: n = {0,0,1}, phi.start = 45<sup>o</sup>).
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Joints/Revolute.png\">
</p>

</html>
"));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
          parameter Real e[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                               n)
          "Unit vector in direction of rotation axis, resolved in frame_a (= same as in frame_b)";
          Frames.Orientation R_rel
          "Relative orientation object from frame_a to frame_b or from frame_b to frame_a";
          Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=cylinderLength,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=e,
            widthDirection={0,1,0},
            r_shape=-e*(cylinderLength/2),
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;

      protected
          Modelica.Mechanics.Rotational.Components.Fixed fixed
          "support flange is fixed to ground" 
            annotation (Placement(transformation(extent={{-70,70},{-50,90}})));
          Rotational.Interfaces.InternalSupport internalAxis(tau=tau) 
            annotation (Placement(transformation(extent={{-10,90},{10,70}})));
          Rotational.Sources.ConstantTorque constantTorque(tau_constant=0) if not useAxisFlange 
            annotation (Placement(transformation(extent={{40,70},{20,90}})));
        equation
          Connections.branch(frame_a.R, frame_b.R);

          assert(cardinality(frame_a) > 0,
            "Connector frame_a of revolute joint is not connected");
          assert(cardinality(frame_b) > 0,
            "Connector frame_b of revolute joint is not connected");

          angle = phi_offset + phi;
          w = der(phi);
          a = der(w);

          // relationships between quantities of frame_a and of frame_b
          frame_b.r_0 = frame_a.r_0;

          if rooted(frame_a.R) then
            R_rel = Frames.planarRotation(e, phi_offset + phi, w);
            frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            frame_a.f = -Frames.resolve1(R_rel, frame_b.f);
            frame_a.t = -Frames.resolve1(R_rel, frame_b.t);
          else
            R_rel = Frames.planarRotation(-e, phi_offset + phi, w);
            frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel);
            frame_b.f = -Frames.resolve1(R_rel, frame_a.f);
            frame_b.t = -Frames.resolve1(R_rel, frame_a.t);
          end if;

          // d'Alemberts principle
          tau = -frame_b.t*e;

          // Connection to internal connectors
          phi = internalAxis.phi;

          connect(fixed.flange, support) annotation (Line(
              points={{-60,80},{-60,100}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(internalAxis.flange, axis) annotation (Line(
              points={{0,80},{0,100}},
              color={0,0,0},
              smooth=Smooth.None));
          connect(constantTorque.flange, internalAxis.flange) annotation (Line(
              points={{20,80},{0,80}},
              color={0,0,0},
              smooth=Smooth.None));
        end Revolute;

        model FreeMotion
        "Free motion joint (6 degrees-of-freedom, 12 potential states)"

          import Modelica.Math.*;
          import SI = Modelica.SIunits;

          extends Interfaces.PartialTwoFrames;

          parameter Boolean animation=true
          "= true, if animation shall be enabled (show arrow from frame_a to frame_b)";

          SI.Position r_rel_a[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.prefer)
          "Position vector from origin of frame_a to origin of frame_b, resolved in frame_a"
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_rel_a[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.prefer)
          "= der(r_rel_a), i.e., velocity of origin of frame_b with respect to origin of frame_a, resolved in frame_a"
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_rel_a[3](start={0,0,0}) "= der(v_rel_a)" 
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(group="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b"
            annotation (Dialog(group="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time"
            annotation (Evaluate=true, Dialog(group="Initialization"));

          parameter Boolean w_rel_a_fixed = false
          "= true, if w_rel_a_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(group="Initialization"));
          parameter SI.AngularVelocity w_rel_a_start[3]={0,0,0}
          "Initial values of angular velocity of frame_b with respect to frame_a, resolved in frame_a"
            annotation (Dialog(group="Initialization"));

          parameter Boolean z_rel_a_fixed = false
          "= true, if z_rel_a_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(group="Initialization"));
          parameter SI.AngularAcceleration z_rel_a_start[3]={0,0,0}
          "Initial values of angular acceleration z_rel_a = der(w_rel_a)" 
            annotation (Dialog(group="Initialization"));

          parameter SI.Length arrowDiameter=world.defaultArrowDiameter
          "Diameter of arrow from frame_a to frame_b" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color arrowColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
          "Color of arrow" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Boolean enforceStates=true
          " = true, if relative variables between frame_a and frame_b shall be used as states"
            annotation (Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as states otherwise use 3 angles as states"
            annotation (Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate frame_a into frame_b around the 3 angles used as states"
             annotation (Evaluate=true, Dialog(tab="Advanced", enable=not 
                  useQuaternions));

          final parameter Frames.Orientation R_rel_start=
              Modelica.Mechanics.MultiBody.Frames.axesRotations(sequence_start, angles_start,zeros(3))
          "Orientation object from frame_a to frame_b at initial time";

          annotation (
            Documentation(info="<HTML>
<p>
Joint which does not constrain the motion between frame_a and frame_b.
Such a joint is only meaningful if the <b>relative</b> distance and orientation
between frame_a and frame_b, and their derivatives, shall be used
as <b>states</b>.
</p>
<p>
Note, that <b>bodies</b> such as Parts.Body, Parts.BodyShape,
have potential states describing the distance
and orientation, and their derivatives, between the <b>world frame</b> and
a <b>body fixed frame</b>.
Therefore, if these potential state variables are suited,
a FreeMotion joint is not needed.
</p>
The states of the FreeMotion object are:
</p>
<ul>
<li> The <b>relative position vector</b> r_rel_a from the origin of
     frame_a to the origin of frame_b, resolved in
     frame_a and the <b>relative velocity</b> v_rel_a of the origin of
     frame_b with respect to the origin of frame_a, resolved in frame_a
     (= der(r_rel_a)).</li>
</li>
<li> If parameter <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>true</b> (this is the default), then <b>4 quaternions</b>
     are states. Additionally, the coordinates of the
     relative angular velocity vector are 3 potential states.<br>
     If <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>false</b>, then <b>3 angles</b> and the derivatives of
     these angles are potential states. The orientation of frame_b
     is computed by rotating frame_a along the axes defined
     in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
     the Cardan angle sequence) around the angles used as states.
     For example, the default is to rotate the x-axis of frame_a
     around angles[1], the new y-axis around angles[2] and the new z-axis
     around angles[3], arriving at frame_b.
 </li>
</ul>
<p>
The quaternions have the slight disadvantage that there is a
non-linear constraint equation between the 4 quaternions.
Therefore, at least one non-linear equation has to be solved
during simulation. A tool might, however, analytically solve this
simple constraint equation. Using the 3 angles as states has the
disadvantage that there is a singular configuration in which a
division by zero will occur. If it is possible to determine in advance
for an application class that this singular configuration is outside
of the operating region, the 3 angles might be used as
states by setting <b>useQuaternions</b> = <b>false</b>.
</p>
<p>
In text books about 3-dimensional mechanics often 3 angles and the
angular velocity are used as states. This is not the case here, since
3 angles and their derivatives are used as states
(if useQuaternions = false). The reason
is that for real-time simulation the discretization formula of the
integrator might be \"inlined\" and solved together with the model equations.
By appropriate symbolic transformation the performance is
drastically increased if angles and their
derivatives are used as states, instead of angles and the angular
velocity.
</p>
<p>
If parameter
<b>enforceStates</b> is set to <b>true</b> (= the default)
in the \"Advanced\" menu,
then FreeMotion variables are forced to be used as states according
to the setting of parameters \"useQuaternions\" and
\"sequence_angleStates\".
</p>
<p>
In the following figure the animation of a FreeMotion
joint is shown. The light blue coordinate system is
frame_a and the dark blue coordinate system is
frame_b of the joint.
(here: r_rel_a_start = {0.5, 0, 0.5}, angles_start = {45, 45, 45}<sup>o</sup>).
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Joints/FreeMotion.png\">
</p>
</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(
                  points={{-86,31},{-74,61},{-49,83},{-17,92},{19,88},{40,69},{59,48}},
                  color={160,160,164},
                  thickness=0.5),
                Polygon(
                  points={{90,0},{50,20},{50,-20},{90,0}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{69,58},{49,40},{77,28},{69,58}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{136,-35},{-150,-98}},
                  lineColor={0,0,255},
                  textString="%name"),
                Rectangle(
                  extent={{-70,-5},{-90,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{50,-5},{30,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{11,-5},{-9,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-30,-5},{-50,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(
                  points={{-86,31},{-74,61},{-49,83},{-17,92},{19,88},{40,69},{59,48}},
                  color={160,160,164},
                  thickness=0.5),
                Polygon(
                  points={{90,0},{50,20},{50,-20},{90,0}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{69,58},{49,40},{77,28},{69,58}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{50,-5},{30,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{11,-5},{-9,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-30,-5},{-50,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-70,-5},{-90,5}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid)}));

      protected
          Visualizers.Advanced.Arrow arrow(
            r_head=r_rel_a,
            diameter=arrowDiameter,
            color=arrowColor,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;

          // Declarations for quaternions (dummies, if quaternions are not used)
          parameter Frames.Quaternions.Orientation Q_start=Frames.to_Q(R_rel_start)
          "Quaternion orientation object from frame_a to frame_b at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, each stateSelect=if 
                enforceStates then (if useQuaternions then StateSelect.prefer else 
                StateSelect.never) else StateSelect.default)
          "Quaternion orientation object from frame_a to frame_b (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
                    Frames.axesRotationsAngles(R_rel_start,
              sequence_angleStates) "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.prefer)
          "Dummy or 3 angles to rotate frame_a into frame_b";
          SI.AngularVelocity phi_d[3](each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.prefer) "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";

          // Other declarations
          SI.AngularVelocity w_rel_b[3](start=Frames.resolve2(R_rel_start, w_rel_a_start),
                                        fixed=fill(w_rel_a_fixed,3),
                                        each stateSelect=if enforceStates then 
                                        (if useQuaternions then StateSelect.always else 
                                        StateSelect.avoid) else StateSelect.prefer)
          "Dummy or relative angular velocity of frame_b with respect to frame_a, resolved in frame_b";
          Frames.Orientation R_rel
          "Dummy or relative orientation object to rotate from frame_a to frame_b";
          Frames.Orientation R_rel_inv
          "Dummy or relative orientation object to rotate from frame_b to frame_a";

        initial equation
          if angles_fixed then
            // Initialize positional variables
            if not enforceStates then
              // no states defined
              zeros(3) = Frames.Orientation.equalityConstraint(Frames.absoluteRotation(frame_a.R,R_rel_start),frame_b.R);
            elseif useQuaternions then
              // Quaternions Q are used as states
              zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
            else
              // The 3 angles 'phi' are used as states
              phi = phi_start;
            end if;
          end if;

          if z_rel_a_fixed then
            // Initialize acceleration variables
            der(w_rel_b) = Frames.resolve2(R_rel_start, z_rel_a_start);
          end if;

        equation
          // Kinematic differential equations for translational motion
          der(r_rel_a) = v_rel_a;
          der(v_rel_a) = a_rel_a;

          // Kinematic relationships
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r_rel_a);

          // Cut-forces and cut-torques are zero
          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
          frame_b.f = zeros(3);
          frame_b.t = zeros(3);

          if enforceStates then
            Connections.branch(frame_a.R, frame_b.R);

            if rooted(frame_a.R) then
              R_rel_inv = Frames.nullRotation();
              frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            else
              R_rel_inv = Frames.inverseRotation(R_rel);
              frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel_inv);
            end if;

            // Compute relative orientation object
            if useQuaternions then
              // Use Quaternions as states (with dynamic state selection)
              {0} = Frames.Quaternions.orientationConstraint(Q);
              w_rel_b = Frames.Quaternions.angularVelocity2(Q, der(Q));
              R_rel = Frames.from_Q(Q, w_rel_b);

              // Dummies
              phi = zeros(3);
              phi_d = zeros(3);
              phi_dd = zeros(3);

            else
              // Use angles as states
              phi_d = der(phi);
              phi_dd = der(phi_d);
              R_rel = Frames.axesRotations(sequence_angleStates, phi, phi_d);
              w_rel_b = Frames.angularVelocity2(R_rel);

              // Dummies
              Q = zeros(4);
            end if;

          else
            // Free motion joint does not have states
            if w_rel_a_fixed or z_rel_a_fixed then
              w_rel_b = Frames.angularVelocity2(frame_b.R) - Frames.resolve2(frame_b.
                R, Frames.angularVelocity1(frame_a.R));
            else
              // dummy
              w_rel_b = zeros(3);
            end if;

            // Dummies
            R_rel = Frames.nullRotation();
            R_rel_inv = Frames.nullRotation();
            Q = zeros(4);
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          end if;
        end FreeMotion;

          model RollingWheel
        "Joint (no mass, no inertia) that describes an ideal rolling wheel (rolling on the plane z=0)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Frames;
            annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics={
                  Rectangle(
                    extent={{-100,-80},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-154,124},{146,84}},
                    lineColor={0,0,255},
                    textString="%name"),
                  Ellipse(
                    extent={{-80,80},{80,-80}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid)}));

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
          "Frame fixed in wheel center point. x-Axis: upwards, y-axis: along wheel axis"
              annotation (Placement(transformation(extent={{-16,-16},{16,16}})));

            parameter SI.Radius wheelRadius "Wheel radius";
            parameter StateSelect stateSelect=StateSelect.always
          "Priority to use generalized coordinates as states"     annotation(HideResult=true,Evaluate=true);

            SI.Position x(start=0, stateSelect=stateSelect)
          "x-coordinate of wheel axis";

            SI.Position y(start=0, stateSelect=stateSelect)
          "y-coordinate of wheel axis";
            SI.Position z;

            SI.Angle angles[3](start={0,0,0}, each stateSelect=stateSelect) "Angles to rotate world-frame in to frame_a around z-, y-, x-axis" annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));

            SI.AngularVelocity der_angles[3](start={0,0,0}, each stateSelect=stateSelect)
          "Derivative of angles" 
              annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));

             SI.Position r_road_0[3]
          "Position vector from world frame to contact point on road, resolved in world frame";

            // Contact force
            SI.Force f_wheel_0[3]
          "Contact force acting on wheel, resolved in world frame";
            SI.Force f_n "Contact force acting on wheel in normal direction";
            SI.Force f_lat "Contact force acting on wheel in lateral direction";
            SI.Force f_long
          "Contact force acting on wheel in longitudinal direction";
            SI.Position err
          "|r_road_0 - frame_a.r_0| - wheelRadius (must be zero; used for checking)";
      protected
             Real e_axis_0[3]
          "Unit vector along wheel axis, resolved in world frame";
             SI.Position delta_0[3](start={0,0,-wheelRadius})
          "Distance vector from wheel center to contact point";

             // Coordinate system at contact point
             Real e_n_0[3]
          "Unit vector in normal direction of road at contact point, resolved in world frame";
             Real e_lat_0[3]
          "Unit vector in lateral direction of wheel at contact point, resolved in world frame";
             Real e_long_0[3]
          "Unit vector in longitudinal direction of wheel at contact point, resolved in world frame";

             // Road description
             SI.Position s "Road surface parameter 1";
             SI.Position w "Road surface parameter 2";
             Real e_s_0[3]
          "Road heading at (s,w), resolved in world frame (unit vector)";

             // Slip velocities
             SI.Velocity v_0[3]
          "Velocity of wheel center, resolved in world frame";
             SI.AngularVelocity w_0[3]
          "Angular velocity of wheel, resolved in world frame";

             SI.Velocity vContact_0[3]
          "Velocity of wheel contact point, resolved in world frame";

             // Utility vectors
             Real aux[3];

          equation
             // frame_a.R is computed from generalized coordinates
             Connections.root(frame_a.R);
             frame_a.r_0 = {x,y,z};
             der_angles  = der(angles);
             frame_a.R = Frames.axesRotations({3,2,1}, angles, der_angles);

             // Road description
             r_road_0 = {s,w,0};
             e_n_0    = {0,0,1};
             e_s_0    = {1,0,0};

             // Coordinate system at contact point (e_long_0, e_lat_0, e_n_0)
             e_axis_0  = Frames.resolve1(frame_a.R, {0,1,0});
             aux       = cross(e_n_0, e_axis_0);
             e_long_0 = aux / Modelica.Math.Vectors.length(aux);
             e_lat_0  = cross(e_long_0, e_n_0);

             // Determine point on road where the wheel is in contact with the road
             delta_0 = r_road_0 - frame_a.r_0;
             0 = delta_0*e_axis_0;
             0 = delta_0*e_long_0;

             // One holonomic positional constraint equation (no penetration in to the ground)
             0 = wheelRadius - delta_0*cross(e_long_0, e_axis_0);

             // only for testing
             err = Modelica.Math.Vectors.length(delta_0) - wheelRadius;

             // Slip velocities
             v_0 = der(frame_a.r_0);
             w_0 = Frames.angularVelocity1(frame_a.R);
             vContact_0 = v_0 + cross(w_0, delta_0);

             // Two non-holonomic constraint equations on velocity level (ideal rolling, no slippage)
             0 = vContact_0*e_long_0;
             0 = vContact_0*e_lat_0;

             // Contact force
             f_wheel_0 = f_n*e_n_0 + f_lat*e_lat_0 + f_long*e_long_0;

             // Force and torque balance at the wheel center
             zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_wheel_0);
             zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(delta_0, f_wheel_0));

             // Guard against singularity
             assert(abs(e_n_0*e_axis_0) < 0.99, "Wheel lays nearly on the ground (which is a singularity)");
          end RollingWheel;

          model RollingWheelSet
        "Joint (no mass, no inertia) that describes an ideal rolling wheel set (two ideal rolling wheels connected together by an axis)"
            import SI = Modelica.SIunits;
           Modelica.Mechanics.MultiBody.Interfaces.Frame_a frameMiddle
          "Frame fixed in middle of axis connecting both wheels (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{-16,16},{16,-16}}),
                  iconTransformation(extent={{-16,-16},{16,16}})));

            parameter Boolean animation=true
          "= true, if animation of wheel set shall be enabled";

            parameter SI.Radius wheelRadius "Radius of one wheel";
            parameter SI.Distance wheelDistance
          "Distance between the two wheels";

            parameter StateSelect stateSelect = StateSelect.default
          "Priority to use the generalized coordinates as states";

            Modelica.SIunits.Position x(start=0, stateSelect=stateSelect)
          "x coordinate for center between wheels";
            Modelica.SIunits.Position y(start=0, stateSelect=stateSelect)
          "y coordinate for center between wheels";
            Modelica.SIunits.Angle phi(start=0, stateSelect=stateSelect)
          "Orientation angle of wheel axis along z-axis";
            Modelica.SIunits.Angle theta1(start=0, stateSelect=stateSelect)
          "Angle of wheel 1";
            Modelica.SIunits.Angle theta2(start=0, stateSelect=stateSelect)
          "Angle of wheel 2";
            Modelica.SIunits.AngularVelocity der_theta1(start=0, stateSelect=stateSelect)
          "Derivative of theta 1";
            Modelica.SIunits.AngularVelocity der_theta2(start=0, stateSelect=stateSelect)
          "Derivative of theta 2";

            annotation (defaultComponentName="wheelSet",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics={
                  Rectangle(
                    extent={{-100,-80},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-146,-98},{154,-138}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Ellipse(
                    extent={{42,80},{118,-80}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-62,2},{64,-6}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{-118,80},{-42,-80}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{86,24},{64,24},{64,10},{56,10}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{86,-24},{64,-24},{64,-12},{56,-12}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{-96,100},{-80,100},{-80,4}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{100,100},{80,100},{80,-2}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{0,72},{0,40},{-20,40},{-20,2}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{0,40},{20,40},{20,2}},
                    color={0,0,0},
                    smooth=Smooth.None)}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}), graphics={
                  Line(
                    points={{-68,24},{-68,52}},
                    color={0,0,255},
                    smooth=Smooth.None),
                  Polygon(
                    points={{-68,70},{-74,52},{-62,52},{-68,70}},
                    lineColor={0,0,255},
                    smooth=Smooth.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-56,62},{-38,50}},
                    lineColor={0,0,255},
                    textString="x"),
                  Line(
                    points={{-62,30},{-94,30}},
                    color={0,0,255},
                    smooth=Smooth.None),
                  Polygon(
                    points={{-90,36},{-90,24},{-108,30},{-90,36}},
                    lineColor={0,0,255},
                    smooth=Smooth.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-114,50},{-96,38}},
                    lineColor={0,0,255},
                    textString="y")}));

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
          "Frame fixed in center point of left wheel (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{-96,16},{-64,-16}}),
                  iconTransformation(extent={{-96,16},{-64,-16}})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame2
          "Frame fixed in center point of right wheel (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{64,16},{96,-16}})));
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed(                 r={0,0,
                  wheelRadius}, animation=animation) 
                                annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={0,-90})));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod1(                 r={
                  0,wheelDistance/2,0}, animation=animation) 
              annotation (Placement(transformation(extent={{-8,-10},{-28,10}})));
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic1(animation=
                  animation)                   annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={0,-66})));
            Modelica.Mechanics.MultiBody.Joints.Prismatic prismatic2(
              n={0,1,0}, animation=animation)  annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=180,
                  origin={-24,-50})));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute(animation=animation) 
                                               annotation (Placement(transformation(
                  extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={0,-22})));
            Modelica.Mechanics.MultiBody.Parts.FixedTranslation rod2(                 r={
                  0,-wheelDistance/2,0}, animation=animation) 
              annotation (Placement(transformation(extent={{12,-10},{32,10}})));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(
              n={0,1,0},
              useAxisFlange=true,
              animation=animation) 
              annotation (Placement(transformation(extent={{-34,-10},{-54,10}})));
            Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(
              n={0,1,0},
              useAxisFlange=true,
              animation=animation) 
              annotation (Placement(transformation(extent={{40,-10},{60,10}})));

          Modelica.Mechanics.MultiBody.Joints.Internal.RollingConstraintVerticalWheel
          rolling1(                               radius=wheelRadius) 
              annotation (Placement(transformation(extent={{-70,-60},{-50,-40}})));

          Modelica.Mechanics.MultiBody.Joints.Internal.RollingConstraintVerticalWheel
          rolling2(                               radius=wheelRadius,
                lateralSlidingConstraint=false) 
              annotation (Placement(transformation(extent={{54,-60},{74,-40}})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1
          "1-dim. rotational flange that drives the joint" 
              annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2
          "1-dim. rotational flange that drives the joint" 
              annotation (Placement(transformation(extent={{90,90},{110,110}})));
            Modelica.Mechanics.MultiBody.Parts.Mounting1D mounting1D 
              annotation (Placement(transformation(extent={{-10,38},{10,58}})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b support
          "Support of 1D axes"     annotation (Placement(transformation(extent={{-10,
                      70},{10,90}}), iconTransformation(extent={{-10,70},{10,90}})));
          equation
            prismatic1.s  = x;
            prismatic2.s  = y;
            revolute.phi  = phi;
            revolute1.phi = theta1;
            revolute2.phi = theta2;
            der_theta1 = der(theta1);
            der_theta2 = der(theta2);

            connect(revolute.frame_b, frameMiddle) annotation (Line(
                points={{6.12323e-016,-12},{0,-12},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rod1.frame_a, frameMiddle) annotation (Line(
                points={{-8,0},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rod2.frame_a, frameMiddle) annotation (Line(
                points={{12,0},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rod1.frame_b, revolute1.frame_a) annotation (Line(
                points={{-28,0},{-34,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(revolute1.frame_b, frame1) annotation (Line(
                points={{-54,0},{-80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(revolute2.frame_a, rod2.frame_b) annotation (Line(
                points={{40,0},{32,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(revolute2.frame_b, frame2) annotation (Line(
                points={{60,0},{80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(prismatic1.frame_a, fixed.frame_b) annotation (Line(
                points={{-6.12323e-016,-76},{6.12323e-016,-76},{6.12323e-016,-80}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(prismatic1.frame_b, prismatic2.frame_a) annotation (Line(
                points={{6.12323e-016,-56},{6.12323e-016,-50},{-14,-50}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(prismatic2.frame_b, revolute.frame_a) annotation (Line(
                points={{-34,-50},{-40,-50},{-40,-36},{-6.12323e-016,-36},{
                    -6.12323e-016,-32}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rolling1.frame_a, revolute1.frame_b) annotation (Line(
                points={{-60,-48},{-60,0},{-54,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rolling2.frame_a, revolute2.frame_b) annotation (Line(
                points={{64,-48},{64,0},{60,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(revolute1.axis, axis1) annotation (Line(
                points={{-44,10},{-44,100},{-100,100}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(revolute2.axis, axis2) annotation (Line(
                points={{50,10},{50,100},{100,100}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(frameMiddle, mounting1D.frame_a) annotation (Line(
                points={{0,0},{0,38}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(mounting1D.flange_b, support) annotation (Line(
                points={{10,48},{16,48},{16,80},{0,80}},
                color={0,0,0},
                smooth=Smooth.None));
          end RollingWheelSet;

        package Assemblies "Joint aggregations for analytic loop handling"
          import SI = Modelica.SIunits;
          extends Modelica.Icons.Library;
          annotation ( Documentation(info="<HTML>
<p>
The joints in this package are mainly designed to be used
in <b>kinematic loop</b> structures. Every component consists of
<b>3 elementary joints</b>. These joints are combined in such a
way that the kinematics of the 3 joints between frame_a and
frame_b are computed from the movement of frame_a and frame_b,
i.e., there are <b>no constraints</b> between frame_a and frame_b.
This requires to solve a <b>non-linear system of equations</b> which
is performed <b>analytically</b> (i.e., when a mathematical
solution exists, it is computed efficiently and reliably).
A detailed description how to use these joints is provided in
<a href=\"Modelica://Modelica.Mechanics.MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling\">MultiBody.UsersGuide.Tutorial.LoopStructures.AnalyticLoopHandling</a>.
</p>
<p>
The assembly joints in this package are named <b>JointXYZ</b> where
<b>XYZ</b> are the first letters of the elementary joints used in the
component, in particular:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><b>P</b></td><td valign=\"top\">Prismatic joint</td></tr>
  <tr><td valign=\"top\"><b>R</b></td><td valign=\"top\">Revolute joint</td></tr>
  <tr><td valign=\"top\"><b>S</b></td><td valign=\"top\">Spherical joint</td></tr>
  <tr><td valign=\"top\"><b>U</b></td><td valign=\"top\">Universal joint</td></tr>
</table>
<p>
For example, JointUSR is an assembly joint consisting
of a universal, a spherical and a revolute joint.
</p>
<p> This package contains the following models:
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS\">JointUPS</a></td>
      <td valign=\"top\"> Universal - prismatic - spherical joint aggregation<br>
     <img src=\"../Images/MultiBody/Joints/JointUPS.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUSR\">JointUSR</a></td>
      <td valign=\"top\"> Universal - spherical - revolute joint aggregation<br>
     <img src=\"../Images/MultiBody/Joints/JointUSR.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUSP\">JointUSP</a></td>
      <td valign=\"top\"> Universal - spherical - prismatic joint aggregation<br>
     <img src=\"../Images/MultiBody/Joints/JointUSP.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointSSR\">JointSSR</a></td>
      <td valign=\"top\"> Spherical - spherical - revolute joint aggregation
           with an optional mass point at the rod connecting
           the two spherical joints<br>
     <img src=\"../Images/MultiBody/Joints/JointSSR.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointSSP\">JointSSP</a></td>
      <td valign=\"top\"> Spherical - spherical - prismatic joint aggregation
           with an optional mass point at the rod connecting
           the two spherical joints<br>
     <img src=\"../Images/MultiBody/Joints/JointSSP.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointRRR\">JointRRR</a></td>
      <td valign=\"top\"> Revolute - revolute - revolute joint aggregation for planar loops<br>
     <img src=\"../Images/MultiBody/Joints/JointRRR.png\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Joints.Assemblies.JointRRP\">JointRRP</a></td>
      <td valign=\"top\"> Revolute - revolute - prismatic joint aggregation for planar loops<br>
     <img src=\"../Images/MultiBody/Joints/JointRRP.png\">
      </td>
  </tr>
</table>
<p>
Note, no component of this package has potential states, since the
components are designed in such a way that the generalized coordinates
of the used elementary joints are computed from the frame_a and frame_b
coordinates. Still, it is possible to use the components in a
tree structure. In this case states are selected from bodies that are
connected to the frame_a or frame_b side of the component.
In most cases this gives a less efficient solution, as if elementary
joints of package Modelica.Mechanics.MultiBody.Joints would be used directly.
</p>
<p>
The analytic handling of kinematic loops by using joint aggregations
with 6 degrees of freedom as provided in this package, is a <b>new</b>
methodology. It is based on a more general method for solving
non-linear equations of kinematic loops developed by Woernle and
Hiller. An automatic application of this more general method
is difficult, and a manual application is only suited for
specialists in this field. The method introduced here is a
compromize: It can be quite easily applied by an end user, but
for a smaller class of kinematic loops. The method of the \"characteristic
pair of joints\" from Woernle and Hiller is described in:
</p>
<dl>
<dt>Woernle C.:</dt>
<dd><b>Ein systematisches Verfahren zur Aufstellung der geometrischen
    Schliessbedingungen in kinematischen Schleifen mit Anwendung
    bei der R&uuml;ckw&auml;rtstransformation f&uuml;r
    Industrieroboter.</b><br>
    Fortschritt-Berichte VDI, Reihe 18, Nr. 59, Duesseldorf: VDI-Verlag 1988,
    ISBN 3-18-145918-6.<br>&nbsp;</dd>
<dt>Hiller M., and Woernle C.:</dt
<dd><b>A Systematic Approach for Solving the Inverse Kinematic
    Problem of Robot Manipulators</b>.<br>
    Proceedings 7th World Congress Th. Mach. Mech., Sevilla 1987. </dd>
</dl>
</HTML>"));

          model JointUPS
          "Universal - prismatic - spherical joint aggregation (no constraints, no potential states)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            extends Interfaces.PartialTwoFramesDoubleSize;
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_ia
            "Coordinate system at origin of frame_a fixed at prismatic joint" 
              annotation (Placement(transformation(
                  origin={-80,100},
                  extent={{-8,-8},{8,8}},
                  rotation=270)));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame_ib
            "Coordinate system at origin of frame_b fixed at prismatic joint" 
              annotation (Placement(transformation(
                  origin={80,100},
                  extent={{-8,8},{8,-8}},
                  rotation=270)));
            Modelica.Mechanics.Translational.Interfaces.Flange_a axis
            "1-dim. translational flange that drives the prismatic joint" 
              annotation (Placement(transformation(extent={{45,95},{35,105}},
                    rotation=0)));
            Modelica.Mechanics.Translational.Interfaces.Flange_b bearing
            "1-dim. translational flange of the drive bearing of the prismatic joint"
              annotation (Placement(transformation(extent={{-35,95},{-45,105}},
                    rotation=0)));

            parameter Boolean animation=true
            "= true, if animation shall be enabled";
            parameter Boolean showUniversalAxes=true
            " = true, if universal joint shall be visualized with two cylinders, otherwise with a sphere (provided animation=true)";
            parameter Modelica.Mechanics.MultiBody.Types.Axis n1_a={0,0,1}
            "Axis 1 of universal joint resolved in frame_a (axis 2 is orthogonal to axis 1 and to line from universal to spherical joint)"
              annotation (Evaluate=true);
            parameter SI.Position nAxis_ia[3]={1,0,0}
            "Axis vector along line from origin of frame_a to origin of frame_b, resolved in frame_ia"
              annotation (Evaluate=true);
            parameter SI.Position s_offset=0
            "Relative distance offset (distance between frame_a and frame_b = s(t) + s_offset)";
            parameter SI.Diameter sphereDiameter=world.defaultJointLength
            "Diameter of spheres representing the spherical joints" 
              annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
            input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
            "Color of spheres representing the spherical joints" 
              annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
            parameter SI.Diameter axisDiameter=sphereDiameter/Types.Defaults.
                JointRodDiameterFraction
            "Diameter of cylinder on the connecting line from frame_a to frame_b"
              annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
            input Types.Color axisColor=Modelica.Mechanics.MultiBody.Types.Defaults.SensorColor
            "Color of cylinder on the connecting line from frame_a to frame_b" 
              annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Reflection of ambient light (= 0: light is completely absorbed)" 
              annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
            parameter SI.Distance cylinderLength=world.defaultJointLength
            "Length of cylinders representing the two universal joint axes"   annotation (
               Dialog(tab="Animation", group="if animation = true and showUniversalAxes",
                      enable=animation and showUniversalAxes));
            parameter SI.Distance cylinderDiameter=world.defaultJointWidth
            "Diameter of cylinders representing the two universal joint axes" 
              annotation (Dialog(tab="Animation", group=
                    "if animation = true and showUniversalAxes",
                      enable=animation and showUniversalAxes));
           input Types.Color cylinderColor=Modelica.Mechanics.MultiBody.Types.Defaults.JointColor
            "Color of cylinders representing the two universal joint axes"   annotation (
                Dialog(tab="Animation", group="if animation = true and showUniversalAxes",
                      enable=animation and showUniversalAxes));

            parameter Boolean checkTotalPower=false
            "= true, if total power flowing into this component shall be determined (must be zero)"
              annotation (Dialog(tab="Advanced"));
            final parameter Real eAxis_ia[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                              nAxis_ia)
            "Unit vector from origin of frame_a to origin of frame_b, resolved in frame_ia";
            final parameter Real e2_ia[3](each final unit="1")=Modelica.Math.Vectors.normalize(
                                                           cross(n1_a, eAxis_ia))
            "Unit vector in direction of second rotation axis of universal joint, resolved in frame_ia";
            final parameter Real e3_ia[3](each final unit="1")=cross(eAxis_ia, e2_ia)
            "Unit vector perpendicular to eAxis_ia and e2_ia, resolved in frame_ia";
            SI.Position s
            "Relative distance between frame_a and frame_b along axis nAxis = s + s_offset";
            SI.Force f "= axis.f (driving force in the axis; = -bearing.f)";
            SI.Length axisLength "Distance between frame_a and frame_b";
            SI.Power totalPower
            "Total power flowing into this element, if checkTotalPower=true (otherwise dummy)";
            annotation (
              Documentation(info="<html>
<p>
This component consists of a <b>universal</b> joint at frame_a,
a <b>spherical</b> joint at frame_b and a <b>prismatic</b> joint along the
line connecting the origin of frame_a and the origin of frame_b,
see the default animation in the following figure (the axes vectors
are not part of the default animation):
</p>
<p align=\"center\">
<IMG SRC=\"../Images/MultiBody/Joints/JointUPS.png\" ALT=\"model Joints.Assemblies.JointUPS\">
</p>
<p>
This joint aggregation has no mass and no inertia and
introduces neither constraints nor potential state variables.
It is especially useful to build up more complicated force elements
where the mass and/or inertia of the force element shall be taken
into account.
</p>
<p>
The universal joint is defined in the following way:
<p>
<ul>
<li> The rotation <b>axis</b> of revolute joint <b>1</b> is along parameter
     vector n1_a which is fixed in frame_a.<li>
<li> The rotation <b>axis</b> of revolute joint <b>2</b> is perpendicular to
     axis 1 and to the line connecting the universal and the spherical joint.
</ul>
<p>
The definition of axis 2 of the universal joint is performed according
to the most often occuring case. In a future release, axis 2 might
be explicitly definable via a parameter. However, the treatment is much more
complicated and the number of operations is considerably higher,
if axis 2 is not orthogonal to axis 1 and to the connecting rod.
</p>
<p>
Note, there is a <b>singularity</b> when axis 1 and the connecting line are parallel
to each other. Therefore, if possible n1_a should be selected in such a way that it
is perpendicular to nAxis_ia in the initial configuration (i.e., the
distance to the singularity is as large as possible).
</p>
<p>
An additional <b>frame_ia</b> is present. It is <b>fixed</b> on the line
connecting the universal and the spherical joint at the
origin of <b>frame_a</b>. The placement of frame_ia on this line
is implicitly defined by the universal joint (frame_a and frame_ia coincide
when the angles of the two revolute joints of the universal joint are zero)
and by parameter vector <b>nAxis_ia</b>, an axis vector directed
along the line from the origin of frame_a to the spherical joint,
resolved in frame_<b>ia</b>.
</p
<p>
An additional <b>frame_ib</b> is present. It is <b>fixed</b> in the line
connecting the prismatic and the spherical joint at the
origin of <b>frame_b</b>.
It is always parallel to <b>frame_ia</b>.
</p>
<p>
Note, this joint aggregation can be used in cases where
in reality a rod with spherical joints at each end are present.
Such a system has an additional degree of freedom to rotate
the rod along its axis. In practice this rotation is usually
of no interested and is mathematically removed by replacing one
of the spherical joints by a universal joint.
</p>
<p>
The easiest way to define the parameters of this joint is by moving the
MultiBody system in a <b>reference configuration</b> where <b>all frames</b>
of all components are <b>parallel</b> to each other (alternatively,
at least frame_a, frame_ia and frame_ib of the JointUSP joint
should be parallel to each other when defining an instance of this
component).
</p>
</html> "),   Icon(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={1,1},
                  initialScale=0.2), graphics={
                  Text(
                    extent={{-140,-50},{140,-75}},
                    lineColor={0,0,255},
                    textString="%name"),
                  Ellipse(
                    extent={{-100,-40},{-19,40}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{-90,-30},{-29,29}},
                    lineColor={160,160,164},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-60,41},{-9,-44}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-60,40},{-60,-40}},
                    color={0,0,0},
                    thickness=0.5),
                  Ellipse(
                    extent={{-83,-17},{-34,21}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{-74,-12},{-40,15}},
                    lineColor={160,160,164},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-72,-20},{-89,3},{-69,25},{-45,27},{-72,-20}},
                    pattern=LinePattern.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Line(
                    points={{-60,40},{-60,-10}},
                    color={0,0,0},
                    thickness=0.5),
                  Line(
                    points={{-49,20},{-69,-15}},
                    color={0,0,0},
                    thickness=0.5),
                  Ellipse(
                    extent={{44,14},{73,-14}},
                    lineColor={0,0,0},
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{20,-40},{100,40}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{30,-30},{90,30}},
                    lineColor={192,192,192},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-22,45},{40,-43}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{45,14},{74,-14}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Text(
                    extent={{-98,84},{-60,65}},
                    lineColor={128,128,128},
                    textString="ia"),
                  Line(
                    points={{-40,0},{-40,90},{-80,90},{-80,97}},
                    color={95,95,95},
                    thickness=0.5),
                  Text(
                    extent={{61,86},{109,64}},
                    lineColor={128,128,128},
                    textString="ib"),
                  Rectangle(
                    extent={{-35,-13},{-6,14}},
                    pattern=LinePattern.None,
                    fillColor={192,192,192},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-35,14},{-6,18}},
                    pattern=LinePattern.None,
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-6,-7},{46,6}},
                    pattern=LinePattern.None,
                    fillColor={192,192,192},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-6,6},{46,10}},
                    pattern=LinePattern.None,
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Line(points={{-6,-13},{-6,18}}, color={0,0,0}),
                  Line(
                    points={{60,-1},{60,90},{80,90},{80,97}},
                    color={95,95,95},
                    thickness=0.5),
                  Line(
                    points={{60,90},{40,90},{40,95}},
                    color={95,95,95},
                    thickness=0.5),
                  Line(points={{-30,70},{10,70}}, color={0,0,0}),
                  Polygon(
                    points={{30,70},{10,76},{10,63},{30,70}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-40,90},{-40,90},{-40,95}},
                    color={95,95,95},
                    thickness=0.5)}),
              Diagram(coordinateSystem(
                  preserveAspectRatio=true,
                  extent={{-100,-100},{100,100}},
                  grid={1,1},
                  initialScale=0.2), graphics={
                  Line(points={{-60,-70},{46,-70}}, color={0,0,255}),
                  Polygon(
                    points={{60,-70},{45,-64},{45,-76},{60,-70}},
                    lineColor={0,0,255},
                    fillColor={0,0,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-62,-73},{65,-90}},
                    textString="rAxis",
                    lineColor={0,0,255}),
                  Ellipse(
                    extent={{-100,-40},{-19,40}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{-90,-30},{-29,29}},
                    lineColor={160,160,164},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-60,41},{-19,-41}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-60,40},{-60,-40}},
                    color={0,0,0},
                    thickness=0.5),
                  Ellipse(
                    extent={{-83,-17},{-34,21}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{-74,-12},{-40,15}},
                    lineColor={160,160,164},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-72,-20},{-89,3},{-69,25},{-45,27},{-72,-20}},
                    pattern=LinePattern.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Line(
                    points={{-60,40},{-60,-10}},
                    color={0,0,0},
                    thickness=0.5),
                  Line(
                    points={{-49,20},{-69,-15}},
                    color={0,0,0},
                    thickness=0.5),
                  Line(
                    points={{-40,0},{-40,90},{-80,90},{-80,99}},
                    color={95,95,95},
                    thickness=0.5),
                  Polygon(points={{7,-1},{-5,2},{-5,-4},{7,-1}}, lineColor={0,0,255}),
                  Line(points={{-50,19},{-30,57}}, color={0,0,255}),
                  Text(
                    extent={{-24,74},{7,53}},
                    lineColor={0,0,0},
                    textString="e2"),
                  Polygon(points={{-25,64},{-33,56},{-27,53},{-25,64}}, lineColor={0,
                        0,255}),
                  Line(points={{-60,41},{-60,65}}, color={0,0,255}),
                  Polygon(points={{-60,75},{-64,63},{-56,63},{-60,75}}, lineColor={0,
                        0,255}),
                  Text(
                    extent={{-96,82},{-65,61}},
                    lineColor={0,0,0},
                    textString="n1"),
                  Line(points={{-60,-40},{-60,-72}}, color={0,0,255}),
                  Ellipse(
                    extent={{20,-40},{100,40}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={192,192,192}),
                  Ellipse(
                    extent={{30,-30},{90,30}},
                    lineColor={192,192,192},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Rectangle(
                    extent={{-22,45},{40,-43}},
                    lineColor={255,255,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{45,14},{74,-14}},
                    lineColor={0,0,0},
                    fillPattern=FillPattern.Sphere,
                    fillColor={128,128,128}),
                  Line(points={{60,0},{60,-74}}, color={0,0,255}),
                  Rectangle(
                    extent={{-35,14},{-6,18}},
                    pattern=LinePattern.None,
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-35,-13},{-6,14}},
                    pattern=LinePattern.None,
                    fillColor={192,192,192},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-6,6},{46,10}},
                    pattern=LinePattern.None,
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Rectangle(
                    extent={{-6,-7},{46,6}},
                    pattern=LinePattern.None,
                    fillColor={192,192,192},
                    fillPattern=FillPattern.Solid,
                    lineColor={0,0,255}),
                  Line(points={{-6,-13},{-6,18}}, color={0,0,0}),
                  Text(
                    extent={{-40,-2},{-1,-16}},
                    lineColor={0,0,0},
                    textString="nAxis"),
                  Line(points={{-61,1},{-2,1}}, color={0,0,255}),
                  Polygon(points={{10,1},{-2,4},{-2,-2},{10,1}}, lineColor={0,0,255}),
                  Line(
                    points={{60,-1},{60,90},{80,90},{80,99}},
                    color={95,95,95},
                    thickness=0.5),
                  Text(
                    extent={{-24,117},{-9,102}},
                    textString="f",
                    lineColor={0,0,255}),
                  Polygon(
                    points={{-26,103},{-36,100},{-26,97},{-26,103}},
                    lineColor={0,0,255},
                    fillColor={0,0,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{26,103},{36,100},{26,97},{26,103}},
                    lineColor={0,0,255},
                    fillColor={0,0,255},
                    fillPattern=FillPattern.Solid),
                  Line(points={{14,100},{36,100}}, color={0,0,255}),
                  Text(
                    extent={{12,116},{27,101}},
                    textString="f",
                    lineColor={0,0,255}),
                  Polygon(
                    points={{30,93},{40,90},{30,87},{30,93}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Line(points={{-40,90},{40,90}}, color={128,128,128}),
                  Line(points={{-25,100},{-10,100}}, color={0,0,255}),
                  Text(
                    extent={{-18,90},{19,77}},
                    lineColor={128,128,128},
                    textString="s"),
                  Line(
                    points={{60,90},{40,90},{40,98}},
                    color={95,95,95},
                    thickness=0.5),
                  Line(
                    points={{-40,90},{-40,96},{-40,98}},
                    color={135,135,135},
                    thickness=0.5)}));

        protected
            SI.Force f_c_a[3] "frame_ia.f resolved in frame_a";
            SI.Torque t_cd_a[3] "frame_ia.t + frame_ib.t resolved in frame_a";
            SI.Force f_bd_a[3] "frame_b.f + frame_ib.f resolved in frame_a";
            SI.Position rAxis_0[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in world frame";
            SI.Position rAxis_a[3]
            "Position vector from origin of frame_a to origin of frame_b resolved in frame_a";
            Real eAxis_a[3](each final unit="1")
            "Unit vector in direction of rAxis_a, resolved in frame_a";
            Real e2_a[3](each final unit="1")
            "Unit vector in direction of second rotation axis of universal joint, resolved in frame_a";
            Real e3_a[3](each final unit="1")
            "Unit vector perpendicular to eAxis_a and e2_a, resolved in frame_a";
            Real n2_a[3](each final unit="1")
            "Vector in direction of second rotation axis of universal joint, resolved in frame_a";
            Real length2_n2_a(unit="m2") "Square of length of vector n2_a";
            SI.Length length_n2_a "Length of vector n2_a";
            Real der_rAxis_a_L[3](each unit="1/s") "= der(rAxis_a)/axisLength";
            SI.AngularVelocity w_rel_ia1[3];
            Frames.Orientation R_ia1_a;
            Frames.Orientation R_ia2_a;
            Frames.Orientation R_ia_a "Rotation from frame_a to frame_ia";
            // Real T_ia_a[3, 3] "Transformation matrix from frame_a to frame_ia";

            Visualizers.Advanced.Shape axisCylinder(
              shapeType="cylinder",
              color=axisColor,
              specularCoefficient=specularCoefficient,
              length=axisLength,
              width=axisDiameter,
              height=axisDiameter,
              lengthDirection=eAxis_ia,
              widthDirection=e2_ia,
              r=frame_ia.r_0,
              R=frame_ia.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape sphericalShape_b(
              shapeType="sphere",
              color=sphereColor,
              specularCoefficient=specularCoefficient,
              length=sphereDiameter,
              width=sphereDiameter,
              height=sphereDiameter,
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              r_shape={-0.5,0,0}*sphereDiameter,
              r=frame_b.r_0,
              R=frame_b.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape sphericalShape_a(
              shapeType="sphere",
              color=sphereColor,
              specularCoefficient=specularCoefficient,
              length=sphereDiameter,
              width=sphereDiameter,
              height=sphereDiameter,
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              r_shape={-0.5,0,0}*sphereDiameter,
              r=frame_a.r_0,
              R=frame_a.R) if world.enableAnimation and animation;
            Visualizers.Advanced.Shape universalShape1(
              shapeType="cylinder",
              color=cylinderColor,
              specularCoefficient=specularCoefficient,
              length=cylinderLength,
              width=cylinderDiameter,
              height=cylinderDiameter,
              lengthDirection=n1_a,
              widthDirection={0,1,0},
              r_shape=-n1_a*(cylinderLength/2),
              r=frame_a.r_0,
              R=frame_a.R) if world.enableAnimation and animation and showUniversalAxes;
            Visualizers.Advanced.Shape universalShape2(
              shapeType="cylinder",
              color=cylinderColor,
              specularCoefficient=specularCoefficient,
              length=cylinderLength,
              width=cylinderDiameter,
              height=cylinderDiameter,
              lengthDirection=e2_ia,
              widthDirection={0,1,0},
              r_shape=-e2_ia*(cylinderLength/2),
              r=frame_ia.r_0,
              R=frame_ia.R) if world.enableAnimation and animation and showUniversalAxes;
          equation
            Connections.branch(frame_a.R, frame_ia.R);
            Connections.branch(frame_ia.R, frame_ib.R);

            // Translational flanges
            axisLength = s + s_offset;
            bearing.s = 0;
            axis.s = s;
            axis.f = f;

            // Position vector rAxis from frame_a to frame_b
            rAxis_0 = frame_b.r_0 - frame_a.r_0;
            rAxis_a = Frames.resolve2(frame_a.R, rAxis_0);

            /* Determine relative Rotation R_rel_c from frame_a to frame_ia
     and absolute rotation of frame_a.R.
  */
            axisLength = sqrt(rAxis_0*rAxis_0);
            assert(axisLength > 1.0e-15, "
Distance between frame_a and frame_b of a JointUPS joint
became zero. This is not allowed. If this occurs during
initialization, the initial conditions are probably wrong.");

            eAxis_a = rAxis_a/axisLength;
            n2_a = cross(n1_a, eAxis_a);
            length2_n2_a = n2_a*n2_a;
            assert(noEvent(length2_n2_a > 1.e-10), "
A Modelica.Mechanics.MultiBody.Joints.Assemblies.JointUPS joint (consisting of
a universal, prismatic and spherical joint) is in the singular
configuration of the universal joint. This means that axis 1 of
the universal joint defined via parameter \"n1_a\" is parallel to vector
\"eAxis_ia\" that is directed from the origin of frame_a to the
origin of frame_b. You may try to use another \"n1_a\" vector.
");
            length_n2_a = sqrt(length2_n2_a);
            e2_a = n2_a/length_n2_a;
            e3_a = cross(eAxis_a, e2_a);

            /* The statements below are an efficient implementation of the
     original equations:
       T_ia_a = [eAxis_ia, e2_ia, e3_ia]*transpose([eAxis_a, e2_a, e3_a]);
       R_ia_a = Frames.from_T(T_ia_a,
                     Frames.TransformationMatrices.angularVelocity2(T_ia_a, der(T_ia_a)));
   To perform this, the rotation is split into two parts:
     R_ia_a : Rotation object from frame_a to frame_ia
     R_ia1_a: Rotation object from frame_a to frame_ia1
                (frame that is fixed in frame_ia such that x-axis
                is along the rod axis)
                T = transpose([eAxis_a, e2_a, e3_a]; w = w_rel_ia1
     R_ia2_a: Fixed rotation object from frame_ia1 to frame_ia
                T = [eAxis_a, e2_ia, e3_ia]; w = zeros(3)

   The difficult part is to compute w_rel_ia1:
      w_rel_ia1 = [  e3_a*der(e2_a);
                    -e3_a*der(eAxis_a);
                     e2_a*der(eAxis_a)]
   der(eAxis_a) is directly given, since eAxis_a is a function
   of translational quantities only.
      der(eAxis_a) = (der(rAxis_a) - eAxis_a*(eAxis_a*der(rAxis_a)))/axisLength
      der(n2_a)    = cross(n1_a, der(eAxis_a))
      der(e2_a)    = (der(n2_a) - e2_a*(e2_a*der(n2_a)))/length_n2_a
   Inserting these equations in w_rel_ia1 results in:
      e3_a*der(eAxis_a) = e3_a*der(rAxis_a)/axisLength       // e3_a*eAxis_a = 0
      e2_a*der(eAxis_a) = e2_a*der(rAxis_a)/axisLength       // e2_a*eAxis_a = 0
      e3_a*der(e2_a)    = e3_a*der(n2_a)/lenght_n2_a       // e3_a*e2_a = 0
                        = e3_a*cross(n1_a, der(eAxis_a))/length_n2_a
                        = e3_a*cross(n1_a, der(rAxis_a) - eAxis_a*(eAxis_a*der(rAxis_a)))/(length_n2_a*axisLength)
                        = e3_a*cross(n1_a, der(rAxis_a))/(length_n2_a*axisLength)
   Furthermore, we have:
     rAxis_a      = resolve2(frame_a.R, rAxis_0);
     der(rAxis_a) = resolve2(frame_a.R, der(rAxis_0)) - cross(frame_a.R.w, rAxis_a));
*/
            der_rAxis_a_L = (Frames.resolve2(frame_a.R, der(rAxis_0)) - cross(frame_a.
               R.w, rAxis_a))/axisLength;
            w_rel_ia1 = {e3_a*cross(n1_a, der_rAxis_a_L)/length_n2_a,-e3_a*
              der_rAxis_a_L,e2_a*der_rAxis_a_L};
            R_ia1_a = Frames.from_T(transpose([eAxis_a, e2_a, e3_a]), w_rel_ia1);
            R_ia2_a = Frames.from_T([eAxis_ia, e2_ia, e3_ia], zeros(3));
            R_ia_a = Frames.absoluteRotation(R_ia1_a, R_ia2_a);
            /*
  T_ia_a = [eAxis_ia, e2_ia, e3_ia]*transpose([eAxis_a, e2_a, e3_a]);
  R_ia_a = Frames.from_T(T_ia_a, Frames.TransformationMatrices.angularVelocity2
    (T_ia_a, der(T_ia_a)));
*/

            // Compute kinematic quantities of frame_ia and frame_ib
            frame_ia.r_0 = frame_a.r_0;
            frame_ib.r_0 = frame_b.r_0;
            frame_ia.R = Frames.absoluteRotation(frame_a.R, R_ia_a);
            frame_ib.R = frame_ia.R;

            /* In the following formulas f_a, f_b, f_ia, f_ib, t_a, t_b, t_ia, t_ib are
     the forces and torques at frame_a, frame_b, frame_ia, frame_ib respectively,
     resolved in frame_a. eAxis, e2, e3 are the unit vectors resolved in frame_a.
     Torque balance at the rod around the origin of frame_a:
       0 = t_a + t_ia + t_ib + cross(rAxis, (f_b+f_ib))
     with
         rAxis = axisLength*eAxis
         f_bd  = f_b + f_ib
         f_bd  = f*eAxis + f_bd[2]*e2 + f_bd[3]*e3
     follows:
         0 = t_a + t_ia + axisLength*(f_bd[2]*e_z - f_bd[3]*e_y)
     The projection of t_a with respect to universal joint axes vanishes:
       e1*t_a = 0
       e2*t_a = 0
     Therefore:
        0 = e1*(t_ia + t_ib) + axisLength*f_bd[2]*(e1*e3)
        0 = e2*(t_ia + t_ib) - axisLength*f_bd[3]
     or
        f_bd = f*eAxis - e2*(e1*(t_ia+t_ib))/(axisLength*(e1*e3)) +
                e3*(e2*(t_ia+t_ib))/axisLength
     Force balance:
        0 = f_a + f_bd + f_ia
  */
            f_c_a = Frames.resolve1(R_ia_a, frame_ia.f);
            t_cd_a = Frames.resolve1(R_ia_a, frame_ia.t + frame_ib.t);
            f_bd_a = -eAxis_a*f - e2_a*((n1_a*t_cd_a)/(axisLength*(n1_a*e3_a))) +
              e3_a*((e2_a*t_cd_a)/axisLength);
            zeros(3) = frame_b.f + Frames.resolveRelative(frame_ib.f, frame_ib.R,
              frame_b.R) - Frames.resolveRelative(f_bd_a, frame_a.R, frame_b.R);
            zeros(3) = frame_b.t;
            zeros(3) = frame_a.f + f_c_a + f_bd_a;
            zeros(3) = frame_a.t + t_cd_a + cross(rAxis_a, f_bd_a);

            // Measure power for test purposes
            if checkTotalPower then
              totalPower = frame_a.f*Frames.resolve2(frame_a.R, der(frame_a.r_0)) +
                frame_b.f*Frames.resolve2(frame_b.R, der(frame_b.r_0)) + frame_ia.f*
                Frames.resolve2(frame_ia.R, der(frame_ia.r_0)) + frame_ib.f*
                Frames.resolve2(frame_ib.R, der(frame_ib.r_0)) + frame_a.t*
                Frames.angularVelocity2(frame_a.R) + frame_b.t*
                Frames.angularVelocity2(frame_b.R) + frame_ia.t*
                Frames.angularVelocity2(frame_ia.R) + frame_ib.t*
                Frames.angularVelocity2(frame_ib.R) + axis.f*der(axis.s) + bearing.f*
                der(bearing.s);
            else
              totalPower = 0;
            end if;
          end JointUPS;
        end Assemblies;

        package Internal
        "Components used for analytic solution of kinematic loops (use only if you know what you are doing)"
          extends Modelica.Icons.Library;
          annotation (Documentation(info="<HTML>
<p>
The models in this package should not be used by the user.
They are designed to build up other models in the MultiBody library
and some of them cannot be used in an arbitrary way and require
particular knowledge how to set the options in the parameter menu.
Don't use the models of this package.
</p>
</HTML>"));

           model RollingConstraintVerticalWheel
          "Rolling constraint for wheel that is always perpendicular to x-y plane"
              import SI = Modelica.SIunits;
              import Modelica.Mechanics.MultiBody.Frames;
              annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                        -100},{100,100}}), graphics={
                    Rectangle(
                      extent={{-100,-60},{100,-80}},
                      lineColor={0,0,0},
                      fillColor={175,175,175},
                      fillPattern=FillPattern.Solid),
                    Text(
                      extent={{-148,-86},{152,-126}},
                      lineColor={0,0,255},
                      textString="%name"),
                    Line(
                      points={{0,-60},{0,4}},
                      color={0,0,0},
                      smooth=Smooth.None,
                      pattern=LinePattern.Dot),
                    Line(
                      visible=lateralSlidingConstraint,
                      points={{-98,-30},{-16,-30}},
                      color={0,0,0},
                      smooth=Smooth.None),
                    Polygon(
                      visible=lateralSlidingConstraint,
                      points={{-40,-16},{-40,-42},{-6,-30},{-40,-16}},
                      lineColor={0,0,0},
                      smooth=Smooth.None,
                      fillColor={255,255,255},
                      fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
                      preserveAspectRatio=false, extent={{-100,-100},{100,100}}), graphics));

              Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
            "Frame fixed in wheel center point. x-Axis: upwards, y-axis: along wheel axis"
                annotation (Placement(transformation(extent={{-16,4},{16,36}}),
                    iconTransformation(extent={{-16,4},{16,36}})));

              parameter SI.Radius radius "Wheel radius";

              parameter Boolean lateralSlidingConstraint = true
            "= true, if lateral sliding constraint taken into account, = false if lateral force = 0 (needed to avoid overconstraining if two ideal rolling wheels are connect on one axis)"
                                                                                                                annotation(choices(__Dymola_checkBox=true),HideResult=true,Evaluate=true);

              // Contact force
              SI.Force f_wheel_0[3]
            "Contact force acting on wheel, resolved in world frame";
              SI.Force f_lat
            "Contact force acting on wheel in lateral direction";
              SI.Force f_long
            "Contact force acting on wheel in longitudinal direction";
        protected
               Real e_axis_0[3]
            "Unit vector along wheel axis, resolved in world frame";
               SI.Position rContact_0[3]
            "Distance vector from wheel center to contact point, resolved in world frame";

               // Coordinate system at contact point
               Real e_n_0[3]
            "Unit vector in normal direction of road at contact point, resolved in world frame";
               Real e_lat_0[3]
            "Unit vector in lateral direction of wheel at contact point, resolved in world frame";
               Real e_long_0[3]
            "Unit vector in longitudinal direction of wheel at contact point, resolved in world frame";

               // Slip velocities
               SI.Velocity v_0[3]
            "Velocity of wheel center, resolved in world frame";
               SI.AngularVelocity w_0[3]
            "Angular velocity of wheel, resolved in world frame";

               SI.Velocity vContact_0[3]
            "Velocity of wheel contact point, resolved in world frame";

               // Utility vectors
               Real aux[3];

           equation
               // Coordinate system at contact point (e_long_0, e_lat_0, e_n_0)
               e_n_0    = {0,0,1};
               e_axis_0 = Frames.resolve1(frame_a.R, {0,1,0});
               aux      = cross(e_n_0, e_axis_0);
               e_long_0 = aux / Modelica.Math.Vectors.length(aux);
               e_lat_0  = cross(e_long_0, e_n_0);

               // Slip velocities
               rContact_0 = {0,0,-radius};
               v_0 = der(frame_a.r_0);
               w_0 = Frames.angularVelocity1(frame_a.R);
               vContact_0 = v_0 + cross(w_0, rContact_0);

               // Two non-holonomic constraint equations on velocity level (ideal rolling, no slippage)
               0 = vContact_0*e_long_0;
               if lateralSlidingConstraint then
                  0 = vContact_0*e_lat_0;
                  f_wheel_0 = f_lat*e_lat_0 + f_long*e_long_0;
               else
                  0 = f_lat;
                  f_wheel_0 = f_long*e_long_0;
               end if;

               // Force and torque balance at the wheel center
               zeros(3) = frame_a.f + Frames.resolve2(frame_a.R, f_wheel_0);
               zeros(3) = frame_a.t + Frames.resolve2(frame_a.R, cross(rContact_0, f_wheel_0));
           end RollingConstraintVerticalWheel;
        end Internal;
      end Joints;

      package Parts
      "Rigid components such as bodies with mass and inertia and massless rods"
        import SI = Modelica.SIunits;
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
Package <b>Parts</b> contains <b>rigid components</b> of a
multi-body system. These components may be used to build up
more complicated structures. For example, a part may be built up of
a \"Body\" and of several \"FixedTranslation\" components.
</p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><b><i>Model</i></b></th><th><b><i>Description</i></b></th></tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Fixed\">Fixed</a></td>
      <td valign=\"top\">Frame fixed in world frame at a given position.
          It is visualized with a shape, see <b>shapeType</b> below
         (the frames on the two
          sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/Fixed.png\" ALT=\"model Parts.Fixed\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.FixedTranslation\">FixedTranslation</a></td>
      <td valign=\"top\">Fixed translation of frame_b with respect to frame_a.
          It is visualized with a shape, see <b>shapeType</b> below
          (the frames on the two sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/FixedTranslation.png\" ALT=\"model Parts.FixedTranslation\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.FixedRotation\">FixedRotation</a></td>
      <td valign=\"top\">Fixed translation and fixed rotation of frame_b with respect to frame_a
          It is visualized with a shape, see <b>shapeType</b>  below
          (the frames on the two sides do not belong to the component):<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/FixedRotation.png\" ALT=\"model Parts.FixedRotation\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">Body</a></td>
      <td valign=\"top\">Rigid body with mass, inertia tensor and one frame connector.
          It is visualized with a cylinder and a sphere at the
          center of mass:<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/Body.png\" ALT=\"model Parts.Body\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BodyShape\">BodyShape</a></td>
      <td valign=\"top\">Rigid body with mass, inertia tensor, different shapes
          (see <b>shapeType</b> below)
          for animation, and two frame connectors:<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/BodyShape.png\" ALT=\"model Parts.BodyShape\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Fixed\">Fixed</a>
BodyBox</b></td>
      <td valign=\"top\">Rigid body with box shape (mass and animation properties are computed
          from box data and from density):<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/BodyBox.png\" ALT=\"model Parts.BodyBox\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BodyCylinder\">BodyCylinder</a></td>
      <td valign=\"top\">Rigid body with cylinder shape (mass and animation properties
          are computed from cylinder data and from density):<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/BodyCylinder.png\" ALT=\"model Parts.BodyCylinder\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.PointMass\">PointMass</a></td>
      <td valign=\"top\">Rigid body where inertia tensor and rotation is neglected:<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/Parts/PointMass.png\" ALT=\"model Parts.PointMass\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Mounting1D\">Mounting1D</a></td>
      <td valign=\"top\"> Propagate 1-dim. support torque to 3-dim. system
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Rotor1D\">Rotor1D</a></td>
      <td valign=\"top\">1D inertia attachable on 3-dim. bodies (without neglecting dynamic effects)<br>
      <IMG SRC=\"../Images/MultiBody/Parts/Rotor1D.png\" ALT=\"model Parts.Rotor1D\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.BevelGear1D\">BevelGear1D</a></td>
      <td valign=\"top\">1D gearbox with arbitrary shaft directions (3D bearing frame)
      </td>
  </tr>
</table>
<p>
Components <b>Fixed</b>, <b>FixedTranslation</b>, <b>FixedRotation</b>
and <b>BodyShape</b> are visualized according to parameter
<b>shapeType</b>, that may have the following values (e.g., shapeType = \"box\"): <br>&nbsp;<br>
</p>
<IMG SRC=\"../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.FixedShape\">
<p>
All the details of the visualization shape parameters are
given in
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">Visualizers.FixedShape</a>
</p>
<p>
Colors in all animation parts are defined via parameter <b>color</b>.
This is an Integer vector with 3 elements, {r, g, b}, and specifies the
color of the shape. {r,g,b} are the \"red\", \"green\" and \"blue\" color parts,
given in the ranges 0 .. 255, respectively. The predefined type
<b>MultiBody.Types.Color</b> contains a menu
definition of the colors used in the MultiBody library
(this will be replaced by a color editor).
</p>
</HTML>
"));

        model Fixed "Frame fixed in the world frame at a given position"
          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_b frame_b
          "Coordinate system fixed in the world frame" 
            annotation (Placement(transformation(extent={{84,-16},{116,16}}, rotation=
                   0)));

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3]={0,0,0}
          "Position vector from world frame to frame_b, resolved in world frame";
          parameter Types.ShapeType shapeType="cylinder" " Type of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from world frame to shape origin, resolved in world frame" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position lengthDirection[3]=r - r_shape
          " Vector in length direction of shape, resolved in world frame" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position widthDirection[3]={0,1,0}
          " Vector in width direction of shape, resolved in world frame" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance height=width " Height of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter for cone, pipe etc. (see docu of Visualizers.Advanced.Shape)"
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          " Color of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));

          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-90,90},{90,-90}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{150,170},{-142,106}},
                  textString="%name",
                  lineColor={0,0,255}),
                Line(points={{0,100},{0,-100}}, color={0,0,0}),
                Line(points={{0,-80},{-100,-20}}, color={0,0,0}),
                Line(points={{0,-40},{-100,20}}, color={0,0,0}),
                Line(points={{0,0},{-100,60}}, color={0,0,0}),
                Line(points={{0,40},{-100,100}}, color={0,0,0}),
                Line(points={{0,0},{100,0}}, color={0,0,0}),
                Text(
                  extent={{-146,-104},{154,-148}},
                  lineColor={0,0,0},
                  textString="r=%r")}),
            Documentation(info="<html>
<p>
Element consisting of a frame (frame_b) that is fixed in the world
frame at a given position defined by parameter vector <b>r</b>
(vector from origin of world frame to frame_b, resolved in the
world frame).
</p>
<p>
By default, this component is visualized by a cylinder connecting the
world frame and frame_b of this components, as shown in the figure below.
Note, that the visualized world frame on the left side and
Fixed.frame_b on the right side are not part of the
component animation and that the animation may be switched off via parameter
animation = <b>false</b>.
</p>
<IMG SRC=\"../Images/MultiBody/Fixed.png\" ALT=\"Parts.Fixed\">
</HTML>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{0,100},{0,-100}}, color={0,0,0}),
                Line(points={{0,-80},{-100,-20}}, color={0,0,0}),
                Line(points={{0,-40},{-100,20}}, color={0,0,0}),
                Line(points={{0,0},{-100,60}}, color={0,0,0}),
                Line(points={{0,40},{-100,100}}, color={0,0,0}),
                Line(points={{0,0},{100,0}}, color={0,0,0})}));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            length=length,
            width=width,
            height=height,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            extra=extra,
            r_shape=r_shape,
            r=zeros(3),
            R=Frames.nullRotation()) if world.enableAnimation and animation;
        equation
          Connections.root(frame_b.R);
          frame_b.r_0 = r;
          frame_b.R = Frames.nullRotation();
        end Fixed;

        model FixedTranslation
        "Fixed translation of frame_b with respect to frame_a"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3](start={0,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter Types.ShapeType shapeType="cylinder" " Type of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from frame_a to shape origin, resolved in frame_a" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.Axis lengthDirection=r - r_shape
          " Vector in length direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter Types.Axis widthDirection={0,1,0}
          " Vector in width direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance height=width " Height of shape." 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)."
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          " Color of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));

          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-99,5},{101,-5}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-131,101},{129,41}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{127,-72},{-133,-22}},
                  lineColor={0,0,0},
                  textString="%=r"),
                Text(
                  extent={{-89,38},{-53,13}},
                  lineColor={128,128,128},
                  textString="a"),
                Text(
                  extent={{57,39},{93,14}},
                  lineColor={128,128,128},
                  textString="b")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-100,5},{100,-5}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{-95,20},{-58,20}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Line(
                  points={{-94,18},{-94,50}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Text(
                  extent={{-72,35},{-58,24}},
                  lineColor={128,128,128},
                  textString="x"),
                Text(
                  extent={{-113,57},{-98,45}},
                  lineColor={128,128,128},
                  textString="y"),
                Line(points={{-100,-4},{-100,-69}}, color={128,128,128}),
                Line(points={{-100,-63},{90,-63}}, color={128,128,128}),
                Text(
                  extent={{-22,-39},{16,-63}},
                  lineColor={128,128,128},
                  textString="r"),
                Polygon(
                  points={{88,-59},{88,-68},{100,-63},{88,-59}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{100,-3},{100,-68}}, color={128,128,128}),
                Line(
                  points={{69,20},{106,20}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Line(
                  points={{70,18},{70,50}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Text(
                  extent={{92,35},{106,24}},
                  lineColor={128,128,128},
                  textString="x"),
                Text(
                  extent={{51,57},{66,45}},
                  lineColor={128,128,128},
                  textString="y")}),
            Documentation(info="<HTML>
<p>
Component for a <b>fixed translation</b> of frame_b with respect
to frame_a, i.e., the relationship between connectors frame_a and frame_b
remains constant and frame_a is always <b>parallel</b> to frame_b.
</p>
<p>
By default, this component is visualized by a cylinder connecting
frame_a and frame_b, as shown in the figure below. Note, that the
two visualized frames are not part of the component animation and that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../Images/MultiBody/FixedTranslation.png\" ALT=\"Parts.FixedTranslation\">
</HTML>"));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            extra=extra,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0 or cardinality(frame_b) > 0,
            "Neither connector frame_a nor frame_b of FixedTranslation object is connected");

          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r);
          frame_b.R = frame_a.R;

          /* Force and torque balance */
          zeros(3) = frame_a.f + frame_b.f;
          zeros(3) = frame_a.t + frame_b.t + cross(r, frame_b.f);
        end FixedTranslation;

        model FixedRotation
        "Fixed translation followed by a fixed rotation of frame_b with respect to frame_a"

          import Modelica.Mechanics.MultiBody.Frames;
          import Modelica.Mechanics.MultiBody.Types;
          import SI = Modelica.SIunits;
          import Cv = Modelica.SIunits.Conversions;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter SI.Position r[3]={0,0,0}
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.RotationTypes
          rotationType=
                    Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis
          "Type of rotation description" 
            annotation (Evaluate=true);
          parameter Types.Axis n={1,0,0}
          " Axis of rotation in frame_a (= same as in frame_b)" 
            annotation (Evaluate=true, Dialog(group="if rotationType = RotationAxis",
                        enable=rotationType==Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis));
          parameter Cv.NonSIunits.Angle_deg angle=0
          " Angle to rotate frame_a around axis n into frame_b" 
            annotation (Dialog(group="if rotationType = RotationAxis",
                        enable=rotationType==Modelica.Mechanics.MultiBody.Types.RotationTypes.RotationAxis));

          parameter Types.Axis n_x={1,0,0}
          " Vector along x-axis of frame_b resolved in frame_a" 
            annotation (Evaluate=true, Dialog(group="if rotationType = TwoAxesVectors",
                        enable=rotationType==Types.RotationTypes.TwoAxesVectors));
          parameter Types.Axis n_y={0,1,0}
          " Vector along y-axis of frame_b resolved in frame_a" 
            annotation (Evaluate=true, Dialog(group="if rotationType = TwoAxesVectors",
                        enable=rotationType==Types.RotationTypes.TwoAxesVectors));

          parameter Types.RotationSequence sequence(
            min={1,1,1},
            max={3,3,3}) = {1,2,3} " Sequence of rotations" 
            annotation (Evaluate=true, Dialog(group=
                        "if rotationType = PlanarRotationSequence",
                        enable=rotationType==Types.RotationTypes.PlanarRotationSequence));
          parameter Cv.NonSIunits.Angle_deg angles[3]={0,0,0}
          " Rotation angles around the axes defined in 'sequence'" 
            annotation (Dialog(group="if rotationType = PlanarRotationSequence",
                        enable=rotationType==Types.RotationTypes.PlanarRotationSequence));
          parameter Types.ShapeType shapeType="cylinder" " Type of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from frame_a to shape origin, resolved in frame_a" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.Axis lengthDirection=r - r_shape
          " Vector in length direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter Types.Axis widthDirection={0,1,0}
          " Vector in width direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance height=width " Height of shape." 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)."
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
        /*
  parameter Boolean checkTotalPower=false
    "= true, if total power flowing into this component shall be determined (must be zero)"
    annotation (Dialog(tab="Advanced"));
*/

          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.RodColor
          " Color of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          final parameter Frames.Orientation R_rel=if rotationType == 1 then 
              Frames.planarRotation(Modelica.Math.Vectors.normalize(
                                                     n), Cv.from_deg(angle), 0) else 
              if rotationType == 2 then Frames.from_nxy(n_x, n_y) else 
              Frames.axesRotations(sequence, Cv.from_deg(angles), zeros(3))
          "Fixed rotation object from frame_a to frame_b";
        /*
  SI.Power totalPower
    "Total power flowing into this element, if checkTotalPower=true (otherwise dummy)";
*/
      protected
          outer Modelica.Mechanics.MultiBody.World world;

          /*
  parameter Frames.Orientation R_rel_inv=
      Frames.inverseRotation(R_rel)
*/
          parameter Frames.Orientation R_rel_inv=Frames.from_T(transpose(R_rel.T),
              zeros(3)) "Inverse of R_rel (rotate from frame_b to frame_a)";
          Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape shape(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            extra=extra,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          annotation (
            Documentation(info="<HTML>
<p>
Component for a <b>fixed translation</b> and <b>fixed rotation</b> of frame_b with respect
to frame_a, i.e., the relationship between connectors frame_a and frame_b
remains constant. There are several possibilities to define the
orientation of frame_b with respect to frame_a:
</p>
<ul>
<li><b>Planar rotation</b> along axis 'n' (that is fixed and resolved
    in frame_a) with a fixed angle 'angle'.</li>
<li><b>Vectors n_x</b> and <b>n_y</b> that are directed along the corresponding axes
    direction of frame_b and are resolved in frame_a (if n_y is not
    orthogonal to n_x, the y-axis of frame_b is selected such that it is
    orthogonal to n_x and in the plane of n_x and n_y).</li>
<li><b>Sequence</b> of <b>three planar axes rotations</b>.
    For example, \"sequence = {1,2,3}\" and \"angles = {90, 45, -90}\"
    means to rotate frame_a around the x axis with 90 degrees, around the new
    y axis with 45 degrees and around the new z axis around -90 degrees to
    arrive at frame_b. Note, that sequence={1,2,3}
    is the Cardan angle sequence and sequence = {3,1,3} is the Euler angle
    sequence.</li>
</ul>
<p>
By default, this component is visualized by a cylinder connecting
frame_a and frame_b, as shown in the figure below. In this figure
frame_b is rotated along the z-axis of frame_a with 60 degree. Note, that the
two visualized frames are not part of the component animation and that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../Images/MultiBody/FixedRotation.png\" ALT=\"Parts.FixedRotation\">
</HTML>",       revisions="<HTML><p><b>Release Notes:</b></p>
<ul>
  <li><i>July 28, 2003</i><br>
         Bug fixed: if rotationType = PlanarRotationSequence, then 'angles'
         was used with unit [rad] instead of [deg].</li>
</ul>
</HTML>"),  Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-136,79},{132,139}},
                  textString="%name",
                  lineColor={0,0,255}),
                Rectangle(
                  extent={{-100,5},{100,-4}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{80,20},{129,50}}, color={0,0,0}),
                Line(points={{80,20},{57,59}}, color={0,0,0}),
                Polygon(
                  points={{144,60},{117,59},{132,37},{144,60}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{43,80},{46,50},{68,65},{43,80}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-144,-52},{143,-89}},
                  lineColor={0,0,0},
                  textString="r=%r"),
                Text(
                  extent={{-117,51},{-81,26}},
                  lineColor={128,128,128},
                  textString="a"),
                Text(
                  extent={{84,-24},{120,-49}},
                  lineColor={128,128,128},
                  textString="b")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-100,-1},{-100,-66}}, color={128,128,128}),
                Line(points={{100,0},{100,-65}}, color={128,128,128}),
                Line(points={{-100,-60},{89,-60}}, color={128,128,128}),
                Text(
                  extent={{-22,-36},{16,-60}},
                  lineColor={128,128,128},
                  textString="r"),
                Rectangle(
                  extent={{-100,5},{100,-5}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{69,29},{97,45}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Line(
                  points={{70,27},{55,54}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Text(
                  extent={{95,42},{109,31}},
                  lineColor={128,128,128},
                  textString="x"),
                Text(
                  extent={{42,70},{57,58}},
                  lineColor={128,128,128},
                  textString="y"),
                Line(
                  points={{-95,22},{-58,22}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Line(
                  points={{-94,20},{-94,52}},
                  color={128,128,128},
                  arrow={Arrow.None,Arrow.Filled}),
                Text(
                  extent={{-72,37},{-58,26}},
                  lineColor={128,128,128},
                  textString="x"),
                Text(
                  extent={{-113,59},{-98,47}},
                  lineColor={128,128,128},
                  textString="y"),
                Polygon(
                  points={{88,-56},{88,-65},{100,-60},{88,-56}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}));

        equation
          Connections.branch(frame_a.R, frame_b.R);
          assert(cardinality(frame_a) > 0 or cardinality(frame_b) > 0,
            "Neither connector frame_a nor frame_b of FixedRotation object is connected");

          /* Relationships between quantities of frame_a and frame_b */
          frame_b.r_0 = frame_a.r_0 + Frames.resolve1(frame_a.R, r);
          if rooted(frame_a.R) then
            frame_b.R = Frames.absoluteRotation(frame_a.R, R_rel);
            zeros(3) = frame_a.f + Frames.resolve1(R_rel, frame_b.f);
            zeros(3) = frame_a.t + Frames.resolve1(R_rel, frame_b.t) - cross(r, frame_a.f);
          else
            frame_a.R = Frames.absoluteRotation(frame_b.R, R_rel_inv);
            zeros(3) = frame_b.f + Frames.resolve1(R_rel_inv, frame_a.f);
            zeros(3) = frame_b.t + Frames.resolve1(R_rel_inv, frame_a.t) + cross(Frames.resolve1(R_rel_inv,r), frame_b.f);
          end if;

        /*
  if checkTotalPower then
    totalPower = frame_a.f*Frames.resolve2(frame_a.R, der(frame_a.r_0)) +
                 frame_b.f*Frames.resolve2(frame_b.R, der(frame_b.r_0)) +
                 frame_a.t*Frames.angularVelocity2(frame_a.R) +
                 frame_b.t*Frames.angularVelocity2(frame_b.R);
  else
    totalPower = 0;
  end if;
*/
        end FixedRotation;

        model Body
        "Rigid body with mass, inertia tensor and one frame connector (12 potential states)"

          import SI = Modelica.SIunits;
          import C = Modelica.Constants;
          import Modelica.Math.*;
          import Modelica.Mechanics.MultiBody.Types;
          import Modelica.Mechanics.MultiBody.Frames;
          Interfaces.Frame_a frame_a "Coordinate system fixed at body" 
            annotation (Placement(transformation(extent={{-116,-16},{-84,16}},
                  rotation=0)));
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show cylinder and sphere)";
          parameter SI.Position r_CM[3](start={0,0,0})
          "Vector from frame_a to center of mass, resolved in frame_a";
          parameter SI.Mass m(min=0, start = 1) "Mass of rigid body";
          parameter SI.Inertia I_11(min=0) = 0.001
          " (1,1) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_22(min=0) = 0.001
          " (2,2) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_33(min=0) = 0.001
          " (3,3) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_21(min=-C.inf)=0
          " (2,1) element of inertia tensor"                                         annotation (
              Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_31(min=-C.inf)=0
          " (3,1) element of inertia tensor"                                         annotation (
              Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_32(min=-C.inf)=0
          " (3,2) element of inertia tensor"                                         annotation (
              Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b"
            annotation (Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time"
            annotation (Evaluate=true, Dialog(tab="Initialization"));

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame"
            annotation (Dialog(tab="Initialization"));

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)" 
            annotation (Dialog(tab="Initialization"));

          parameter SI.Diameter sphereDiameter=world.defaultBodyDiameter
          "Diameter of sphere"   annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of sphere"   annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          parameter SI.Diameter cylinderDiameter=sphereDiameter/Types.Defaults.
              BodyCylinderDiameterFraction "Diameter of cylinder" 
            annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          input Types.Color cylinderColor=sphereColor "Color of cylinder" 
            annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)"
            annotation (Evaluate=true,Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states"
            annotation (Evaluate=true,Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states"
             annotation (Evaluate=true, Dialog(tab="Advanced", enable=not 
                  useQuaternions));

          final parameter SI.Inertia I[3, 3]=[I_11, I_21, I_31; I_21, I_22, I_32;
              I_31, I_32, I_33] "inertia tensor";
          final parameter Frames.Orientation R_start=Modelica.Mechanics.MultiBody.Frames.axesRotations(
              sequence_start, angles_start, zeros(3))
          "Orientation object from world frame to frame_a at initial time";
          final parameter SI.AngularAcceleration z_a_start[3]=Frames.resolve2(R_start, z_0_start)
          "Initial values of angular acceleration z_a = der(w_a), i.e., time derivative of angular velocity resolved in frame_a";

          SI.AngularVelocity w_a[3](start=Frames.resolve2(R_start, w_0_start),
                                    fixed=fill(w_0_fixed,3),
                                    each stateSelect=if enforceStates then (if useQuaternions then 
                                    StateSelect.always else StateSelect.never) else StateSelect.avoid)
          "Absolute angular velocity of frame_a resolved in frame_a";
          SI.AngularAcceleration z_a[3](start=Frames.resolve2(R_start, z_0_start),fixed=fill(z_0_fixed,3))
          "Absolute angular acceleration of frame_a resolved in frame_a";
          SI.Acceleration g_0[3] "Gravity acceleration resolved in world frame";
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Rectangle(
                  extent={{-100,30},{-3,-31}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={0,127,255}),
                Text(
                  extent={{131,-123},{-129,-73}},
                  lineColor={0,0,0},
                  textString="m=%m"),
                Text(
                  extent={{-128,132},{132,72}},
                  textString="%name",
                  lineColor={0,0,255}),
                Ellipse(
                  extent={{-20,60},{100,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={0,127,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
            Documentation(info="<HTML>
<p>
<b>Rigid body</b> with mass and inertia tensor.
All parameter vectors have to be resolved in frame_a.
The <b>inertia tensor</b> has to be defined with respect to a
coordinate system that is parallel to frame_a with the
origin at the center of mass of the body.
</p>
<p>
By default, this component is visualized by a <b>cylinder</b> located
between frame_a and the center of mass and by a <b>sphere</b> that has
its center at the center of mass. If the cylinder length is smaller as
the radius of the sphere, e.g., since frame_a is located at the
center of mass, the cylinder is not displayed. Note, that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../Images/MultiBody/Body.png\" ALT=\"Parts.Body\">
<p>
<b>States of Body Components</b>
</p>
<p>
Every body has potential states. If possible a tool will select
the states of joints and not the states of bodies because this is
usually the most efficient choice. In this case the position, orientation,
velocity and angular velocity of frame_a of the body will be computed
by the component that is connected to frame_a. However, if a body is moving
freely in space, variables of the body have to be used as states. The potential
states of the body are:
</p>
<ul>
<li> The <b>position vector</b> frame_a.r_0 from the origin of the
     world frame to the origin of frame_a of the body, resolved in
     the world frame and the <b>absolute velocity</b> v_0 of the origin of
     frame_a, resolved in the world frame (= der(frame_a.r_0)).</li>
</li>
<li> If parameter <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>true</b> (this is the default), then <b>4 quaternions</b>
     are potential states. Additionally, the coordinates of the
     absolute angular velocity vector of the
     body are 3 potential states.<br>
     If <b>useQuaternions</b> in the \"Advanced\" menu
     is <b>false</b>, then <b>3 angles</b> and the derivatives of
     these angles are potential states. The orientation of frame_a
     is computed by rotating the world frame along the axes defined
     in parameter vector \"sequence_angleStates\" (default = {1,2,3}, i.e.,
     the Cardan angle sequence) around the angles used as potential states.
     For example, the default is to rotate the x-axis of the world frame
     around angles[1], the new y-axis around angles[2] and the new z-axis
     around angles[3], arriving at frame_a.
 </li>
</ul>
<p>
The quaternions have the slight disadvantage that there is a
non-linear constraint equation between the 4 quaternions.
Therefore, at least one non-linear equation has to be solved
during simulation. A tool might, however, analytically solve this
simple constraint equation. Using the 3 angles as states has the
disadvantage that there is a singular configuration in which a
division by zero will occur. If it is possible to determine in advance
for an application class that this singular configuration is outside
of the operating region, the 3 angles might be used as potential
states by setting <b>useQuaternions</b> = <b>false</b>.
</p>
<p>
In text books about 3-dimensional mechanics often 3 angles and the
angular velocity are used as states. This is not the case here, since
3 angles and their derivatives are used as potential states
(if useQuaternions = false). The reason
is that for real-time simulation the discretization formula of the
integrator might be \"inlined\" and solved together with the body equations.
By appropriate symbolic transformation the performance is
drastically increased if angles and their
derivatives are used as states, instead of angles and the angular
velocity.
</p>
<p>
Whether or not variables of the body are used as states is usually
automatically selected by the Modelica translator. If parameter
<b>enforceStates</b> is set to <b>true</b> in the \"Advanced\" menu,
then body variables are forced to be used as states according
to the setting of parameters \"useQuaternions\" and
\"sequence_angleStates\".
</p>
</HTML>"));

      protected
          outer Modelica.Mechanics.MultiBody.World world;

          // Declarations for quaternions (dummies, if quaternions are not used)
          parameter Frames.Quaternions.Orientation Q_start=Frames.to_Q(R_start)
          "Quaternion orientation object from world frame to frame_a at initial time";
          Frames.Quaternions.Orientation Q(start=Q_start, each stateSelect=if 
                enforceStates then (if useQuaternions then StateSelect.prefer else 
                StateSelect.never) else StateSelect.avoid)
          "Quaternion orientation object from world frame to frame_a (dummy value, if quaternions are not used as states)";

          // Declaration for 3 angles
          parameter SI.Angle phi_start[3]=if sequence_start[1] ==
              sequence_angleStates[1] and sequence_start[2] == sequence_angleStates[2]
               and sequence_start[3] == sequence_angleStates[3] then angles_start else 
               Frames.axesRotationsAngles(R_start, sequence_angleStates)
          "Potential angle states at initial time";
          SI.Angle phi[3](start=phi_start, each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.avoid)
          "Dummy or 3 angles to rotate world frame into frame_a of body";
          SI.AngularVelocity phi_d[3](each stateSelect=if enforceStates then (if 
                useQuaternions then StateSelect.never else StateSelect.always) else 
                StateSelect.avoid) "= der(phi)";
          SI.AngularAcceleration phi_dd[3] "= der(phi_d)";

          // Declarations for animation
          Visualizers.Advanced.Shape cylinder(
            shapeType="cylinder",
            color=cylinderColor,
            specularCoefficient=specularCoefficient,
            length=if Modelica.Math.Vectors.length(r_CM) > sphereDiameter/2 then 
                      Modelica.Math.Vectors.length(r_CM) - (if cylinderDiameter > 1.1*
                sphereDiameter then sphereDiameter/2 else 0) else 0,
            width=cylinderDiameter,
            height=cylinderDiameter,
            lengthDirection=r_CM,
            widthDirection={0,1,0},
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape sphere(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape=r_CM - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation and sphereDiameter > 0;
        initial equation
          if angles_fixed then
            // Initialize positional variables
            if not Connections.isRoot(frame_a.R) then
              // frame_a.R is computed somewhere else
              zeros(3) = Frames.Orientation.equalityConstraint(frame_a.R, R_start);
            elseif useQuaternions then
              // frame_a.R is computed from quaternions Q
              zeros(3) = Frames.Quaternions.Orientation.equalityConstraint(Q, Q_start);
            else
              // frame_a.R is computed from the 3 angles 'phi'
              phi = phi_start;
            end if;
          end if;

        equation
          if enforceStates then
            Connections.root(frame_a.R);
          else
            Connections.potentialRoot(frame_a.R);
          end if;
          r_0 = frame_a.r_0;

          if not Connections.isRoot(frame_a.R) then
            // Body does not have states
            // Dummies
            Q = {0,0,0,1};
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          elseif useQuaternions then
            // Use Quaternions as states (with dynamic state selection)
            frame_a.R = Frames.from_Q(Q, Frames.Quaternions.angularVelocity2(Q, der(Q)));
            {0} = Frames.Quaternions.orientationConstraint(Q);

            // Dummies
            phi = zeros(3);
            phi_d = zeros(3);
            phi_dd = zeros(3);
          else
            // Use Cardan angles as states
            phi_d = der(phi);
            phi_dd = der(phi_d);
            frame_a.R = Frames.axesRotations(sequence_angleStates, phi, phi_d);

            // Dummies
            Q = {0,0,0,1};
          end if;

          // gravity acceleration at center of mass resolved in world frame
          g_0 = world.gravityAcceleration(frame_a.r_0 + Frames.resolve1(frame_a.R,
            r_CM));

          // translational kinematic differential equations
          v_0 = der(frame_a.r_0);
          a_0 = der(v_0);

          // rotational kinematic differential equations
          w_a = Frames.angularVelocity2(frame_a.R);
          z_a = der(w_a);

          /* Newton/Euler equations with respect to center of mass
            a_CM = a_a + cross(z_a, r_CM) + cross(w_a, cross(w_a, r_CM));
            f_CM = m*(a_CM - g_a);
            t_CM = I*z_a + cross(w_a, I*w_a);
       frame_a.f = f_CM
       frame_a.t = t_CM + cross(r_CM, f_CM);
    Inserting the first three equations in the last two results in:
  */
          frame_a.f = m*(Frames.resolve2(frame_a.R, a_0 - g_0) + cross(z_a, r_CM) +
            cross(w_a, cross(w_a, r_CM)));
          frame_a.t = I*z_a + cross(w_a, I*w_a) + cross(r_CM, frame_a.f);
        end Body;

        model BodyShape
        "Rigid body with mass, inertia tensor, different shapes for animation, and two frame connectors (12 potential states)"

          import SI = Modelica.SIunits;
          import C = Modelica.Constants;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));

          parameter Boolean animation=true
          "= true, if animation shall be enabled (show shape between frame_a and frame_b and optionally a sphere at the center of mass)";
          parameter Boolean animateSphere=true
          "= true, if mass shall be animated as sphere provided animation=true";
          parameter SI.Position r[3](start={0,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter SI.Position r_CM[3](start={0,0,0})
          "Vector from frame_a to center of mass, resolved in frame_a";
          parameter SI.Mass m(min=0, start = 1) "Mass of rigid body";
          parameter SI.Inertia I_11(min=0) = 0.001
          " (1,1) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_22(min=0) = 0.001
          " (2,2) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_33(min=0) = 0.001
          " (3,3) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_21(min=-C.inf) = 0
          " (2,1) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_31(min=-C.inf) = 0
          " (3,1) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));
          parameter SI.Inertia I_32(min=-C.inf) = 0
          " (3,2) element of inertia tensor" 
            annotation (Dialog(group=
                  "Inertia tensor (resolved in center of mass, parallel to frame_a)"));

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b"
            annotation (Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time"
            annotation (Evaluate=true, Dialog(tab="Initialization"));

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame"
            annotation (Dialog(tab="Initialization"));

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)" 
            annotation (Dialog(tab="Initialization"));

          parameter Types.ShapeType shapeType="cylinder" " Type of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Position r_shape[3]={0,0,0}
          " Vector from frame_a to shape origin, resolved in frame_a" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.Axis lengthDirection=r - r_shape
          " Vector in length direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter Types.Axis widthDirection={0,1,0}
          " Vector in width direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          " Length of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance width=length/world.defaultWidthFraction
          " Width of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Distance height=width " Height of shape." 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter Types.ShapeExtra extra=0.0
          " Additional parameter depending on shapeType (see docu of Visualizers.Advanced.Shape)."
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          input Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          " Color of shape" 
            annotation (Dialog(tab="Animation", group="if animation = true", enable=animation));
          parameter SI.Diameter sphereDiameter=2*width " Diameter of sphere" 
            annotation (Dialog(tab="Animation", group=
                  "if animation = true and animateSphere = true",
                  enable=animation and animateSphere));
          input Types.Color sphereColor=color " Color of sphere of mass" 
            annotation (Dialog(tab="Animation", group=
                  "if animation = true and animateSphere = true", enable=animation and animateSphere));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(tab="Animation", group=
                  "if animation = true", enable=animation));
          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)"
            annotation (Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states"
            annotation (Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states"
             annotation (Evaluate=true, Dialog(tab="Advanced", enable=not 
                  useQuaternions));
          annotation (
            Documentation(info="<HTML>
<p>
<b>Rigid body</b> with mass and inertia tensor and <b>two frame connectors</b>.
All parameter vectors have to be resolved in frame_a.
The <b>inertia tensor</b> has to be defined with respect to a
coordinate system that is parallel to frame_a with the
origin at the center of mass of the body. The coordinate system <b>frame_b</b>
is always parallel to <b>frame_a</b>.
</p>
<p>
By default, this component is visualized by any <b>shape</b> that can be
defined with Modelica.Mechanics.MultiBody.Visualizers.FixedShape. This shape is placed
between frame_a and frame_b (default: length(shape) = Frames.length(r)).
Additionally a <b>sphere</b> may be visualized that has
its center at the center of mass.
Note, that
the animation may be switched off via parameter animation = <b>false</b>.
</p>
<IMG SRC=\"../Images/MultiBody/BodyShape.png\" ALT=\"Parts.BodyShape\">
<p>
The following shapes can be defined via parameter <b>shapeType</b>,
e.g., shapeType=\"cone\":
</p>
<IMG SRC=\"../Images/MultiBody/FixedShape.png\" ALT=\"Visualizers.FixedShape\">
<p>
A BodyShape component has potential states. For details of these
states and of the \"Advanced\" menu parameters, see model
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.
</p>
</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-134,126},{126,66}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{122,-123},{-138,-73}},
                  lineColor={0,0,0},
                  textString="%=r"),
                Rectangle(
                  extent={{-100,31},{101,-30}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={0,127,255}),
                Ellipse(
                  extent={{-60,60},{60,-60}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={0,127,255}),
                Text(
                  extent={{-50,24},{55,-27}},
                  lineColor={0,0,0},
                  textString="%m"),
                Text(
                  extent={{55,12},{91,-13}},
                  lineColor={0,0,0},
                  textString="b"),
                Text(
                  extent={{-92,13},{-56,-12}},
                  lineColor={0,0,0},
                  textString="a")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-100,9},{-100,43}}, color={128,128,128}),
                Line(points={{100,0},{100,44}}, color={128,128,128}),
                Line(points={{-100,40},{90,40}}, color={135,135,135}),
                Polygon(
                  points={{90,44},{90,36},{100,40},{90,44}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-22,68},{20,40}},
                  lineColor={128,128,128},
                  textString="r"),
                Line(points={{-100,-10},{-100,-90}}, color={128,128,128}),
                Line(points={{-100,-84},{-10,-84}}, color={128,128,128}),
                Polygon(
                  points={{-10,-80},{-10,-88},{0,-84},{-10,-80}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-82,-66},{-56,-84}},
                  lineColor={128,128,128},
                  textString="r_CM"),
                Line(points={{0,-46},{0,-90}}, color={128,128,128})}));

          FixedTranslation frameTranslation(r=r, animation=false) 
            annotation (Placement(transformation(extent={{-20,-20},{20,20}}, rotation=
                   0)));
          Body body(
            r_CM=r_CM,
            m=m,
            I_11=I_11,
            I_22=I_22,
            I_33=I_33,
            I_21=I_21,
            I_31=I_31,
            I_32=I_32,
            animation=false,
            sequence_start=sequence_start,
            angles_fixed=angles_fixed,
            angles_start=angles_start,
            w_0_fixed=w_0_fixed,
            w_0_start=w_0_start,
            z_0_fixed=z_0_fixed,
            z_0_start=z_0_start,
            useQuaternions=useQuaternions,
            enforceStates=enforceStates,
            sequence_angleStates=sequence_angleStates) 
            annotation (Placement(transformation(extent={{-27.3333,-70.3333},{13,-30}},
                  rotation=0)));
      protected
          outer Modelica.Mechanics.MultiBody.World world;
          Visualizers.Advanced.Shape shape1(
            shapeType=shapeType,
            color=color,
            specularCoefficient=specularCoefficient,
            length=length,
            width=width,
            height=height,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            r_shape=r_shape,
            extra=extra,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
          Visualizers.Advanced.Shape shape2(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape=r_CM - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation and animateSphere;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);
          connect(frame_a, frameTranslation.frame_a) 
            annotation (Line(
              points={{-100,0},{-20,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_b, frameTranslation.frame_b) 
            annotation (Line(
              points={{100,0},{20,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a, body.frame_a) annotation (Line(
              points={{-100,0},{-60,0},{-60,-50.1666},{-27.3333,-50.1666}},
              color={95,95,95},
              thickness=0.5));
        end BodyShape;

        model BodyBox
        "Rigid body with box shape. Mass and animation properties are computed from box data and density (12 potential states)"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;

          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show box between frame_a and frame_b)";
          parameter SI.Position r[3](start={0.1,0,0})
          "Vector from frame_a to frame_b resolved in frame_a";
          parameter SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to box origin, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection=r - r_shape
          "Vector in length direction of box, resolved in frame_a" 
            annotation (Evaluate=true);
          parameter Modelica.Mechanics.MultiBody.Types.Axis widthDirection={0,1,0}
          "Vector in width direction of box, resolved in frame_a" 
            annotation (Evaluate=true);
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape) "Length of box";
          parameter SI.Distance width=length/world.defaultWidthFraction
          "Width of box";
          parameter SI.Distance height=width "Height of box";
          parameter SI.Distance innerWidth=0
          "Width of inner box surface (0 <= innerWidth <= width)";
          parameter SI.Distance innerHeight=innerWidth
          "Height of inner box surface (0 <= innerHeight <= height)";
          parameter SI.Density density = 7700
          "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)";
          input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of box" 
            annotation (Dialog(enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(enable=animation));

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b"
            annotation (Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time"
            annotation (Evaluate=true, Dialog(tab="Initialization"));

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame"
            annotation (Dialog(tab="Initialization"));

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)" 
            annotation (Dialog(tab="Initialization"));

          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)"
            annotation (Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states"
            annotation (Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states"
             annotation (Evaluate=true, Dialog(tab="Advanced", enable=not 
                  useQuaternions));

          final parameter SI.Mass mo(min=0)=density*length*width*height
          "Mass of box without hole";
          final parameter SI.Mass mi(min=0)=density*length*innerWidth*innerHeight
          "Mass of hole of box";
          final parameter SI.Mass m(min=0)=mo - mi "Mass of box";
          final parameter Frames.Orientation R=Frames.from_nxy(r, widthDirection)
          "Orientation object from frame_a to coordinates system spanned by r and widthDirection";
          final parameter SI.Position r_CM[3]=Modelica.Math.Vectors.normalize(
                                                               r)*length/2
          "Position vector from origin of frame_a to center of mass, resolved in frame_a";
          final parameter SI.Inertia I[3, 3]=Frames.resolveDyade1(R, diagonal({mo*(
              width*width + height*height) - mi*(innerWidth*innerWidth + innerHeight*
              innerHeight),mo*(length*length + height*height) - mi*(length*length +
              innerHeight*innerHeight),mo*(length*length + width*width) - mi*(length*
              length + innerWidth*innerWidth)}/12))
          "Inertia tensor of body box with respect to center of mass, parallel to frame_a";
          Body body(
            animation=false,
            r_CM=r_CM,
            m=m,
            I_11=I[1, 1],
            I_22=I[2, 2],
            I_33=I[3, 3],
            I_21=I[2, 1],
            I_31=I[3, 1],
            I_32=I[3, 2],
            sequence_start=sequence_start,
            angles_fixed=angles_fixed,
            angles_start=angles_start,
            w_0_fixed=w_0_fixed,
            w_0_start=w_0_start,
            z_0_fixed=z_0_fixed,
            z_0_start=z_0_start,
            useQuaternions=useQuaternions,
            enforceStates=enforceStates,
            sequence_angleStates=sequence_angleStates) 
            annotation (Placement(transformation(extent={{-30,-80},{10,-40}},
                  rotation=0)));
          FixedTranslation frameTranslation(
            r=r,
            animation=animation,
            shapeType="box",
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            color=color,
           specularCoefficient=specularCoefficient) annotation (Placement(
                transformation(extent={{-30,-20},{10,20}}, rotation=0)));
          annotation (
            Documentation(info="<HTML>
<p>
<b>Rigid body</b> with <b>box</b> shape.
The mass properties of the body (mass, center of mass,
inertia tensor) are computed
from the box data. Optionally, the box may be hollow.
The (outer) box shape is by default used in the animation.
The hollow part is not shown in the animation.
The two connector frames <b>frame_a</b> and <b>frame_b</b>
are always parallel to each other. Example of component
animation (note, that
the animation may be switched off via parameter animation = <b>false</b>):
</p>
<IMG SRC=\"../Images/MultiBody/BodyBox.png\" ALT=\"Parts.BodyBox\">
<p>
A BodyBox component has potential states. For details of these
states and of the \"Advanced\" menu parameters, see model
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.</p>
</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Polygon(
                  points={{100,40},{100,-30},{90,-40},{90,30},{100,40}},
                  lineColor={0,95,191},
                  fillColor={0,95,191},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-100,30},{90,-40}},
                  lineColor={0,127,255},
                  pattern=LinePattern.None,
                  fillColor={0,127,255},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{-100,30},{-90,40},{100,40},{90,30},{-100,30}},
                  lineColor={0,95,191},
                  fillColor={0,95,191},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-129,100},{131,40}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{130,-98},{-130,-48}},
                  lineColor={0,0,0},
                  textString="%=r"),
                Text(
                  extent={{52,8},{88,-17}},
                  lineColor={0,0,0},
                  textString="b"),
                Text(
                  extent={{-87,12},{-51,-13}},
                  lineColor={0,0,0},
                  textString="a")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);

          assert(innerWidth <= width,
            "parameter innerWidth is greater as parameter width");
          assert(innerHeight <= height,
            "parameter innerHeight is greater as paraemter height");
          connect(frameTranslation.frame_a, frame_a) annotation (Line(
              points={{-30,0},{-100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frameTranslation.frame_b, frame_b) annotation (Line(
              points={{10,0},{100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a, body.frame_a) annotation (Line(
              points={{-100,0},{-70,0},{-70,-60},{-30,-60}},
              color={95,95,95},
              thickness=0.5));
        end BodyBox;

        model BodyCylinder
        "Rigid body with cylinder shape. Mass and animation properties are computed from cylinder data and density (12 potential states)"

          import SI = Modelica.SIunits;
          import NonSI = Modelica.SIunits.Conversions.NonSIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{
                    -116,-16},{-84,16}}, rotation=0)));
          Interfaces.Frame_b frame_b
          "Coordinate system fixed to the component with one cut-force and cut-torque"
                                     annotation (Placement(transformation(extent={{84,
                    -16},{116,16}}, rotation=0)));
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show cylinder between frame_a and frame_b)";
          parameter SI.Position r[3](start={0.1,0,0})
          "Vector from frame_a to frame_b, resolved in frame_a";
          parameter SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to cylinder origin, resolved in frame_a";
          parameter Modelica.Mechanics.MultiBody.Types.Axis lengthDirection=r - r_shape
          "Vector in length direction of cylinder, resolved in frame_a" 
            annotation (Evaluate=true);
          parameter SI.Length length=Modelica.Math.Vectors.length(
                                                   r - r_shape)
          "Length of cylinder";
          parameter SI.Distance diameter=length/world.defaultWidthFraction
          "Diameter of cylinder";
          parameter SI.Distance innerDiameter=0
          "Inner diameter of cylinder (0 <= innerDiameter <= Diameter)";
          parameter SI.Density density = 7700
          "Density of cylinder (e.g., steel: 7700 .. 7900, wood : 400 .. 800)";
          input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of cylinder"   annotation (Dialog(enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(enable=animation));

          SI.Position r_0[3](start={0,0,0}, each stateSelect=if enforceStates then 
                      StateSelect.always else StateSelect.avoid)
          "Position vector from origin of world frame to origin of frame_a" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=if enforceStates then StateSelect.always else 
                      StateSelect.avoid)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" 
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
            annotation(Dialog(tab="Initialization", __Dymola_initialDialog=true));

          parameter Boolean angles_fixed = false
          "= true, if angles_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.Angle angles_start[3]={0,0,0}
          "Initial values of angles to rotate frame_a around 'sequence_start' axes into frame_b"
            annotation (Dialog(tab="Initialization"));
          parameter Types.RotationSequence sequence_start={1,2,3}
          "Sequence of rotations to rotate frame_a into frame_b at initial time"
            annotation (Evaluate=true, Dialog(tab="Initialization"));

          parameter Boolean w_0_fixed = false
          "= true, if w_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularVelocity w_0_start[3]={0,0,0}
          "Initial or guess values of angular velocity of frame_a resolved in world frame"
            annotation (Dialog(tab="Initialization"));

          parameter Boolean z_0_fixed = false
          "= true, if z_0_start are used as initial values, else as guess values"
            annotation(Evaluate=true, choices(__Dymola_checkBox=true), Dialog(tab="Initialization"));
          parameter SI.AngularAcceleration z_0_start[3]={0,0,0}
          "Initial values of angular acceleration z_0 = der(w_0)" 
            annotation (Dialog(tab="Initialization"));

          parameter Boolean enforceStates=false
          " = true, if absolute variables of body object shall be used as states (StateSelect.always)"
            annotation (Dialog(tab="Advanced"));
          parameter Boolean useQuaternions=true
          " = true, if quaternions shall be used as potential states otherwise use 3 angles as potential states"
            annotation (Dialog(tab="Advanced"));
          parameter Types.RotationSequence sequence_angleStates={1,2,3}
          " Sequence of rotations to rotate world frame into frame_a around the 3 angles used as potential states"
             annotation (Evaluate=true, Dialog(tab="Advanced", enable=not 
                  useQuaternions));

          constant Real pi=Modelica.Constants.pi;
          final parameter SI.Distance radius=diameter/2 "Radius of cylinder";
          final parameter SI.Distance innerRadius=innerDiameter/2
          "Inner-Radius of cylinder";
          final parameter SI.Mass mo(min=0)=density*pi*length*radius*radius
          "Mass of cylinder without hole";
          final parameter SI.Mass mi(min=0)=density*pi*length*innerRadius*innerRadius
          "Mass of hole of cylinder";
          final parameter SI.Inertia I22=(mo*(length*length + 3*radius*radius) - mi*(
              length*length + 3*innerRadius*innerRadius))/12
          "Inertia with respect to axis through center of mass, perpendicular to cylinder axis";
          final parameter SI.Mass m(min=0)=mo - mi "Mass of cylinder";
          final parameter Frames.Orientation R=Frames.from_nxy(r, {0,1,0})
          "Orientation object from frame_a to frame spanned by cylinder axis and axis perpendicular to cylinder axis";
          final parameter SI.Position r_CM[3]=Modelica.Math.Vectors.normalize(
                                                               r)*length/2
          "Position vector from frame_a to center of mass, resolved in frame_a";
          final parameter SI.Inertia I[3, 3]=Frames.resolveDyade1(R, diagonal({(mo*
              radius*radius - mi*innerRadius*innerRadius)/2,I22,I22}))
          "Inertia tensor of cylinder with respect to center of mass, resolved in frame parallel to frame_a";

          Body body(
            r_CM=r_CM,
            m=m,
            I_11=I[1, 1],
            I_22=I[2, 2],
            I_33=I[3, 3],
            I_21=I[2, 1],
            I_31=I[3, 1],
            I_32=I[3, 2],
            animation=false,
            sequence_start=sequence_start,
            angles_fixed=angles_fixed,
            angles_start=angles_start,
            w_0_fixed=w_0_fixed,
            w_0_start=w_0_start,
            z_0_fixed=z_0_fixed,
            z_0_start=z_0_start,
            useQuaternions=useQuaternions,
            enforceStates=enforceStates,
            sequence_angleStates=sequence_angleStates) 
            annotation (Placement(transformation(extent={{-30,-80},{10,-40}},
                  rotation=0)));
          FixedTranslation frameTranslation(
            r=r,
            animation=animation,
            shapeType="pipecylinder",
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            length=length,
            width=diameter,
            height=diameter,
            extra=innerDiameter/diameter,
            color=color,
            specularCoefficient=specularCoefficient,
            widthDirection={0,1,0}) annotation (Placement(transformation(extent={{-30,
                    -20},{10,20}}, rotation=0)));
          annotation (
            Documentation(info="<HTML>
<p>
<b>Rigid body</b> with <b>cylinder</b> shape.
The mass properties of the body (mass, center of mass,
inertia tensor) are computed
from the cylinder data. Optionally, the cylinder may be hollow.
The cylinder shape is by default used in the animation.
The two connector frames <b>frame_a</b> and <b>frame_b</b>
are always parallel to each other. Example of component
animation (note, that
the animation may be switched off via parameter animation = <b>false</b>):
</p>
<IMG SRC=\"../Images/MultiBody/BodyCylinder.png\" ALT=\"Parts.BodyCylinder\">
<p>
A BodyCylinder component has potential states. For details of these
states and of the \"Advanced\" menu parameters, see model
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Parts.Body\">MultiBody.Parts.Body</a>.</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-129,100},{131,40}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{130,-98},{-130,-48}},
                  lineColor={0,0,0},
                  textString="%=r"),
                Rectangle(
                  extent={{-100,40},{100,-40}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.HorizontalCylinder,
                  fillColor={0,127,255}),
                Text(
                  extent={{-87,13},{-51,-12}},
                  lineColor={0,0,0},
                  textString="a"),
                Text(
                  extent={{51,12},{87,-13}},
                  lineColor={0,0,0},
                  textString="b")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));

      protected
          outer Modelica.Mechanics.MultiBody.World world;
        equation
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);

          assert(innerDiameter < diameter,
            "parameter innerDiameter is greater as parameter diameter.");
          connect(frameTranslation.frame_a, frame_a) annotation (Line(
              points={{-30,0},{-100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frameTranslation.frame_b, frame_b) annotation (Line(
              points={{10,0},{100,0}},
              color={95,95,95},
              thickness=0.5));
          connect(frame_a, body.frame_a) annotation (Line(
              points={{-100,0},{-70,0},{-70,-60},{-30,-60}},
              color={95,95,95},
              thickness=0.5));
        end BodyCylinder;

        model PointMass
        "Rigid body where body rotation and inertia tensor is neglected (6 potential states)"

          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          Interfaces.Frame_a frame_a
          "Coordinate system fixed at center of mass point" 
            annotation (Placement(transformation(extent={{-16,-16},{16,16}}, rotation=
                   0)));
          parameter Boolean animation=true
          "= true, if animation shall be enabled (show sphere)";
          parameter SI.Mass m(min=0) "Mass of mass point";
          input SI.Diameter sphereDiameter=world.defaultBodyDiameter
          "Diameter of sphere"   annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          input Types.Color sphereColor=Modelica.Mechanics.MultiBody.Types.Defaults.BodyColor
          "Color of sphere"   annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(
              tab="Animation",
              group="if animation = true",
              enable=animation));
          parameter StateSelect stateSelect=StateSelect.avoid
          "Priority to use frame_a.r_0, v_0 (= der(frame_a.r_0)) as states"   annotation(Dialog(tab="Advanced"));

          SI.Position r_0[3](start={0,0,0}, each stateSelect=stateSelect)
          "Position vector from origin of world frame to origin of frame_a, resolved in world frame"
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));
          SI.Velocity v_0[3](start={0,0,0}, each stateSelect=stateSelect)
          "Absolute velocity of frame_a, resolved in world frame (= der(r_0))" 
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));
          SI.Acceleration a_0[3](start={0,0,0})
          "Absolute acceleration of frame_a resolved in world frame (= der(v_0))"
            annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{132,-102},{-129,-56}},
                  lineColor={0,0,0},
                  textString="m=%m"),
                Text(
                  extent={{-128,110},{132,55}},
                  textString="%name",
                  lineColor={0,0,255}),
                Ellipse(
                  extent={{-50,50},{50,-50}},
                  lineColor={0,0,0},
                  fillPattern=FillPattern.Sphere,
                  fillColor={0,127,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics),
            Documentation(info="<HTML>
<p>
<b>Rigid body</b> where the inertia tensor is neglected.
This body is
solely defined by its mass.
By default, this component is visualized by a <b>sphere</b> that has
its center at frame_a. Note, that
the animation may be switched off via parameter animation = <b>false</b>.
</p>

<p>
Every PointMass has potential states. If possible a tool will select
the states of joints and not the states of PointMasss because this is
usually the most efficient choice. In this case the position and
velocity of frame_a of the body will be computed
by the component that is connected to frame_a. However, if a PointMass is moving
freely in space, variables of the PointMass have to be used as states. The potential
states are: The <b>position vector</b> frame_a.r_0 from the origin of the
world frame to the origin of frame_a of the body, resolved in
the world frame and the <b>absolute velocity</b> v_0 of the origin of
frame_a, resolved in the world frame (= der(frame_a.r_0)).
</p>

<p>
Whether or not variables of the body are used as states is usually
automatically selected by the Modelica translator. If parameter
<b>enforceStates</b> is set to <b>true</b> in the \"Advanced\" menu,
then PointMass variables frame_a.r_0 and der(frame_a.r_0)
are forced to be used as states.
</p>
</HTML>"));

      protected
          outer Modelica.Mechanics.MultiBody.World world;

          // Declarations for animation
          Visualizers.Advanced.Shape sphere(
            shapeType="sphere",
            color=sphereColor,
            specularCoefficient=specularCoefficient,
            length=sphereDiameter,
            width=sphereDiameter,
            height=sphereDiameter,
            lengthDirection={1,0,0},
            widthDirection={0,1,0},
            r_shape= - {1,0,0}*sphereDiameter/2,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          // If any possible, do not use the connector as root
          Connections.potentialRoot(frame_a.R, 10000);

          if Connections.isRoot(frame_a.R) then
             assert(cardinality(frame_a)==0, "
A Modelica.Mechanics.MultiBody.Parts.PointMass model is connected in
a way, so that no equations are present to compute frame_a.R
(the orientation object in the connector). Setting frame_a.R to
an arbitrary value in the PointMass model, might lead to a wrong
overall model, depending on how the PointMass model is used.
   You can avoid this message, by providing equations that
compute the orientation object, e.g., by using the
Modelica.Mechanics.MultiBody.Joints.FreeMotion joint.
   If a PointMass model is not connected at all, the
orientation object is set to a unit rotation. But this is
the only case where this is done.
");
             frame_a.R = Frames.nullRotation();
          else
             frame_a.t = zeros(3);
          end if;

          // Newton equation: f = m*(a-g)
          r_0 = frame_a.r_0;
          v_0 = der(r_0);
          a_0 = der(v_0);
          frame_a.f = m*Frames.resolve2(frame_a.R, a_0 - world.gravityAcceleration(r_0));
        end PointMass;

        model Mounting1D
        "Propagate 1-dim. support torque to 3-dim. system (provided world.driveTrainMechanics3D=true)"
          parameter Modelica.SIunits.Angle phi0=0
          "Fixed offset angle of housing";
          parameter Modelica.Mechanics.MultiBody.Types.Axis n={1,0,0}
          "Axis of rotation = axis of support torque (resolved in frame_a)";

          Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b
          "(right) flange fixed in housing"   annotation (Placement(transformation(
                  extent={{110,10},{90,-10}}, rotation=0)));
          Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a if world.driveTrainMechanics3D
          "Frame in which housing is fixed (connector is removed, if world.driveTrainMechanics3D=false)"
            annotation (Placement(transformation(
                origin={0,-100},
                extent={{-20,-20},{20,20}},
                rotation=90)));
          annotation (
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                    100}}), graphics={
                Rectangle(
                  extent={{-80,-60},{80,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-146,60},{154,20}},
                  lineColor={0,0,255},
                  textString="%name"),
                Line(points={{80,-60},{40,-100}}, color={0,0,0}),
                Line(points={{40,-60},{0,-100}}, color={0,0,0}),
                Line(points={{0,-60},{-40,-100}}, color={0,0,0}),
                Line(points={{-40,-60},{-80,-100}}, color={0,0,0}),
                Line(points={{0,-60},{0,0}}, color={0,0,0}),
                Line(points={{0,0},{90,0}}, color={0,0,0})}),
            Documentation(info="<html>
<p>This component is used to acquire support torques from a 1-dim.-rotational
mechanical system (e.g., components from Modelica.Mechanics.Rotational)
and to propagate them to a carrier body.</p>
<p>The 1-dim. support torque at <tt>flange_b</tt> is transformed into 3-dim. space under
consideration of the rotation axis, parameter <tt>n</tt>, which has to be given in the
local coordinate system of <tt>frame_a</tt>.</p>
<p>All components of a 1-dim.-rotational mechanical system that are connected to <b>a</b> common
<b>Mounting1D</b> element need to have the same axis of rotation
along parameter vector <tt>n</tt>. This means that, e.g., bevel
gears where the axis of rotation of <tt>flange_a</tt> and
<tt>flange_b</tt> are different cannot be described properly by
connecting to the <b>Mounting1D</b> component. In this case, a combination of several
<b>Mounting1D</b> components or the component <b>BevelGear1D</b> should be used.</p>
<p><b>Reference</b><br>
<span style=\"font-variant:small-caps\">Schweiger</span>, Christian ;
<span style=\"font-variant:small-caps\">Otter</span>, Martin:
<a href=\"http://www.modelica.org/Conference2003/papers/h06_Schweiger_powertrains_v5.pdf\">Modelling
3D Mechanical Effects of 1-dim. Powertrains</a>. In: <i>Proceedings of the 3rd International
Modelica Conference</i>. Link&ouml;ping : The Modelica Association and Link&ouml;ping University,
November 3-4, 2003, pp. 149-158</p>
</HTML>
"),         Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics));
      protected
          outer Modelica.Mechanics.MultiBody.World world;

          encapsulated model Housing
            import Modelica;
            input Modelica.SIunits.Torque t[3];
            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a 
                                       annotation (Placement(transformation(extent={{
                      -116,-16},{-84,16}}, rotation=0)));
            annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics={Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid), Text(
                    extent={{-150,110},{150,150}},
                    lineColor={0,0,255},
                    textString="%name")}));
          equation
            frame_a.f=zeros(3);
            frame_a.t=t;
          end Housing;
          Housing housing(t=-n*flange_b.tau) if world.driveTrainMechanics3D 
                          annotation (Placement(transformation(extent={{20,-60},{40,-40}},
                  rotation=0)));
        equation
          flange_b.phi = phi0;
          connect(housing.frame_a, frame_a) annotation (Line(
              points={{20,-50},{0,-50},{0,-100}},
              color={95,95,95},
              thickness=0.5,
              smooth=Smooth.None));
        end Mounting1D;

          model RollingWheel
        "Ideal rolling wheel on flat surface z=0 (5 positional, 3 velocity degrees of freedom)"
            import SI = Modelica.SIunits;

            parameter Boolean animation=true
          "= true, if animation of wheel shall be enabled";

            parameter SI.Radius wheelRadius "Radius of wheel";
            parameter SI.Mass wheelMass "Mass of wheel";
            parameter SI.Inertia wheel_I_axis "Inertia along the wheel axis";
            parameter SI.Inertia wheel_I_long
          "Inertia perpendicular to the wheel axis";
            parameter StateSelect stateSelect=StateSelect.always
          "Priority to use generalized coordinates as states"     annotation(HideResult=true,Evaluate=true);

            SI.Position x(start=0, fixed = true, stateSelect=stateSelect)
          "x-coordinate of wheel axis";

            SI.Position y(start=0, fixed = true, stateSelect=stateSelect)
          "y-coordinate of wheel axis";

            SI.Angle angles[3](start={0,0,0}, each fixed = true, each stateSelect=stateSelect)
          "Angles to rotate world-frame in to frame_a around z-, y-, x-axis" 
              annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));

            SI.AngularVelocity der_angles[3](start={0,0,0}, each fixed = true, each stateSelect=stateSelect)
          "Derivative of angles" 
              annotation(Dialog(group="Initialization", __Dymola_initialDialog=true));

            parameter SI.Distance width = 0.035 "Width of wheel" annotation (Dialog(
                tab="Animation",
                group="if animation = true", enable=animation));
            parameter Real hollowFraction = 0.8
          "1.0: Completely hollow, 0.0: rigid cylinder"       annotation (Dialog(
                tab="Animation",
                group="if animation = true", enable=animation));
            parameter Modelica.Mechanics.MultiBody.Types.Color wheelColor={30,30,30}
          "Color of wheel"      annotation (Dialog(
                tab="Animation",
                group="if animation = true",
                enable=animation));

            Modelica.Mechanics.MultiBody.Parts.Body body(
              final r_CM={0,0,0},
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long,
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false) 
              annotation (Placement(transformation(extent={{20,-10},{40,10}})));

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame_a
          "Frame fixed in wheel center point. y-axis: along wheel axis, z-Axis: upwards, "
              annotation (Placement(transformation(extent={{-16,-16},{16,16}})));
            Modelica.Mechanics.MultiBody.Joints.RollingWheel rollingWheel(wheelRadius=wheelRadius,
                stateSelect=StateSelect.avoid) 
              annotation (Placement(transformation(extent={{-60,-60},{-40,-40}})));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape fixedShape(
              final animation=animation,
              final r_shape={0,-width,0},
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final length=2*width,
              final width=2*wheelRadius,
              final height=2*wheelRadius,
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe") if 
                            animation annotation (Placement(transformation(extent={{20,20},{40,40}})));

            annotation (defaultComponentName="wheel",Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}),      graphics), Icon(coordinateSystem(
                    preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                  graphics={
                  Rectangle(
                    extent={{-100,-80},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{-80,80},{80,-80}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-150,122},{150,82}},
                    textString="%name",
                    lineColor={0,0,255})}));
          equation
            rollingWheel.x = x;
            rollingWheel.y = y;
            rollingWheel.angles = angles;
            rollingWheel.der_angles = der_angles;

            connect(body.frame_a, frame_a) annotation (Line(
                points={{20,0},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(rollingWheel.frame_a, frame_a)      annotation (Line(
                points={{-50,-50},{-25,-50},{-25,0},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(fixedShape.frame_a, frame_a) annotation (Line(
                points={{20,30},{0,30},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
          end RollingWheel;

          model RollingWheelSet
        "Ideal rolling wheel set consisting of two ideal rolling wheels connected together by an axis"
            import SI = Modelica.SIunits;
           Modelica.Mechanics.MultiBody.Interfaces.Frame_a frameMiddle
          "Frame fixed in middle of axis connecting both wheels (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{-16,16},{16,-16}}),
                  iconTransformation(extent={{-16,-16},{16,16}})));

            parameter Boolean animation=true
          "= true, if animation of wheel set shall be enabled";

            parameter SI.Radius wheelRadius "Radius of one wheel";
            parameter SI.Mass wheelMass "Mass of one wheel";
            parameter SI.Inertia wheel_I_axis "Inertia along one wheel axis";
            parameter SI.Inertia wheel_I_long
          "Inertia perpendicular to one wheel axis";
            parameter SI.Distance wheelDistance
          "Distance between the two wheels";
             parameter StateSelect stateSelect = StateSelect.always
          "Priority to use the generalized coordinates as states";

            Modelica.SIunits.Position x(start=0, fixed=true, stateSelect=stateSelect)
          "x coordinate of center between wheels";
            Modelica.SIunits.Position y(start=0, fixed=true, stateSelect=stateSelect)
          "y coordinate of center between wheels";
            Modelica.SIunits.Angle phi(start=0, fixed=true, stateSelect=stateSelect)
          "Orientation angle of wheel axis along z-axis";
            Modelica.SIunits.Angle theta1(start=0, fixed=true, stateSelect=stateSelect)
          "Angle of wheel 1";
            Modelica.SIunits.Angle theta2(start=0, fixed=true, stateSelect=stateSelect)
          "Angle of wheel 2";
            Modelica.SIunits.AngularVelocity der_theta1(start=0, fixed=true, stateSelect=stateSelect)
          "Derivative of theta 1";
            Modelica.SIunits.AngularVelocity der_theta2(start=0, fixed=true, stateSelect=stateSelect)
          "Derivative of theta 2";

            parameter SI.Distance wheelWidth = 0.01 "Width of one wheel" annotation (Dialog( tab="Animation",
                group="if animation = true", enable=animation));
            parameter Real hollowFraction = 0.8
          "1.0: Completely hollow, 0.0: rigid cylinder"       annotation (Dialog(
                tab="Animation",
                group="if animation = true", enable=animation));
            parameter Modelica.Mechanics.MultiBody.Types.Color wheelColor={30,30,30}
          "Color of wheels"      annotation (Dialog(
                tab="Animation",
                group="if animation = true",
                enable=animation));

            annotation (defaultComponentName="wheelSet",Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics={
                  Rectangle(
                    extent={{-100,-80},{100,-100}},
                    lineColor={0,0,0},
                    fillColor={175,175,175},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-146,-98},{154,-138}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Ellipse(
                    extent={{42,80},{118,-80}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Sphere),
                  Rectangle(
                    extent={{-62,2},{64,-6}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{-118,80},{-42,-80}},
                    lineColor={0,0,0},
                    fillColor={215,215,215},
                    fillPattern=FillPattern.Sphere),
                  Line(
                    points={{86,24},{64,24},{64,10},{56,10}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{86,-24},{64,-24},{64,-12},{56,-12}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{-96,100},{-80,100},{-80,4}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{100,100},{80,100},{80,-2}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{0,72},{0,40},{-20,40},{-20,2}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Line(
                    points={{0,40},{20,40},{20,2}},
                    color={0,0,0},
                    smooth=Smooth.None)}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}), graphics={
                  Line(
                    points={{0,-106},{0,-78}},
                    color={0,0,255},
                    smooth=Smooth.None),
                  Polygon(
                    points={{0,-60},{-6,-78},{6,-78},{0,-60}},
                    lineColor={0,0,255},
                    smooth=Smooth.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{12,-68},{30,-80}},
                    lineColor={0,0,255},
                    textString="x"),
                  Line(
                    points={{6,-100},{-26,-100}},
                    color={0,0,255},
                    smooth=Smooth.None),
                  Polygon(
                    points={{-22,-94},{-22,-106},{-40,-100},{-22,-94}},
                    lineColor={0,0,255},
                    smooth=Smooth.None,
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-46,-80},{-28,-92}},
                    lineColor={0,0,255},
                    textString="y")}),
              Documentation(info="<html>
<p>
Two wheels are connected by an axis and can rotate around this axis.
The wheels are rolling on the x-y plane. The coordinate system attached
to the center of the wheel axis (frameMiddle) is constrained so that it
is always parallel to the x-y plane. If all generalized coordinates are zero,
frameMiddle is parallel to the world frame.
</p>
</html>"));

            Modelica.Mechanics.MultiBody.Interfaces.Frame_a frame1
          "Frame fixed in center point of left wheel (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{-96,16},{-64,-16}}),
                  iconTransformation(extent={{-96,16},{-64,-16}})));
            Modelica.Mechanics.MultiBody.Interfaces.Frame_b frame2
          "Frame fixed in center point of right wheel (y-axis: along wheel axis, z-Axis: upwards)"
              annotation (Placement(transformation(extent={{64,16},{96,-16}})));
            Modelica.Mechanics.MultiBody.Parts.Body body2(
              final r_CM={0,0,0},
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false,
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long) 
              annotation (Placement(transformation(extent={{10,-10},{-10,10}},
                  rotation=-90,
                  origin={60,30})));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape2(
              final animation=animation,
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe",
              final r_shape={0,-wheelWidth,0},
              final length=2*wheelWidth,
              final width=2*wheelRadius,
              final height=2*wheelRadius) if 
                            animation annotation (Placement(transformation(extent={{10,-10},
                      {-10,10}},
                  rotation=90,
                  origin={60,-38})));
            Modelica.Mechanics.MultiBody.Parts.Body body1(
              final r_CM={0,0,0},
              final I_21=0,
              final I_31=0,
              final I_32=0,
              animation=false,
              final m=wheelMass,
              final I_11=wheel_I_long,
              final I_22=wheel_I_axis,
              final I_33=wheel_I_long) 
              annotation (Placement(transformation(extent={{-10,-10},{10,10}},
                  rotation=90,
                  origin={-60,30})));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape shape1(
              final animation=animation,
              final lengthDirection={0,1,0},
              final widthDirection={1,0,0},
              final color=wheelColor,
              final extra=hollowFraction,
              final shapeType="pipe",
              final r_shape={0,-wheelWidth,0},
              final length=2*wheelWidth,
              final width=2*wheelRadius,
              final height=2*wheelRadius) if 
                            animation annotation (Placement(transformation(extent={{-10,-10},
                      {10,10}},
                  rotation=-90,
                  origin={-60,-40})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis1
          "1-dim. rotational flange that drives the left wheel" 
              annotation (Placement(transformation(extent={{-110,90},{-90,110}})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_a axis2
          "1-dim. rotational flange that drives the right wheel" 
              annotation (Placement(transformation(extent={{90,90},{110,110}})));
            Modelica.Mechanics.MultiBody.Joints.RollingWheelSet wheelSetJoint(
              animation=false,
              wheelRadius=wheelRadius,
              wheelDistance=wheelDistance,
              stateSelect=StateSelect.default,
              x(fixed=false),
              y(fixed=false),
              phi(fixed=false),
              theta1(fixed=false),
              theta2(fixed=false),
              der_theta1(fixed=false),
              der_theta2(fixed=false)) 
              annotation (Placement(transformation(extent={{-10,-42},{10,-22}})));
            Modelica.Mechanics.Rotational.Interfaces.Flange_b support
          "Support of 1D axes"     annotation (Placement(transformation(extent={{-10,
                      70},{10,90}}), iconTransformation(extent={{-10,72},{10,92}})));
          equation
            wheelSetJoint.x      = x;
            wheelSetJoint.y      = y;
            wheelSetJoint.phi    = phi;
            wheelSetJoint.theta1 = theta1;
            wheelSetJoint.theta2 = theta2;
            der_theta1 = der(theta1);
            der_theta2 = der(theta2);

            connect(body2.frame_a,frame2)  annotation (Line(
                points={{60,20},{60,0},{80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(body1.frame_a, frame1) annotation (Line(
                points={{-60,20},{-60,0},{-80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(shape1.frame_a, frame1) annotation (Line(
                points={{-60,-30},{-60,0},{-80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(shape2.frame_a, frame2) annotation (Line(
                points={{60,-28},{60,0},{80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(wheelSetJoint.frame2, frame2) annotation (Line(
                points={{8,-32},{40,-32},{40,0},{80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(wheelSetJoint.frame1, frame1) annotation (Line(
                points={{-8,-32},{-40,-32},{-40,0},{-80,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
            connect(wheelSetJoint.axis1, axis1) annotation (Line(
                points={{-10,-22},{-20,-22},{-20,50},{-80,50},{-80,100},{-100,100}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(wheelSetJoint.axis2, axis2) annotation (Line(
                points={{10,-22},{24,-22},{24,50},{80,50},{80,100},{100,100}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(wheelSetJoint.support, support) annotation (Line(
                points={{0,-24},{0,-14},{16,-14},{16,58},{0,58},{0,80}},
                color={0,0,0},
                smooth=Smooth.None));
            connect(wheelSetJoint.frameMiddle, frameMiddle) annotation (Line(
                points={{0,-32},{-4,-32},{-4,0},{0,0}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
          end RollingWheelSet;
      end Parts;

      package Types
      "Constants and types with choices, especially to build menus"
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used in the
MultiBody library. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"));

        type Axis = Modelica.Icons.TypeReal[3](each final unit="1")
        "Axis vector with choices for menus"                                        annotation (
          preferedView="text",
          Evaluate=true,
          choices(
            choice={1,0,0} "{1,0,0} \"x axis\"",
            choice={0,1,0} "{0,1,0} \"y axis\"",
            choice={0,0,1} "{0,0,1} \"z axis\"",
            choice={-1,0,0} "{-1,0,0} \"negative x axis\"",
            choice={0,-1,0} "{0,-1,0} \"negative y axis\"",
            choice={0,0,-1} "{0,0,-1} \"negative z axis\""),
          Documentation(info="<html>
</html>"));

        type AxisLabel = Modelica.Icons.TypeString
        "Label of axis with choices for menus"                                            annotation (
            preferedView="text", choices(
            choice="x" "x",
            choice="y" "y",
            choice="z" "z"));

        type RotationSequence = Modelica.Icons.TypeInteger[3] (min={1,1,1}, max={3,3,3})
        "Sequence of planar frame rotations with choices for menus"   annotation (
          preferedView="text",
          Evaluate=true,
          choices(
            choice={1,2,3} "{1,2,3} \"Cardan/Tait-Bryan angles\"",
            choice={3,1,3} "{3,1,3} \"Euler angles\"",
            choice={3,2,1} "{3,2,1}"));

        type Color = Modelica.Icons.TypeInteger[3] (each min=0, each max=255)
        "RGB representation of color (will be improved with a color editor)" 
          annotation (
            Dialog(colorSelector),
            choices(
              choice={0,0,0} "{0,0,0}       \"black\"",
              choice={155,0,0} "{155,0,0}     \"dark red\"",
              choice={255,0,0} "{255,0,0 }    \"red\"",
              choice={255,65,65} "{255,65,65}   \"light red\"",
              choice={0,128,0} "{0,128,0}     \"dark green\"",
              choice={0,180,0} "{0,180,0}     \"green\"",
              choice={0,230,0} "{0,230,0}     \"light green\"",
              choice={0,0,200} "{0,0,200}     \"dark blue\"",
              choice={0,0,255} "{0,0,255}     \"blue\"",
              choice={0,128,255} "{0,128,255}   \"light blue\"",
              choice={255,255,0} "{255,255,0}   \"yellow\"",
              choice={255,0,255} "{255,0,255}   \"pink\"",
              choice={100,100,100} "{100,100,100} \"dark grey\"",
              choice={155,155,155} "{155,155,155} \"grey\"",
              choice={255,255,255} "{255,255,255} \"white\""),
          Documentation(info="<html>
<p>
Type <b>Color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of a shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
</p>
</html>"));

        type SpecularCoefficient = Modelica.Icons.TypeReal
        "Reflection of ambient light (= 0: light is completely absorbed)" 
             annotation ( min=0,
               choices(choice=0 "\"0.0 (dull)\"",choice=0.7 "\"0.7 (medium)\"", choice=1
            "\"1.0 (glossy)\""),
          Documentation(info="<html>
<p>
Type <b>SpecularCoefficient</b> defines the reflection of
ambient light on shape surfaces. If value = 0, the light
is completely absorbed. Often, 0.7 is a reasonable value.
It might be that from some viewing directions, a body is no
longer visible, if the SpecularCoefficient value is too high.
In the following image, the different values of SpecularCoefficient
are shown for a cylinder:
</p>

<p>
<img src=\"../Images/MultiBody/Visualizers/SpecularCoefficient.png\"
</p>
</html>"));

        type ShapeType = Modelica.Icons.TypeString
        "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring, dxf-file)"
           annotation ( choices(
            choice="box" "\"box\"",
            choice="sphere" "\"sphere\"",
            choice="cylinder" "\"cylinder\"",
            choice="pipecylinder" "\"pipecylinder\"",
            choice="cone" "\"cone\"",
            choice="pipe" "\"pipe\"",
            choice="beam" "\"beam\"",
            choice="gearwheel" "\"gearwheel\"",
            choice="spring" "\"spring\"",
            choice="1" "File \"1.dxf\" in current directory",
            choice="2" "File \"2.dxf\" in current directory",
            choice="3" "File \"3.dxf\" in current directory",
            choice="4" "File \"4.dxf\" in current directory",
            choice="5" "File \"5.dxf\" in current directory",
            choice="6" "File \"6.dxf\" in current directory",
            choice="7" "File \"7.dxf\" in current directory",
            choice="8" "File \"8.dxf\" in current directory",
            choice="9" "File \"9.dxf\" in current directory"),
          Documentation(info="<html>
<p>
Type <b>ShapeType</b> is used to define the shape of the
visual object as parameter String. Usually, \"shapeType\" is used
as instance name. The following
values for shapeType are possible, e.g., shapeType=\"box\":
</p>
<IMG SRC=\"../Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the Shape component.
</p>
<p>
Additionally, external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found either in the current
directory or in the directory where the Shape instance is stored
that references the DXF file.
</p>
</html>"));

        type ShapeExtra = Modelica.Icons.TypeReal
        "Reflection of ambient light (= 0: light is completely absorbed)" 
             annotation ( min=0,
          Documentation(info="<html>
<p>
This type is used in shapes of visual objects to define
extra data depending on the shape type. Usually, input
variable <b>extra</b> is used as instance name:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of variable <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the gear.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>
</html>"));

        type ResolveInFrameB = enumeration(
          world "Resolve in world frame",
          frame_b "Resolve in frame_b",
          frame_resolve
            "Resolve in frame_resolve (frame_resolve must be connected)")
        "Enumeration to define the frame in which an absolute vector is resolved (world, frame_b, frame_resolve)"
                                                     annotation (Documentation(info="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve vector in world frame</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve vector in frame_b</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve vector in frame_resolve (frame_resolve must be connected)</td></tr>
</table>
</html>"));

        type ResolveInFrameAB = enumeration(
          world "Resolve in world frame",
          frame_a "Resolve in frame_a",
          frame_b "Resolve in frame_b",
          frame_resolve
            "Resolve in frame_resolve (frame_resolve must be connected)")
        "Enumeration to define the frame in which a relative vector is resolved (world, frame_a, frame_b, frame_resolve)"
                                                     annotation (Documentation(info="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.ResolveInFrameAB.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">world</td>
    <td valign=\"top\">Resolve vector in world frame</td></tr>

<tr><td valign=\"top\">frame_a</td>
    <td valign=\"top\">Resolve vector in frame_a</td></tr>

<tr><td valign=\"top\">frame_b</td>
    <td valign=\"top\">Resolve vector in frame_b</td></tr>

<tr><td valign=\"top\">frame_resolve</td>
    <td valign=\"top\">Resolve vector in frame_resolve (frame_resolve must be connected)</td></tr>
</table>
</html>"));

        type RotationTypes = enumeration(
          RotationAxis "Rotating frame_a around an angle with a fixed axis",
          TwoAxesVectors "Resolve two vectors of frame_b in frame_a",
          PlanarRotationSequence "Planar rotation sequence")
        "Enumeration defining in which way the fixed orientation of frame_b with respect to frame_a is specified"
            annotation (Evaluate=true,
              Documentation(info="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.RotationTypes.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">RotationAxis</td>
    <td valign=\"top\">frame_b is defined by rotating the coordinate system along
        an axis fixed in frame_a and with a fixed angle.</td></tr>

<tr><td valign=\"top\">TwoAxesVectors</td>
    <td valign=\"top\">frame_b is defined by resolving two vectors of frame_b in frame_a.</td></tr>

<tr><td valign=\"top\">PlanarRotationSequence</td>
    <td valign=\"top\">frame_b is defined by rotating the coordinate system along
        3 consecutive axes vectors with fixed rotation angles
        (e.g. Cardan or Euler angle sequence rotation).</td></tr>
</table>
</html>"));

        type GravityTypes = enumeration(
          NoGravity "No gravity field",
          UniformGravity "Uniform gravity field",
          PointGravity "Point gravity field")
        "Enumeration defining the type of the gravity field" 
            annotation (Documentation(info="<html>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>Types.GravityTypes.</b></th><th><b>Meaning</b></th></tr>
<tr><td valign=\"top\">NoGravity</td>
    <td valign=\"top\">No gravity field</td></tr>

<tr><td valign=\"top\">UniformGravity</td>
    <td valign=\"top\">Gravity field is described by a vector of constant gravity acceleration</td></tr>

<tr><td valign=\"top\">PointGravity</td>
    <td valign=\"top\">Central gravity field. The gravity acceleration vector is directed to
        the field center and the gravity is proportional to 1/r^2, where
        r is the distance to the field center.</td></tr>
</table>
</html>"));

        package Defaults
        "Default settings of the MultiBody library via constants"
          annotation ( Documentation(info="<html>
<p>
This package contains constants used as default setting
in the MultiBody library.
</p>
</html>"));
          extends Modelica.Icons.Library;

          constant Types.Color BodyColor={0,128,255}
          "Default color for body shapes that have mass (light blue)";

          constant Types.Color RodColor={155,155,155}
          "Default color for massless rod shapes (grey)";

          constant Types.Color JointColor={255,0,0}
          "Default color for elementary joints (red)";

          constant Types.Color ForceColor={0,128,0}
          "Default color for force arrow (dark green)";

          constant Types.Color TorqueColor={0,128,0}
          "Default color for torque arrow (dark green)";

          constant Types.Color SpringColor={0,0,255}
          "Default color for a spring (blue)";

          constant Types.Color SensorColor={255,255,0}
          "Default color for sensors (yellow)";

          constant Types.Color FrameColor={0,0,0}
          "Default color for frame axes and labels (black)";

          constant Types.Color ArrowColor={0,0,255}
          "Default color for arrows and double arrows (blue)";

          constant Real FrameHeadLengthFraction=5.0
          "Frame arrow head length / arrow diameter";

          constant Real FrameHeadWidthFraction=3.0
          "Frame arrow head width / arrow diameter";

          constant Real FrameLabelHeightFraction=3.0
          "Height of frame label / arrow diameter";

          constant Real ArrowHeadLengthFraction=4.0
          "Arrow head length / arrow diameter";

          constant Real ArrowHeadWidthFraction=3.0
          "Arrow head width / arrow diameter";

          constant SI.Diameter BodyCylinderDiameterFraction=3
          "Default for body cylinder diameter as a fraction of body sphere diameter";

          constant Real JointRodDiameterFraction=2
          "Default for rod diameter as a fraction of joint sphere diameter attached to rod";
        end Defaults;
      end Types;

      package Visualizers "3-dimensional visual objects used for animation"
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<HTML>
<p>
Package <b>Visualizers</b> contains components to visualize
3-dimensional shapes. These components are the basis for the
animation features of the MultiBody library.
<p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape\">FixedShape</a><br>
             <a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedShape2\">FixedShape2</a></td>
      <td valign=\"top\">Animation shape of a part with fixed sizes. FixedShape2 has additionally
          a frame_b for easier connection to further visual objects.
          The following shape types are supported:<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.FixedShape\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedFrame\">FixedFrame</a></td>
      <td valign=\"top\">Visualizing a coordinate system including axes labels with fixed sizes:<br>
      <IMG SRC=\"../Images/MultiBody/FixedFrame2.png\"
       ALT=\"model Visualizers.FixedFrame\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.FixedArrow\">FixedArrow</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.SignalArrow\">SignalArrow</a></td>
      <td valign=\"top\">Visualizing an arrow. Model \"FixedArrow\" provides
      a fixed sized arrow, model \"SignalArrow\" provides
      an arrow with dynamically varying length that is defined
      by an input signal vector:<br>
      <IMG SRC=\"../Images/MultiBody/Visualizers/Arrow.png\" \">
      </td>
  </tr>
<tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced\">Advanced</a></td>
      <td valign=\"top\"> <b>Package</b> that contains components to visualize
          3-dimensional shapes where all parts of the shape
          can vary dynamically. Basic knowledge of Modelica is
          needed in order to utilize the components of this package.
      </td>
  </tr>
</table>
<p>
The colors of the visualization components are declared with
the predefined type <b>MultiBody.Types.Color</b>.
This is a vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given as Integer[3] in the ranges 0 .. 255,
respectively.
</p>
</HTML>"));

        model FixedShape
        "Animation shape of a part with fixed shape type and dynamically varying shape definition"
          import SI = Modelica.SIunits;
          import Modelica.Mechanics.MultiBody.Types;
          extends Modelica.Mechanics.MultiBody.Interfaces.PartialVisualizer;

          parameter Boolean animation=true
          "= true, if animation shall be enabled";
          parameter Types.ShapeType shapeType="box" "Type of shape" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Position r_shape[3]={0,0,0}
          "Vector from frame_a to shape origin, resolved in frame_a" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.Axis lengthDirection={1,0,0}
          "Vector in length direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
          input Types.Axis widthDirection={0,1,0}
          "Vector in width direction of shape, resolved in frame_a" 
            annotation (Evaluate=true, Dialog(group="if animation = true", enable=animation));
          input SI.Distance length(start=1) "Length of shape" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Distance width(start=0.1) "Width of shape" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input SI.Distance height(start=0.1) "Height of shape" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
          "Color of shape" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.ShapeExtra extra=0.0
          "Additional data for cylinder, cone, pipe, gearwheel and spring" 
            annotation (Dialog(group="if animation = true", enable=animation));
          input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
          "Reflection of ambient light (= 0: light is completely absorbed)" 
            annotation (Dialog(group="if animation = true", enable=animation));
          annotation (
            Documentation(info="<HTML>
<p>
Model <b>FixedShape</b> defines a visual shape that is
shown at the location of its frame_a.
All describing data such as size and color can vary dynamically by
providing appropriate expressions in the input fields of the
parameter menu. The only exception is parameter shapeType
that cannot be changed during simulation.
The following shapes are currently supported via
parameter <b>shapeType</b> (e.g., shapeType=\"box\"):<br>&nbsp;
</p>
<IMG SRC=\"../Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the FixedShape component.
</p>
<p>
Additionally external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found in the current directory.
</p>
<p>
The sizes of any of the above components are specified by the
<b>length</b>, <b>width</b> and <b>height</b> variables.
Via variable <b>extra</b> additional data can be defined:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of parameter <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the gear.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>
<p>
Parameter <b>color</b> is a vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given as Integer[3] in the ranges 0 .. 255,
respectively. The predefined type
<b>MultiBody.Types.Color</b> contains a temporary menu
definition of the colors used in the MultiBody library
(this will be replaced by a color editor).
</p>
</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Polygon(
                  points={{-100,33},{-100,-61},{-10,-41},{50,-61},{50,33},{-10,11},{-100,
                      33}},
                  lineColor={0,127,255},
                  fillColor={0,127,255},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{-98,34},{-64,46},{0,30},{74,56},{50,32},{-10,12},{-98,34}},
                  lineColor={255,255,255},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{72,54},{50,32},{50,-60},{72,-32},{72,54}},
                  lineColor={255,255,255},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-131,-65},{134,-104}},
                  lineColor={0,0,0},
                  textString="%shapeType"),
                Text(
                  extent={{-131,118},{129,58}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics));

      protected
          Advanced.Shape vis(
            shapeType=shapeType,
            r_shape=r_shape,
            lengthDirection=lengthDirection,
            widthDirection=widthDirection,
            length=length,
            width=width,
            height=height,
            color=color,
            extra=extra,
            specularCoefficient=specularCoefficient,
            r=frame_a.r_0,
            R=frame_a.R) if world.enableAnimation and animation;
        equation
          // No forces and torques
          frame_a.f = zeros(3);
          frame_a.t = zeros(3);
        end FixedShape;

         model Ground "Visualize ground (box in z=0)"
            parameter Boolean animation=true
          "= true, if animation of ground shall be enabled";
            parameter Modelica.SIunits.Position length = 10
          "Length and width of box (center is at x=y=0)"                    annotation (Dialog(enable=animation));
            parameter Modelica.SIunits.Position height = 0.02
          "Height of box (upper surface is at z=0, lower surface is at z=-height)"
                                                                              annotation (Dialog(enable=animation));
            parameter Modelica.Mechanics.MultiBody.Types.Color groundColor={0,255,0}
          "Color of box"      annotation (Dialog(enable=animation));

            annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                      -100},{100,100}}), graphics={
                  Polygon(
                    points={{-20,60},{-100,-32},{20,-92},{100,8},{-20,60}},
                    lineColor={0,0,0},
                    smooth=Smooth.None,
                    fillColor={0,255,0},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{2,82},{44,54}},
                    lineColor={0,0,0},
                    textString="z"),
                  Polygon(
                    points={{100,8},{100,-4},{20,-104},{20,-92},{100,8}},
                    lineColor={0,0,0},
                    smooth=Smooth.None,
                    fillColor={0,255,0},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-100,-32},{-100,-44},{20,-104},{20,-92},{-100,-32}},
                    lineColor={0,0,0},
                    smooth=Smooth.None,
                    fillColor={0,255,0},
                    fillPattern=FillPattern.Solid),
                  Ellipse(
                    extent={{-11,-7},{-1,-12}},
                    lineColor={0,0,0},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Line(
                    points={{-6,-10},{-6,88}},
                    color={0,0,0},
                    smooth=Smooth.None),
                  Polygon(
                    points={{-6,102},{-14,72},{2,72},{-6,102}},
                    lineColor={0,0,0},
                    smooth=Smooth.None,
                    fillColor={0,0,0},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-146,-96},{154,-136}},
                    textString="%name",
                    lineColor={0,0,255})}),           Diagram(coordinateSystem(
                    preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
                  graphics),
              Documentation(info="<html>
<p>
This shape visualizes the x-y plane by a box
</p>

</html>"));
            Modelica.Mechanics.MultiBody.Visualizers.FixedShape ground(
              lengthDirection={1,0,0},
              widthDirection={0,1,0},
              animation=animation,
              r_shape={-length/2,0,-height},
              length=length,
              height=height,
              color=groundColor,
              width=length) 
              annotation (Placement(transformation(extent={{-20,0},{0,20}})));
            Modelica.Mechanics.MultiBody.Parts.Fixed fixed 
              annotation (Placement(transformation(extent={{-60,0},{-40,20}})));
         equation

            connect(fixed.frame_b, ground.frame_a) annotation (Line(
                points={{-40,10},{-20,10}},
                color={95,95,95},
                thickness=0.5,
                smooth=Smooth.None));
         end Ground;

        package Advanced
        "Visualizers that require basic knowledge about Modelica in order to use them"
          extends Modelica.Icons.Library;
          annotation ( Documentation(info="<HTML>
<p>
Package <b>Visualizers.Advanced</b> contains components to visualize
3-dimensional shapes with dynamical sizes. None of the components
has a frame connector. The position and orientation is set via
modifiers. Basic knowledge of Modelica
is needed in order to utilize the components of this package.
These components have also to be used for models,
where the forces and torques in the frame connector are set via
equations (in this case, the models of the Visualizers package cannot be used,
since they all have frame connectors).
<p>
<h4>Content</h4>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Arrow\">Arrow</a></td>
      <td valign=\"top\">Visualizing an arrow where all parts of the arrow can vary dynamically:<br>
      <IMG SRC=\"../Images/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.DoubleArrow\">DoubleArrow</a></td>
      <td valign=\"top\">Visualizing a double arrow where all parts of the arrow can vary dynamically:<br>
      <IMG SRC=\"../Images/MultiBody/Visualizers/DoubleArrow.png\" ALT=\"model Visualizers.Advanced.DoubleArrow\">
      </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Shape</a></td>
      <td valign=\"top\">Animation shape of a part with dynamically varying sizes.
      The following shape types are supported:<br>&nbsp;<br>
      <IMG SRC=\"../Images/MultiBody/FixedShape.png\" ALT=\"model Visualizers.Advanced.Shape\">
      </td>
  </tr>
</table>
</HTML>"));

          model Arrow
          "Visualizing an arrow with variable size; all data have to be set as modifiers (see info layer)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;

            input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the arrow frame."
                                                                                   annotation(Dialog);
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of arrow frame, resolved in world frame"
                                                                                                             annotation(Dialog);
            input SI.Position r_tail[3]={0,0,0}
            "Position vector from origin of arrow frame to arrow tail, resolved in arrow frame"
                                                                                                  annotation(Dialog);
            input SI.Position r_head[3]={0,0,0}
            "Position vector from arrow tail to the head of the arrow, resolved in arrow frame"
                                                                                                  annotation(Dialog);
            input SI.Diameter diameter=world.defaultArrowDiameter
            "Diameter of arrow line"   annotation(Dialog);
            input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ArrowColor
            "Color of arrow"   annotation(Dialog);
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)"
                                                                                                                annotation(Dialog);

            annotation (
              Documentation(info="<HTML>
<p>
Model <b>Arrow</b> defines an arrow that is dynamically
visualized at the defined location (see variables below).
</p>
<IMG SRC=\"../Images/MultiBody/Visualizers/Arrow.png\" ALT=\"model Visualizers.Advanced.Arrow\">
<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.Arrow arrow(diameter = sin(time));
</pre>

<p>
Variable <b>color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
The predefined type <b>MultiBody.Types.Color</b> contains
a menu definition of the colors used in the MultiBody
library (will be replaced by a color editor).
</p>
</HTML>"),    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}), graphics={
                  Rectangle(
                    extent={{-100,28},{20,-30}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{20,60},{100,0},{20,-60},{20,60}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-146,124},{142,62}},
                    textString="%name",
                    lineColor={0,0,255})}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}),
                      graphics));
        protected
            outer Modelica.Mechanics.MultiBody.World world;
            SI.Length length=Modelica.Math.Vectors.length(
                                           r_head) "Length of arrow";
            Visualizers.Advanced.Shape arrowLine(
              length=noEvent(max(0, length - diameter*Types.Defaults.
                  ArrowHeadLengthFraction)),
              width=diameter,
              height=diameter,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cylinder",
              color=color,
              specularCoefficient=specularCoefficient,
              r_shape=r_tail,
              r=r,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead(
              length=noEvent(max(0, min(length, diameter*Types.Defaults.
                  ArrowHeadLengthFraction))),
              width=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                  ArrowHeadWidthFraction)),
              height=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                  ArrowHeadWidthFraction)),
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*arrowLine.length,
              R=R) if world.enableAnimation;

          end Arrow;

          model DoubleArrow
          "Visualizing a double arrow with variable size; all data have to be set as modifiers (see info layer)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;
            input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the arrow frame."
                                                                                   annotation(Dialog);
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of arrow frame, resolved in world frame"
                                                                                                             annotation(Dialog);
            input SI.Position r_tail[3]={0,0,0}
            "Position vector from origin of arrow frame to double arrow tail, resolved in arrow frame"
                                                                                                         annotation(Dialog);
            input SI.Position r_head[3]={0,0,0}
            "Position vector from double arrow tail to the head of the double arrow, resolved in arrow frame"
                                                                                                                annotation(Dialog);
            input SI.Diameter diameter=world.defaultArrowDiameter
            "Diameter of arrow line"   annotation(Dialog);
            input Modelica.Mechanics.MultiBody.Types.Color color=Modelica.Mechanics.MultiBody.Types.Defaults.ArrowColor
            "Color of double arrow"   annotation(Dialog);
            input Types.SpecularCoefficient specularCoefficient = world.defaultSpecularCoefficient
            "Material property describing the reflecting of ambient light (= 0 means, that light is completely absorbed)"
                                                                                                                annotation(Dialog);

            annotation (
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}), graphics={
                  Rectangle(
                    extent={{-100,28},{0,-28}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{40,60},{100,0},{40,-60},{40,60}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-146,124},{142,62}},
                    textString="%name",
                    lineColor={0,0,255}),
                  Polygon(
                    points={{0,60},{60,0},{0,-60},{0,60}},
                    lineColor={128,128,128},
                    fillColor={128,128,128},
                    fillPattern=FillPattern.Solid)}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}),
                      graphics),
              Documentation(info="<HTML>
<p>
Model <b>DoubleArrow</b> defines a double arrow that is dynamically
visualized at the defined location (see variables below).
</p>
<IMG SRC=\"../Images/MultiBody/Visualizers/DoubleArrow.png\" ALT=\"model Visualizers.Advanced.DoubleArrow\">
<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where an <b>Arrow</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.DoubleArrow doubleArrow(diameter = sin(time));
</pre>
<p>
Variable <b>color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
The predefined type <b>MultiBody.Types.Color</b> contains
a menu definition of the colors used in the MultiBody
library (will be replaced by a color editor).
</p>
</HTML>"));

        protected
            outer Modelica.Mechanics.MultiBody.World world;
            SI.Length length=Modelica.Math.Vectors.length(
                                           r_head) "Length of arrow";
            SI.Length headLength=noEvent(max(0, min(length, diameter*MultiBody.Types.
                Defaults.ArrowHeadLengthFraction)));
            SI.Length headWidth=noEvent(max(0, diameter*MultiBody.Types.Defaults.
                ArrowHeadWidthFraction));
            Visualizers.Advanced.Shape arrowLine(
              length=noEvent(max(0, length - 1.5*diameter*MultiBody.Types.Defaults.
                  ArrowHeadLengthFraction)),
              width=diameter,
              height=diameter,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cylinder",
              color=color,
              specularCoefficient=specularCoefficient,
              r_shape=r_tail,
              r=r,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead1(
              length=headLength,
              width=headWidth,
              height=headWidth,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*arrowLine.length,
              R=R) if world.enableAnimation;
            Visualizers.Advanced.Shape arrowHead2(
              length=headLength,
              width=headWidth,
              height=headWidth,
              lengthDirection=r_head,
              widthDirection={0,1,0},
              shapeType="cone",
              color=color,
              specularCoefficient=specularCoefficient,
              r=arrowLine.rvisobj + arrowLine.rxvisobj*(arrowLine.length + 0.5*
                  arrowHead1.length),
              R=R) if world.enableAnimation;

          end DoubleArrow;

          model Shape
          "Different visual shapes with variable size; all data have to be set as modifiers (see info layer)"

             extends
            Modelica.Utilities.Internal.PartialModelicaServices.Animation.PartialShape;
             extends ModelicaServices.Animation.Shape;

              annotation (
               Icon(coordinateSystem(
                   preserveAspectRatio=true,
                   extent={{-100,-100},{100,100}},
                   grid={2,2}), graphics={
                  Rectangle(
                    extent={{-100,-100},{80,60}},
                    lineColor={0,0,255},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}},
                    lineColor={0,0,255},
                    fillColor={192,192,192},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{100,100},{100,-60},{80,-100},{80,60},{100,100}},
                    lineColor={0,0,255},
                    fillColor={160,160,164},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-100,-100},{80,60}},
                    lineColor={0,0,0},
                    textString="%shapeType"),
                  Text(
                    extent={{-132,160},{128,100}},
                    textString="%name",
                    lineColor={0,0,255})}),
               Documentation(info="<HTML>
<p>
Model <b>Shape</b> defines a visual shape that is
shown at the location of its reference coordinate system, called
'object frame' below. All describing variables such
as size and color can vary dynamically (with the only exception
of parameter shapeType). The default equations in the
declarations should be modified by providing appropriate equations.
Model <b>Shape</b> is usually used as a basic building block to
implement simpler to use graphical components.
</p>
<p>
The following shapes are supported via
parameter <b>shapeType</b> (e.g., shapeType=\"box\"):<br>&nbsp;
</p>
<IMG SRC=\"../Images/MultiBody/Shape.png\" ALT=\"model Visualizers.FixedShape\">
<p>&nbsp;<br>
The dark blue arrows in the figure above are directed along
variable <b>lengthDirection</b>. The light blue arrows are directed
along variable <b>widthDirection</b>. The <b>coordinate systems</b>
in the figure represent frame_a of the Shape component.
</p>
<p>
Additionally, external shapes are specified as DXF-files
(only 3-dim.Face is supported). External shapes must be named \"1\", \"2\"
etc.. The corresponding definitions should be in files \"1.dxf\",
\"2.dxf\" etc.Since the DXF-files contain color and dimensions for
the individual faces, the corresponding information in the model
is currently ignored. The DXF-files must be found either in the current
directory or in the directory where the Shape instance is stored
that references the DXF file.
</p>

<p>
Via input variable <b>extra</b> additional sizing data is defined
according to:
</p>
<table border=1 cellspacing=0 cellpadding=2>
<tr><th><b>shapeType</b></th><th>Meaning of variable <b>extra</b></th></tr>
<tr>
  <td valign=\"top\">\"cylinder\"</td>
  <td valign=\"top\">if extra &gt; 0, a black line is included in the
      cylinder to show the rotation of it.</td>
</tr>
<tr>
  <td valign=\"top\">\"cone\"</td>
  <td valign=\"top\">extra = diameter-left-side / diameter-right-side, i.e.,<br>
      extra = 1: cylinder<br>
      extra = 0: \"real\" cone.</td>
</tr>
<tr>
  <td valign=\"top\">\"pipe\"</td>
  <td valign=\"top\">extra = outer-diameter / inner-diameter, i.e, <br>
      extra = 1: cylinder that is completely hollow<br>
      extra = 0: cylinder without a hole.</td>
</tr>
<tr>
  <td valign=\"top\">\"gearwheel\"</td>
  <td valign=\"top\">extra is the number of teeth of the gear.</td>
</tr>
<tr>
  <td valign=\"top\">\"spring\"</td>
  <td valign=\"top\">extra is the number of windings of the spring.
      Additionally, \"height\" is <b>not</b> the \"height\" but
      2*coil-width.</td>
</tr>
</table>

<p>
Parameter <b>color</b> is an Integer vector with 3 elements,
{r, g, b}, and specifies the color of the shape.
{r,g,b} are the \"red\", \"green\" and \"blue\" color parts.
Note, r g, b are given in the range 0 .. 255.
The predefined type <b>MultiBody.Types.Color</b> contains
a menu definition of the colors used in the MultiBody
library (will be replaced by a color editor).
</p>

<p>
The variables under heading <b>Parameters</b> below
are declared as (time varying) <b>input</b> variables.
If the default equation is not appropriate, a corresponding
modifier equation has to be provided in the
model where a <b>Shape</b> instance is used, e.g., in the form
</p>
<pre>
    Visualizers.Advanced.Shape shape(length = sin(time));
</pre>
</HTML>
"));
          end Shape;
        end Advanced;

        package Internal
        "Visualizers that will be replaced by improved versions in the future (don't use them)"
          extends Modelica.Icons.Library;

          model Lines
          "Visualizing a set of lines as cylinders with variable size, e.g., used to display characters (no Frame connector)"

            import SI = Modelica.SIunits;
            import Modelica.Mechanics.MultiBody;
            import Modelica.Mechanics.MultiBody.Types;
            import Modelica.Mechanics.MultiBody.Frames;
            import T =
            Modelica.Mechanics.MultiBody.Frames.TransformationMatrices;
            input Modelica.Mechanics.MultiBody.Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame"
                                                                                   annotation(Dialog);
            input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame"
               annotation(Dialog);
            input SI.Position r_lines[3]={0,0,0}
            "Position vector from origin of object frame to the origin of 'lines' frame, resolved in object frame"
               annotation(Dialog);
            input Real n_x[3](each final unit="1")={1,0,0}
            "Vector in direction of x-axis of 'lines' frame, resolved in object frame"
               annotation(Dialog);
            input Real n_y[3](each final unit="1")={0,1,0}
            "Vector in direction of y-axis of 'lines' frame, resolved in object frame"
             annotation(Dialog);
            input SI.Position lines[:, 2, 2]=zeros(0, 2, 2)
            "List of start and end points of cylinders resolved in an x-y frame defined by n_x, n_y, e.g., {[0,0;1,1], [0,1;1,0], [2,0; 3,1]}"
            annotation(Dialog);
            input SI.Length diameter(min=0) = 0.05
            "Diameter of the cylinders defined by lines" 
            annotation(Dialog);
            input Modelica.Mechanics.MultiBody.Types.Color color={0,128,255}
            "Color of cylinders" 
            annotation(Dialog);
            input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)" 
              annotation (Dialog);
        protected
            parameter Integer n=size(lines, 1) "Number of cylinders";
            T.Orientation R_rel=T.from_nxy(n_x, n_y);
            T.Orientation R_lines=T.absoluteRotation(R.T, R_rel);
            Modelica.SIunits.Position r_abs[3]=r + T.resolve1(R.T, r_lines);
            Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape cylinders[n](
              each shapeType="cylinder",
              lengthDirection={T.resolve1(R_rel, vector([lines[i, 2, :] - lines[i, 1,
                   :]; 0])) for i in 1:n},
              length={Modelica.Math.Vectors.length(
                                              lines[i, 2, :] - lines[i, 1, :]) for i in 
                      1:n},
              r={r_abs + T.resolve1(R_lines, vector([lines[i, 1, :]; 0])) for i in 1:
                  n},
              each width=diameter,
              each height=diameter,
              each widthDirection={0,1,0},
              each color=color,
              each R=R,
              each specularCoefficient=specularCoefficient);
            annotation (
              Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                      100,100}}), graphics={
                  Rectangle(
                    extent={{-100,100},{100,-100}},
                    lineColor={128,128,128},
                    fillColor={255,255,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-24,-34},{-82,40},{-72,46},{-14,-26},{-24,-34}},
                    lineColor={0,127,255},
                    fillColor={0,127,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{-82,-24},{-20,46},{-10,38},{-72,-32},{-82,-24}},
                    lineColor={0,127,255},
                    fillColor={0,127,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{42,-18},{10,40},{20,48},{50,-6},{42,-18}},
                    lineColor={0,127,255},
                    fillColor={0,127,255},
                    fillPattern=FillPattern.Solid),
                  Polygon(
                    points={{10,-68},{84,48},{96,42},{24,-72},{10,-68}},
                    lineColor={0,127,255},
                    fillColor={0,127,255},
                    fillPattern=FillPattern.Solid),
                  Text(
                    extent={{-140,164},{148,102}},
                    textString="%name",
                    lineColor={0,0,255})}),
              Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                      {100,100}}),
                      graphics),
              Documentation(info="<HTML>
<p>
With model <b>Lines</b> a set of dynamic lines is defined
that are located relatively to frame_a. Every line
is represented by a cylinder. This allows, e.g., to define simple shaped
3-dimensional characters. Note, if the lines are fixed relatively to frame_a,
it is more convenient to use model <b>Visualizers.FixedLines</b>.
An example for dynamic lines is shown in the following figure:<br>&nbsp;
</p>
<IMG SRC=\"../Images/MultiBody/FixedLines.png\" ALT=\"model Visualizers.FixedLines\">
<p>&nbsp;<br>
The two letters \"x\" and \"y\" are constructed with 4 lines
by providing the following data for input variable <b>lines</b>
</p>
<pre>
   lines = {[0, 0; 1, 1],[0, 1; 1, 0],[1.5, -0.5; 2.5, 1],[1.5, 1; 2, 0.25]}
</pre>
<p>
Via vectors <b>n_x</b> and <b>n_y</b> a two-dimensional
coordinate system is defined. The points defined with variable
<b>lines</b> are with respect to this coordinate system. For example
\"[0, 0; 1, 1]\" defines a line that starts at {0,0} and ends at {1,1}.
The diameter and color of all line cylinders are identical
and are defined by parameters.
</p>

</HTML>
"));

          end Lines;
          annotation (Documentation(info="<html>
<p>
This package contains components to construct 3-dim. fonts
with \"cylinder\" elements for the animation window.
This is just a temporary hack until 3-dim. fonts are supported in
Modelica tools. The components are used to construct the \"x\", \"y\",
\"z\" labels of coordinates systems in the animation.
</p>
</html>"));
        end Internal;
      end Visualizers;
    annotation (
      Documentation(info="<HTML>
<p>
Library <b>MultiBody</b> is a <b>free</b> Modelica package providing
3-dimensional mechanical components to model in a convenient way
<b>mechanical systems</b>, such as robots, mechanisms, vehicles.
Typical animations generated with this library are shown
in the next figure:
</p>
<p>
<img src=\"../Images/MultiBody/MultiBody.png\">
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Mechanics.MultiBody.UsersGuide\">MultiBody.UsersGuide</a>
     discusses the most important aspects how to use this library.</li>
<li> <a href=\"Modelica://Modelica.Mechanics.MultiBody.Examples\">MultiBody.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a>.</i>
</p><br>
</HTML>"));
    end MultiBody;

    package Rotational
    "Library to model 1-dimensional, rotational mechanical systems"
      extends Modelica.Icons.Library2;
      import SI = Modelica.SIunits;
      annotation (
        Documentation(info="<html>

<p>
Library <b>Rotational</b> is a <b>free</b> Modelica package providing
1-dimensional, rotational mechanical components to model in a convenient way
drive trains with frictional losses. A typical, simple example is shown
in the next figure:
</p>

<p><img src=\"../Images/Rotational/driveExample.png\"></p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Mechanics.Rotational.UsersGuide\">Rotational.UsersGuide</a>
     discusses the most important aspects how to use this library.</li>
<li> <a href=\"Modelica://Modelica.Mechanics.Rotational.Examples\">Rotational.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>

<p>
In version 3.0 of the Modelica Standard Library, the basic design of the
library has changed: Previously, bearing connectors could or could not be connected.
In 3.0, the bearing connector is renamed to \"support\" and this connector
is enabled via parameter \"useSupport\". If the support connector is enabled,
it must be connected, and if it is not enabled, it must not be connected.
</p>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</html>
",     revisions=""),
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-83,-66},{-63,-66}}, color={0,0,0}),
            Line(points={{36,-68},{56,-68}}, color={0,0,0}),
            Line(points={{-73,-66},{-73,-91}}, color={0,0,0}),
            Line(points={{46,-68},{46,-91}}, color={0,0,0}),
            Line(points={{-83,-29},{-63,-29}}, color={0,0,0}),
            Line(points={{36,-32},{56,-32}}, color={0,0,0}),
            Line(points={{-73,-9},{-73,-29}}, color={0,0,0}),
            Line(points={{46,-12},{46,-32}}, color={0,0,0}),
            Line(points={{-73,-91},{46,-91}}, color={0,0,0}),
            Rectangle(
              extent={{-47,-17},{27,-80}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Rectangle(
              extent={{-87,-41},{-47,-54}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192}),
            Rectangle(
              extent={{27,-42},{66,-56}},
              lineColor={0,0,0},
              fillPattern=FillPattern.HorizontalCylinder,
              fillColor={192,192,192})}));

      package Components "Components for 1D rotational mechanical drive trains"
        extends Modelica.Icons.Library2;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-58,8},{42,-92}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{-100,-32},{-58,-52}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192}),
              Rectangle(
                extent={{42,-32},{80,-52}},
                lineColor={0,0,0},
                fillPattern=FillPattern.HorizontalCylinder,
                fillColor={192,192,192})}),                     Documentation(info="<html>
<p>
This package contains basic components 1D mechanical rotational drive trains.
</p>
</html>"));

        model Fixed "Flange fixed in housing at a given angle"
          parameter SI.Angle phi0=0 "Fixed offset angle of housing";

          Interfaces.Flange_b flange "(right) flange fixed in housing" 
            annotation (Placement(transformation(extent={{10,-10},{-10,10}}, rotation=
                   0)));
          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Text(
                  extent={{-150,-90},{150,-130}},
                  lineColor={0,0,255},
                  textString="%name"),
                Line(points={{-80,-40},{80,-40}}, color={0,0,0}),
                Line(points={{80,-40},{40,-80}}, color={0,0,0}),
                Line(points={{40,-40},{0,-80}}, color={0,0,0}),
                Line(points={{0,-40},{-40,-80}}, color={0,0,0}),
                Line(points={{-40,-40},{-80,-80}}, color={0,0,0}),
                Line(points={{0,-40},{0,-10}}, color={0,0,0})}),
            Documentation(info="<html>
<p>
The <b>flange</b> of a 1D rotational mechanical system is <b>fixed</b>
at an angle phi0 in the <b>housing</b>. May be used:
</p>
<ul>
<li> to connect a compliant element, such as a spring or a damper,
     between an inertia or gearbox component and the housing.
<li> to fix a rigid element, such as an inertia, with a specific
     angle to the housing.
</ul>

</HTML>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-80,-40},{80,-40}}, color={0,0,0}),
                Line(points={{80,-40},{40,-80}}, color={0,0,0}),
                Line(points={{40,-40},{0,-80}}, color={0,0,0}),
                Line(points={{0,-40},{-40,-80}}, color={0,0,0}),
                Line(points={{-40,-40},{-80,-80}}, color={0,0,0}),
                Line(points={{0,-40},{0,-4}}, color={0,0,0})}));

        equation
          flange.phi = phi0;
        end Fixed;

        model Damper "Linear 1D rotational damper"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialCompliantWithRelativeStates;
          parameter SI.RotationalDampingConstant d(final min=0, start=0)
          "Damping constant";
          annotation (
            Documentation(info="<html>
<p>
<b>Linear, velocity dependent damper</b> element. It can be either connected
between an inertia or gear and the housing (component Fixed), or
between two inertia/gear elements.
</p>

</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-90,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{90,0}}, color={0,0,0}),
                Text(
                  extent={{-150,80},{150,40}},
                  textString="%name",
                  lineColor={0,0,255}),
                Text(
                  extent={{-150,-50},{150,-90}},
                  lineColor={0,0,0},
                  textString="d=%d")}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Line(points={{-96,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{96,0}}, color={0,0,0}),
                Line(points={{-68,0},{-68,65}}, color={128,128,128}),
                Text(
                  extent={{-22,62},{18,87}},
                  lineColor={0,0,255},
                  textString="phi_rel"),
                Line(points={{-68,60},{72,60}}, color={128,128,128}),
                Line(points={{72,0},{72,65}}, color={128,128,128}),
                Polygon(
                  points={{62,63},{72,60},{62,57},{62,63}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid)}));

        equation
          tau = d*w_rel;
        end Damper;
      end Components;

      package Sources "Sources to drive 1D rotational mechanical components"
        extends Modelica.Icons.Library2;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Line(
                points={{-98,-64},{-74,-34},{-46,-12},{-12,-2},{18,-8},{38,-20},{54,
                    -36},{66,-50},{76,-64}},
                color={0,0,0},
                thickness=0.5), Polygon(
                points={{76,-64},{56,-6},{27,-37},{76,-64}},
                lineColor={0,0,0},
                fillColor={0,0,0},
                fillPattern=FillPattern.Solid)}),               Documentation(info="<html>
<p>
This package contains ideal sources to drive 1D mechanical rotational drive trains.
</p>
</html>"));

        model Torque2 "Input signal acting as torque on two flanges"
          extends Rotational.Interfaces.PartialTwoFlanges;

          Modelica.Blocks.Interfaces.RealInput tau
          "Torque driving the two flanges (a positive value accelerates the flange)"
            annotation (Placement(transformation(
                origin={0,40},
                extent={{-20,-20},{20,20}},
                rotation=270)));

          annotation (
            Documentation(info="<HTML>
<p>
The input signal <b>tau</b> defines an external
torque in [Nm] which acts at both flange connectors,
i.e., the components connected to these flanges are driven by torque <b>tau</b>.</p>
<p>The input signal can be provided from one of the signal generator
blocks of Modelica.Blocks.Sources.</p>

</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{-150,-40},{150,-80}},
                  textString="%name",
                  lineColor={0,0,255}),
                Polygon(
                  points={{-78,24},{-69,17},{-89,0},{-78,24}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{-74,20},{-70,23},{-65,26},{-60,28},{-56,29},{-50,30},{-41,
                      30},{-35,29},{-31,28},{-26,26},{-21,23},{-17,20},{-13,15},{-10,
                      9}},
                  color={0,0,0},
                  thickness=0.5),
                Line(
                  points={{74,20},{70,23},{65,26},{60,28},{56,29},{50,30},{41,30},{
                      35,29},{31,28},{26,26},{21,23},{17,20},{13,15},{10,9}},
                  color={0,0,0},
                  thickness=0.5),
                Polygon(
                  points={{89,0},{78,24},{69,17},{89,0}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={1,1}), graphics={
                Text(
                  extent={{15,-71},{83,-84}},
                  lineColor={128,128,128},
                  textString="rotation axis"),
                Polygon(
                  points={{11,-77},{-9,-72},{-9,-82},{11,-77}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Line(points={{-79,-77},{-8,-77}}, color={128,128,128}),
                Line(
                  points={{-75,20},{-71,23},{-66,26},{-61,28},{-57,29},{-51,30},{-42,
                      30},{-36,29},{-32,28},{-27,26},{-22,23},{-18,20},{-14,15},{-11,
                      9}},
                  color={0,0,0},
                  thickness=0.5),
                Polygon(
                  points={{-79,24},{-70,17},{-90,0},{-79,24}},
                  lineColor={0,0,0},
                  lineThickness=0.5,
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  points={{73,20},{69,23},{64,26},{59,28},{55,29},{49,30},{40,30},{
                      34,29},{30,28},{25,26},{20,23},{16,20},{12,15},{9,9}},
                  color={0,0,0},
                  thickness=0.5),
                Polygon(
                  points={{88,0},{77,24},{68,17},{88,0}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid)}));

        equation
          flange_a.tau =  tau;
          flange_b.tau = -tau;
        end Torque2;

        model ConstantTorque "Constant torque, not dependent on speed"
          extends Rotational.Interfaces.PartialTorque;
          parameter Modelica.SIunits.Torque tau_constant
          "Constant torque (if negative, torque is acting as load)";
          Modelica.SIunits.Torque tau
          "Accelerating torque acting at flange (= -flange.tau)";
          annotation (
            Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                    {100,100}}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={Line(points={{-98,0},{100,0}}, color={0,0,
                      255}), Text(
                  extent={{-124,-16},{120,-40}},
                  lineColor={0,0,0},
                  textString="%tau_constant")}),
            Documentation(info="<HTML>
<p>
Model of constant torque, not dependent on angular velocity of flange.<br>
Positive torque acts accelerating.
</p>
</HTML>"));
        equation
          tau = -flange.tau;
          tau = tau_constant;
        end ConstantTorque;
      end Sources;

      package Interfaces
      "Connectors and partial models for 1D rotational mechanical components"
        extends Modelica.Icons.Library;
        annotation ( Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
rotational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>

</html>
"));

        connector Flange_a
        "1-dim. rotational flange of a shaft (filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
          annotation(defaultComponentName = "flange_a",
            Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the mechanical flange of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of theshaft flange in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Cut-torque in the shaft flange in [Nm] </td>
  </tr>
</table>

<p>
There is a second connector for flanges: Flange_b. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see section
<a href=\"Modelica://Modelica.Mechanics.Rotational.UsersGuide.SignConventions\">Sign Conventions</a>
in the user's guide of Rotational.
</p>

<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>

</html>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Text(
                  extent={{-160,90},{40,50}},
                  lineColor={0,0,0},
                  textString="%name"), Ellipse(
                  extent={{-40,40},{40,-40}},
                  lineColor={0,0,0},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.Solid)}));
        end Flange_a;

        connector Flange_b
        "1-dim. rotational flange of a shaft (non-filled square icon)"
          SI.Angle phi "Absolute rotation angle of flange";
          flow SI.Torque tau "Cut torque in the flange";
          annotation(defaultComponentName = "flange_b",
            Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the mechanical flange of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of the shaft flange in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Cut-torque in the shaft flange in [Nm] </td>
  </tr>
</table>

<p>
There is a second connector for flanges: Flange_a. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see section
<a href=\"Modelica://Modelica.Mechanics.Rotational.UsersGuide.SignConventions\">Sign Conventions</a>
in the user's guide of Rotational.
</p>

<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>

</html>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Ellipse(
                  extent={{-98,100},{102,-100}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Ellipse(
                  extent={{-40,40},{40,-40}},
                  lineColor={0,0,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-40,90},{160,50}},
                  lineColor={0,0,0},
                  textString="%name")}));
        end Flange_b;

        connector Support "Support/housing of a 1-dim. rotational shaft"

          SI.Angle phi "Absolute rotation angle of the support/housing";
          flow SI.Torque tau "Reaction torque in the support/housing";

          annotation (Documentation(info="<html>
<p>
This is a connector for 1-dim. rotational mechanical systems and models
the support or housing of a shaft. The following variables are defined in this connector:
</p>

<table border=1 cellspacing=0 cellpadding=2>
  <tr><td valign=\"top\"> <b>phi</b></td>
      <td valign=\"top\"> Absolute rotation angle of the support/housing in [rad] </td>
  </tr>
  <tr><td valign=\"top\"> <b>tau</b></td>
      <td valign=\"top\"> Reaction torque in the support/housing in [Nm] </td>
  </tr>
</table>

<p>
The support connector is usually defined as conditional connector.
It is most convenient to utilize it
</p>

<ul>
<li> For models to be build graphically (i.e. the model is build up by drag-and-drop
     from elementary components):<br>
     <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialOneFlangeAndSupport\">
     PartialOneFlangeAndSupport</a>,<br>
     <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialTwoFlangesAndSupport\">
     PartialTwoFlangesAndSupport</a>, <br> &nbsp; </li>

<li> For models to be build textually (i.e. elementary models):<br>
     <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport\">
     PartialElementaryOneFlangeAndSupport</a>,<br>
     <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport\">
     PartialElementaryTwoFlangesAndSupport</a>,<br>
     <a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational\">
     PartialElementaryRotationalToTranslational</a>.</li>
</ul>

</html>"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2},
                initialScale=0.1), graphics={
                Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid),
                Rectangle(
                  extent={{-150,150},{150,-150}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Ellipse(
                  extent={{-100,100},{100,-100}},
                  lineColor={0,0,0},
                  fillColor={95,95,95},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2},
                initialScale=0.1), graphics={
                Rectangle(
                  extent={{-60,60},{60,-60}},
                  lineColor={192,192,192},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-160,100},{40,60}},
                  lineColor={0,0,0},
                  textString="%name"),
                Ellipse(
                  extent={{-40,40},{40,-40}},
                  lineColor={0,0,0},
                  fillColor={135,135,135},
                  fillPattern=FillPattern.Solid)}));
        end Support;

        model InternalSupport
        "Adapter model to utilize conditional support connector"
          input Modelica.SIunits.Torque tau
          "External support torque (must be computed via torque balance in model where InternalSupport is used; = flange.tau)";
          Modelica.SIunits.Angle phi "External support angle (= flange.phi)";
          Flange_a flange
          "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)"
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics), Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                graphics={Ellipse(
                  extent={{-20,20},{20,-20}},
                  lineColor={135,135,135},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-200,80},{200,40}},
                  lineColor={0,0,255},
                  textString="%name")}),
            Documentation(info="<html>
<p>
This is an adapter model to utilize a conditional support connector
in an elementary component, i.e., where the component equations are
defined textually:
</p>

<ul>
<li> If <i>useSupport = true</i>, the flange has to be connected to the conditional
     support connector.</li>
<li> If <i>useSupport = false</i>, the flange has to be connected to the conditional
     fixed model.</li>
</ul>

<p>
Variable <b>tau</b> is defined as <b>input</b> and must be provided when using
this component as a modifier (computed via a torque balance in
the model where InternalSupport is used). Usually, model InternalSupport is
utilized via the partial models:
</p>

<blockquote>
<a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport\">
PartialElementaryOneFlangeAndSupport</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryTwoFlangesAndSupport\">
PartialElementaryTwoFlangesAndSupport</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.Rotational.Interfaces.PartialElementaryRotationalToTranslational\">
PartialElementaryRotationalToTranslational</a>.</li>
</blockquote>

<p>
Note, the support angle can always be accessed as internalSupport.phi, and
the support torque can always be accessed as internalSupport.tau.
</p>


</html>"));
        equation
          flange.tau = tau;
          flange.phi = phi;
        end InternalSupport;

        partial model PartialTwoFlanges
        "Partial model for a component with two rotational 1-dim. shaft flanges"
          Flange_a flange_a "Flange of left shaft" 
                            annotation (Placement(transformation(extent={{-110,-10},
                    {-90,10}}, rotation=0)));
          Flange_b flange_b "Flange of right shaft" 
                            annotation (Placement(transformation(extent={{90,-10},{
                    110,10}}, rotation=0)));
          annotation (
            Documentation(info="<html>
<p>
This is a 1-dim. rotational component with two flanges.
It is used e.g. to build up parts of a drive train consisting
of several components.
</p>

</html>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics));
        end PartialTwoFlanges;

        partial model PartialCompliantWithRelativeStates
        "Partial model for the compliant connection of two rotational 1-dim. shaft flanges where the relative angle and speed are used as preferred states"

          Modelica.SIunits.Angle phi_rel(start=0, stateSelect=stateSelect, nominal=phi_nominal)
          "Relative rotation angle (= flange_b.phi - flange_a.phi)";
          Modelica.SIunits.AngularVelocity w_rel(start=0, stateSelect=stateSelect)
          "Relative angular velocity (= der(phi_rel))";
          Modelica.SIunits.AngularAcceleration a_rel(start=0)
          "Relative angular acceleration (= der(w_rel))";
          Modelica.SIunits.Torque tau "Torque between flanges (= flange_b.tau)";
          Flange_a flange_a
          "Left flange of compliant 1-dim. rotational component" 
            annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                  rotation=0)));
          Flange_b flange_b
          "Right flange of compliant 1-dim. rotational component" 
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));

          parameter SI.Angle phi_nominal(displayUnit="rad")=1e-4
          "Nominal value of phi_rel (used for scaling)"    annotation(Dialog(tab="Advanced"));
          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use phi_rel and w_rel as states" 
          annotation(HideResult=true, Dialog(tab="Advanced"));

          annotation (
            Documentation(info="<html>
<p>
This is a 1-dim. rotational component with a compliant connection of two
rotational 1-dim. flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-torques
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.tau + flange_b.tau = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>

<p>
The relative angle and the relative speed are defined as preferred states.
The reason is that for some drive trains, such as drive
trains in vehicles, the absolute angle is quickly increasing during operation.
Numerically, it is better to use relative angles between drive train components
because they remain in a limited size. For this reason, StateSelect.prefer
is set for the relative angle of this component.
</p>

<p>
In order to improve the numerics, a nominal value for the relative angle
can be provided via parameter <b>phi_nominal</b> in the Advanced menu.
The default ist 1e-4 rad since relative angles are usually
in this order and the step size control of an integrator would be
practically switched off, if a default of 1 rad would be used.
This nominal value might also be computed from other values, such
as \"phi_nominal = tau_nominal / c\" for a rotational spring, if tau_nominal
and c are more meaningful for the user.
</p>

</html>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics));

        equation
          phi_rel = flange_b.phi - flange_a.phi;
          w_rel = der(phi_rel);
          a_rel = der(w_rel);
          flange_b.tau = tau;
          flange_a.tau = -tau;
        end PartialCompliantWithRelativeStates;

        partial model PartialElementaryOneFlangeAndSupport2
        "Partial model for a component with one rotational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded" 
              annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
          Flange_b flange "Flange of shaft" 
            annotation (Placement(transformation(extent={{90,-10},{110,10}}, rotation=0)));
          Support support(phi = phi_support, tau = -flange.tau) if useSupport
          "Support/housing of component" 
            annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      protected
          Modelica.SIunits.Angle phi_support "Absolute angle of support flange";
        equation
          if not useSupport then
             phi_support = 0;
          end if;
          annotation (
            Documentation(info="<html>
<p>
This is a 1-dim. rotational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics),
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={
                Line(
                  visible=not useSupport,
                  points={{-50,-120},{-30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-120},{-10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-10,-120},{10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{10,-120},{30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-100},{30,-100}},
                  color={0,0,0})}));
        end PartialElementaryOneFlangeAndSupport2;

        partial model PartialTorque
        "Partial model of a torque acting at the flange (accelerates the flange)"
          extends
          Modelica.Mechanics.Rotational.Interfaces.PartialElementaryOneFlangeAndSupport2;
          Modelica.SIunits.Angle phi
          "Angle of flange with respect to support (= flange.phi - support.phi)";
          annotation (
            Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},
                    {100,100}}),
                    graphics),
            Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={
                Rectangle(
                  extent={{-96,96},{96,-96}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{0,-62},{0,-100}}, color={0,0,0}),
                Line(points={{-92,0},{-76,36},{-54,62},{-30,80},{-14,88},{10,92},{
                      26,90},{46,80},{64,62}}, color={0,0,0}),
                Text(
                  extent={{-150,140},{150,100}},
                  lineColor={0,0,255},
                  textString="%name"),
                Polygon(
                  points={{94,16},{80,74},{50,52},{94,16}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(points={{-58,-82},{-42,-68},{-20,-56},{0,-54},{18,-56},{34,-62},
                      {44,-72},{54,-82},{60,-94}}, color={0,0,0}),
                Polygon(
                  points={{-65,-98},{-46,-80},{-58,-72},{-65,-98}},
                  lineColor={0,0,0},
                  fillColor={0,0,0},
                  fillPattern=FillPattern.Solid),
                Line(
                  visible=not useSupport,
                  points={{-50,-120},{-30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-120},{-10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-10,-120},{10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{10,-120},{30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-100},{30,-100}},
                  color={0,0,0})}),
            Documentation(info="<HTML>
<p>
Partial model of torque that accelerates the flange.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</html>"));

        equation
          phi = flange.phi - phi_support;
        end PartialTorque;
      end Interfaces;
    end Rotational;

    package Translational
    "Library to model 1-dimensional, translational mechanical systems"
      extends Modelica.Icons.Library2;
      import SI = Modelica.SIunits;
      annotation (
        Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                100}}), graphics={
            Line(points={{-84,-73},{66,-73}}, color={0,0,0}),
            Rectangle(
              extent={{-81,-22},{-8,-65}},
              lineColor={0,0,0},
              fillPattern=FillPattern.Sphere,
              fillColor={192,192,192}),
            Line(points={{-8,-43},{-1,-43},{6,-64},{17,-23},{29,-65},{40,-23},{50,-44},
                  {61,-44}}, color={0,0,0}),
            Line(points={{-59,-73},{-84,-93}}, color={0,0,0}),
            Line(points={{-11,-73},{-36,-93}}, color={0,0,0}),
            Line(points={{-34,-73},{-59,-93}}, color={0,0,0}),
            Line(points={{14,-73},{-11,-93}}, color={0,0,0}),
            Line(points={{39,-73},{14,-93}}, color={0,0,0}),
            Line(points={{63,-73},{38,-93}}, color={0,0,0})}),
                                                            Documentation(info="<html>
<p>
This package contains components to model <i>1-dimensional translational
mechanical</i> systems.
</p>
<p>
The <i>filled</i> and <i>non-filled green squares</i> at the left and
right side of a component represent <i>mechanical flanges</i>.
Drawing a line between such squares means that the corresponding
flanges are <i>rigidly attached</i> to each other. The components of this
library can be usually connected together in an arbitrary way. E.g. it is
possible to connect two springs or two sliding masses with inertia directly
together.
<p> The only <i>connection restriction</i> is that the Coulomb friction
elements (e.g. MassWithStopAndFriction) should be only connected
together provided a compliant element, such as a spring, is in between.
The reason is that otherwise the frictional force is not uniquely
defined if the elements are stuck at the same time instant (i.e., there
does not exist a unique solution) and some simulation systems may not be
able to handle this situation, since this leads to a singularity during
simulation. It can only be resolved in a \"clean way\" by combining the
two connected friction elements into
one component and resolving the ambiguity of the frictional force in the
stuck mode.
</p>
<p> Another restriction arises if the hard stops in model MassWithStopAndFriction are used, i. e.
the movement of the mass is limited by a stop at smax or smin.
<font color=\"#ff0000\"> <b>This requires the states Stop.s and Stop.v</b> </font>. If these states are eliminated during the index reduction
the model will not work. To avoid this any inertias should be connected via springs
to the Stop element, other sliding masses, dampers or hydraulic chambers must be avoided. </p>
<p>
In the <i>icon</i> of every component an <i>arrow</i> is displayed in grey
color. This arrow characterizes the coordinate system in which the vectors
of the component are resolved. It is directed into the positive
translational direction (in the mathematical sense).
In the flanges of a component, a coordinate system is rigidly attached
to the flange. It is called <i>flange frame</i> and is directed in parallel
to the component coordinate system. As a result, e.g., the positive
cut-force of a \"left\" flange (flange_a) is directed into the flange, whereas
the positive cut-force of a \"right\" flange (flange_b) is directed out of the
flange. A flange is described by a Modelica connector containing
the following variables:
</p>
<pre>
   Modelica.SIunits.Position s    \"Absolute position of flange\";
   <b>flow</b> Modelica.SIunits.Force f  \"Cut-force in the flange\";
</pre>

<p>
This library is designed in a fully object oriented way in order that
components can be connected together in every meaningful combination
(e.g. direct connection of two springs or two shafts with inertia).
As a consequence, most models lead to a system of
differential-algebraic equations of <i>index 3</i> (= constraint
equations have to be differentiated twice in order to arrive at
a state space representation) and the Modelica translator or
the simulator has to cope with this system representation.
According to our present knowledge, this requires that the
Modelica translator is able to symbolically differentiate equations
(otherwise it is e.g. not possible to provide consistent initial
conditions; even if consistent initial conditions are present, most
numerical DAE integrators can cope at most with index 2 DAEs).
</p>

<dl>
<dt><b>Library Officer</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> <br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
    Institut f&uuml;r Robotik und Mechatronik (DLR-RM)<br>
    Abteilung Systemdynamik und Regelungstechnik<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br><br>
</dl>

<p>
<b>Contributors to this library:</b>
</p>

<ul>
<li> Main author until 2006:<br>
     Peter Beater <br>
     Universit&auml;t Paderborn, Abteilung Soest<br>
     Fachbereich Maschinenbau/Automatisierungstechnik<br>
     L&uuml;becker Ring 2 <br>
     D 59494 Soest <br>
     Germany <br>
     email: <A HREF=\"mailto:Beater@mailso.uni-paderborn.de\">Beater@mailso.uni-paderborn.de</A><br><br>
     </li>

<li> <a href=\"http://www.haumer.at/\">Anton Haumer</a><br>
     Technical Consulting & Electrical Engineering<br>
     A-3423 St.Andrae-Woerdern, Austria<br>
     email: <a href=\"mailto:a.haumer@haumer.at\">a.haumer@haumer.at</a><br><br></li>

<li> <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> (DLR-RM)</li>
</ul>

<p>
Copyright &copy; 1998-2009, Modelica Association, Anton Haumer and Universit&auml;t Paderborn, FB 12.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>

</HTML>
",     revisions="<html>
<ul>
<li><i>Version 1.0 (January 5, 2000)</i>
       by Peter Beater <br>
       Realized a first version based on Modelica library Mechanics.Rotational
       by Martin Otter and an existing Dymola library onedof.lib by Peter Beater.
       <br>
<li><i>Version 1.01 (July 18, 2001)</i>
       by Peter Beater <br>
       Assert statement added to \"Stop\", small bug fixes in examples.
       <br>
</li>
<li><i>Version 1.1.0 2007-11-16</i>
       by Anton Haumer<br>
       Redesign for Modelica 3.0-compliance<br>
       Added new components acording to Mechanics.Rotational library
       <br>
</li>
</ul>
</html>"));

      package Components
      "Components for 1D translational mechanical drive trains"
        extends Modelica.Icons.Library2;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Rectangle(
                extent={{-67,-66},{44,-6}},
                lineColor={0,0,0},
                fillPattern=FillPattern.Sphere,
                fillColor={255,255,255})}),                     Documentation(info="<html>
<p>
This package contains basic components 1D mechanical translational drive trains.
</p>
</html>"));

        model Fixed "Fixed flange"
          parameter SI.Position s0=0 "fixed offset position of housing";

          annotation (
            Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-80,-40},{80,-40}}, color={0,0,0}),
                Line(points={{80,-40},{40,-80}}, color={0,0,0}),
                Line(points={{40,-40},{0,-80}}, color={0,0,0}),
                Line(points={{0,-40},{-40,-80}}, color={0,0,0}),
                Line(points={{-40,-40},{-80,-80}}, color={0,0,0}),
                Line(points={{0,-40},{0,-10}}, color={0,0,0}),
                Text(
                  extent={{0,-90},{0,-150}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics),
            Documentation(info="<html>
<p>
The <i>flange</i> of a 1D translational mechanical system <i>fixed</i>
at an position s0 in the <i>housing</i>. May be used:
</p>
<ul>
<li> to connect a compliant element, such as a spring or a damper,
     between a sliding mass and the housing.
<li> to fix a rigid element, such as a sliding mass, at a specific
     position.
</ul>

</HTML>
"));

          Interfaces.Flange_b flange   annotation (Placement(transformation(
                origin={0,0},
                extent={{-10,10},{10,-10}},
                rotation=180)));
        equation
          flange.s = s0;
        end Fixed;

        model Spring "Linear 1D translational spring"
          extends Translational.Interfaces.PartialCompliant;
          parameter SI.TranslationalSpringConstant c(final min=0, start = 1)
          "spring constant ";
          parameter SI.Distance s_rel0=0 "unstretched spring length";

          annotation (
            Documentation(info="<html>
<p>
A <i>linear 1D translational spring</i>. The component can be connected either
between two sliding masses, or between
a sliding mass and the housing (model Fixed), to describe
a coupling of the sliding mass with the housing via a spring.
</p>

</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-60,-90},{20,-90}}, color={0,0,0}),
                Polygon(
                  points={{50,-90},{20,-80},{20,-100},{50,-90}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{0,110},{0,50}},
                  textString="%name",
                  lineColor={0,0,255}),
                Line(points={{-86,0},{-60,0},{-44,-30},{-16,30},{14,-30},{44,30},{
                      60,0},{84,0}}, color={0,0,0})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-100,0},{-100,65}}, color={128,128,128}),
                Line(points={{100,0},{100,65}}, color={128,128,128}),
                Line(points={{-100,60},{100,60}}, color={128,128,128}),
                Polygon(
                  points={{90,63},{100,60},{90,57},{90,63}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-22,62},{18,87}},
                  lineColor={0,0,255},
                  textString="s_rel"),
                Line(points={{-86,0},{-60,0},{-44,-30},{-16,30},{14,-30},{44,30},{
                      60,0},{84,0}}, color={0,0,0})}));

        equation
          f = c*(s_rel - s_rel0);
        end Spring;

        model Damper "Linear 1D translational damper"
          extends Translational.Interfaces.PartialCompliantWithRelativeStates;
          parameter SI.TranslationalDampingConstant d(final min=0, start = 0)
          "damping constant";
          annotation (
            Documentation(info="<html>
<p>
<i>Linear, velocity dependent damper</i> element. It can be either connected
between a sliding mass and the housing (model Fixed), or
between two sliding masses.
</p>

</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-90,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{90,0}}, color={0,0,0}),
                Polygon(
                  points={{50,-90},{20,-80},{20,-100},{50,-90}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Line(points={{-60,-90},{20,-90}}, color={0,0,0}),
                Text(
                  extent={{0,106},{0,46}},
                  textString="%name",
                  lineColor={0,0,255})}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={
                Line(points={{-90,0},{-60,0}}, color={0,0,0}),
                Line(points={{-60,-30},{-60,30}}, color={0,0,0}),
                Line(points={{-60,-30},{60,-30}}, color={0,0,0}),
                Line(points={{-60,30},{60,30}}, color={0,0,0}),
                Rectangle(
                  extent={{-60,30},{30,-30}},
                  lineColor={0,0,0},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Line(points={{30,0},{90,0}}, color={0,0,0}),
                Line(points={{-50,60},{50,60}}, color={128,128,128}),
                Polygon(
                  points={{50,63},{60,60},{50,57},{50,63}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-40,68},{38,90}},
                  lineColor={128,128,128},
                  textString="der(s_rel)")}));

        equation
          f = d*v_rel;
        end Damper;
      end Components;

      package Sources "Sources to drive 1D translational mechanical components"
        extends Modelica.Icons.Library2;
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Polygon(
                points={{-100,-32},{10,-32},{10,-1},{80,-42},{10,-83},{10,-52},{-100,
                    -52},{-100,-32}},
                lineColor={0,127,0},
                fillColor={0,127,0},
                fillPattern=FillPattern.Solid)}),               Documentation(info="<html>
<p>
This package contains ideal sources to drive 1D mechanical translational drive trains.
</p>
</html>"));

        model ConstantForce "Constant force, not dependent on speed"
          extends Modelica.Mechanics.Translational.Interfaces.PartialForce;
          parameter Modelica.SIunits.Force f_constant
          "Nominal force (if negative, force is acting as load)";
          annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={Line(points={{-100,0},{98,0}},
                    color={0,0,255}), Text(
                  extent={{-118,58},{126,34}},
                  lineColor={0,0,0},
                  textString="%f_constant")}),
                                   Documentation(info="<HTML>
<p>
Model of constant force, not dependent on velocity of flange.<br>
Positive force acts accelerating.
</p>
</HTML>"));
        equation
          f = -f_constant;
        end ConstantForce;
      end Sources;

      package Interfaces
      "Interfaces for 1-dim. translational mechanical components"
          extends Modelica.Icons.Library;
        annotation (Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
translational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>

</html>
"));

        connector Flange_a
        "(left) 1D translational flange (flange axis directed INTO cut plane, e. g. from left to right)"

          annotation(defaultComponentName = "flange_a",
            Documentation(info="<html>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
INTO the cut plane, i. e. from left to right. All vectors in the cut plane are
resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</HTML>
"),         Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{
                    100,100}}), graphics={Rectangle(
                  extent={{-100,-100},{100,100}},
                  lineColor={0,127,0},
                  fillColor={0,127,0},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},
                    {100,100}}), graphics={Rectangle(
                  extent={{-40,-40},{40,40}},
                  lineColor={0,127,0},
                  fillColor={0,127,0},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-160,110},{40,50}},
                  lineColor={0,127,0},
                  textString="%name")}));

          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
        end Flange_a;

        connector Flange_b
        "right 1D translational flange (flange axis directed OUT OF cut plane)"

          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
          annotation(defaultComponentName = "flange_b",
            Documentation(info="<html>
This is a flange for 1D translational mechanical systems. In the cut plane of
the flange a unit vector n, called flange axis, is defined which is directed
OUT OF the cut plane. All vectors in the cut plane are resolved with respect to
this unit vector. E.g. force f characterizes a vector which is directed in
the direction of n with value equal to f. When this flange is connected to
other 1D translational flanges, this means that the axes vectors of the connected
flanges are identical.
</p>
<p>
The following variables are transported through this connector:
<pre>
  s: Absolute position of the flange in [m]. A positive translation
     means that the flange is translated along the flange axis.
  f: Cut-force in direction of the flange axis in [N].
</pre>
</HTML>
"),         Icon(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Rectangle(
                  extent={{-100,-100},{100,100}},
                  lineColor={0,127,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid)}),
            Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Rectangle(
                  extent={{-40,-40},{40,40}},
                  lineColor={0,127,0},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid), Text(
                  extent={{-40,110},{160,50}},
                  lineColor={0,127,0},
                  textString="%name")}));
        end Flange_b;

        connector Support "Support/housing 1D translational flange"

          SI.Position s "absolute position of flange";
          flow SI.Force f "cut force directed into flange";
          annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics={
                Rectangle(
                  extent={{-60,60},{60,-60}},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid,
                  pattern=LinePattern.None),
                Text(
                  extent={{-160,110},{40,50}},
                  lineColor={0,127,0},
                  textString="%name"),
                Rectangle(
                  extent={{-40,-40},{40,40}},
                  lineColor={0,127,0},
                  fillColor={0,127,0},
                  fillPattern=FillPattern.Solid)}), Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                graphics={Rectangle(
                  extent={{-150,150},{150,-150}},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid,
                  pattern=LinePattern.None), Rectangle(
                  extent={{-90,-90},{90,90}},
                  lineColor={0,127,0},
                  fillColor={0,127,0},
                  fillPattern=FillPattern.Solid)}));
        end Support;

        model InternalSupport
        "Adapter model to utilize conditional support connector"
          input SI.Force f
          "External support force (must be computed via force balance in model where InternalSupport is used; = flange.f)";
          SI.Position s "External support position (= flange.s)";
          Flange_a flange
          "Internal support flange (must be connected to the conditional support connector for useSupport=true and to conditional fixed model for useSupport=false)"
            annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
          annotation (Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                    -100},{100,100}}), graphics), Icon(coordinateSystem(
                  preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
                graphics={Text(
                  extent={{-200,80},{200,40}},
                  lineColor={0,0,255},
                  textString="%name"), Rectangle(
                  extent={{-20,20},{20,-20}},
                  lineColor={0,127,0},
                  fillColor={175,175,175},
                  fillPattern=FillPattern.Solid)}),
            Documentation(info="<html>
<p>
This is an adapter model to utilize a conditional support connector
in an elementary component, i.e., where the component equations are
defined textually:
</p>

<ul>
<li> If <i>useSupport = true</i>, the flange has to be connected to the conditional
     support connector.</li>
<li> If <i>useSupport = false</i>, the flange has to be connected to the conditional
     fixed model.</li>
</ul>

<p>
Variable <b>f</b> is defined as <b>input</b> and must be provided when using
this component as a modifier (computed via a force balance in
the model where InternalSupport is used). Usually, model InternalSupport is
utilized via the partial models:
</p>

<blockquote>
<a href=\"Modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryOneFlangeAndSupport\">
PartialElementaryOneFlangeAndSupport</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryTwoFlangesAndSupport\">
PartialElementaryTwoFlangesAndSupport</a>,<br>
<a href=\"Modelica://Modelica.Mechanics.Translational.Interfaces.PartialElementaryRotationalToTranslational\">
PartialElementaryRotationalToTranslational</a>.</li>
</blockquote>

<p>
Note, the support position can always be accessed as internalSupport.s, and
the support force can always be accessed as internalSupport.f.
</p>


</html>"));
        equation
          flange.f = f;
          flange.s = s;
        end InternalSupport;

        partial model PartialCompliant
        "Compliant connection of two translational 1D flanges"

          Flange_a flange_a
          "Left flange of compliant 1-dim. translational component" 
             annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                  rotation=0)));
          Flange_b flange_b
          "Right flange of compliant 1-dim. translational component" 
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));
          SI.Distance s_rel(start=0)
          "relative distance (= flange_b.s - flange_a.s)";
          SI.Force f
          "force between flanges (positive in direction of flange axis R)";
          annotation (
            Documentation(info="<html>
<p>
This is a 1D translational component with a <i>compliant </i>connection of two
translational 1D flanges where inertial effects between the two
flanges are not included. The absolute value of the force at the left and the right
flange is the same. It is used to built up springs, dampers etc.
</p>

</HTML>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics={Polygon(
                  points={{50,-90},{20,-80},{20,-100},{50,-90}},
                  lineColor={128,128,128},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid), Line(points={{-60,-90},{20,-90}},
                    color={0,0,0})}));

        equation
          s_rel = flange_b.s - flange_a.s;
          flange_b.f = f;
          flange_a.f = -f;
        end PartialCompliant;

        partial model PartialCompliantWithRelativeStates
        "Base model for the compliant connection of two translational 1-dim. shaft flanges where the relative position and relative velocities are used as states"

          parameter StateSelect stateSelect=StateSelect.prefer
          "Priority to use phi_rel and w_rel as states" 
          annotation(HideResult=true, Dialog(tab="Advanced"));
          parameter SI.Distance s_nominal=1e-4
          "Nominal value of s_rel (used for scaling)"     annotation(Dialog(tab="Advanced"));

          SI.Distance s_rel(start=0, stateSelect=stateSelect, nominal=s_nominal)
          "Relative distance (= flange_b.s - flange_a.s)";
          SI.Velocity v_rel(start=0, stateSelect=stateSelect)
          "Relative velocity (= der(s_rel))";

          SI.Force f "Forces between flanges (= flange_b.f)";
          Translational.Interfaces.Flange_a flange_a
          "Left flange of compliant 1-dim. translational component" 
            annotation (Placement(transformation(extent={{-110,-10},{-90,10}},
                  rotation=0)));
          Translational.Interfaces.Flange_b flange_b
          "Right flange of compliant 1-dim. transational component" 
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));
          annotation (
            Documentation(info="<html>
<p>
This is a 1-dim. translational component with a compliant connection of two
translational 1-dim. flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-forces
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.f + flange_b.f = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>

<p>
The difference to base classe \"PartialCompliant\" is that the relative
distance and the relative velocity are defined as preferred states.
The reason is that for a large class of drive trains,
the absolute position is quickly increasing during operation.
Numerically, it is better to use relative distances between drive train components
because they remain in a limited size. For this reason, StateSelect.prefer
is set for the relative distance of this component.
</p>

<p>
In order to improve the numerics, a nominal value for the relative distance
should be set, since drive train distances are in a small order and
then step size control of the integrator is practically switched off for
such a variable. A default nominal value of s_nominal = 1e-4 is defined.
This nominal value might also be computed from other values, such
as \"s_nominal = f_nominal / c\" for a spring, if f_nominal
and c have more meaningful values for the user.
</p>

</html>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics));

        equation
          s_rel = flange_b.s - flange_a.s;
          v_rel = der(s_rel);
          flange_b.f =  f;
          flange_a.f = -f;
        end PartialCompliantWithRelativeStates;

        partial model PartialElementaryOneFlangeAndSupport2
        "Partial model for a component with one translational 1-dim. shaft flange and a support used for textual modeling, i.e., for elementary models"
          parameter Boolean useSupport=false
          "= true, if support flange enabled, otherwise implicitly grounded" 
              annotation(Evaluate=true, HideResult=true, choices(__Dymola_checkBox=true));
          Modelica.SIunits.Length s = flange.s - s_support
          "distance between flange and support (= flange.s - support.s)";
          Flange_b flange "Flange of component" 
            annotation (Placement(transformation(extent={{90,-10},{110,10}},
                  rotation=0)));
          Support support(s=s_support, f=-flange.f) if useSupport
          "Support/housing of component" 
            annotation (Placement(transformation(extent={{-10,-110},{10,-90}})));
      protected
          Modelica.SIunits.Length s_support
          "Absolute position of support flange";
        equation
          if not useSupport then
             s_support = 0;
          end if;

          annotation (
            Documentation(info="<html>
<p>
This is a 1-dim. translational component with one flange and a support/housing.
It is used to build up elementary components of a drive train with
equations in the text layer.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>

</HTML>
"),         Diagram(coordinateSystem(
                preserveAspectRatio=true,
                extent={{-100,-100},{100,100}},
                grid={2,2}), graphics),
            Icon(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                    100,100}}), graphics={
                Line(
                  visible=not useSupport,
                  points={{-50,-120},{-30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-120},{-10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-10,-120},{10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{10,-120},{30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-100},{30,-100}},
                  color={0,0,0})}));
        end PartialElementaryOneFlangeAndSupport2;

      partial model PartialForce
        "Partial model of a force acting at the flange (accelerates the flange)"
        extends PartialElementaryOneFlangeAndSupport2;
        Modelica.SIunits.Force f = flange.f
          "Accelerating force acting at flange (= flange.f)";
        annotation (
          Diagram(coordinateSystem(preserveAspectRatio=true,  extent={{-100,-100},{
                    100,100}}),
                  graphics),
          Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                    100}}), graphics={
                Rectangle(
                  extent={{-96,96},{96,-96}},
                  lineColor={255,255,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Line(points={{0,-60},{0,-100}}, color={0,0,0}),
                Text(
                  extent={{-150,140},{150,100}},
                  lineColor={0,0,255},
                  textString="%name"),
                Line(points={{-78,80},{51,80}}, color={0,0,0}),
                Polygon(
                  points={{81,80},{51,90},{51,70},{81,80}},
                  lineColor={0,0,0},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Line(points={{-52,-60},{77,-60}}, color={0,0,0}),
                Polygon(
                  points={{-82,-60},{-51,-50},{-51,-70},{-82,-60}},
                  lineColor={0,0,0},
                  fillColor={128,128,128},
                  fillPattern=FillPattern.Solid),
                Line(
                  visible=not useSupport,
                  points={{-50,-120},{-30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-120},{-10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-10,-120},{10,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{10,-120},{30,-100}},
                  color={0,0,0}),
                Line(
                  visible=not useSupport,
                  points={{-30,-100},{30,-100}},
                  color={0,0,0})}),
          Documentation(info="<HTML>
<p>
Partial model of force that accelerates the flange.
</p>

<p>
If <i>useSupport=true</i>, the support connector is conditionally enabled
and needs to be connected.<br>
If <i>useSupport=false</i>, the support connector is conditionally disabled
and instead the component is internally fixed to ground.
</p>
</HTML>"));
      end PartialForce;
      end Interfaces;
    end Translational;
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={
        Rectangle(
          extent={{-5,-40},{45,-70}},
          lineColor={0,0,0},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={192,192,192}),
        Ellipse(extent={{-90,-50},{-80,-60}}, lineColor={0,0,0}),
        Line(
          points={{-85,-55},{-60,-21}},
          color={0,0,0},
          thickness=0.5),
        Ellipse(extent={{-65,-16},{-55,-26}}, lineColor={0,0,0}),
        Line(
          points={{-60,-21},{9,-55}},
          color={0,0,0},
          thickness=0.5),
        Ellipse(
          extent={{4,-50},{14,-60}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Line(points={{-10,-34},{72,-34},{72,-76},{-10,-76}}, color={0,0,0})}),
    Documentation(info="<HTML>
<p>
This package contains components to model the movement
of 1-dim. rotational, 1-dim. translational, and
3-dim. <b>mechanical systems</b>.
</p>
</HTML>
"));
  end Mechanics;

  package Math
  "Library of mathematical functions (e.g., sin, cos) and of functions operating on vectors and matrices"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;
  annotation (
    Invisible=true,
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,100}}),
        graphics={Text(
          extent={{-59,-9},{42,-56}},
          lineColor={0,0,0},
          textString="f(x)")}),
    Documentation(info="<HTML>
<p>
This package contains <b>basic mathematical functions</b> (such as sin(..)),
as well as functions operating on <b>vectors</b> and <b>matrices</b>.
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

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Function tempInterpol2 added.</li>
<li><i>Oct. 24, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Icons for icon and diagram level introduced.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>

</html>"));

  package Vectors "Library of functions operating on vectors"
    extends Modelica.Icons.Library;
    annotation (
      preferedView = "info",
      Documentation(info="<HTML>
<h4>Library content</h4>
<p>
This library provides functions operating on vectors:
</p>
<table border=1 cellspacing=0 cellpadding=2>
  <tr><th><i>Function</i></th>
      <th><i>Description</i></th>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.isEqual\">isEqual</a>(v1, v2)</td>
      <td valign=\"top\">Determines whether two vectors have the same size and elements</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.norm\">norm</a>(v,p)</td>
      <td valign=\"top\">p-norm of vector v</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.length\">length</a>(v)</td>
      <td valign=\"top\">Length of vector v (= norm(v,2), but inlined and therefore usable in
          symbolic manipulations) </td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.normalize\">normalize</a>(v)</td>
      <td valign=\"top\">Return normalized vector such that length = 1 and prevent
          zero-division for zero vector</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.reverse\">reverse</a>(v)</td>
      <td valign=\"top\">Reverse vector elements</td>
  </tr>
  <tr><td valign=\"top\"><a href=\"Modelica://Modelica.Math.Vectors.sort\">sort</a>(v)</td>
      <td valign=\"top\">Sort elements of vector in ascending or descending order</td>
  </tr>
</table>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Matrices\">Matrices</a>
</HTML>"));

    function length
    "Return length of a vectorReturn length of a vector (better as norm(), if further symbolic processing is performed)"
      extends Modelica.Icons.Function;
      input Real v[:] "Vector";
      output Real result "Length of vector v";
      annotation (Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Vectors.<b>length</b>(v);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>Vectors.<b>length</b>(v)</code>\" returns the
<b>Euclidean length</b> \"<code>sqrt(v*v)</code>\" of vector v.
The function call is equivalent to Vectors.norm(v). The advantage of
length(v) over norm(v)\"is that function length(..) is implemented
in one statement and therefore the function is usually automatically
inlined. Further symbolic processing is therefore possible, which is
not the case with function norm(..).
</p>
<h4>Example</h4>
<blockquote><pre>
  v = {2, -4, -2, -1};
  <b>length</b>(v);  // = 5
</pre></blockquote>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Vectors.norm\">Vectors.norm</a>
</html>"));
    algorithm
      result := sqrt(v*v);
    end length;

    function normalize
    "Return normalized vector such that length = 1Return normalized vector such that length = 1 and prevent zero-division for zero vector"
      extends Modelica.Icons.Function;
      input Real v[:] "Vector";
      input Real eps = 100*Modelica.Constants.eps
      "if |v| < eps then result = v/eps";
      output Real result[size(v, 1)] "Input vector v normalized to length=1";

      annotation (Inline=true, Documentation(info="<html>
<h4>Syntax</h4>
<blockquote><pre>
Vectors.<b>normalize</b>(v);
Vectors.<b>normalize</b>(v,eps=100*Modelica.Constants.eps);
</pre></blockquote>
<h4>Description</h4>
<p>
The function call \"<code>Vectors.<b>normalize</b>(v)</code>\" returns the
<b>unit vector</b> \"<code>v/length(v)</code>\" of vector v.
If length(v) is close to zero (more precisely, if length(v) &lt; eps),
v/eps is returned in order to avoid
a division by zero. For many applications this is useful, because
often the unit vector <b>e</b> = <b>v</b>/length(<b>v</b>) is used to compute
a vector x*<b>e</b>, where the scalar x is in the order of length(<b>v</b>),
i.e., x*<b>e</b> is small, when length(<b>v</b>) is small and then
it is fine to replace <b>e</b> by <b>v</b> to avoid a division by zero.
</p>
<p>
Since the function is implemented in one statement,
it is usually inlined and therefore symbolic processing is
possible.
</p>
<h4>Example</h4>
<blockquote><pre>
  <b>normalize</b>({1,2,3});  // = {0.267, 0.534, 0.802}
  <b>normalize</b>({0,0,0});  // = {0,0,0}
</pre></blockquote>
<h4>See also</h4>
<a href=\"Modelica://Modelica.Math.Vectors.length\">Vectors.length</a>
</html>"));
    algorithm
      result := smooth(0,if length(v) >= eps then v/length(v) else v/eps);
    end normalize;
  end Vectors;

  function sin "Sine"
    extends baseIcon1;
    input SI.Angle u;
    output Real y;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},
                {-43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},
                {-14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},
                {29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{
                57.5,-61.9},{63.9,-47.2},{72,-24.8},{80,0}}, color={0,0,0}),
          Text(
            extent={{12,84},{84,36}},
            lineColor={192,192,192},
            textString="sin")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-100,0},{84,0}}, color={95,95,95}),
          Polygon(
            points={{100,0},{84,6},{84,-6},{100,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,0},{-68.7,34.2},{-61.5,53.1},{-55.1,66.4},{-49.4,74.6},{
                -43.8,79.1},{-38.2,79.8},{-32.6,76.6},{-26.9,69.7},{-21.3,59.4},{
                -14.9,44.1},{-6.83,21.2},{10.1,-30.8},{17.3,-50.2},{23.7,-64.2},{
                29.3,-73.1},{35,-78.4},{40.6,-80},{46.2,-77.6},{51.9,-71.5},{57.5,
                -61.9},{63.9,-47.2},{72,-24.8},{80,0}},
            color={0,0,255},
            thickness=0.5),
          Text(
            extent={{-105,72},{-85,88}},
            textString="1",
            lineColor={0,0,255}),
          Text(
            extent={{70,25},{90,5}},
            textString="2*pi",
            lineColor={0,0,255}),
          Text(
            extent={{-103,-72},{-83,-88}},
            textString="-1",
            lineColor={0,0,255}),
          Text(
            extent={{82,-6},{102,-26}},
            lineColor={95,95,95},
            textString="u"),
          Line(
            points={{-80,80},{-28,80}},
            color={175,175,175},
            smooth=Smooth.None),
          Line(
            points={{-80,-80},{50,-80}},
            color={175,175,175},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This function returns y = sin(u), with -&infin; &lt; u &lt; &infin;:
</p>

<p>
<img src=\"../Images/Math/sin.png\">
</p>
</html>"));

  external "C" y=  sin(u);
  annotation(Library="ModelicaExternalC");
  end sin;

  function cos "Cosine"
    extends baseIcon1;
    input SI.Angle u;
    output Real y;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},
                {-48.6,26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},
                {-4.42,-78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},
                {24.5,-45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,
                73.4},{75.2,78.6},{80,80}}, color={0,0,0}),
          Text(
            extent={{-36,82},{36,34}},
            lineColor={192,192,192},
            textString="cos")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Text(
            extent={{-103,72},{-83,88}},
            textString="1",
            lineColor={0,0,255}),
          Text(
            extent={{-103,-72},{-83,-88}},
            textString="-1",
            lineColor={0,0,255}),
          Text(
            extent={{70,25},{90,5}},
            textString="2*pi",
            lineColor={0,0,255}),
          Line(points={{-100,0},{84,0}}, color={95,95,95}),
          Polygon(
            points={{98,0},{82,6},{82,-6},{98,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,80},{-74.4,78.1},{-68.7,72.3},{-63.1,63},{-56.7,48.7},{-48.6,
                26.6},{-29.3,-32.5},{-22.1,-51.7},{-15.7,-65.3},{-10.1,-73.8},{-4.42,
                -78.8},{1.21,-79.9},{6.83,-77.1},{12.5,-70.6},{18.1,-60.6},{24.5,
                -45.7},{32.6,-23},{50.3,31.3},{57.5,50.7},{63.9,64.6},{69.5,73.4},
                {75.2,78.6},{80,80}},
            color={0,0,255},
            thickness=0.5),
          Text(
            extent={{78,-6},{98,-26}},
            lineColor={95,95,95},
            textString="u"),
          Line(
            points={{-80,-80},{18,-80}},
            color={175,175,175},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This function returns y = cos(u), with -&infin; &lt; u &lt; &infin;:
</p>

<p>
<img src=\"../Images/Math/cos.png\">
</p>
</html>"));

  external "C" y=  cos(u);
  annotation(Library="ModelicaExternalC");
  end cos;

  function asin "Inverse sine (-1 <= u <= 1)"
    extends baseIcon2;
    input Real u;
    output SI.Angle y;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,
                -49.8},{-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,
                52.7},{75.2,62.2},{77.6,67.5},{80,80}}, color={0,0,0}),
          Text(
            extent={{-88,78},{-16,30}},
            lineColor={192,192,192},
            textString="asin")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Text(
            extent={{-40,-72},{-15,-88}},
            textString="-pi/2",
            lineColor={0,0,255}),
          Text(
            extent={{-38,88},{-13,72}},
            textString=" pi/2",
            lineColor={0,0,255}),
          Text(
            extent={{68,-9},{88,-29}},
            textString="+1",
            lineColor={0,0,255}),
          Text(
            extent={{-90,21},{-70,1}},
            textString="-1",
            lineColor={0,0,255}),
          Line(points={{-100,0},{84,0}}, color={95,95,95}),
          Polygon(
            points={{98,0},{82,6},{82,-6},{98,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-80,-80},{-79.2,-72.8},{-77.6,-67.5},{-73.6,-59.4},{-66.3,-49.8},
                {-53.5,-37.3},{-30.2,-19.7},{37.4,24.8},{57.5,40.8},{68.7,52.7},{
                75.2,62.2},{77.6,67.5},{80,80}},
            color={0,0,255},
            thickness=0.5),
          Text(
            extent={{82,24},{102,4}},
            lineColor={95,95,95},
            textString="u"),
          Line(
            points={{0,80},{86,80}},
            color={175,175,175},
            smooth=Smooth.None),
          Line(
            points={{80,86},{80,-10}},
            color={175,175,175},
            smooth=Smooth.None)}),
      Documentation(info="<html>
<p>
This function returns y = asin(u), with -1 &le; u &le; +1:
</p>

<p>
<img src=\"../Images/Math/asin.png\">
</p>
</html>"));

  external "C" y=  asin(u);
  annotation(Library="ModelicaExternalC");
  end asin;

  function atan2 "Four quadrant inverse tangent"
    extends baseIcon2;
    input Real u1;
    input Real u2;
    output SI.Angle y;

    annotation (
      Icon(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-90,0},{68,0}}, color={192,192,192}),
          Polygon(
            points={{90,0},{68,8},{68,-8},{90,0}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Line(points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},
                {69.9,-45.8},{80,-45.1}}, color={0,0,0}),
          Line(points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,
                -14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{
                62.1,33.5},{80,34.9}}, color={0,0,0}),
          Line(points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,
                65.8},{-1.82,77.2},{0,80}}, color={0,0,0}),
          Text(
            extent={{-90,-46},{-18,-94}},
            lineColor={192,192,192},
            textString="atan2")}),
      Diagram(coordinateSystem(
          preserveAspectRatio=true,
          extent={{-100,-100},{100,100}},
          grid={2,2}), graphics={
          Line(points={{-100,0},{84,0}}, color={95,95,95}),
          Polygon(
            points={{96,0},{80,6},{80,-6},{96,0}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid),
          Line(
            points={{0,-80},{8.93,-67.2},{17.1,-59.3},{27.3,-53.6},{42.1,-49.4},{
                69.9,-45.8},{80,-45.1}},
            color={0,0,255},
            thickness=0.5),
          Line(
            points={{-80,-34.9},{-46.1,-31.4},{-29.4,-27.1},{-18.3,-21.5},{-10.3,
                -14.5},{-2.03,-3.17},{7.97,11.6},{15.5,19.4},{24.3,25},{39,30},{
                62.1,33.5},{80,34.9}},
            color={0,0,255},
            thickness=0.5),
          Line(
            points={{-80,45.1},{-45.9,48.7},{-29.1,52.9},{-18.1,58.6},{-10.2,65.8},
                {-1.82,77.2},{0,80}},
            color={0,0,255},
            thickness=0.5),
          Text(
            extent={{-32,89},{-10,74}},
            textString="pi",
            lineColor={0,0,255}),
          Text(
            extent={{-32,-72},{-4,-88}},
            textString="-pi",
            lineColor={0,0,255}),
          Text(
            extent={{0,55},{20,42}},
            textString="pi/2",
            lineColor={0,0,255}),
          Line(points={{0,40},{-8,40}}, color={192,192,192}),
          Line(points={{0,-40},{-8,-40}}, color={192,192,192}),
          Text(
            extent={{0,-23},{20,-42}},
            textString="-pi/2",
            lineColor={0,0,255}),
          Text(
            extent={{62,-4},{94,-26}},
            lineColor={95,95,95},
            textString="u1, u2"),
          Line(
            points={{-88,40},{86,40}},
            color={175,175,175},
            smooth=Smooth.None),
          Line(
            points={{-86,-40},{86,-40}},
            color={175,175,175},
            smooth=Smooth.None)}),
      Documentation(info="<HTML>
This function returns y = atan2(u1,u2) such that tan(y) = u1/u2 and
y is in the range -pi &lt; y &le; pi. u2 may be zero, provided
u1 is not zero. Usually u1, u2 is provided in such a form that
u1 = sin(y) and u2 = cos(y):
</p>

<p>
<img src=\"../Images/Math/atan2.png\">
</p>

</HTML>
"));

  external "C" y=  atan2(u1, u2);
  annotation(Library="ModelicaExternalC");
  end atan2;

  partial function baseIcon1
    "Basic icon for mathematical function with y-axis on left side"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{-80,-80},{-80,68}}, color={192,192,192}),
          Polygon(
            points={{-80,90},{-88,68},{-72,68},{-80,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}),                          Diagram(
          coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Line(points={{-80,80},{-88,80}}, color={95,95,95}),
          Line(points={{-80,-80},{-88,-80}}, color={95,95,95}),
          Line(points={{-80,-90},{-80,84}}, color={95,95,95}),
          Text(
            extent={{-75,104},{-55,84}},
            lineColor={95,95,95},
            textString="y"),
          Polygon(
            points={{-80,98},{-86,82},{-74,82},{-80,98}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid)}),
      Documentation(info="<html>
<p>
Icon for a mathematical function, consisting of an y-axis on the left side.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
  end baseIcon1;

  partial function baseIcon2
    "Basic icon for mathematical function with y-axis in middle"

    annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
              -100},{100,100}}), graphics={
          Rectangle(
            extent={{-100,100},{100,-100}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{0,-80},{0,68}}, color={192,192,192}),
          Polygon(
            points={{0,90},{-8,68},{8,68},{0,90}},
            lineColor={192,192,192},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-150,150},{150,110}},
            textString="%name",
            lineColor={0,0,255})}),                          Diagram(graphics={
          Line(points={{0,80},{-8,80}}, color={95,95,95}),
          Line(points={{0,-80},{-8,-80}}, color={95,95,95}),
          Line(points={{0,-90},{0,84}}, color={95,95,95}),
          Text(
            extent={{5,104},{25,84}},
            lineColor={95,95,95},
            textString="y"),
          Polygon(
            points={{0,98},{-6,82},{6,82},{0,98}},
            lineColor={95,95,95},
            fillColor={95,95,95},
            fillPattern=FillPattern.Solid)}),
      Documentation(revisions="<html>
<p>
Icon for a mathematical function, consisting of an y-axis in the middle.
It is expected, that an x-axis is added and a plot of the function.
</p>
</html>"));
  end baseIcon2;
  end Math;

  package Utilities
  "Library of utility functions dedicated to scripting (operating on files, streams, strings, system)"
    extends Modelica.Icons.Library;

    package Internal
    "Internal components that a user should usually not directly utilize"

    partial package PartialModelicaServices
      "Interfaces of components requiring a tool specific implementation"
      package Animation "Models and functions for 3-dim. animation"

      partial model PartialShape
          "Different visual shapes with variable size; all data have to be set as modifiers"

        import SI = Modelica.SIunits;
        import Modelica.Mechanics.MultiBody.Frames;
        import Modelica.Mechanics.MultiBody.Types;

        parameter Types.ShapeType shapeType="box"
            "Type of shape (box, sphere, cylinder, pipecylinder, cone, pipe, beam, gearwheel, spring)";
        input Frames.Orientation R=Frames.nullRotation()
            "Orientation object to rotate the world frame into the object frame"
                                                                                annotation(Dialog);
        input SI.Position r[3]={0,0,0}
            "Position vector from origin of world frame to origin of object frame, resolved in world frame"
                                                                                                          annotation(Dialog);
        input SI.Position r_shape[3]={0,0,0}
            "Position vector from origin of object frame to shape origin, resolved in object frame"
                                                                                                  annotation(Dialog);
        input Real lengthDirection[3](each final unit="1")={1,0,0}
            "Vector in length direction, resolved in object frame" 
                                                                  annotation(Dialog);
        input Real widthDirection[3](each final unit="1")={0,1,0}
            "Vector in width direction, resolved in object frame" 
                                                                 annotation(Dialog);
        input SI.Length length=0 "Length of visual object"  annotation(Dialog);
        input SI.Length width=0 "Width of visual object"  annotation(Dialog);
        input SI.Length height=0 "Height of visual object"  annotation(Dialog);
        input Types.ShapeExtra extra=0.0
            "Additional size data for some of the shape types"                               annotation(Dialog);
        input Real color[3]={255,0,0} "Color of shape"               annotation(Dialog);
        input Types.SpecularCoefficient specularCoefficient = 0.7
            "Reflection of ambient light (= 0: light is completely absorbed)" 
                                                                            annotation(Dialog);
        // Real rxry[3, 2];
        annotation (
          Icon(coordinateSystem(
              preserveAspectRatio=true,
              extent={{-100,-100},{100,100}},
              grid={2,2}), graphics={
                Rectangle(
                  extent={{-100,-100},{80,60}},
                  lineColor={0,0,255},
                  fillColor={255,255,255},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{-100,60},{-80,100},{100,100},{80,60},{-100,60}},
                  lineColor={0,0,255},
                  fillColor={192,192,192},
                  fillPattern=FillPattern.Solid),
                Polygon(
                  points={{100,100},{100,-60},{80,-100},{80,60},{100,100}},
                  lineColor={0,0,255},
                  fillColor={160,160,164},
                  fillPattern=FillPattern.Solid),
                Text(
                  extent={{-100,-100},{80,60}},
                  lineColor={0,0,0},
                  textString="%shapeType"),
                Text(
                  extent={{-132,160},{128,100}},
                  textString="%name",
                  lineColor={0,0,255})}),
          Documentation(info="<html>

<p>
This model is documented at
<a href=\"Modelica://Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape\">Modelica.Mechanics.MultiBody.Visualizers.Advanced.Shape</a>.
</p>

</html>
"));

      end PartialShape;
      end Animation;

        annotation (Documentation(info="<html>

<p>
This package contains interfaces of a set of functions and models used in the
Modelica Standard Library that requires a <u>tool specific implementation</u>.
There is an associated package called <u>ModelicaServices</u>. A tool vendor
should provide a proper implementation of this library for the corresponding
tool. The default implementation is \"do nothing\".
In the Modelica Standard Library, the models and functions of ModelicaServices
are used.
</p>

</html>"));
    end PartialModelicaServices;
    end Internal;
      annotation (
  Documentation(info="<html>
<p>
This package contains Modelica <b>functions</b> that are
especially suited for <b>scripting</b>. The functions might
be used to work with strings, read data from file, write data
to file or copy, move and remove files.
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Utilities.UsersGuide\">Modelica.Utilities.User's Guide</a>
     discusses the most important aspects of this library.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Examples\">Modelica.Utilities.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
<p>
The following main sublibraries are available:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.Utilities.Files\">Files</a>
     provides functions to operate on files and directories, e.g.,
     to copy, move, remove files.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Streams\">Streams</a>
     provides functions to read from files and write to files.</li>
<li> <a href=\"Modelica://Modelica.Utilities.Strings\">Strings</a>
     provides functions to operate on strings. E.g.
     substring, find, replace, sort, scanToken.</li>
<li> <a href=\"Modelica://Modelica.Utilities.System\">System</a>
     provides functions to interact with the environment.
     E.g., get or set the working directory or environment
     variables and to send a command to the default shell.</li>
</ul>

<p>
Copyright &copy; 1998-2009, Modelica Association, DLR and Dynasim.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</html>
"));
  end Utilities;

  package Constants
  "Library of mathematical constants and constants of nature (e.g., pi, eps, R, sigma)"
    import SI = Modelica.SIunits;
    import NonSI = Modelica.SIunits.Conversions.NonSIunits;
    extends Modelica.Icons.Library2;

    final constant Real pi=2*Modelica.Math.asin(1.0);

    final constant Real eps=1.e-15 "Biggest number such that 1.0 + eps = 1.0";

    final constant Real inf=1.e+60
    "Biggest Real number such that inf and -inf are representable on the machine";
    annotation (
      Documentation(info="<html>
<p>
This package provides often needed constants from mathematics, machine
dependent constants and constants from nature. The latter constants
(name, value, description) are from the following source:
</p>

<dl>
<dt>Peter J. Mohr and Barry N. Taylor (1999):</dt>
<dd><b>CODATA Recommended Values of the Fundamental Physical Constants: 1998</b>.
    Journal of Physical and Chemical Reference Data, Vol. 28, No. 6, 1999 and
    Reviews of Modern Physics, Vol. 72, No. 2, 2000. See also <a href=
\"http://physics.nist.gov/cuu/Constants/\">http://physics.nist.gov/cuu/Constants/</a></dd>
</dl>

<p>CODATA is the Committee on Data for Science and Technology.</p>

<dl>
<dt><b>Main Author:</b></dt>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e. V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 11 16<br>
    D-82230 We&szlig;ling<br>
    email: <a href=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</a></dd>
</dl>


<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</html>
",   revisions="<html>
<ul>
<li><i>Nov 8, 2004</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Constants updated according to 2002 CODATA values.</li>
<li><i>Dec 9, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants updated according to 1998 CODATA values. Using names, values
       and description text from this source. Included magnetic and
       electric constant.</li>
<li><i>Sep 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Constants eps, inf, small introduced.</li>
<li><i>Nov 15, 1997</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized.</li>
</ul>
</html>"),
      Invisible=true,
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Line(
            points={{-34,-38},{12,-38}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-20,-38},{-24,-48},{-28,-56},{-34,-64}},
            color={0,0,0},
            thickness=0.5),
          Line(
            points={{-2,-38},{2,-46},{8,-56},{14,-64}},
            color={0,0,0},
            thickness=0.5)}),
      Diagram(graphics={
          Rectangle(
            extent={{200,162},{380,312}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{200,312},{220,332},{400,332},{380,312},{200,312}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{400,332},{400,182},{380,162},{380,312},{400,332}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{210,302},{370,272}},
            lineColor={160,160,164},
            textString="Library"),
          Line(
            points={{266,224},{312,224}},
            color={0,0,0},
            thickness=1),
          Line(
            points={{280,224},{276,214},{272,206},{266,198}},
            color={0,0,0},
            thickness=1),
          Line(
            points={{298,224},{302,216},{308,206},{314,198}},
            color={0,0,0},
            thickness=1),
          Text(
            extent={{152,412},{458,334}},
            lineColor={255,0,0},
            textString="Modelica.Constants")}));
  end Constants;

  package Icons "Library of icons"
    annotation (
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{-100,-100},{80,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{-120,135},{120,70}},
            lineColor={255,0,0},
            textString="%name"),
          Text(
            extent={{-90,40},{70,10}},
            lineColor={160,160,164},
            textString="Library"),
          Rectangle(
            extent={{-100,-100},{80,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{-90,40},{70,10}},
            lineColor={160,160,164},
            textString="Library"),
          Polygon(
            points={{-64,-20},{-50,-4},{50,-4},{36,-20},{-64,-20},{-64,-20}},
            lineColor={0,0,0},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Rectangle(
            extent={{-64,-20},{36,-84}},
            lineColor={0,0,0},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid),
          Text(
            extent={{-60,-24},{32,-38}},
            lineColor={128,128,128},
            textString="Library"),
          Polygon(
            points={{50,-4},{50,-70},{36,-84},{36,-20},{50,-4}},
            lineColor={0,0,0},
            fillColor={192,192,192},
            fillPattern=FillPattern.Solid)}),
                              Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of
components which may be used in different libraries.
The icons can be utilized by inheriting them in the desired class
using \"extends\" or by directly copying the \"icon\" layer.
</p>

<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum fuer Luft und Raumfahrt e.V. (DLR)<br>
    Oberpfaffenhofen<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
",   revisions="<html>
<ul>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added new icons <b>Function</b>, <b>Enumerations</b> and <b>Record</b>.</li>
<li><i>June 6, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Replaced <b>model</b> keyword by <b>package</b> if the main
       usage is for inheriting from a package.<br>
       New icons <b>GearIcon</b> and <b>MotorIcon</b>.</li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renaming package Icon to Icons.
       Model Advanced removed (icon not accepted on the Modelica meeting).
       New model Library2, which is the Library icon with enough place
       to add library specific elements in the icon. Icon also used in diagram
       level for models Info, TranslationalSensor, RotationalSensor.</li>
<li><i>July 15, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Model Caution renamed to Advanced, model Sensor renamed to
       TranslationalSensor, new model RotationalSensor.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version.</li>
</ul>
<br>
</html>"));

    partial package Library "Icon for library"

      annotation (             Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-100,-100},{80,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-85,35},{65,-85}},
              lineColor={0,0,255},
              textString="Library"),
            Text(
              extent={{-120,122},{120,73}},
              lineColor={255,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>library</b>.
</p>
</html>"));
    end Library;

    partial package Library2
    "Icon for library where additional icon elements shall be added"

      annotation (             Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-100,-100},{80,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
              fillColor={235,235,235},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-120,125},{120,70}},
              lineColor={255,0,0},
              textString="%name"),
            Text(
              extent={{-90,40},{70,10}},
              lineColor={160,160,164},
              textString="Library")}),
        Documentation(info="<html>
<p>
This icon is designed for a <b>package</b> where a package
specific graphic is additionally included in the icon.
</p>
</html>"));
    end Library2;

    partial model Example "Icon for an example model"

      annotation (             Icon(coordinateSystem(
            preserveAspectRatio=true,
            extent={{-100,-100},{100,100}},
            grid={1,1}), graphics={
            Rectangle(
              extent={{-100,-100},{80,50}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Polygon(
              points={{100,70},{100,-80},{80,-100},{80,50},{100,70}},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-96,3},{77,-49}},
              lineColor={0,0,255},
              textString="Example"),
            Text(
              extent={{-120,132},{120,73}},
              lineColor={255,0,0},
              textString="%name")}),
        Documentation(info="<html>
<p>
This icon is designed for an <b>Example package</b>,
i.e. a package containing executable demo models.
</p>
</html>"));
    equation

    end Example;

    partial function Function "Icon for a function"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Text(
              extent={{-140,162},{136,102}},
              textString="%name",
              lineColor={0,0,255}),
            Ellipse(
              extent={{-100,100},{100,-100}},
              lineColor={255,127,0},
              fillColor={255,255,255},
              fillPattern=FillPattern.Solid),
            Text(
              extent={{-100,100},{100,-100}},
              lineColor={255,127,0},
              textString="f")}),
                          Documentation(info="<html>
<p>
This icon is designed for a <b>function</b>
</p>
</html>"));
    end Function;

    partial record Record "Icon for a record"

      annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={
            Rectangle(
              extent={{-100,50},{100,-100}},
              fillColor={255,255,127},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255}),
            Text(
              extent={{-127,115},{127,55}},
              textString="%name",
              lineColor={0,0,255}),
            Line(points={{-100,-50},{100,-50}}, color={0,0,0}),
            Line(points={{-100,0},{100,0}}, color={0,0,0}),
            Line(points={{0,50},{0,-100}}, color={0,0,0})}),
                                                          Documentation(info="<html>
<p>
This icon is designed for a <b>record</b>
</p>
</html>"));
    end Record;

    type TypeReal "Icon for a Real type"
        extends Real;
        annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={181,181,181},
              fillPattern=FillPattern.Solid), Text(
              extent={{-94,94},{94,-94}},
              lineColor={0,0,0},
              textString="R")}),
                          Documentation(info="<html>
<p>
This icon is designed for a <b>Real</b> type.
</p>
</html>"));
    end TypeReal;

    type TypeInteger "Icon for an Integer type"
        extends Integer;
        annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={181,181,181},
              fillPattern=FillPattern.Solid), Text(
              extent={{-94,94},{94,-94}},
              lineColor={0,0,0},
              textString="I")}),
                          Documentation(info="<html>
<p>
This icon is designed for an <b>Integer</b> type.
</p>
</html>"));
    end TypeInteger;

    type TypeString "Icon for a String type"
        extends String;
        annotation(Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                -100},{100,100}}), graphics={Rectangle(
              extent={{-100,100},{100,-100}},
              lineColor={0,0,0},
              fillColor={181,181,181},
              fillPattern=FillPattern.Solid), Text(
              extent={{-94,94},{94,-94}},
              lineColor={0,0,0},
              textString="S")}),
                          Documentation(info="<html>
<p>
This icon is designed for a <b>String</b> type.
</p>
</html>"));
    end TypeString;
  end Icons;

  package SIunits
  "Library of type and unit definitions based on SI units according to ISO 31-1992"
    extends Modelica.Icons.Library2;
    annotation (
      Invisible=true,
      Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={Text(
            extent={{-63,-13},{45,-67}},
            lineColor={0,0,0},
            textString="[kg.m2]")}),
      Documentation(info="<html>
<p>This package provides predefined types, such as <i>Mass</i>,
<i>Angle</i>, <i>Time</i>, based on the international standard
on units, e.g.,
</p>

<pre>   <b>type</b> Angle = Real(<b>final</b> quantity = \"Angle\",
                     <b>final</b> unit     = \"rad\",
                     displayUnit    = \"deg\");
</pre>

<p>
as well as conversion functions from non SI-units to SI-units
and vice versa in subpackage
<a href=\"Modelica://Modelica.SIunits.Conversions\">Conversions</a>.
</p>

<p>
For an introduction how units are used in the Modelica standard library
with package SIunits, have a look at:
<a href=\"Modelica://Modelica.SIunits.UsersGuide.HowToUseSIunits\">How to use SIunits</a>.
</p>

<p>
Copyright &copy; 1998-2009, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b>
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p>

</html>",   revisions="<html>
<ul>
<li><i>Dec. 14, 2005</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Add User's Guide and removed \"min\" values for Resistance and Conductance.</li>
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Added new package <b>Conversions</b>. Corrected typo <i>Wavelenght</i>.</li>
<li><i>June 6, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Introduced the following new types<br>
       type Temperature = ThermodynamicTemperature;<br>
       types DerDensityByEnthalpy, DerDensityByPressure,
       DerDensityByTemperature, DerEnthalpyByPressure,
       DerEnergyByDensity, DerEnergyByPressure<br>
       Attribute \"final\" removed from min and max values
       in order that these values can still be changed to narrow
       the allowed range of values.<br>
       Quantity=\"Stress\" removed from type \"Stress\", in order
       that a type \"Stress\" can be connected to a type \"Pressure\".</li>
<li><i>Oct. 27, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New types due to electrical library: Transconductance, InversePotential,
       Damping.</li>
<li><i>Sept. 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Renamed from SIunit to SIunits. Subpackages expanded, i.e., the
       SIunits package, does no longer contain subpackages.</li>
<li><i>Aug 12, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Type \"Pressure\" renamed to \"AbsolutePressure\" and introduced a new
       type \"Pressure\" which does not contain a minimum of zero in order
       to allow convenient handling of relative pressure. Redefined
       BulkModulus as an alias to AbsolutePressure instead of Stress, since
       needed in hydraulics.</li>
<li><i>June 29, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Bug-fix: Double definition of \"Compressibility\" removed
       and appropriate \"extends Heat\" clause introduced in
       package SolidStatePhysics to incorporate ThermodynamicTemperature.</li>
<li><i>April 8, 1998</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and Astrid Jaschinski:<br>
       Complete ISO 31 chapters realized.</li>
<li><i>Nov. 15, 1997</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.control.lth.se/~hubertus/\">Hubertus Tummescheit</a>:<br>
       Some chapters realized.</li>
</ul>
</html>"),
      Diagram(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
              100}}), graphics={
          Rectangle(
            extent={{169,86},{349,236}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{169,236},{189,256},{369,256},{349,236},{169,236}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Polygon(
            points={{369,256},{369,106},{349,86},{349,236},{369,256}},
            fillColor={235,235,235},
            fillPattern=FillPattern.Solid,
            lineColor={0,0,255}),
          Text(
            extent={{179,226},{339,196}},
            lineColor={160,160,164},
            textString="Library"),
          Text(
            extent={{206,173},{314,119}},
            lineColor={0,0,0},
            textString="[kg.m2]"),
          Text(
            extent={{163,320},{406,264}},
            lineColor={255,0,0},
            textString="Modelica.SIunits")}));

    package Conversions
    "Conversion functions to/from non SI units and type definitions of non SI units"
      extends Modelica.Icons.Library2;
      annotation (Icon(coordinateSystem(preserveAspectRatio=true,
                       extent={{-100,-100},{100,100}}), graphics={
            Text(
              extent={{-33,-7},{-92,-67}},
              lineColor={0,0,0},
              lineThickness=1,
              textString="°C"),
            Text(
              extent={{82,-7},{22,-67}},
              lineColor={0,0,0},
              textString="K"),
            Line(points={{-26,-36},{6,-36}}, color={0,0,0}),
            Polygon(
              points={{6,-28},{6,-45},{26,-37},{6,-28}},
              pattern=LinePattern.None,
              fillColor={0,0,0},
              fillPattern=FillPattern.Solid,
              lineColor={0,0,255})}),
                                Documentation(info="<HTML>
<p>This package provides conversion functions from the non SI Units
defined in package Modelica.SIunits.Conversions.NonSIunits to the
corresponding SI Units defined in package Modelica.SIunits and vice
versa. It is recommended to use these functions in the following
way (note, that all functions have one Real input and one Real output
argument):</p>
<pre>
  <b>import</b> SI = Modelica.SIunits;
  <b>import</b> Modelica.SIunits.Conversions.*;
     ...
  <b>parameter</b> SI.Temperature     T   = from_degC(25);   // convert 25 degree Celsius to Kelvin
  <b>parameter</b> SI.Angle           phi = from_deg(180);   // convert 180 degree to radian
  <b>parameter</b> SI.AngularVelocity w   = from_rpm(3600);  // convert 3600 revolutions per minutes
                                                      // to radian per seconds
</pre>

</HTML>
"));

      package NonSIunits "Type definitions of non SI units"
        extends Modelica.Icons.Library2;

        type Angle_deg = Real (final quantity="Angle", final unit="deg")
        "Angle in degree";
        annotation (Documentation(info="<HTML>
<p>
This package provides predefined types, such as <b>Angle_deg</b> (angle in
degree), <b>AngularVelocity_rpm</b> (angular velocity in revolutions per
minute) or <b>Temperature_degF</b> (temperature in degree Fahrenheit),
which are in common use but are not part of the international standard on
units according to ISO 31-1992 \"General principles concerning quantities,
units and symbols\" and ISO 1000-1992 \"SI units and recommendations for
the use of their multiples and of certain other units\".</p>
<p>If possible, the types in this package should not be used. Use instead
types of package Modelica.SIunits. For more information on units, see also
the book of Francois Cardarelli <b>Scientific Unit Conversion - A
Practical Guide to Metrication</b> (Springer 1997).</p>
<p>Some units, such as <b>Temperature_degC/Temp_C</b> are both defined in
Modelica.SIunits and in Modelica.Conversions.NonSIunits. The reason is that these
definitions have been placed erroneously in Modelica.SIunits although they
are not SIunits. For backward compatibility, these type definitions are
still kept in Modelica.SIunits.</p>
</HTML>
"),   Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
                  100}}), graphics={Text(
                extent={{-66,-13},{52,-67}},
                lineColor={0,0,0},
                textString="[km/h]")}));
      end NonSIunits;

      function from_deg "Convert from degree to radian"
        extends ConversionIcon;
        input NonSIunits.Angle_deg degree "degree value";
        output Angle radian "radian value";
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={Text(
                extent={{-20,100},{-100,20}},
                lineColor={0,0,0},
                textString="deg"), Text(
                extent={{100,-20},{20,-100}},
                lineColor={0,0,0},
                textString="rad")}));
      algorithm
        radian := (Modelica.Constants.pi/180.0)*degree;
      end from_deg;

      partial function ConversionIcon "Base icon for conversion functions"
        annotation (Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,
                  -100},{100,100}}), graphics={
              Rectangle(
                extent={{-100,100},{100,-100}},
                lineColor={191,0,0},
                fillColor={255,255,255},
                fillPattern=FillPattern.Solid),
              Line(points={{-90,0},{30,0}}, color={191,0,0}),
              Polygon(
                points={{90,0},{30,20},{30,-20},{90,0}},
                lineColor={191,0,0},
                fillColor={191,0,0},
                fillPattern=FillPattern.Solid),
              Text(
                extent={{-115,155},{115,105}},
                textString="%name",
                lineColor={0,0,255})}));
      end ConversionIcon;
    end Conversions;

    type Angle = Real (
        final quantity="Angle",
        final unit="rad",
        displayUnit="deg");

    type Length = Real (final quantity="Length", final unit="m");

    type Position = Length;

    type Distance = Length (min=0);

    type Radius = Length(min=0);

    type Diameter = Length(min=0);

    type Time = Real (final quantity="Time", final unit="s");

    type AngularVelocity = Real (
        final quantity="AngularVelocity",
        final unit="rad/s");

    type AngularAcceleration = Real (final quantity="AngularAcceleration", final unit
        =      "rad/s2");

    type Velocity = Real (final quantity="Velocity", final unit="m/s");

    type Acceleration = Real (final quantity="Acceleration", final unit="m/s2");

    type Frequency = Real (final quantity="Frequency", final unit="Hz");

    type Mass = Real (
        quantity="Mass",
        final unit="kg",
        min=0);

    type Density = Real (
        final quantity="Density",
        final unit="kg/m3",
        displayUnit="g/cm3",
        min=0);

    type MomentOfInertia = Real (final quantity="MomentOfInertia", final unit=
            "kg.m2");

    type Inertia = MomentOfInertia;

    type Force = Real (final quantity="Force", final unit="N");

    type TranslationalSpringConstant=Real(final quantity="TranslationalSpringConstant", final unit
        =                                                                                          "N/m");

    type TranslationalDampingConstant=Real(final quantity="TranslationalDampingConstant", final unit
        =                                                                                            "N.s/m");

    type Torque = Real (final quantity="Torque", final unit="N.m");

    type RotationalDampingConstant=Real(final quantity="RotationalDampingConstant", final unit
        =                                                                                      "N.m.s/rad");

    type Power = Real (final quantity="Power", final unit="W");
  end SIunits;
annotation (
preferredView="info",
version="3.1",
versionBuild=4,
versionDate="2009-08-14",
dateModified = "2009-08-28 08:30:00Z",
revisionId="$Id: package.mo,v 1.1.1.2 2009/09/07 15:17:14 Dag Exp $",
conversion(
 noneFromVersion="3.0.1",
 noneFromVersion="3.0",
 from(version="2.1", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2.1", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos"),
 from(version="2.2.2", script="Scripts/ConvertModelica_from_2.2.2_to_3.0.mos")),
__Dymola_classOrder={"UsersGuide","Blocks","StateGraph","Electrical","Magnetic","Mechanics","Fluid","Media","Thermal",
      "Math","Utilities","Constants", "Icons", "SIunits"},
Settings(NewStateSelection=true),
Documentation(info="<HTML>
<p>
Package <b>Modelica</b> is a <b>standardized</b> and <b>free</b> package
that is developed together with the Modelica language from the
Modelica Association, see
<a href=\"http://www.Modelica.org\">http://www.Modelica.org</a>.
It is also called <b>Modelica Standard Library</b>.
It provides model components in many domains that are based on
standardized interface definitions. Some typical examples are shown
in the next figure:
</p>

<p>
<img src=\"../Images/UsersGuide/ModelicaLibraries.png\">
</p>

<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica://Modelica.UsersGuide.Overview\">Overview</a>
  provides an overview of the Modelica Standard Library
  inside the <a href=\"Modelica://Modelica.UsersGuide\">User's Guide</a>.</li>
<li><a href=\"Modelica://Modelica.UsersGuide.ReleaseNotes\">Release Notes</a>
 summarizes the changes of new versions of this package.</li>
<li> <a href=\"Modelica://Modelica.UsersGuide.Contact\">Contact</a>
  lists the contributors of the Modelica Standard Library.</li>
<li> <a href=\"../help/Documentation/ModelicaStandardLibrary.pdf\">ModelicaStandardLibrary.pdf</a>
  is the complete documentation of the library in pdf format.
<li> The <b>Examples</b> packages in the various libraries, demonstrate
  how to use the components of the corresponding sublibrary.</li>
</ul>

<p>
This version of the Modelica Standard Library consists of
</p>
<ul>
<li> <b>922</b> models and blocks, and</li>
<li> <b>615</b> functions
</ul>
<p>
that are directly usable (= number of public, non-partial classes).
</p>


<p>
<b>Licensed by the Modelica Association under the Modelica License 2</b><br>
Copyright &copy; 1998-2009, ABB, arsenal research, T.&nbsp;Bödrich, DLR, Dynasim, Fraunhofer, Modelon,
TU Hamburg-Harburg, Politecnico di Milano.
</p>

<p>
<i>This Modelica package is <u>free</u> software and
the use is completely at <u>your own risk</u>;
it can be redistributed and/or modified under the terms of the
Modelica license 2, see the license conditions (including the
disclaimer of warranty)
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense2\">here</a></u>
or at
<a href=\"http://www.Modelica.org/licenses/ModelicaLicense2\">
http://www.Modelica.org/licenses/ModelicaLicense2</a>.
</p>

</HTML>
"));
end Modelica;
package Modelica_Mechanics_MultiBody_Examples_Elementary
 extends Modelica.Mechanics.MultiBody.Examples.Elementary;
  annotation(experiment(
    StopTime=1,
    NumberOfIntervals=500,
    Tolerance=0.0001,
    Algorithm="dassl"),uses(Modelica(version="3.1")));
end Modelica_Mechanics_MultiBody_Examples_Elementary;
