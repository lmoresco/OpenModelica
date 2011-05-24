within Modelica;
package Icons "Icon definitions"
  annotation(preferedView="info", Documentation(info="<html>
<p>
This package contains definitions for the graphical layout of
components which may be used in different libraries.
The icons can be utilized by inheriting them in the desired class
using \"extends\".
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
</html>"), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,135}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial"),Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={160,160,160}, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{-64,-20},{-50,-4},{50,-4},{36,-20},{-64,-20},{-64,-20}}),Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-64,-84},{36,-20}}),Text(visible=true, fillColor={128,128,128}, extent={{-60,-38},{32,-24}}, textString="Library", fontName="Arial"),Polygon(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, points={{50,-4},{50,-70},{36,-84},{36,-20},{50,-4}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  partial model Info "Icon for an information class"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-100,-90},{80,80}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-100,80},{-90,90},{90,90},{80,80},{-100,80}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{80,-90},{90,-80},{90,90},{80,80},{80,-90}}),Text(visible=true, extent={{-80,-70},{60,70}}, textString="Info", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, lineColor={0,0,255}, extent={{-100,-90},{80,80}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{-100,80},{-90,90},{90,90},{80,80},{-100,80}}),Polygon(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, points={{80,-90},{90,-80},{90,90},{80,80},{80,-90}}),Text(visible=true, extent={{-80,-70},{60,70}}, textString="Info", fontName="Arial")}));
  end Info;

  partial package Library "Icon for library"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, extent={{-85,-85},{65,35}}, textString="Library", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,122}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Library;

  partial package Library2 "Icon for library where additional icon elements shall be added"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={235,235,235}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={210,210,210}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={255,0,0}, extent={{-120,70},{120,125}}, textString="%name", fontName="Arial"),Text(visible=true, fillColor={160,160,160}, fillPattern=FillPattern.Solid, extent={{-90,10},{70,40}}, textString="Library", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Library2;

  partial model Example "Icon for an example model"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{80,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{-100,50},{-80,70},{100,70},{80,50},{-100,50}}),Polygon(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, points={{100,70},{100,-80},{80,-100},{80,50},{100,70}}),Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-85,-85},{65,35}}, textString="Example", fontName="Arial"),Text(visible=true, fillColor={255,0,0}, extent={{-120,73},{120,132}}, textString="%name", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Example;

  partial function Function "Icon for a function"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, fillColor={0,0,255}, fillPattern=FillPattern.Solid, extent={{-140,102},{136,162}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={255,127,0}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={255,127,0}, extent={{-100,-100},{100,100}}, textString="f", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Function;

  partial record Record "Icon for a record"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,127}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,50}}),Text(visible=true, extent={{-127,55},{127,115}}, textString="%name", fontName="Arial"),Line(visible=true, points={{-100,-50},{100,-50}}),Line(visible=true, points={{-100,0},{100,0}}),Line(visible=true, points={{0,50},{0,-100}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Record;

  partial class Enumeration "Icon for an enumeration (emulated by a package)"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Text(visible=true, extent={{-138,104},{138,164}}, textString="%name", fontName="Arial"),Ellipse(visible=true, lineColor={255,0,127}, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, fillColor={255,0,127}, extent={{-100,-100},{100,100}}, textString="e", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end Enumeration;

  type TypeReal "Icon for a Real type"
    extends Real;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-94,-94},{94,94}}, textString="R", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end TypeReal;

  type TypeInteger "Icon for an Integer type"
    extends Integer;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-94,-94},{94,94}}, textString="I", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end TypeInteger;

  type TypeBoolean "Icon for a Boolean type"
    extends Boolean;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-94,-94},{94,94}}, textString="B", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end TypeBoolean;

  type TypeString "Icon for a String type"
    extends String;
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, fillPattern=FillPattern.Solid, extent={{-100,-100},{100,100}}),Text(visible=true, extent={{-94,-94},{94,94}}, textString="S", fontName="Arial")}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end TypeString;

  partial model TranslationalSensor "Icon representing translational measurement device"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-60},{70,20}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{0,-40},{-10,-16},{10,-16},{0,-40}}),Line(visible=true, points={{0,0},{0,-16}}),Line(visible=true, points={{-70,0},{0,0}}),Line(visible=true, points={{-50,-40},{-50,-60}}),Line(visible=true, points={{-30,-40},{-30,-60}}),Line(visible=true, points={{-10,-40},{-10,-60}}),Line(visible=true, points={{10,-40},{10,-60}}),Line(visible=true, points={{30,-40},{30,-60}}),Line(visible=true, points={{50,-40},{50,-60}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-60},{70,20}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{0,-40},{-10,-16},{10,-16},{0,-40}}),Line(visible=true, points={{0,0},{0,-16}}),Line(visible=true, points={{-70,0},{0,0}}),Line(visible=true, points={{-50,-40},{-50,-60}}),Line(visible=true, points={{-30,-40},{-30,-60}}),Line(visible=true, points={{-10,-40},{-10,-60}}),Line(visible=true, points={{10,-40},{10,-60}}),Line(visible=true, points={{30,-40},{30,-60}}),Line(visible=true, points={{50,-40},{50,-60}})}));
  end TranslationalSensor;

  partial model RotationalSensor "Icon representing rotational measurement device"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Ellipse(visible=true, fillColor={255,255,255}, fillPattern=FillPattern.Solid, extent={{-70,-70},{70,70}}),Line(visible=true, points={{0,70},{0,40}}),Line(visible=true, points={{22.9,32.8},{40.2,57.3}}),Line(visible=true, points={{-22.9,32.8},{-40.2,57.3}}),Line(visible=true, points={{37.6,13.7},{65.8,23.9}}),Line(visible=true, points={{-37.6,13.7},{-65.8,23.9}}),Line(visible=true, points={{0,0},{9.02,28.6}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-0.48,31.6},{18,26},{18,57.2},{-0.48,31.6}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-5},{5,5}})}));
  end RotationalSensor;

  partial model GearIcon "Icon for gearbox"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{-90,-10},{-60,10}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{-60,10},{-60,20},{-40,40},{-40,-40},{-60,-20},{-60,10}}),Rectangle(visible=true, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{-40,-60},{40,60}}),Polygon(visible=true, lineColor={128,128,128}, fillColor={128,128,128}, fillPattern=FillPattern.Solid, points={{60,20},{40,40},{40,-40},{60,-20},{60,20}}),Rectangle(visible=true, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{60,-10},{90,10}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-60,-90},{-50,-90},{-20,-30},{20,-30},{48,-90},{60,-90},{60,-100},{-60,-100},{-60,-90}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end GearIcon;

  partial model MotorIcon "Icon for electrical motor"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Rectangle(visible=true, fillColor={255,0,0}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{-100,-50},{30,50}}),Polygon(visible=true, fillPattern=FillPattern.Solid, points={{-100,-90},{-90,-90},{-60,-20},{-10,-20},{20,-90},{30,-90},{30,-100},{-100,-100},{-100,-90}}),Rectangle(visible=true, fillColor={192,192,192}, pattern=LinePattern.None, fillPattern=FillPattern.HorizontalCylinder, extent={{30,-10},{90,10}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10})));
  end MotorIcon;

  connector SignalBus "Icon for signal bus"
    annotation(Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-16,2},{16,2}}, thickness=0.5),Polygon(visible=true, fillColor={255,204,51}, fillPattern=FillPattern.Solid, points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,-40},{-100,30}}, smooth=Smooth.Bezier),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-65,15},{-55,25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,15},{5,25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{55,15},{65,25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-35,-25},{-25,-15}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{25,-25},{35,-15}})}), Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={255,204,51}, fillPattern=FillPattern.Solid, points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,-20},{-50,15}}, smooth=Smooth.Bezier),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-32.5,7.5},{-27.5,12.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-2.5,7.5},{2.5,12.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{27.5,7.5},{32.5,12.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-17.5,-12.5},{-12.5,-7.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{12.5,-12.5},{17.5,-7.5}}),Text(visible=true, extent={{-150,40},{150,70}}, textString="%name", fontName="Arial")}));
  end SignalBus;

  connector SignalSubBus "Icon for signal sub-bus"
    annotation(Diagram(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Polygon(visible=true, fillColor={255,204,51}, fillPattern=FillPattern.Solid, points={{-40,25},{40,25},{50,15},{40,-20},{30,-25},{-30,-25},{-40,-20},{-50,15}}, smooth=Smooth.Bezier),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-22.5,7.5},{-17.5,12.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{17.5,7.5},{22.5,12.5}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-2.5,-12.5},{2.5,-7.5}}),Text(visible=true, extent={{-150,40},{150,70}}, textString="%name", fontName="Arial")}), Icon(coordinateSystem(extent={{-100,100},{100,-100}}, preserveAspectRatio=true, initialScale=0.1, grid={10,10}), graphics={Line(visible=true, points={{-16,2},{16,2}}, thickness=0.5),Rectangle(visible=true, lineColor={191,127,255}, lineThickness=0.5, extent={{-10,0},{8,8}}),Polygon(visible=true, fillColor={255,204,51}, fillPattern=FillPattern.Solid, points={{-80,50},{80,50},{100,30},{80,-40},{60,-50},{-60,-50},{-80,-40},{-100,30}}, smooth=Smooth.Bezier),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-55,15},{-45,25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{45,15},{55,25}}),Ellipse(visible=true, fillPattern=FillPattern.Solid, extent={{-5,-25},{5,-15}})}));
  end SignalSubBus;

end Icons;
