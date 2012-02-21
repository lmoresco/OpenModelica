TEST = ../../rtest -v

TESTFILES = \
instantiatePlanarMechanicsV4.mos \
checkPlanarMechanicsV4.mos 
# put simulatePlanarMechanicsV4.mos in here when we have results from other tools.

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
