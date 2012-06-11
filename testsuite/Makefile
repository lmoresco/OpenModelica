# Sorted by time it takes to run the tests...
FASTLOGS= \
initialization.log \
mosfiles.log \
mosfiles-msl22.log \
parser.log \
meta.log \
dependency.log \
biochem.log \
mofiles.log \
msl.log \
mmdev.log \
mosfiles-nosim.log \
interactive.log \
records.log \
expandable.log \
linearize.log \
modelicaML.log \
drmodelica.log \
streams.log \
redeclare.log \
fmi.log \
PlanarMechanics.log \
TestMedia.log 

SLOWLOGS = \
bootstrapping.log \
msl31.log \
msl32.log \
multibody.log \
msl221.log \
msl221simulation.log \
msl221additions.log \
interactive-simulation.log \
msl31simulation.log \
msl31media.log \
msl31mediasimulation.log \
msl31fluid.log \
siemens.log \
SiemensPower.log \
hummod.log \
ThermoSysPro.log \
omcc.log

SIMULATIONLOGS = \
linearize.log \
modelicaML.log \
initialization.log \
mosfiles.log \
mosfiles-msl22.log \
msl221simulation.log  \
msl31mediasimulation.log \
msl31simulation.log

.PHONY : all omc-diff failingtest test fast fast.logs $(FASTLOGS) $(SLOWLOGS) $(SIMULATIONLOGS) slow.logs

all : test

# This will run the test with 5 threads (cores + 1)
# If you have more cores increase it.
# or just run "make -jN" on the command line if you have N-1 cores
threaded : 
	@echo running the testsuite with multiple MAKE threads.
	@echo This is not an official OM test. Run the normal test before commites.
	@echo If some tests fail with this just run them individualy. Most probably 
	@echo they will work.
	@echo This threaded version still have some issues. However if it succedes 
	@echo then there is no need to run the serial one. Except when you are COMMITING changes.
	$(MAKE) -j5 clean
	$(MAKE) -j5 test

omc-diff :
	$(MAKE) -C difftool
