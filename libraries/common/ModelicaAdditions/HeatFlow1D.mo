package HeatFlow1D "1-dimensional heat flow (OBSOLETE)"
   extends Modelica.Icons.Library;
   annotation (obsolete="Use Modelica.Thermal.HeatTransfer",Documentation(info="<html>
 <p>
 THIS IS AN <b>OBSOLETE</b> PACKAGE which is only kept for backward compatibility.
 Use instead package \"Modelica.Thermal.HeatTransfer\".
 </p>
 
 <p>
 This package contains components to model <b>1-dimensional heat flow</b>
 and contains the following components:
 </p>
 
 <pre>   <b>Examples</b>             Examples to demonstrate usage
    <b>Interfaces</b>           Connectors and partial models for 1D heat flow
    <b>TemperatureSource</b>    Temperature source (temperature in Kelvin)
    <b>TemperatureSource_C</b>  Celsius temperature source
    <b>HeatResistance</b>       Ideal heat flow without storage of energy
    <b>HeatCapacitance</b>      Ideal heat storage in a block without heat flow
    <b>Convection</b>           Heat flow by convection
    <b>HeatedRod</b>            1-dim. heat flow in a rod with complete insulation
    <b>Sensors</b>              Heatflux and temperature sensors
 </pre>
 
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
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 <br>
 
 
 <p><b>Copyright &copy; 2000-2002, DLR.</b></p>
 
 <p><i>
 The ModelicaAdditions.HeatFlow1D package is <b>free</b> software;
 it can be redistributed and/or modified
 under the terms of the <b>Modelica license</b>, see the license conditions
 and the accompanying <b>disclaimer</b> in the documentation of package
 Modelica in file \"Modelica/package.mo\".
 </i></p>
 </HTML>
 "));
   package Examples "Demonstration examples of the components of this package"
      extends Modelica.Icons.Library;
      encapsulated model HeatedRod "Heating of a rod with different discretization grids"
         import Modelica.Icons;
         import Modelica.Blocks.Sources;
         import ModelicaAdditions.HeatFlow1D;
         extends Icons.Example;
         annotation (Documentation(info="A completely isolated rod is heated via a temperature source.
 The precision of the discretization grid is checked by
 providing a solution for n=3 and for n=15 grid elements.
 
 Simulate for 5.0e4 seconds and compare
 
   rod3.T[1:3]  with  rod15.T[{3,8,12}]
 "));
         HeatFlow1D.HeatedRod rod3(L=1,A=0.0004,rho=7.5*1000,lambda=74,c=450,n=3) annotation (Placement(transformation(x=10.,y=60.,scale=0.3,aspectRatio=1.),iconTransformation(x=10.,y=60.,scale=0.3,aspectRatio=1.)));
         HeatFlow1D.HeatedRod rod15(L=1,A=0.0004,rho=7.5*1000,lambda=74,c=450,n=15) annotation (Placement(transformation(x=10.,y=0.,scale=0.3,aspectRatio=1.),iconTransformation(x=10.,y=0.,scale=0.3,aspectRatio=1.)));
         HeatFlow1D.TemperatureSource_C Tsource annotation (Placement(transformation(x=-60.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-60.,y=30.,scale=0.1,aspectRatio=1.)));
         Sources.Constant const(k={200}) annotation (Placement(transformation(x=-90.,y=30.,scale=0.1,aspectRatio=1.),iconTransformation(x=-90.,y=30.,scale=0.1,aspectRatio=1.)));
         
      equation
         connect(const.outPort, Tsource.inPort) annotation (Line(points={{-79.,30.},{-71.,30.}},color={0,0,255}));
         connect(Tsource.surface_b, rod3.surface_a) annotation (Line(points={{-50.,30.},{-36.,30.},{-36.,60.},{-20.,60.}},color={255,0,0}));
         connect(Tsource.surface_b, rod15.surface_a) annotation (Line(points={{-50.,30.},{-36.,30.},{-36.,0.},{-20.,0.}},color={255,0,0}));
      end HeatedRod;
   end Examples;
   package Interfaces "Connectors and partial models for 1D heat flow"
      extends Modelica.Icons.Library;
      connector Surface_a "1D Heat flow connector (filled icon)"
         SI.Temperature T "Absolute temperature";
         flow SI.HeatFlowRate q "Heat flowing into element";
         annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-100.},{100.,100.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid)}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-100.},{100.,100.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Text(extent={{-100.,-120.},{100.,-220.}},textString="%name",fillColor={0,0,0})}));
      end Surface_a;
      connector Surface_b "1D Heat flow connector (non-filled icon)"
         SI.Temperature T "Absolute temperature";
         flow SI.HeatFlowRate q "Heat flowing into element";
         annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-100.},{100.,100.}},lineColor={255,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid)}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-100.},{100.,100.}},lineColor={255,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Text(extent={{-100.,-120.},{100.,-220.}},textString="%name",fillColor={0,0,0})}));
      end Surface_b;
      partial model AbsoluteSensor "Device to measure a single connector variable"
         extends Modelica.Icons.TranslationalSensor;
         Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort(final n=1) annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         annotation (Documentation(info="<html>
 <p>
 This is the superclass of a 1D component with one surface and one
 output signal in order to measure a heat flow quantity in the surface
 and to provide the measured signal as output signal for further processing
 with the Modelica.Blocks blocks.
 </p>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-100.,-90.},{-20.,-90.}},color={0,0,0}),Polygon(points={{10.,-90.},{-20.,-80.},{-20.,-100.},{10.,-90.}},lineColor={128,128,128},fillColor={128,128,128},fillPattern=FillPattern.Solid),Line(points={{-70.,0.},{-90.,0.}},color={0,0,0}),Line(points={{70.,0.},{100.,0.}},color={0,0,255}),Text(extent={{-110.,80.},{110.,120.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={0,0,0}),Line(points={{70.,0.},{100.,0.}},color={0,0,255})}));
      end AbsoluteSensor;
      partial model RelativeSensor "Device to measure a single relative variable between two surfaces"
         extends Modelica.Icons.TranslationalSensor;
         Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
         Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort(final n=1) annotation (Placement(transformation(x=0.,y=-110.,scale=0.1,aspectRatio=1.,rotation=90,flipVertical=true),iconTransformation(x=0.,y=-110.,scale=0.1,aspectRatio=1.,rotation=90,flipVertical=true)));
         annotation (Documentation(info="<html>
 <p>
 This is a superclass for 1D components with two surfaces
 and one output signal in order to measure relative quantities
 between the two surfaces and
 to provide the measured signal as output signal for further processing
 with the Modelica.Blocks blocks.
 </p>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={0,0,0}),Line(points={{70.,0.},{90.,0.}},color={0,0,0}),Line(points={{0.,-100.},{0.,-60.}},color={0,0,255}),Text(extent={{0.,98.},{0.,38.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={0,0,0}),Line(points={{70.,0.},{90.,0.}},color={0,0,0}),Line(points={{0.,-100.},{0.,-60.}},color={0,0,255})}));
      end RelativeSensor;
   end Interfaces;
   model TemperatureSource "Temperature source"
      Interfaces.Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-40.,60.},{20.,-100.}},lineColor={0,0,0}),Line(points={{-100.,0.},{-40.,0.}},color={0,0,255}),Rectangle(extent={{20.,10.},{90.,-10.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,40.},{-12.,30.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,10.},{-12.,0.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,-18.},{-12.,-28.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,-50.},{-12.,-60.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,-80.},{-12.,-90.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Text(extent={{-128.,126.},{126.,66.}},textString="%name",fillColor={0,0,255}),Text(extent={{-122.,-40.},{-54.,-100.}},textString="T",fillColor={0,0,0})}));
      Modelica.Blocks.Interfaces.InPort inPort(final n=1) annotation (Placement(transformation(x=-110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-110.,y=0.,scale=0.1,aspectRatio=1.)));
      
   equation
      surface_b.T = inPort.signal[1];
   end TemperatureSource;
   model TemperatureSource_C "Celsius temperature source"
      Interfaces.Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-40.,100.},{20.,-60.}},lineColor={0,0,0}),Line(points={{-100.,0.},{-40.,0.}},color={0,0,255}),Rectangle(extent={{20.,10.},{90.,-10.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,88.},{-12.,78.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,58.},{-12.,48.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,30.},{-12.,20.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,0.},{-12.,-10.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Rectangle(extent={{-40.,-30.},{-12.,-40.}},lineColor={192,192,192},fillColor={160,160,160},fillPattern=FillPattern.Solid),Text(extent={{-152.,82.},{-52.,52.}},textString="T [degC]",fillColor={0,0,0}),Text(extent={{-122.,-58.},{116.,-122.}},textString="%name",fillColor={0,0,255})}));
      Modelica.Blocks.Interfaces.InPort inPort(final n=1) annotation (Placement(transformation(x=-110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-110.,y=0.,scale=0.1,aspectRatio=1.)));
      
   equation
      surface_b.T = inPort.signal[1]-Modelica.Constants.T_zero;
   end TemperatureSource_C;
   model HeatResistance "Ideal heat flow without storage of energy"
      parameter SI.Area A(min=0) "area of heat resistance";
      parameter SI.Length L(min=Modelica.Constants.eps) "length of heat resistance";
      parameter SI.ThermalConductivity lambda(min=0) "thermal conductivity of material";
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,20.},{90.,-20.}},fillColor={255,0,0},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{-122.,92.},{129.,29.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Polygon(points={{-81.,10.},{-78.,10.},{40.,10.},{40.,30.},{80.,0.},{40.,-30.},{40.,-10.},{-80.,-10.},{-80.,10.},{-81.,10.}},lineColor={255,0,0},fillColor={255,0,0},fillPattern=FillPattern.Solid)}));
      Interfaces.Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
      Interfaces.Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
      
   equation
      surface_a.q = (lambda*A)/L*(surface_a.T-surface_b.T);
      surface_b.q = -surface_a.q;
   end HeatResistance;
   model HeatCapacitance "Ideal heat storage in a block without heat flow"
      parameter SI.Mass m(min=0) "mass of block";
      parameter SI.SpecificHeatCapacity c(min=0) "specifc heat capacity of block";
      parameter SI.Conversions.NonSIunits.Temperature_degC T0=20 "initial temperature of block";
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-100.,-10.},{100.,-80.}},lineColor={0,0,0},fillColor={255,0,0},pattern=LinePattern.None,fillPattern=FillPattern.Sphere),Text(extent={{-123.,-89.},{119.,-152.}},textString="%name",fillColor={0,0,255})}));
      Interfaces.Surface_a surface_a(T(final start=T0-Modelica.Constants.T_zero)) annotation (Placement(transformation(x=0.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=0.,y=0.,scale=0.1,aspectRatio=1.)));
      
   equation
      surface_a.q = (c*m)*der(surface_a.T);
   end HeatCapacitance;
   model Convection "Heat flow by convection"
      parameter SI.Length P "perimeter of convection surface";
      parameter SI.Length L "length of element";
      parameter SI.CoefficientOfHeatTransfer h "convection heat transfer coefficient";
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-88.,20.},{90.,-20.}},fillColor={255,127,127},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Text(extent={{-98.,80.},{100.,18.}},textString="%name",fillColor={0,0,255})}));
      Interfaces.Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
      Interfaces.Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
      
   equation
      surface_a.q = ((h*P)*L)*(surface_a.T-surface_b.T);
      surface_b.q = -surface_a.q;
   end Convection;
   model HeatedRod "1-dimensional heat flow in a rod with complete insulation"
      parameter Integer n(min=1)=5 "number of heat capacity elements (= number of states)";
      parameter SI.Length L(min=Modelica.Constants.eps) "lenght of rod";
      parameter SI.Area A(min=0) "area of rod";
      parameter SI.Density rho(min=0) "density of rod material";
      parameter SI.ThermalConductivity lambda(min=0) "thermal conductivity of material";
      parameter SI.SpecificHeatCapacity c(min=0) "specifc heat capacity";
      parameter SI.Conversions.NonSIunits.Temperature_degC T0 "initial temperature";
      SI.Conversions.NonSIunits.Temperature_degC T[n+2] "Temperature at the grid points (of the heat capacity elements and the borders)";
      SI.Position s[n+2] "Distance between surface_a and T[i]";
      
   protected
      parameter SI.Length Lelem=L/n "length of a HeatCapacity element";
      parameter SI.Mass mElem=(A*Lelem)*rho "mass of a HeatCapacity element";
      
   public
      Interfaces.Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
      Interfaces.Surface_b surface_b annotation (Placement(transformation(x=100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=100.,y=0.,scale=0.1,aspectRatio=1.)));
      
   protected
      HeatResistance R0(A=A,L=Lelem/2,lambda=lambda) annotation (Placement(transformation(x=-40.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-40.,y=0.,scale=0.1,aspectRatio=1.)));
      HeatResistance Rn(A=A,L=Lelem/2,lambda=lambda) annotation (Placement(transformation(x=40.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=40.,y=0.,scale=0.1,aspectRatio=1.)));
      HeatResistance R[n-1](A=fill(A,n-1),L=fill(Lelem,n-1),lambda=fill(lambda,n-1)) annotation (Placement(transformation(x=0.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=0.,y=0.,scale=0.1,aspectRatio=1.)));
      HeatCapacitance C[n](m=fill(mElem,n),c=fill(c,n),T0=fill(T0,n)) annotation (Placement(transformation(x=0.,y=-40.,scale=0.1,aspectRatio=1.),iconTransformation(x=0.,y=-40.,scale=0.1,aspectRatio=1.)));
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-90.,20.},{90.,-20.}},fillColor={255,0,0},lineColor={0,0,0},pattern=LinePattern.None,fillPattern=FillPattern.HorizontalCylinder),Line(points={{-60.,20.},{-60.,-18.}},color={0,0,0}),Line(points={{20.,20.},{20.,-18.}},color={0,0,0}),Line(points={{60.,18.},{60.,-20.}},color={0,0,0}),Text(extent={{-100.,-30.},{100.,-70.}},textString="n=%n",fillColor={0,0,0}),Line(points={{-20.,18.},{-20.,-20.}},color={0,0,0}),Text(extent={{0.,96.},{0.,36.}},textString="%name",fillColor={0,0,255})}));
      
   equation
      connect(surface_a, R0.surface_a) annotation (Line(points={{-100.,0.},{-50.,0.}},color={0,0,255}));
      connect(surface_b, Rn.surface_b) annotation (Line(points={{100.,0.},{50.,0.}},color={0,0,255}));
      connect(R0.surface_b, C[1].surface_a);
      connect(Rn.surface_a, C[n].surface_a);
      for i in 1:n-1 loop
         connect(C[i].surface_a, R[i].surface_a);
         connect(R[i].surface_b, C[i+1].surface_a);
      end for;
      T[1] = surface_a.T;
      T[n+2] = surface_b.T;
      for i in 1:n loop
         T[i+1] = C[i].surface_a.T-Modelica.Constants.T_zero;
      end for;
      s[1] = 0;
      s[2] = Lelem/2;
      s[n+2] = L;
      for i in 3:n+1 loop
         s[i] = Lelem/2+(i-2)*Lelem;
      end for;
   end HeatedRod;
   package Sensors "Sensor for 1D heat flow components"
      import Modelica.Icons;
      import Modelica.Constants;
      import ModelicaAdditions.HeatFlow1D.Interfaces;
      import MBI = Modelica.Blocks.Interfaces;
      import SI = Modelica.SIunits;
      import NonSI = Modelica.SIunits.Conversions.NonSIunits;
      extends Modelica.Icons.Library2;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Rectangle(extent={{-76.,-81.},{64.,-1.}},lineColor={0,0,0},fillColor={255,255,255},fillPattern=FillPattern.Solid),Polygon(points={{-6.,-61.},{-16.,-37.},{4.,-37.},{-6.,-61.}},lineColor={0,0,0},fillColor={0,0,0},fillPattern=FillPattern.Solid),Line(points={{-6.,-21.},{-6.,-37.}},color={0,0,0}),Line(points={{-76.,-21.},{-6.,-21.}},color={0,0,0}),Line(points={{-56.,-61.},{-56.,-81.}},color={0,0,0}),Line(points={{-36.,-61.},{-36.,-81.}},color={0,0,0}),Line(points={{-16.,-61.},{-16.,-81.}},color={0,0,0}),Line(points={{4.,-61.},{4.,-81.}},color={0,0,0}),Line(points={{24.,-61.},{24.,-81.}},color={0,0,0}),Line(points={{44.,-61.},{44.,-81.}},color={0,0,0})}));
      model HeatFlux "Ideal sensor to measure the heat flux between two surfaces"
         extends Interfaces.RelativeSensor;
         SI.HeatFlux q "heat flux from surface_a to surface_b (q = surface_a.q = -surface_b.q)";
         annotation (Documentation(info="<html>
 <p>
 Measures the <i>heatflux between two surfacess</i> in an ideal way
 and provides the result as output signal (to be further processed
 with blocks of the Modelica.Blocks library).
 </p>
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Text(extent={{40.,-70.},{120.,-120.}},textString="q",fillColor={0,0,0})}));
         
      equation
         surface_a.T = surface_b.T;
         surface_a.q = q;
         surface_b.q = -q;
         q = outPort.signal[1];
      end HeatFlux;
      model Temperature "Ideal sensor to measure the absolute temperature in Kelvin"
         extends Modelica.Icons.TranslationalSensor;
         SI.Temperature T "Kelvin temperature";
         Interfaces.Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort(final n=1) annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         annotation (Documentation(info="<html>
 <p>
 Measures the <b>absolute temperature</b> (in Kelvin) of a surface in an ideal way and
 provides the result as
 output signals (to be further processed with blocks of the
 Modelica.Blocks library).
 </p>
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={255,0,0}),Line(points={{70.4,0.},{100.,0.}},color={0,0,255}),Text(extent={{80.,-28.},{116.,-59.}},textString="T",fillColor={0,0,0}),Text(extent={{0.,100.},{0.,40.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{100.,0.},{70.,0.}},color={0,0,255}),Line(points={{-70.,0.},{-92.,0.}},color={255,0,0})}));
         
      equation
         T = surface_a.T;
         T = outPort.signal[1];
         0 = surface_a.q;
      end Temperature;
      model Temperature_C "Ideal sensor to measure the temperature in Celcius"
         extends Modelica.Icons.TranslationalSensor;
         SI.Conversions.NonSIunits.Temperature_degC T "Celsius temperature";
         Interfaces.Surface_a surface_a annotation (Placement(transformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=-100.,y=0.,scale=0.1,aspectRatio=1.)));
         Modelica.Blocks.Interfaces.OutPort outPort(final n=1) annotation (Placement(transformation(x=110.,y=0.,scale=0.1,aspectRatio=1.),iconTransformation(x=110.,y=0.,scale=0.1,aspectRatio=1.)));
         annotation (Documentation(info="<html>
 <p>
 Measures the <b>Celsius temperature</b> of a surface in an ideal way and
 provides the result as
 output signals (to be further processed with blocks of the
 Modelica.Blocks library).
 </p>
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>June 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        Realized.</li>
 </ul>
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={255,0,0}),Line(points={{70.4,0.},{100.,0.}},color={0,0,255}),Text(extent={{6.,-62.},{120.,-106.}},textString="T [degC]",fillColor={0,0,0},pattern=LinePattern.None),Text(extent={{0.,98.},{0.,38.}},textString="%name",fillColor={0,0,255})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{100.,0.},{70.,0.}},color={0,0,255}),Line(points={{-70.,0.},{-92.,0.}},color={255,0,0})}));
         
      equation
         T = surface_a.T+Modelica.Constants.T_zero;
         T = outPort.signal[1];
         0 = surface_a.q;
      end Temperature_C;
      model RelativeTemperature "Ideal sensor to measure the relative temperature between two surfaces"
         extends Interfaces.RelativeSensor;
         SI.Temperature T_rel "Relative temperature between two surfaces (surface_b.T - surface_a.T)";
         annotation (Documentation(info="<html>
 <p>
 Measures the <b>relative temperature T_rel</b> between two surfaces
 in an ideal way and provides the result as output signal outPort.signal[1]
 (to be further processed with blocks of the Modelica.Blocks library).
 </p>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>July 15, 2000</i>
        by <a href=\"http://www.robotic.dlr.de/Martin.Otter/\">Martin Otter</a>:<br>
        realized.
 </li>
 </ul>
 
 </HTML>
 "),Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-70.,0.},{-90.,0.}},color={255,0,0}),Line(points={{70.4,0.},{100.,0.}},color={255,0,0}),Text(extent={{28.,-84.},{79.,-114.}},textString="T_rel",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{100.,0.},{70.,0.}},color={255,0,0}),Line(points={{-70.,0.},{-92.,0.}},color={255,0,0})}));
         
      equation
         T_rel = surface_b.T-surface_a.T;
         T_rel = outPort.signal[1];
         0 = surface_a.q;
         0 = surface_b.q;
      end RelativeTemperature;
   end Sensors;
end HeatFlow1D;