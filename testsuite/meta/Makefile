# BuiltinReal.mos fails when using Cevalfunc.mo! the values are OK, the display is different! 
TEST = ../rtest

TESTFILES = \
AlgPatternm.mos \
BuiltinArray.mos \
BuiltinBoolean.mos \
BuiltinInteger.mos \
BuiltinList.mos \
BuiltinMisc.mos \
BuiltinReal.mos \
BuiltinString.mos \
ComplicatedInteractive.mos \
Equality.mos \
EqPatternm.mos \
ErrorInteractiveCallFunctionPtr.mos \
ErrorMatchNumOutput.mos \
Failure.mos \
List1.mos \
List2.mos \
List3.mos \
ListInteractive.mos \
MatchCase1.mos \
MatchCase2.mos \
MatchCase3.mos \
MatchCase4.mos \
MatchCase5.mos \
MatchCase6.mos \
MatchCase7.mos \
MatchCase8.mos \
MatchCase9.mos \
MatchCase10.mos \
MatchCase11.mos \
MatchCase12.mos \
MatchCase13.mos \
MatchCaseInteractive1.mos \
MatchCaseInteractive2.mos \
MatchCaseInteractive3.mos \
MatchElse1.mos \
MatchIfEquation1.mos \
OptionInteractive.mos \
PartialFn1.mos \
PartialFn2.mos \
PartialFn3.mos \
PartialFn4.mos \
PartialFn5.mos \
PartialFn6.mos \
PartialFn7.mos \
PartialFn8.mos \
PartialFn10.mos \
PartialFn11.mos \
PartialFn12.mos \
PartialFn13.mos \
PartialFn14.mos \
Polymorphic.mos \
Recursive.mos \
Shadowing1.mos \
Shadowing2.mos \
TupleInteractive.mos \
Uniontype1.mos \
Uniontype2.mos \
Uniontype3.mos \
Uniontype4.mos \
Uniontype5.mos \
Uniontype6.mos \
Uniontype7.mos \
Uniontype8.mos \
Uniontype9.mos \
Uniontype10.mos \
Uniontype11.mos \
Uniontype12.mos \
Uniontype13.mos \
Uniontype14.mos \
Uniontype15.mos \
UtilTest.mos


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \
List4.mos \
PartialFn9.mos \

# Remove executables on Linux (no extension)
CLEAN = $(TESTFILES:.mos=) $(TESTFILES:.mos=_*) $(TESTFILES:.mos=.cpp) $(TESTFILES:.mos=.makefile) $(TESTFILES:.mos=.libs) $(TESTFILES:.mos=.log) output.log *.dll *.exe *.so

.PHONY : test

test: test2 clean
test2:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)

clean:
	@rm -f $(CLEAN)
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
