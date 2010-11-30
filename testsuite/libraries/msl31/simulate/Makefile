TEST = ../../../rtest -v

TESTFILES = \
Modelica.Blocks.Examples.mos \
Modelica.Electrical.Analog.Examples.mos \
Modelica.Electrical.Digital.Examples.mos \
Modelica.Electrical.Machines.Examples.mos \
Modelica.Electrical.MultiPhase.Examples.mos \


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
