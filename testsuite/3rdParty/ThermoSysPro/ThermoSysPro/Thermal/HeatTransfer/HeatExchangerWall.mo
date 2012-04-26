within ThermoSysPro.Thermal.HeatTransfer;
model HeatExchangerWall "Heat exchanger wall" 
  parameter Modelica.SIunits.Length L=1 "Tube length";
  parameter Modelica.SIunits.Diameter D=0.2 "Internal tube diameter";
  parameter Modelica.SIunits.Thickness e=2.e-3 "Wall thickness";
  parameter Modelica.SIunits.ThermalConductivity lambda=26 
    "Wall thermal conductivity";
  parameter Integer Ns=1 "Number of sections inside the wall";
  parameter Modelica.SIunits.SpecificHeatCapacity cpw=1000 
    "Wall specific heat capacity";
  parameter Modelica.SIunits.Density rhow=7800 "Wall density";
  parameter ThermoSysPro.Units.AbsoluteTemperature T0=350 
    "Initial temperature (active if steady_state=false)";
  parameter Boolean steady_state=true 
    "true: start from steady state - false: start from T0";
  parameter Real ntubes=1 "Number of pipes in parallel";
  
protected 
  constant Real pi=Modelica.Constants.pi "pi";
  parameter Modelica.SIunits.Length dx=L/Ns "Section length";
  parameter Modelica.SIunits.Mass dM=ntubes*rhow*pi*((D + 2*e)^2 - D^2)/4*dx 
    "Wall section mass";
  
public 
  Modelica.SIunits.Power dW1[Ns](start=fill(3.e5, Ns), nominal=fill(3.e5, Ns)) 
    "Power in section i of side 1";
  Modelica.SIunits.Power dW2[Ns](start=fill(3.e5, Ns), nominal=fill(3.e5, Ns)) 
    "Power in section i of side 2";
  ThermoSysPro.Units.AbsoluteTemperature Tp1[Ns](start=fill(300, Ns)) 
    "Wall temperature in section i of side 1";
  ThermoSysPro.Units.AbsoluteTemperature Tp2[Ns](start=fill(300, Ns)) 
    "Wall temperature in section i of side 2";
  ThermoSysPro.Units.AbsoluteTemperature Tp[Ns](start=fill(300, Ns)) 
    "Average wall temperature in section i";
  
  annotation (
    Icon(
      Rectangle(extent=[-100,10; 100,-10],   style(color=0, fillColor=8)),
      Text(
        extent=[-80,40; -20,20],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="2"),
      Text(
        extent=[-80,-20; -20,-40],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="1"),
      Text(
        extent=[20,40; 98,20],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="External"),
      Text(
        extent=[20,-20; 98,-40],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="Internal")),
    Diagram(
      Rectangle(extent=[-100,10; 100,-10],   style(color=0, fillColor=8)),
      Text(
        extent=[-80,30; -20,10],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="Side 2"),
      Text(
        extent=[-80,-10; -20,-30],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="Side 1"),
      Text(
        extent=[20,-10; 98,-30],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="Internal"),
      Text(
        extent=[20,30; 98,10],
        style(
          color=3,
          rgbcolor={0,0,255},
          fillColor=44,
          rgbfillColor={255,170,170},
          fillPattern=1),
        string="External")),
    DymolaStoredErrors,
    Documentation(info="<html>
<p><b>Copyright &copy; EDF 2002 - 2012</b> </p>
<p><b>ThermoSysPro Version 3.0</b> </p>
</html>",
   revisions="<html>
<u><p><b>Authors</u> : </p></b>
<ul style='margin-top:0cm' type=disc>
<li>
    Guillaume Larrignon</li>
</ul>
</html>
"));
  ThermoSysPro.Thermal.Connectors.ThermalPort WT2[Ns] "Side 2" 
    annotation (extent=[-10,10; 10,30]);
  ThermoSysPro.Thermal.Connectors.ThermalPort WT1[Ns] "Side 1" 
    annotation (extent=[-10,-30; 10,-10]);
initial equation 
  if steady_state then
    for i in 1:Ns loop
      der(Tp[i]) = 0;
    end for;
    
  else
    for i in 1:Ns loop
      Tp[i] = T0;
    end for;
  end if;
  
equation 
  
  WT1.T = Tp1;
  WT1.W = dW1;
  
  WT2.T = Tp2;
  WT2.W = dW2;
  
  for i in 1:Ns loop
    /* Heat transfer on side 1 (internal) */
    dW1[i] = 2*pi*dx*ntubes*lambda*(Tp1[i] - Tp[i])/(Modelica.Math.log(1 + e/D));
    
    /* Heat transfer on side 2 (external) */
    dW2[i] = 2*pi*dx*ntubes*lambda*(Tp2[i] - Tp[i])/(Modelica.Math.log(1 + e/(e + D)));
    
    /* Thermal inertia */
    dM*cpw*der(Tp[i]) = dW2[i] + dW1[i];
  end for;
  
end HeatExchangerWall;
