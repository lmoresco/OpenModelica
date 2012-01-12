TEST = ../rtest -v 

TESTFILES = \
_forest.mos \
_scaling1.mos \
_scaling2.mos \
_nominal.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES = \

.PHONY : test failingtest

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)

failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
