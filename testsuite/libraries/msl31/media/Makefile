TEST = ../../../rtest -v

TESTFILES = \
Air.SimpleAir.mos \
Examples.IdealGasH2O.mos \
Examples.MixtureGases.mos \
Examples.MoistAir.mos \
Examples.SimpleLiquidWater.mos \
Examples.SolveOneNonlinearEquation.Inverse_sh_T.mos \
Examples.SolveOneNonlinearEquation.Inverse_sine.mos \
Examples.TestOnly.FlueGas.mos \
Examples.TestOnly.IdealGasN2Mix.mos \
Examples.TestOnly.IdealGasN2.mos \
Examples.TestOnly.MixIdealGasAir.mos \
Examples.TestOnly.N2AsMix.mos \
Examples.TestOnly.TestMedia.TemplateMedium.mos \
Examples.Tests.Components.mos \
Examples.Tests.MediaTestModels.Air.DryAirNasa.mos \
Examples.Tests.MediaTestModels.Air.SimpleAir.mos \
Examples.Tests.MediaTestModels.Air.MoistAir.mos \
Examples.Tests.MediaTestModels.IdealGases.Air.mos \
Examples.Tests.MediaTestModels.IdealGases.Nitrogen.mos \
Examples.Tests.MediaTestModels.IdealGases.SimpleNaturalGasFixedComposition.mos \
Examples.Tests.MediaTestModels.LinearFluid.LinearColdWater.mos \
Examples.Tests.MediaTestModels.LinearFluid.LinearWater_pT.mos \
Examples.Tests.MediaTestModels.Water.IdealSteam.mos \
Examples.Tests.MediaTestModels.Water.WaterIF97OnePhase_ph.mos \
Examples.Tests.MediaTestModels.Water.WaterIF97_ph.mos \
Examples.Tests.MediaTestModels.Water.WaterIF97_pT.mos \
Examples.TwoPhaseWater.mos \
Examples.TwoPhaseWater.TestTwoPhaseStates.mos \
Examples.WaterIF97.mos \
Incompressible.Examples.Glycol47.mos \
Incompressible.Examples.TestGlycol.mos \
Water.StandardWater.mos \
Examples.Tests.MediaTestModels.IdealGases.SimpleNaturalGas.mos \
Examples.Tests.MediaTestModels.Incompressible.Essotherm650.mos \
Examples.Tests.MediaTestModels.Incompressible.Glycol47.mos \
Examples.TwoPhaseWater.ExtendedProperties.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  


# Dependency files that are not .mo .mos or Makefile
# Add them here or they will be cleaned.
DEPENDENCIES = \
*.mo \
*.mos \
Makefile \
simulate


CLEAN = `ls | grep -w -v -f deps.tmp`

.PHONY : test clean getdeps failingtest

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) 

# Cleans all files that are not listed as dependencies 
clean :
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the 
# list in deps.txt
getdeps: 
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt	
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
