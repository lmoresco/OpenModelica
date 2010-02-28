TESTFILES = EmptyRecordTestConstructor.mos   EmptyRecordTestInput.mos \
	SimpleRecordTestConstructor.mos SimpleRecordTestInput.mos \
	NestedRecordTestConstructor.mos  NestedRecordTestInput.mos \
        RecordModifications.mo \
	RecordParameters.mos RecordVariability.mo

# test that currently fail. Move up when fixed. 
FAILINGTESTFILES=NONE


TEST = ./rtest -v

.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
	@rm -f RecordTest_*
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