test : fast.logs slow.logs
	@cat `ls $(FASTLOGS) $(SLOWLOGS) | sort`
	@rm -f {mofiles/drmodelica,streams,mofiles,mofiles/msl,meta,records,java,interactive,mosfiles-nosim}/*.{dll,so,exe};
test-oldresult:
	@cat `ls $(FASTLOGS) $(SLOWLOGS) | sort`
test-oldresult-summary:
	@cat `ls $(FASTLOGS) $(SLOWLOGS) | sort` > test.log
	@cat test.log
	@grep ^== test.log | grep failed | gawk '{ fail += $$2; sum += $$5 } END {printf "== Total: %d out of %d failed\n",fail,sum}'
fast : omc-diff fast.logs
	@cat `ls $(FASTLOGS) | sort`
	@rm -f {mofiles/drmodelica,streams,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
simulation: omc-diff simulation.logs
	@cat `ls $(SIMULATIONLOGS) | sort` > simulation.log
	@cat simulation.log
	@grep ^== simulation.log | grep failed | gawk '{ fail += $$2; sum += $$5 } END {printf "== Total: %d out of %d failed\n",fail,sum}'
fast.logs: $(FASTLOGS)
# java should probably also be part of 'fast'
slow.logs: $(SLOWLOGS)
simulation.logs: $(SIMULATIONLOGS)
drmodelica.log: omc-diff
	$(MAKE) -C mofiles/drmodelica -f Makefile test > $@
	@echo $@ done
streams.log: omc-diff
	$(MAKE) -C streams -f Makefile test > $@
	@echo $@ done
redeclare.log: omc-diff
	$(MAKE) -C redeclare -f Makefile test > $@
	@echo $@ done
mofiles.log: omc-diff
	$(MAKE) -C mofiles -f Makefile test > $@
	@echo $@ done
parser.log: omc-diff
	$(MAKE) -C parser -f Makefile test > $@
	@echo $@ done
dependency.log: omc-diff
	$(MAKE) -C dependency -f Makefile test > $@
	@echo $@ done
interactive.log: omc-diff
	$(MAKE) -C interactive -f Makefile test > $@
	@echo $@ done
interactive-simulation.log: omc-diff
	$(MAKE) -C interactive-simulation -f Makefile test > $@
	@echo $@ done
msl.log: omc-diff
	$(MAKE) -C mofiles/msl -f Makefile test > msl.log
	@echo $@ done
mosfiles.log: omc-diff
	$(MAKE) -C mosfiles -f Makefile test > $@
	@echo $@ done
mosfiles-msl22.log: omc-diff
	$(MAKE) -C mosfiles-msl22 -f Makefile test > $@
	@echo $@ done
mosfiles-nosim.log: omc-diff
	$(MAKE) -C mosfiles-nosim -f Makefile test > $@
	@echo $@ done
meta.log: omc-diff
	$(MAKE) -C meta -f Makefile test > $@
	@echo $@ done
mmdev.log: omc-diff
	$(MAKE) -C meta/MetaModelicaDev -f Makefile test > $@
	@echo $@ done
records.log: omc-diff
	$(MAKE) -C records -f Makefile test > $@
	@echo $@ done
expandable.log: omc-diff
	$(MAKE) -C expandable -f Makefile test > $@
	@echo $@ done
initialization.log: omc-diff
	$(MAKE) -C initialization -f Makefile test > $@
	@echo $@ done
linearize.log: omc-diff
	$(MAKE) -C linearize -f Makefile test > $@
	@echo $@ done
modelicaML.log: omc-diff
	$(MAKE) -C modelicaML -f Makefile test > $@
	@echo $@ done
java.log: omc-diff
	$(MAKE) -C java -f Makefile test > $@
	@echo $@ done
bootstrapping.log: omc-diff
	$(MAKE) -C bootstrapping -f Makefile test > $@
	@echo $@ done
msl221.log: omc-diff
	$(MAKE) -C libraries/msl221 -f Makefile test > $@
	@echo $@ done
msl221simulation.log: omc-diff
	$(MAKE) -C libraries/msl221 -f Makefile testsim > $@
	@echo $@ done
msl221additions.log: omc-diff
	$(MAKE) -C libraries/msl221/modelicaAdditions -f Makefile test > $@
	@echo $@ done
biochem.log: omc-diff
	$(MAKE) -C libraries/biochem -f Makefile test > $@
	@echo $@ done
multibody.log: omc-diff
	$(MAKE) -C libraries/multibody -f Makefile test > $@
	@echo $@ done
msl31.log: omc-diff
	$(MAKE) -C libraries/msl31 -f Makefile test > $@
	@echo $@ done
msl32.log: omc-diff
	$(MAKE) -C libraries/msl32 -f Makefile test > $@
	@echo $@ done
msl31simulation.log: omc-diff
	$(MAKE) -C libraries/msl31/simulate -f Makefile test > $@
	@echo $@ done
msl31media.log: omc-diff
	$(MAKE) -C libraries/msl31/media -f Makefile test > $@
	@echo $@ done
msl31mediasimulation.log: omc-diff
	$(MAKE) -C libraries/msl31/media/simulate -f Makefile test > $@
	@echo $@ done
msl31fluid.log: omc-diff
	$(MAKE) -C libraries/msl31/fluid -f Makefile test > $@
	@echo $@ done
siemens.log: omc-diff
	$(MAKE) -C 3rdParty/siemens -f Makefile test > $@
	@echo $@ done
SiemensPower.log: omc-diff
	$(MAKE) -C 3rdParty/SiemensPower -f Makefile test > $@
	@echo $@ done
hummod.log: omc-diff
	$(MAKE) -C 3rdParty/HumMod -f Makefile test > $@
	@echo $@ done
ThermoSysPro.log: omc-diff
	$(MAKE) -C 3rdParty/ThermoSysPro -f Makefile test > $@
	@echo $@ done
fmi.log: omc-diff
	$(MAKE) -C fmi -f Makefile test > $@
	@echo $@ done
PlanarMechanics.log: omc-diff
	$(MAKE) -C 3rdParty/PlanarMechanics -f Makefile test > $@
	@echo $@ done
TestMedia.log: omc-diff
	$(MAKE) -C 3rdParty/TestMedia -f Makefile test > $@
	@echo $@ done
omcc.log: omc-diff
	$(MAKE) -C omcc -f Makefile test > $@
	@echo $@ done
failingtest: omc-diff
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd mosfiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
	cd ../libraries/msl221; $(MAKE) -f Makefile failingtest; \
	cd ../libraries/msl221; $(MAKE) -f Makefile simfailingtest; \
	cd ../msl221/modelicaAdditions; $(MAKE) -f Makefile failingtest; \
	cd ../../biochem; $(MAKE) -f Makefile failingtest; \
	cd ../multibody; $(MAKE) -f Makefile failingtest; \
	cd ../msl31; $(MAKE) -f Makefile failingtest;
	cd ../msl32; $(MAKE) -f Makefile failingtest;
	

clean: clean_g_1 clean_g_2 clean_g_3 clean_g_4 

clean_g_1  : 
	$(MAKE) -C streams -f Makefile clean
	$(MAKE) -C redeclare -f Makefile clean
	$(MAKE) -C mofiles -f Makefile clean

clean_g_2 :
	$(MAKE) -C parser -f Makefile clean
	$(MAKE) -C dependency -f Makefile clean
	$(MAKE) -C interactive -f Makefile clean
	$(MAKE) -C interactive-simulation -f Makefile clean
	$(MAKE) -C mofiles/msl -f Makefile clean
	$(MAKE) -C mosfiles -f Makefile clean
	$(MAKE) -C mosfiles-msl22 -f Makefile clean
	$(MAKE) -C mosfiles-nosim -f Makefile clean
	$(MAKE) -C meta -f Makefile clean
	$(MAKE) -C records -f Makefile clean
	$(MAKE) -C expandable -f Makefile clean
	$(MAKE) -C initialization -f Makefile clean

clean_g_3 :	
	$(MAKE) -C mofiles/drmodelica -f Makefile clean
	$(MAKE) -C linearize -f Makefile clean
	$(MAKE) -C modelicaML -f Makefile clean
	$(MAKE) -C bootstrapping -f Makefile clean
	$(MAKE) -C libraries/msl221 -f Makefile clean
	$(MAKE) -C libraries/msl221/modelicaAdditions -f Makefile clean
	$(MAKE) -C libraries/biochem -f Makefile clean

clean_g_4:	
	$(MAKE) -C libraries/multibody -f Makefile clean
	$(MAKE) -C libraries/msl31 -f Makefile clean
	$(MAKE) -C libraries/msl32 -f Makefile clean
	$(MAKE) -C 3rdParty/siemens -f Makefile clean
	$(MAKE) -C 3rdParty/SiemensPower -f Makefile clean
	$(MAKE) -C fmi -f Makefile clean
	$(MAKE) -C 3rdParty/PlanarMechanics -f Makefile clean
