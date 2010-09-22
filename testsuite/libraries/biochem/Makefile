ifdef OMDEV
SEP=";"
else
SEP=":"
endif
OPENMODELICALIBRARY := ../../../libraries/msl221/$(SEP)../../../libraries/common/

TESTFILES = \
EnzMM.mos Glycolysis.mos InsulinSignaling_Sedaghat.mos \
UniBi.mos UniUni.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

TEST = ../../rtest -v


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
