TEST = ../rtest -v

TESTFILES = \
valve_test.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \
paralleFlowEVA_test.mos \

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
