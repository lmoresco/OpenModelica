
TESTFILES = ForStatement1.mos ForStatement2.mos ForStatement3.mos ForStatement4.mos \
ForStatement5fail.mos ForStatement6.mos ForStatement7.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
IfStatement.mos IfStatementIllegal.mos WhileStatement.mos WhileStatementIllegal.mos \
interactive_api_param.mos interactive_api_classes.mos tempInterpol2test.mos \
variables.mos Array1.mos simulation.mos simulation2.mos simulation3.mos differentiate.mos simplify.mos \
strings.mos interactive_api_loadsave.mos  interactive_api_attributes.mos \
matrices.mos BouncingBall.mos ExternalLibraries.mos \
loadFileInteractiveQualified.mos ArrayEquation.mos Rename.mos \
IdealDiode.mos \
blockssources.mos blockssystems.mos rotationalspringinertia.mos \
rotationalsystems.mos rotationalgears.mos Interpolation.mos \
ExtObj.mos algorithms.mos UnparseOperatorPrecedence.mos


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= MoonAndEarth.mos

TEST = ./rtest -v


.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
