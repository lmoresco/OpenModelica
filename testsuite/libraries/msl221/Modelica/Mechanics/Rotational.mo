within Modelica.Mechanics;
package Rotational "Library to model 1-dimensional, rotational mechanical systems"
  package UsersGuide "Users Guide"
    annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Users Guide of package Rotational</font></h3>
<p>
Library <b>Rotational</b> is a <b>free</b> Modelica package providing
1-dimensional, rotational mechanical components to model in a convenient way
drive trains with frictional losses.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package Overview "Overview"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Overview</font></h3>
 
<p>
This package contains components to model <b>1-dimensional rotational
mechanical</b> systems, including different types of gearboxes,
shafts with inertia, external torques, spring/damper elements,
frictional elements, backlash, elements to measure angle, angular velocity,
angular acceleration and the cut-torque of a flange. In sublibrary
<b>Examples</b> several examples are present to demonstrate the usage of
the elements. Just open the corresponding example model and simulate
the model according to the provided description.
</p>
<p>
A unique feature of this library is the <b>component-oriented</b>
modeling of <b>Coulomb friction</b> elements, such as friction in bearings,
clutches, brakes, and gear efficiency. Even (dynamically) coupled
friction elements, e.g., as in automatic gearboxes, can be handeled
<b>without</b> introducing stiffness which leads to fast simulations.
The underlying theory is new and is based on the solution of mixed
continuous/discrete systems of equations, i.e., equations where the
<b>unknowns</b> are of type <b>Real</b>, <b>Integer</b> or <b>Boolean</b>.
Provided appropriate numerical algorithms for the solution of such types of
systems are available in the simulation tool, the simulation of
(dynamically) coupled friction elements of this library is
<b>efficient</b> and <b>reliable</b>.
</p>
<p><IMG SRC=\"../Images/drive1.png\" ALT=\"drive1\"></p>
<p>
A simple example of the usage of this library is given in the
figure above. This drive consists of a shaft with inertia J1=0.2 which
is connected via an ideal gearbox with gear ratio=5 to a second shaft
with inertia J2=5. The left shaft is driven via an external,
sinusoidal torque.
The <b>filled</b> and <b>non-filled grey squares</b> at the left and
right side of a component represent <b>mechanical flanges</b>.
Drawing a line between such squares means that the corresponding
flanges are <b>rigidly attached</b> to each other.
By convention in this library, the connector characterized as a
<b>filled</b> grey square is called <b>flange_a</b> and placed at the
left side of the component in the \"design view\" and the connector
characterized as a <b>non-filled</b> grey square is called <b>flange_b</b>
and placed at the right side of the component in the \"design view\".
The two connectors are completely <b>identical</b>, with the only
exception that the graphical layout is a little bit different in order
to distinguish them for easier access of the connector variables.
For example, <tt>J1.flange_a.tau</tt> is the cut-torque in the connector
<tt>flange_a</tt> of component <tt>J1</tt>.
</p>
<p>
The components of this
library can be <b>connected</b> together in an <b>arbitrary</b> way. E.g., it is
possible to connect two springs or two shafts with inertia directly
together, see figure below.
</p>
<p><IMG SRC=\"../Images/driveConnections.png\" ALT=\"driveConnections\"></p>
 
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Overview;

    package FlangeConnectors "Flange Connectors"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Flange connectors</font></h3>
 
<p>
A flange is described by the connector class
Interfaces.<b>Flange_a</b>
or Interfaces.<b>Flange_b</b>. As already noted, the two connector
classes are completely identical. There is only a difference in the icons,
in order to easier identify a flange variable in a diagram.
Both connector classes contain the following variables:
</p>
<pre>
   SIunits.Angle       phi  \"absolute rotation angle of flange\";
   <b>flow</b> SIunits.Torque tau  \"cut-torque in the flange\";
</pre>
<p>
If needed, the angular velocity <tt>w</tt> and the
angular acceleration <tt>a</tt> of a flange connector can be
determined by differentiation of the flange angle <tt>phi</tt>:
</p>
<pre>
     w = <b>der</b>(phi);    a = <b>der</b>(w);
</pre>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end FlangeConnectors;

    package SupportTorques "Support Torques"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Support Torques</font></h3>
 
<p>The following figure shows examples of components equipped with
a bearing flange (framed flange in the lower center), which can be used
to fix components on the ground or on other rotating elements or to combine
them with force elements. If the bearing flange is not connected, the
components are assumed to be mounted on the ground. Otherwise, the bearing
connector offers the possibility to consider, e.g., gearboxes mounted on
the ground via spring-damper-systems (cf. example <tt>ElasticBearing</tt>). Independently, these components
provide a variable <tt>tau_support</tt> stating the support torque exerted
on the bearing.</p>
<p><IMG SRC=\"../Images/bearing.png\" ALT=\"bearing\"></p>
<p>In general, it is not necessary to connect the bearing flange
with a fixation, i.e., the two implementations in the following figure give
identical results.</p>
<p><IMG SRC=\"../Images/bearing2.png\" ALT=\"bearing2\"></p>
 
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end SupportTorques;

    package SignConventions "Sign Conventions"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Sign Conventions</font></h3>
 
<p>
The variables of a component of this library can be accessed in the
usual way. However, since most of these variables are basically elements
of <b>vectors</b>, i.e., have a direction, the question arises how the
signs of variables shall be interpreted. The basic idea is explained
at hand of the following figure:
</p>
<p><IMG SRC=\"../Images/drive2.png\" ALT=\"drive2\"></p>
<p>
In the figure, three identical drive trains are shown. The only
difference is that the gear of the middle drive train and the
gear as well as the right inertia of the lower drive train
are horizontally flipped with regards to the upper drive train.
The signs of variables are now interpreted in the following way:
Due to the 1-dimensional nature of the model, all components are
basically connected together along one line (more complicated
cases are discussed below). First, one has to define
a <b>positive</b> direction of this line, called <b>axis of rotation</b>.
In the top part of the figure this is characterized by an arrow
defined as <tt>axis of rotation</tt>. The simple rule is now:
If a variable of a component is positive and can be interpreted as
the element of a vector (e.g. torque or angular velocity vector), the
corresponding vector is directed into the positive direction
of the axis of rotation. In the following figure, the right-most
inertias of the figure above are displayed with the positive
vector direction displayed according to this rule:
</p>
<p><IMG SRC=\"../Images/drive3.png\" ALT=\"drive3\"></p>
<p>
The cut-torques <tt>J2.flange_a.tau, J4.flange_a.tau, J6.flange_b.tau</tt>
of the right inertias are all identical and are directed into the
direction of rotation if the values are positive. Similiarily,
the angular velocities <tt>J2.w, J4.w, J6.w</tt> of the right inertias
are all identical and are also directed into the
direction of rotation if the values are positive. Some special
cases are shown in the next figure:
</p>
<p><IMG SRC=\"../Images/drive4.png\" ALT=\"drive4\"></p>
<p>
In the upper part of the figure, two variants of the connection of an
external torque and an inertia are shown. In both cases, a positive
signal input into the torque component accelerates the inertias
<tt>inertia1, inertia2</tt> into the positive axis of rotation,
i.e., the angular accelerations <tt>inertia1.a, inertia2.a</tt>
are positive and are directed along the \"axis of rotation\" arrow.
In the lower part of the figure the connection of inertias with
a planetary gear is shown. Note, that the three flanges of the
planetary gearbox are located along the axis of rotation and that
the axis direction determines the positive rotation along these
flanges. As a result, the positive rotation for <tt>inertia4, inertia6</tt>
is as indicated with the additional grey arrows.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end SignConventions;

    package UserDefinedComponents "User Defined Components"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>User Defined Components</font></h3>
