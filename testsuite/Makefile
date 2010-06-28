.PHONY : all omc-diff failingtest test fast fast.logs drmodelica.log mofiles.log msl.log java.log records.log meta.log mmdev.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log libraries.log

all : test

omc-diff :
	$(MAKE) -C difftool
test : libraries.log fast.logs
	@cat drmodelica.log mofiles.log msl.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log meta.log mmdev.log records.log libraries.log
	@rm -f {mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
test-oldresult:
	@cat drmodelica.log mofiles.log msl.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log meta.log mmdev.log records.log libraries.log
fast : omc-diff fast.logs
	@cat drmodelica.log mofiles.log msl.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log meta.log mmdev.log records.log
	@rm -f {mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast.logs: mosfiles.log mosfiles-msl22.log meta.log mofiles.log msl.log mmdev.log drmodelica.log mosfiles-nosim.log records.log
# java should probably also be part of 'fast'
libraries.log: omc-diff
	$(MAKE) -C libraries -f Makefile test > $@
	@echo $@ done
drmodelica.log: omc-diff
	$(MAKE) -C mofiles/drmodelica -f Makefile test > drmodelica.log
	@echo $@ done
mofiles.log: omc-diff
	$(MAKE) -C mofiles -f Makefile test > mofiles.log
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
java.log: omc-diff
	$(MAKE) -C java -f Makefile test > $@
	@echo $@ done
	
failingtest: omc-diff
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
