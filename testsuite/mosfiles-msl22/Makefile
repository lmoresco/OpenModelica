TEST = ../rtest -v

TESTFILES = \
blockssources.mos \
blockssystems.mos \
rotationalgears.mos \
rotationalspringinertia.mos \
rotationalsystems.mos \
simulation2.mos \
simulation3.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=NONE

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
