package Continuous "Continuous control blocks with internal states"
   extends Modelica.Icons.Library;
   annotation (Documentation(info="<html>
 <p>
 This package contains basic <b>continuous</b> input/output blocks.
 </p>
 
 
 <p><b>Copyright &copy; 1999-2002, Modelica Association and DLR.</b></p>
 
 <p><i>
 This package is <b>free</b> software; it can be redistributed and/or modified
 under the terms of the <b>Modelica license</b>, see the license conditions
 and the accompanying <b>disclaimer</b> in the documentation of package
 Modelica in file \"Modelica/package.mo\".
 </i></p>
 </HTML>
 "));
   block ButterLow "Output the input signal filtered with a low pass Butterworth filter of any order"
      import Modelica.Math.*;
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Integer n(min=1)=2 "Order of filter";
      parameter SI.Frequency f=1 "Cut-off frequency";
      output Real x1[m] "states 1 of second order filters (der(x1) = x2)";
      output Real x2[m] "states 2 of second order filters";
      output Real xr "state of real pole for uneven order otherwise dummy";
      
   protected
      Real z[m+1];
      Real polereal[m];
      Real poleimag[m];
      Real realpol;
      Real k2[m];
      Real D[m];
      Real w0[m];
      Real k1;
      Real T;
      constant Real pi=Modelica.Constants.pi;
      parameter Integer m=integer(n/2);
      parameter Real w=(2*pi)*f;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-80.,78.},{-80.,-90.}},color={192,192,192}),Polygon(points={{-79.5584,91.817},{-87.5584,69.817},{-71.5584,69.817},{-79.5584,89.817},{-79.5584,91.817}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-80.,-80.},{-72.,-68.53},{-64.,-39.5},{-56.,-2.522},{-48.,32.75},{-40.,58.8},{-32.,71.51},{-24.,70.49},{-16.,58.45},{-8.,40.06},{0.,20.55},{8.,4.459},{16.,-5.271},{24.,-7.629},{32.,-3.428},{40.,5.21},{48.,15.56},{56.,25.03},{64.,31.66},{72.,34.5},{80.,33.61}},color={0,0,255}),Line(points={{-90.9779,-80.7697},{81.0221,-80.7697}},color={192,192,192}),Polygon(points={{91.3375,-79.8233},{69.3375,-71.8233},{69.3375,-87.8233},{91.3375,-79.8233}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Text(extent={{-45.1735,-11.47},{92.,-68.}},textString="ButterLow",fillColor={192,192,192}),Text(extent={{8.,-106.},{8.,-146.}},textString="f=%f",fillColor={0,0,0}),Text(extent={{-2.,94.},{94.,48.}},textString="%n",fillColor={192,192,192})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{40.,0.},{-40.,0.}},color={0,0,0}),Text(extent={{-55.,55.},{55.,5.}},textString="1",fillColor={0,0,0}),Text(extent={{-55.,-5.},{55.,-55.}},textString="a(s)",fillColor={0,0,0}),Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={0,0,255}),Line(points={{-100.,0.},{-60.,0.}},color={0,0,255}),Line(points={{60.,0.},{100.,0.}},color={0,0,255})}),Documentation(info="<html>
 <p>This block defines the transfer function between the input
 u=inPort.signal[1] and the output y=outPort.signal[1] as an
 n-th order low pass filter with <i>Butterworth</i>
 characteristics and cut-off frequency f. It is implemented as
 a series of second order filters and a first order filter.</p>
 
 <p>If transients at the simulation start shall be avoided the
 states x1 and xr need to be initialized with the start value
 of the input signal and the states x2 need to be initialized
 with zeros.</p>
 
 
 <pre>
      y = PT21*PT22*...*PT2(n/2)*PT1 u
 </pre>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>October 17, 2002</i>
        by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
        Changed to block. Therefore made some variables protected, others changed to output variables.</li>
 <li><i>June 28, 2001</i>
        by Michael Th&uuml;mmel:<br>
        Realized.</li>
 </ul>
 </HTML>
 "));
      
   equation
      k2 = ones(m);
      k1 = 1;
      z[1] = u;
      for i in 1:m loop
         polereal[i] = cos(pi/2+pi/n*(i-0.5));
         poleimag[i] = sin(pi/2+pi/n*(i-0.5));
         w0[i] = (polereal[i]^(2)+poleimag[i]^(2))*w;
         D[i] = -polereal[i]/w0[i]*w;
      end for;
      realpol = 1*w;
      T = 1/realpol;
      for i in 1:m loop
         der(x1[i]) = x2[i];
         der(x2[i]) = ((k2[i]*w0[i]^(2))*z[i]-((2*D[i])*w0[i])*x2[i])-w0[i]^(2)*x1[i];
         z[i+1] = x1[i];
      end for;
      if 2*m == n then
         xr = 0;
         y = z[m+1];
      else
         der(xr) = (k1*z[m+1]-xr)/T;
         y = xr;
      end if;
   end ButterLow;
   block CritDamping "Output the input signal filtered with an n-th order filter with critical damping"
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Integer n=2 "Order of filter";
      parameter SI.Frequency f=1 "Cut-off frequency";
      output Real x[n+1];
      
   protected
      constant Real pi=Modelica.Constants.pi;
      parameter Real w=(2*pi)*f;
      annotation (Icon(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{-80.6897,77.6256},{-80.6897,-90.3744}},color={192,192,192}),Polygon(points={{-79.7044,90.6305},{-87.7044,68.6305},{-71.7044,68.6305},{-79.7044,88.6305},{-79.7044,90.6305}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Line(points={{-90.,-80.},{82.,-80.}},color={192,192,192}),Polygon(points={{90.,-80.},{68.,-72.},{68.,-88.},{90.,-80.}},lineColor={192,192,192},fillColor={192,192,192},fillPattern=FillPattern.Solid),Text(extent={{0.,0.},{60.,-60.}},textString="PTn",fillColor={192,192,192}),Line(points={{-80.7599,-80.5082},{-70.7599,-74.5082},{-56.,-60.},{-48.,-42.},{-42.,-18.},{-36.,4.},{-26.,20.},{-10.7599,34.9018},{-0.759907,38.8218},{9.24009,41.6818},{19.2401,43.7818},{29.2401,45.3118},{39.2401,46.4318},{49.2401,47.2518},{59.2401,47.8518},{69.2401,48.2918},{79.2401,48.6118}},color={0,0,255}),Text(extent={{-70.,94.},{26.,48.}},textString="%n",fillColor={192,192,192}),Text(extent={{8.,-106.},{8.,-146.}},textString="f=%f",fillColor={0,0,0})}),Diagram(coordinateSystem(extent={{-100.,-100.},{100.,100.}}),graphics={Line(points={{40.,0.},{-40.,0.}},color={0,0,0}),Text(extent={{-55.,55.},{55.,5.}},textString="1",fillColor={0,0,0}),Rectangle(extent={{-60.,60.},{60.,-60.}},lineColor={0,0,255}),Line(points={{-100.,0.},{-60.,0.}},color={0,0,255}),Line(points={{60.,0.},{100.,0.}},color={0,0,255}),Text(extent={{-54.,-6.},{44.,-56.}},textString="(T s + 1)",fillColor={0,0,0}),Text(extent={{38.,-10.},{58.,-30.}},textString="n",fillColor={0,0,0})}),Documentation(info="<html>
 <p>This block defines the transfer function between the
 input u=inPort.signal[1] and the output y=outPort.signal[1]
 as an n-th order filter with <i>critical damping</i>
 characteristics and cut-off frequency f=1/T. It is
 implemented as a series of first order filters.</p>
 
 <p>If transients at the simulation start shall be avoided
 the states x need to be initialized with the start value of
 the input.</p>
 
 <pre>
                k
      y = ------------- * u
          (T * s + 1)^n
 </pre>
 
 <p><b>Release Notes:</b></p>
 <ul>
 <li><i>October 17, 2002</i>
        by <a href=\"http://www.robotic.dlr.de/Christian.Schweiger/\">Christian Schweiger</a>:<br>
        Changed to block. Therefore changed variable <b>x</b> to output variable.</li>
 <li><i>June 28, 2001</i>
        by Michael Th&uuml;mmel:<br>
        Realized.</li>
 </ul>
 </HTML>
 "));
      
   equation
      x[1] = u;
      for i in 2:n+1 loop
         der(x[i]) = ((x[i-1]-x[i])*w)/(2*pi);
      end for;
      y = x[n+1];
   end CritDamping;
end Continuous;