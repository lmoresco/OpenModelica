within Modelica;
package StateGraph "Library to model discrete event and reactive systems by hierarchical state machines"
  extends Modelica.Icons.Library2;
  annotation(version="0.87", versionDate="2004-06-23", preferedView="info", Documentation(info="<html>
<p>
Library <b>StateGraph</b> is a <b>free</b> Modelica package providing
components to model <b>discrete event</b> and <b>reactive</b>
systems in a convenient
way. It is based on the JGraphChart method and
takes advantage of Modelica features for
the \"action\" language. JGraphChart is a further development of 
Grafcet to include elements of StateCharts that are not present
in Grafcet/Sequential Function Charts. Therefore, the StateGraph
library has a similar modeling power as StateCharts but avoids
some deficiences of StateCharts.
</p>
<p>
For an introduction, have especially a look at:
</p>
<ul>
<li> <a href=\"Modelica:Modelica.StateGraph.UsersGuide\">StateGraph.UsersGuide</a>
     discusses the most important aspects how to use this library.</li>
<li> <a href=\"Modelica:Modelica.StateGraph.Examples\">StateGraph.Examples</a>
     contains examples that demonstrate the usage of this library.</li>
</ul>
<p>
A typical model generated with this library is shown
in the next figure where on the left hand side a two-tank 
system with a tank controller and on the right hand side the
top-level part of the tank controller as a StateGraph is shown:
</p>
<p>
<img src=\"Images/StateGraph/Examples/ControlledTanks1_small.png\"> 
<img src=\"Images/StateGraph/Examples/ControlledTanks2_small.png\">
</p>
<p>
The unique feature of the StateGraph library with respect to JGraphCharts,
Grafcet, Sequential Function Charts, and StateCharts, is Modelica's
\"single assignment rule\" that requires that every variable is defined
by exactly one equation. This leads to a different \"action\" definition
as in these formalisms. The advantage is that the translator can either
determine a useful evaluation sequence by equation sorting or
reports an error if this is not possible, e.g., because a model
would lead to a non-determinism or to a dead-lock. As a side effect,
this leads also to simpler and more easier to understand models and
global variables are no longer needed (whereas in JGraphCharts,
Grafcet, Sequential Function Charts and StateCharts global variables
are nearly always needed).
</p>
<p>
The StateGraph library is currently available in a beta release.
The available components will most likely not be changed for the
release version. It is planned to improve the convenience of
building models with the StateGraph library for the release version
(this may require to introduce some additional annotations).
It is planned to include the StateGraph library in the
Modelica standard library.
It is most useful to combine this libray with the Modelica libraries
</p>
<ul>
<li><b>Modelica.Blocks.Logical</b> that provides  
    components available in PLCs (programmable logic controllers). </li>
<li><b>UserInteraction</b> that provides components to 
    interactively communicate with models in a running simulation.</li>
</ul>

<p>
Copyright &copy; 1998-2006, Modelica Association and DLR
</p>
<p>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> 
<a href=\"Modelica://Modelica.UsersGuide.ModelicaLicense\">here</a>.</i>
</p><br>

</HTML>
", revisions=""), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-88,-20},{-50,-54}}, lineColor={0,0,0}),Line(points={{-50,-38},{-24,-38}}, color={0,0,0}),Polygon(points={{-24,-32},{-12,-38},{-24,-44},{-24,-32}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0}),Line(points={{-12,-6},{-12,-76}}, color={0,0,0}),Line(points={{-12,-38},{14,-38}}, color={0,0,0}),Polygon(points={{14,-32},{26,-38},{14,-44},{14,-32}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0}),Rectangle(extent={{26,-22},{64,-56}}, lineColor={0,0,0})}));
  package UsersGuide "Users Guide"
    annotation(DocumentationClass=true, Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Users Guide of package StateGraph</font></h3>
<p>
Library <b>StateGraph</b> is a <b>free</b> Modelica package providing
components to model <b>discrete event</b> and <b>reactive</b> 
systems in a convenient
way. This package contains the <b>users guide</b> for 
the library and has the following content:
</p>
<ol>
<li><a href=\"Modelica://Modelica.StateGraph.UsersGuide.OverView\">Overview of library</a>
     gives an overview of the library.</li>
<li> <a href=\"Modelica://Modelica.StateGraph.UsersGuide.FirstExample\">A first example</a>
     demonstrates at hand of a first example how to use this library.</li>
<li> <a href=\"Modelica://Modelica.StateGraph.UsersGuide.ApplicationExample\">An 
     application example</a> demonstrates varies features at hand of the
     control of a two tank system.</li>
<li><a href=\"Modelica://Modelica.StateGraph.UsersGuide.ReleaseNotes\">Release Notes</a>
    summarizes the differences between different versions of this library.</li>
<li><a href=\"Modelica://Modelica.StateGraph.UsersGuide.Literature\">Literature</a>
    provides references that have been used to design and implement this 
    library.</li>
<li><a href=\"Modelica://Modelica.StateGraph.UsersGuide.Contact\">Contact</a> 
    provides information about the authors of the library as well as
    acknowledgments.</li>
</ol>
</html>"));
    class OverView "Overview of library"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Overview of Library StateGraph</font></h3>
<p>
In this section, an overview of the most important features
of this library is given.
</p>
<h4><font color=\"#008000\">Steps and Transitions</font></h4>
<p>
A <b>StateGraph</b> is an enhanced finite state machine.
It is based on the JGraphChart method and
takes advantage of Modelica features for
the \"action\" language. JGraphChart is a further development of 
Grafcet to include elements of StateCharts that are not present
in Grafcet/Sequential Function Charts. Therefore, the StateGraph
library has a similar modeling power as StateCharts but avoids
some deficiences of StateCharts.
</p>
<p>
The basic elements of StateGraphs are <b>steps</b> and <b>transitions</b>:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/StepAndTransition1.png\">
</p>
<p>
<b>Steps</b> represent the possible states a StateGraph can have.
If a step is active the Boolean variable <b>active</b> of
the step is <b>true</b>. If it is deactivated,
<b>active</b> = <b>false</b>. At the initial time, all \"usual\"
steps are deactivated. The <b>InitialStep</b> objects are steps
that are activated at the initial time. They are characterized
by a double box (see figure above).
</p>
<p>
<b>Transitions</b> are used to change the state of a StateGraph.
When the step connected to the input of a transition is active,
the step connected to the output of this transition is deactivated
and the transition condition becomes true, then the
transition fires. This means that the step connected to the input to the
transition is deactivated and the step connected to the output
of the transition is activated.
</p>
<p>
The transition <b>condition</b> is defined via the <i>Variables</i> tab
when selecting the transition object. Clicking on object \"transition1\" in
the above figure, results in the following window:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/StepAndTransition2.png\">
</p>
<p>
In the input field <i>Values</i> for \"<b>condition</b>\", any type of time varying
Boolean expression can be given (in Modelica notation, this is
a modification of the time varying variable <b>condition</b>).
Whenever this condition is true, the transition can fire.
Additionally, it is possible to activate a timer, via
<b>enableTimer</b> (see Parameters window) and provide a 
<b>waitTime</b>. In this case the firing of the transition
is delayed according to the provided waitTime. The transition
condition and the waitTime are displayed in the transition icon.
</p>
<p>
In the above example, the simulation starts at <b>initialStep</b>.
After 1 second, <b>transition1</b> fires and <b>step1</b> becomes
active. After another second <b>transition2</b> fires and
<b>initialStep</b> becomes again active. After a further
second <b>step1</b> becomes again active, and so on.
</p>
<p>
In JGrafcharts, Grafcet and Sequential Function Charts, the
network of steps and transitions is drawn from top to bottom.
In StateGraphs, no particular direction is defined, since 
steps and transitions are blocks with input and output connectors
that can be arbitrarily placed and connected. Usually, it is 
most practical to define the network from left to right,
as in the example above, since then it is easy to read the
labels on the icons.
</p>
<h4><font color=\"#008000\">Conditions and Actions</font></h4>
<p>
With the block <b>TransitionWithSignal</b>, the firing condition
can be provided as Boolean input signal, instead as entry in the
menu of the transition. An example is given in the next
figure:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/StepAndTransition3.png\">
</p>
<p>
Component \"step\" is an instance of \"StepWithSignal\" that is
a usual step where the active flag is available as Boolean
output signal. To this output, component \"Timer\" from
library \"Modelica.Blocks.Logical\" is connected. It measures the
time from the time instant where the Boolean input (i.e., the
active flag of the step) became true upto the current
time instant. The timer is connected to a comparison
component. The output is true, once the timer reaches
1 second. This signal is used as condition input of the
transition. As a result, \"transition2\" fires, once step
\"step\" has been active for 1 second.
Of course, any other
Modelica block with a Boolean output signal can be 
connected to the condition input of such a transition block
as well.
</p>
<p>
Conditions of a transition can either be computed by
a network of logical blocks from the Logical library as
in the figure above, or via the \"SetBoolean\" component
any type of logical expression can be defined in textual
form, as shown in the next figure:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/StepAndTransition4.png\">
</p>
<p>
With the block \"<b>SetBoolean</b>\", a time varying expression
can be provided as modification to the output signal <b>y</b>
(see block with icon text \"timer.y > 1\" in the figure above).
The output signal can be in turn connected to the condition 
input of a TransitionWithSignal block. 
</p>
<p>
The \"<b>SetBoolean</b>\" block can also be used to
compute a Boolean signal depending on the active step.
In the figure above, the output of the block with the 
icon text \"step.active\" is 
true, when \"step\" is active, otherwise it is false
(note, the icon text of \"SetBoolean\" displays the modification
of the output signal \"y\").
This signal can then be used to compute desired <b>actions</b> 
in the physical systems model. For example, if a <b>valve</b>
shall be open, when the StateGraph is in \"step1\" or
in \"step4\", a \"SetBoolean\" block may be connected to the
valve model using the following condition:
</p>
<pre>
    valve = step1.active <b>or</b> step2.active
</pre> 
<p>
Via the Modelica operators <b>edge</b>(..) and <b>change</b>(..),
conditions depending on rising and falling edges of 
Boolean expressions can be used when needed.
</p>
<p>
In JGrafcharts, Grafcet, Sequential Function Charts and StateCharts,
<b>actions</b> are formulated <b>within a step</b>. Such actions are 
distinguished as <b>entry</b>, <b>normal</b>, <b>exit</b> and 
<b>abort</b> actions. For example, a valve might be opened by
an entry action of a step and might be closed by an exit
action of the same step. In StateGraphs, this is (fortunately) 
<b>not possible</b>
due to Modelicas \"single assignment rule\" that requires that every
variable is defined by exactly one equation. Instead, the
approach explained above is used. For example, via the
\"SetBoolean\" component, the valve variable is set to true
when the StateGraph is in particular steps.
</p>
<p>
This feature of a StateGraph is <b>very useful</b>, since it allows
a Modelica translator to <b>guarantee</b> that a given StateGraph
has always <b>deterministic</b> behaviour without conflicts.
In the other methodologies this is much more cumbersome. For example,
if two steps are executed in parallel and both step actions
modify the same variable, the result is either non-deterministic
or non-obvious rules have to be defined which action
takes priority. In a StateGraph, such a situation is detected by
the translator resulting in an error, since there are two equations
to compute one variable. Additional benefits of the StateGraph
approach are:
</p>
<ul>
<li> A JGrafchart or a StateChart need to potentially access
     variables in a step that are defined in 
     higher hierarchical levels of a model. Therefore, mostly <b>global
     variables</b> are used in the whole network, even if the
     network is structured hierarchically. In StateGraphs this
     is not necessary, since the physical systems outside
     of a StateGraph might access the step or transition state
     via a hierarchical name. This means that <b>no global variables</b>
     are needed, because the local variables in the StateGraph
     are accessed from local variables outside of the StateGraph. 
     </li>
<li> It is simpler for a user to understand the information that
     is provided in the non-graphical definition, since every
     variable is defined at exactly one place. In the other
     methodologies, the setting and re-setting of the same
     variable is cluttered within the whole network.
    </li>
</ul>
<p>
To emphasize this important difference between these methodologies,
consider the case that a state machine has the following
hierarchy:
</p>
<pre>
   stateMachine.superstate1.superstate2.step1
</pre>
<p>
Within \"step1\" a StateChart would, e.g., access variable
\"stateMachine.openValve\", say as \"entry action: openValve = true\".
This typical usage has the severe drawback that it is not possible
to use the hierarchical state \"superstate1\" as component in another
context, because \"step1\" references a particular name outside of this
component. 
</p>
<p>
In a StateGraph, there would be typically a \"SetBoolean\" component
in the \"stateMachine\" component stating:
</p>
<pre>
    openValve = superstate1.superstate2.step1.active;
</pre>
<p>
As a result, the \"superstate1\" component can be used in 
another context, because it does not depend on the environment
where it is used.
</p>
<h4><font color=\"#008000\">Execution Model</font></h4>
<p>
The execution model of a StateGraph follows from its
Modelica implementation: Given the states of all steps, i.e., 
whether a step is active or not active, the equations of all
steps, transitions, transition conditions, actions etc. are
sorted resulting in an execution sequence to compute 
essentially the new values of the steps. If conflicts occur,
e.g., if there are more equations as variables, of if there
are algebraic loops between Boolean variables, an exception
is raised. Once all equations have been processed, the
<b>active</b> variable of all steps are updated to the newly
calculated values. Afterwards, the equations are again 
evaluated. The iteration stops, once no step changes
its state anymore, i.e., once no transition fires anymore.
Then, simulation continuous until a new event is triggered,
(when a relation changes its value).
</p>
<p>
With the Modelica \"sampled(..)\" operator, a StateGraph might also
be executed within a discrete controller that is called
at regular time instants. In a future version of the StateGraph
library, this might be more directly supported.
</p>
<h4><font color=\"#008000\">Parallel and Alternative Execution</font></h4>
<p>
Parallel activities can be defined by 
component <b>Parallel</b> and alternative activities
can be defined by component <b>Alternative</b>.
An example for both components is given in the next figure.
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/Parallel1.png\">
</p>
<p>
Here, the branch from \"step2\" to \"step5\" is executed in parallel
to \"step1\". A transition connected to the output of a parallel 
branch component can only fire if the final steps
in all parallel branches are active simultaneously.
</p>
<p>
The three branches within \"step2\" to \"step5\" are 
executed alternatively, depending which transition condition
of \"transition3\", \"transition4\", \"transition4a\" fires first.
Since all three transitions fire after 1 second, they are all
candidates for the active branch. If two or more transitions
would fire at the same time instant, a priority selection
is made: The alternative and parallel components have a
vector of connectors. Every branch has to be connected to
exactly one entry of the connector vector. The entry with
the lowest number has the highest priority.
</p>
<p>
Parallel, Alternative and Step components have vectors of
connectors. The dimensions of these vectors are set in the
corresponding Parameter window. E.g. in a \"Parallel\" component:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/Parallel2.png\">
</p>
<p>
Currently in MathModelica the following menu pops up, when a branch
is connected to a vector of components in order to define
the vector index to which the component shall be connected:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/Parallel3.png\">
</p>
<h4><font color=\"#008000\">CompositeSteps, Suspend and Resume Port</font></h4>
<p>
A StateGraph can be hierarchically structured by using a <b>CompositeStep</b>.
This is a component that inherits from <b>PartialCompositeStep</b>.
An example is given in the next figure (from Examples.ControlledTanks):
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/UsersGuide/CompositeStep1.png\">
</p>
<p>
The CompositeStep component contains a local StateGraph that is
entered by one or more input transitions and that is left
by one or more output transitions. Also, other needed signals
may enter a CompositeStep. The CompositeStep has similiar properties
as a \"usual\" step: The CompositeStep is <b>active</b> once at least
one step within the CompositeStep is active. Variable <b>active</b>
defines the state of the CompositeStep.
</p>
<p>
Additionally, a CompositeStep has a <b>suspend</b> port. Whenever the
transition connected to this port fires, the CompositeStep is left
at once. When leaving the CompositeStep via the suspend port, the internal
state of the CompositeStep is saved, i.e., the active flags of all
steps within the CompositeStep. The CompositeStep might be entered via
its <b>resume</b> port. In this case the internal state from the
suspend transition is reconstructed and the CompositeStep continues
the execution that it had before the suspend transition fired
(this corresponds to the history ports of StateCharts or JGrafCharts).
</p>
<p>
A CompositeStep may contain other CompositeSteps. At every level,
a CompositeStep and all of its content can be left via its suspend ports 
(actually, there
is a vector of suspend connectors, i.e., a CompositeStep might
be aborted due to different transitions).
</p>
</html>
", revisions=""));
    end OverView;

    class FirstExample "A first example"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>A first example</font></h3>
<p>
A first example will be given here (not yet done).
</p>
</html>
"));
    end FirstExample;

    class ApplicationExample "An application example"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>An application example</font></h3>
<p>
In this section a more realistic, still simple, application example
is given, to demonstrate various features of the StateGraph library.
This example shows the control of a two tank system from the master thesis 
of Isolde Dressler
(<a href=\"Modelica://Modelica.StateGraph.UsersGuide.Literature\">see literature</a>).
</p>
<p>
In the following figure the top level of the model is shown.
This model is available as StateGraph.Examples.ControlledTanks.
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/Examples/ControlledTanks1.png\">
</p>
<p>
In the right part of the figure, two tanks are shown. At the top part,
a large fluid source is present from which fluid can be filled in 
<b>tank1</b> when <b>valve1</b> is open. Tank1 can be emptied via
<b>valve2</b> that is located in the bottom of tank2 and
fills a second <b>tank2</b> which in turn is emptied via 
<b>valve3</b>. The actual levels of the tanks are measured
and are provided as signals <b>level1</b> and <b>level2</b>
to the <b>tankController</b>.
</p>
<p>
The <b>tankController</b> is controlled by three buttons, 
<b>start</b>, <b>stop</b> and <b>shut</b> (for shutdown)
that are mutually exclusive. This means that whenever one button is
pressed (i.e., its state is <b>true</b>) then the other two
buttons are not pressed (i.e., their states are <b>false</b>).
When button <b>start</b> is pressed, the \"normal\" operation
to fill and to empty the two tanks is processed:
</p>
<ol>
<li> Valve 1 is opened and tank 1 is filled.</li>
<li> When tank 1 reaches its fill level limit, 
     valve 1 is closed. </li>
<li> After a waiting time, valve 2 is
     opened and the fluid flows from tank 1 into tank 2.</li>
<li> When tank 1 is empty, valve 2 is closed. </li>
<li> After a waiting time, valve 3 is opened and
     the fluid flows out of tank 2</li>
<li> When tank 2 is empty, valve 3 is closed</liI>
</ol>
<p>
The above \"normal\" process can be influenced by the following 
buttons:
</p>
<ul>
<li> Button <b>start</b> starts the above process.
     When this button is pressed after a \"stop\" or
     \"shut\" operation, the process operation continues.
     </li>.
<li> Button <b>stop</b> stops the above process by
     closing all valves. Then, the controller waits for
     further input (either \"start\" or \"shut\" operation).</li>
<li> Button <b>shut</b> is used to shutdown the process, 
     by emptying at once both tanks. When this is achieved,
     the process goes back to its start configuration.
     Clicking on \"start\", restarts the process.</li>
</ul> 
<p>
The implementation of the <b>tankController</b> is shown in 
the next figure:
</p>
<p align=\"center\">
<img src=\"Images/StateGraph/Examples/ControlledTanks2.png\">
</p>
<p>
When the \"<b>start</b>\" button is pressed, the stateGraph is
within the CompositeStep \"<b>makeProduct</b>\". During normal
operation this CompositeStep is only left, once tank2 is empty.
Afterwards, the CompositeStep is at once re-entered.
</p>
<p>
When the \"<b>stop</b>\" button is pressed, the \"makeProduct\"
CompositeStep is at once terminated via the \"<b>suspend</b>\" port
and the stateGraph waits in step \"<b>s2</b>\" for further
commands. When the \"<b>start</b>\" button is pressed, the CompositeStep
is re-entered via its <b>resume</b> port and the \"normal\"
operation continues at the state where it was aborted by the
suspend transition. If the \"<b>shut</b>\" button is pressed,
the stateGraph waits in the \"<b>emptyTanks</b>\" step, until
both tanks are empty and then waits at the initial step 
\"<b>s1</b>\" for further input.
</p>
<p>
The opening and closing of valves is <b>not</b> directly
defined in the stateGraph. Instead via the \"<b>setValveX</b>\"
components, the Boolean state of the valves are computed.
For example, the output y of \"setValve2\" is computed as:
</p>
<pre>
  y = makeProduct.fillTank2.active or emptyTanks.active
</pre>
<p>
i.e., valve2 is open, when step \"makeProduct.fillTank2 or when
step \"emptyTanks\" is active. Otherwise, valve2 is closed.
</p>
</html>
", revisions=""));
    end ApplicationExample;

    class ReleaseNotes "Release notes"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Release notes</font></h3>
<i>Changes by MathCore: Added stateGraphRoot component to each example. Updated pictures in documentation. Removed documentation about automatically adding inner component stateGraphRoot.</i>
<h3><font color=\"#008000\">Version 0.87, 2004-06-23</font></h3>
<ul>
<li> Included in Modelica standard library 2.0 Beta 1 with the new block connectors.
     Changed all the references to the block connectors and the Logical library
     correspondingly.</li>
</ul>
<h3><font color=\"#008000\">Version 0.86, 2004-06-20</font></h3>
<ul>
<li> New components \"Alternative\" and \"Parallel\" for alternative and
     parallel execution paths.</li>
<li> A step has now a vector of input and output connectors in order
     that multiple connections to and from a step are possible</li>
<li> Removed components \"AlternativeSplit\", \"AlternativeJoin\",
     \"ParallelSplit\" and \"ParallelJoin\" since the newly introduced
     components (\"Alternative\", \"Parallel\", vector connectors of steps)
     have the same modeling power but are safer and more convenient.</li>
<li> Removed the timer in a step (attach instead Logical.Timer to
     the \"active\" port of a \"StepWithSignal\" component). Note, that in
     most cases it is more convenient and more efficient to use the
     built-in timer of a transition.</li>
<li> Component \"StepInitial\" renamed to \"InitialStep\".</li>
<li> New component \"Timer\" within sublibrary Logical.</li>
<li> Updated and improved documentation of the library.</li>
</ul>
<h3><font color=\"#008000\">Version 0.85, 2004-06-17</font></h3>
<ul>
<li> Renamed \"MacroStep\" to \"CompositeStep\" and the ports of the MacroStep
     from \"abort\" to \"suspend\" and \"histoy\" to \"resume\".</li>
<li> Nested \"CompositeStep\" components are supported, based on the
     experimental feature of nested inner/outer components 
     introduced by Dymola. This means that CompositeSteps can
     be suspended and resumed at every level.</li>
<li> New example \"Examples.ShowExceptions\" to demonstrate the new
     feature of nested CompositeSteps.</li>
<li> New package \"Logical\". It contains all components of
     ModelicaAdditions.Blocks.Logical, but with new block connectors
     and nicer icons. Additionally, logical blocks are also added.</li>
<li> Improved icons for several components of the StateGraph library.</li>
</ul>
<h3><font color=\"#008000\">Version 0.83, 2004-05-21</font></h3>
<ul>
<li> The \"abort\" and \"history\" connectors are no longer visible in the
     diagram layer of a CompositeStep since it is not allowed to connect
     to them in a CompositeStep.</li>
<li> Made the diagram/icon size of a CompositeStep smaller (from 200/-200 to
     150/-150).</li>
<li> Improved icons for \"SetBoolean/SetInteger/SetReal\" components.</li>
<li> Renamed \"ParameterReal\" to \"SetRealParameter\".</li>
</ul>
<h3><font color=\"#008000\">Version 0.82, 2004-05-18</font></h3>
<p>
Implemented a first version that is provided to other people.
</p>
</html>
", revisions=""));
    end ReleaseNotes;

    class Literature "Literature"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Literature</font></h3>
<p>
The StateGraph library is based on the following references:
</p>
<dl>
<dt>Arzen K.-E. (2004):</dt>
<dd> <b>JGrafchart User Manual. Version 1.5</b>.
     Department of Automatic Control, Lund Institute of Technology,
     Lund, Sweden, Feb. 13<br>&nbsp;</dd>
<dt>Dressler I. (2004):</dt>
<dd> <b>Code Generation From JGrafchart to Modelica</b>.
     Master thesis, supervisor: Karl-Erik Arzen,
     Department of Automatic Control, Lund Institute of Technology,
     Lund, Sweden, March 30<br>&nbsp;</dd>
<dt>Elmqvist H., Mattsson S.E., Otter M. (2001):</dt>
<dd> <b>Object-Oriented and Hybrid Modeling in Modelica</b>.
     Journal Europeen des systemes automatises (JESA),
     Volume 35 - n. 1.<br>&nbsp;</dd>
<dt>Mosterman P., Otter M., Elmqvist H. (1998):</dt>
<dd> <b>Modeling Petri Nets as Local Constraint Equations for 
     Hybrid Systems using Modelica</b>.
     SCSC'98, Reno, Nevada, USA,
     Society for Computer Simulation International, pp. 314-319.
     </dd>
</dl>
</html>
"));
    end Literature;

    class Contact "Contact"
      annotation(Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Contact</font></h3>
<dl>
<dt><b>Main Author:</b>
<dd><a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a><br>
    Deutsches Zentrum f&uuml;r Luft und Raumfahrt e.V. (DLR)<br>
    Institut f&uuml;r Robotik und Mechatronik<br> 
    Abteilung f&uuml;r Entwurfsorientierte Regelungstechnik<br>
    Postfach 1116<br>
    D-82230 Wessling<br>
    Germany<br>
    email: <A HREF=\"mailto:Martin.Otter@dlr.de\">Martin.Otter@dlr.de</A><br>
</dl>
<p><b>Acknowledgements:</b></p>
<ul>
<li> The development of this library was strongly motivated by the
     master thesis of Isolde Dressler
     (<a href=\"Modelica://Modelica.StateGraph.UsersGuide.Literature\">see literature</a>),
     in which
     a compiler from JGrafChart to Modelica was designed and
     implemented. This project was supervised by Karl-Erik Arzen
     from Departement of Automatic Control, Lund Institut of
     Technology, Lund, Sweden.</li>
<li> This library profits also from the experience gained
     in the focused research program (Schwerpunktprogramm) 
     \"Continuous-Discrete Dynamic Systems\" (KONDISK), sponsored by the 
     Deutsche Forschungsgemeinschaft under grants OT174/1-2 and EN152/22-2. 
     This support is most gratefully acknowledged.
 </li>
<li> The implementation of the basic components of this library by describing
     finite state machines with equations is based on
     (Elmqvist, Mattsson and Otter, 2001),
     which in turn uses ideas from (Mosterman, Otter and Elmqvist, 1998),
     see <a href=\"Modelica://Modelica.StateGraph.UsersGuide.Literature\">literature</a></li>
</ul>
</html>
"));
    end Contact;

  end UsersGuide;

  package Examples "Examples to demonstrate the usage of the components of the StateGraph library"
    model FirstExample "A first simple StateGraph example"
      extends Modelica.Icons.Example;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      InitialStep initialStep annotation(Placement(visible=true, transformation(origin={-38,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-10,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step annotation(Placement(visible=true, transformation(origin={20,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition2(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={50,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(transition2.outPort,initialStep.inPort[1]) annotation(Line(visible=true, points={{51.5,10},{70,10},{70,32},{-62,32},{-62,10},{-49,10}}));
      connect(step.outPort[1],transition2.inPort) annotation(Line(visible=true, points={{30.5,10},{46,10}}));
      connect(transition1.outPort,step.inPort[1]) annotation(Line(visible=true, points={{-8.5,10},{9,10}}));
      connect(initialStep.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-27.5,10},{-14,10}}));
      annotation(structurallyIncomplete, experiment(StopTime=5), experimentSetupOutput, Documentation(info="<html>
  
</html>"));
    end FirstExample;

    model FirstExample_Variant2 "A variant of the first simple StateGraph example"
      extends Modelica.Icons.Example;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      InitialStep initialStep annotation(Placement(visible=true, transformation(origin={-60,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-32,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      StepWithSignal step annotation(Placement(visible=true, transformation(origin={-4,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      TransitionWithSignal transition2 annotation(Placement(visible=true, transformation(origin={62,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Logical.Timer timer annotation(Placement(visible=true, transformation(origin={16,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Logical.GreaterEqualThreshold greaterEqual(threshold=1) annotation(Placement(visible=true, transformation(origin={46,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(transition2.outPort,initialStep.inPort[1]) annotation(Line(visible=true, points={{63.5,10},{82,10},{82,32},{-80,32},{-80,10},{-71,10}}));
      connect(greaterEqual.y,transition2.condition) annotation(Line(visible=true, points={{57,-30},{62,-30},{62,-2}}, color={255,0,255}));
      connect(timer.y,greaterEqual.u) annotation(Line(visible=true, points={{27,-30},{34,-30}}, color={0,0,255}));
      connect(step.outPort[1],transition2.inPort) annotation(Line(visible=true, points={{6.5,10},{58,10}}));
      connect(step.active,timer.u) annotation(Line(visible=true, points={{-4,-1},{-4,-30},{4,-30}}, color={255,0,255}));
      connect(transition1.outPort,step.inPort[1]) annotation(Line(visible=true, points={{-30.5,10},{-15,10}}));
      connect(initialStep.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-49.5,10},{-36,10}}));
      annotation(structurallyIncomplete, experiment(StopTime=5), experimentSetupOutput, Documentation(info="<html>
  
</html>"));
    end FirstExample_Variant2;

    model FirstExample_Variant3 "A variant of the first simple StateGraph example"
      extends Modelica.Icons.Example;
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      InitialStep initialStep annotation(Placement(visible=true, transformation(origin={-60,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-32,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      StepWithSignal step annotation(Placement(visible=true, transformation(origin={-4,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      TransitionWithSignal transition2 annotation(Placement(visible=true, transformation(origin={66,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Logical.Timer timer annotation(Placement(visible=true, transformation(origin={-4,-30}, extent={{-10,-10},{10,10}}, rotation=-90)));
      Modelica.Blocks.Sources.BooleanExpression SetBoolean1(y=timer.y > 1) annotation(Placement(visible=true, transformation(origin={44,-30}, extent={{-16,-10},{16,10}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanExpression SetBoolean2(y=step.active) annotation(Placement(visible=true, transformation(origin={-52,-30}, extent={{-16,-10},{16,10}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(SetBoolean1.y,transition2.condition) annotation(Line(visible=true, points={{61.6,-30},{66,-30},{66,-2}}, color={255,0,255}));
      connect(transition2.outPort,initialStep.inPort[1]) annotation(Line(visible=true, points={{67.5,10},{82,10},{82,32},{-80,32},{-80,10},{-71,10}}));
      connect(step.outPort[1],transition2.inPort) annotation(Line(visible=true, points={{6.5,10},{62,10}}));
      connect(step.active,timer.u) annotation(Line(visible=true, points={{-4,-1},{-4,-9.5},{-4,-18},{-4,-18}}, color={255,0,255}));
      connect(transition1.outPort,step.inPort[1]) annotation(Line(visible=true, points={{-30.5,10},{-15,10}}));
      connect(initialStep.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-49.5,10},{-36,10}}));
      annotation(structurallyIncomplete, experiment(StopTime=5), experimentSetupOutput, Documentation(info="<html>
  
</html>"));
    end FirstExample_Variant3;

    extends Modelica.Icons.Library;
    model ExecutionPaths "Example to demonstrate parallel and alternative execution paths"
      extends Modelica.Icons.Example;
      annotation(structurallyIncomplete, Documentation(info="<HTML>
<p>
This is an example to demonstrate in which way <b>parallel</b> activities
can be modelled by a StateGraph. When transition1 fires
(after 1 second), two branches are executed in parallel.
After 6 seconds the two branches are synchronized in order to arrive
at step6.
</p>
<p>
Before simulating the model, try to figure out whether which branch
of the alternative sequence is executed. Note, that alternatives
have priorities according to the port index (alternative.split[1]
has a higher priority to fire as alternative.split[2]).
</p>
</HTML>
"), experiment(StopTime=15), experimentSetupOutput, Diagram(coordinateSystem(extent={{-160,-160},{160,160}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      InitialStep step0 annotation(Placement(visible=true, transformation(origin={-130,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-90,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step1 annotation(Placement(visible=true, transformation(origin={0,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition2(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={100,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step6 annotation(Placement(visible=true, transformation(origin={130,-90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step2 annotation(Placement(visible=true, transformation(origin={-88,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition3(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-32,90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition4(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-32,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step3 annotation(Placement(visible=true, transformation(origin={2,90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step4 annotation(Placement(visible=true, transformation(origin={2,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition5(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={36,90}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition6(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={36,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step5 annotation(Placement(visible=true, transformation(origin={90,50}, extent={{-10,-10},{10,10}}, rotation=0)));
      Modelica.Blocks.Sources.RealExpression setReal(y=time) annotation(Placement(visible=true, transformation(origin={31,-150}, extent={{-10,-10},{10,10}}, rotation=0)));
      TransitionWithSignal transition7 annotation(Placement(visible=true, transformation(origin={-1,-124}, extent={{10,-10},{-10,10}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanExpression setCondition(y=time > 7) annotation(Placement(visible=true, transformation(origin={-48,-150}, extent={{-29,-10},{29,10}}, rotation=0)));
      Transition transition4a(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-32,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step4a annotation(Placement(visible=true, transformation(origin={2,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition6a(enableTimer=true, waitTime=2) annotation(Placement(visible=true, transformation(origin={36,10}, extent={{-10,-10},{10,10}}, rotation=0)));
      StateGraph.Temporary.NumericValue NumericValue1 annotation(Placement(visible=true, transformation(origin={71,-150}, extent={{-10,-10},{10,10}}, rotation=0)));
      Alternative alternative(nBranches=3) annotation(Placement(visible=true, transformation(origin={1,50}, extent={{-71,-60},{71,60}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-150,150}, extent={{-10,-10},{10,10}}, rotation=0)));
      Parallel Parallel1 annotation(Placement(visible=true, transformation(origin={-1,35}, extent={{-153,-85},{153,85}}, rotation=0)));
    equation 
      connect(step2.inPort[1],Parallel1.split[1]) annotation(Line(visible=true, points={{-99,50},{-118,50},{-119.575,50},{-119.575,50},{-119.575,35}}));
      connect(step1.outPort[1],Parallel1.join[2]) annotation(Line(visible=true, points={{10.5,-30},{118,-30},{118,-7.5},{117.575,35}}));
      connect(transition1.outPort,Parallel1.inPort) annotation(Line(visible=true, points={{-88.5,-90},{-70,-90},{-70,-64},{-174,-64},{-174,35},{-158.59,35}}));
      connect(Parallel1.outPort,transition2.inPort) annotation(Line(visible=true, points={{155.06,35},{168,35},{168,-60},{80,-60},{80,-90},{96,-90}}));
      connect(step5.outPort[1],Parallel1.join[1]) annotation(Line(visible=true, points={{100.5,50},{117.58,50},{117.58,46.5005},{117.575,35}}));
      connect(Parallel1.split[2],step1.inPort[1]) annotation(Line(visible=true, origin={-83.3833,-8.33333}, points={{-36.1917,43.3333},{-36.1917,-21.6667},{72.3833,-21.6667}}));
      connect(transition2.outPort,step6.inPort[1]) annotation(Line(visible=true, points={{101.5,-90},{119,-90}}));
      connect(step0.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-119.5,-90},{-94,-90}}));
      connect(alternative.outPort,step5.inPort[1]) annotation(Line(visible=true, points={{73.42,50},{79,50}}));
      connect(step2.outPort[1],alternative.inPort) annotation(Line(visible=true, points={{-77.5,50},{-72.13,50}}));
      connect(transition6a.outPort,alternative.join[3]) annotation(Line(visible=true, points={{37.5,10},{57.09,10},{57.09,50}}));
      connect(transition6.outPort,alternative.join[2]) annotation(Line(visible=true, points={{37.5,50},{57.09,50}}));
      connect(transition5.outPort,alternative.join[1]) annotation(Line(visible=true, points={{37.5,90},{57.09,90},{57.09,50}}));
      connect(transition4a.inPort,alternative.split[3]) annotation(Line(visible=true, points={{-36,10},{-55,10},{-55.09,50}}));
      connect(transition4.inPort,alternative.split[2]) annotation(Line(visible=true, points={{-36,50},{-55.09,50}}));
      connect(transition3.inPort,alternative.split[1]) annotation(Line(visible=true, points={{-36,90},{-55,90},{-55.09,50}}));
      connect(setReal.y,NumericValue1.Value) annotation(Line(visible=true, points={{42,-150},{59,-150}}, color={0,0,255}));
      connect(setCondition.y,transition7.condition) annotation(Line(visible=true, points={{-16.1,-150},{-1,-150},{-1,-136}}, color={255,0,255}));
      connect(step4a.outPort[1],transition6a.inPort) annotation(Line(visible=true, points={{12.5,10},{32,10}}));
      connect(transition4a.outPort,step4a.inPort[1]) annotation(Line(visible=true, points={{-30.5,10},{-9,10}}));
      connect(step6.outPort[1],transition7.inPort) annotation(Line(visible=true, points={{140.5,-90},{150,-90},{150,-124},{3,-124}}));
      connect(transition7.outPort,step0.inPort[1]) annotation(Line(visible=true, points={{-2.5,-124},{-149,-124},{-149,-90},{-141,-90}}));
      connect(step4.outPort[1],transition6.inPort) annotation(Line(visible=true, points={{12.5,50},{32,50}}));
      connect(transition4.outPort,step4.inPort[1]) annotation(Line(visible=true, points={{-30.5,50},{-9,50}}));
      connect(step3.outPort[1],transition5.inPort) annotation(Line(visible=true, points={{12.5,90},{32,90}}));
      connect(transition3.outPort,step3.inPort[1]) annotation(Line(visible=true, points={{-30.5,90},{-9,90}}));
    end ExecutionPaths;

    model ShowCompositeStep "Example to demonstrate parallel activities described by a StateGraph"
      extends Modelica.Icons.Example;
      annotation(structurallyIncomplete, Documentation(info="<HTML>
<p>
This is the same example as \"ExecutionPaths\". The only difference
is that the alternative paths are included in a \"CompositeStep\".
</p>
</HTML>
"), experiment(StopTime=15), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Utilities.CompositeStep compositeStep annotation(Placement(visible=true, transformation(origin={5,20}, extent={{-15,-15},{15,15}}, rotation=0)));
      InitialStep step0 annotation(Placement(visible=true, transformation(origin={-79,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-49,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step1 annotation(Placement(visible=true, transformation(origin={6,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition2(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={55,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step6 annotation(Placement(visible=true, transformation(origin={81,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      TransitionWithSignal transition7 annotation(Placement(visible=true, transformation(origin={0,-60}, extent={{10,-10},{-10,10}}, rotation=0)));
      Parallel Parallel1 annotation(Placement(visible=true, transformation(origin={3,0}, extent={{-33,-40},{33,40}}, rotation=0)));
      Modelica.Blocks.Sources.BooleanExpression setCondition(y=time > 7) annotation(Placement(visible=true, transformation(origin={-25,-80}, extent={{-15,-10},{15,10}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(setCondition.y,transition7.condition) annotation(Line(visible=true, points={{-8.5,-80},{0,-80},{0,-72}}, color={255,0,255}));
      connect(step1.outPort[1],Parallel1.join[2]) annotation(Line(visible=true, points={{16.5,-20},{28.575,0}}));
      connect(step1.inPort[1],Parallel1.split[2]) annotation(Line(visible=true, points={{-5,-20},{-22.575,0}}));
      connect(compositeStep.outPort,Parallel1.join[1]) annotation(Line(visible=true, points={{20.5,20},{28.575,0}}));
      connect(compositeStep.inPort,Parallel1.split[1]) annotation(Line(visible=true, points={{-11,20},{-22.575,0}}));
      connect(Parallel1.outPort,transition2.inPort) annotation(Line(visible=true, points={{36.66,0},{51,0}}));
      connect(transition1.outPort,Parallel1.inPort) annotation(Line(visible=true, points={{-47.5,0},{-30.99,0}}));
      connect(transition2.outPort,step6.inPort[1]) annotation(Line(visible=true, points={{56.5,0},{70,0}}));
      connect(step6.outPort[1],transition7.inPort) annotation(Line(visible=true, points={{91.5,0},{96,0},{96,-60},{4,-60}}));
      connect(transition7.outPort,step0.inPort[1]) annotation(Line(visible=true, points={{-1.5,-60},{-98,-60},{-98,0},{-90,0}}));
      connect(step0.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-68.5,0},{-53,0}}));
    end ShowCompositeStep;

    model ShowExceptions "Example to demonstrate how a hierarchically structured StateGraph can suspend and resume actions on different levels"
      extends Modelica.Icons.Example;
      annotation(structurallyIncomplete, Documentation(info="<HTML>
<p>
CompositeStep \"compositeStep\" is a hierarchical StateGraph consisting of
two other subgraphs. Whenever component \"compositeStep\" is suspended,
all steps with in \"compositeStep\" are deactivated. By entering \"compositeStep\"
via its \"resume\" port, all steps within \"compositeStep\" are activated
according to their setting before leaving the \"compositeStep\" via its
\"suspend\" port.
</p>
</HTML>
"), experiment(StopTime=20), experimentSetupOutput, Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Utilities.CompositeStep1 compositeStep annotation(Placement(visible=true, transformation(origin={-5,40}, extent={{-15,-15},{15,15}}, rotation=0)));
      InitialStep initialStep annotation(Placement(visible=true, transformation(origin={-70,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition1(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-40,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition2(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={30,40}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition3(enableTimer=true, waitTime=2) annotation(Placement(visible=true, transformation(origin={-45,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Step step1 annotation(Placement(visible=true, transformation(origin={-14,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
      Transition transition4(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={20,-20}, extent={{-10,-10},{10,10}}, rotation=0)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(transition3.outPort,step1.inPort[1]) annotation(Line(visible=true, points={{-43.5,-20},{-25,-20}}));
      connect(compositeStep.outPort,transition2.inPort) annotation(Line(visible=true, points={{10.5,40},{26,40}}));
      connect(initialStep.outPort[1],transition1.inPort) annotation(Line(visible=true, points={{-59.5,40},{-44,40}}));
      connect(transition1.outPort,compositeStep.inPort) annotation(Line(visible=true, points={{-38.5,40},{-21,40}}));
      connect(step1.outPort[1],transition4.inPort) annotation(Line(visible=true, points={{-3.5,-20},{16,-20}}));
      connect(transition4.outPort,compositeStep.resume[1]) annotation(Line(visible=true, points={{21.5,-20},{37.5,-20},{37.5,7.5},{2.5,7.5},{2.5,24}}));
      connect(compositeStep.suspend[1],transition3.inPort) annotation(Line(visible=true, points={{-12.5,24.5},{-12.5,7.5},{-60,7.5},{-60,-20},{-49,-20}}));
      connect(transition2.outPort,initialStep.inPort[1]) annotation(Line(visible=true, points={{31.5,40},{45,40},{45,75},{-90,75},{-90,40},{-81,40}}));
    end ShowExceptions;

    model ControlledTanks "Demonstrating the controller of a tank filling/emptying system"
      extends Modelica.Icons.Example;
      annotation(structurallyIncomplete, experiment(StopTime=100), experimentSetupOutput, Documentation(info="<html>
<p>
With this example the controller of a tank filling/emptying system
is demonstrated. This example is from Dressler (2004),
see <a href=\"Modelica://Modelica.StateGraph.UsersGuide.Literature\">Literature</a>. 
The basic operation is to fill and empty the two tanks:
</p>
<ol>
<li> Valve 1 is opened and tank 1 is filled.</li>
<li> When tank 1 reaches its fill level limit, 
     valve 1 is closed. </li>
<li> After a waiting time, valve 2 is
     opened and the fluid flows from tank 1 into tank 2.</li>
<li> When tank 1 is empty, valve 2 is closed. </li>
<li> After a waiting time, valve 3 is opened and
     the fluid flows out of tank 2</li>
<li> When tank 2 is empty, valve 3 is closed</liI>
</ol>
<p>
The above \"normal\" process can be influenced by three 
buttons:
</p>
<ul>
<li> Button <b>start</b> starts the above process.
     When this button is pressed after a \"stop\" or
     \"shut\" operation, the process operation continues.
     </li>.
<li> Button <b>stop</b> stops the above process by
     closing all valves. Then, the controller waits for
     further input (either \"start\" or \"shut\" operation).</li>
<li> Button <b>shut</b> is used to shutdown the process, 
     by emptying at once both tanks. When this is achieved,
     the process goes back to its start configuration.
     Clicking on \"start\", restarts the process.</li>
</ul> 
     
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Utilities.TankController tankController annotation(Placement(visible=true, transformation(origin={-30,0}, extent={{-20,-20},{20,20}}, rotation=0)));
      StateGraph.Temporary.RadioButton start(reset={stop.on,shut.on}, buttonTimeTable={1,13,15,19}) annotation(Placement(visible=true, transformation(origin={-80,30}, extent={{-10,-10},{10,10}}, rotation=0)));
      StateGraph.Temporary.RadioButton stop(reset={start.on,shut.on}, buttonTimeTable={13,15,19,21}) annotation(Placement(visible=true, transformation(origin={-80,0}, extent={{-10,-10},{10,10}}, rotation=0)));
      StateGraph.Temporary.RadioButton shut(reset={start.on,stop.on}, buttonTimeTable={21,100}) annotation(Placement(visible=true, transformation(origin={-80,-30}, extent={{-10,-10},{10,10}}, rotation=0)));
      Utilities.Tank tank1 annotation(Placement(visible=true, transformation(origin={35,45}, extent={{-25,-25},{25,25}}, rotation=0)));
      Utilities.Tank tank2 annotation(Placement(visible=true, transformation(origin={59,-35}, extent={{-25,-25},{25,25}}, rotation=0)));
      Utilities.valve valve1 annotation(Placement(visible=true, transformation(origin={22.5,72}, extent={{-5.5,-5.5},{5.5,5.5}}, rotation=-90)));
      Utilities.Source source annotation(Placement(visible=true, transformation(origin={22.5,90.5}, extent={{-10,-10},{10,10}}, rotation=0)));
      Utilities.valve valve2 annotation(Placement(visible=true, transformation(origin={46.5,13}, extent={{-8,-7},{8,7}}, rotation=-90)));
      Utilities.valve valve3 annotation(Placement(visible=true, transformation(origin={73.5,-77}, extent={{-8,-7},{8,7}}, rotation=-90)));
      inner Modelica.StateGraph.StateGraphRoot stateGraphRoot annotation(Placement(visible=true, transformation(origin={-90,90}, extent={{-10,-10},{10,10}}, rotation=0)));
    equation 
      connect(source.outflow1,valve1.outflow1) annotation(Line(visible=true, points={{22.5,85.5},{22.5,74.75}}, thickness=0.5));
      connect(tankController.valve3,valve3.valveControl) annotation(Line(visible=true, points={{-9,-12},{23,-12},{23,-77},{67.9,-77}}, color={255,0,255}));
      connect(tankController.valve2,valve2.valveControl) annotation(Line(visible=true, points={{-9,0},{30,0},{30,13},{40.9,13}}, color={255,0,255}));
      connect(tankController.valve1,valve1.valveControl) annotation(Line(visible=true, points={{-9,12},{10,12},{10,72},{18.1,72}}, color={255,0,255}));
      connect(tank2.levelSensor,tankController.level2) annotation(Line(visible=true, points={{41.25,-40},{-18,-40},{-18,-22}}, color={0,0,255}));
      connect(tank1.levelSensor,tankController.level1) annotation(Line(visible=true, points={{17.25,40},{-30,40},{-30,60},{-97,60},{-97,-50},{-42,-50},{-42,-22}}, color={0,0,255}));
      connect(start.on,tankController.start) annotation(Line(visible=true, points={{-69,30},{-60,30},{-60,12},{-52,12}}, color={255,0,255}));
      connect(stop.on,tankController.stop) annotation(Line(visible=true, points={{-69,0},{-52,0}}, color={255,0,255}));
      connect(shut.on,tankController.shut) annotation(Line(visible=true, points={{-69,-30},{-62,-30},{-62,-12},{-52,-12}}, color={255,0,255}));
      connect(tank1.inflow1,valve1.inflow1) annotation(Line(visible=true, points={{22.5,61.25},{22.5,69.25}}, thickness=0.5));
      connect(tank2.outflow1,valve3.outflow1) annotation(Line(visible=true, points={{74,-46.25},{74,-73.5},{73.5,-73}}, thickness=0.5));
      connect(tank2.inflow1,valve2.inflow1) annotation(Line(visible=true, points={{46.5,-18.75},{46.5,9}}, thickness=0.5));
      connect(tank1.outflow1,valve2.outflow1) annotation(Line(visible=true, points={{50,33.75},{50,26.875},{46.5,26.875},{46.5,17}}, thickness=0.5));
    end ControlledTanks;

    package Utilities "Utility components for the examples"
      model TankController "Controller for tank system"
        extends StateGraph.Interfaces.PartialStateGraphIcon;
        annotation(structurallyIncomplete, Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, lineColor={0,0,0})}), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillPattern=FillPattern.Solid, extent={{-100.0,54.0},{-32.0,68.0}}, textString="start", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{-100.0,-8.0},{-32.0,6.0}}, textString="stop", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{-100.0,-68.0},{-32.0,-54.0}}, textString="shut", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{-94.0,-96.0},{-18.0,-82.0}}, textString="level1", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{24.0,-96.0},{96.0,-84.0}}, textString="level2", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{31.0,54.0},{99.0,68.0}}, textString="valve1", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{33.0,-5.0},{101.0,9.0}}, textString="valve2", fontName="Arial"),Text(visible=true, fillPattern=FillPattern.Solid, extent={{34.0,-67.0},{102.0,-53.0}}, textString="valve3", fontName="Arial")}));
        parameter Temporary.SetRealParameter limit=0.98 "Limit level of tank 1" annotation(Placement(visible=true, transformation(origin={-54.0,86.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        parameter Temporary.SetRealParameter waitTime=3 "Wait time" annotation(Placement(visible=true, transformation(origin={-81.0,86.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        InitialStep s1(nIn=2) annotation(Placement(visible=true, transformation(origin={-62.0,40.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        MakeProduct makeProduct(limit=limit, waitTime=waitTime) annotation(Placement(visible=true, transformation(origin={-5.0,40.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
        Transition T1(condition=start) annotation(Placement(visible=true, transformation(origin={-40.0,40.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Transition T2(condition=level2 < 0.001) annotation(Placement(visible=true, transformation(origin={37.0,40.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
        Transition T3(condition=stop) annotation(Placement(visible=true, transformation(origin={-23.0,-1.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90)));
        Step s2(nOut=2) annotation(Placement(visible=true, transformation(origin={-40.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T4(condition=start) annotation(Placement(visible=true, transformation(origin={10.0,-1.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
        Transition T5(condition=shut) annotation(Placement(visible=true, transformation(origin={4.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step emptyTanks annotation(Placement(visible=true, transformation(origin={32.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T6(condition=level1 + level2 < 0.001) annotation(Placement(visible=true, transformation(origin={55.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanInput start annotation(Placement(visible=true, transformation(origin={-110.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-110.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanInput stop annotation(Placement(visible=true, transformation(origin={-110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanInput shut annotation(Placement(visible=true, transformation(origin={-110.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-110.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput level1 annotation(Placement(visible=true, transformation(origin={-60.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90), iconTransformation(origin={-60.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90)));
        Modelica.Blocks.Interfaces.RealInput level2 annotation(Placement(visible=true, transformation(origin={60.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90), iconTransformation(origin={60.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90)));
        Modelica.Blocks.Interfaces.BooleanOutput valve1 annotation(Placement(visible=true, transformation(origin={105.0,60.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={105.0,60.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanOutput valve2 annotation(Placement(visible=true, transformation(origin={105.0,0.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={105.0,0.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.BooleanOutput valve3 annotation(Placement(visible=true, transformation(origin={105.0,-60.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={105.0,-60.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
        Modelica.Blocks.Sources.BooleanExpression setValve1(y=makeProduct.fillTank1.active) annotation(Placement(visible=true, transformation(origin={50.0,82.5}, extent={{-30.0,-9.5},{30.0,9.5}}, rotation=0)));
        Modelica.Blocks.Sources.BooleanExpression setValve2(y=makeProduct.fillTank2.active or emptyTanks.active) annotation(Placement(visible=true, transformation(origin={27.5,-78.5}, extent={{-52.5,-10.5},{52.5,10.5}}, rotation=0)));
        Modelica.Blocks.Sources.BooleanExpression setValve3(y=makeProduct.emptyTank2.active or emptyTanks.active) annotation(Placement(visible=true, transformation(origin={27.0,-90.0}, extent={{-53.0,-10.0},{53.0,10.0}}, rotation=0)));
      equation 
        connect(T6.outPort,s1.inPort[2]) annotation(Line(visible=true, points={{56.5,-50.0},{70.0,-50.0},{70.0,70.0},{-84.0,70.0},{-84.0,40.0},{-74.0,40.0},{-73.0,40.0}}));
        connect(T2.outPort,s1.inPort[1]) annotation(Line(visible=true, points={{38.5,40.0},{70.0,40.0},{70.0,70.0},{-84.0,70.0},{-84.0,40.0},{-73.0,40.0},{-73.0,40.0}}));
        connect(s2.outPort[2],T4.inPort) annotation(Line(visible=true, points={{-29.5,-50.0},{-29.0,-50.0},{-8.0,-50.0},{-8.0,-25.0},{10.0,-25.0},{10.0,3.0}}));
        connect(s2.outPort[1],T5.inPort) annotation(Line(visible=true, points={{-29.5,-50.0},{-30.0,-49.75},{-30.0,-50.0},{0.0,-50.0}}));
        connect(level1,makeProduct.level1) annotation(Line(visible=true, points={{-60.0,-110.0},{-60.0,-80.0},{-80.0,-80.0},{-80.0,20.0},{-30.0,20.0},{-30.0,28.0},{-22.0,28.0}}, color={0,0,255}));
        connect(T4.outPort,makeProduct.resume[1]) annotation(Line(visible=true, points={{10.0,-2.5},{10.0,15.0},{2.5,15.0},{2.5,24.0}}));
        connect(T3.outPort,s2.inPort[1]) annotation(Line(visible=true, points={{-23.0,0.5},{-23.0,-20.0},{-66.0,-20.0},{-66.0,-50.0},{-51.0,-50.0}}));
        connect(makeProduct.suspend[1],T3.inPort) annotation(Line(visible=true, points={{-12.5,24.5},{-12.5,12.0},{-23.0,12.0},{-23.0,-5.0}}));
        connect(setValve3.y,valve3) annotation(Line(visible=true, points={{85.3,-90.0},{95.0,-90.0},{95.0,-60.0},{105.0,-60.0}}, color={255,0,255}));
        connect(setValve2.y,valve2) annotation(Line(visible=true, points={{85.25,-78.5},{90.0,-78.5},{90.0,0.0},{105.0,0.0}}, color={255,0,255}));
        connect(setValve1.y,valve1) annotation(Line(visible=true, points={{83.0,82.5},{90.0,82.5},{90.0,60.0},{105.0,60.0}}, color={255,0,255}));
        connect(emptyTanks.outPort[1],T6.inPort) annotation(Line(visible=true, points={{42.5,-50.0},{51.0,-50.0}}));
        connect(T5.outPort,emptyTanks.inPort[1]) annotation(Line(visible=true, points={{5.5,-50.0},{21.0,-50.0}}));
        connect(makeProduct.outPort,T2.inPort) annotation(Line(visible=true, points={{10.5,40.0},{33.0,40.0}}));
        connect(T1.outPort,makeProduct.inPort) annotation(Line(visible=true, points={{-38.5,40.0},{-21.0,40.0}}));
        connect(s1.outPort[1],T1.inPort) annotation(Line(visible=true, points={{-51.5,40.0},{-44.0,40.0}}));
      end TankController;

      model MakeProduct
        extends StateGraph.PartialCompositeStep;
        annotation(Diagram(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        parameter StateGraph.Temporary.SetRealParameter limit=0.98 "Limit level of tank 1" annotation(Placement(visible=true, transformation(origin={-40.0,50.0}, extent={{-20.0,-10.0},{20.0,10.0}}, rotation=0)));
        parameter StateGraph.Temporary.SetRealParameter waitTime=3 "Wait time" annotation(Placement(visible=true, transformation(origin={-100.0,50.0}, extent={{-20.0,-10.0},{20.0,10.0}}, rotation=0)));
        Modelica.Blocks.Interfaces.RealInput level1 annotation(Placement(visible=true, transformation(origin={-170.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-170.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
        Step fillTank1 annotation(Placement(visible=true, transformation(origin={-130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T1(condition=level1 > limit) annotation(Placement(visible=true, transformation(origin={-100.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step fillTank2 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T3(condition=level1 < 0.001) annotation(Placement(visible=true, transformation(origin={30.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step emptyTank2 annotation(Placement(visible=true, transformation(origin={130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step wait1 annotation(Placement(visible=true, transformation(origin={-70.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T2(enableTimer=true, waitTime=waitTime) annotation(Placement(visible=true, transformation(origin={-40.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step wait2 annotation(Placement(visible=true, transformation(origin={64.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition T4(enableTimer=true, waitTime=waitTime) annotation(Placement(visible=true, transformation(origin={92.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      equation 
        connect(fillTank1.inPort[1],inPort) annotation(Line(visible=true, points={{-141.0,0.0},{-160.0,0.0}}));
        connect(fillTank1.outPort[1],T1.inPort) annotation(Line(visible=true, points={{-119.5,0.0},{-104.0,0.0}}));
        connect(fillTank2.outPort[1],T3.inPort) annotation(Line(visible=true, points={{10.5,0.0},{26.0,0.0}}));
        connect(emptyTank2.outPort[1],outPort) annotation(Line(visible=true, points={{140.5,0.0},{155.0,0.0}}));
        connect(wait1.outPort[1],T2.inPort) annotation(Line(visible=true, points={{-59.5,0.0},{-44.0,0.0}}));
        connect(T2.outPort,fillTank2.inPort[1]) annotation(Line(visible=true, points={{-38.5,0.0},{-11.0,0.0}}));
        connect(T1.outPort,wait1.inPort[1]) annotation(Line(visible=true, points={{-98.5,0.0},{-81.0,0.0}}));
        connect(wait2.outPort[1],T4.inPort) annotation(Line(visible=true, points={{74.5,0.0},{88.0,0.0}}));
        connect(T3.outPort,wait2.inPort[1]) annotation(Line(visible=true, points={{31.5,0.0},{53.0,0.0}}));
        connect(T4.outPort,emptyTank2.inPort[1]) annotation(Line(visible=true, points={{93.5,0.0},{119.0,0.0}}));
      end MakeProduct;

      connector inflow "Inflow connector (this is a copy from Isolde Dressler's master thesis project)"
        import Units = Modelica.SIunits;
        Units.VolumeFlowRate Fi "inflow";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,-100},{0,100},{100,-100},{-100,-100}}, lineColor={0,0,0}, lineThickness=0.5, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,-100},{0,100},{100,-100},{-100,-100}}, lineColor={0,0,0}, lineThickness=0.5, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}));
      end inflow;

      connector outflow "Outflow connector (this is a copy from Isolde Dressler's master thesis project)"
        import Units = Modelica.SIunits;
        Units.VolumeFlowRate Fo "outflow";
        Boolean open "valve open";
        annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{0,-100},{100,100},{-100,100}}, lineColor={0,0,0}, lineThickness=0.5, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{0,-100},{100,100},{-100,100}}, lineColor={0,0,0}, lineThickness=0.5, fillColor={255,255,255}, fillPattern=FillPattern.Solid)}));
      end outflow;

      model valve "Simple valve model (this is a copy from Isolde Dressler's master thesis project)"
        annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{0.0,-60.0},{0.0,0.0}}, color={255,0,255})}), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{20.0,20.0},{20.0,20.0}}, thickness=0.5),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-131.0,67.0},{136.0,125.0}}, textString="%name", fontName="Arial"),Line(visible=true, points={{0.0,0.0},{0.0,-60.0}}, color={255,0,255})}));
        Modelica.Blocks.Interfaces.BooleanInput valveControl annotation(Placement(visible=true, transformation(origin={0.0,-80.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90), iconTransformation(origin={0.0,-80.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90)));
        inflow inflow1 annotation(Placement(visible=true, transformation(origin={50.0,0.0}, extent={{-50.0,-50.0},{50.0,50.0}}, rotation=90), iconTransformation(origin={50.0,0.0}, extent={{-50.0,-50.0},{50.0,50.0}}, rotation=90)));
        outflow outflow1 annotation(Placement(visible=true, transformation(origin={-50.0,0.0}, extent={{-50.0,-50.0},{50.0,50.0}}, rotation=90), iconTransformation(origin={-50.0,0.0}, extent={{-50.0,-50.0},{50.0,50.0}}, rotation=90)));
      equation 
        outflow1.Fo=inflow1.Fi;
        outflow1.open=valveControl;
      end valve;

      model Tank "Simple tank model (this is a copy from Isolde Dressler's master thesis project)"
        Modelica.Blocks.Interfaces.RealOutput levelSensor annotation(Placement(visible=true, transformation(origin={-70.0,-20.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0), iconTransformation(origin={-70.0,-20.0}, extent={{10.0,-10.0},{-10.0,10.0}}, rotation=0)));
        inflow inflow1 annotation(Placement(visible=true, transformation(origin={-50.0,65.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={-50.0,65.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
        outflow outflow1 annotation(Placement(visible=true, transformation(origin={60.0,-45.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={60.0,-45.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
        annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-122.0,-82.0},{88.0,-42.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-60.0,-40.0},{80.0,60.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Real level "Tank level in % of max height";
        parameter Real A=1 "ground area of tank in m²";
        parameter Real a=0.2 "area of drain hole in m²";
        parameter Real hmax=1 "max height of tank in m";
        constant Real g=Modelica.Constants.g_n;
      equation 
        der(level)=(inflow1.Fi - outflow1.Fo)/(hmax*A);
        if outflow1.open then
          outflow1.Fo=sqrt(2*g*hmax*level)*a;
        else
          outflow1.Fo=0;
        end if;
        levelSensor=level;
      end Tank;

      model Source "Simple source model (this is a copy from Isolde Dressler's master thesis project)"
        outflow outflow1 annotation(Placement(visible=true, transformation(origin={0.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={0.0,-50.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        parameter Real maxflow=1 "maximal flow out of source";
        annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, lineThickness=0.5, extent={{-80.0,-10.0},{80.0,40.0}}),Text(visible=true, extent={{-144.0,54.0},{152.0,114.0}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      equation 
        if outflow1.open then
          outflow1.Fo=maxflow;
        else
          outflow1.Fo=0;
        end if;
      end Source;

      model CompositeStep
        extends StateGraph.PartialCompositeStep;
        annotation(Diagram(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Transition transition3(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-54.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition4(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-54.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step step3 annotation(Placement(visible=true, transformation(origin={0.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step step4 annotation(Placement(visible=true, transformation(origin={0.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition5(enableTimer=true, waitTime=2) annotation(Placement(visible=true, transformation(origin={46.0,60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition6(enableTimer=true, waitTime=2) annotation(Placement(visible=true, transformation(origin={46.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition4a(enableTimer=true, waitTime=1) annotation(Placement(visible=true, transformation(origin={-54.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step step4a annotation(Placement(visible=true, transformation(origin={0.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition6a(enableTimer=true, waitTime=2) annotation(Placement(visible=true, transformation(origin={46.0,-60.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step initStep annotation(Placement(visible=true, transformation(origin={-130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step exitStep annotation(Placement(visible=true, transformation(origin={130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Alternative Alternative1(nBranches=3) annotation(Placement(visible=true, transformation(origin={-2.0,0.0}, extent={{-98.0,-90.0},{98.0,90.0}}, rotation=0)));
      equation 
        connect(transition3.outPort,step3.inPort[1]) annotation(Line(visible=true, points={{-52.5,60.0},{-11.0,60.0}}));
        connect(step3.outPort[1],transition5.inPort) annotation(Line(visible=true, points={{10.5,60.0},{42.0,60.0}}));
        connect(transition4.outPort,step4.inPort[1]) annotation(Line(visible=true, points={{-52.5,0.0},{-11.0,0.0}}));
        connect(step4.outPort[1],transition6.inPort) annotation(Line(visible=true, points={{10.5,0.0},{42.0,0.0}}));
        connect(transition4a.outPort,step4a.inPort[1]) annotation(Line(visible=true, points={{-52.5,-60.0},{-11.0,-60.0}}));
        connect(step4a.outPort[1],transition6a.inPort) annotation(Line(visible=true, points={{10.5,-60.0},{42.0,-60.0}}));
        connect(initStep.inPort[1],inPort) annotation(Line(visible=true, points={{-141.0,0.0},{-160.0,0.0}}));
        connect(exitStep.outPort[1],outPort) annotation(Line(visible=true, points={{140.5,0.0},{155.0,0.0}}));
        connect(initStep.outPort[1],Alternative1.inPort) annotation(Line(visible=true, points={{-119.5,0.0},{-102.94,0.0}}));
        connect(Alternative1.outPort,exitStep.inPort[1]) annotation(Line(visible=true, points={{97.96,0.0},{119.0,0.0}}));
        connect(transition3.inPort,Alternative1.split[1]) annotation(Line(visible=true, points={{-58.0,60.0},{-79.42,0.0}}));
        connect(transition4.inPort,Alternative1.split[2]) annotation(Line(visible=true, points={{-58.0,0.0},{-67.975,0.0},{-67.975,-0.0},{-79.42,0.0}}));
        connect(transition4a.inPort,Alternative1.split[3]) annotation(Line(visible=true, points={{-58.0,-60.0},{-67.975,-60.0},{-67.975,-60.0},{-79.42,0.0}}));
        connect(transition5.outPort,Alternative1.join[1]) annotation(Line(visible=true, points={{47.5,60.0},{75.42,0.0}}));
        connect(transition6.outPort,Alternative1.join[2]) annotation(Line(visible=true, points={{47.5,0.0},{60.725,0.0},{60.725,-0.0},{75.42,0.0}}));
        connect(transition6a.outPort,Alternative1.join[3]) annotation(Line(visible=true, points={{47.5,-60.0},{60.725,-60.0},{60.725,-60.0},{75.42,0.0}}));
      end CompositeStep;

      model CompositeStep1
        extends PartialCompositeStep;
        Transition transition1(enableTimer=false, waitTime=0, condition=time > 8) annotation(Placement(visible=true, transformation(origin={-50.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step initStep annotation(Placement(visible=true, transformation(origin={-130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step exitStep annotation(Placement(visible=true, transformation(origin={120.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        annotation(Diagram(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        CompositeStep2 compositeStep11(waitTime=3) annotation(Placement(visible=true, transformation(origin={-5.0,30.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
        CompositeStep2 compositeStep12(waitTime=2) annotation(Placement(visible=true, transformation(origin={-5.0,-30.0}, extent={{-15.0,-15.0},{15.0,15.0}}, rotation=0)));
        Transition transition2(condition=time > 4, enableTimer=false, waitTime=0) annotation(Placement(visible=true, transformation(origin={-51.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition3(enableTimer=false, waitTime=0) annotation(Placement(visible=true, transformation(origin={39.0,30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Transition transition4(enableTimer=false, waitTime=0) annotation(Placement(visible=true, transformation(origin={39.0,-30.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Alternative Alternative1 annotation(Placement(visible=true, transformation(origin={-5.5,0.0}, extent={{-94.5,-60.0},{94.5,60.0}}, rotation=0)));
      equation 
        connect(exitStep.outPort[1],outPort) annotation(Line(visible=true, points={{130.5,0.0},{155.0,0.0}}));
        connect(initStep.inPort[1],inPort) annotation(Line(visible=true, points={{-141.0,0.0},{-160.0,0.0}}));
        connect(transition1.outPort,compositeStep11.inPort) annotation(Line(visible=true, origin={-34.75,30.0}, points={{-13.75,0.0},{13.75,0.0}}));
        connect(transition2.outPort,compositeStep12.inPort) annotation(Line(visible=true, origin={-35.25,-30.0}, points={{-14.25,0.0},{14.25,0.0}}));
        connect(compositeStep11.outPort,transition3.inPort) annotation(Line(visible=true, origin={22.75,30.0}, points={{-12.25,0.0},{12.25,0.0}}));
        connect(compositeStep12.outPort,transition4.inPort) annotation(Line(visible=true, origin={22.75,-30.0}, points={{-12.25,0.0},{12.25,0.0}}));
        connect(initStep.outPort[1],Alternative1.inPort) annotation(Line(visible=true, points={{-119.5,0.0},{-102.835,0.0}}));
        connect(Alternative1.outPort,exitStep.inPort[1]) annotation(Line(visible=true, points={{90.89,0.0},{109.0,0.0}}));
        connect(transition1.inPort,Alternative1.split[1]) annotation(Line(visible=true, points={{-54.0,30.0},{-80.155,0.0}}));
        connect(transition2.inPort,Alternative1.split[2]) annotation(Line(visible=true, points={{-55.0,-30.0},{-80.155,0.0}}));
        connect(transition3.outPort,Alternative1.join[1]) annotation(Line(visible=true, points={{40.5,30.0},{69.155,0.0}}));
        connect(transition4.outPort,Alternative1.join[2]) annotation(Line(visible=true, points={{40.5,-30.0},{69.155,0.0}}));
      end CompositeStep1;

      model CompositeStep2
        extends PartialCompositeStep;
        annotation(Diagram(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})), Icon(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
        Transition transition(enableTimer=true, waitTime=waitTime) annotation(Placement(visible=true, transformation(origin={-20.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step initStep annotation(Placement(visible=true, transformation(origin={-130.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        Step exitStep annotation(Placement(visible=true, transformation(origin={120.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
        parameter Temporary.SetRealParameter waitTime=2 "waiting time in this composite step" annotation(Placement(visible=true, transformation(origin={-65.0,40.0}, extent={{-15.0,-10.0},{15.0,10.0}}, rotation=0)));
      equation 
        connect(exitStep.outPort[1],outPort) annotation(Line(visible=true, points={{130.5,0.0},{155.0,0.0}}));
        connect(initStep.inPort[1],inPort) annotation(Line(visible=true, points={{-141.0,0.0},{-160.0,0.0}}));
        connect(initStep.outPort[1],transition.inPort) annotation(Line(visible=true, points={{-119.5,0.0},{-24.0,0.0}}));
        connect(transition.outPort,exitStep.inPort[1]) annotation(Line(visible=true, points={{-18.5,0.0},{109.0,0.0}}));
      end CompositeStep2;

    end Utilities;

    annotation(Documentation(info="<html>
  
</html>"));
  end Examples;

  package Interfaces "Connectors and partial models"
    extends Modelica.Icons.Library;
    connector Step_in "Input port of a step"
      output Boolean occupied "true, if step is active" annotation(Hide=true);
      input Boolean set "true, if transition fires and step is activated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillPattern=FillPattern.Solid, points={{0.0,50.0},{100.0,0.0},{0.0,-50.0},{0.0,50.0}}),Text(visible=true, origin={-20.5,80.0}, extent={{-120.5,-20.0},{120.5,20.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"));
    end Step_in;

    connector Step_out "Output port of a step"
      output Boolean available "true, if step is active" annotation(Hide=true);
      input Boolean reset "true, if transition fires and step is deactivated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-50.0},{0.0,50.0}}),Text(visible=true, origin={42.1245,80.0}, extent={{-142.1245,-20.0},{143.8755,22.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"));
    end Step_out;

    connector Transition_in "Input port of a transition"
      input Boolean available "true, if step connected to the transition input is active" annotation(Hide=true);
      output Boolean reset "true, if transition fires and the step connected to the transition input is deactivated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillPattern=FillPattern.Solid, points={{0.0,50.0},{100.0,0.0},{0.0,-50.0},{0.0,50.0}}),Text(visible=true, origin={-20.5,80.0}, extent={{-120.5,-20.0},{120.5,20.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"));
    end Transition_in;

    connector Transition_out "Output port of a transition"
      input Boolean occupied "true, if step connected to the transition output is active" annotation(Hide=true);
      output Boolean set "true, if transition fires and step connected to the transition output becomes active" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, origin={23.0,80.0}, extent={{-123.0,-20.0},{123.0,20.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-50.0},{0.0,50.0}})}), Documentation(info="<html>
 
</html>"));
    end Transition_out;

    connector CompositeStep_resume "Input port of a step (used for resume connector of a CompositeStep)"
      output Boolean occupied "true, if step is active" annotation(Hide=true);
      input Boolean set "true, if transition fires and step is activated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Polygon(points={{-100,100},{100,0},{-100,-100},{-100,100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={0,0,0})}), Documentation(info="<html>
  
</html>"));
    end CompositeStep_resume;

    connector CompositeStep_suspend "Output port of a step (used for suspend connector of a CompositeStep)"
      output Boolean available "true, if step is active" annotation(Hide=true);
      input Boolean reset "true, if transition fires and step is deactived" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}})}));
    end CompositeStep_suspend;

    connector CompositeStepStatePort_in "Communication port between a CompositeStep and the ordinary steps within the CompositeStep (suspend/resume are inputs)"
      annotation(structurallyIncomplete, Documentation(info="<html>
  
</html>"));
      input Boolean suspend "= true, if suspend transition of CompositeStep fires";
      input Boolean resume "= true, if resume transition of CompositeStep fires";
      flow output Real activeSteps "Number of active steps in the CompositeStep";
    end CompositeStepStatePort_in;

    connector CompositeStepStatePort_out "Communication port between a CompositeStep and the ordinary steps within the CompositeStep (suspend/resume are outputs)"
      annotation(structurallyIncomplete, Documentation(info="<html>
 
</html>"));
      output Boolean suspend "= true, if suspend transition of CompositeStep fires";
      output Boolean resume "= true, if resume transition of CompositeStep fires";
      flow input Real activeSteps "Number of active steps in the CompositeStep";
      annotation(Icon, Diagram);
    end CompositeStepStatePort_out;

    partial block PartialStep "Partial step with one input and one output transition port"
      annotation(structurallyIncomplete, Documentation(info="<html>
 
</html>"));
      parameter Integer nIn(min=0)=1 "Number of input connections";
      parameter Integer nOut(min=0)=1 "Number of output connections";
      output Boolean localActive "= true if step is active, otherwise the step is not active" annotation(Hide=true);
      Interfaces.Step_in inPort[nIn] "Vector of step input connectors" annotation(Placement(visible=true, transformation(origin={-110.0,0.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-110.0,0.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
      Interfaces.Step_out outPort[nOut] "Vector of step output connectors" annotation(Placement(visible=true, transformation(origin={105.0,0.0}, extent={{-5.0,5.0},{5.0,-5.0}}, rotation=0), iconTransformation(origin={105.0,0.0}, extent={{-5.0,5.0},{5.0,-5.0}}, rotation=0)));
    protected 
      outer Interfaces.CompositeStepState stateGraphRoot;
      CompositeStepStatePort_in subgraphStatePort;
      Boolean newActive "Value of active in the next iteration" annotation(Hide=true);
      Boolean oldActive "Value of active when CompositeStep was aborted";
    initial equation 
      pre(newActive)=pre(localActive);
      pre(oldActive)=pre(localActive);
    equation 
      connect(subgraphStatePort,stateGraphRoot.subgraphStatePort);
      for i in 1:nIn loop
        assert(cardinality(inPort[i]) <= 1, "Connector inPort[" + String(i) + "] of the step is connected to more than one transition");
      end for;
      for i in 1:nOut loop
        assert(cardinality(outPort[i]) <= 1, "Connector outPort[" + String(i) + "] of the step is connected to more than one transition");
      end for;
      localActive=pre(newActive);
      newActive=if subgraphStatePort.resume then oldActive else (StateGraph.Temporary.anyTrue(inPort.set) or localActive and not StateGraph.Temporary.anyTrue(outPort.reset)) and not subgraphStatePort.suspend;
      when subgraphStatePort.suspend then
        oldActive=localActive;
      end when;
      subgraphStatePort.activeSteps=if localActive then 1.0 else 0.0;
      for i in 1:nIn loop
        inPort[i].occupied=if i == 1 then localActive else inPort[i - 1].occupied or inPort[i - 1].set;
      end for;
      for i in 1:nOut loop
        outPort[i].available=if i == 1 then localActive else outPort[i - 1].available and not outPort[i - 1].reset;
      end for;
      for i in 1:nIn loop
        if cardinality(inPort[i]) == 0 then
          inPort[i].set=false;
        end if;
      end for;
      for i in 1:nOut loop
        if cardinality(outPort[i]) == 0 then
          outPort[i].reset=false;
        end if;
      end for;
      annotation(Icon);
    end PartialStep;

    partial block PartialTransition "Partial transition with input and output connections"
      input Boolean localCondition "= true, if transition may fire" annotation(Hide=true);
      parameter Boolean enableTimer=false "= true, if timer is enabled" annotation(Dialog(group="Timer"), Evaluate=true);
      parameter Modelica.SIunits.Time waitTime(min=0)=0 "Wait time before transition fires" annotation(Dialog(group="Timer", enable=enableTimer));
      output Modelica.SIunits.Time t "= actual waiting time (transition will fire when t > waitTime)";
      output Boolean enableFire "= true, if all firing conditions are true";
      output Boolean fire "= true, if transition fires" annotation(Hide=true);
      StateGraph.Interfaces.Transition_in inPort "Vector of transition input connectors" annotation(Placement(visible=true, transformation(origin={-40.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={-40.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
      StateGraph.Interfaces.Transition_out outPort "Vector of transition output connectors" annotation(Placement(visible=true, transformation(origin={15.0,0.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0), iconTransformation(origin={15.0,0.0}, extent={{-5.0,-5.0},{5.0,5.0}}, rotation=0)));
    protected 
      Modelica.SIunits.Time t_start "Time instant at which the transition would fire, if waitTime would be zero";
      Real t_dummy;
    initial equation 
      pre(enableFire)=false;
    equation 
      assert(cardinality(inPort) == 1, "Connector inPort is not connected to exactly one other connector");
      assert(cardinality(outPort) == 1, "Connector outPort is not connected to exactly one other connector");
      if enableTimer then
        when enableFire then
          t_start=time;
        end when;
        t_dummy=time - t_start;
        t=if enableFire then t_dummy else 0;
        fire=enableFire and time >= t_start + waitTime;
      else
        t_start=0;
        t_dummy=0;
        t=0;
        fire=enableFire;
      end if;
      enableFire=localCondition and inPort.available and not outPort.occupied;
      inPort.reset=fire;
      outPort.set=fire;
      annotation(Icon, Documentation(info="<html>
 
</html>"));
    end PartialTransition;

    partial block PartialStateGraphIcon "Icon for a StateGraph object"
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, fillPattern=FillPattern.Solid, extent={{-160.0,110.0},{160.0,150.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
 
</html>"));
    end PartialStateGraphIcon;

    block CompositeStepState "Communication channel between CompositeSteps and steps in the CompositeStep"
      output Boolean suspend=false;
      output Boolean resume=false;
      StateGraph.Interfaces.CompositeStepStatePort_out subgraphStatePort;
      annotation(defaultComponentName="stateGraphRoot", defaultComponentPrefixes="inner", missingInnerMessage="A \"stateGraphRoot\" component was automatically introduced.", Documentation(info="<html>
 
</html>"));
    equation 
      suspend=subgraphStatePort.suspend;
      resume=subgraphStatePort.resume;
    end CompositeStepState;

    annotation(Documentation(info="<html>
 
</html>"));
  end Interfaces;

  block InitialStep "Initial step (= step that is active when simulation starts)"
    output Boolean active "= true if step is active, otherwise the step is not active";
    extends Interfaces.PartialStep(localActive=active);
    annotation(structurallyIncomplete, Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-100.0,-100.0},{100.0,100.0}}),Rectangle(visible=true, extent={{-80.0,-80.0},{80.0,80.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200,110},{200,150}}, textString="%name"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Rectangle(visible=true, extent={{-80,-80},{80,80}})}));
  initial equation 
    active=true;
  end InitialStep;

  block InitialStepWithSignal "Initial step (= step that is active when simulation starts). Connector 'active' is true when the step is active"
    extends Interfaces.PartialStep(localActive=active);
    annotation(structurallyIncomplete, Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,110.0},{200.0,150.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, extent={{-92.0,-68.0},{94.0,-50.0}}, textString="active", fontName="Arial"),Rectangle(visible=true, extent={{-80.0,-80.0},{80.0,80.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
    Modelica.Blocks.Interfaces.BooleanOutput active annotation(Placement(visible=true, transformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90), iconTransformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90)));
  initial equation 
    active=true;
  end InitialStepWithSignal;

  block Step "Ordinary step (= step that is not active when simulation starts)"
    output Boolean active "= true if step is active, otherwise the step is not active";
    extends Interfaces.PartialStep(localActive=active);
    annotation(structurallyIncomplete, Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-100.0,-100.0},{100.0,100.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200,110},{200,150}}, textString="%name"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}})}));
  initial equation 
    active=false;
  end Step;

  block StepWithSignal "Ordinary step (= step that is not active when simulation starts). Connector 'active' is true when the step is active"
    extends Interfaces.PartialStep(localActive=active);
    annotation(structurallyIncomplete, Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-100.0,-100.0},{100.0,100.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,110.0},{200.0,150.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, extent={{-92.0,-92.0},{94.0,-74.0}}, textString="active", fontName="Arial")}));
    Modelica.Blocks.Interfaces.BooleanOutput active annotation(Placement(visible=true, transformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90), iconTransformation(origin={0.0,-110.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=-90)));
  initial equation 
    active=false;
  end StepWithSignal;

  block Transition "Transition where the fire condition is set by a modification of variable condition"
    input Boolean condition=true "= true, if transition may fire (time varying expression)" annotation(Dialog(group="Fire condition"));
    extends Interfaces.PartialTransition(final localCondition=condition);
    annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-31.0,0.0},{-11.0,0.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-10.0,-100.0},{10.0,100.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-10,-100},{10,100}}),Line(visible=true, points={{-30,0},{-10,0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200,110},{200,150}}, textString="%name"),Text(visible=true, extent={{20,20},{200,45}}, textString="%waitTime"),Text(visible=true, extent={{-200,-145},{200,-120}}, textString="%condition")}));
  end Transition;

  block TransitionWithSignal "Transition where the fire condition is set by a Boolean input signal"
    Modelica.Blocks.Interfaces.BooleanInput condition annotation(Placement(visible=true, transformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90), iconTransformation(origin={0.0,-120.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=90)));
    extends Interfaces.PartialTransition(final localCondition=condition);
    annotation(Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-31.0,0.0},{-11.0,0.0}}),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-10.0,-100.0},{10.0,100.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{20.0,20.0},{200.0,45.0}}, textString="%waitTime", fontName="Arial"),Rectangle(visible=true, fillPattern=FillPattern.Solid, extent={{-10.0,-100.0},{10.0,100.0}}),Line(visible=true, points={{-30.0,0.0},{-10.0,0.0}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200.0,110.0},{200.0,150.0}}, textString="%name", fontName="Arial"),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-7.0,-95.0},{7.0,-81.0}})}));
  end TransitionWithSignal;

  block Alternative "Alternative splitting of execution path (use component between two steps)"
    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-80.0,100.0},{80.0,100.0}}, pattern=LinePattern.Dot),Line(visible=true, points={{-80.0,-100.0},{80.0,-100.0}}, pattern=LinePattern.Dot),Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}),Line(visible=true, points={{80.0,0.0},{100.0,0.0}})}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}),Line(visible=true, points={{80.0,0.0},{100.0,0.0}})}), Documentation(info="<html>
  
</html>"));
    parameter Integer nBranches(min=1)=2 "Number of alternative branches";
    Interfaces.Transition_in inPort annotation(Placement(visible=true, transformation(origin={-103.0,0.0}, extent={{-3.0,-3.0},{3.0,3.0}}, rotation=0), iconTransformation(origin={-103.0,0.0}, extent={{-3.0,-3.0},{3.0,3.0}}, rotation=0)));
    Interfaces.Transition_out outPort annotation(Placement(visible=true, transformation(origin={102.0,0.0}, extent={{-2.0,-2.0},{2.0,2.0}}, rotation=0), iconTransformation(origin={102.0,0.0}, extent={{-2.0,-2.0},{2.0,2.0}}, rotation=0)));
    Step_in_forAlternative join[nBranches] annotation(Placement(visible=true, transformation(origin={79.0,0.0}, extent={{-1.0,100.0},{1.0,-100.0}}, rotation=0), iconTransformation(origin={79.0,0.0}, extent={{-1.0,100.0},{1.0,-100.0}}, rotation=0)));
    Step_out_forAlternative split[nBranches] annotation(Placement(visible=true, transformation(origin={-79.0,0.0}, extent={{1.0,100.0},{-1.0,-100.0}}, rotation=0), iconTransformation(origin={-79.0,0.0}, extent={{1.0,100.0},{-1.0,-100.0}}, rotation=0)));
  protected 
    connector Step_in_forAlternative "Input port of a step (has special icon for usage in component 'Alternative')"
      output Boolean occupied "true, if step is active" annotation(Hide=true);
      input Boolean set "true, if transition fires and step is activated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160})}));
    end Step_in_forAlternative;

    connector Step_out_forAlternative "Output port of a step (has special icon for usage in component 'Alternative')"
      output Boolean available "true, if step is active" annotation(Hide=true);
      input Boolean reset "true, if transition fires and step is deactivated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160})}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={160,160,160})}));
    end Step_out_forAlternative;

  equation 
    assert(cardinality(inPort) == 1, "Connector inPort is not connected to exactly one other connector");
    assert(cardinality(outPort) == 1, "Connector outPort is not connected to exactly one other connector");
    for i in 1:nBranches loop
      assert(cardinality(split[i]) == 1, "Connector split[" + String(i) + "] is not connected to exactly one other connector");
      assert(cardinality(join[i]) == 1, "Connector join[" + String(i) + "] is not connected to exactly one other connector");
    end for;
    for i in 1:nBranches loop
      split[i].available=if i == 1 then inPort.available else split[i - 1].available and not split[i - 1].reset;
    end for;
    join.occupied=fill(outPort.occupied, nBranches);
    inPort.reset=StateGraph.Temporary.anyTrue(split.reset);
    outPort.set=StateGraph.Temporary.anyTrue(join.set);
  end Alternative;

  block Parallel "Parallel splitting of execution path (use component between two transitions)"
    annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}),Line(visible=true, points={{80.0,0.0},{100.0,0.0}}),Line(visible=true, points={{-80.0,100.0},{80.0,100.0}}, pattern=LinePattern.Dot),Line(visible=true, points={{-80.0,-100.0},{80.0,-100.0}}, pattern=LinePattern.Dot)}), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-100.0,0.0},{-80.0,0.0}}),Line(visible=true, points={{80.0,0.0},{100.0,0.0}})}), Documentation(info="<html>
  
</html>"));
    parameter Integer nBranches(min=1)=2 "Number of parallel branches that are executed in parallel";
    Interfaces.Step_in inPort annotation(Placement(visible=true, transformation(origin={-103.0,0.0}, extent={{-3.0,-3.0},{3.0,3.0}}, rotation=0), iconTransformation(origin={-103.0,0.0}, extent={{-3.0,-3.0},{3.0,3.0}}, rotation=0)));
    Interfaces.Step_out outPort annotation(Placement(visible=true, transformation(origin={102.0,0.0}, extent={{-2.0,-2.0},{2.0,2.0}}, rotation=0), iconTransformation(origin={102.0,0.0}, extent={{-2.0,-2.0},{2.0,2.0}}, rotation=0)));
    Transition_in_forParallel join[nBranches] annotation(Placement(visible=true, transformation(origin={77.5,0.0}, extent={{-2.5,100.0},{2.5,-100.0}}, rotation=0), iconTransformation(origin={77.5,0.0}, extent={{-2.5,100.0},{2.5,-100.0}}, rotation=0)));
    Transition_out_forParallel split[nBranches] annotation(Placement(visible=true, transformation(origin={-77.5,0.0}, extent={{2.5,100.0},{-2.5,-100.0}}, rotation=0), iconTransformation(origin={-77.5,0.0}, extent={{2.5,100.0},{-2.5,-100.0}}, rotation=0)));
  protected 
    connector Transition_in_forParallel "Input port of a transition (has special icon for usage in component 'Parallel')"
      input Boolean available "true, if step connected to the transition input is active" annotation(Hide=true);
      output Boolean reset "true, if transition fires and the step connected to the transition input is deactivated" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Rectangle(extent={{-100,100},{100,-100}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{-100,100},{-100,-100}}, color={0,0,0}, thickness=0.5),Line(points={{100,100},{100,-100}}, color={0,0,0}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={255,255,255}, fillColor={255,255,255}),Line(points={{-100,100},{-100,-100}}, color={0,0,0}, thickness=0.5),Line(points={{100,100},{100,-100}}, color={0,0,0}, thickness=0.5)}));
    end Transition_in_forParallel;

    connector Transition_out_forParallel "Output port of a transition (has special icon for usage in component 'Parallel')"
      input Boolean occupied "true, if step connected to the transition output is active" annotation(Hide=true);
      output Boolean set "true, if transition fires and step connected to the transition output becomes active" annotation(Hide=true);
      annotation(Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={0,0,0}, fillColor={255,255,255}),Rectangle(extent={{-100,100},{100,-100}}, lineColor={255,255,255}, fillColor={255,255,255}, fillPattern=FillPattern.Solid),Line(points={{-100,100},{-100,-100}}, color={0,0,0}, thickness=0.5),Line(points={{100,100},{100,-100}}, color={0,0,0}, thickness=0.5)}), Diagram(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(extent={{-100,100},{100,-100}}, fillPattern=FillPattern.Solid, lineColor={255,255,255}, fillColor={255,255,255}),Line(points={{-100,100},{-100,-100}}, color={0,0,0}, thickness=0.5),Line(points={{100,100},{100,-100}}, color={0,0,0}, thickness=0.5)}));
    end Transition_out_forParallel;

  equation 
    assert(cardinality(inPort) == 1, "Connector inPort is not connected to exactly one other connector");
    assert(cardinality(outPort) == 1, "Connector outPort is not connected to exactly one other connector");
    for i in 1:nBranches loop
      assert(cardinality(split[i]) == 1, "Connector split[" + String(i) + "] is not connected to exactly one other connector");
      assert(cardinality(join[i]) == 1, "Connector join[" + String(i) + "] is not connected to exactly one other connector");
    end for;
    split.set=fill(inPort.set, nBranches);
    join.reset=fill(outPort.reset, nBranches);
    inPort.occupied=StateGraph.Temporary.anyTrue(split.occupied);
    outPort.available=StateGraph.Temporary.allTrue(join.available);
  end Parallel;

  partial block PartialCompositeStep "Superclass of a subgraph, i.e., a composite step that has internally a StateGraph"
    parameter Integer nSuspend=1 "Number of suspend ports" annotation(Dialog(group="Exception connections"));
    parameter Integer nResume=1 "Number of resume ports" annotation(Dialog(group="Exception connections"));
    inner outer StateGraph.Interfaces.CompositeStepState stateGraphRoot(suspend=StateGraph.Temporary.anyTrue(suspend.reset) or outerState.subgraphStatePort.suspend, resume=StateGraph.Temporary.anyTrue(resume.set) or outerState.subgraphStatePort.resume) "Communication port between the CompositeStep and the steps within the CompositeStep";
    output Boolean active "= true if step is active, otherwise the step is not active";
    annotation(structurallyIncomplete, Diagram(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, extent={{-150.0,-150.0},{150.0,150.0}})}), Documentation(info="<html>
  
</html>"), Icon(coordinateSystem(extent={{-150.0,-150.0},{150.0,150.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-250.0,160.0},{250.0,200.0}}, textString="%name", fontName="Arial"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-150.0,-150.0},{150.0,150.0}}),Text(visible=true, extent={{4.0,-130.0},{145.0,-115.0}}, textString="resume", fontName="Arial"),Text(visible=true, extent={{-144.0,-129.0},{-3.0,-114.0}}, textString="suspend", fontName="Arial")}));
    block OuterState
      Interfaces.CompositeStepStatePort_in subgraphStatePort "port connected to outer stateGraphRoot";
    end OuterState;

    OuterState outerState;
    StateGraph.Interfaces.Step_in inPort annotation(Placement(visible=true, transformation(origin={-160.0,0.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0), iconTransformation(origin={-160.0,0.0}, extent={{-10.0,10.0},{10.0,-10.0}}, rotation=0)));
    StateGraph.Interfaces.Step_out outPort annotation(Placement(visible=true, transformation(origin={155.0,0.0}, extent={{-5.0,5.0},{5.0,-5.0}}, rotation=0), iconTransformation(origin={155.0,0.0}, extent={{-5.0,5.0},{5.0,-5.0}}, rotation=0)));
    StateGraph.Interfaces.CompositeStep_suspend suspend[nSuspend] annotation(Placement(visible=true, transformation(origin={-75.0,-155.0}, extent={{5.0,-5.0},{-5.0,5.0}}, rotation=90), iconTransformation(origin={-75.0,-155.0}, extent={{5.0,-5.0},{-5.0,5.0}}, rotation=90)));
    StateGraph.Interfaces.CompositeStep_resume resume[nResume] annotation(Placement(visible=true, transformation(origin={75.0,-160.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90), iconTransformation(origin={75.0,-160.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=90)));
  protected 
    model InnerState
      outer Interfaces.CompositeStepState stateGraphRoot;
    end InnerState;

    InnerState innerState;
    Boolean newActive "Value of active in the next iteration" annotation(Hide=true);
    Integer activeSteps "Number of active steps within the CompositeStep";
  initial equation 
    pre(newActive)=pre(active);
  equation 
    connect(outerState.subgraphStatePort,stateGraphRoot.subgraphStatePort);
    outerState.subgraphStatePort.activeSteps=if active then 1.0 else 0.0;
    activeSteps=-integer(innerState.stateGraphRoot.subgraphStatePort.activeSteps);
    active=pre(newActive);
    newActive=activeSteps > 0 and not StateGraph.Temporary.anyTrue(suspend.reset) and not outerState.subgraphStatePort.suspend or StateGraph.Temporary.anyTrue(resume.set) or outerState.subgraphStatePort.resume;
    for i in 1:nResume loop
      resume[i].occupied=if i == 1 then active else resume[i - 1].occupied or resume[i - 1].set;
    end for;
    for i in 1:nSuspend loop
      suspend[i].available=if i == 1 then active else suspend[i - 1].available and not suspend[i - 1].reset;
    end for;
    for i in 1:nSuspend loop
      assert(cardinality(suspend[i]) <= 1, "Connector suspend[" + String(i) + "] of the CompositeStep is connected to more than one transition");
      if cardinality(suspend[i]) == 0 then
        suspend[i].reset=false;
      end if;
    end for;
    for i in 1:nResume loop
      assert(cardinality(resume[i]) <= 1, "Connector resume[" + String(i) + "] of the CompositeStep is connected to more than one transition");
      if cardinality(resume[i]) == 0 then
        resume[i].set=false;
      end if;
    end for;
    if cardinality(inPort) < 2 then
      inPort.occupied=false;
      inPort.set=false;
    end if;
    if cardinality(outPort) < 2 then
      outPort.available=false;
      outPort.reset=false;
    end if;
    assert(cardinality(inPort) <= 2, "Connector inPort of the CompositeStep has more than 2 connections. It should have only one connection from the outside to the inPort and one connection to a step inside the CompositeStep.");
    assert(cardinality(outPort) <= 2, "Connector outPort of the CompositeStep has more than 2 connections. It should have only one connection from the outPort to the outside to the CompositeStep and one connection from a step inside the CompositeStep to the outPort connector.");
  end PartialCompositeStep;

  block StateGraphRoot "Root of a StateGraph (has to be present on the highest level of a StateGraph)"
    extends StateGraph.Interfaces.CompositeStepState;
    output Integer activeSteps "Number of active steps within the stategraph";
    annotation(defaultComponentName="stateGraphRoot", defaultComponentPrefixes="inner", Documentation(info="<html>
<p>
On the highest level of a StateGraph, an instance of StateGraphRoot
has to be present. 
Practically, this means that it need not be present in a
StateGraph model.
</p>
<p>
The StateGraphRoot object is needed, since all Step objects have
an \"outer\" reference to communicate with the \"nearest\" CompositeStep
(which inherits from PartialCompositeStep), especially to abort
a CompositeStep via the \"suspend\" port. Even if no \"CompositeStep\" is present,
on highest level a corresponding \"inner\" definition is needed
and is provided by the StateGraphRoot object.
</p>
</html>", revisions=""), Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-200,110},{200,150}}, textString="%name"),Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-92,34},{96,78}}, textString="root"),Rectangle(visible=true, extent={{-82,-40},{-44,-6}}),Line(visible=true, points={{0,10},{0,-60}}),Rectangle(visible=true, extent={{48,-40},{86,-6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-12,-16},{0,-22},{-12,-28},{-12,-16}}),Line(visible=true, points={{-44,-22},{-12,-22}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{36,-16},{48,-22},{36,-28},{36,-16}}),Line(visible=true, points={{0,-22},{36,-22}})}));
  equation 
    activeSteps=-integer(subgraphStatePort.activeSteps);
  end StateGraphRoot;

  package Temporary "Components that will be provided by other libraries in the future"
    type SetRealParameter= Real "Define Real parameter (GUI not yet satisfactory)" annotation(Dialog, defaultComponentName="name", defaultComponentPrefixes="parameter", Icon(coordinateSystem(extent={{-100,-100},{100,100}}), graphics={Rectangle(visible=true, fillColor={210,210,210}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100,-40},{100,40}}),Text(visible=true, extent={{-150,50},{150,90}}, textString="%name ="),Text(visible=true, extent={{-96,-15},{96,15}}, textString="%value")}), Documentation(info="<html>
<p>
This is an <b>experimental component</b> to define a 
<b>Real parameter</b>
in the <b>diagram layer</b>. The idea is to drag the icon from the 
package browser into the diagram layer. Then a window pops
up in which the properties of this parameter can be defined
(such as the default value). The name and default value of the
parameter are displayed in the icon of this component. Whenever
clicking on it, the dialog to change parameter settings pops-up.
</p>
<p>
In Dymola, the described property is not fully available.
Currently, when dragging this component in the diagram layer,
a dialog pops up in which the properties of the parameter
can be defined. However, afterwards, the parameter is not
visible in the diagram layer. Making it visible requires to
go into the text layer and add an annotation with the
component size, resulting for example in:
</p>
<pre>
  <b>parameter</b> StateGraph.SetRealParameter name = 2 
                       <b>annotation</b>(extent=[-10,-10; 10,10]);
</pre>
<p>
This change makes the parameter icon visible in the
diagram layer. However, clicking on this icon has no
effect. Changing parameter properties, such as the default
value, still requires to go in to the text layer.
</p>
</html>"));
    extends Modelica.Icons.Library;
    function anyTrue "Returns true, if at least on element of the Boolean input vector is true"
      extends Modelica.Icons.Function;
      input Boolean b[:];
      output Boolean result;
    algorithm 
      result:=false;
      for i in 1:size(b, 1) loop
        result:=result or b[i];
      end for;
      annotation(Documentation(info="<html>
  
</html>"));
    end anyTrue;

    function allTrue "Returns true, if all elements of the Boolean input vector are true"
      extends Modelica.Icons.Function;
      input Boolean b[:];
      output Boolean result;
    algorithm 
      result:=true;
      for i in 1:size(b, 1) loop
        result:=result and b[i];
      end for;
      annotation(Documentation(info="<html>
  
</html>"));
    end allTrue;

    block RadioButton "Button that sets its output to true when pressed and is reset when an element of 'reset' becomes true"
      parameter Modelica.SIunits.Time buttonTimeTable[:]={0} "Time instants where button is pressend and released";
      input Boolean reset[:]={false} "Reset button to false, if an element of reset becomes true" annotation(Dialog(group="Time varying expressions"));
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={210,210,210}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, extent={{-80.0,-40.0},{80.0,40.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Blocks.Interfaces.BooleanOutput on annotation(Placement(visible=true, transformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0), iconTransformation(origin={110.0,0.0}, extent={{-10.0,-10.0},{10.0,10.0}}, rotation=0)));
    protected 
      Modelica.Blocks.Sources.BooleanTable table(table=buttonTimeTable);
    algorithm 
      on:=table.y;
      when pre(reset) then
              on:=false;
      end when;
    end RadioButton;

    model NumericValue "Show value of Real input signal dynamically"
      parameter Integer precision(min=0)=3 "Number of significant digits to be shown";
      parameter Boolean hideConnector=false "= true, if connector is not shown in the dynamic object diagram";
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, fillColor={236,233,216}, pattern=LinePattern.None, fillPattern=FillPattern.Solid, lineThickness=4, borderPattern=BorderPattern.Raised, extent={{-100.0,-50.0},{100.0,50.0}})}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Blocks.Interfaces.RealInput Value "Real value to be shown in icon" annotation(Placement(visible=true, transformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
    end NumericValue;

    model IndicatorLamp "Dynamically show Boolean input signal (false/true = white/green color)"
      annotation(Icon(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Sphere, extent={{-100.0,-100.0},{100.0,100.0}}),Text(visible=true, extent={{-150.0,110.0},{150.0,150.0}}, textString="%name", fontName="Arial")}), Documentation(info="<html>
  
</html>"), Diagram(coordinateSystem(extent={{-100.0,-100.0},{100.0,100.0}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
      Modelica.Blocks.Interfaces.BooleanInput u annotation(Placement(visible=true, transformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0), iconTransformation(origin={-120.0,0.0}, extent={{-20.0,-20.0},{20.0,20.0}}, rotation=0)));
    end IndicatorLamp;

    annotation(Documentation(info="<html>
<p>
This library is just temporarily present. The components of
this library will be present in the future in the Modelica
standard library (with the new block connectors) and in the
UserInteraction library that is currently under development.
</p>
</html>"));
  end Temporary;

end StateGraph;
