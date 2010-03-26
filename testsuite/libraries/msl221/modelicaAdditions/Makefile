
TESTFILES = \
Engine1Total.mo  FourBar1Total.mo \
TwoLoopTotal.mo  Engine2Total.mo  FourBar2Total.mo  \
PendulumTotal.mo  robotTotal.mo


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

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
