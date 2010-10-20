# Sorted by time it takes to run the tests...
FASTLOGS= \
meta.log \
mosfiles.log \
mosfiles-msl22.log \
parser.log \
mofiles.log \
msl.log \
mmdev.log \
drmodelica.log \
mosfiles-nosim.log \
records.log \
dependency.log \
expandable.log \
linearize.log

.PHONY : all omc-diff failingtest test fast fast.logs $(FASTLOGS) libraries.log

all : test

omc-diff :
	$(MAKE) -C difftool
test : libraries.log fast.logs
	@cat `ls $(FASTLOGS) | sort` libraries.log
	@rm -f {mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
test-oldresult:
	@cat `ls $(FASTLOGS) | sort` libraries.log
test-oldresult-summary:
	@cat `ls $(FASTLOGS) | sort` libraries.log
	@cat test.log
	@echo -n "== Total: "
	@SUM=0; for i in `grep ^== test.log | grep failed | cut -d\  -f2`; do SUM=$$(($$SUM + $$i)); done; echo -n $$SUM
	@echo -n " out of "
	@SUM=0; for i in `grep ^== test.log | grep failed | cut -d\  -f5`; do SUM=$$(($$SUM + $$i)); done; echo -n $$SUM
	@echo " failed"
fast : omc-diff fast.logs
	@cat `ls $(FASTLOGS) | sort`
	@rm -f {mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast.logs: $(FASTLOGS)
# java should probably also be part of 'fast'
libraries.log: omc-diff
	$(MAKE) -C libraries -f Makefile test > $@
	@echo $@ done
drmodelica.log: omc-diff
	$(MAKE) -C mofiles/drmodelica -f Makefile test > drmodelica.log
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
	$(MAKE) -C meta/MetaModelicaDev -f Makefile.omc test > $@
	@echo $@ done
records.log: omc-diff
	$(MAKE) -C records -f Makefile test > $@
	@echo $@ done
expandable.log: omc-diff
	$(MAKE) -C expandable -f Makefile test > $@
	@echo $@ done
linearize.log: omc-diff
	$(MAKE) -C linearize -f Makefile test > $@
	@echo $@ done
java.log: omc-diff
	$(MAKE) -C java -f Makefile test > $@
	@echo $@ done
	
failingtest: omc-diff
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
