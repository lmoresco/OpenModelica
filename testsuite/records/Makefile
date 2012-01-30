TEST = ../rtest -v

TESTFILES = \
 Derived1.mo Derived2.mo \
 EmptyRecordTestConstructor.mos   EmptyRecordTestInput.mos \
 SimpleRecordTestConstructor.mos SimpleRecordTestInput.mos \
 NestedRecordTestConstructor.mos  NestedRecordTestInput.mos \
 OperatorOverloadComplex.mo OperatorOverloadComplexArray.mo \
 RecordClassModOutput.mo \
 RecordModifications.mo \
 RecordParameters.mos RecordVariability.mo \
 RecordFuncParam.mo RecordFuncParam.mos \
 RecordBindingsOrdered.mo

# test that currently fail. Move up when fixed. 
FAILINGTESTFILES=NONE

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
