TEST = ../../../rtest -v

TESTFILES = Accelerate2.mos \
CoupledClutches2.mos \
Damper2.mos \
ElasticBearing2.mos \
First2.mos \
InitialConditions2.mos \
#LossyGearDemo1Sim.mos \
#LossyGearDemo2Sim.mos \
Oscillator2.mos \
Sensors2.mos \
SignConvention2.mos \
WhyArrows2.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \
Friction2.mos \
FrictionRotationalSim.mos \

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
