
TESTFILES = \
Engine1.mos  Engine2.mos  FourBar1.mos  FourBar2.mos  TwoLoop.mos  robot.mos

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
