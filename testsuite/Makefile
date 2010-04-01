.PHONY : all failingtest test fast fast.logs mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log java.log records.log meta.log mmdev.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log libraries.log

all : test
test : libraries.log fast.logs
	@cat mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log meta.log mmdev.log records.log libraries.log
	@rm -f {mathcore-mofiles,mathcore-mofiles/msl/,mathcore-mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast : fast.logs
	@cat mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log mosfiles.log mosfiles-msl22.log mosfiles-nosim.log meta.log mmdev.log records.log
	@rm -f {mathcore-mofiles,mathcore-mofiles/msl/,mathcore-mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast.logs: mosfiles.log mosfiles-msl22.log meta.log mofiles.log msl.log mathcore-mofiles.log mmdev.log mathcore-msl.log drmodelica.log mosfiles-nosim.log records.log
# java should probably also be part of 'fast'
libraries.log:
	$(MAKE) -C libraries -f Makefile test > $@
	@echo $@ done
mathcore-mofiles.log:
	$(MAKE) -C mathcore-mofiles -f Makefile test > mathcore-mofiles.log
	@echo $@ done
mathcore-msl.log:
	$(MAKE) -C mathcore-mofiles/msl -f Makefile test > mathcore-msl.log
	@echo $@ done
drmodelica.log:
	$(MAKE) -C mathcore-mofiles/drmodelica -f Makefile test > drmodelica.log
	@echo $@ done
mofiles.log:
	$(MAKE) -C mofiles -f Makefile test > mofiles.log
	@echo $@ done
msl.log:
	$(MAKE) -C mofiles/msl -f Makefile test > msl.log
	@echo $@ done
mosfiles.log:
	$(MAKE) -C mosfiles -f Makefile test > $@
	@echo $@ done
mosfiles-msl22.log:
	$(MAKE) -C mosfiles-msl22 -f Makefile test > $@
	@echo $@ done
mosfiles-nosim.log:
	$(MAKE) -C mosfiles-nosim -f Makefile test > $@
	@echo $@ done
meta.log:
	$(MAKE) -C meta -f Makefile test > $@
	@echo $@ done
mmdev.log:
	$(MAKE) -C meta/MetaModelicaDev -f Makefile.omc test > $@
	@echo $@ done
records.log:
	$(MAKE) -C records -f Makefile test > $@
	@echo $@ done
java.log:
	$(MAKE) -C java -f Makefile test > $@
	@echo $@ done
	
failingtest:
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
