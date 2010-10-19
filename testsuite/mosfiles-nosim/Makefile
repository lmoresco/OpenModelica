TEST = ../rtest -v

TESTFILES = \
Array1.mos \
BaseClass1.mos \
DefaultComponentName.mos \
differentiate.mos \
EnzMM.mos \
ExtendsOrder.mos \
ExternalFunctionResultOrder.mos\
FinalTests.mos \
ForStatement1.mos ForStatement2.mos ForStatement3.mos ForStatement4.mos \
ForStatement5fail.mos ForStatement6.mos ForStatement7.mos \
FuncNamespace.mos \
IfStatement.mos IfStatementIllegal.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
interactive_api_param.mos interactive_api_classes.mos \
interactive_api_loadsave.mos  interactive_api_attributes.mos \
interactive_api_calls.mos \
loadFileInteractiveQualified.mos \
LookupPackageFail.mos \
matrices.mos \
ModifierVariabilityError.mos \
NotbasicType.mos NotbasicType2.mos \
OverloadingFunc.mos \
refactorGraphAnn1.mos refactorGraphAnn2.mos \
Rename.mos \
Return.mos \
RunScript.mos \
simplify.mos \
strings.mos  \
UnpOpPrecedence.mos \
variables.mos \
WhileStatement.mos WhileStatementIllegal.mos \
ModifierProblem.mos \
TransformerYY.mos \
AIMC_DOL.mos \
interactive_test.mos \
XmlDumpComment.mos

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
