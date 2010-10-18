TEST = ../../../rtest -v

TESTFILES = \
Engine1a.mos \
Engine1b.mos \
Engine1b_analytic.mos \
Fourbar1.mos \
Fourbar2.mos \
Fourbar_analytic.mos \
PlanarLoops_analytic.mos \
EngineV6.mos \
EngineV6_analytic.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

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
