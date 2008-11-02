
TESTFILES = MatchCase1.mos MatchCase2.mos MatchCase3.mos MatchCase4.mos MatchCase5.mos MatchCase6.mos MatchCase7.mos MatchCase8.mos MatchCase9.mos List1.mos List2.mos List3.mos\

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \

TEST = ./rtest -v


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
