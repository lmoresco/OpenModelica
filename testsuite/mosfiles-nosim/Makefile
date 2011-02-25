TEST = ../rtest -v

TESTFILES = \
Array1.mos \
attributes.mos \
BaseClass1.mos \
EnzMM.mos \
ErrorFunctionCallNumArgs.mos \
ExtendsOrder.mos \
ExternalFunctionResultOrder.mos\
FinalTests.mos \
FuncNamespace.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
LookupBuiltin.mos \
LookupPackageFail.mos \
ModifierVariabilityError.mos \
NotbasicType.mos NotbasicType2.mos \
OverloadingFunc.mos \
Return.mos \
UnpOpPrecedence.mos \
WhileStatement.mos WhileStatementIllegal.mos \
ModifierProblem.mos \
TransformerYY.mos \
AIMC_DOL.mos \
ZeroDims.mos \
Model1.mos \
Model2.mos 

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
