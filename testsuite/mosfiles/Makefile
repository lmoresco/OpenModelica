TESTFILES = interactive_api_param.mos interactive_api_classes.mos \
variables.mos Array1.mos simulation.mos differentiate.mos simplify.mos \
strings.mos interactive_api_loadsave.mos  interactive_api_attributes.mos \
matrices.mos BouncingBall.mos ExternalLibraries.mos \
loadFileInteractiveQualified.mos ArrayEquation.mos structural_if.mos
TEST = rtest


.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)
