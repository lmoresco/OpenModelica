


class SmallPlantModified "Small WWTP Configuration" 
  import WasteWater;
  extends Modelica.Icons.Example;
  
  //Q_air=12100.99290780142 is equal to a Kla of 3.5 h^-1 from COST benchmark
  //Q_air=34574.2654508612 is equal to a Kla of 10 h^-1 from COST benchmark
  
  annotation (
    Coordsys(
      extent=[-120, -100; 120, 105],
      grid=[1, 1],
      component=[20, 20]),
    Window(
      x=0.33,
      y=0.04,
      width=0.85,
      height=0.87),
    Diagram(Line(points=[-22, 58; -22, 58], style(color=3))),
    Documentation(info="This fictitious plant provides an ASM1 example model with a small number of equations.
It consists of one denitrification and 2 nitrification tanks and a settler.

Change into the directory ../ASM1 and translate the model.
Before simulating the model load initial values from the script file small_asm1.mos
that is provided besides the model.
A 14 days dynamic influent data file is provided. So you may simulate up to 14 days.
But start with 1 day as it may take some time for simulation.
After simulation you may have a look at internal concentrations but most interesting
are the relevant concentrations at the effluent of a plant which can be viewed via the 
sensors at the effluent of the secondary clarifier.

Main Author:
   Gerald Reichl
   Technische Universitaet Ilmenau
   Faculty of Informatics and Automation
   Department Dynamics and Simulation of ecological Systems
   P.O. Box 10 05 65
   98684 Ilmenau
   Germany
   email: gerald.reichl@tu-ilmenau.de
"));
  WasteWater.ASM1.EffluentSink Effluent 
                             annotation (extent=[88, -28; 108, -8]);
  WasteWater.ASM1.SludgeSink WasteSludge 
                              annotation (extent=[87, -51; 107, -31]);
  WasteWater.ASM1.divider2 divider 
                        annotation (extent=[20, -6; 40, 14]);
  WasteWater.ASM1.nitri tank3(V=1333) 
                           annotation (extent=[-6, -6; 14, 14]);
  WasteWater.ASM1.nitri tank2(V=1333) 
                           annotation (extent=[-34, -6; -14, 14]);
  WasteWater.ASM1.deni tank1(V=3000) 
                          annotation (extent=[-65, -6; -45, 14]);
  WasteWater.ASM1.mixer3 mixer 
                    annotation (extent=[-104, 22; -84, 42]);
  WasteWater.ASM1.WWSource WWSource 
                         annotation (extent=[-40,76; -20,96]);
  WasteWater.ASM1.blower blower1(Q_max=34574.2654508612) 
                                              annotation (extent=[-33, -62; -
        13, -42]);
  WasteWater.ASM1.blower blower2(Q_max=34574.2654508612) 
                                              annotation (extent=[-6, -62; 14,
          -42]);
  WasteWater.ASM1.sensor_O2 sensor_O2 
                           annotation (extent=[0, 24; 20, 44]);
  Modelica.Blocks.Math.Feedback Feedback annotation (extent=[62, 40; 82, 60]);
  Modelica.Blocks.Continuous.PI PI1(k={500}, T={0.001}) annotation (extent=[
        88, 40; 108, 60]);
  Modelica.Blocks.Sources.Constant Constant1 annotation (extent=[-67, -87; -
        47, -67]);
  WasteWater.ASM1.pump RecyclePump(Q_max=46115) 
                                     annotation (extent=[-94, -22; -74, -2],
      rotation=180);
  WasteWater.ASM1.pump ReturnPump(Q_max=9223) 
                                   annotation (extent=[16, -36; 36, -16],
      rotation=180);
  WasteWater.ASM1.pump WastePump(Q_max=193) 
                                 annotation (extent=[59, -55; 79, -35]);
  Modelica.Blocks.Sources.Constant Constant2 annotation (extent=[22, -68; 42,
          -48]);
  Modelica.Blocks.Sources.Constant Temperature(k={15}) annotation (extent=[-
        94, 50; -82, 62]);
  WasteWater.ASM1.sensor_NH sensor_NH1 
                       annotation (extent=[64, 15; 80, 31]);
  WasteWater.ASM1.sensor_NO sensor_NO1 annotation (extent=[81, 15; 97, 31]);
  WasteWater.ASM1.sensor_TKN sensor_TKN1 annotation (extent=[97, 14; 113, 30]);
  WasteWater.ASM1.sensor_COD sensor_COD1 annotation (extent=[97, -5; 113, 11]);
  Modelica.Blocks.Sources.Step OxygenSetpoint(height={1.5}) annotation (
      extent=[37, 40; 57, 60]);
  WasteWater.ASM1.SecClar.Krebs.SecClarModKrebs Settler annotation (extent=[
        48, -4; 68, 16]);
  WasteWater.ASM1.sensor_TSS sensor_TSS1 annotation (extent=[32, 14; 49, 30]);
  Modelica.Blocks.Sources.Constant Constant3(k={10738.5,30.0,63.6346,58.476,
        224.351,31.425,0.0,0.0,0.0,0.0,30.2476,6.36343,11.814,7.0}) 
    annotation (extent=[-121,84; -96,101]);
equation 
  connect(tank3.Out, divider.In) annotation (points=[14,4; 17,4; 17,4.3; 20,4.3]);
  connect(mixer.Out, tank1.In) annotation (points=[-84,31.6; -77,31.6; -77,4;
        -65,4]);
  connect(mixer.In1, WWSource.Out) annotation (points=[-104,35.5; -104,74; -68,
        74; -68,79; -20.2,79]);
  connect(blower2.AirOut, tank3.AirIn) annotation (points=[3,-42; 3,-23.9; 4,
        -23.9; 4,-5.8]);
  connect(Feedback.outPort, PI1.inPort) annotation (points=[81, 50; 86, 50]);
  connect(PI1.outPort, blower2.u) annotation (points=[109,50; 114,50; 114,-84;
        18,-84; 18,-55; 13.8,-55; 13.8,-55]);
  connect(divider.Out2, RecyclePump.In) annotation (points=[40,2.5; 44,2.5; 44,
        -8.7; -74,-8.7]);
  connect(RecyclePump.Out, mixer.In3) annotation (points=[-94,-14.8; -104,-14.8; 
        -104,27.5]);
  connect(ReturnPump.Out, mixer.In2) annotation (points=[16,-28.8; 15.5,-28.8; 
        15.5,-30; -112,-30; -112,31.5; -104,31.5]);
  connect(sensor_O2.So, Feedback.inPort2) annotation (points=[19.8,34; 72,34;
        72,42]);
  connect(Temperature.outPort, tank1.T) annotation (points=[-81.4,56; -71,56;
        -71,8; -65,8],       style(color=3));
  connect(Temperature.outPort, tank2.T) annotation (points=[-81.4,56; -39,56;
        -39,8; -34,8],       style(color=3));
  connect(Temperature.outPort, tank3.T) annotation (points=[-81.4,56; -39,56;
        -39,14; -5.9,14; -5.9,8; -6,8],           style(color=3));
  connect(OxygenSetpoint.outPort, Feedback.inPort1) annotation (points=[58,
        50; 64, 50], style(color=3));
  connect(Constant1.outPort, blower1.u) annotation (points=[-46,-77; -7.2,-77;
        -7.2,-55; -13.2,-55],       style(color=3));
  connect(WastePump.Out, WasteSludge.In) annotation (points=[79,-42.2; 81,-42.2;
        81,-42.4; 83,-42.4; 83,-42.2; 87,-42.2]);
  connect(WastePump.u, Constant2.outPort) annotation (points=[60.1,-42.5; 46,
        -42.5; 46,-58; 43,-58],style(color=3));
  connect(tank2.Out, tank3.In) annotation (points=[-14,4; -6,4]);
  connect(tank1.Out, tank2.In) annotation (points=[-45,4; -34,4]);
  connect(blower1.AirOut, tank2.AirIn) annotation (points=[-24,-42; -24,-24; 
        -24,-5.8; -24,-5.8]);
  connect(Constant1.outPort, RecyclePump.u) annotation (points=[-46,-77; -39,
        -77; -39,-14.5; -75.1,-14.5], style(color=3));
  connect(Settler.Effluent, Effluent.In) annotation (points=[68.2,11.7; 78,11.7;
        78,-16; 88,-16]);
  connect(Settler.Return, ReturnPump.In) annotation (points=[55,-3.6; 55,-22.7; 
        36,-22.7]);
  connect(WastePump.In, Settler.Waste) annotation (points=[59,-48.3; 52,-48.3; 
        52,-31; 61,-31; 61,-3.6]);
  connect(sensor_NH1.In, Settler.Effluent) annotation (points=[72,15; 72,11.7;
        68.2,11.7]);
  connect(sensor_NO1.In, Settler.Effluent) annotation (points=[89,15; 89,11.7;
        68.2,11.7]);
  connect(sensor_TKN1.In, Settler.Effluent) annotation (points=[105,14; 105,
        11.7; 68.2,11.7]);
  connect(sensor_COD1.In, Settler.Effluent) annotation (points=[105,-5; 105,
        11.7; 68.2,11.7]);
  connect(Constant2.outPort, ReturnPump.u) annotation (points=[43, -58; 48, -
        58; 48, -28.5; 34.9, -28.5], style(color=3));
  connect(divider.Out1, Settler.Feed) annotation (points=[40,6.6; 44.5,6.6;
        44.5,7.4; 48,7.4]);
  connect(tank3.MeasurePort, sensor_O2.In) annotation (points=[9.5,8.5; 9.5,
        15.75; 10,15.75; 10,24]);
  connect(sensor_TSS1.In, divider.Out1) annotation (points=[40.5,14; 40.5,10.6;
        40,10.6; 40,6.6]);
  
  connect(Constant3.outPort, WWSource.data) annotation (points=[-94.75,92.5; 
        -85.5,92.5; -85.5,86; -39,86],
                               style(color=3, rgbcolor={0,0,255}));
end SmallPlantModified;
