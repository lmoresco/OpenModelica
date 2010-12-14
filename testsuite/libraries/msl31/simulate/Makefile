TEST = ../../../rtest -v

TESTFILES = \
Modelica.Blocks.Examples.mos \
Modelica.Electrical.Analog.Examples.mos \
Modelica.Electrical.Digital.Examples.mos \
Modelica.Electrical.Machines.Examples.mos \
Modelica.Electrical.MultiPhase.Examples.mos \
Modelica.Mechanics.MultiBody.Examples.Elementary.DoublePendulum \
Modelica.Mechanics.Translational.Examples.SignConvention.mos \
Modelica.Mechanics.Translational.Examples.WhyArrows.mos \
Modelica.Mechanics.Translational.Examples.Accelerate.mos \
Modelica.Mechanics.Translational.Examples.Damper.mos \
Modelica.Mechanics.Translational.Examples.Oscillator.mos \
Modelica.Mechanics.Translational.Examples.Sensors.mos \
Modelica.Mechanics.Translational.Examples.PreLoad.mos \
Modelica.Mechanics.Translational.Examples.ElastoGap.mos \
Modelica.Mechanics.Translational.Examples.Brake.mos 

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \
Modelica.Mechanics.Translational.Examples.InitialConditions.mos \
Modelica.Mechanics.Translational.Examples.Friction.mos 

.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES) \
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES) \
