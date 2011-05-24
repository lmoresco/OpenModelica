package Components 
  import SI = Modelica.SIunits;

  partial model PressDrop_NoThermalLosses_NoMassStorage
    extends Interfaces.TwoFlanges;
  equation
    // Mass balance
    inlet.w + outlet.w = 0;
    // Energy balance
    inlet.hBA = outlet.hBA;
    inlet.hAB = outlet.hAB;
  end PressDrop_NoThermalLosses_NoMassStorage;


  model SourceP 
    parameter Types.Pressure p;
    parameter Types.Temperature T;
    Interfaces.FlangeB flange;
    replaceable model Medium = Media.Air;
    Medium medium;
  equation 
    medium.p = p;
    medium.T = T;
    flange.p = p;
    flange.hBA = medium.h;
  end SourceP;

  model SinkP 
    parameter Types.Pressure p;
    parameter Types.Temperature T;
    Interfaces.FlangeA flange;
    replaceable model Medium = Media.Air;
    Medium medium;
  equation 
    medium.p = p;
    medium.T = T;
    flange.p = p;
    flange.hAB = medium.h;
  end SinkP;


  model ValveLinear
      //Apparently correct but not working with OMC.
      //extends Interfaces.TwoFlanges(in_p_start=in_p_start,out_p_start=out_p_start);
      extends PressDrop_NoThermalLosses_NoMassStorage(inlet(p(start=in_p_start,fixed=false)),outlet(p(start=out_p_start,fixed=false)));
    Modelica.Blocks.Interfaces.RealInput u                            "Valve opening in p.u.";
    parameter Real Kv                                                   "Hydraulic conductance at full opening";
    parameter Types.Pressure in_p_start                            "Guess value for inlet pressure";
    parameter Types.Pressure out_p_start                           "Guess value for outlet pressure";
  equation 
    // Flow equation
    w = Kv*u*dp;
  end ValveLinear;

   
  model PressDropLinear 
      extends PressDrop_NoThermalLosses_NoMassStorage(inlet(p(start=in_p_start,fixed=false)),outlet(p(start=out_p_start,fixed=false)));
    parameter Real Kv                                                   "Hydraulic conductance at full opening";
    parameter Types.Pressure in_p_start                              "Guess value for inlet pressure";
    parameter Types.Pressure out_p_start                             "Guess value for outlet pressure";
  equation 
    //Flow equation
    w = Kv*dp;
  end PressDropLinear;

  
  partial model Volume "ControlVolume" 
      extends Interfaces.TwoFlanges_Base;
    replaceable model Medium = Media.Air;
    parameter Types.Pressure p_start;
    parameter Types.Temperature T_start;
    Medium medium(p(start = p_start,fixed=false), T(start=T_start,fixed=false)) "Medium properties";
    parameter SI.Volume V;
    Interfaces.Thermal_Port thermalPort;
    //SI.MassFlowRate win;
    //SI.MassFlowRate wout;
    SI.SpecificEnthalpy hin;
    SI.SpecificEnthalpy hout;
    SI.Power Q;
    SI.Mass M;
    SI.Energy U;
    Real derM;
    Real derh;
    Real derU;
  equation 
    M = medium.d*V;
    U = M*medium.u;
    derM = V*(medium.dddp*der(medium.p) + medium.dddT*der(medium.T));
    derh = medium.dhdp*der(medium.p) + medium.cp*der(medium.T);
    derU = M*derh + derM*medium.h - der(medium.p)*V;
    derM = inlet.w + outlet.w;
    derU = inlet.w*hin + outlet.w*hout + Q;
    // Boundary conditions
    hin =  if inlet.w > 0     then inlet.hBA else medium.h;
    hout = if (-outlet.w) > 0 then medium.h  else outlet.hAB;
    medium.p = inlet.p;
    medium.p = outlet.p;
    thermalPort.Q_flow = Q;
    thermalPort.T = medium.T;
    inlet.hAB = medium.h;
    outlet.hBA = medium.h;
  end Volume;

  model Volume_initial_state extends Components.Volume;
    initial equation
      medium.p = p_start;
      medium.T = T_start;
  end Volume_initial_state;

  model Volume_steady_state extends Components.Volume;
    initial equation
      der(medium.p)=0;
      der(medium.T)=0;
  end Volume_steady_state;

  
  model Pipe "Short pipe with one volume and wall friction" 
      extends Interfaces.TwoFlanges_Base;    
    PressDropLinear flowVolume1(Kv=2*Kv_p);
    PressDropLinear flowVolume2(Kv=2*Kv_p);
    Volume volume(V=Modelica.Constants.pi*(diameter/2)^2*length,p_start=p_start,T_start=T_start);
    Interfaces.Thermal_Port thermalPort1;
    parameter Real Kv_p                                               "Hydraulic conductance at full opening";
    parameter Modelica.SIunits.Length diameter = 0.3                "Diameter of the pipe";
    parameter Modelica.SIunits.Length length = 3                    "Length of the pipe";
    parameter Types.Pressure p_start                                   "Strating value for pressure";
    parameter Types.Temperature T_start                                "Starting value for temperature";
  equation 
    connect(inlet, flowVolume1.inlet);
    connect(flowVolume1.outlet, volume.inlet);
    connect(volume.outlet, flowVolume2.inlet);
    connect(flowVolume2.outlet, outlet);
    connect(volume.thermalPort, thermalPort1);
  end Pipe;

 
  model Pump "Centrifugal pump" 
      extends PressDrop_NoThermalLosses_NoMassStorage(inlet(p(start=in_p_start,fixed=false)),outlet(p(start=out_p_start,fixed=false)));    
    parameter Real a = 2e4;
    parameter Real b = 1e-3;
    parameter Types.Density rho = 1e3;
    SI.VolumeFlowRate q;
    SI.Length H;
    Modelica.Blocks.Interfaces.RealInput cmd;
    parameter Types.Pressure in_p_start                          "Guess value for inlet pressure";
    parameter Types.Pressure out_p_start                         "Guess value for outlet pressure";
  equation 
    H = (a - b * q^2) * cmd;
    H = dp/(rho*Modelica.Constants.g_n);
    q = w/rho;
  end Pump;

  model PumpVolumetric "Volumetric pump" 
      extends PressDrop_NoThermalLosses_NoMassStorage(inlet(p(start=in_p_start,fixed=false)),outlet(p(start=out_p_start,fixed=false)));    
    parameter Types.Density rho = 1e3;
    Modelica.Blocks.Interfaces.RealInput q;
    parameter Types.Pressure in_p_start                          "Guess value for inlet pressure";
    parameter Types.Pressure out_p_start                         "Guess value for outlet pressure";
  equation 
    q = w/rho;
  end PumpVolumetric;

  
  model PressureSensor 
      extends PressDrop_NoThermalLosses_NoMassStorage;
    Modelica.Blocks.Interfaces.RealOutput P(redeclare type SignalType = SI.Pressure) "Absolute pressure of fluid";
  equation 
    dp=0;
    P=outlet.p;
  end PressureSensor;

  
  model MassFlowRateSensor 
      extends PressDrop_NoThermalLosses_NoMassStorage;
    Modelica.Blocks.Interfaces.RealOutput w_out(redeclare type SignalType = SI.MassFlowRate) "Flow mass";
  equation 
    dp=0;
    w_out=w;
  end MassFlowRateSensor;

end Components;
