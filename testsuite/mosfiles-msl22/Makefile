TEST = ../rtest -v

TESTFILES = \
avg.mos \
BearingFrictionTest.mos \
blockssources.mos \
blockssystems.mos \
FuncCross.mos \
InitTest.mos \
InputOutput.mos \
LossyGear1.mos \
MatrixTest.mos \
rotationalgears.mos \
rotationalspringinertia.mos \
rotationalsystems.mos \
simulation2.mos \
TrapezoidTest.mos \
tupleTest.mos

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
