TEST = ../../rtest -v

TESTFILES = \
Modelica.Electrical.Machines.Examples.mos \
Modelica.Electrical.MultiPhase.Examples.mos \
Modelica.Math.mos \
Modelica.Electrical.Analog.mos \
Modelica.Mechanics.MultiBody.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \

.PHONY : test

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
