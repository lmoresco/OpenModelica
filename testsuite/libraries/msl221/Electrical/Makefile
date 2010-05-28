TEST = ../../../rtest -v

TESTFILES = \
CauerLowPassOPV2.mos \
CauerLowPassSC2.mos \
CharacteristicThyristors2.mos \
ChuaCircuit2.mos \
Rectifier2.mos \
HeatingMOSInverter2.mos \
HeatingRectifier2.mos \
ShowVariableResistor2.mos \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=  \
HeatingNPN_OrGate2.mos \
HeatingResistor.mos \
OvervoltageProtection2.mos \
ShowSaturatingInductor2.mos \

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
