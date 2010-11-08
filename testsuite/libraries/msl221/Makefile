TEST = ../../rtest -v

TESTFILES = \
AIMC_DOL.mos \
AIMC_Inverter.mos \
AIMC_YD.mos \
AIMS_start.mos \
Accelerate.mos \
BusUsage.mos \
CauerLowPassAnalog.mos \
CauerLowPassOPV.mos \
CauerLowPassSC.mos \
CharacteristicIdealDiodes.mos \
CharacteristicThyristors.mos \
ChuaCircuit.mos \
ControlledTanks.mos \
CoupledClutches.mos \
DCEE_start.mos \
DCPM_start.mos \
DCSE_start.mos \
Damper.mos \
DifferentialAmplifier.mos \
ElasticBearing.mos \
EnforcedMovement.mos \
ExecutionPaths.mos \
ExtractorTest.mos \
First.mos \
FirstExample.mos \
FirstExample_Variant2.mos \
FirstExample_Variant3.mos \
Friction.mos \
HeatingMOSInverter.mos \
HeatingRectifier.mos \
IndirectCooling.mos \
InitialConditions.mos \
LogicalNetwork1.mos \
LossyGearDemo1.mos \
LossyGearDemo2.mos \
MotionCycleWithLoad.mos \
Motor.mos \
NandGate.mos \
OneMass.mos \
OneWayRectifier.mos \
OneWayRectifierBG.mos \
Oscillator.mos \
PID_Controller.mos \
ParallelCooling.mos \
ParallelPumpDropOut.mos \
PreLoad.mos \
PullinStroke.mos \
PumpAndValve.mos \
PumpDropOut.mos \
Rectifier.mos \
SMEE_Gen.mos \
SMPM_Inverter.mos \
SMR_Inverter.mos \
Sensors.mos \
ShowCompositeStep.mos \
ShowExceptions.mos \
ShowLogicalSources.mos \
ShowSaturatingInductor.mos \
ShowVariableResistor.mos \
SignConvention.mos \
SimpleCooling.mos \
TestNand.mos \
TransformerYD.mos \
TransformerYY.mos \
TwoMass.mos \
TwoMasses.mos \
WhyArrows.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \

.PHONY : test sim

all: test sim

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) \
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES) \

sim:
	@make -C Electrical -f Makefile test 
	@make -C Mechanics -f Makefile test 

simfailingtest:
	@make -C Electrical -f Makefile failingtest
	@make -C Mechanics -f Makefile failingtest