<p>
In this section some hints are given to define your own
1-dimensional rotational components which are compatible with the
elements of this package.
It is convenient to define a new
component by inheritance from one of the following base classes,
which are defined in sublibrary Interfaces:
</p>
<table BORDER=1 CELLSPACING=0 CELLPADDING=2>
<tr><th>Name</th><th>Description</th></tr>
<tr><td><tt><b>Rigid</b></tt></td><td>Rigid connection of two rotational 1D flanges (used for elements with inertia).</td></tr>
<tr><td><tt><b>Compliant</b></tt></td><td>Compliant connection of two rotational 1D flanges (used for force laws such as a spring or a damper).</td></tr>
<tr><td><tt><b>TwoFlanges</b></tt></td><td>General connection of two rotational 1D flanges (used for gearboxes).</td></tr>
<tr><td><tt><b>AbsoluteSensor</b></tt></td><td>Measure absolute flange variables.</td></tr>
<tr><td><tt><b>RelativeSensor</b></tt></td><td>Measure relative flange variables.</td></tr>
</table>
<p>
The difference between these base classes are the auxiliary
variables defined in the model and the relations between
the flange variables already defined in the base class.
For example, in model <b>Rigid</b> the flanges flange_a and
flange_b are rigidly connected, i.e., flange_a.phi = flange_b.phi,
whereas in model <b>Compliant</b> the cut-torques are the
same, i.e., flange_a.tau + flange_b.tau = 0.
</p>
<p>
The equations of a mechanical component are vector equations, i.e.,
they need to be expressed in a common coordinate system.
Therefore, for a component a <b>local axis of rotation</b> has to be
defined. All vector quantities, such as cut-torques or angular
velocities have to be expressed according to this definition.
Examples for such a definition are given in the following figure
for an inertia component and a planetary gearbox:
</p>
<p><IMG SRC=\"../Images/driveAxis.png\" ALT=\"driveAxis\"></p>
<p>
As can be seen, all vectors are directed into the direction
of the rotation axis. The angles in the flanges are defined
correspondingly. For example, the angle <tt>sun.phi</tt> in the
flange of the sun wheel of the planetary gearbox is positive,
if rotated in mathematical positive direction (= counter clock
wise) along the axis of rotation.
</p>
<p>
On first view, one may assume that the selected local
coordinate system has an influence on the usage of the
component. But this is not the case, as shown in the next figure:
</p>
<p><IMG SRC=\"../Images/inertias.png\" ALT=\"inertias\"></p>
<p>
In the figure the <b>local</b> axes of rotation of the components
are shown. The connection of two inertias in the left and in the
right part of the figure are completely equivalent, i.e., the right
part is just a different drawing of the left part. This is due to the
fact, that by a connection, the two local coordinate systems are
made identical and the (automatically) generated connection equations
(= angles are identical, cut-torques sum-up to zero) are also
expressed in this common coordinate system. Therefore, even if in
the left figure it seems to be that the angular velocity vector of
<tt>J2</tt> goes from right to left, in reality it goes from
left to right as shown in the right part of the figure, where the
local coordinate systems are drawn such that they are aligned.
Note, that the simple rule stated in section 4 (Sign conventions)
also determines that
the angular velocity of <tt>J2</tt> in the left part of the
figure is directed from left to right.
</p>
<p>
To summarize, the local coordinate system selected for a component
is just necessary, in order that the equations of this component
are expressed correctly. The selection of the coordinate system
is arbitrary and has no influence on the usage of the component.
Especially, the actual direction of, e.g., a cut-torque is most
easily determined by the rule of section 4. A more strict determination
by aligning coordinate systems and then using the vector direction
of the local coordinate systems, often requires a re-drawing of the
diagram and is therefore less convenient to use.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end UserDefinedComponents;

    package RequirementsForSimulationTool "Requirements for Simulation Tools"
      annotation(DocumentationClass=true, Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Requirements for Simulation Tools</font></h3>
 
<p>
This library is designed in a fully object oriented way in order that
components can be connected together in every meaningful combination
(e.g. direct connection of two springs or two inertias).
As a consequence, most models lead to a system of
differential-algebraic equations of <b>index 3</b> (= constraint
equations have to be differentiated twice in order to arrive at
a state space representation) and the Modelica translator or
the simulator has to cope with this system representation.
According to our present knowledge, this requires that the
Modelica translator is able to symbolically differentiate equations
(otherwise it is e.g. not possible to provide consistent initial
conditions; even if consistent initial conditions are present, most
numerical DAE integrators can cope at most with index 2 DAEs).
</p>
</p>
The elements of this library can be connected together in an
arbitrary way. However, difficulties may occur, if the elements which can <b>lock</b> the
<b>relative motion</b> between two flanges are connected <b>rigidly</b>
together such that essentially the <b>same relative motion</b> can be locked.
The reason is
that the cut-torque in the locked phase is not uniquely defined if the
elements are locked at the same time instant (i.e., there does not exist a
unique solution) and some simulation systems may not be
able to handle this situation, since this leads to a singularity during
simulation. Currently, this type of problem can occur with the
Coulomb friction elements <b>BearingFriction, Clutch, Brake, LossyGear</b> when
the elements become stuck:
</p>
<p><IMG SRC=\"../Images/driveConnections2.png\" ALT=\"driveConnections2\"></p>
<p>
In the figure above two typical situations are shown: In the upper part of
the figure, the series connection of rigidly attached BearingFriction and
Clutch components are shown. This does not hurt, because the BearingFriction
element can lock the relative motion between the element and the housing,
whereas the clutch element can lock the relative motion between the two
connected flanges. Contrary, the drive train in the lower part of the figure
may rise to simulation problems, because the BearingFriction element
and the Brake element can lock the relative motion between a flange and
the housing and these flanges are rigidly connected together, i.e.,
essentially the same relative motion can be locked. These difficulties
may be solved by either introducing a compliance between these flanges
or by combining the BearingFriction and Brake element into
one component and resolving the ambiguity of the frictional torque in the
stuck mode. A tool may handle this situation also <b>automatically</b>,
by picking one solution of the infinitely many, e.g., the one where
the difference to the value of the previous time instant is as small
as possible.
</p>
 
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end RequirementsForSimulationTool;

    class ReleaseNotes "Release notes"
      annotation(Documentation(info="<HTML>
<h3><font color=\"#008000\" size=5>Release notes</font></h3>
 
<ul>
<li><i>December 12, 2005</i> 
    by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
    Package documentation split into several parts and provided
    as Users Guide.</li>
 
<li><i>October 27, 2003</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       Bearing flanges added for mounted components and support torque computation implemented.<br>
       New component <tt>Torque2</tt> and new example <tt>ElasticBearing</tt>.
<li><i>October 21, 2002</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>
       and <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
       New components <b>LossyGear</b> (with corresponding examples) and <b>Gear2</b>.<br>
       Interface <b>FrictionBase</b> adapted to new initialization.</li>
<li><i>June 19, 2000</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       New elements:<br><!-- silly construction follows as Dymola not able to handle nested lists -->
       <tt>IdealGearR2T&nbsp;&nbsp;&nbsp;</tt> Ideal gear transforming rotational in translational motion<br>
       <tt>Position&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</tt> Forced movement of a flange with a reference angle given as input signal<br>
       <tt>RelativeStates&nbsp;</tt> Definition of relative state variables<br>
       Icon of Rotational.Torque changed.
       Elements Acceleration, Torque, Fixed, Sensors ordered according
       to the Translational library.</li>
<li><i>Nov. 4, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Improved documentation and improved graphical layout of the diagram level.
       Changes according to the Twente meeting introduced. Especially:
       Alias names, instead of extends. Model Shaft renamed to Inertia.
       Torque1D renamed to Torque.
       AccMotion renamed to Accelerate. LockedL, LockedR replaced by Fixed.
       SpeedSensor splitted into AngleSensor and
       SpeedSensor. RelSpeedSensor splitted into RelAngleSensor and
       RelSpeedSensor. Initialization of friction elements improved.
       Flanges renamed to flange_a, flange_b. MoveAngle renamed to
       KinematicPTP, vectorized and moved to Blocks.Sources.<br>
       Advice given from P. Beater, H. Elmqvist, S.E. Mattsson, H. Olsson
       is appreciated.</li>
<li><i>July 18, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Documentation and icons improved. Appropriate initial conditions
       introduced as start values in the demo models. Bearing model
       replaced by FixedRight and FixedLeft models; sensor elements replaced by
       TorqueSensor, SpeedSensor, AccSensor; new sensor elements
       RelSpeedSensor, RelAccSensor to measure relative kinematic quantitites.
       New elements GearEfficiency and Gear.</li>
<li><i>June 30, 1999</i>
       by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
       Realized a first version based on an existing Dymola library
       of Martin Otter and Hilding Elmqvist.</li>
</ul>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end ReleaseNotes;

    class Contact "Contact"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Contact</font></h3>
<dl>
<dt><b>Main Authors:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a> and
    <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>
    <br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
    Institut f&uuml;r Robotik und Mechatronik<br> 
    Abteilung f&uuml;r Entwurfsorientierte Regelungstechnik<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A>,
           <A HREF=\"mailto:Christian.Schweiger@dlr.de\">Christian.Schweiger@dlr.de</A><br>
</dl>
 
</html>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Contact;

  end UsersGuide;

  package Examples "Demonstration examples of the components of this package"
    extends Modelica.Icons.Library;
    annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains example models to demonstrate the usage of the
Modelica.Mechanics.Rotational package. Open the models and
simulate them according to the provided description in the models.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    encapsulated model First "First example: simple drive train"
      import Modelica.Icons;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import SI = Modelica.SIunits;
      extends Icons.Example;
      parameter Real amplitude=10;
      parameter SI.Frequency freqHz=5;
      parameter SI.Inertia Jmotor(min=0)=0.1;
      parameter SI.Inertia Jload(min=0)=2;
      parameter Real ratio=10;
      parameter Real damping=10;
      annotation(Documentation(info="<html>
<p>The drive train consists of a motor inertia which is driven by
a sine-wave motor torque. Via a gearbox the rotational energy is
transmitted to a load inertia. Elasticity in the gearbox is modeled
by a spring element. A linear damper is used to model the
damping in the gearbox bearing.</p>
<p>Note, that a force component (like the damper of this example)
which is acting between a shaft and the housing has to be fixed
in the housing on one side via component Fixed.</p>
<p>Simulate for 1 second and plot the following variables:<br>
   angular velocities of inertias inertia2 and 3: inertia2.w, inertia3.w</p>
 
</HTML>"), experiment(StopTime=1), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Rotational.Fixed fixed annotation(Placement(visible=true, transformation(origin={46,-52}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Torque torque annotation(Placement(visible=true, transformation(origin={-62,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Inertia inertia1(J=Jmotor) annotation(Placement(visible=true, transformation(origin={-32,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.IdealGear idealGear(ratio=ratio) annotation(Placement(visible=true, transformation(origin={-2,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Inertia inertia2(J=2, phi(start=0), w(start=0)) annotation(Placement(visible=true, transformation(origin={28,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Spring spring(c=10000.0) annotation(Placement(visible=true, transformation(origin={62,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Inertia inertia3(J=Jload, phi(start=0), w(start=0)) annotation(Placement(visible=true, transformation(origin={92,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Sources.Sine sine(amplitude=amplitude, freqHz=freqHz) annotation(Placement(visible=true, transformation(origin={-92,0}, extent={{-8,-8},{8,8}}, rotation=0)));
      Rotational.Damper damper(d=damping) annotation(Placement(visible=true, transformation(origin={46,-28}, extent={{-8,-8},{8,8}}, rotation=-90)));
    equation 
      connect(sine.y,torque.tau) annotation(Line(visible=true, points={{-83.2,0},{-71.6,0}}, color={0,0,191}));
      connect(spring.flange_b,inertia3.flange_a) annotation(Line(visible=true, points={{70,0},{84,0}}));
      connect(inertia2.flange_b,spring.flange_a) annotation(Line(visible=true, points={{36,0},{54,0}}));
      connect(idealGear.flange_b,inertia2.flange_a) annotation(Line(visible=true, points={{6,0},{20,0}}));
      connect(inertia1.flange_b,idealGear.flange_a) annotation(Line(visible=true, points={{-24,0},{-10,0}}));
      connect(torque.flange_b,inertia1.flange_a) annotation(Line(visible=true, points={{-54,0},{-40,0}}));
      connect(damper.flange_a,inertia2.flange_b) annotation(Line(visible=true, points={{46,-20},{46,0},{36,0}}));
      connect(damper.flange_b,fixed.flange_b) annotation(Line(visible=true, points={{46,-36},{46,-52}}));
    end First;

    encapsulated model Friction "Drive train with clutch and brake"
      import Modelica.Icons;
      import Modelica.Blocks.Sources;
      import Modelica.Blocks.Math;
      import Modelica.Mechanics.Rotational;
      import Modelica.Constants.pi;
      import SI = Modelica.SIunits;
      extends Icons.Example;
      parameter SI.Time startTime=0.5 "Start time of step";
      output SI.Torque tMotor "driving torque of inertia3";
      output SI.Torque tClutch "friction torque of clutch";
      output SI.Torque tBrake "friction torque of brake";
      output SI.Torque tSpring "spring torque";
      annotation(Documentation(info="<html>
<p>This drive train contains a frictional <b>clutch</b> and a <b>brake</b>.
Simulate the system for 1 second using the following initial
values (defined already in the model):</p>
<pre>   inertia1.w =  90 (or brake.w)
   inertia2.w =  90
   inertia3.w = 100
</pre>
<p>Plot the output signals</p>
<pre>   tMotor      Torque of motor
   tClutch     Torque in clutch
   tBrake      Torque in brake
   tSpring     Torque in spring
</pre>
<p>as well as the absolute angular velocities of the three inertia components
(inertia1.w, inertia2.w, inertia3.w).</p>
 
</HTML>"), experiment(StopTime=1), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Rotational.Torque torque annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia inertia3(J=1, phi(start=0), w(start=100)) annotation(Placement(visible=true, transformation(origin={-20,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Clutch clutch(fn_max=160) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia inertia2(J=0.05, phi(start=0), w(start=90)) annotation(Placement(visible=true, transformation(origin={20,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.SpringDamper spring(c=160, d=1) annotation(Placement(visible=true, transformation(origin={40,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia inertia1(J=1, phi(start=0), w(start=90)) annotation(Placement(visible=true, transformation(origin={80,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Brake brake(fn_max=1600) annotation(Placement(visible=true, transformation(origin={60,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Sources.Constant const(k=1) annotation(Placement(visible=true, transformation(origin={0,25}, extent={{-5,-5},{5,5}}, rotation=-90)));
      Sources.Step step(startTime=startTime) annotation(Placement(visible=true, transformation(origin={60,25}, extent={{-5,-5},{5,5}}, rotation=-90)));
      Sources.Step step2(height=-1, offset=1, startTime=startTime) annotation(Placement(visible=true, transformation(origin={-80,-10}, extent={{-5,-5},{5,5}}, rotation=0)));
      Sources.Sine sine(amplitude=200, freqHz=50/pi) annotation(Placement(visible=true, transformation(origin={-80,10}, extent={{-5,-5},{5,5}}, rotation=0)));
      Math.Product product annotation(Placement(visible=true, transformation(origin={-60,0}, extent={{-5,-5},{5,5}}, rotation=0)));
    equation 
      connect(step.y,brake.f_normalized) annotation(Line(visible=true, points={{60,19.5},{60,5.5}}, color={0,0,191}));
      connect(const.y,clutch.f_normalized) annotation(Line(visible=true, points={{0,19.5},{3.36767e-16,12.75},{0,12.75},{0,5.5}}, color={0,0,191}));
      connect(product.y,torque.tau) annotation(Line(visible=true, points={{-54.5,0},{-46,0}}, color={0,0,191}));
      connect(step2.y,product.u2) annotation(Line(visible=true, points={{-74.5,-10},{-70,-10},{-70,-3},{-66,-3}}, color={0,0,191}));
      connect(sine.y,product.u1) annotation(Line(visible=true, points={{-74.5,10},{-70,10},{-70,3},{-66,3}}, color={0,0,191}));
      connect(brake.flange_b,inertia1.flange_a) annotation(Line(visible=true, points={{65,0},{75,0}}));
      connect(spring.flange_b,brake.flange_a) annotation(Line(visible=true, points={{45,0},{55,0}}));
      connect(inertia2.flange_b,spring.flange_a) annotation(Line(visible=true, points={{25,0},{35,0}}));
      connect(clutch.flange_b,inertia2.flange_a) annotation(Line(visible=true, points={{5,0},{15,0}}));
      connect(inertia3.flange_b,clutch.flange_a) annotation(Line(visible=true, points={{-15,0},{-5,0}}));
      connect(torque.flange_b,inertia3.flange_a) annotation(Line(visible=true, points={{-35,0},{-25,0}}));
      tMotor=torque.tau;
      tClutch=clutch.tau;
      tBrake=brake.tau;
      tSpring=spring.tau;
    end Friction;

    encapsulated model CoupledClutches "Drive train with 3 dynamically coupled clutches"
      import Modelica.Icons;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import SI = Modelica.SIunits;
      extends Icons.Example;
      parameter SI.Frequency freqHz=0.2 "frequency of sine function to invoke clutch1";
      parameter SI.Time T2=0.4 "time when clutch2 is invoked";
      parameter SI.Time T3=0.9 "time when clutch3 is invoked";
      annotation(Documentation(info="<html>
<p>This example demonstrates how variable structure
drive trains are handeled. The drive train consists
of 4 inertias and 3 clutches, where the clutches
are controlled by input signals. The system has
2^3=8 different configurations and 3^3 = 27
different states (every clutch may be in forward
sliding, backward sliding or locked mode when the
relative angular velocity is zero). By invoking the
clutches at different time instances, the switching
of the configurations can be studied.</p>
<p>Simulate the system for 1.2 seconds with the
following initial values:<br>
J1.w = 10.</p>
<p>Plot the following variables:<br>
angular velocities of inertias (J1.w, J2.w, J3.w,
J4.w), frictional torques of clutches (clutchX.tau),
frictional mode of clutches (clutchX.mode) where
mode = -1/0/+1 means backward sliding,
locked, forward sliding.</p>
 
</HTML>"), experiment(StopTime=1.2), Commands(file="CoupledClutches.mos" "Plot inertias"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Rotational.Inertia J1(J=1, phi(start=0), w(start=10)) annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Torque torque annotation(Placement(visible=true, transformation(origin={-60,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Clutch clutch1(peak=1.1, fn_max=20) annotation(Placement(visible=true, transformation(origin={-20,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Sources.Sine sin1(amplitude=10, freqHz=5) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia J2(J=1) annotation(Placement(visible=true, transformation(origin={0,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Clutch clutch2(peak=1.1, fn_max=20) annotation(Placement(visible=true, transformation(origin={20,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia J3(J=1) annotation(Placement(visible=true, transformation(origin={40,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Clutch clutch3(peak=1.1, fn_max=20) annotation(Placement(visible=true, transformation(origin={60,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Rotational.Inertia J4(J=1) annotation(Placement(visible=true, transformation(origin={80,0}, extent={{-5,-5},{5,5}}, rotation=0)));
      Sources.Sine sin2(amplitude=1, freqHz=freqHz, phase=1.57) annotation(Placement(visible=true, transformation(origin={-20,20}, extent={{-5,-5},{5,5}}, rotation=-90)));
      Sources.Step step1(startTime=T2) annotation(Placement(visible=true, transformation(origin={20,20}, extent={{-5,-5},{5,5}}, rotation=-90)));
      Sources.Step step2(startTime=T3) annotation(Placement(visible=true, transformation(origin={60,20}, extent={{-5,-5},{5,5}}, rotation=-90)));
    equation 
      connect(sin1.y,torque.tau) annotation(Line(visible=true, points={{-74.5,0},{-66,0}}, color={0,0,191}));
      connect(clutch3.flange_b,J4.flange_a) annotation(Line(visible=true, points={{65,0},{75,0}}));
      connect(J3.flange_b,clutch3.flange_a) annotation(Line(visible=true, points={{45,0},{55,0}}));
      connect(clutch2.flange_b,J3.flange_a) annotation(Line(visible=true, points={{25,0},{35,0}}));
      connect(J2.flange_b,clutch2.flange_a) annotation(Line(visible=true, points={{5,0},{15,0}}));
      connect(clutch1.flange_b,J2.flange_a) annotation(Line(visible=true, points={{-15,0},{-5,0}}));
      connect(J1.flange_b,clutch1.flange_a) annotation(Line(visible=true, points={{-35,0},{-25,0}}));
      connect(torque.flange_b,J1.flange_a) annotation(Line(visible=true, points={{-55,0},{-45,0}}));
      connect(sin2.y,clutch1.f_normalized) annotation(Line(visible=true, points={{-20,14.5},{-20,5.5}}, color={0,0,191}));
      connect(step1.y,clutch2.f_normalized) annotation(Line(visible=true, points={{20,14.5},{20,5.5}}, color={0,0,191}));
      connect(step2.y,clutch3.f_normalized) annotation(Line(visible=true, points={{60,14.5},{60,5.5}}, color={0,0,191}));
    end CoupledClutches;

    encapsulated model LossyGearDemo1 "Example to show that gear efficiency may lead to stuck motion"
      import Modelica.Icons;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import SI = Modelica.SIunits;
      extends Icons.Example;
      SI.Power PowerLoss "power lost in the gear";
      annotation(Documentation(info="<html>
<p>
This model contains two inertias which are connected by an ideal
gear where the friction between the teeth of the gear is modeled in
a physical meaningful way (friction may lead to stuck mode which
locks the motion of the gear). The friction is defined by an
efficiency factor (= 0.5) for forward and backward driving condition leading
to a torque dependent friction loss. Simulate for about 0.5 seconds.
The friction in the gear will take all modes
(forward and backward rolling, as well as stuck).
</p>
<p>
You may plot:
</p>
<pre>
Inertia1.w,
Inertia2.w : angular velocities of inertias
powerLoss  : power lost in the gear
gear.mode  :  1 = forward rolling
              0 = stuck (w=0)
             -1 = backward rolling
</pre>
</HTML>
"), experiment(StopTime=0.5), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Rotational.LossyGear gear(i=2, lossTable=[0,0.5,0.5,0,0]) annotation(Placement(visible=true, transformation(origin={0,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Inertia Inertia1 annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Inertia Inertia2(J=1.5) annotation(Placement(visible=true, transformation(origin={30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Torque torque1 annotation(Placement(visible=true, transformation(origin={-60,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Torque torque2 annotation(Placement(visible=true, transformation(origin={60,10}, extent={{10,-10},{-10,10}}, rotation=0)));
      Sources.Sine DriveSine(amplitude=10, freqHz=1) annotation(Placement(visible=true, transformation(origin={-90,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Sources.Ramp load(height=5, duration=2, offset=-10) annotation(Placement(visible=true, transformation(origin={90,10}, extent={{10,-10},{-10,10}}, rotation=0)));
    equation 
      connect(load.y,torque2.tau) annotation(Line(visible=true, points={{79,10},{72,10}}, color={0,0,191}));
      connect(DriveSine.y,torque1.tau) annotation(Line(visible=true, points={{-79,10},{-72,10}}, color={0,0,191}));
      connect(torque2.flange_b,Inertia2.flange_b) annotation(Line(visible=true, points={{50,10},{40,10}}));
      connect(torque1.flange_b,Inertia1.flange_a) annotation(Line(visible=true, points={{-50,10},{-40,10}}));
      connect(gear.flange_b,Inertia2.flange_a) annotation(Line(visible=true, points={{10,10},{20,10}}));
      connect(Inertia1.flange_b,gear.flange_a) annotation(Line(visible=true, points={{-20,10},{-10,10}}));
      PowerLoss=gear.flange_a.tau*der(gear.flange_a.phi) + gear.flange_b.tau*der(gear.flange_b.phi);
    end LossyGearDemo1;

    encapsulated model LossyGearDemo2 "Example to show combination of LossyGear and BearingFriction"
      import Modelica.Icons;
      import Modelica.Blocks.Sources;
      import Modelica.Mechanics.Rotational;
      import SI = Modelica.SIunits;
      extends Icons.Example;
      SI.Power PowerLoss "power lost in the gear";
      annotation(Documentation(info="<html>
<p>
This model contains bearing friction and gear friction (= efficiency).
If both friction models are stuck, there is no unique solution.
Still a reliable Modelica simulator, such as Dymola, should
be able to handle this situation.
</p>
<p>
Simulate for about 0.5 seconds. The friction elements are
in all modes (forward and backward rolling, as well as stuck).
</p>
<p>
You may plot:
</p>
<pre>
Inertia1.w,
Inertia2.w          : angular velocities of inertias
powerLoss           : power lost in the gear
bearingFriction.mode:  1 = forward rolling
                       0 = stuck (w=0)
                      -1 = backward rolling
gear.mode           :  1 = forward rolling
                       0 = stuck (w=0)
                      -1 = backward rolling
</pre>
<p>Note: This combination of LossyGear and BearingFriction is not recommended to use,
as component LossyGear includes the functionality of component BearingFriction
(only <i>peak</i> not supported).</p>
</HTML>
"), experiment(StopTime=0.5), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Rotational.LossyGear gear(i=2, lossTable=[0,0.5,0.5,0,0]) annotation(Placement(visible=true, transformation(origin={0,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Inertia Inertia1 annotation(Placement(visible=true, transformation(origin={-30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Inertia Inertia2(J=1.5) annotation(Placement(visible=true, transformation(origin={30,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Rotational.Torque torque1 annotation(Placement(visible=true, transformation(origin={-60,70}, extent={{10,-10},{-10,10}}, rotation=0)));
      Rotational.Torque torque2 annotation(Placement(visible=true, transformation(origin={60,10}, extent={{10,-10},{-10,10}}, rotation=0)));
      Sources.Sine DriveSine(amplitude=10, freqHz=1) annotation(Placement(visible=true, transformation(origin={-30,70}, extent={{10,-10},{-10,10}}, rotation=0)));
      Sources.Ramp load(height=5, duration=2, offset=-10) annotation(Placement(visible=true, transformation(origin={90,10}, extent={{10,-10},{-10,10}}, rotation=0)));
      Rotational.BearingFriction bearingFriction(tau_pos=[0,0.5;1,1]) annotation(Placement(visible=true, transformation(origin={-60,10}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(load.y,torque2.tau) annotation(Line(visible=true, points={{79,10},{72,10}}, color={0,0,191}));
      connect(DriveSine.y,torque1.tau) annotation(Line(visible=true, points={{-41,70},{-48,70}}, color={0,0,191}));
      connect(bearingFriction.flange_a,torque1.flange_b) annotation(Line(visible=true, points={{-70,10},{-80,10},{-80,70},{-70,70}}));
      connect(Inertia1.flange_a,bearingFriction.flange_b) annotation(Line(visible=true, points={{-40,10},{-50,10}}));
      connect(gear.flange_a,Inertia1.flange_b) annotation(Line(visible=true, points={{-10,10},{-20,10}}));
      connect(Inertia2.flange_a,gear.flange_b) annotation(Line(visible=true, points={{20,10},{10,10}}));
      connect(torque2.flange_b,Inertia2.flange_b) annotation(Line(visible=true, points={{50,10},{40,10}}));
      PowerLoss=gear.flange_a.tau*der(gear.flange_a.phi) + gear.flange_b.tau*der(gear.flange_b.phi);
    end LossyGearDemo2;

    model ElasticBearing "Example to show possible usage of bearing flange"
      extends Icons.Example;
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<html>
<p>
This model demonstrates the usage of the bearing flange.
The gearbox is not connected rigidly to the ground, but by
a spring-damper-system. This allows examination of the gearbox
housing dynamics.</p>
<p>
Simulate for about 10 seconds and plot the angular velocities of the inertias <tt>housing.w</tt>,
<tt>shaft.w</tt> and <tt>load.w</tt>.</p>
</html>
"), experiment(StopTime=10), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Mechanics.Rotational.Inertia shaft annotation(Placement(visible=true, transformation(origin={-10,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Inertia load(J=50) annotation(Placement(visible=true, transformation(origin={80,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Spring spring(c=1000.0) annotation(Placement(visible=true, transformation(origin={50,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Fixed fixed annotation(Placement(visible=true, transformation(origin={20,-70}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.SpringDamper springDamper(c=100000.0, d=5) annotation(Placement(visible=true, transformation(origin={20,-30}, extent={{-10,-10},{10,10}}, rotation=90)));
      Modelica.Mechanics.Rotational.Torque torque annotation(Placement(visible=true, transformation(origin={-40,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.Ramp ramp(duration=5, height=100) annotation(Placement(visible=true, transformation(origin={-80,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.IdealGear idealGear(ratio=3) annotation(Placement(visible=true, transformation(origin={20,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Inertia housing(J=5) annotation(Placement(visible=true, transformation(origin={20,10}, extent={{-10,-10},{10,10}}, rotation=90)));
    equation 
      connect(ramp.y,torque.tau) annotation(Line(visible=true, points={{-69,50},{-52,50}}, color={0,0,191}));
      connect(housing.flange_a,springDamper.flange_b) annotation(Line(visible=true, points={{20,20},{20,-40}}));
      connect(idealGear.bearing,housing.flange_b) annotation(Line(visible=true, points={{20,40},{20,0}}));
      connect(idealGear.flange_b,spring.flange_a) annotation(Line(visible=true, points={{30,50},{40,50}}));
      connect(shaft.flange_b,idealGear.flange_a) annotation(Line(visible=true, points={{0,50},{10,50}}));
      connect(springDamper.flange_a,fixed.flange_b) annotation(Line(visible=true, points={{20,-20},{20,-70}}));
      connect(spring.flange_b,load.flange_a) annotation(Line(visible=true, points={{60,50},{70,50}}));
      connect(torque.flange_b,shaft.flange_a) annotation(Line(visible=true, points={{-30,50},{-20,50}}));
    end ElasticBearing;

  end Examples;

  package Sensors "Sensors to measure variables in 1D rotational mechanical components"
    model AngleSensor "Ideal sensor to measure the absolute flange angle"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
Measures the <b>absolute angle phi</b> of a flange in an ideal
way and provides the result as output signal <b>phi</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{70,-70},{120,-30}}, textString="phi", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a "flange to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput phi(redeclare type SignalType= SI.Angle ) "Absolute angle of flange" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      phi=flange_a.phi;
      0=flange_a.tau;
    end AngleSensor;

    model SpeedSensor "Ideal sensor to measure the absolute flange angular velocity"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
Measures the <b>absolute angular velocity w</b> of a flange in an ideal
way and provides the result as output signal <b>w</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{70,-70},{120,-30}}, textString="w", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a "flange to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput w(redeclare type SignalType= SI.AngularVelocity ) "Absolute angular velocity of flange" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      w=der(flange_a.phi);
      0=flange_a.tau;
    end SpeedSensor;

    model AccSensor "Ideal sensor to measure the absolute flange angular acceleration"
      extends Modelica.Icons.RotationalSensor;
      SI.AngularVelocity w "Absolute angular velocity of flange";
      annotation(Documentation(info="<html>
<p>
Measures the <b>absolute angular acceleration a</b> of a flange in an ideal
way and provides the result as output signal <b>a</b> (to be further processed with
blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{100,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{70,-70},{120,-30}}, textString="a", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a "flange to be measured" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput a(redeclare type SignalType= SI.AngularAcceleration ) "Absolute angular acceleration of flange" annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      w=der(flange_a.phi);
      a=der(w);
      0=flange_a.tau;
    end AccSensor;

    extends Modelica.Icons.Library2;
    model RelAngleSensor "Ideal sensor to measure the relative angle between two flanges"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
Measures the <b>relative angle phi_rel</b> between two flanges
in an ideal way and provides the result as output signal <b>phi_rel</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{13,93},{-7,98},{-7,88},{13,93}}),Line(visible=true, points={{-77,93},{-6,93}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{17,87},{85,100}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{20,-100},{160,-70}}, textString="phi_rel", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,191})}));
      Interfaces.Flange_a flange_a "driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput phi_rel(redeclare type SignalType= SI.Angle ) "Relative angle between two flanges (= flange_b.phi - flange_a.phi)" annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      phi_rel=flange_b.phi - flange_a.phi;
      0=flange_a.tau;
      0=flange_b.tau;
    end RelAngleSensor;

    model RelSpeedSensor "Ideal sensor to measure the relative angular velocity between two flanges"
      extends Modelica.Icons.RotationalSensor;
      SI.Angle phi_rel "Relative angle between two flanges (flange_b.phi - flange_a.phi)";
      annotation(Documentation(info="<html>
<p>
Measures the <b>relative angular velocity w_rel</b> between two flanges
in an ideal way and provides the result as output signal <b>w_rel</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{13,93},{-7,98},{-7,88},{13,93}}),Line(visible=true, points={{-77,93},{-6,93}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{17,87},{85,100}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{0,-100},{0,-70}}),Line(visible=true, points={{70,0},{90,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{20,-100},{160,-70}}, textString="w_rel", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial"),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,191})}));
      Interfaces.Flange_a flange_a "driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput w_rel(redeclare type SignalType= SI.AngularVelocity ) "Relative angular velocity between two flanges (= der(flange_b.phi) - der(flange_a.phi))" annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      phi_rel=flange_b.phi - flange_a.phi;
      w_rel=der(phi_rel);
      0=flange_a.tau;
      0=flange_b.tau;
    end RelSpeedSensor;

    model RelAccSensor "Ideal sensor to measure the relative angular acceleration between two flanges"
      extends Modelica.Icons.RotationalSensor;
      SI.Angle phi_rel "Relative angle between two flanges (flange_b.phi - flange_a.phi)";
      SI.AngularVelocity w_rel "Relative angular velocity between two flanges";
      annotation(Documentation(info="<html>
<p>
Measures the <b>relative angular acceleration a_rel</b> between two flanges
in an ideal way and provides the result as output signal <b>a_rel</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{13,93},{-7,98},{-7,88},{13,93}}),Line(visible=true, points={{-77,93},{-6,93}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{17,87},{85,100}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{20,-100},{160,-70}}, textString="a_rel", fontName="Arial"),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a "driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput a_rel(redeclare type SignalType= SI.AngularAcceleration ) "Relative angular acceleration between two flanges" annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      phi_rel=flange_b.phi - flange_a.phi;
      w_rel=der(phi_rel);
      a_rel=der(w_rel);
      0=flange_a.tau;
      0=flange_b.tau;
    end RelAccSensor;

    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-56,-61},{-56,-81}}),Line(visible=true, points={{-36,-61},{-36,-81}}),Line(visible=true, points={{-16,-61},{-16,-81}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-76,-81},{64,-1}}),Line(visible=true, points={{4,-61},{4,-81}}),Line(visible=true, points={{24,-61},{24,-81}}),Line(visible=true, points={{44,-61},{44,-81}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-6,-61},{-16,-37},{4,-37},{-6,-61}}),Line(visible=true, points={{-6,-21},{-6,-37}}),Line(visible=true, points={{-76,-21},{-6,-21}}),Line(visible=true, points={{-56,-61},{-56,-81}}),Line(visible=true, points={{-36,-61},{-36,-81}}),Line(visible=true, points={{-16,-61},{-16,-81}})}), Documentation(info="<html>
<p>
This package contains ideal sensor components that provide
the connector variables as signals for further processing with the
Modelica.Blocks library.
</p>
</html>"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    model TorqueSensor "Ideal sensor to measure the torque between two flanges (= flange_a.tau)"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
Measures the <b>cut-torque between two flanges</b> in an ideal way
and provides the result as output signal <b>tau</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{14,85},{-6,90},{-6,80},{14,85}}),Line(visible=true, points={{-76,85},{-5,85}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{18,79},{86,92}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{96,0}}),Line(visible=true, points={{-80,-100},{-80,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-50,-120},{50,-80}}, textString="tau", fontName="Arial"),Line(visible=true, points={{-80,-100},{-80,0}}, color={0,0,191}),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput tau(redeclare type SignalType= SI.Torque ) "Torque in flange flange_a and flange_b (= flange_a.tau = -flange_b.tau)" annotation(Placement(visible=true, transformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      flange_a.phi=flange_b.phi;
      flange_a.tau=tau;
      flange_b.tau=-tau;
    end TorqueSensor;

    model PowerSensor "Ideal sensor to measure the power between two flanges (= flange_a.tau*der(flange_a.phi))"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
Measures the <b>power between two flanges</b> in an ideal way
and provides the result as output signal <b>power</b>
(to be further processed with blocks of the Modelica.Blocks library).
</p>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{14,85},{-6,90},{-6,80},{14,85}}),Line(visible=true, points={{-76,85},{-5,85}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{18,79},{86,92}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-70,0},{-96,0}}),Line(visible=true, points={{70,0},{96,0}}),Line(visible=true, points={{-80,-100},{-80,0}})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-50,-120},{100,-80}}, textString="power", fontName="Arial"),Line(visible=true, points={{-80,-100},{-80,0}}, color={0,0,191}),Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}));
      Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput power(redeclare type SignalType= SI.Power ) "Power in flange flange_a" annotation(Placement(visible=true, transformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={-80,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    equation 
      flange_a.phi=flange_b.phi;
      0=flange_a.tau + flange_b.tau;
      power=flange_a.tau*der(flange_a.phi);
    end PowerSensor;

  end Sensors;

  import SI = Modelica.SIunits;
  extends Modelica.Icons.Library2;
  annotation(preferedView="info", Documentation(info="<html>
 
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
Copyright &copy; 1998-2006, Modelica Association and DLR.
</p>
<p>
<i>This Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>
</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-83,-66},{-63,-66}}),Line(visible=true, points={{36,-68},{56,-68}}),Line(visible=true, points={{-73,-66},{-73,-91}}),Line(visible=true, points={{46,-68},{46,-91}}),Line(visible=true, points={{-83,-29},{-63,-29}}),Line(visible=true, points={{36,-32},{56,-32}}),Line(visible=true, points={{-73,-9},{-73,-29}}),Line(visible=true, points={{46,-12},{46,-32}}),Line(visible=true, points={{-73,-91},{46,-91}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-47,-80},{27,-17}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-87,-54},{-47,-41}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{27,-56},{66,-42}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  package Interfaces "Connectors and partial models for 1D rotational mechanical components"
    extends Modelica.Icons.Library;
    annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains connectors and partial models for 1-dim.
rotational mechanical components. The components of this package can
only be used as basic building elements for models.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    connector Flange_a "1D rotational flange (filled square icon)"
      SI.Angle phi "Absolute rotation angle of flange";
      flow SI.Torque tau "Cut torque in the flange";
      annotation(defaultComponentName="flange_a", Documentation(info="<HTML>
<p>
This is a connector for 1D rotational mechanical systems and models
a mechanical flange. The following variables are defined in this connector:
</p>
<pre>
   <b>phi</b>: Absolute rotation angle of the flange in [rad].
   <b>tau</b>: Cut-torque in the flange in [Nm].
</pre>
<p>
There is a second connector for flanges: Flange_b. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see the information text of package Rotational
(section 4. Sign conventions).
</p>
<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-160,50},{40,90}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillColor={128,128,128}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}})}));
    end Flange_a;

    connector Flange_b "1D rotational flange (non-filled square icon)"
      SI.Angle phi "Absolute rotation angle of flange";
      flow SI.Torque tau "Cut torque in the flange";
      annotation(defaultComponentName="flange_b", Documentation(info="<HTML>
<p>
This is a connector for 1D rotational mechanical systems and models
a mechanical flange. The following variables are defined in this connector:
</p>
<pre>
   <b>phi</b>: Absolute rotation angle of the flange in [rad].
   <b>tau</b>: Cut-torque in the flange in [Nm].
</pre>
<p>
There is a second connector for flanges: Flange_a. The connectors
Flange_a and Flange_b are completely identical. There is only a difference
in the icons, in order to easier identify a flange variable in a diagram.
For a discussion on the actual direction of the cut-torque tau and
of the rotation angle, see the information text of package Rotational
(section 4. Sign conventions).
</p>
<p>
If needed, the absolute angular velocity w and the
absolute angular acceleration a of the flange can be determined by
differentiation of the flange angle phi:
</p>
<pre>
     w = der(phi);    a = der(w)
</pre>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-98,-100},{102,100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,50},{160,90}}, textString="%name", fontName="Arial")}));
    end Flange_b;

    partial model Rigid "Base class for the rigid connection of two rotational 1D flanges"
      SI.Angle phi "Absolute rotation angle of component (= flange_a.phi = flange_b.phi)";
      annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two rigidly connected flanges,
i.e., flange_a.phi = flange_b.phi. It is used e.g. to built up components
with inertia.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      flange_a.phi=phi;
      flange_b.phi=phi;
    end Rigid;

    partial model Compliant "Base class for the compliant connection of two rotational 1D flanges"
      SI.Angle phi_rel(start=0) "Relative rotation angle (= flange_b.phi - flange_a.phi)";
      SI.Torque tau "Torque between flanges (= flange_b.tau)";
      annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with a compliant connection of two
rotational 1D flanges where inertial effects between the two
flanges are neglected. The basic assumption is that the cut-torques
of the two flanges sum-up to zero, i.e., they have the same absolute value
but opposite sign: flange_a.tau + flange_b.tau = 0. This base class
is used to built up force elements such as springs, dampers, friction.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      phi_rel=flange_b.phi - flange_a.phi;
      flange_b.tau=tau;
      flange_a.tau=-tau;
    end Compliant;

    partial model TwoFlanges "Base class for a component with two rotational 1D flanges"
      annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges.
It is used e.g. to build up parts of a drive train consisting
of several base components. There are specialized versions of this
base class for rigidly connected flanges (Interfaces.Rigid) and
for a compliant connection of flanges (Interfaces.Compliant).
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Flange_a flange_a annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    end TwoFlanges;

    partial model Bearing "Base class for interface classes with bearing connector"
      extends TwoFlanges;
      SI.Torque tau_support;
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}})}), Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges and an additional bearing flange.
It is a superclass for the two components TwoFlangesAndBearing and TwoFlangesAndBearingH.</p>
 
</HTML>
"));
      Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
    end Bearing;

    partial model TwoFlangesAndBearing "Base class for a equation-based component with two rotational 1D flanges and one rotational 1D bearing flange"
      extends Bearing;
      SI.Angle phi_a;
      SI.Angle phi_b;
      annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges and an additional bearing flange.
It is used e.g. to build up equation-based parts of a drive train.</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    equation 
      if cardinality(bearing) == 0 then
        bearing.phi=0;
      else
        bearing.tau=tau_support;
      end if;
      0=flange_a.tau + flange_b.tau + tau_support;
      phi_a=flange_a.phi - bearing.phi;
      phi_b=flange_b.phi - bearing.phi;
    end TwoFlangesAndBearing;

    partial model TwoFlangesAndBearingH "Base class for a hierarchically composed component with two rotational 1D flanges and one rotational bearing flange"
      extends Bearing;
      encapsulated model Adapter
        import Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
        extends TwoFlanges;
        parameter Boolean bearingConnected;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-90,10},{90,-10}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(extent={{-150,60},{150,20}}, textString="%name")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      equation 
        flange_a.phi=flange_b.phi;
        if bearingConnected then
          0=flange_a.tau + flange_b.tau;
        else
          0=flange_a.phi;
        end if;
      end Adapter;

      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Adapter adapter(bearingConnected=cardinality(bearing) > 1) annotation(Placement(visible=true, transformation(origin={0,-60}, extent={{-10,-10},{10,10}}, rotation=-90)));
    protected 
      encapsulated model Adapter
        import Modelica.Mechanics.Rotational.Interfaces.TwoFlanges;
        extends TwoFlanges;
        parameter Boolean bearingConnected;
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-90,10},{90,-10}}, fillPattern=FillPattern.Solid, lineColor={192,192,192}, fillColor={192,192,192}),Text(extent={{-150,60},{150,20}}, textString="%name")}));
      equation 
        flange_a.phi=flange_b.phi;
        if bearingConnected then
          0=flange_a.tau + flange_b.tau;
        else
          0=flange_a.phi;
        end if;
      end Adapter;

    equation 
      connect(adapter.flange_a,bearing) annotation(Line(visible=true, points={{0,-50},{0,-70},{0,-100}}));
      tau_support=-adapter.flange_b.tau;
      annotation(Documentation(info="<html>
<p>
This is a 1D rotational component with two flanges and an additional bearing flange.
It is used e.g. to build up parts of a drive train consisting
of several base components.</p>
 
</HTML>
"));
    end TwoFlangesAndBearingH;

    partial model FrictionBase "Base class of Coulomb friction elements"
      parameter SI.AngularVelocity w_small=10000000000.0 "Relative angular velocity near to zero if jumps due to a reinit(..) of the velocity can occur (set to low value only if such impulses can occur)" annotation(Dialog(tab="Advanced"));
      SI.AngularVelocity w_relfric "Relative angular velocity between frictional surfaces";
      SI.AngularAcceleration a_relfric "Relative angular acceleration between frictional surfaces";
      SI.Torque tau "Friction torque (positive, if directed in opposite direction of w_rel)";
      SI.Torque tau0 "Friction torque for w=0 and forward sliding";
      SI.Torque tau0_max "Maximum friction torque for w=0 and locked";
      Boolean free "true, if frictional element is not active";
      Real sa "Path parameter of friction characteristic tau = f(a_relfric)";
      Boolean startForward(start=false, fixed=true) "true, if w_rel=0 and start of forward sliding or w_rel > w_small";
      Boolean startBackward(start=false, fixed=true) "true, if w_rel=0 and start of backward sliding or w_rel < -w_small";
      Boolean locked(start=false) "true, if w_rel=0 and not sliding";
      constant Integer Unknown=3 "Value of mode is not known";
      constant Integer Free=2 "Element is not active";
      constant Integer Forward=1 "w_rel > 0 (forward sliding)";
      constant Integer Stuck=0 "w_rel = 0 (forward sliding, locked or backward sliding)";
      constant Integer Backward=-1 "w_rel < 0 (backward sliding)";
      Integer mode(final min=Backward, final max=Unknown, start=Unknown, fixed=true);
      annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    protected 
      parameter Modelica.SIunits.AngularAcceleration unitAngularAcceleration=1;
      parameter Modelica.SIunits.Torque unitTorque=1;
    equation 
      startForward=pre(mode) == Stuck and (sa > tau0_max or pre(startForward) and sa > tau0) or pre(mode) == Backward and w_relfric > w_small or initial() and w_relfric > 0;
      startBackward=pre(mode) == Stuck and (sa < -tau0_max or pre(startBackward) and sa < -tau0) or pre(mode) == Forward and w_relfric < -w_small or initial() and w_relfric < 0;
      locked=not free and not (pre(mode) == Forward or startForward or pre(mode) == Backward or startBackward);
      a_relfric=unitAngularAcceleration*(if locked then 0 else if free then sa else if startForward then sa - tau0_max/unitTorque else if startBackward then sa + tau0_max/unitTorque else if pre(mode) == Forward then sa - tau0/unitTorque else sa + tau0/unitTorque);
      mode=if free then Free else if (pre(mode) == Forward or pre(mode) == Free or startForward) and w_relfric > 0 then Forward else if (pre(mode) == Backward or pre(mode) == Free or startBackward) and w_relfric < 0 then Backward else Stuck;
      annotation(Documentation(info="<html>
<p>
Basic model for Coulomb friction that models the stuck
phase in a reliable way.
</p>
</html>"));
    end FrictionBase;

    partial model AbsoluteSensor "Base class to measure a single absolute flange variable"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
This is the base class of a 1D rotational component with one flange and one
output signal y in order to measure an absolute kinematic quantity in the flange
and to provide the measured signal as output signal for further processing
with the blocks of package Modelica.Blocks.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}}, color={0,0,191}),Text(visible=true, extent={{-150,80},{150,120}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{100,0}})}));
      Flange_a flange_a "(left) flange to be measured (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={110,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    end AbsoluteSensor;

    partial model RelativeSensor "Base class to measure a single relative variable between two flanges"
      extends Modelica.Icons.RotationalSensor;
      annotation(Documentation(info="<html>
<p>
This is a base class for 1D rotational components with two rigidly connected
flanges and one output signal y in order to measure relative kinematic quantities
between the two flanges or the cut-torque in the flange and
to provide the measured signal as output signal for further processing
with the blocks of package Modelica.Blocks.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}}, color={0,0,191}),Text(visible=true, extent={{-150,70},{150,110}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-70,0},{-90,0}}),Line(visible=true, points={{70,0},{90,0}}),Line(visible=true, points={{0,-100},{0,-70}})}));
      Flange_a flange_a "(left) driving flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Flange_b flange_b "(right) driven flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible=true, transformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90), iconTransformation(origin={0,-110}, extent={{-10,10},{10,-10}}, rotation=-90)));
    end RelativeSensor;

    partial model PartialSpeedDependentTorque "Partial model of a torque acting at the flange (accelerates the flange)"
      Modelica.SIunits.AngularVelocity w=der(flange.phi) "Angular velocity at flange";
      Modelica.SIunits.Torque tau=flange.tau "accelerating torque acting at flange";
      annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Documentation(info="<HTML>
<p>
Partial model of torque dependent on speed that accelerates the flange.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-96,-96},{96,96}}),Line(visible=true, points={{-30,-70},{30,-70}}),Line(visible=true, points={{-30,-90},{-10,-70}}),Line(visible=true, points={{-10,-90},{10,-70}}),Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-140},{20,-100}}),Line(visible=true, points={{10,-90},{30,-70}}),Line(visible=true, points={{0,-70},{0,-110}}),Line(visible=true, points={{-92,0},{-76,36},{-54,62},{-30,80},{-14,88},{10,92},{26,90},{46,80},{64,62}}, smooth=Smooth.Bezier),Text(visible=true, fillColor={0,0,255}, extent={{-150,100},{150,140}}, textString="%name", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{94,16},{80,74},{50,52},{94,16}})}));
      Modelica.Mechanics.Rotational.Interfaces.Flange_b flange "Flange on which torque is acting" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{10,-10},{-10,10}}, rotation=0)));
      Modelica.Mechanics.Rotational.Interfaces.Flange_a bearing "Bearing at which the reaction torque (i.e., -flange.tau) is acting" annotation(Placement(visible=true, transformation(origin={0,-120}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-120}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      if cardinality(bearing) == 0 then
        bearing.phi=0;
      else
        bearing.tau=-flange.tau;
      end if;
    end PartialSpeedDependentTorque;

  end Interfaces;

  model Inertia "1D-rotational component with inertia"
    import SI = Modelica.SIunits;
    import Modelica.Mechanics.Rotational.Types.Init;
    import Modelica.Blocks.Types.StateSelection;
    parameter SI.Inertia J(min=0)=1 "Moment of inertia";
    parameter Init.Temp initType=Modelica.Mechanics.Rotational.Types.Init.NoInit "Type of initialization (defines usage of start values below)" annotation(Dialog(group="Initialization"));
    parameter SI.Angle phi_start=0 "Initial or guess value of rotor rotation angle phi" annotation(Dialog(group="Initialization"), Evaluate=false);
    parameter SI.AngularVelocity w_start=0 "Initial or guess value of angular velocity w = der(phi)" annotation(Dialog(group="Initialization"), Evaluate=false);
    parameter SI.AngularAcceleration a_start=0 "Initial value of angular acceleration a = der(w)" annotation(Dialog(group="Initialization", enable=initType >= Init.InitialAcceleration), Evaluate=false);
    parameter StateSelection.Temp stateSelection=Modelica.Blocks.Types.StateSelection.Default "Priority to use phi and w as states" annotation(Dialog(tab="Advanced"));
    extends Interfaces.Rigid(phi(start=phi_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always));
    SI.AngularVelocity w(start=w_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always) "Absolute angular velocity of component";
    SI.AngularAcceleration a "Absolute angular acceleration of component";
    annotation(Documentation(info="<html>
<p>
Rotational component with <b>inertia</b> and two rigidly connected flanges.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-25},{-60,-25}}),Line(visible=true, points={{60,-25},{80,-25}}),Line(visible=true, points={{-70,-25},{-70,-70}}),Line(visible=true, points={{70,-25},{70,-70}}),Line(visible=true, points={{-80,25},{-60,25}}),Line(visible=true, points={{60,25},{80,25}}),Line(visible=true, points={{-70,45},{-70,25}}),Line(visible=true, points={{70,45},{70,25}}),Line(visible=true, points={{-70,-70},{70,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-50},{50,50}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{96,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{0,-90},{-20,-85},{-20,-95},{0,-90}}),Line(visible=true, points={{-90,-90},{-19,-90}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{4,-96},{72,-83}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{9,73},{19,70},{9,67},{9,73}}),Line(visible=true, points={{9,70},{-21,70}}),Text(visible=true, extent={{25,65},{77,77}}, textString="w = der(phi) ", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{100,10}}),Line(visible=true, points={{-80,-25},{-60,-25}}),Line(visible=true, points={{60,-25},{80,-25}}),Line(visible=true, points={{-70,-25},{-70,-70}}),Line(visible=true, points={{70,-25},{70,-70}}),Line(visible=true, points={{-80,25},{-60,25}}),Line(visible=true, points={{60,25},{80,25}}),Line(visible=true, points={{-70,45},{-70,25}}),Line(visible=true, points={{70,45},{70,25}}),Line(visible=true, points={{-70,-70},{70,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-50},{50,50}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-150,-120},{150,-80}}, textString="J=%J", fontName="Arial")}));
  initial equation 
    if initType == Init.SteadyState then
      der(phi)=0;
      der(w)=0;
    elseif initType == Init.InitialState then
      phi=phi_start;
      w=w_start;
    elseif initType == Init.InitialAngle then
      phi=phi_start;
    elseif initType == Init.InitialSpeed then
      w=w_start;
    elseif initType == Init.InitialAcceleration then
      a=a_start;
    elseif initType == Init.InitialAngleAcceleration then
      phi=phi_start;
      a=a_start;
    elseif initType == Init.InitialSpeedAcceleration then
      w=w_start;
      a=a_start;
    elseif initType == Init.InitialAngleSpeedAcceleration then
      phi=phi_start;
      w=w_start;
      a=a_start;
    else
    end if;
  equation 
    w=der(phi);
    a=der(w);
    J*a=flange_a.tau + flange_b.tau;
  end Inertia;

  model IdealGear "Ideal gear without inertia"
    extends Interfaces.TwoFlangesAndBearing;
    parameter Real ratio=1 "Transmission ratio (flange_a.phi/flange_b.phi)";
    annotation(Documentation(info="<html>
<p>
This element characterices any type of gear box which is fixed in the
ground and which has one driving shaft and one driven shaft.
The gear is <b>ideal</b>, i.e., it does not have inertia, elasticity, damping
or backlash. If these effects have to be considered, the gear has to be
connected to other elements in an appropriate way.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-40,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{96,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Line(visible=true, points={{-90,-80},{-20,-80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{0,-80},{-20,-75},{-20,-85},{0,-80}}),Text(visible=true, fillColor={128,128,128}, extent={{34,-86},{34,-72}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{70,-20},{70,-70}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-40,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,140},{150,180}}, textString="%name=%ratio", fontName="Arial"),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{70,-20},{70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}})}));
  equation 
    phi_a=ratio*phi_b;
    0=ratio*flange_a.tau + flange_b.tau;
  end IdealGear;

  model IdealPlanetary "Ideal planetary gear box"
    parameter Real ratio=100/50 "number of ring_teeth/sun_teeth (e.g. ratio=100/50)";
    annotation(Documentation(info="<HTML>
<p>
The IdealPlanetary gear box is an ideal gear without inertia,
elasticity, damping or backlash consisting
of an inner <b>sun</b> wheel, an outer <b>ring</b> wheel and a
<b>planet</b> wheel located between sun and ring wheel. The bearing
of the planet wheel shaft is fixed in the planet <b>carrier</b>.
The component can be connected to other elements at the
sun, ring and/or carrier flanges. It is not possible to connect
to the planet wheel. If inertia shall not be neglected,
the sun, ring and carrier inertias can be easily added by attaching
inertias (= model Inertia) to the corresponding connectors.
The inertias of the planet wheels are always neglected.
</p>
<p>
The icon of the planetary gear signals that the sun and carrier
flanges are on the left side and the ring flange is on the right side
of the gear box. However, this component is generic and is valid
independantly how the flanges are actually placed (e.g. sun wheel
may be placed on the right side instead on the left side in reality).
</p>
<p>
The ideal planetary gearbox is uniquely defined by the ratio
of the number of ring teeth zr with respect to the number of
sun teeth zs. For example, if there are 100 ring teeth and
50 sun teeth then ratio = zr/zs = 2. The number of planet teeth
zp has to fulfill the following relationship:
</p>
<pre>
   <b>zp := (zr - zs) / 2</b>
</pre>
<p>
Therefore, in the above example zp = 25 is required.
</p>
<p>
According to the overall convention, the positive direction of all
vectors, especially the absolute angular velocities and cut-torques
in the flanges, are along the axis vector displayed in the icon.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-100},{50,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,45},{-10,85}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-30},{-10,30}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{100,10}}),Rectangle(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-50,100},{50,105}}),Rectangle(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-50,-105},{50,-100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-80,60},{-50,70}}),Line(visible=true, points={{-90,40},{-70,40}}),Line(visible=true, points={{-80,50},{-60,50}}),Line(visible=true, points={{-70,50},{-70,40}}),Line(visible=true, points={{-80,80},{-59,80}}),Line(visible=true, points={{-70,90},{-70,80}}),Line(visible=true, points={{-26,-42},{-32,-2}}, pattern=LinePattern.Dot),Line(visible=true, points={{36,-26},{64,-60}}, pattern=LinePattern.Dot),Text(visible=true, extent={{58,-78},{98,-66}}, textString="ring gear", fontName="Arial"),Text(visible=true, extent={{-112,87},{-56,111}}, textString="planet carrier ", fontName="Arial"),Text(visible=true, extent={{-47,-56},{-3,-42}}, textString="sun gear", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{58,130},{28,140},{28,120},{58,130}}),Line(visible=true, points={{-52,130},{28,130}}),Line(visible=true, points={{-92,93},{-70,80}}, pattern=LinePattern.Dot),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-7,-86},{-27,-81},{-27,-91},{-7,-86}}),Line(visible=true, points={{-97,-86},{-26,-86}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{-96,-84},{-28,-71}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-100},{50,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,45},{-10,85}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-50,-30},{-10,30}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-50,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{50,-10},{100,10}}),Rectangle(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-50,100},{50,105}}),Rectangle(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-50,-105},{50,-100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-80,60},{-50,70}}),Line(visible=true, points={{-90,40},{-70,40}}),Line(visible=true, points={{-80,50},{-60,50}}),Line(visible=true, points={{-70,50},{-70,40}}),Line(visible=true, points={{-80,80},{-59,80}}),Line(visible=true, points={{-70,100},{-70,80}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,110},{150,150}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-150,-150},{150,-110}}, textString="ratio=%ratio", fontName="Arial")}));
    Interfaces.Flange_a sun "sun flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Flange_a carrier "carrier flange (flange axis directed INTO cut plane)" annotation(Placement(visible=true, transformation(origin={-100,40}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,40}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Flange_b ring "ring flange (flange axis directed OUT OF cut plane)" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    (1 + ratio)*carrier.phi=sun.phi + ratio*ring.phi;
    ring.tau=ratio*sun.tau;
    carrier.tau=-(1 + ratio)*sun.tau;
  end IdealPlanetary;

  model IdealGearR2T "Gearbox transforming rotational into translational motion"
    parameter Real ratio(final unit="rad/m")=1 "transmission ratio (flange_a.phi/flange_b.s)";
    SI.Torque tau_support;
    SI.Force f_support;
    annotation(Documentation(info="<html>
This is an ideal mass- and inertialess gearbox which transforms a
1D-rotational into a 1D-translational motion. If elasticity, damping
or backlash has to be considered, this ideal gearbox has to be
connected with corresponding elements.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-80,-120},{-40,-80}}),Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{40,-120},{80,-80}}),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-40},{10,40}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-40,-10},{-20,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-70,10}}),Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-74,-80},{106,-60}}),Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{95,-60},{106,-10}}),Text(visible=true, extent={{-100,40},{100,70}}, textString="transform rotation into translation", fontName="Arial"),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-74,-60},{-54,-40},{-34,-60},{-14,-40},{6,-60},{26,-40},{46,-60},{66,-40},{86,-60},{-74,-60}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{16,80},{-4,85},{-4,75},{16,80}}),Line(visible=true, points={{-74,80},{-3,80}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{21,75},{89,88}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{40,-120},{80,-80}}),Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-40},{10,40}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-40,-10},{-20,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-70,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,50},{150,90}}, textString="%name=%ratio", fontName="Arial"),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{-74,-60},{-54,-40},{-34,-60},{-14,-40},{6,-60},{26,-40},{46,-60},{66,-40},{86,-60},{-74,-60}}),Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{95,-60},{106,-10}}),Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-80,-120},{-40,-80}}),Rectangle(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-74,-80},{106,-60}})}));
    Interfaces.Flange_a flange_a annotation(Placement(visible=true, transformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Modelica.Mechanics.Translational.Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,10},{10,-10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,10},{10,-10}}, rotation=0)));
    Interfaces.Flange_a bearingR annotation(Placement(visible=true, transformation(origin={-60,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={-60,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
    Translational.Interfaces.Flange_a bearingT annotation(Placement(visible=true, transformation(origin={60,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={60,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    flange_a.phi - bearingR.phi=ratio*(flange_b.s - bearingT.s);
    0=ratio*flange_a.tau + flange_b.f;
    0=flange_a.tau + tau_support;
    0=flange_b.f + f_support;
    if cardinality(bearingR) == 0 then
      bearingR.phi=0;
    else
      bearingR.tau=tau_support;
    end if;
    if cardinality(bearingT) == 0 then
      bearingT.s=0;
    else
      bearingT.f=f_support;
    end if;
  end IdealGearR2T;

  model Spring "Linear 1D rotational spring"
    extends Interfaces.Compliant;
    parameter Real c(final unit="N.m/rad", final min=0) "Spring constant";
    parameter SI.Angle phi_rel0=0 "Unstretched spring angle";
    annotation(Documentation(info="<html>
<p>
A <b>linear 1D rotational spring</b>. The component can be connected either
between two inertias/gears to describe the shaft elasticity, or between
a inertia/gear and the housing (component Fixed), to describe
a coupling of the element with the housing via a spring.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-68,0},{-68,65}}, color={128,128,128}),Line(visible=true, points={{72,0},{72,65}}, color={128,128,128}),Line(visible=true, points={{-68,60},{72,60}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{62,63},{72,60},{62,57},{62,63}}),Text(visible=true, fillColor={0,0,255}, extent={{-22,62},{18,87}}, textString="phi_rel", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{12,-74},{80,-61}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{8,-68},{-12,-63},{-12,-73},{8,-68}}),Line(visible=true, points={{-82,-68},{-11,-68}}, color={128,128,128}),Line(visible=true, points={{-96,0},{-60,0},{-42,-32},{-12,30},{18,-30},{48,28},{62,0},{96,0}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,80}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-150,-80},{150,-40}}, textString="c=%c", fontName="Arial"),Line(visible=true, points={{-100,0},{-58,0},{-43,-30},{-13,30},{17,-30},{47,30},{62,0},{100,0}})}));
  equation 
    tau=c*(phi_rel - phi_rel0);
  end Spring;

  model Damper "Linear 1D rotational damper"
    extends Interfaces.Compliant;
    parameter Real d(final unit="N.m.s/rad", final min=0)=0 "Damping constant";
    SI.AngularVelocity w_rel "Relative angular velocity between flange_b and flange_a";
    annotation(Documentation(info="<html>
<p>
<b>Linear, velocity dependent damper</b> element. It can be either connected
between an inertia or gear and the housing (component Fixed), or
between two inertia/gear elements.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-96,0},{-60,0}}),Line(visible=true, points={{-60,-30},{-60,30}}),Line(visible=true, points={{-60,-30},{60,-30}}),Line(visible=true, points={{-60,30},{60,30}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-30},{30,30}}),Line(visible=true, points={{30,0},{96,0}}),Line(visible=true, points={{-68,0},{-68,65}}, color={128,128,128}),Text(visible=true, fillColor={0,0,255}, extent={{-22,62},{18,87}}, textString="phi_rel", fontName="Arial"),Line(visible=true, points={{-68,60},{72,60}}, color={128,128,128}),Line(visible=true, points={{72,0},{72,65}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{62,63},{72,60},{62,57},{62,63}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,-60},{-10,-55},{-10,-65},{10,-60}}),Line(visible=true, points={{-80,-60},{-9,-60}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{14,-66},{82,-53}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-90,0},{-60,0}}),Line(visible=true, points={{-60,-30},{-60,30}}),Line(visible=true, points={{-60,-30},{60,-30}}),Line(visible=true, points={{-60,30},{60,30}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-30},{30,30}}),Line(visible=true, points={{30,0},{90,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,40},{150,80}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-150,-90},{150,-50}}, textString="d=%d", fontName="Arial")}));
  equation 
    w_rel=der(phi_rel);
    tau=d*w_rel;
  end Damper;

  model SpringDamper "Linear 1D rotational spring and damper in parallel"
    import SI = Modelica.SIunits;
    import Modelica.Mechanics.Rotational.Types.InitRel;
    import Modelica.Blocks.Types.StateSelection;
    parameter Real c(final unit="N.m/rad", final min=0) "Spring constant";
    parameter SI.Angle phi_rel0=0 "Unstretched spring angle";
    parameter Real d(final unit="N.m.s/rad", final min=0)=0 "Damping constant";
    parameter InitRel.Temp initType=Modelica.Mechanics.Rotational.Types.InitRel.NoInit "Type of initialization (defines usage of start values below)" annotation(Dialog(group="Initialization"));
    parameter SI.Angle phi_rel_start=0 "Initial or guess value of relative rotation angle phi_rel" annotation(Dialog(group="Initialization"), Evaluate=false);
    parameter SI.AngularVelocity w_rel_start=0 "Initial or guess value of relative angular velocity w_rel = der(phi_rel)" annotation(Dialog(group="Initialization"), Evaluate=false);
    parameter StateSelection.Temp stateSelection=Modelica.Blocks.Types.StateSelection.Default "Priority to use phi_rel and w_rel as states" annotation(Dialog(tab="Advanced"));
    extends Interfaces.Compliant(phi_rel(start=phi_rel_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always));
    SI.AngularVelocity w_rel(start=w_rel_start, stateSelect=if stateSelection == StateSelection.Never then StateSelect.never else if stateSelection == StateSelection.Avoid then StateSelect.avoid else if stateSelection == StateSelection.Default then StateSelect.default else if stateSelection == StateSelection.Prefer then StateSelect.prefer else StateSelect.always) "Relative angular velocity between flange_b and flange_a";
    annotation(Documentation(info="<html>
<p>
A <b>spring</b> and <b>damper</b> element <b>connected in parallel</b>.
The component can be
connected either between two inertias/gears to describe the shaft elasticity
and damping, or between an inertia/gear and the housing (component Fixed),
to describe a coupling of the element with the housing via a spring/damper.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,32},{-58,32},{-43,2},{-13,62},{17,2},{47,62},{62,32},{80,32}}, thickness=0.5),Line(visible=true, points={{-68,32},{-68,97}}, color={128,128,128}),Line(visible=true, points={{72,32},{72,97}}, color={128,128,128}),Line(visible=true, points={{-68,92},{72,92}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{62,95},{72,92},{62,89},{62,95}}),Text(visible=true, fillColor={0,0,255}, extent={{-20,72},{20,97}}, textString="phi_rel", fontName="Arial"),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-52,-80},{38,-20}}),Line(visible=true, points={{-52,-80},{68,-80}}),Line(visible=true, points={{-52,-20},{68,-20}}),Line(visible=true, points={{38,-50},{80,-50}}),Line(visible=true, points={{-80,-50},{-52,-50}}),Line(visible=true, points={{-80,32},{-80,-50}}),Line(visible=true, points={{80,32},{80,-50}}),Line(visible=true, points={{-96,0},{-80,0}}),Line(visible=true, points={{96,0},{80,0}}),Text(visible=true, fillColor={128,128,128}, extent={{15,-100},{83,-87}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{11,-94},{-9,-89},{-9,-99},{11,-94}}),Line(visible=true, points={{-79,-94},{-8,-94}}, color={128,128,128})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,40},{-60,40},{-45,10},{-15,70},{15,10},{45,70},{60,40},{80,40}}),Line(visible=true, points={{-80,40},{-80,-70}}),Line(visible=true, points={{-80,-70},{-52,-70}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-52,-100},{38,-40}}),Line(visible=true, points={{-52,-40},{68,-40}}),Line(visible=true, points={{-52,-100},{68,-100}}),Line(visible=true, points={{38,-70},{80,-70}}),Line(visible=true, points={{80,40},{80,-70}}),Line(visible=true, points={{-90,0},{-80,0}}),Line(visible=true, points={{80,0},{90,0}}),Text(visible=true, extent={{-101,-147},{98,-107}}, textString="d=%d", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,70},{150,110}}, textString="%name=%c", fontName="Arial")}));
  initial equation 
    if initType == InitRel.SteadyState then
      der(phi_rel)=0;
      der(w_rel)=0;
    elseif initType == InitRel.InitialState then
      phi_rel=phi_rel_start;
      w_rel=w_rel_start;
    elseif initType == InitRel.InitialAngle then
      phi_rel=phi_rel_start;
    elseif initType == InitRel.InitialSpeed then
      w_rel=w_rel_start;
    else
    end if;
  equation 
    w_rel=der(phi_rel);
    tau=c*(phi_rel - phi_rel0) + d*w_rel;
  end SpringDamper;

  model ElastoBacklash "Backlash connected in series to linear spring and damper (backlash is modeled with elasticity)"
    extends Interfaces.Compliant;
    parameter SI.Angle b(final min=0)=0 "Total backlash";
    parameter Real c(final unit="N.m/rad", final min=Modelica.Constants.small)=100000.0 "Spring constant (c > 0 required)";
    parameter SI.Angle phi_rel0=0 "Unstretched spring angle";
    parameter Real d(final unit="N.m.s/rad", final min=0)=0 "Damping constant";
    SI.AngularVelocity w_rel "Relative angular velocity between flange_b and flange_a";
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,32},{-58,32},{-48,0},{-34,61},{-20,0},{-8,60},{0,30},{20,30}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-80},{-10,-20}}),Line(visible=true, points={{-52,-80},{0,-80}}),Line(visible=true, points={{-52,-20},{0,-20}}),Line(visible=true, points={{-10,-50},{20,-50}}),Line(visible=true, points={{-80,-50},{-60,-50}}),Line(visible=true, points={{-80,32},{-80,-50}}),Line(visible=true, points={{20,30},{20,-50}}),Line(visible=true, points={{-90,0},{-80,0}}),Line(visible=true, points={{90,0},{80,0}}),Line(visible=true, points={{20,0},{60,0},{60,-30}}),Line(visible=true, points={{40,-12},{40,-40},{80,-40},{80,0}}),Text(visible=true, extent={{-150,-130},{150,-90}}, textString="b=%b", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name=%c", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,32},{-58,32},{-48,0},{-34,60},{-20,0},{-8,60},{0,30},{20,30}}, thickness=0.5),Line(visible=true, points={{-68,32},{-68,97}}, color={128,128,128}),Line(visible=true, points={{80,0},{80,96}}, color={128,128,128}),Line(visible=true, points={{-68,92},{72,92}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{70,95},{80,92},{70,89},{70,95}}),Text(visible=true, fillColor={128,128,128}, extent={{-10,70},{30,95}}, textString="phi_rel", fontName="Arial"),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-60,-80},{-10,-20}}),Line(visible=true, points={{-52,-80},{0,-80}}, thickness=0.5),Line(visible=true, points={{-52,-20},{0,-20}}, thickness=0.5),Line(visible=true, points={{-10,-50},{20,-50}}, thickness=0.5),Line(visible=true, points={{-80,-50},{-60,-50}}, thickness=0.5),Line(visible=true, points={{-80,32},{-80,-50}}, thickness=0.5),Line(visible=true, points={{20,30},{20,-50}}, thickness=0.5),Line(visible=true, points={{-96,0},{-80,0}}),Line(visible=true, points={{96,0},{80,0}}, thickness=0.5),Line(visible=true, points={{20,0},{60,0},{60,-30}}, thickness=0.5),Line(visible=true, points={{40,-12},{40,-40},{80,-40},{80,0}}, thickness=0.5),Line(visible=true, points={{30,0},{30,64}}, color={128,128,128}),Line(visible=true, points={{30,60},{80,60}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{70,63},{80,60},{70,57},{70,63}}),Text(visible=true, fillColor={160,160,160}, extent={{39,46},{68,60}}, textString="b", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{15,-102},{83,-89}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{11,-96},{-9,-91},{-9,-101},{11,-96}}),Line(visible=true, points={{-79,-96},{-8,-96}}, color={128,128,128})}));
  protected 
    SI.Angle b2=b/2;
    constant SI.Angle b_min=1e-10 "minimum backlash";
    annotation(Documentation(info="<html>
<p>
This element consists of a <b>backlash</b> element <b>connected in series</b>
to a <b>spring</b> and <b>damper</b> element which are <b>connected in parallel</b>.
The spring constant shall be non-zero, otherwise the component cannot be used.
</p>
<p>
In combination with components IdealGear, the ElastoBacklash model
can be used to model a gear box with backlash, elasticity and damping.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,32},{-58,32},{-48,0},{-34,61},{-20,0},{-8,60},{0,30},{20,30}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Rectangle(extent={{-60,-20},{-10,-80}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, pattern=LinePattern.Solid, lineThickness=0.25, fillColor={192,192,192}),Line(points={{-52,-80},{0,-80}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-52,-20},{0,-20}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-10,-50},{20,-50}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-80,-50},{-60,-50}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-80,32},{-80,-50}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{20,30},{20,-50}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{-90,0},{-80,0}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{90,0},{80,0}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{20,0},{60,0},{60,-30}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Line(points={{40,-12},{40,-40},{80,-40},{80,0}}, color={0,0,0}, pattern=LinePattern.Solid, thickness=0.25, arrow={Arrow.None,Arrow.None}),Text(extent={{-150,-130},{150,-90}}, textString="b=%b", fillColor={0,0,0}),Text(extent={{-150,100},{150,60}}, textString="%name=%c")}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Line(points={{-80,32},{-58,32},{-48,0},{-34,60},{-20,0},{-8,60},{0,30},{20,30}}, color={0,0,0}, thickness=0.5),Line(points={{-68,32},{-68,97}}, color={128,128,128}),Line(points={{80,0},{80,96}}, color={128,128,128}),Line(points={{-68,92},{72,92}}, color={128,128,128}),Polygon(points={{70,95},{80,92},{70,89},{70,95}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Text(extent={{-10,70},{30,95}}, textString="phi_rel", fillColor={128,128,128}),Rectangle(extent={{-60,-20},{-10,-80}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, lineThickness=0.5, fillColor={192,192,192}),Line(points={{-52,-80},{0,-80}}, color={0,0,0}, thickness=0.5),Line(points={{-52,-20},{0,-20}}, color={0,0,0}, thickness=0.5),Line(points={{-10,-50},{20,-50}}, color={0,0,0}, thickness=0.5),Line(points={{-80,-50},{-60,-50}}, color={0,0,0}, thickness=0.5),Line(points={{-80,32},{-80,-50}}, color={0,0,0}, thickness=0.5),Line(points={{20,30},{20,-50}}, color={0,0,0}, thickness=0.5),Line(points={{-96,0},{-80,0}}, color={0,0,0}),Line(points={{96,0},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{20,0},{60,0},{60,-30}}, color={0,0,0}, thickness=0.5),Line(points={{40,-12},{40,-40},{80,-40},{80,0}}, color={0,0,0}, thickness=0.5),Line(points={{30,0},{30,64}}, color={128,128,128}),Line(points={{30,60},{80,60}}, color={128,128,128}),Polygon(points={{70,63},{80,60},{70,57},{70,63}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Text(extent={{39,60},{68,46}}, textString="b", fillColor={160,160,160}),Text(extent={{15,-89},{83,-102}}, textString="rotation axis", fillColor={128,128,128}),Polygon(points={{11,-96},{-9,-91},{-9,-101},{11,-96}}, fillPattern=FillPattern.Solid, lineColor={128,128,128}, fillColor={128,128,128}),Line(points={{-79,-96},{-8,-96}}, color={128,128,128})}));
  equation 
    w_rel=der(phi_rel);
    tau=if b2 > b_min then if phi_rel > b2 then c*(phi_rel - phi_rel0 - b2) + d*w_rel else if phi_rel < -b2 then c*(phi_rel - phi_rel0 + b2) + d*w_rel else 0 else c*(phi_rel - phi_rel0) + d*w_rel;
  end ElastoBacklash;

  model BearingFriction "Coulomb friction in bearings "
    extends Interfaces.TwoFlangesAndBearing;
    parameter Real tau_pos[:,:]=[0,1] "[w,tau] Positive sliding friction characteristic (w>=0)";
    parameter Real peak(final min=1)=1 "peak*tau_pos[1,2] = Maximum friction torque for w==0";
    extends Interfaces.FrictionBase;
    SI.Angle phi;
    SI.AngularVelocity w "Absolute angular velocity of flange_a and flange_b";
    SI.AngularAcceleration a "Absolute angular acceleration of flange_a and flange_b";
    annotation(Documentation(info="<html>
<p>
This element describes <b>Coulomb friction</b> in <b>bearings</b>,
i.e., a frictional torque acting between a flange and the housing.
The positive sliding friction torque \"tau\" has to be defined
by table \"tau_pos\" as function of the absolute angular velocity \"w\".
E.g.
<p>
<pre>
       w | tau
      ---+-----
       0 |   0
       1 |   2
       2 |   5
       3 |   8
</pre>
<p>
gives the following table:
</p>
<pre>
   tau_pos = [0, 0; 1, 2; 2, 5; 3, 8];
</pre>
<p>
Currently, only linear interpolation in the table is supported.
Outside of the table, extrapolation through the last
two table entries is used. It is assumed that the negative
sliding friction force has the same characteristic with negative
values. Friction is modelled in the following way:
</p>
<p>
When the absolute angular velocity \"w\" is not zero, the friction torque
is a function of w and of a constant normal force. This dependency
is defined via table tau_pos and can be determined by measurements,
e.g. by driving the gear with constant velocity and measuring the
needed motor torque (= friction torque).
</p>
<p>
When the absolute angular velocity becomes zero, the elements
connected by the friction element become stuck, i.e., the absolute
angle remains constant. In this phase the friction torque is
calculated from a torque balance due to the requirement, that
the absolute acceleration shall be zero.  The elements begin
to slide when the friction torque exceeds a threshold value,
called the maximum static friction torque, computed via:
</p>
<pre>
   maximum_static_friction = <b>peak</b> * sliding_friction(w=0)  (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled which have to be solved by appropriate
numerical methods. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
<p>
More precise friction models take into account the elasticity of the
material when the two elements are \"stuck\", as well as other effects,
like hysteresis. This has the advantage that the friction element can
be completely described by a differential equation without events. The
drawback is that the system becomes stiff (about 10-20 times slower
simulation) and that more material constants have to be supplied which
requires more sophisticated identification. For more details, see the
following references, especially (Armstrong and Canudas de Witt 1996):
</p>
<dl>
<dt>Armstrong B. (1991):
<dd><b>Control of Machines with Friction</b>. Kluwer Academic
    Press, Boston MA.<br><br>
<dt>Armstrong B., and Canudas de Wit C. (1996):
<dd><b>Friction Modeling and Compensation.</b>
    The Control Handbook, edited by W.S.Levine, CRC Press,
    pp. 1369-1382.<br><br>
<dt>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995):
<dd><b>A new model for control of systems with friction.</b>
    IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<br><br>
</dl>
 
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{96,10}}),Rectangle(visible=true, extent={{-60,-60},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-25},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-61},{60,-45}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,-18}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,-70},{-60,-60},{60,-60}}),Line(visible=true, points={{-75,-10},{-75,-70}}),Line(visible=true, points={{75,-10},{75,-70}}),Rectangle(visible=true, extent={{-60,10},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,45},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,10},{60,25}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,19},{50,51}}),Line(visible=true, points={{-75,70},{-75,10}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{-60,60},{60,60}}),Line(visible=true, points={{75,70},{75,10}}),Line(visible=true, points={{-20,-24},{38,-24}}, color={255,0,0}, thickness=1),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-20,-19},{-20,-29},{-36,-24},{-20,-19}}),Text(visible=true, fillColor={255,0,0}, extent={{-45,-51},{49,-23}}, textString="tau (friction torque)", fontName="Arial"),Text(visible=true, fillColor={128,128,128}, extent={{14,84},{82,97}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,90},{-10,95},{-10,85},{10,90}}),Line(visible=true, points={{-80,90},{-9,90}}, color={128,128,128}),Line(visible=true, points={{-10,-90},{0,-80}}),Line(visible=true, points={{-5,-90},{5,-80}}),Line(visible=true, points={{0,-90},{10,-80}}),Line(visible=true, points={{5,-90},{10,-85}}),Line(visible=true, points={{-10,-85},{-5,-80}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{100,10}}),Rectangle(visible=true, extent={{-60,-60},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-25},{60,-10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,-61},{60,-45}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,-50},{50,-18}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,-60},{60,-70},{75,-70},{75,-80},{-75,-80},{-75,-70},{-60,-70},{-60,-60},{60,-60}}),Line(visible=true, points={{-75,-10},{-75,-70}}),Line(visible=true, points={{75,-10},{75,-70}}),Rectangle(visible=true, extent={{-60,10},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,45},{60,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-60,10},{60,25}}),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-50,19},{50,51}}),Line(visible=true, points={{-75,70},{-75,10}}),Polygon(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{60,60},{60,70},{75,70},{75,80},{-75,80},{-75,70},{-60,70},{-60,60},{60,60}}),Line(visible=true, points={{75,70},{75,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,90},{150,130}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-10,-90},{0,-80}}),Line(visible=true, points={{-5,-90},{5,-80}}),Line(visible=true, points={{0,-90},{10,-80}}),Line(visible=true, points={{5,-90},{10,-85}}),Line(visible=true, points={{-10,-85},{-5,-80}})}));
protected 
  parameter Modelica.SIunits.Torque unitTorque=1;
  equation 
    tau0=Modelica.Math.tempInterpol1(0, tau_pos, 2);
    tau0_max=peak*tau0;
    free=false;
    phi=phi_a;
    phi=phi_b;
    w=der(phi);
    a=der(w);
    w_relfric=w;
    a_relfric=a;
    0=flange_a.tau + flange_b.tau - tau;
    tau=if locked then sa*unitTorque else if startForward then Modelica.Math.tempInterpol1(w, tau_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-w, tau_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(w, tau_pos, 2) else -Modelica.Math.tempInterpol1(-w, tau_pos, 2);
  end BearingFriction;

  model Clutch "Clutch based on Coulomb friction "
    extends Interfaces.Compliant;
    parameter Real mue_pos[:,:]=[0,0.5] "[w,mue] positive sliding friction coefficient (w_rel>=0)";
    parameter Real peak(final min=1)=1 "peak*mue_pos[1,2] = maximum value of mue for w_rel==0";
    parameter Real cgeo(final min=0)=1 "Geometry constant containing friction distribution assumption";
    parameter SI.Force fn_max(final min=0)=1 "Maximum normal force";
    extends Interfaces.FrictionBase;
    SI.AngularVelocity w_rel "Relative angular velocity (flange_b.w - flange_a.w)";
    SI.AngularAcceleration a_rel "Relative angular acceleration (flange_b.a - flange_a.a)";
    Real mue0 "Friction coefficient for w=0 and forward sliding";
    SI.Force fn "Normal force (fn=fn_max*inPort.signal)";
    annotation(Documentation(info="<html>
<p>
This component models a <b>clutch</b>, i.e., a component with
two flanges where friction is present between the two flanges
and these flanges are pressed together via a normal force.
The normal force fn has to be provided as input signal f_normalized in a normalized form
(0 &le; f_normalized &le; 1),
fn = fn_max*f_normalized, where fn_max has to be provided as parameter. Friction in the
clutch is modelled in the following way:
</p>
<p>
When the relative angular velocity is not zero, the friction torque is a
function of the velocity dependent friction coefficient  mue(w_rel) , of
the normal force \"fn\", and of a geometry constant \"cgeo\" which takes into
account the geometry of the device and the assumptions on the friction
distributions:
</p>
<pre>
        frictional_torque = <b>cgeo</b> * <b>mue</b>(w_rel) * <b>fn</b>
</pre>
<p>
   Typical values of coefficients of friction:
</p>
<pre>
      dry operation   :  <b>mue</b> = 0.2 .. 0.4
      operating in oil:  <b>mue</b> = 0.05 .. 0.1
</pre>
<p>
   When plates are pressed together, where  <b>ri</b>  is the inner radius,
   <b>ro</b> is the outer radius and <b>N</b> is the number of friction interfaces,
   the geometry constant is calculated in the following way under the
   assumption of a uniform rate of wear at the interfaces:
</p>
<pre>
         <b>cgeo</b> = <b>N</b>*(<b>r0</b> + <b>ri</b>)/2
</pre>
<p>
    The positive part of the friction characteristic <b>mue</b>(w_rel),
    w_rel >= 0, is defined via table mue_pos (first column = w_rel,
    second column = mue). Currently, only linear interpolation in
    the table is supported.
</p>
<p>
   When the relative angular velocity becomes zero, the elements
   connected by the friction element become stuck, i.e., the relative
   angle remains constant. In this phase the friction torque is
   calculated from a torque balance due to the requirement, that
   the relative acceleration shall be zero.  The elements begin
   to slide when the friction torque exceeds a threshold value,
   called the  maximum static friction torque, computed via:
</p>
<pre>
       frictional_torque = <b>peak</b> * <b>cgeo</b> * <b>mue</b>(w_rel=0) * <b>fn</b>   (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
<p>
More precise friction models take into account the elasticity of the
material when the two elements are \"stuck\", as well as other effects,
like hysteresis. This has the advantage that the friction element can
be completely described by a differential equation without events. The
drawback is that the system becomes stiff (about 10-20 times slower
simulation) and that more material constants have to be supplied which
requires more sophisticated identification. For more details, see the
following references, especially (Armstrong and Canudas de Witt 1996):
</p>
<dl>
<dt>Armstrong B. (1991):
<dd><b>Control of Machines with Friction</b>. Kluwer Academic
    Press, Boston MA.<br><br>
<dt>Armstrong B., and Canudas de Wit C. (1996):
<dd><b>Friction Modeling and Compensation.</b>
    The Control Handbook, edited by W.S.Levine, CRC Press,
    pp. 1369-1382.<br><br>
<dt>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995):
<dd><b>A new model for control of systems with friction.</b>
    IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<br><br>
</dl>
<br>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{-30,40},{-60,50},{-60,30},{-30,40}}),Line(visible=true, points={{0,90},{-90,70},{-90,40},{-30,40}}, color={0,0,191}),Line(visible=true, points={{0,90},{90,70},{90,40},{30,40}}, color={0,0,191}),Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{30,40},{60,50},{60,30},{30,40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-60},{30,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-30,-60},{-10,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-30,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-70}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-30,40},{-60,50},{-60,30},{-30,40}}),Line(visible=true, points={{0,90},{-90,70},{-90,40},{-30,40}}),Line(visible=true, points={{0,90},{90,70},{90,40},{30,40}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{30,40},{60,50},{60,30},{30,40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-60},{30,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-30,-60},{-10,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{96,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-30,10}}),Text(visible=true, fillColor={128,128,128}, extent={{19,-103},{87,-90}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{15,-97},{-5,-92},{-5,-102},{15,-97}}),Line(visible=true, points={{-75,-97},{-4,-97}}, color={128,128,128})}));
    Modelica.Blocks.Interfaces.RealInput f_normalized "Normalized force signal 0..1 (normal force = fn_max*f_normalized; clutch is engaged if > 0)" annotation(Placement(visible=true, transformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90), iconTransformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90)));
