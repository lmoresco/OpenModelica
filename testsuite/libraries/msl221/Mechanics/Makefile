TEST = ../../../rtest -v

TESTFILES = \
ElasticBearing2.mos \
First2.mos \
Oscillator2.mos \
Sensors2.mos \
SignConvention2.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \
Accelerate2.mos \
CoupledClutches2.mos \
Damper2.mos \
Friction2.mos \
FrictionRotationalSim.mos \
InitialConditions2.mos \
LossyGearDemo1Sim.mos \
LossyGearDemo2Sim.mos \
WhyArrows2.mos \

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
