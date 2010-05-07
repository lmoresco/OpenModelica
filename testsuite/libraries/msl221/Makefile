TEST = ../../rtest -v

TESTFILES = \
AIMC_DOL.mos FirstExample.mos PumpAndValve.mos\
AIMC_Inverter.mos FirstExample_Variant2.mos  PumpDropOut.mos\
AIMC_YD.mos FirstExample_Variant3.mos Rectifier.mos\
Friction.mos SMEE_Gen.mos\
AIMS_start.mos SMPM_Inverter.mos\
Accelerate.mos HeatingMOSInverter.mos   SMR_Inverter.mos\
BusUsage.mos HeatingRectifier.mos Sensors.mos\
CauerLowPassAnalog.mos IndirectCooling.mos ShowCompositeStep.mos\
CauerLowPassOPV.mos InitialConditions.mos ShowExceptions.mos\
CauerLowPassSC.mos  ShowLogicalSources.mos\
CharacteristicIdealDiodes.mos  LogicalNetwork1.mos  ShowSaturatingInductor.mos\
CharacteristicThyristors.mos LossyGearDemo1.mos ShowVariableResistor.mos\
ChuaCircuit.mos  LossyGearDemo2.mos   SignConvention.mos SignConvention2.mos\
ControlledTanks.mos Motor.mos SimpleCooling.mos\
CoupledClutches.mos NandGate.mos TestNand.mos\
DCEE_start.mos OneMass.mos TransformerYD.mos\
DCPM_start.mos   OneWayRectifier.mos  TransformerYY.mos\
DCSE_start.mos   OneWayRectifierBG.mos  TwoMass.mos\
Damper.mos   Oscillator.mos   TwoMasses.mos\
DifferentialAmplifier.mos  PID_Controller.mos \
ElasticBearing.mos   ParallelCooling.mos \
ParallelPumpDropOut.mos  WhyArrows.mos WhyArrows2.mos\
ExecutionPaths.mos \
First.mos    PreLoad.mos \
PullinStroke.mos MotionCycleWithLoad.mos EnforcedMovement.mos


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
