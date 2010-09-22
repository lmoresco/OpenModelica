package Interfaces 
  import SI = Modelica.SIunits;
   connector FlangeA                     "Type-A connector" 
    SI.Pressure p                         "Pressure";
    flow SI.MassFlowRate w                "Mass flowrate";
    output SI.SpecificEnthalpy hAB        "Specific enthalpy of fluid flowing from A to B";
    input SI.SpecificEnthalpy hBA         "Specific enthalpy of fluid flowing from B to A";
  end FlangeA;

  connector FlangeB                     "Type-B connector" 
    SI.Pressure p                         "Pressure";
    flow SI.MassFlowRate w                "Mass flowrate";
    input SI.SpecificEnthalpy hAB         "Specific enthalpy of fluid flowing from A to B";
    output SI.SpecificEnthalpy hBA        "Specific enthalpy of fluid flowing from B to A";
  end FlangeB;

  partial model OneFlange
    FlangeA flange;
  end OneFlange;

  partial model TwoFlanges_Base
    //Apparently correct but not-working with OMC    
    //parameter SI.Pressure in_p_start;
    //parameter SI.Temperature in_T_start;
    //parameter SI.Pressure out_p_start;
    //parameter SI.Temperature out_T_start;
    //FlangeA inlet(p(start = in_p_start,fixed=false));
    //FlangeB outlet(p(start = out_p_start,fixed=false));
    FlangeA inlet;
    FlangeB outlet;
  end TwoFlanges_Base;


  partial model TwoFlanges
      extends TwoFlanges_Base;
    SI.MassFlowRate w;
    SI.Pressure dp;
  equation
    // Boundary conditions
    w = inlet.w;
    dp = inlet.p - outlet.p;
  end TwoFlanges;

  partial model Environment
      extends OneFlange;
    parameter SI.Pressure p;
    parameter SI.Temperature T;
    replaceable model Medium = Media.Air;
    Medium medium;
  equation
    medium.p = p;
    medium.T = T;
    flange.p = p;
  end Environment;  


  connector Thermal_Port 
    SI.Temperature T                  "Port temperature";
    flow SI.HeatFlowRate Q_flow         "Heat flow rate (positive if flowing from outside into the component)";
  end Thermal_Port;


end Interfaces;