protected
  parameter Modelica.SIunits.Torque unitTorque=1;
  equation 
    mue0=Modelica.Math.tempInterpol1(0, mue_pos, 2);
    w_rel=der(phi_rel);
    a_rel=der(w_rel);
    w_relfric=w_rel;
    a_relfric=a_rel;
    fn=fn_max*f_normalized;
    free=fn <= 0;
    tau0=mue0*cgeo*fn;
    tau0_max=peak*tau0;
    tau=if locked then sa*unitTorque else if free then 0 else cgeo*fn*(if startForward then Modelica.Math.tempInterpol1(w_rel, mue_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-w_rel, mue_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(w_rel, mue_pos, 2) else -Modelica.Math.tempInterpol1(-w_rel, mue_pos, 2));
  end Clutch;

  model OneWayClutch "Series connection of freewheel and clutch"
    extends Interfaces.Compliant;
    parameter Real mue_pos[:,:]=[0,0.5] "[w,mue] positive sliding friction coefficient (w_rel>=0)";
    parameter Real peak(final min=1)=1 "peak*mue_pos[1,2] = maximum value of mue for w_rel==0";
    parameter Real cgeo(final min=0)=1 "Geometry constant containing friction distribution assumption";
    parameter SI.Force fn_max(final min=0)=1 "Maximum normal force";
    parameter SI.AngularVelocity w_small=10000000000.0 "Relative angular velocity near to zero if jumps due to a reinit(..) of the velocity can occur (set to low value only if such impulses can occur)" annotation(Dialog(tab="Advanced"));
    SI.AngularVelocity w_rel "Relative angular velocity (flange_b.w - flange_a.w)";
    SI.AngularAcceleration a_rel "Relative angular acceleration (flange_b.a - flange_a.a)";
    Real u "normalized force input signal (0..1)";
    SI.Force fn "Normal force (fn=fn_max*inPort.signal)";
    Boolean startForward "true, if w_rel=0 and start of forward sliding or w_rel > w_small";
    Boolean locked "true, if w_rel=0 and not sliding";
    Boolean stuck(final start=false) "w_rel=0 (forward sliding or locked)";
    annotation(Documentation(info="<html>
<p>
This component models a <b>one-way clutch</b>, i.e., a component with
two flanges where friction is present between the two flanges
and these flanges are pressed together via a normal force. These
flanges maybe sliding with respect to each other
Parallel connection of ClutchCombi and of FreeWheel.
                     The element is introduced to resolve the ambiguity
                     of the constraint torques of the elements.
<p>
A one-way-clutch is an element where a clutch is connected in parallel
to a free wheel. This special element is provided, because such
a parallel connection introduces an ambiguity into the model
(the constraint torques are not uniquely defined when both
elements are stuck) and this element resolves it by introducing
<b>one</b> constraint torque and not two.
</p>
<p>
Note, initial values have to be chosen for the model, such that the
relative speed of the one-way-clutch >= 0. Otherwise, the configuration
is physically not possible and an error occurs.
</p>
<p>
The normal force fn has to be provided as input signal f_normalized in a normalized form
(0 &le; f_normalized &le; 1),
fn = fn_max*f_normalized, where fn_max has to be provided as parameter. Friction in the
clutch is modelled in the following way:
</p>
<p>
When the relative angular velocity is positive, the friction torque is a
function of the velocity dependent friction coefficient  mue(w_rel) , of
the normal force \"fn\", and of a geometry constant \"cgeo\" which takes into
account the geometry of the device and the assumptions on the friction
distributions:
</p>
<pre>
        frictional_torque = <b>cgeo</b> * <b>mue</b>(w_rel) * <b>fn</b>
</pre>
<p>
   Typical values of coefficients of friction:
</p>
<pre>
      dry operation   :  <b>mue</b> = 0.2 .. 0.4
      operating in oil:  <b>mue</b> = 0.05 .. 0.1
</pre>
<p>
   When plates are pressed together, where  <b>ri</b>  is the inner radius,
   <b>ro</b> is the outer radius and <b>N</b> is the number of friction interfaces,
   the geometry constant is calculated in the following way under the
   assumption of a uniform rate of wear at the interfaces:
</p>
<pre>
         <b>cgeo</b> = <b>N</b>*(<b>r0</b> + <b>ri</b>)/2
</pre>
<p>
    The positive part of the friction characteristic <b>mue</b>(w_rel),
    w_rel >= 0, is defined via table mue_pos (first column = w_rel,
    second column = mue). Currently, only linear interpolation in
    the table is supported.
</p>
<p>
   When the relative angular velocity becomes zero, the elements
   connected by the friction element become stuck, i.e., the relative
   angle remains constant. In this phase the friction torque is
   calculated from a torque balance due to the requirement, that
   the relative acceleration shall be zero.  The elements begin
   to slide when the friction torque exceeds a threshold value,
   called the  maximum static friction torque, computed via:
</p>
<pre>
       frictional_torque = <b>peak</b> * <b>cgeo</b> * <b>mue</b>(w_rel=0) * <b>fn</b>   (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-30,40},{-60,50},{-60,30},{-30,40}}),Line(visible=true, points={{0,90},{-90,70},{-90,40},{-30,40}}),Line(visible=true, points={{0,90},{90,70},{90,40},{30,40}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{30,40},{60,50},{60,30},{30,40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-60},{30,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-30,-60},{-10,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{96,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-30,10}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-10,30},{50,0},{-10,-30},{-10,30}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{-30,40},{-60,50},{-60,30},{-30,40}}),Line(visible=true, points={{0,90},{-90,70},{-90,40},{-30,40}}, color={0,0,191}),Line(visible=true, points={{0,90},{90,70},{90,40},{30,40}}, color={0,0,191}),Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{30,40},{60,50},{60,30},{30,40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{10,-60},{30,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-30,-60},{-10,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-30,10}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-110},{150,-70}}, textString="%name", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-10,30},{50,0},{-10,-30},{-10,30}})}));
    Modelica.Blocks.Interfaces.RealInput f_normalized "Normalized force signal 0..1 (normal force = fn_max*f_normalized; clutch is engaged if > 0)" annotation(Placement(visible=true, transformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90), iconTransformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90)));
  protected 
    SI.Torque tau0 "Friction torque for w=0 and sliding";
    SI.Torque tau0_max "Maximum friction torque for w=0 and locked";
    Real mue0 "Friction coefficient for w=0 and sliding";
    Boolean free "true, if frictional element is not active";
    Real sa "path parameter of tau = f(a_rel) Friction characteristic";
    constant Real eps0=0.0001 "Relative hysteresis epsilon";
    SI.Torque tau0_max_low "lowest value for tau0_max";
    parameter Real peak2=max([peak,1 + eps0]);
    parameter SI.AngularAcceleration unitAngularAcceleration = 1;
    parameter SI.Torque unitTorque = 1;
  equation 
    mue0=Modelica.Math.tempInterpol1(0, mue_pos, 2);
    tau0_max_low=eps0*mue0*cgeo*fn_max;
    w_rel=der(phi_rel);
    a_rel=der(w_rel);
    u=f_normalized;
    free=u <= 0;
    fn=if free then 0 else fn_max*u;
    tau0=mue0*cgeo*fn;
    tau0_max=if free then tau0_max_low else peak2*tau0;
    startForward=pre(stuck) and (sa > tau0_max/unitTorque or pre(startForward) and sa > tau0/unitTorque or w_rel > w_small) or initial() and w_rel > 0;
    locked=pre(stuck) and not startForward;
    a_rel=unitAcceleration*(if locked then 0 else sa - tau0/unitTorque);
    tau=if locked then sa*unitTorque else if free then 0 else cgeo*fn*Modelica.Math.tempInterpol1(w_rel, mue_pos, 2);
    stuck=locked or w_rel <= 0;
  end OneWayClutch;

  model Brake "Brake based on Coulomb friction "
    extends Interfaces.TwoFlangesAndBearing;
    parameter Real mue_pos[:,:]=[0,0.5] "[w,mue] positive sliding friction coefficient (w_rel>=0)";
    parameter Real peak(final min=1)=1 "peak*mue_pos[1,2] = maximum value of mue for w_rel==0";
    parameter Real cgeo(final min=0)=1 "Geometry constant containing friction distribution assumption";
    parameter SI.Force fn_max(final min=0)=1 "Maximum normal force";
    extends Interfaces.FrictionBase;
    SI.Angle phi;
    SI.AngularVelocity w "Absolute angular velocity of flange_a and flange_b";
    SI.AngularAcceleration a "Absolute angular acceleration of flange_a and flange_b";
    Real mue0 "Friction coefficient for w=0 and forward sliding";
    SI.Force fn "Normal force (=fn_max*inPort.signal)";
    annotation(Documentation(info="<html>
<p>
This component models a <b>brake</b>, i.e., a component where a frictional
torque is acting between the housing and a flange and a controlled normal
force presses the flange to the housing in order to increase friction.
The normal force fn has to be provided as input signal f_normalized in a normalized form
(0 &le; f_normalized &le; 1),
fn = fn_max*f_normalized, where fn_max has to be provided as parameter.
Friction in the brake is modelled in the following way:
</p>
<p>
When the absolute angular velocity \"w\" is not zero, the friction torque
is a function of the velocity dependent friction coefficient  mue(w) , of
the normal force \"fn\", and of a geometry constant \"cgeo\" which takes into
account the geometry of the device and the assumptions on the friction
distributions:
</p>
<pre>
        frictional_torque = <b>cgeo</b> * <b>mue</b>(w) * <b>fn</b>
</pre>
<p>
   Typical values of coefficients of friction:
</p>
<pre>
      dry operation   :  <b>mue</b> = 0.2 .. 0.4
      operating in oil:  <b>mue</b> = 0.05 .. 0.1
</pre>
<p>
   When plates are pressed together, where  <b>ri</b>  is the inner radius,
   <b>ro</b> is the outer radius and <b>N</b> is the number of friction interfaces,
   the geometry constant is calculated in the following way under the
   assumption of a uniform rate of wear at the interfaces:
</p>
<pre>
         <b>cgeo</b> = <b>N</b>*(<b>r0</b> + <b>ri</b>)/2
</pre>
<p>
    The positive part of the friction characteristic <b>mue</b>(w),
    w >= 0, is defined via table mue_pos (first column = w,
    second column = mue). Currently, only linear interpolation in
    the table is supported.
</p>
<p>
   When the absolute angular velocity becomes zero, the elements
   connected by the friction element become stuck, i.e., the absolute
   angle remains constant. In this phase the friction torque is
   calculated from a torque balance due to the requirement, that
   the absolute acceleration shall be zero.  The elements begin
   to slide when the friction torque exceeds a threshold value,
   called the  maximum static friction torque, computed via:
</p>
<pre>
       frictional_torque = <b>peak</b> * <b>cgeo</b> * <b>mue</b>(w=0) * <b>fn</b>   (<b>peak</b> >= 1)
</pre>
<p>
This procedure is implemented in a \"clean\" way by state events and
leads to continuous/discrete systems of equations if friction elements
are dynamically coupled. The method is described in:
</p>
<dl>
<dt>Otter M., Elmqvist H., and Mattsson S.E. (1999):
<dd><b>Hybrid Modeling in Modelica based on the Synchronous
    Data Flow Principle</b>. CACSD'99, Aug. 22.-26, Hawaii.
</dl>
<p>
More precise friction models take into account the elasticity of the
material when the two elements are \"stuck\", as well as other effects,
like hysteresis. This has the advantage that the friction element can
be completely described by a differential equation without events. The
drawback is that the system becomes stiff (about 10-20 times slower
simulation) and that more material constants have to be supplied which
requires more sophisticated identification. For more details, see the
following references, especially (Armstrong and Canudas de Witt 1996):
</p>
<dl>
<dt>Armstrong B. (1991):
<dd><b>Control of Machines with Friction</b>. Kluwer Academic
    Press, Boston MA.<br><br>
<dt>Armstrong B., and Canudas de Wit C. (1996):
<dd><b>Friction Modeling and Compensation.</b>
    The Control Handbook, edited by W.S.Levine, CRC Press,
    pp. 1369-1382.<br><br>
<dt>Canudas de Wit C., Olsson H., Astroem K.J., and Lischinsky P. (1995):
<dd><b>A new model for control of systems with friction.</b>
    IEEE Transactions on Automatic Control, Vol. 40, No. 3, pp. 419-425.<br><br>
</dl>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-37,-55},{-37,-90},{37,-90},{37,-55},{33,-55},{33,-86},{-33,-86},{-33,-55},{-37,-55}}),Text(visible=true, fillColor={128,128,128}, extent={{14,-76},{82,-63}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{0,-70},{-20,-65},{-20,-75},{0,-70}}),Line(visible=true, points={{-90,-70},{-19,-70}}, color={128,128,128}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-20,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-10},{96,10}}),Line(visible=true, points={{0,90},{-80,70},{-80,-40},{-70,-40}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,-60},{20,60}}),Line(visible=true, points={{0,90},{80,70},{80,-40},{70,-40}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{40,-40},{70,-30},{70,-50},{40,-40}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-40,-40},{-70,-30},{-70,-50},{-40,-40}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-40,-55},{-30,-25}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{30,-55},{40,-25}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-37,-55},{-37,-90},{37,-90},{37,-55},{33,-55},{33,-86},{-33,-86},{-33,-55},{-37,-55}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-20,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,-60},{20,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-10},{100,10}}),Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{40,-40},{70,-30},{70,-50},{40,-40}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{30,-55},{40,-25}}),Polygon(visible=true, lineColor={0,0,191}, fillColor={0,0,191}, fillPattern=FillPattern.Solid, points={{-40,-40},{-70,-30},{-70,-50},{-40,-40}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-40,-55},{-30,-25}}),Line(visible=true, points={{0,90},{80,70},{80,-40},{70,-40}}, color={0,0,191}),Line(visible=true, points={{0,90},{-80,70},{-80,-40},{-70,-40}}, color={0,0,191}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-180},{150,-140}}, textString="%name", fontName="Arial")}));
    Modelica.Blocks.Interfaces.RealInput f_normalized "Normalized force signal 0..1 (normal force = fn_max*f_normalized; brake is active if > 0)" annotation(Placement(visible=true, transformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90), iconTransformation(origin={0,110}, extent={{-20,20},{20,-20}}, rotation=-90)));
