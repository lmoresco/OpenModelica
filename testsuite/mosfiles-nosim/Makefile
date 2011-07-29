TEST = ../rtest -v

TESTFILES = \
Array1.mos \
BaseClass1.mos \
cat.mos \
EnzMM.mos \
ErrorFunctionCallNumArgs.mos \
ExtendsOrder.mos \
ExternalFunctionResultOrder.mos\
ExternalLibraryFunction.mos\
FinalTests.mos \
FuncNamespace.mos \
GroupImport.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
LookupBuiltin.mos \
LookupPackageFail.mos \
Model1.mos \
Model2.mos \
ModifierVariabilityError.mos \
NotbasicType.mos NotbasicType2.mos \
OverloadingFunc.mos \
Return.mos \
SolveLinearSystem.mos \
TestLoadModel.mos \
UnpOpPrecedence.mos \
UriLookup.mos \
WhileStatement.mos WhileStatementIllegal.mos \
ModifierProblem.mos \
TransformerYY.mos \
AIMC_DOL.mos \
ZeroDims.mos \
ZeroRange.mos

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
