# BuiltinReal.mos fails when using Cevalfunc.mo! the values are OK, the display is different! 
TEST = ../rtest

TESTFILES = \
DumpTest.mos \
HashTableTest.mos \
MainTest.mos \
SimCodeTest.mos \
SimplifyTest.mos \
SusanTest.mos \
UtilTest.mos


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \
NONE

# Remove executables on Linux (no extension)
CLEAN = $(TESTFILES:.mos=) $(TESTFILES:.mos=_*) $(TESTFILES:.mos=.cpp) $(TESTFILES:.mos=.makefile) $(TESTFILES:.mos=.libs) $(TESTFILES:.mos=.log) output.log *.dll *.exe *.so

.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
	@rm -f $(CLEAN:.mo=)
clean:
	@rm -f $(CLEAN:.mo=)
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
