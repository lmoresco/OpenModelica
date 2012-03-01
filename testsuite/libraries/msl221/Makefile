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
FAILINGTESTFILES=\
PreLoad2.mos 

# Dependency files that are not .mo .mos or Makefile
# Add them here or they will be cleaned.
DEPENDENCIES = \
*.mo \
*.mos \
Makefile \
Electrical \
Mechanics \
modelicaAdditions


CLEAN = `ls | grep -w -v -f deps.tmp`

.PHONY : test clean getdeps failingtest testflat testsim

test: testflat

testflat:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) 
	
# Cleans all files that are not listed as dependencies 
clean :
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)
	@$(MAKE) -C Electrical -f Makefile clean
	@$(MAKE) -C Mechanics -f Makefile clean
	

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the 
# list in deps.txt
getdeps: 
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt	
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES
	
failingtest:
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES) \

testsim: electrical mechanical

electrical:
	@$(MAKE) -C Electrical -f Makefile test 
mechanical:
	@$(MAKE) -C Mechanics -f Makefile test 

simfailingtest:
	@$(MAKE) -C Electrical -f Makefile failingtest
	@$(MAKE) -C Mechanics -f Makefile failingtest