protected 
  parameter SI.Torque unitTorque = 1;
  equation 
    mue0=Modelica.Math.tempInterpol1(0, mue_pos, 2);
    phi=phi_a;
    phi=phi_b;
    w=der(phi);
    a=der(w);
    w_relfric=w;
    a_relfric=a;
    0=flange_a.tau + flange_b.tau - tau;
    fn=fn_max*f_normalized;
    tau0=mue0*cgeo*fn;
    tau0_max=peak*tau0;
    free=fn <= 0;
    tau=if locked then sa*unitTorque else if free then 0 else cgeo*fn*(if startForward then Modelica.Math.tempInterpol1(w, mue_pos, 2) else if startBackward then -Modelica.Math.tempInterpol1(-w, mue_pos, 2) else if pre(mode) == Forward then Modelica.Math.tempInterpol1(w, mue_pos, 2) else -Modelica.Math.tempInterpol1(-w, mue_pos, 2));
  end Brake;

  model LossyGear "Gear with mesh efficiency and bearing friction (stuck/rolling possible)"
    extends Interfaces.TwoFlangesAndBearing;
    parameter Real i=1 "Transmission ratio (flange_a.phi/flange_b.phi)";
    parameter Real lossTable[:,5]=[0,1,1,0,0] "Array for mesh efficiencies and bearing friction depending on speed";
    Real sa "path parameter for acceleration and torque loss";
    SI.AngularVelocity w_a "angular velocity of flange_a";
    SI.AngularAcceleration a_a "angular acceleration of flange_a";
    Real interpolation_result[1,size(lossTable, 2) - 1];
    Real eta_mf1;
    Real eta_mf2;
    Real tau_bf1;
    Real tau_bf2;
    Real quadrant1;
    Real quadrant2;
    Real quadrant3;
    Real quadrant4;
    SI.Torque tauLoss "Torque loss due to friction in the gear teeth and in the bearings";
    SI.Torque tauLossMax "Torque loss for positive speed";
    SI.Torque tauLossMin "Torque loss for negative speed";
    Boolean tau_aPos "true, if torque of flange_a is not negative";
    Boolean startForward "true, if starting to roll forward";
    Boolean startBackward "true, if starting to roll backward";
    Boolean locked "true, if gear is locked";
    Boolean ideal "true, if losses are neglected";
    constant Integer Unknown=3 "Value of mode is not known";
    constant Integer Free=2 "Element is not active";
    constant Integer Forward=1 "w_a > 0 (forward rolling)";
    constant Integer Stuck=0 "w_a = 0 (forward rolling, locked or backward rolling)";
    constant Integer Backward=-1 "w_a < 0 (backward rolling)";
    Integer mode(final min=Backward, final max=Unknown, start=Free, fixed=true);
    annotation(Documentation(info="<HTML>
<p>
This component models the gear ratio and the <b>losses</b> of
a standard gear box in a <b>reliable</b> way including the stuck phases
that may occur at zero speed. The gear boxes that can
be handeled are fixed in the ground, have one input and one
output shaft, and are essentially described by the equations:
</p>
<pre>     flange_a.phi  = i*flange_b.phi
   (-flange_b.tau) = i*(eta_mf*flange_a.tau - tau_bf)
</pre>
<p>
where
</p>
<ul>
<li><b>i</b> is the constant <b>gear ratio</b>,</li>
<li><b>eta_mf</b> = eta_mf(w) is the <b>mesh efficiency</b> due to the
   friction between the teeth of the gear wheels, </li>
<li><b>tau_bf</b> = tau_bf(w) is the <b>bearing friction torque</b>, and</li>
<li><b>w_a</b> = der(flange_a.phi) is the speed of flange_a</li>
</ul>
<p>The loss terms \"eta_mf\" and \"tau_bf\" are functions of the
<i>absolute value</i> of the input shaft speed w_a and of the energy
flow direction. They are defined by parameter <b>lossTable[:,5]
</b> where the columns of this table have the following
meaning:</p>
<p><table BORDER=1 CELLSPACING=0 CELLPADDING=2>
  <tbody>
    <tr>
      <td>|w_a|</td>
      <td>eta_mf1</td>
      <td>eta_mf2</td>
      <td>|tau_bf1|</td>
      <td>|tau_bf2|</td>
    </tr>
    <tr>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
    </tr>
    <tr>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
      <td align=\"center\">...</td>
    </tr>
  </tbody>
</table></p>
<p>with</p>
<p><table BORDER=1 CELLSPACING=0 CELLPADDING=2>
  <tbody>
    <tr>
      <td>|w_a|</td>
      <td>Absolute value of angular velocity of input shaft flange_a</td>
    </tr>
    <tr>
      <td>eta_mf1</td>
      <td>Mesh efficiency in case of input shaft driving</td>
    </tr>
    <tr>
      <td>eta_mf2</td>
      <td>Mesh efficiency in case of output shaft driving</td>
    </tr>
    <tr>
      <td>|tau_bf1|</td>
      <td>Absolute bearing friction torque in case of input shaft driving</td>
    </tr>
    <tr>
      <td>|tau_bf2|</td>
      <td>Absolute bearing friction torque in case of output shaft driving</td>
    </tr>
  </tbody>
</table></p>
<p>
With these variables, the mesh efficiency and the bearing friction
are formally defined as:
</p>
<pre>  <b>if</b> flange_a.tau*w_a > 0 <b>or</b> flange_a.tau==0 <b>and</b> w_a > 0 <b>then</b>
     eta_mf := eta_mf1
     tau_bf := tau_bf1
  <b>elseif</b> flange_a.tau*w_a &lt; 0 <b>or</b> flange_a.tau==0 <b>and</b> w_a &lt; 0 <b>then</b>
     eta_mf := 1/eta_mf2
     tau_bf := tau_bf2
  <b>else</b> // w_a == 0
     eta_mf and tau_bf are computed such that <b>der</b>(w_a) = 0
  <b>end if</b>;
</pre>
<p>Note, that the losses are modeled in a physically meaningful way taking
into account that at zero speed the movement may be locked due
to the friction in the gear teeth and/or in the bearings.
Due to this important property, this component can be used in
situations where the combination of the components
Modelica.Mechanics.Rotational.IdealGear and
Modelica.Mechanics.Rotational.GearEfficiency will fail because,
e.g., chattering occurs when using the
Modelica.Mechanics.Rotational.GearEfficiency model.
</p>
<p>
<b>Acknowledgement:</b> The essential idea to model efficiency
in this way is from Christoph Pelchen, ZF Friedrichshafen.
</p>
<p><b>For detailed information:</b></p>
<p>Pelchen C.,
<a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Schweiger C.</a>,
and <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Otter M.</a>:
&quot;<a href=\"http://www.modelica.org/Conference2002/papers/p33_Pelchen.pdf\">Modeling
and Simulating the Efficiency of Gearboxes and of Planetary Gearboxes</A>,&quot; in
<I>Proceedings of the 2nd International Modelica Conference, Oberpfaffenhofen, Germany,</I>
pp. 257-266, The Modelica Association and Institute of Robotics and Mechatronics,
Deutsches Zentrum f&uuml;r Luft- und Raumfahrt e. V., March 18-19, 2002.</p>
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-10},{-40,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{96,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Line(visible=true, points={{-94,-76},{-23,-76}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-4,-76},{-24,-71},{-24,-81},{-4,-76}}),Text(visible=true, fillColor={128,128,128}, extent={{19,-83},{87,-70}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{70,-20},{70,-70}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-20},{-20,20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,20},{-20,140}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,60},{40,100}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{20,-60},{40,60}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{40,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-20,70},{20,90}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-40,10}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-111,30},{-70,30},{-70,100},{-40,100},{-60,121},{-80,100},{-49,100},{-49,20},{-111,20},{-111,30}}),Line(visible=true, points={{-80,20},{-60,20}}),Line(visible=true, points={{-80,-20},{-60,-20}}),Line(visible=true, points={{-70,-20},{-70,-70}}),Line(visible=true, points={{70,-70},{-70,-70}}),Line(visible=true, points={{0,60},{0,-90}}),Line(visible=true, points={{-10,60},{10,60}}),Line(visible=true, points={{-10,100},{10,100}}),Line(visible=true, points={{60,20},{80,20}}),Line(visible=true, points={{60,-20},{80,-20}}),Line(visible=true, points={{70,-20},{70,-70}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,140},{150,180}}, textString="%name=%i", fontName="Arial")}));
  protected 
    function equal "Compare whether two Real matrices are identical"
      extends Modelica.Icons.Function;
      input Real A[:,:];
      input Real B[:,:];
      input Real eps=Modelica.Constants.eps "two numbers r1, r2 are identical if abs(r1-r2) <= eps";
      output Boolean result;
    algorithm 
      result:=false;
      if size(A, 1) == size(B, 1) and size(A, 2) == size(B, 2) then 
        result:=true;
        for i in 1:size(A, 1) loop
          for j in 1:size(A, 2) loop
            if abs(A[i,j] - B[i,j]) >= eps then 
              result:=false;
            end if;
          end for;
        end for;
      end if;
      annotation(Documentation(info="<HTML>
<p>
The function call
</p>
<pre>     equal(A1, A2);
</pre>
<p>
returns <b>true</b>, if the two Real matrices A1 and A2 have the
same dimensions and the same elements. Otherwise the function
returns <b>false</b>. Two elements r1 and r2 of A1 and A2 respectively
are checked on equality by the test 'eps >= abs(r1-r2)', where 'eps'
can be provided as third argument of the function (the default is
Modelica.Constants.eps).
</p>
</HTML>"));
    end equal;
  parameter SI.Torque unitTorque = 1;
  parameter SI.AngularAcceleration unitAcceleration = 1;
  equation 
    assert(abs(i) > 0, "Error in initialization of LossyGear: i may not be zero");
    ideal=equal(lossTable, [0,1,1,0,0]);
    interpolation_result=if ideal then [1,1,0,0] else Modelica.Math.tempInterpol2(noEvent(abs(w_a)), lossTable, {2,3,4,5});
    eta_mf1=interpolation_result[1,1];
    eta_mf2=interpolation_result[1,2];
    tau_bf1=noEvent(abs(interpolation_result[1,3]));
    tau_bf2=noEvent(abs(interpolation_result[1,4]));
    phi_a=i*phi_b;
    0=flange_b.tau + i*(flange_a.tau - tauLoss);
    w_a=der(phi_a);
    a_a=der(w_a);
    quadrant1=(1 - eta_mf1)*flange_a.tau + tau_bf1;
    quadrant2=(1 - 1/eta_mf2)*flange_a.tau + tau_bf2;
    quadrant4=(1 - 1/eta_mf2)*flange_a.tau - tau_bf2;
    quadrant3=(1 - eta_mf1)*flange_a.tau - tau_bf1;
    tau_aPos=ideal or flange_a.tau >= 0;
    tauLossMax=if tau_aPos then quadrant1 else quadrant2;
    tauLossMin=if tau_aPos then quadrant4 else quadrant3;
    startForward=pre(mode) == Stuck and sa > tauLossMax/unitTorque or initial() and w_a > 0;
    startBackward=pre(mode) == Stuck and sa < tauLossMin/unitTorque or initial() and w_a < 0;
    locked=not (ideal or pre(mode) == Forward or startForward or pre(mode) == Backward or startBackward);
    tauLoss=if ideal then 0 else if locked then sa*unitTorque else if startForward or pre(mode) == Forward then tauLossMax else tauLossMin;
    a_a=unitAcceleration*(if locked then 0 else sa - tauLoss/unitTorque);
    mode=if ideal then Free else if (pre(mode) == Forward or startForward) and w_a > 0 then Forward else if (pre(mode) == Backward or startBackward) and w_a < 0 then Backward else Stuck;
  end LossyGear;

  model GearEfficiency "Obsolete component (use model LossyGear instead)"
    extends Interfaces.TwoFlangesAndBearing;
    parameter Real eta(min=Modelica.Constants.small, max=1)=1 "Efficiency";
    SI.Angle phi;
    SI.Power power_a "Energy flowing into flange_a (= power)";
    Boolean driving_a "True, if energy is flowing INTO and not out of flange flange_a";
    annotation(obsolete="This model can get stuck due when the torque direction varies, use LossyGear instead.", Documentation(info="<html>
<p>
THIS COMPONENT IS <b>OBSOLETE</b> and should <b>no longer be used</b>. It is only
kept for <b>backward compatibility</b> purposes. Use model
Modelica.Mechanics.Rotational.LossyGear instead which implements
gear efficiency in a much more reliable way.
</p>
<p>
This component consists of two rigidly connected flanges flange_a and flange_b without
inertia where an <b>efficency</b> coefficient <b>eta</b> reduces the driven
torque as function of the driving torque depending on the direction
of the energy flow, i.e., energy is always lost. This can be seen as a
simple model of the Coulomb friction acting between the teeth of a
gearbox.
</p>
<p>
Note, that most gearbox manufacturers provide tables of the
efficiency of a gearbox as function of the angular velocity
(efficiency becomes zero, if the angular velocity is zero).
However, such a table is practically useless for simulation purposes,
because in gearboxes always two types of friction is present:
(1) Friction in the <b>bearings</b> and (2) friction between
the teeth of the gear. (1) leads to a velocity dependent, additive
loss-torque, whereas (2) leads to a torque-dependent reduction of the
driving torque. The gearbox manufacturers measure both effects
together and determine the gear efficiency from it, although for
simulation purposes the two effects need to be separated.
Assume for example that only constant bearing friction, i.e.,
bearingTorque=const., is present, i.e.,
</p>
<pre>
   (1)  loadTorque = motorTorque - sign(w)*bearingTorque
</pre>
<p>
Gearbox manufacturers use the loss-formula
</p>
<pre>
   (2)  loadTorque = eta*motorTorque
</pre>
<p>
Comparing (1) and (2) gives a formulat for the efficiency eta:
</p>
<pre>
   eta = (1 - sign(w)*bearingTorque/motorTorque)
</pre>
<p>
When the motorTorque becomes smaller as the bearingTorque,
(2) is useless, because the efficiency is zero. To summarize,
be careful to determine the gear <b>efficiency</b> of this element
from tables of the gear manufacturers.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-96,-21},{96,20}}),Line(visible=true, points={{-30,-40},{30,-40}}),Line(visible=true, points={{0,60},{0,40}}),Line(visible=true, points={{-30,40},{29,40}}),Line(visible=true, points={{0,-40},{0,-90}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-30,-20},{60,-20},{60,-80},{70,-80},{50,-100},{30,-80},{40,-80},{40,-30},{-30,-30},{-30,-20},{-30,-20}}),Text(visible=true, fillColor={128,128,128}, extent={{16,70},{84,83}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{12,76},{-8,81},{-8,71},{12,76}}),Line(visible=true, points={{-78,76},{-7,76}}, color={128,128,128}),Line(visible=true, points={{30,-50},{20,-60}}),Line(visible=true, points={{30,-40},{10,-60}}),Line(visible=true, points={{20,-40},{0,-60}}),Line(visible=true, points={{10,-40},{-10,-60}}),Line(visible=true, points={{0,-40},{-20,-60}}),Line(visible=true, points={{-10,-40},{-30,-60}}),Line(visible=true, points={{-20,-40},{-30,-50}})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-40},{30,-40}}),Line(visible=true, points={{0,-40},{0,-90}}),Polygon(visible=true, lineColor={255,0,0}, fillColor={255,0,0}, fillPattern=FillPattern.Solid, points={{-30,-20},{60,-20},{60,-80},{70,-80},{50,-100},{30,-80},{40,-80},{40,-30},{-30,-30},{-30,-20},{-30,-20}}),Text(visible=true, extent={{-150,20},{150,60}}, textString="eta=%eta", fontName="Arial"),Line(visible=true, points={{30,-50},{20,-60}}),Line(visible=true, points={{30,-40},{10,-60}}),Line(visible=true, points={{20,-40},{0,-60}}),Line(visible=true, points={{10,-40},{-10,-60}}),Line(visible=true, points={{0,-40},{-20,-60}}),Line(visible=true, points={{-10,-40},{-30,-60}}),Line(visible=true, points={{-20,-40},{-30,-50}})}));
  equation 
    phi=phi_a;
    phi=phi_b;
    power_a=flange_a.tau*der(phi);
    driving_a=power_a >= 0;
    flange_b.tau=-(if driving_a then eta*flange_a.tau else flange_a.tau/eta);
  end GearEfficiency;

  model Gear "Realistic model of a gearbox"
    extends Interfaces.TwoFlangesAndBearingH;
    parameter Real ratio=1 "transmission ratio (flange_a.phi/flange_b.phi)";
    parameter Real eta(min=Modelica.Constants.small, max=1)=1 "Gear efficiency";
    parameter Real friction_pos[:,:]=[0,1] "[w,tau] positive sliding friction characteristic (w>=0)";
    parameter Real peak(final min=1)=1 "peak*friction_pos[1,2] = maximum friction torque at zero velocity";
    parameter Real c(final unit="N.m/rad", final min=Modelica.Constants.small)=100000.0 "Gear elasticity (spring constant)";
    parameter Real d(final unit="N.m.s/rad", final min=0)=0 "(relative) gear damping";
    parameter SI.Angle b(final min=0)=0 "Total backlash";
    annotation(Documentation(info="<html>
<p>
This component models the essential effects of a gearbox, in particular
gear <b>efficiency</b> due to friction between the teeth, <b>bearing friction</b>,
gear <b>elasticity</b> and <b>damping</b>, <b>backlash</b>.
The inertia of the gear wheels is not modeled. If necessary, inertia
has to be taken into account by connecting components of model Inertia
to the left and/or the right flange.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={128,128,128}, extent={{2,22},{46,29}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{4,25},{-4,27},{-4,23},{4,25}}),Line(visible=true, points={{-36,25},{-3,25}}, color={128,128,128})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-60},{40,60}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-60,-80},{-46,-80},{-20,-20},{20,-20},{46,-80},{60,-80},{60,-90},{-60,-90},{-60,-80}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-60,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{60,-10},{100,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-60,10},{-60,20},{-40,40},{-40,-40},{-60,-20},{-60,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{60,20},{40,40},{40,-40},{60,-20},{60,20}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,70},{150,110}}, textString="%name=%ratio", fontName="Arial"),Text(visible=true, extent={{-150,-160},{150,-120}}, textString="c=%c", fontName="Arial")}));
    IdealGear gearRatio(final ratio=ratio) annotation(Placement(visible=true, transformation(origin={-60,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    GearEfficiency gearEfficiency(final eta=eta) annotation(Placement(visible=true, transformation(origin={-20,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    ElastoBacklash elastoBacklash(final b=b, final c=c, final phi_rel0=0, final d=d) annotation(Placement(visible=true, transformation(origin={60,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    BearingFriction bearingFriction(final tau_pos=friction_pos, final peak=peak) annotation(Placement(visible=true, transformation(origin={20,0}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    connect(elastoBacklash.flange_b,flange_b) annotation(Line(visible=true, origin={85,0}, points={{-15,0},{15,0}}));
    connect(flange_a,gearRatio.flange_a) annotation(Line(visible=true, origin={-85,0}, points={{-15,0},{15,0}}));
    connect(bearingFriction.bearing,adapter.flange_b) annotation(Line(visible=true, points={{20,-10},{20,-40},{6.12303e-16,-40},{0,-70}}));
    connect(gearEfficiency.bearing,adapter.flange_b) annotation(Line(visible=true, points={{-20,-10},{-20,-40},{6.12303e-16,-40},{0,-70}}));
    connect(gearRatio.bearing,adapter.flange_b) annotation(Line(visible=true, points={{-60,-10},{-60,-40},{6.12303e-16,-40},{0,-70}}));
    connect(bearingFriction.flange_b,elastoBacklash.flange_a) annotation(Line(visible=true, points={{30,0},{50,0}}));
    connect(gearEfficiency.flange_b,bearingFriction.flange_a) annotation(Line(visible=true, points={{-10,0},{10,0}}));
    connect(gearRatio.flange_b,gearEfficiency.flange_a) annotation(Line(visible=true, points={{-50,0},{-30,0}}));
  end Gear;

  model Gear2 "Realistic model of a gearbox (based on LossyGear)"
    extends Interfaces.TwoFlangesAndBearingH;
    parameter Real i=1 "transmission ratio (flange_a.phi/flange_b.phi)";
    parameter Real lossTable[:,5]=[0,1,1,0,0] "Array for mesh efficiencies and bearing friction depending on speed (see docu of LossyGear)";
    parameter Real c(final unit="N.m/rad", final min=Modelica.Constants.small)=100000.0 "Gear elasticity (spring constant)";
    parameter Real d(final unit="N.m.s/rad", final min=0)=0 "(relative) gear damping";
    parameter SI.Angle b(final min=0)=0 "Total backlash";
    annotation(Documentation(info="<html>
<p>This component models the essential effects of a gearbox, in
particular</p>
<ul>
  <li>in component <b>lossyGear</b></li>
    <ul>
      <li>gear <b>efficiency</b> due to friction between the teeth</li>
      <li><b>bearing friction</b></li>
    </ul>
  <li>in component <b>elastoBacklash</b></li>
    <ul>
      <li>gear <b>elasticity</b></li>
      <li><b>damping</b></li>
      <li><b>backlash</b></li>
    </ul>
</ul>
<p>The inertia of the gear wheels is not modeled. If necessary,
inertia has to be taken into account by connecting components of
model Inertia to the left and/or the right flange of component
GearNew.</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={128,128,128}, extent={{2,57},{46,64}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{4,60},{-4,62},{-4,58},{4,60}}),Line(visible=true, points={{-36,60},{-3,60}}, color={128,128,128})}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-10},{-60,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{60,-10},{100,10}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-60},{40,60}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-60,10},{-60,20},{-40,40},{-40,-40},{-60,-20},{-60,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{60,20},{40,40},{40,-40},{60,-20},{60,20}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,70},{150,110}}, textString="%name=%i", fontName="Arial"),Text(visible=true, extent={{-150,-160},{150,-120}}, textString="c=%c", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-60,-80},{-46,-80},{-20,-20},{20,-20},{46,-80},{60,-80},{60,-90},{-60,-90},{-60,-80}})}));
    LossyGear lossyGear(final i=i, final lossTable=lossTable) annotation(Placement(visible=true, transformation(origin={-40,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    ElastoBacklash elastoBacklash(final b=b, final c=c, final phi_rel0=0, final d=d) annotation(Placement(visible=true, transformation(origin={40,0}, extent={{-20,-20},{20,20}}, rotation=0)));
  equation 
    connect(elastoBacklash.flange_b,flange_b) annotation(Line(visible=true, origin={80,0}, points={{-20,0},{20,0}}));
    connect(flange_a,lossyGear.flange_a) annotation(Line(visible=true, origin={-80,0}, points={{-20,0},{20,0}}));
    connect(lossyGear.bearing,adapter.flange_b) annotation(Line(visible=true, points={{-40,-20},{-40,-40},{6.12303e-16,-40},{0,-70}}));
    connect(lossyGear.flange_b,elastoBacklash.flange_a) annotation(Line(visible=true, points={{-20,0},{20,0}}));
  end Gear2;

  model Position "Forced movement of a flange according to a reference angle signal"
    parameter Boolean exact=false "true/false exact treatment/filtering the input signal";
    parameter SI.Frequency f_crit=50 "if exact=false, critical frequency of filter to filter input signal" annotation(Dialog(enable=not exact));
    output SI.Angle phi "absolute rotation angle of flange flange_b";
    output SI.AngularVelocity w "absolute angular velocity of flange flange_b";
    output SI.AngularAcceleration a "absolute angular acceleration of flange flange_b";
    SI.Torque tau_support "Support torque";
    annotation(Documentation(info="<HTML>
<p>
The input signal <b>phi_ref</b> defines the <b>reference
angle</b> in [rad]. Flange <b>flange_b</b> is <b>forced</b>
to move according to this reference motion. According to parameter
<b>exact</b> (default = <b>false</b>), this is done in the following way:
<ol>
<li><b>exact=true</b><br>
    The reference angle is treated <b>exactly</b>. This is only possible, if
    the input signal is defined by an analytical function which can be
    differentiated at least twice. If this prerequisite is fulfilled,
    the Modelica translator will differentiate the input signal twice
    in order to compute the reference acceleration of the flange.</li>
<li><b>exact=false</b><br>
    The reference angle is <b>filtered</b> and the second derivative
    of the filtered curve is used to compute the reference acceleration
    of the flange. This second derivative is <b>not</b> computed by
    numerical differentiation but by an appropriate realization of the
    filter. For filtering, a second order Bessel filter is used.
    The critical frequency (also called cut-off frequency) of the
    filter is defined via parameter <b>f_crit</b> in [Hz]. This value
    should be selected in such a way that it is higher as the essential
    low frequencies in the signal.</li>
</ol>
<p>
The input signal can be provided from one of the signal generator
blocks of the block library Modelica.Blocks.Sources.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Line(visible=true, points={{-80,80},{-10,80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,80},{-10,85},{-10,75},{10,80}}),Text(visible=true, fillColor={128,128,128}, extent={{50,73},{50,87}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Text(visible=true, extent={{-172,-90},{-56,-56}}, textString="phi_ref", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial")}));
    Modelica.Blocks.Interfaces.RealInput phi_ref(redeclare type SignalType= SI.Angle ) "reference angle of flange_b as input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    parameter Real w_crit=2*Modelica.Constants.pi*f_crit "critical frequency in [1/s]";
    constant Real af=1.3617 "s coefficient of Bessel filter";
    constant Real bf=0.618 "s*s coefficient of Bessel filter";
  equation 
    0=flange_b.tau + tau_support;
    if cardinality(bearing) == 0 then
      bearing.phi=0;
    else
      bearing.tau=tau_support;
    end if;
    phi=flange_b.phi;
    w=der(phi);
    a=der(w);
    if exact then
      phi=phi_ref;
    else
      a=((phi_ref - phi)*w_crit - af*w)*w_crit/bf;
    end if;
  initial equation 
    if not exact then
      phi=phi_ref;
    end if;
  end Position;

  model Speed "Forced movement of a flange according to a reference angular velocity signal"
    parameter Boolean exact=false "true/false exact treatment/filtering the input signal";
    parameter SI.Frequency f_crit=50 "if exact=false, critical frequency of filter to filter input signal";
    SI.Angle phi_ref "reference angle defined by time integration of input signal";
    SI.Angle phi "absolute rotation angle of flange flange_b";
    SI.AngularVelocity w "absolute angular velocity of flange flange_b";
    SI.AngularAcceleration a "absolute angular acceleration of flange flange_b";
    SI.Torque tau_support "Support torque";
    annotation(Documentation(info="<HTML>
<p>
The input signal <b>w_ref</b> defines the <b>reference
angle</b> in [rad]. Flange <b>flange_b</b> is <b>forced</b>
to move according to this reference motion. According to parameter
<b>exact</b> (default = <b>false</b>), this is done in the following way:
<ol>
<li><b>exact=true</b><br>
    The reference angle is treated <b>exactly</b>. This is only possible, if
    the input signal is defined by an analytical function which can be
    differentiated at least twice. If this prerequisite is fulfilled,
    the Modelica translator will differentiate the input signal twice
    in order to compute the reference acceleration of the flange.</li>
<li><b>exact=false</b><br>
    The reference angle is <b>filtered</b> and the second derivative
    of the filtered curve is used to compute the reference acceleration
    of the flange. This second derivative is <b>not</b> computed by
    numerical differentiation but by an appropriate realization of the
    filter. For filtering, a second order Bessel filter is used.
    The critical frequency (also called cut-off frequency) of the
    filter is defined via parameter <b>f_crit</b> in [Hz]. This value
    should be selected in such a way that it is higher as the essential
    low frequencies in the signal.</li>
</ol>
<p>
The input signal can be provided from one of the signal generator
blocks of the block library Modelica.Blocks.Sources.
</p>
<p><b>Release Notes:</b></p>
<ul>
<li><i>October 27, 2003</i>
       by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>.<br>
       Realized based on component <tt>Position</tt> (implemented by
       <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>).</li>
</ul>
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{30,-42},{20,-52}}),Text(visible=true, extent={{-158,-78},{-54,-44}}, textString="w_ref", fontName="Arial"),Text(visible=true, extent={{0,60},{0,120}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Line(visible=true, points={{-80,80},{-10,80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,80},{-10,85},{-10,75},{10,80}}),Text(visible=true, fillColor={128,128,128}, extent={{50,73},{50,87}}, textString="rotation axis", fontName="Arial")}));
    Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Blocks.Interfaces.RealInput w_ref(redeclare type SignalType= SI.AngularVelocity ) "Reference angular velocity of flange_b as input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    parameter Real w_crit=2*Constants.pi*f_crit "critical frequency in [1/s]";
  equation 
    0=flange_b.tau + tau_support;
    if cardinality(bearing) == 0 then
      bearing.phi=0;
    else
      bearing.tau=tau_support;
    end if;
    der(phi_ref)=w_ref;
    phi=flange_b.phi;
    w=der(phi);
    a=der(w);
    if exact then
      w=w_ref;
    else
      a=(w_ref - w)*w_crit;
    end if;
  initial equation 
    if not exact then
      w=w_ref;
    end if;
  end Speed;

  model Accelerate "Forced movement of a flange according to an acceleration signal"
    parameter SI.Angle phi_start=0 "Start angle";
    parameter SI.AngularVelocity w_start=0 "Start angular velocity";
    SI.Angle phi(final start=phi_start, final fixed=true) "absolute rotation angle of flange flange_b";
    SI.AngularVelocity w(final start=w_start, final fixed=true) "absolute angular velocity of flange flange_b";
    SI.Torque tau_support "Support torque";
    annotation(Documentation(info="<html>
<p>
The input signal <b>a</b> defines an <b>angular acceleration</b>
in [rad/s2]. Flange <b>flange_b</b> is <b>forced</b> to move with
this acceleration. The angular velocity <b>w</b> and the rotation angle
<b>phi</b> of the flange are automatically determined by integration of
the acceleration.
</p>
<p>
The input signal can be provided from one of the signal generator
blocks of the block library Modelica.Blocks.Sources.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Line(visible=true, points={{-80,80},{-10,80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,80},{-10,85},{-10,75},{10,80}}),Text(visible=true, fillColor={128,128,128}, extent={{50,73},{50,87}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Text(visible=true, extent={{-144,-86},{-84,-48}}, textString="a", fontName="Arial"),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial")}));
    Interfaces.Flange_b flange_b annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Blocks.Interfaces.RealInput a(redeclare type SignalType= SI.AngularAcceleration ) "absolute angular acceleration of flange_b as input signal" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    0=flange_b.tau + tau_support;
    if cardinality(bearing) == 0 then
      bearing.phi=0;
    else
      bearing.tau=tau_support;
    end if;
    phi=flange_b.phi;
    w=der(phi);
    a=der(w);
  end Accelerate;

  model Move "Forced movement of a flange according to an angle, speed and angular acceleration signal"
    SI.Angle phi "absolute rotation angle of flange flange_b";
    SI.AngularVelocity w "absolute angular velocity of flange flange_b";
    SI.AngularAcceleration a "absolute angular acceleration of flange flange_b";
    SI.Torque tau_support "Support torque";
    annotation(Documentation(info="<html>
<p>
Flange <b>flange_b</b> is <b>forced</b> to move with a predefined motion
according to the input signals:
</p>
<pre>
    u[1]: angle of flange
    u[2]: angular velocity of flange
    u[3]: angular acceleration of flange
</pre>
<p>
The user has to guarantee that the input signals are consistent to each other,
i.e., that u[2] is the derivative of u[1] and that
u[3] is the derivative of u[2]. There are, however,
also applications where by purpose these conditions do not hold. For example,
if only the position dependent terms of a mechanical system shall be
calculated, one may provide angle = angle(t) and set the angular velocity
and the angular acceleration to zero.
</p>
<p>
The input signals can be provided from one of the signal generator
blocks of the block library Modelica.Blocks.Sources.
</p>
 
</html>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Text(visible=true, fillColor={128,128,128}, extent={{50,73},{50,87}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,80},{-10,85},{-10,75},{10,80}}),Line(visible=true, points={{-80,80},{-10,80}}, color={128,128,128}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Text(visible=true, extent={{-100,40},{-100,80}}, textString="phi,w,a", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}}),Text(visible=true, extent={{-80,-100},{-80,-60}}, textString="phi,w,a", fontName="Arial"),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-20},{100,20}}),Line(visible=true, points={{-30,-32},{30,-32}}),Line(visible=true, points={{0,52},{0,32}}),Line(visible=true, points={{-29,32},{30,32}}),Line(visible=true, points={{0,-32},{0,-90}}),Line(visible=true, points={{30,-42},{20,-52}}),Line(visible=true, points={{30,-32},{10,-52}}),Line(visible=true, points={{20,-32},{0,-52}}),Line(visible=true, points={{10,-32},{-10,-52}}),Line(visible=true, points={{0,-32},{-20,-52}}),Line(visible=true, points={{-10,-32},{-30,-52}}),Line(visible=true, points={{-20,-32},{-30,-42}}),Text(visible=true, extent={{-150,60},{150,100}}, textString="%name", fontName="Arial")}));
    Modelica.Blocks.Interfaces.RealInput u[3] "angle, angular velocity and angular acceleration of flange_b as input signals" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.Flange_b flange_b "Flange that is forced to move according to input signals u" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Flange_a bearing "Bearing flange (if not connected, it is assumed that it is fixed on ground)" annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  protected 
    function position
      input Real q_qd_qdd[3] "Required values for position, speed, acceleration";
      input Real dummy "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
      output Real q;
      annotation(derivative(noDerivative=q_qd_qdd)=position_der, InlineAfterIndexReduction=true);
    algorithm 
      q:=q_qd_qdd[1];
    end position;

    function position_der
      input Real q_qd_qdd[3] "Required values for position, speed, acceleration";
      input Real dummy "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
      input Real dummy_der;
      output Real qd;
      annotation(derivative(noDerivative=q_qd_qdd)=position_der2, InlineAfterIndexReduction=true);
    algorithm 
      qd:=q_qd_qdd[2];
    end position_der;

    function position_der2
      input Real q_qd_qdd[3] "Required values for position, speed, acceleration";
      input Real dummy "Just to have one input signal that should be differentiated to avoid possible problems in the Modelica tool (is not used)";
      input Real dummy_der;
      input Real dummy_der2;
      output Real qdd;
    algorithm 
      qdd:=q_qd_qdd[3];
    end position_der2;

  equation 
    0=flange_b.tau + tau_support;
    if cardinality(bearing) == 0 then
      bearing.phi=0;
    else
      bearing.tau=tau_support;
    end if;
    phi=flange_b.phi;
    phi=position(u, time);
    w=der(phi);
    a=der(w);
  end Move;

  model Fixed "Flange fixed in housing at a given angle"
    parameter SI.Angle phi0=0 "Fixed offset angle of housing";
    annotation(Documentation(info="<html>
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
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-40},{80,-40}}),Line(visible=true, points={{80,-40},{40,-80}}),Line(visible=true, points={{40,-40},{0,-80}}),Line(visible=true, points={{0,-40},{-40,-80}}),Line(visible=true, points={{-40,-40},{-80,-80}}),Line(visible=true, points={{0,-40},{0,-4}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{8,46},{-12,51},{-12,41},{8,46}}),Line(visible=true, points={{-82,46},{-11,46}}, color={128,128,128}),Text(visible=true, fillColor={128,128,128}, extent={{12,40},{80,53}}, textString="rotation axis", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-130},{150,-90}}, textString="%name=%phi0", fontName="Arial"),Line(visible=true, points={{-80,-40},{80,-40}}),Line(visible=true, points={{80,-40},{40,-80}}),Line(visible=true, points={{40,-40},{0,-80}}),Line(visible=true, points={{0,-40},{-40,-80}}),Line(visible=true, points={{-40,-40},{-80,-80}}),Line(visible=true, points={{0,-40},{0,-10}})}));
    Interfaces.Flange_b flange_b "(right) flange fixed in housing" annotation(Placement(visible=true, transformation(origin={0,0}, extent={{10,-10},{-10,10}}, rotation=0), iconTransformation(origin={0,0}, extent={{10,-10},{-10,10}}, rotation=0)));
  equation 
    flange_b.phi=phi0;
  end Fixed;

  model Torque "Input signal acting as external torque on a flange"
    annotation(Documentation(info="<HTML>
<p>
The input signal <b>tau</b> defines an external
torque in [Nm] which acts (with negative sign) at
a flange connector, i.e., the component connected to this
flange is driven by torque <b>tau</b>.</p>
<p>
The input signal can be provided from one of the signal generator
blocks of Modelica.Blocks.Sources.
</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,70},{150,110}}, textString="%name", fontName="Arial"),Text(visible=true, extent={{-141,-70},{-62,-29}}, textString="tau", fontName="Arial"),Line(visible=true, points={{-88,0},{-64,30},{-36,52},{-2,62},{28,56},{48,44},{64,28},{76,14},{86,0}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{86,0},{66,58},{37,27},{86,0}}),Rectangle(visible=true, lineColor={192,192,192}, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-20,-120},{20,-80}}),Line(visible=true, points={{-30,-30},{30,-30}}),Line(visible=true, points={{0,-30},{0,-90}}),Line(visible=true, points={{-30,-50},{-10,-30}}),Line(visible=true, points={{-10,-50},{10,-30}}),Line(visible=true, points={{10,-50},{30,-30}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={128,128,128}, extent={{14,73},{82,86}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{10,80},{-10,85},{-10,75},{10,80}}),Line(visible=true, points={{-80,80},{-9,80}}, color={128,128,128}),Line(visible=true, points={{-88,0},{-64,30},{-36,52},{-2,62},{28,56},{48,44},{64,28},{76,14},{80,10}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{86,0},{66,58},{38,28},{86,0}})}));
    Modelica.Blocks.Interfaces.RealInput tau(redeclare type SignalType= SI.Torque ) "Torque driving the flange (a positive value accelerates the flange)" annotation(Placement(visible=true, transformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0), iconTransformation(origin={-120,0}, extent={{-20,-20},{20,20}}, rotation=0)));
    Interfaces.Flange_b flange_b "(Right) flange" annotation(Placement(visible=true, transformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={100,0}, extent={{-10,-10},{10,10}}, rotation=0)));
    Interfaces.Flange_a bearing annotation(Placement(visible=true, transformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0), iconTransformation(origin={0,-100}, extent={{-10,-10},{10,10}}, rotation=0)));
  equation 
    flange_b.tau=-tau;
    if cardinality(bearing) == 0 then
      bearing.phi=0;
    else
      bearing.tau=tau;
    end if;
  end Torque;

  model Torque2 "Input signal acting as torque on two flanges"
    extends Interfaces.TwoFlanges;
    annotation(Documentation(info="<HTML>
<p>
The input signal <b>tau</b> defines an external
torque in [Nm] which acts at both flange connectors,
i.e., the components connected to these flanges are driven by torque <b>tau</b>.</p>
<p>The input signal can be provided from one of the signal generator
blocks of Modelica.Blocks.Sources.</p>
 
</HTML>
"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-80},{150,-40}}, textString="%name", fontName="Arial"),Polygon(visible=true, fillPattern=FillPattern.Solid, lineThickness=0.5, points={{-78,24},{-69,17},{-89,0},{-78,24}}),Line(visible=true, points={{-74,20},{-70,23},{-65,26},{-60,28},{-56,29},{-50,30},{-41,30},{-35,29},{-31,28},{-26,26},{-21,23},{-17,20},{-13,15},{-10,9}}, thickness=0.5, smooth=Smooth.Bezier),Line(visible=true, points={{74,20},{70,23},{65,26},{60,28},{56,29},{50,30},{41,30},{35,29},{31,28},{26,26},{21,23},{17,20},{13,15},{10,9}}, thickness=0.5),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{89,0},{78,24},{69,17},{89,0}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={128,128,128}, extent={{15,-84},{83,-71}}, textString="rotation axis", fontName="Arial"),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{11,-77},{-9,-72},{-9,-82},{11,-77}}),Line(visible=true, points={{-79,-77},{-8,-77}}, color={128,128,128}),Line(visible=true, points={{-75,20},{-71,23},{-66,26},{-61,28},{-57,29},{-51,30},{-42,30},{-36,29},{-32,28},{-27,26},{-22,23},{-18,20},{-14,15},{-11,9}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, fillPattern=FillPattern.Solid, lineThickness=0.5, points={{-79,24},{-70,17},{-90,0},{-79,24}}),Line(visible=true, points={{73,20},{69,23},{64,26},{59,28},{55,29},{49,30},{40,30},{34,29},{30,28},{25,26},{20,23},{16,20},{12,15},{9,9}}, thickness=0.5, smooth=Smooth.Bezier),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{88,0},{77,24},{68,17},{88,0}})}));
    Modelica.Blocks.Interfaces.RealInput tau(redeclare type SignalType= SI.Torque ) "Torque driving the two flanges (a positive value accelerates the flange)" annotation(Placement(visible=true, transformation(origin={0,40}, extent={{-20,-20},{20,20}}, rotation=-90), iconTransformation(origin={0,40}, extent={{-20,-20},{20,20}}, rotation=-90)));
  equation 
    flange_a.tau=tau;
    flange_b.tau=-tau;
  end Torque2;

  model LinearSpeedDependentTorque "Linear dependency of torque versus speed"
    extends Modelica.Mechanics.Rotational.Interfaces.PartialSpeedDependentTorque;
    parameter Modelica.SIunits.Torque tau_nominal "nominal torque (if negative, torque is acting as load)";
    parameter Boolean TorqueDirection=true "same direction of torque in both directions of rotation";
    parameter Modelica.SIunits.AngularVelocity w_nominal(min=Modelica.Constants.eps) "nominal speed";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-100},{100,100}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of torque, linearly dependent on angular velocity of flange.<br>
Parameter TorqueDirection chooses whether direction of torque is the same in both directions of rotation or not.
</p>
</HTML>"));
  equation 
    if TorqueDirection then
      tau=-tau_nominal*abs(w/w_nominal);
    else
      tau=-tau_nominal*w/w_nominal;
    end if;
  end LinearSpeedDependentTorque;

  model QuadraticSpeedDependentTorque "Quadratic dependency of torque versus speed"
    extends Modelica.Mechanics.Rotational.Interfaces.PartialSpeedDependentTorque;
    parameter Modelica.SIunits.Torque tau_nominal "nominal torque (if negative, torque is acting as load)";
    parameter Boolean TorqueDirection=true "same direction of torque in both directions of rotation";
    parameter Modelica.SIunits.AngularVelocity w_nominal(min=Modelica.Constants.eps) "nominal speed";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100,-100},{-80,-98},{-60,-92},{-40,-82},{-20,-68},{0,-50},{20,-28},{40,-2},{60,28},{80,62},{100,100}}, color={0,0,255}, smooth=Smooth.Bezier)}), Documentation(info="<HTML>
<p>
Model of torque, quadratic dependent on angular velocity of flange.<br>
Parameter TorqueDirection chooses whether direction of torque is the same in both directions of rotation or not.
</p>
</HTML>"));
  equation 
    if TorqueDirection then
      tau=-tau_nominal*(w/w_nominal)^2;
    else
      tau=-tau_nominal*smooth(1, if w >= 0 then (w/w_nominal)^2 else -(w/w_nominal)^2);
    end if;
  end QuadraticSpeedDependentTorque;

  model ConstantTorque "Constant torque, not dependent on speed"
    extends Modelica.Mechanics.Rotational.Interfaces.PartialSpeedDependentTorque;
    parameter Modelica.SIunits.Torque tau_constant "constant torque (if negative, torque is acting as load)";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-98,0},{100,0}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of constant torque, not dependent on angular velocity of flange.<br>
