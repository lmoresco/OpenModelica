TEST = ../rtest -v

TESTFILES = \
DefaultComponentName.mos \
differentiate.mos \
ForStatement1.mos ForStatement2.mos ForStatement3.mos ForStatement4.mos \
ForStatement5fail.mos ForStatement6.mos ForStatement7.mos \
IfStatement.mos IfStatementIllegal.mos \
interactive_api_param.mos interactive_api_classes.mos \
interactive_api_loadsave.mos  interactive_api_attributes.mos \
interactive_api_calls.mos \
interactive_api_annotations.mos \
interactive_api_simulations.mos \
interactive_test.mos \
loadFileInteractiveQualified.mos \
matrices.mos \
refactorGraphAnn1.mos refactorGraphAnn2.mos \
Rename.mos \
RunScript.mos \
setComponentComment.mos \
simplify.mos \
strings.mos  \
variables.mos \
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
