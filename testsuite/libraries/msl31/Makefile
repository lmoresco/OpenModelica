TEST = ../../rtest -v

TESTFILES = \
Modelica.Blocks.mos \
Modelica.Electrical.Analog.mos \
Modelica.Electrical.Digital.mos \
Modelica.Electrical.Machines.Examples.mos \
Modelica.Electrical.MultiPhase.Examples.mos \
Modelica.Magnetic.FluxTubes.mos \
Modelica.Math.mos \
Modelica.Math.Matrices.mos \
Modelica.Math.Matrices.LAPACK.mos \
Modelica.Mechanics.mos \
Modelica.Mechanics.MultiBody.mos \
Modelica.Thermal.mos \
Modelica.Utilities.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \

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
