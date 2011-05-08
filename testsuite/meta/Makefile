# BuiltinReal.mos fails when using Cevalfunc.mo! the values are OK, the display is different! 
TEST = ../rtest -v

TESTFILES = \
AlgPatternm.mos \
AllWild.mos \
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
ErrorInvalidComplexType.mo \
ErrorInvalidMetarecord.mo \
ErrorInvalidPattern1.mo \
ErrorInvalidPattern2.mo \
ErrorInvalidPattern3.mo \
ErrorInvalidPattern4.mo \
ErrorLocalElement1.mo \
ErrorLocalElement2.mo \
ErrorMatchInOut1.mo \
ErrorMatchNumOutput.mos \
ErrorNone.mos \
Failure.mos \
List1.mos \
List2.mos \
List3.mos \
List4.mo \
List5.mo \
ListInteractive.mos \
ListReductionCodegen.mo \
ListReductionDimError.mo \
ListReductionInterpret.mo \
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
MatchCase14.mo \
MatchCase15.mo \
MatchCase16.mo \
MatchCase17.mo \
MatchCaseInteractive1.mos \
MatchCaseInteractive2.mos \
MatchCaseInteractive3.mos \
MatchElse1.mos \
MatchIfEquation1.mos \
OptimizeContinue.mo \
OptimizeMatchToIfExp.mo \
OptionInteractive.mos \
PartialFn1.mo \
PartialFn2.mo \
PartialFn3.mos \
PartialFn4.mo \
PartialFn5.mo \
PartialFn6.mo \
PartialFn7.mo \
PartialFn8.mos \
PartialFn10.mos \
PartialFn11.mos \
PartialFn12.mos \
PartialFn13.mos \
PartialFn14.mos \
PartialFn15.mo \
Polymorphic.mos \
Polymorphic2.mos \
Recursive.mos \
Shadowing1.mos \
Shadowing2.mos \
Simplify1.mos \
StrictRML.mos \
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
Uniontype15.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \
PartialFn9.mos

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
