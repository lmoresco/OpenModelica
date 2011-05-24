package Examples 
  import SI = Modelica.SIunits;


  model Test_pressDropLinear 
    Components.SourceP sourceP(T=300,p=2e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.PressDropLinear pressDropLinear(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
  equation 
    //sourceP--pressDropLinear--sinkP
    connect(sourceP.flange, pressDropLinear.inlet);
    connect(pressDropLinear.outlet, sinkP.flange);
  end Test_pressDropLinear;


  model Test_valveLinear 
    Components.SourceP sourceP(T=300,p=2e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp ramp(height=-0.5,duration=1,offset=1,startTime=1);
  equation 
    //sourceP--valveLinear--sinkP
    connect(sourceP.flange, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(ramp.y, valveLinear.u);
  end Test_valveLinear;


  model Test_pump
    Components.SourceP sourceP(T=300,p=2e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp ramp(height=-0.5*1e-5,duration=1,offset=1*1e-5,startTime=1);
  equation 
    //sourceP--pump--sinkP
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, sinkP.flange);
    connect(ramp.y, pump.cmd);
  end Test_pump;


  model Test_pd_vo_pd
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_initial_state volume(V=0.02,T_start=300,p_start=2e5);
  equation
    connect(sourceP.flange, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, sinkP.flange);
  end Test_pd_vo_pd;

  model Test_pd_vo_pd_SS
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_steady_state volume(V=0.02,T_start=310,p_start=2.1e5);
  equation
    connect(sourceP.flange, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, sinkP.flange);
  end Test_pd_vo_pd_SS;


  model Test_pu_pd_vo_pd
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5);//(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5);//(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_initial_state volume(V=0.02,T_start=300,p_start=2e5);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp ramp(height=0.5*1e-5,duration=1,offset=0.5*1e-5,startTime=1);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, sinkP.flange);
    connect(pump.cmd, ramp.y);
  end Test_pu_pd_vo_pd;

  model Test_pu_pd_vo_pd_SS
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5);//(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5);//(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_steady_state volume(V=0.02,T_start=310,p_start=2.1e5);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp ramp(height=0.5*1e-5,duration=1,offset=0.5*1e-5,startTime=1);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, sinkP.flange);
    connect(pump.cmd, ramp.y);
  end Test_pu_pd_vo_pd_SS;


  model Test_pu_ms_pd_vo_pd
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5);//(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5);//(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_initial_state volume(V=0.02,T_start=300,p_start=2e5);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp ramp(height=0.5*1e-5,duration=1,offset=0.5*1e-5,startTime=1);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, sinkP.flange);
    connect(pump.cmd, ramp.y);
  end Test_pu_ms_pd_vo_pd;


  model Test_pu_ms_pd_vo_pd_vl
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.PressDropLinear pressDropLinear_l(Kv=1/1e5);//(Kv=1/1e5,in_p_start=3e5,out_p_start=2e5);
    Components.PressDropLinear pressDropLinear_r(Kv=1/1e5);//(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Components.Volume_initial_state volume(V=0.02,T_start=300,p_start=2e5);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp pump_ramp(height=0.5*1e-3,duration=1,offset=0.5*1e-5,startTime=1);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=5);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_l.inlet);
    connect(pressDropLinear_l.outlet, volume.inlet);
    connect(volume.outlet, pressDropLinear_r.inlet);
    connect(pressDropLinear_r.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(pump.cmd, pump_ramp.y);
    connect(valveLinear.u, valve_ramp.y);
  end Test_pu_ms_pd_vo_pd_vl;


  model Test_pu_ms_pd_vo_pd_vl_pd
    Components.SourceP sourceP(T=300,p=4e5);
    Components.SinkP sinkP(T=300,p=4.5e5);
    Components.PressDropLinear pressDropLinear_ul(Kv=1/0.5e5,in_p_start=7e5,out_p_start=6.5e5);
    Components.PressDropLinear pressDropLinear_ur(Kv=1/0.5e5,in_p_start=6.5e5,out_p_start=6e5);
    Components.Volume_initial_state volume_u(V=0.02,T_start=300,p_start=6.5e5);
    Components.PumpVolumetric pump(in_p_start=4e5,out_p_start=7e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp pump_ramp(height=0,duration=1,offset=1e-3);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=6e5,out_p_start=5e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=5);
    Components.PressDropLinear pressDropLinear_dl(Kv=1/0.5e5,in_p_start=5e5,out_p_start=4.5e5);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_ul.inlet);
    connect(pressDropLinear_ul.outlet, volume_u.inlet);
    connect(volume_u.outlet, pressDropLinear_ur.inlet);
    connect(pressDropLinear_ur.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, pressDropLinear_dl.inlet);
    connect(pressDropLinear_dl.outlet, sinkP.flange);    
    connect(pump.q, pump_ramp.y);
    connect(valveLinear.u, valve_ramp.y);
  end Test_pu_ms_pd_vo_pd_vl_pd;


  model Test_pu_ms_pd_vo_pd_vl_pd_vo_pd
    Components.SourceP sourceP(T=300,p=4e5);
    Components.SinkP sinkP(T=300,p=4e5);
    Components.PressDropLinear pressDropLinear_ul(Kv=1/0.5e5,in_p_start=7e5,out_p_start=6.5e5);
    Components.PressDropLinear pressDropLinear_ur(Kv=1/0.5e5,in_p_start=6.5e5,out_p_start=6e5);
    Components.Volume_initial_state volume_u(V=0.02,T_start=300,p_start=6.5e5);
    Components.PumpVolumetric pump(in_p_start=4e5,out_p_start=7e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp pump_ramp(height=0,duration=1,offset=1e-3);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=6e5,out_p_start=5e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=5);
    Components.PressDropLinear pressDropLinear_dl(Kv=1/0.5e5,in_p_start=5e5,out_p_start=4.5e5);
    Components.Volume_initial_state volume_d(V=0.02,T_start=300,p_start=4.5e5);
    Components.PressDropLinear pressDropLinear_dr(Kv=1/0.5e5,in_p_start=4.5e5,out_p_start=4e5);
  equation
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_ul.inlet);
    connect(pressDropLinear_ul.outlet, volume_u.inlet);
    connect(volume_u.outlet, pressDropLinear_ur.inlet);
    connect(pressDropLinear_ur.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, pressDropLinear_dl.inlet);
    connect(pressDropLinear_dl.outlet, volume_d.inlet);    
    connect(volume_d.outlet, pressDropLinear_dr.inlet);
		connect(pressDropLinear_dr.outlet, sinkP.flange);    
    connect(pump.q, pump_ramp.y);
    connect(valveLinear.u, valve_ramp.y);
  end Test_pu_ms_pd_vo_pd_vl_pd_vo_pd;

  model Test_Closed
    Components.PressDropLinear pressDropLinear_ul(Kv=1/0.5e5,in_p_start=7e5,out_p_start=6.5e5);
    Components.PressDropLinear pressDropLinear_ur(Kv=1/0.5e5,in_p_start=6.5e5,out_p_start=6e5);
    Components.Volume_initial_state volume_u(V=0.02,T_start=300,p_start=6.5e5);
    Components.PumpVolumetric pump(in_p_start=4e5,out_p_start=7e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp pump_ramp(height=0,duration=1,offset=1e-3);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=6e5,out_p_start=5e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=5);
    Components.PressDropLinear pressDropLinear_dl(Kv=1/0.5e5,in_p_start=5e5,out_p_start=4.5e5);
    Components.Volume_initial_state volume_d(V=0.02,T_start=300,p_start=4.5e5);
    Components.PressDropLinear pressDropLinear_dr(Kv=1/0.5e5,in_p_start=4.5e5,out_p_start=4e5);
  equation
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_ul.inlet);
    connect(pressDropLinear_ul.outlet, volume_u.inlet);
    connect(volume_u.outlet, pressDropLinear_ur.inlet);
    connect(pressDropLinear_ur.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, pressDropLinear_dl.inlet);
    connect(pressDropLinear_dl.outlet, volume_d.inlet);    
    connect(volume_d.outlet, pressDropLinear_dr.inlet);
		connect(pressDropLinear_dr.outlet, pump.inlet);    
    connect(pump.q, pump_ramp.y);
    connect(valveLinear.u, valve_ramp.y);
  end Test_Closed;

  model Test_Closed_SS "Closed loop circuit, steady-state equations, exact start values"
    Components.PressDropLinear pressDropLinear_ul(Kv=1/0.5e5,in_p_start=7e5,out_p_start=6.5e5);
    Components.PressDropLinear pressDropLinear_ur(Kv=1/0.5e5,in_p_start=6.5e5,out_p_start=6e5);
    Components.Volume_steady_state volume_u(V=0.02,T_start=300,p_start=6.5e5);
    Components.PumpVolumetric pump(in_p_start=4e5,out_p_start=7e5);
    Components.MassFlowRateSensor massFlowRateSensor;
    Modelica.Blocks.Sources.Ramp pump_ramp(height=0,duration=1,offset=1e-3);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=6e5,out_p_start=5e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=5);
    Components.PressDropLinear pressDropLinear_dl(Kv=1/0.5e5,in_p_start=5e5,out_p_start=4.5e5);
    Components.Volume_steady_state volume_d(V=0.02,T_start=300,p_start=4.5e5);
    Components.PressDropLinear pressDropLinear_dr(Kv=1/0.5e5,in_p_start=4.5e5,out_p_start=4e5);
  equation
    connect(pump.outlet, massFlowRateSensor.inlet);
    connect(massFlowRateSensor.outlet, pressDropLinear_ul.inlet);
    connect(pressDropLinear_ul.outlet, volume_u.inlet);
    connect(volume_u.outlet, pressDropLinear_ur.inlet);
    connect(pressDropLinear_ur.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, pressDropLinear_dl.inlet);
    connect(pressDropLinear_dl.outlet, volume_d.inlet);    
    connect(volume_d.outlet, pressDropLinear_dr.inlet);
		connect(pressDropLinear_dr.outlet, pump.inlet);    
    connect(pump.q, pump_ramp.y);
    connect(valveLinear.u, valve_ramp.y);
  end Test_Closed_SS;

	model Test_Closed_SS_Extra "Closed loop circuit, steady-state plus additional equation, exact start values"
	  extends Test_Closed_SS;
		Real check = pressDropLinear_ul.in_p_start;
	initial equation
	  pump.inlet.p = 4e5;
	end Test_Closed_SS_Extra;
	
	model Test_Closed_SS_Extra_Exact "Closed loop circuit, steady-state plus additional equation, approx start values"
	  extends Test_Closed_SS_Extra(volume_d(p_start = 4.5e5));
	end Test_Closed_SS_Extra_Exact;
	
	model Test_Closed_SS_Extra_NonExact "Closed loop circuit, steady-state plus additional equation, approx start values"
	  extends Test_Closed_SS_Extra(volume_d(p_start = 4.0e5));
	end Test_Closed_SS_Extra_NonExact;
	


  model Test_pipe
    /////////////////NOT WORKING///////////////////
    Components.SourceP sourceP(T=300,p=2e5);
    Components.SinkP sinkP(T=300,p=1e5);
    Components.Pipe pipe(Kv_p=0.1/1e5,diameter=0.01,length=0.1,p_start=2e5,T_start=300);
  initial equation
    //pipe.volume.medium.p=2e5;
    //pipe.volume.medium.T=3e2;
    //der(pipe.volume.medium.p)=0;
    //der(pipe.volume.medium.T)=0;  
  equation 
    //sourceP--pipe--sinkP
    connect(sourceP.flange, pipe.inlet);
    connect(pipe.outlet, sinkP.flange);
  end Test_pipe;

  model Test3 
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.PressDropLinear pressDropLinear(Kv=0.1/1e5);
    Components.Volume_initial_state volume(p_start=2e5,T_start=300,V=0.02);
    Components.ValveLinear valveLinear(Kv=0.1/1e5);
    Modelica.Blocks.Sources.Step step(height=-0.5,offset=1,startTime=10);
