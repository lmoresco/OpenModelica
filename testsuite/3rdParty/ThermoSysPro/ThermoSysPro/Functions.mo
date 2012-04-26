within ThermoSysPro;
package Functions "General purpose functions" 
  
  function ThermoRoot "Thermodynamic root" 
    input Real x;
    input Real dx;
    
    output Real y;
    
  protected 
    Real C3;
    Real C1;
    Real dx2;
    Real adx;
    Real sqrtdx;
    
  algorithm 
    adx := abs(dx);
    if (x > adx) then
      y := sqrt(x);
    else
      if (x < -adx) then
        y := -sqrt(-x);
      else
        dx2 := adx*adx;
        sqrtdx := sqrt(adx);
        C3 := -0.25/(sqrtdx*dx2);
        C1 := 0.5/sqrtdx - 3.0*C3*dx2;
        y := (C1 + C3*x*x)*x;
      end if;
    end if;
    
    annotation (smoothOrder=1,
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.2,
        y=0.17,
        width=0.6,
        height=0.6),
      Icon,
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b> </p>
<p><b>ThermoSysPro Version 2.0</b> </p>
</html>"));
  end ThermoRoot;
  
  function ThermoSquare "Thermodynamic square" 
    input Real x;
    
    input Real dx;
    output Real y;
    
  algorithm 
    y := if (abs(x) > dx) then x*abs(x) else x*dx;
    
    annotation (smoothOrder = 1,
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon,
      Window(
        x=0.11,
        y=0.2,
        width=0.6,
        height=0.6),
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2010</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.0</b></p>
</HTML>
"));
  end ThermoSquare;
  
  
  function LinearInterpolation "Linear interpolation" 
    input Real TabX[:] "References table";
    input Real TabY[:] "Results table";
    input Real X "Reference value";
    
    output Real Y "Interpolated result";
    
  protected 
    Real deltaYX "Step in Y w.r.t. X";
    
  algorithm 
    (Y, deltaYX) := Functions.LinearInterpolation_i(TabX, TabY, X);
    
    annotation (
      smoothorder=1,
       Icon,                 Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><h4>ThermoSysPro Version 3.0</h4></p>
</html><html>
</html>",   revisions="<html>
</html>"));
  end LinearInterpolation;
  
  function TableLinearInterpolation "Table linear interpolation" 
    input Real TabP[:] "1st reference table";
    input Real TabX[:] "2nd reference table";
    input Real TabY[:, :] "Results table";
    input Real P "1st reference value";
    input Real X "2nd reference value";
    
    output Real Y "Interpolated result";
    
  protected 
    Real deltaYX "Y step wrt. X";
    Real deltaYP "Y step wrt. P";
    
  algorithm 
    (Y, deltaYX, deltaYP) := Functions.TableLinearInterpolation_i(TabP, TabX, TabY, P, X);
    
    annotation (
      smoothOrder=2,
      Icon,                  Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 3.0</b></p>
</HTML>
",          revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
  end TableLinearInterpolation;
  annotation (
    Coordsys(
      extent=[0, 0; 442, 394],
      grid=[2, 2],
      component=[20, 20]),
    Icon(
      Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
      Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-90, 40; 70, 10],
        string="Library",
        style(
          color=9,
          fillColor=0,
          fillPattern=1)),
      Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
      Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
      Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
      Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0)),
      Text(
        extent=[-120, 135; 120, 70],
        string="%name",
        style(color=1))),
    Window(
      x=0.05,
      y=0.26,
      width=0.25,
      height=0.25,
      library=1,
      autolayout=1),
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
</html>"));
  
  function SmoothStep "Smooth step function" 
    input Real x;
    input Real alpha=100;
    
    output Real y;
    
  algorithm 
    y := 1/(1 + exp(-alpha*x/2));
    
    annotation (smoothorder=2,
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Icon,
      Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2011</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.1</b></p>
</HTML>
"));
  end SmoothStep;
  
  function SmoothSign "Smooth sign function" 
    input Real x;
    input Real alpha=100;
    
    output Real y;
    
  algorithm 
    y := SmoothStep(x, alpha) - SmoothStep(-x, alpha);
    
    annotation (smoothorder=2, Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2011</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.1</b></p>
</HTML>
"));
  end SmoothSign;
  
  function SmoothAbs "Smooth abs function" 
    input Real x;
    input Real alpha=100;
    
    output Real y;
    
  algorithm 
    y := SmoothSign(x, alpha)*x;
    
    annotation (smoothorder=2, Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2011</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 2.1</b></p>
</HTML>
"));
  end SmoothAbs;
  
  function LinearInterpolation_i "Linear interpolation (internal function)" 
    input Real TabX[:] "References table";
    input Real TabY[:] "Results table";
    input Real X "Reference value";
    
    output Real Y "Interpolated result";
    output Real DeltaYX "Y step wrt. X";
    
  protected 
    Integer dimX=size(TabX, 1) "TabX dimension";
    Integer dimY=size(TabY, 1) "TabY dimension";
    Integer IndX=0 "Reference index";
    Boolean IndXcal "Computed index";
    Real ValNum;
    Real ValDen;
    Real DeltaYX2 "Step in Y w.r.t. X";
    
  algorithm 
    if (dimX <> dimY) then
      assert(false, "LinearInterpolation: the dimensions of the tables are different");
    end if;
    
    IndXcal := false;
    
    for i in 2:dimX - 1 loop
       if ((X <= TabX[i]) and (not IndXcal)) then
        IndX := i;
        IndXcal := true;
      end if;
    end for;
    
    if (not IndXcal) then
      IndX := dimX;
    end if;
    
    ValNum := integer(1000*TabY[IndX] + 0.5)/1000 - integer(1000*TabY[IndX - 1] + 0.5)/1000;
    ValDen := integer(1000*TabX[IndX] + 0.5)/1000 - integer(1000*TabX[IndX - 1] + 0.5)/1000;
    
    DeltaYX := ValNum/ValDen;
    DeltaYX2 := (TabY[IndX] - TabY[IndX - 1])/(TabX[IndX] - TabX[IndX - 1]);
    
    Y := TabY[IndX - 1] + (X - TabX[IndX - 1])*DeltaYX;
    
    annotation (
      smoothorder=1,
       Icon,                 Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>" "<html>
</html>",   revisions="<html>
</html>"));
  end LinearInterpolation_i;
  
  function TableLinearInterpolation_i 
    "Table linear interpolation (internal function)" 
    input Real TabP[:] "1st reference table";
    input Real TabX[:] "2nd reference table";
    input Real TabY[:, :] "Results table";
    input Real P "1st reference value";
    input Real X "2nd reference value";
    
    output Real Y "Interpolated result";
    output Real DeltaYX "Y step wrt. X";
    output Real DeltaYP "Y step wrt. P";
    
  protected 
    Integer dimP=size(TabP, 1) "TabP dimension";
    Integer dimX=size(TabX, 1) "TabX dimension";
    Integer dimY1=size(TabY, 1) "TabY 1st dimension";
    Integer dimY2=size(TabY, 2) "TabY 2nd dimension";
    Integer IndP=0 "Reference index";
    Boolean IndPcal "Computed index";
    Real Y1;
    Real DeltaYX1;
    Real Y2;
    Real DeltaYX2;
    
  algorithm 
    if ((dimX <> dimY2) or (dimP <> dimY1)) then
      assert(false, "TableLinearInterpolation: the dimensions of the tables are different");
    end if;
    
    IndPcal := false;
    
    for i in 2:dimP - 1 loop
      if ((P <= TabP[i]) and (not IndPcal)) then
        IndP := i;
        IndPcal := true;
      end if;
    end for;
    
    if (not IndPcal) then
      IndP := dimP;
    end if;
    
    (Y1,DeltaYX1) := LinearInterpolation_i(TabX, TabY[IndP - 1, :], X);
    (Y2,DeltaYX2) := LinearInterpolation_i(TabX, TabY[IndP, :], X);
    
    DeltaYP := (Y2 - Y1)/(TabP[IndP] - TabP[IndP - 1]);
    DeltaYX := DeltaYX1 + (P - TabP[IndP - 1])*(DeltaYX2 - DeltaYX1)/(TabP[IndP] - TabP[IndP - 1]);
    
    Y := Y1 + (P - TabP[IndP - 1])*DeltaYP;
    
    annotation (
      smoothOrder=2,
      Icon,                  Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b></p>
</HTML>
<html>
<p><b>ThermoSysPro Version 3.0</b></p>
</HTML>
",          revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Baligh El Hefni</li>
</ul>
</html>
"));
  end TableLinearInterpolation_i;
end Functions;
