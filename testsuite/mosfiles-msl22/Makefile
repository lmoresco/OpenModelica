TEST = ../rtest -v

TESTFILES = \
avg.mos \
Backlash.mos \
blockssources.mos \
Circuit1.mos \
DCMotorBlocks.mos \
DCMotorDeadzone.mos \
DCMotorRotational.mos \
ElasticBearing.mos \
First.mos \
FuncCross.mos \
IdealGear.mos \
IdealGearBrake.mos \
InputOutput.mos \
InitTest.mos \
MatrixTest.mos \
NonLinsys.mos \
Shaft.mos \
simulation2.mos \
SineAccelerate.mos \
SineSpeed.mos \
SineTorque.mos \
SineTorque2inertias.mos \
SpringMass.mos \
StepTorque.mos \
Tank.mos \
Test3PhaseInit.mos \
Test3PhaseInitParam.mos \
Test3PhaseInitOver.mos \
Test3PhaseStart.mos \
TimeVaryingLinsys.mos \
TrapezoidTest.mos \
tupleTest.mos \
WeakAxis.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=\
BearingFrictionTest.mos \
LossyGear1.mos \
Gear.mos \
Gear2.mos \

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
