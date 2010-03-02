
TESTFILES = \
DoublePendulum.mos \
ForceAndTorque.mos \
FreeBody.mos \
InitSpringConstant.mos \
LineForceWithTwoMasses.mos \
Pendulum.mos \
PendulumWithSpringDamper.mos \
PointGravity.mos \
PointGravityWithPointMasses2.mos \
PointGravityWithPointMasses.mos \
RollingWheel.mos \
RollingWheelSetDriving.mos \
RollingWheelSetPulling.mos \
SpringDamperSystem.mos \
SpringMassSystem.mos \
SpringWithMass.mos \
ThreeSprings.mos \
World.mos \


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  

TEST = ./rtest -v


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
