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
Examples.Tests.MediaTestModels.Air.MoistAir.mos \
Examples.Tests.MediaTestModels.IdealGases.SimpleNaturalGas.mos \
Examples.Tests.MediaTestModels.Incompressible.Essotherm650.mos \
Examples.Tests.MediaTestModels.Incompressible.Glycol47.mos \
Examples.TwoPhaseWater.ExtendedProperties.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) 
	@rm *.o *.c *.h *.libs *.log *.makefile
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
