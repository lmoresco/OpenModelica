TEST = ../../rtest -v

TESTFILES = \
Modelica.Electrical.Machines.Examples.mos Modelica.Electrical.MultiPhase.Examples.mos

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

sim:
	@make -C Electrical -f Makefile test 
	@make -C Mechanics -f Makefile test 

simfailingtest:
	@make -C Electrical -f Makefile failingtest
	@make -C Mechanics -f Makefile failingtest
