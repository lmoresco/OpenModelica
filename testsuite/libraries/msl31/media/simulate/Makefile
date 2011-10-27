TEST = ../../../../rtest -v

TESTFILES = \
Modelica.Media.Air.SimpleAir.mos \
Modelica.Media.Examples.MoistAir.mos \
Modelica.Media.Examples.SimpleLiquidWater.mos \
Modelica.Media.Examples.TestOnly.N2AsMix.mos \
Modelica.Media.Examples.TwoPhaseWater.mos \
Modelica.Media.Incompressible.Examples.Glycol47.mos \
Modelica.Media.Water.StandardWater.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \
Modelica.Media.Examples.IdealGasH2O.mos \
Modelica.Media.Examples.MixtureGases.mos \
Modelica.Media.Examples.TestOnly.FlueGas.mos \
Modelica.Media.Examples.TestOnly.IdealGasN2.mos \
Modelica.Media.Examples.TestOnly.IdealGasN2Mix.mos \
Modelica.Media.Examples.TestOnly.MixIdealGasAir.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Air.DryAirNasa.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Air.MoistAir.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Air.SimpleAir.mos \
Modelica.Media.Examples.Tests.MediaTestModels.IdealGases.Air.mos \
Modelica.Media.Examples.Tests.MediaTestModels.IdealGases.Nitrogen.mos \
Modelica.Media.Examples.Tests.MediaTestModels.IdealGases.SimpleNaturalGas.mos \
Modelica.Media.Examples.Tests.MediaTestModels.IdealGases.SimpleNaturalGasFixedComposition.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Incompressible.Essotherm650.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Incompressible.Glycol47.mos \
Modelica.Media.Examples.Tests.MediaTestModels.LinearFluid.LinearColdWater.mos \
Modelica.Media.Examples.Tests.MediaTestModels.LinearFluid.LinearWater_pT.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Water.IdealSteam.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Water.WaterIF97OnePhase_ph.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Water.WaterIF97_pT.mos \
Modelica.Media.Examples.Tests.MediaTestModels.Water.WaterIF97_ph.mos \
Modelica.Media.Examples.TwoPhaseWater.ExtendedProperties.mos \
Modelica.Media.Examples.TwoPhaseWater.TestTwoPhaseStates.mos \
Modelica.Media.Examples.WaterIF97.mos \
Modelica.Media.Incompressible.Examples.TestGlycol.mos \


.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) 
	@rm -f *.o *.c *.h *.libs *.log *.makefile
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
