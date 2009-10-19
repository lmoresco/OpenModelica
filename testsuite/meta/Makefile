
TESTFILES = MatchCase1.mos MatchCase2.mos MatchCase3.mos MatchCase4.mos MatchCase5.mos MatchCase6.mos MatchCase7.mos MatchCase8.mos MatchCase9.mos List1.mos List2.mos List3.mos\
  OptionInteractive.mos ListInteractive.mos TupleInteractive.mos ComplicatedInteractive.mos \
  MatchCaseInteractive1.mos MatchCaseInteractive2.mos MatchCaseInteractive3.mos \
  Uniontype1.mos Uniontype2.mos Uniontype3.mos Uniontype4.mos Uniontype5.mos Uniontype6.mos Uniontype7.mos Uniontype8.mos Uniontype9.mos Uniontype10.mos Uniontype11.mos Uniontype12.mos Uniontype13.mos \
  PartialFn1.mos PartialFn2.mos PartialFn3.mos PartialFn4.mos PartialFn5.mos PartialFn6.mos PartialFn7.mos PartialFn8.mos PartialFn9.mos \
  BuiltinBoolean.mos BuiltinInteger.mos BuiltinReal.mos BuiltinString.mos BuiltinList.mos BuiltinMisc.mos \
  Recursive.mos Failure.mos Equality.mos Shadowing1.mos Shadowing2.mos EqPatternm.mos Polymorphic.mos
# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= \

TEST = ./rtest -v
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
	make -C MetaModelicaDev | grep succeeded
    
clean:
	rm -f $(CLEAN)
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
