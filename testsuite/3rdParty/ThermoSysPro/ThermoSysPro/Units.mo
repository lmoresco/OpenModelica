within ThermoSysPro;
package Units "Additional SI and non-SI units" 
  type Time_minute = Real(final quantity="Time", final unit="min");
  type Angle_deg =  Real (final quantity="Angle", final unit="deg") annotation (
     Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  type RotationVelocity =Real (final quantity="Rotation velocity", final unit="1/min") 
                   annotation (Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  type PressureLossCoefficient =Real (final quantity="Pressure loss coefficient", final unit="m-4") 
                                                              annotation (
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  type Temperature_degC =   Real (final quantity="ThermodynamicTemperature", final unit=
                                                                                      "degC") 
     annotation (Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
  type DerEnergyByTemperature = Real (final quantity="Derivative of the specific energy wrt. the temperature", final unit=
                                                                                                    "J/(kg.K)") 
    annotation (Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  type DerDensityByEnthalpy = Real (final unit="kg2/(m3.J)");
  type DerDensityByEntropy = Real (final quantity="DerDensityByEntropy", final unit=
             "kg2.K/(m3.J)");
  type DerEnergyByPressure = Real (final quantity="DerEnergyByPressure", final unit=
             "J/Pa");
  type DerEntropyByTemperature = Real (final quantity="DerEntropyByTemperature",
         final unit="J/K2");
  type DerEntropyByPressure = Real (final quantity="DerEntropyByPressure",
        final unit="J/(K.Pa)");
  type DerPressureByDensity = Real (final quantity="DerPressureByDensity",
        final unit="Pa.m3/kg");
  type DerPressureBySpecificVolume = Real (final quantity=
          "DerPressureBySpecificVolume", final unit="Pa.kg/m3");
  type DerPressureByTemperature = Real (final quantity=
          "DerPressureByTemperature", final unit="Pa/K");
  type DerVolumeByTemperature = Real (final quantity="DerVolumeByTemperature",
        final unit="m3/K");
  type DerVolumeByPressure = Real (final quantity="DerVolumeByPressure", final unit=
             "m3/Pa");
  type MassFraction = Real (final quantity="Mass fraction", final unit="1");
  type AbsoluteTemperature = Modelica.SIunits.Temperature(nominal=500, start=300, min=200, max=6000);
  type AbsolutePressure = Modelica.SIunits.AbsolutePressure(nominal=1.0e6, start=1.0e5, min=100, max=1.0e9);
  type SpecificEnthalpy = Modelica.SIunits.SpecificEnthalpy(nominal = 1.5e6, start=1.0e6, min=-1e6, max=1e8);
  type Cv = Real (final quantity="Cv U.S.", final unit="m4/(s.N5)") 
                                                                  annotation (
      Documentation(info="<html>
<p><b>Version 1.0</b></p>
</HTML>
"));
  
  annotation (
    Icon(
      Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=1)),
      Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-120, 135; 120, 70],
        string="%name",
        style(color=1)),
      Text(
        extent=[-90, 40; 70, 10],
        string="Unites",
        style(
          color=9,
          fillColor=0,
          fillPattern=1)),
      Rectangle(extent=[-32, -6; 16, -35], style(color=0)),
      Rectangle(extent=[-32, -56; 16, -85], style(color=0)),
      Line(points=[16, -20; 49, -20; 49, -71; 16, -71], style(color=0)),
      Line(points=[-32, -72; -64, -72; -64, -21; -32, -21], style(color=0))),
    Documentation(info="<html>
</html>"));
  type Pressure_bar = Real (final quantity="Pressure", final unit="bar");
  type DifferentialPressure = Modelica.SIunits.AbsolutePressure(nominal=1.0e5, start=1.0e5, min=-1.0e9, max=1.0e9);
  type DifferentialTemperature = Modelica.SIunits.Temperature(nominal=100, start=0, min=-6000, max=6000);
end Units;
