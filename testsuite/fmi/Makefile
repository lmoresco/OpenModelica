TEST = ../rtest +simCodeTarget=c -v

TESTFILES = 


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \
BouncingBall.mos \
HelloFMIWorld.mos \
ExternalFMUs.mos \

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
