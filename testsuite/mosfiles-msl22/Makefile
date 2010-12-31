TEST = ../rtest -v

TESTFILES = \
avg.mos \
BearingFrictionTest.mos \
Backlash.mos \
blockssources.mos \
Circuit1.mos \
DCMotorBlocks.mos \
DCMotorDeadzone.mos \
DCMotorRotational.mos \
ElasticBearing.mos \
First.mos \
FuncCross.mos \
Gear.mos \
Gear2.mos \
IdealGear.mos \
IdealGearBrake.mos \
InitTest.mos \
InputOutput.mos \
MatrixTest.mos \
Shaft.mos \
simulation2.mos \
SineAccelerate.mos \
SineSpeed.mos \
SineTorque.mos \
SineTorque2inertias.mos \
SpringMass.mos \
StepTorque.mos \
Tank.mos \
TrapezoidTest.mos \
tupleTest.mos \
WeakAxis.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=\
LossyGear1.mos

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
