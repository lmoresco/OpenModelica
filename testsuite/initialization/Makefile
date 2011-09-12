TEST = ../rtest -v

TESTFILES = \
_forest.mos \

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
