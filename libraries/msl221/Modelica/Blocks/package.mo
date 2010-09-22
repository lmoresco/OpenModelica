within Modelica;
package Blocks "Library for basic input/output control blocks (continuous, discrete, logical, table blocks)"
  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;
  annotation(preferedView="info", Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-32,-35},{16,-6}}),Rectangle(visible=true, extent={{-32,-85},{16,-56}}),Line(visible=true, points={{16,-20},{49,-20},{49,-71},{16,-71}}),Line(visible=true, points={{-32,-72},{-64,-72},{-64,-21},{-32,-21}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{16,-71},{29,-67},{29,-74},{16,-71}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-32,-21},{-46,-17},{-46,-25},{-32,-21}})}), Documentation(info="<html>
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
<br>
<br>

<p>
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
", revisions="<html>
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
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Examples "Demonstration examples of the components of this package"
    extends Icons.Library;
    model PID_Controller "Demonstrate usage of the Continuous.LimPID controller"
      extends Modelica.Icons.Example;
      parameter Modelica.SIunits.Angle driveAngle=1.57;
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,0,0}, extent={{-99,8},{-32,48}}),Text(visible=true, fillColor={255,0,0}, extent={{-98,51},{-31,59}}, textString="reference speed generation", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-98,-52},{-60,-46}}, textString="PI controller", fontName="Arial"),Line(visible=true, points={{-76,-44},{-57,-23}}, color={255,0,0}, arrow={Arrow.None,Arrow.Filled}),Rectangle(visible=true, lineColor={255,0,0}, extent={{-25,-50},{99,6}}),Text(visible=true, fillColor={255,0,0}, extent={{4,7},{71,14}}, textString="plant (simple drive train)", fontName="Arial")}), experiment(StopTime=4), experimentSetupOutput, Documentation(info="<html>

<p>
This is a simple drive train controlled by a PID controller:
</p>

<ul>
<li> The two blocks \"kinematic_PTP\" and \"integrator\" are used to generate
     the reference speed (= constant acceleration phase, constant speed phase,
     constant deceleration phase until inertia is at rest). To check
     whether the system starts in steady state, the reference speed is
     zero until time = 0.5 s and then follows the sketched trajectory.</li>

<li> The block \"PI\" is an instance of \"Blocks.Continuous.LimPID\" which is
     a PID controller where several practical important aspects, such as
     anti-windup-compensation has been added. In this case, the control block
     is used as PI controller.</li>

<li> The output of the controller is a torque that drives a motor inertia
     \"inertia1\". Via a complöiant spring/damper component, the load
     inertia \"inertia2\" is attached. A constant external torque of 10 Nm
     is acting on the load inertia.</li>
</ul>

<p>
The PI controller settings included \"limitAtInit=false\", in order that
the controller output limits of 12 Nm are removed from the initialization
problem. 
</p>

<p>
The PI controller is initialized in steady state (initType=SteadyState)
and the drive shall also be initialized in steady state.
However, it is not possible to initialize \"inertia1\" in SteadyState, because
\"der(inertia1.phi)=inertia1.w=0\" is an input to the PI controller that
defines that the derivative of the integrator state is zero (= the same
condition that was already defined by option SteadyState of the PI controller).
Furthermore, one initial condition is missing, because the absolute position
of inertia1 or inertia2 is not defined. The solution shown in this examples is
to initialize the angle and the angular acceleration of \"inertia1\".
</p>

<p>
In the following figure, results of a typical simulation are shown:
</p>

<p>
<img src=\"../Images/Blocks/PID_controller.png\"><br>
<img src=\"../Images/Blocks/PID_controller2.png\">
</p>

<p>
In the upper figure the reference speed (= integrator.y) and
the actual speed (= inertia1.w) are shown. As can be seen,
the system initializes in steady state, since no transients
are present. The inertia follows the reference speed quite good
until the end of the constant speed phase. Then there is a deviation.
In the lower figure the reason can be seen: The output of the
controller (PI.y) is in its limits. The anti-windup compensation
works reasonably, since the input to the limiter (PI.limiter.u)
is forced back to its limit after a transient phase.
</p>

</html>"), Diagram(coordinateSystem(scale=0, extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Blocks.Continuous.LimPID PI(k=100, Ti=0.1, yMax=12, Ni=0.1, initType=Modelica.Blocks.Types.Init.SteadyState, limitsAtInit=false, controllerType=Modelica.Blocks.Types.SimpleController.PI) annotation(Placement(visible=true, transformation(origin={-46,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia inertia1(initType=Modelica.Mechanics.Rotational.Types.Init.InitialAngleAcceleration) annotation(Placement(visible=true, transformation(origin={12,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Torque torque annotation(Placement(visible=true, transformation(origin={-15,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.SpringDamper spring(c=10000.0, d=100, initType=Modelica.Mechanics.Rotational.Types.Init.SteadyState, stateSelection=Modelica.Blocks.Types.StateSelection.Prefer) annotation(Placement(visible=true, transformation(origin={42,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia inertia2(J=2) annotation(Placement(visible=true, transformation(origin={70,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.KinematicPTP kinematicPTP(startTime=0.5, deltaq={driveAngle}) annotation(Placement(visible=true, transformation(origin={-82,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Continuous.Integrator integrator(initType=Modelica.Blocks.Types.Init.InitialState) annotation(Placement(visible=true, transformation(origin={-53,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor annotation(Placement(visible=true, transformation(origin={12,-40}, extent={{10,-10},{-10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.ConstantTorque loadTorque(tau_constant=10) annotation(Placement(visible=true, transformation(origin={93,-10}, extent={{5,-5},{-5,5}}, rotation=0)));
    equation 
      connect(integrator.y,PI.u_s) annotation(Line(visible=true, points={{-42,30},{-37,30},{-37,11},{-67,11},{-67,-10},{-58,-10}}, color={0,0,191}));
      connect(speedSensor.w,PI.u_m) annotation(Line(visible=true, points={{1,-40},{-46,-40},{-46,-22}}, color={0,0,191}));
      connect(PI.y,torque.tau) annotation(Line(visible=true, points={{-35,-10},{-27,-10}}, color={0,0,191}));
      connect(loadTorque.flange,inertia2.flange_b) annotation(Line(visible=true, points={{88,-10},{80,-10}}));
      connect(speedSensor.flange_a,inertia1.flange_b) annotation(Line(visible=true, points={{22,-40},{22,-10}}));
      connect(kinematicPTP.y[1],integrator.u) annotation(Line(visible=true, points={{-71,30},{-65,30}}, color={0,0,191}));
      connect(torque.flange_b,inertia1.flange_a) annotation(Line(visible=true, points={{-5,-10},{2,-10}}));
      connect(inertia1.flange_b,spring.flange_a) annotation(Line(visible=true, points={{22,-10},{32,-10}}));
      connect(spring.flange_b,inertia2.flange_a) annotation(Line(visible=true, points={{52,-10},{60,-10}}));
    end PID_Controller;

    model ShowLogicalSources
      extends Modelica.Icons.Example;
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=10), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Sources.BooleanTable table(table={2,4,6,8}) annotation(Placement(visible=true, transformation(origin={-50,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.BooleanConstant const annotation(Placement(visible=true, transformation(origin={-50,70}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.BooleanStep step(startTime=4) annotation(Placement(visible=true, transformation(origin={-50,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.BooleanPulse pulse(period=1.5) annotation(Placement(visible=true, transformation(origin={-50,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.SampleTrigger sample(period=0.5) annotation(Placement(visible=true, transformation(origin={-50,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.BooleanExpression booleanExpression(y=pulse.y and step.y) annotation(Placement(visible=true, transformation(origin={50,30}, extent={{-30,-10},{30,10}}, rotation=0)));
    end ShowLogicalSources;

    model LogicalNetwork1
      extends Modelica.Icons.Example;
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), experiment(StopTime=10), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Sources.BooleanTable table2(table={1,3,5,7}) annotation(Placement(visible=true, transformation(origin={-70,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.BooleanTable table1(table={2,4,6,8}) annotation(Placement(visible=true, transformation(origin={-70,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Logical.Not Not1 annotation(Placement(visible=true, transformation(origin={-30,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Logical.And And1 annotation(Placement(visible=true, transformation(origin={10,-10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Logical.Or Or1 annotation(Placement(visible=true, transformation(origin={50,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Logical.Pre Pre1 annotation(Placement(visible=true, transformation(origin={-30,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(Or1.y,Pre1.u) annotation(Line(visible=true, points={{61,30},{68,30},{68,-70},{-60,-70},{-60,-50},{-42,-50}}, color={255,0,255}));
      connect(Pre1.y,And1.u2) annotation(Line(visible=true, points={{-19,-50},{-10,-50},{-10,-18},{-2,-18}}, color={255,0,255}));
      connect(Not1.y,And1.u1) annotation(Line(visible=true, points={{-19,-10},{-2,-10}}, color={255,0,255}));
      connect(table1.y,Or1.u1) annotation(Line(visible=true, points={{-59,30},{38,30}}, color={255,0,255}));
      connect(And1.y,Or1.u2) annotation(Line(visible=true, points={{21,-10},{28,-10},{28,22},{38,22}}, color={255,0,255}));
      connect(table2.y,Not1.u) annotation(Line(visible=true, points={{-59,-10},{-42,-10}}, color={255,0,255}));
    end LogicalNetwork1;

    encapsulated model BusUsage "Demonstration of signal bus usage"
      import Modelica.Icons;
      import Modelica.Blocks.Interfaces.Adaptors;
      import Modelica.Blocks.Sources;
      import Modelica;
      extends Icons.Example;
      annotation(experiment(StopTime=1), preferedView="info", Documentation(info="<HTML>
<p><b>Signal bus concept</b></p>
<p>
In technical systems, such as vehicles, robots or satellites, many signals
are exchanged between components. In a simulation system, these signals
are  usually modelled by signal connections of input/output blocks.
Unfortunately, the signal connection structure may become very complicated,
especially for hierarchical models.
</p>
<p>
The same is also true for real technical systems. To reduce complexity
and get higher flexibility, many technical systems use data buses to
exchange data between components. For the same reasons, it is often better
to use a \"signal bus\" concept also in a Modelica model. This is demonstrated
at hand of this model (Modelica.Blocks.Examples.BusUsage), see diagram layer:
</p>
<ul>
<li>The thick line in the middle called \"bus\" is just a connector instance
    which is drawn such that it looks like a \"usual\" bus representation. </li>
<li>A component, such as \"part\", can be directly connected to the \"bus\",
    provided it has also a bus connector, or the \"part\" connector is a
    sub-connector contained in the \"bus\". </li>
</ul>
<p>
Difficulties arise if the input or output connector of an
input/output block shall be connected directly to a variable
of a bus because connections can only be performed between
connectors but not between variables. For convenience,
single variable connectors for Real, Integer and Boolean
variables are provided as Modelica.Blocks.Interfaces.<b>RealSignal</b>,
Modelica.Blocks.Interfaces.<b>IntegerSignal</b>,
Modelica.Blocks.Interfaces.<b>BooleanSignal</b>.
For example, the RealSignal connector is basically defined as:
</p>
<pre>  <b>connector</b> RealSignal = Real;
</pre>
<p>
This allows a definition of a bus in the form:
</p>
<pre>   <b>connector</b> Bus
      RealSignal r1;
      RealSignal r2;
        ...
   <b>end</b> Bus;
</pre>
<p>
and a connection to r1 and r2 is possible since these are connectors.
Unfortunately, signals defined in this way have, by default, no unit.
To improve this situation, a RealSignal is actually defined as
</p>
<pre>   <b>connector</b> RealSignal
      <b>replaceable type</b> SignalType = Real;
      <b>extends</b> SignalType;
   <b>end</b> RealSignal;
</pre>
<p>
This allows a redeclaration of the Real type to the desired type, such as:
</p>
<pre>   <b>connector</b> Bus
      <b>import</b> SI=Modelica.SIunits;
      RealSignal v(<b>redeclare</b> SignalType=SI.Velocity);
      RealSignal p(<b>redeclare</b> SignalType=SI.Pressure);
      ...
   <b>end</b> Bus;
</pre>
<p>
Note, since RealSignal, RealInput and RealOutput have basically
the same definition, it is possible to directly connector
from a RealSignal of a bus to a RealInput or RealOutput of
a block component.
</p>
<p>
If a bus connector contains many signals it is no longer so easy
to test just one part of a system, because all parts of
the bus connector must get a value. To simplify this,
it is practical to provide a <b>RestBus</b> component which
sets all parts of a bus to a default value when selected
via the parameter menu. This is also demonstrated in the example
model (see diagram layer).
</p>
<p>Simulate the system for 1 s. The output of the \"gain\" block
should be the same as the one from the \"generateRealSignal1\"
block.
</p>
</HTML>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      encapsulated package Interfaces "Interfaces specialised for this example"
        connector MultiPort "Combined port of real and boolean signal"
          Real myRealSignal;
          Boolean myBooleanSignal;
          annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={159,159,223}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={159,159,223}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}));
        end MultiPort;

        connector Bus "Signal bus"
          import SI = Modelica.SIunits;
          import Modelica.Blocks.Interfaces.*;
          RealSignal realSignal1(redeclare type SignalType= SI.AngularVelocity ) "First Real signal (angular velocity)";
          RealSignal realSignal2 "Second Real signal";
          IntegerSignal integerSignal "Integer signal";
          BooleanSignal booleanSignal "Boolean signal";
          MultiPort multiSignal "Combined signal";
          annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={127,0,255}, fillColor={127,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={127,0,255}, extent={{-134,108},{134,168}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={127,0,255}, extent={{-134,108},{134,168}}, textString="%name", fontName="Arial"),Rectangle(visible=true, lineColor={127,0,255}, fillColor={127,0,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Documentation(info="<HTML>
<p>Defines connector for signalbus.</p>
</HTML>
"));
        end Bus;

        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end Interfaces;

      encapsulated model Part "Component with MultiPort connector"
        import Modelica.Blocks.Examples;
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={159,159,223}, fillPattern=FillPattern.Solid, extent={{-100,-60},{100,60}}),Text(visible=true, extent={{-106,68},{114,124}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Examples.BusUsage.Interfaces.MultiPort multiSignal annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      equation 
        multiSignal.myRealSignal=time;
        multiSignal.myBooleanSignal=time > 0.5;
      end Part;

      encapsulated model RestBus "Set default values for bus variables that are not defined elsewhere"
        import Modelica.Blocks.Examples;
        parameter Boolean set_realSignal1=false "Set dummy value for desiredThrottle";
        parameter Boolean set_realSignal2=false "Set dummy value for brake";
        parameter Boolean set_integerSignal=false "Set dummy value for controlLeverPosition";
        parameter Boolean set_booleanSignal=false "Set dummy value for desiredGear";
        parameter Boolean set_multiSignal=false "Set dummy value for ignition";
        annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={127,0,255}, extent={{-100,96},{100,156}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{46,-40},{88,-10}}, textString="0", fontName="Arial"),Text(visible=true, extent={{-82,34},{38,62}}, textString="false", fontName="Arial"),Line(visible=true, points={{-28,24},{-28,-66},{0,-66},{0,-104},{0,-102}}, color={127,0,255}),Line(visible=true, points={{68,-46},{68,-66},{0,-66},{0,-108}}, color={127,0,255}),Rectangle(visible=true, extent={{-90,24},{46,78}}),Rectangle(visible=true, extent={{40,-46},{92,-4}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Examples.BusUsage.Interfaces.Bus bus annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,-10},{10,10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,-10},{10,10}}, rotation=-90)));
      equation 
        if set_realSignal1 then
          bus.realSignal1=0;
        end if;
        if set_realSignal2 then
          bus.realSignal2=0;
        end if;
        if set_integerSignal then
          bus.integerSignal=0;
        end if;
        if set_booleanSignal then
          bus.booleanSignal=false;
        end if;
        if set_multiSignal then
          bus.multiSignal.myRealSignal=0;
          bus.multiSignal.myBooleanSignal=false;
        end if;
      end RestBus;

      RestBus restBus(set_realSignal2=true) annotation(Placement(visible=true, transformation(origin={70,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.IntegerStep integerStep(height=1, offset=2, startTime=0.5) annotation(Placement(visible=true, transformation(origin={30,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Sources.BooleanStep booleanStep(startTime=0.5) annotation(Placement(visible=true, transformation(origin={-10,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Sources.Sine sine annotation(Placement(visible=true, transformation(origin={-50,30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Part part annotation(Placement(visible=true, transformation(origin={-86,-50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Math.Gain gain annotation(Placement(visible=true, transformation(origin={-36,-70}, extent={{-10,-10},{10,10}}, rotation=-90)));
    protected 
      Interfaces.Bus bus annotation(Placement(visible=true, transformation(origin={0,-17}, extent={{-80,-3},{80,3}}, rotation=0)));
    equation 
      connect(gain.u,bus.realSignal1) annotation(Line(visible=true, points={{-36,-58},{-36,-17},{0,-17}}, color={0,0,255}));
      connect(integerStep.y,bus.integerSignal) annotation(Line(visible=true, points={{30,19},{30,-17},{0,-17}}, color={255,127,0}));
      connect(booleanStep.y,bus.booleanSignal) annotation(Line(visible=true, points={{-10,19},{-10,-17},{0,-17}}, color={255,0,255}));
      connect(sine.y,bus.realSignal1) annotation(Line(visible=true, points={{-50,19},{-50,-17},{0,-17}}, color={0,0,255}));
      connect(part.multiSignal,bus.multiSignal) annotation(Line(visible=true, points={{-75,-50},{-58,-50},{-58,-17},{0,-17}}));
      connect(restBus.bus,bus) annotation(Line(visible=true, points={{70,19},{70,-17},{0,-17}}, color={127,0,255}));
    end BusUsage;

    annotation(Documentation(info="<html>
<p>
This package contains example models to demonstrate the
usage of package blocks.
</p>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Examples;

end Blocks;
