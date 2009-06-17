TESTFILES = EmptyRecordTestConstructor.mos   EmptyRecordTestInput.mos \
	SimpleRecordTestConstructor.mos SimpleRecordTestInput.mos \
	NestedRecordTestConstructor.mos  NestedRecordTestInput.mos


# test that currently fail. Move up when fixed. 
FAILINGTESTFILES=


TEST = ./rtest

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
