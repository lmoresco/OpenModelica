package Media 
  import SI = Modelica.SIunits;

  partial model BaseProperties  "Interface of medium model for all type of media" 
    connector InputPressure    = input SI.Pressure;
    connector InputTemperature = input SI.Temperature;
    InputPressure p(start = 1e5);
    InputTemperature T(start = 300);
    SI.SpecificEnthalpy h;
    SI.Density d(start = 10);
    SI.SpecificInternalEnergy u;
    Real dddp "dd/dp|T";
    Real dddT "dd/dT|p";
    Real dhdp "dh/dp|T";
    Real cp "dh/dT|p";
  end BaseProperties;
  
  model Air "Model of standard air" 
      extends BaseProperties(cp = R/MM*3.5);
    constant Real R(final unit="J/(mol.K)") =  Modelica.Constants.R;
    constant SI.MolarMass MM = 0.029;
  equation 
    h = cp*T;
    p = d*R/MM*T;
    u = h - p/d;
    dddp = 1/(R/MM*T);
    dddT = -d/T;
    dhdp = 0;
  end Air;
end Media;
