# BuiltinReal.mos fails when using Cevalfunc.mo! the values are OK, the display is different! 
TEST = ../rtest
PATH := ./:${PATH}

PATH := ${PATH}:./

TESTFILES = linmodel.mos \
simVanDerPol.mos \
smallValues.mos \
simLotkaVolterra.mos \
simTwoTank.mos \
simNonlinear.mos \
simextfunction.mos \
test_02.mos \
test_03.mos \
test_04.mos \
test_05.mos \
testknownvar.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= test_01.mos test_06.mos

# Remove executables on Linux (no extension)
CLEAN = $(TESTFILES:.mos=) $(TESTFILES:.mos=_*) $(TESTFILES:.mos=.cpp) $(TESTFILES:.mos=.makefile) $(TESTFILES:.mos=.libs) $(TESTFILES:.mos=.log) output.log *.dll *.exe *.so

.PHONY : test

test: test2 clean
test2:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME =" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)

clean:
	@rm -f $(CLEAN)

failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