Positive torque acts accelerating.
</p>
</HTML>"));
  equation 
    tau=-tau_constant;
  end ConstantTorque;

  model ConstantSpeed "Constant speed, not dependent on torque"
    extends Modelica.Mechanics.Rotational.Interfaces.PartialSpeedDependentTorque;
    parameter Modelica.SIunits.AngularVelocity w_fixed "fixed speed (if negative, torque is acting as load)";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0,-100},{0,100}}, color={0,0,255})}), Documentation(info="<HTML>
<p>
Model of <b>fixed</b> angular verlocity of flange, not dependent on torque.
</p>
</HTML>"));
  equation 
    w=w_fixed;
  end ConstantSpeed;

  model TorqueStep "Constant torque, not dependent on speed"
    extends Modelica.Mechanics.Rotational.Interfaces.PartialSpeedDependentTorque;
    parameter Modelica.SIunits.Torque stepTorque=1 "height of torque step (if negative, torque is acting as load)";
    parameter Modelica.SIunits.Torque offsetTorque=0 "offset of torque";
    parameter Modelica.SIunits.Time startTime=0 "output = offset for time < startTime";
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80,-60},{0,-60},{0,60},{80,60}}, color={0,0,255}),Text(visible=true, fillColor={0,0,255}, extent={{0,-60},{100,-40}}, textString="time", fontName="Arial")}), Documentation(info="<HTML>
<p>
Model of a torque step at time .<br>
Positive torque acts accelerating.
</p>
</HTML>"));
  equation 
    tau=(-offsetTorque) - (if time < startTime then 0 else stepTorque);
  end TorqueStep;

  model RelativeStates "Definition of relative state variables"
    extends Interfaces.TwoFlanges;
    SI.Angle phi_rel(stateSelect=StateSelect.prefer) "relative rotation angle used as state variable";
    SI.AngularVelocity w_rel(stateSelect=StateSelect.prefer) "relative angular velocity used as state variable";
    SI.AngularAcceleration a_rel "relative angular acceleration";
    annotation(Documentation(info="<html>
<p>
Usually, the absolute angle and the absolute angular velocity of
Modelica.Mechanics.Rotational.Inertia models are used as state variables.
In some circumstances, relative quantities are better suited, e.g.,
because it may be easier to supply initial values.
In such cases, model <b>RelativeStates</b> allows the definition of state variables
in the following way:
</p>
<ul>
<li> Connect an instance of this model between two flange connectors.</li>
<li> The <b>relative rotation angle</b> and the <b>relative angular velocity</b>
     between the two connectors are used as <b>state variables</b>.
</ul>
<p>
An example is given in the next figure
</p>
<IMG SRC=\"../Images/relativeStates.png\" ALT=\"relativeStates\">
<p>
Here, the relative angle and the relative angular velocity between
the two inertias are used as state variables. Additionally, the
simulator selects either the absolute angle and absolute angular
velocity of model inertia1 or of model inertia2 as state variables.
</p>
 
</HTML>
"), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,255,255}, fillColor={0,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,-40},{40,40}}, textString="S", fontName="Arial"),Line(visible=true, points={{40,0},{96,0}}, pattern=LinePattern.Dash),Line(visible=true, points={{-100,-10},{-100,-80}}, color={160,160,160}),Line(visible=true, points={{100,-10},{100,-80}}, color={160,160,160}),Polygon(visible=true, lineColor={160,160,160}, fillColor={160,160,160}, fillPattern=FillPattern.Solid, points={{80,-65},{80,-55},{100,-60},{80,-65}}),Line(visible=true, points={{-100,-60},{80,-60}}, color={160,160,160}),Text(visible=true, extent={{-30,-90},{30,-70}}, textString="w_rel", fontName="Arial"),Line(visible=true, points={{-76,80},{-5,80}}, color={128,128,128}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{14,80},{-6,85},{-6,75},{14,80}}),Text(visible=true, fillColor={128,128,128}, extent={{18,74},{86,87}}, textString="rotation axis", fontName="Arial"),Line(visible=true, points={{-96,0},{-40,0}}, pattern=LinePattern.Dash)}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, lineColor={0,255,255}, fillColor={0,255,255}, fillPattern=FillPattern.Solid, extent={{-40,-40},{40,40}}),Text(visible=true, extent={{-40,-40},{40,40}}, textString="S", fontName="Arial"),Line(visible=true, points={{-92,0},{-42,0}}, pattern=LinePattern.Dot),Line(visible=true, points={{40,0},{90,0}}, pattern=LinePattern.Dot),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-150,-80},{150,-40}}, textString="%name", fontName="Arial")}));
  equation 
    phi_rel=flange_b.phi - flange_a.phi;
    w_rel=der(phi_rel);
    a_rel=der(w_rel);
    flange_a.tau=0;
    flange_b.tau=0;
  end RelativeStates;

  package Types "Constants and types with choices, especially to build menus"
    extends Modelica.Icons.Library;
    annotation(preferedView="info", Documentation(info="<HTML>
<p>
In this package <b>types</b> and <b>constants</b> are defined that are used
in library Modelica.Blocks. The types have additional annotation choices
definitions that define the menus to be built up in the graphical
user interface when the type is used as parameter in a declaration.
</p>
</HTML>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    package Init "Type, constants and menu choices to define initialization of absolute rotational quantities"
      extends Modelica.Icons.Enumeration;
      constant Integer NoInit=1 "no initialization (phi_start, w_start are guess values)";
      constant Integer SteadyState=2 "steady state initialization (der(phi)=der(w)=0)";
      constant Integer InitialState=3 "initialization with phi_start, w_start";
      constant Integer InitialAngle=4 "initialization with phi_start";
      constant Integer InitialSpeed=5 "initialization with w_start";
      constant Integer InitialAcceleration=6 "initialization with a_start";
      constant Integer InitialAngleAcceleration=7 "initialization with phi_start, a_start";
      constant Integer InitialSpeedAcceleration=8 "initialization with w_start, a_start";
      constant Integer InitialAngleSpeedAcceleration=9 "initialization with phi_start, w_start, a_start";
      type Temp "Temporary type of absolute initialization with choices for menus (until enumerations are available)"
        extends Modelica.Icons.TypeInteger(min=1, max=9);
        annotation(Evaluate=true, choices(choice=Modelica.Mechanics.Rotational.Types.Init.NoInit "no initialization (phi_start, w_start are guess values)", choice=Modelica.Mechanics.Rotational.Types.Init.SteadyState "steady state initialization (der(phi)=der(w)=0)", choice=Modelica.Mechanics.Rotational.Types.Init.InitialState "initialization with phi_start, w_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngle "initialization with phi_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeed "initialization with w_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAcceleration "initialization with a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngleAcceleration "initialization with phi_start, a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeedAcceleration "initialization with w_start, a_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngleSpeedAcceleration "initialization with phi_start, w_start, a_start"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end Temp;

      annotation(Documentation(info="<html>
<p>
Type <b>Init</b> defines initialization of absolute rotational
quantities.
</p>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end Init;

    package InitRel "Type, constants and menu choices to define initialization of relative rotational quantities"
      extends Modelica.Icons.Enumeration;
      constant Integer NoInit=1 "no initialization (phi_rel_start, w_rel_start are guess values)";
      constant Integer SteadyState=2 "steady state initialization (der(phi_rel)=der(w_rel)=0)";
      constant Integer InitialState=3 "initialization with phi_rel_start, w_rel_start";
      constant Integer InitialAngle=4 "initialization with phi_rel_start";
      constant Integer InitialSpeed=5 "initialization with w_rel_start";
      type Temp "Temporary type of absolute initialization with choices for menus (until enumerations are available)"
        extends Modelica.Icons.TypeInteger(min=1, max=5);
        annotation(Evaluate=true, choices(choice=Modelica.Mechanics.Rotational.Types.Init.NoInit "no initialization (phi_rel_start, w_rel_start are guess values)", choice=Modelica.Mechanics.Rotational.Types.Init.SteadyState "steady state initialization (der(phi)=der(w)=0)", choice=Modelica.Mechanics.Rotational.Types.Init.InitialState "initialization with phi_rel_start, w_rel_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialAngle "initialization with phi_rel_start", choice=Modelica.Mechanics.Rotational.Types.Init.InitialSpeed "initialization with w_rel_start"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      end Temp;

      annotation(Documentation(info="<html>
<p>
Type <b>Init</b> defines initialization of relative rotational
quantities.
</p>
 
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    end InitRel;

  end Types;

end Rotational;