initial equation
volume.p_start=2e5;
  equation
    //sourceP--pressDropLinear--volume--valveLinear--sinkP
    connect(sourceP.flange, pressDropLinear.inlet);
    connect(pressDropLinear.outlet, volume.inlet);
    connect(volume.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(step.y, valveLinear.u);
  end Test3;



  model Test0 "This test gives no accurate results with OMC" 
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.Pipe pipe(Kv_p=0.1/1e5,diameter=0.01,length=0.1,p_start=2e5,T_start=300);
    //Components.Volume_initial_state volume(T_start=300,V=0.02,p_start=2.5e5);
    Components.ValveLinear valveLinear(Kv=0.1/1e5);
    Modelica.Blocks.Sources.Step step(height=-0.5,offset=1,startTime=100);
  equation
    //sourceP--pipe--valveLinear--sinkP
    connect(sourceP.flange, pipe.inlet);
    //connect(pipe.outlet, volume.inlet);
    //connect(volume.outlet, valveLinear.inlet);
    connect(pipe.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(step.y, valveLinear.u);
  initial equation 
    //der(volume.medium.p) = 0;
    //der(volume.medium.T) = 0;
    der(pipe.volume.medium.p) = 0;
    der(pipe.volume.medium.T) = 0;
    //pipe.volume.medium.p = 2e5;
    pipe.volume.medium.T = 3e2;
  end Test0;


  model Test1 "This test gives no accurate results with OMC" 
    Components.SourceP sourceP(T=300,p=3e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.Pipe pipe(Kv_p=0.1/1e5,T_start=300,diameter=0.01,length=0.1,p_start=2.5e5);
    Components.Volume_initial_state volume(T_start=300,V=0.02,p_start=2.2e5);
    Components.ValveLinear valveLinear(Kv=0.1/1e5);
    Modelica.Blocks.Sources.Step step(height=-0.5,offset=1,startTime=10);
  equation
    //sourceP--pipe--volume--valveLinear--sinkP
    connect(sourceP.flange, pipe.inlet);
    connect(pipe.outlet, volume.inlet);
    connect(volume.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(step.y, valveLinear.u);
  initial equation 
    der(volume.medium.p) = 0;
    der(volume.medium.T) = 0;
    der(pipe.volume.medium.p) = 0;
    der(pipe.volume.medium.T) = 0;
    pipe.volume.medium.p = 2.5e5;
    pipe.volume.medium.T = 3e2;
 end Test1;


/*
  model Test4
    Components.SourceP sourceP(T=300,p=2e5);
    Components.SinkP sinkP(p=1e5,T=300);
    Components.Pump pump(in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp pump_ramp(height=-0.5*1e-5,duration=1,offset=1*1e-5,startTime=1);
    Components.ValveLinear valveLinear(Kv=1/1e5,in_p_start=2e5,out_p_start=1e5);
    Modelica.Blocks.Sources.Ramp valve_ramp(height=-0.5,duration=1,offset=1,startTime=1);
  equation 
    //sourceP--pump--valve--sinkP
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(pump_ramp.y, pump.cmd);
    connect(valve_ramp.y, valveLinear.u);
  end Test4;


  model Test5 
    Components.SourceP sourceP(p=3e5, T=300);
    Components.SinkP sinkP(p=1e5, T=300);
    Components.Pipe pipe(Kv=0.1/1e5, T_start=300, diameter=0.01, length=0.1, p_start=2e5);
    Components.Volume_initial_state volume(T_start=300, V=0.02, p_start=2e5);
    Components.Pump pump;
    Components.ValveLinear valveLinear(Kv=0.1/1e5);
    Modelica.Blocks.Sources.Step pump_step(offset=0, startTime=100, height=0.001*1e-4);
    Modelica.Blocks.Sources.Step valve_step(offset=1, startTime=30, height=-0.1);

  equation 
    //sourceP--pump--pipe--volume--valveLinear--sinkP    
    connect(sourceP.flange, pump.inlet);
    connect(pump.outlet, pipe.inlet);    
    connect(pipe.outlet, volume.inlet);
    connect(volume.outlet, valveLinear.inlet);
    connect(valveLinear.outlet, sinkP.flange);
    connect(pump_step.y, pump.cmd);
    connect(valve_step.y, valveLinear.u);
  end Test5;


*/


end Examples;
