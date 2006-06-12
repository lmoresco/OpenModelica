
TESTFILES = IfStatement.mos IfStatementIllegal.mos WhileStatement.mos WhileStatementIllegal.mos \
interactive_api_param.mos interactive_api_classes.mos \
variables.mos Array1.mos simulation.mos simulation2.mos differentiate.mos simplify.mos \
strings.mos interactive_api_loadsave.mos  interactive_api_attributes.mos \
matrices.mos BouncingBall.mos ExternalLibraries.mos \
loadFileInteractiveQualified.mos ArrayEquation.mos Rename.mos \
IdealDiode.mos \
blockssources.mos blockssystems.mos rotationalspringinertia.mos \
rotationalsystems.mos rotationalgears.mos Interpolation.mos \
ExtObj.mos algorithms.mos

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
