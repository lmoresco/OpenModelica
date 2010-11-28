# Sorted by time it takes to run the tests...
FASTLOGS= \
mosfiles.log \
mosfiles-msl22.log \
parser.log \
meta.log \
dependency.log \
mofiles.log \
msl.log \
mmdev.log \
drmodelica.log \
mosfiles-nosim.log \
interactive.log \
records.log \
expandable.log \
linearize.log \
streams.log

.PHONY : all omc-diff failingtest test fast fast.logs $(FASTLOGS) libraries.log

all : test

omc-diff :
	$(MAKE) -C difftool
test : bootstrapping.log libraries.log fast.logs
	@cat `ls $(FASTLOGS) bootstrapping.log | sort` libraries.log
	@rm -f {mofiles/drmodelica,streams,mofiles,mofiles/msl,meta,records,java,interactive,mosfiles-nosim}/*.{dll,so,exe};
test-oldresult:
	@cat `ls $(FASTLOGS) bootstrapping.log | sort` libraries.log
test-oldresult-summary:
	@cat `ls $(FASTLOGS) bootstrapping.log | sort` libraries.log > test.log
	@cat test.log
	@grep ^== test.log | grep failed | gawk '{ fail += $$2; sum += $$5 } END {printf "== Total: %d out of %d failed\n",fail,sum}'
fast : omc-diff fast.logs
	@cat `ls $(FASTLOGS) | sort`
	@rm -f {mofiles/drmodelica,streams,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast.logs: $(FASTLOGS)
# java should probably also be part of 'fast'
libraries.log: omc-diff
	$(MAKE) -C libraries -f Makefile test > $@
	@echo $@ done
drmodelica.log: omc-diff
	$(MAKE) -C mofiles/drmodelica -f Makefile test > drmodelica.log
	@echo $@ done
streams.log: omc-diff
	$(MAKE) -C streams -f Makefile test > streams.log
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
bootstrapping.log: omc-diff
	$(MAKE) -C bootstrapping -f Makefile test > $@
	@echo $@ done
	
failingtest: omc-diff
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
