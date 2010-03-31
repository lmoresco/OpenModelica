.PHONY : all failingtest test fast fast.logs mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log java.log records.log meta.log mmdev.log mosfiles.log libraries.log

all : test
test : libraries.log fast.logs
	@cat mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log mosfiles.log meta.log mmdev.log records.log libraries.log
	@rm -f {mathcore-mofiles,mathcore-mofiles/msl/,mathcore-mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast : fast.logs
	@cat mathcore-mofiles.log mathcore-msl.log drmodelica.log mofiles.log msl.log mosfiles.log meta.log mmdev.log records.log
	@rm -f {mathcore-mofiles,mathcore-mofiles/msl/,mathcore-mofiles/drmodelica,mofiles,mofiles/msl,meta,records,java}/*.{dll,so,exe};
fast.logs: mosfiles.log mofiles.log meta.log msl.log mathcore-mofiles.log mmdev.log mathcore-msl.log drmodelica.log records.log
# java should probably also be part of 'fast'
libraries.log:
	$(MAKE) -C libraries -f Makefile test > $@
mathcore-mofiles.log:
	$(MAKE) -C mathcore-mofiles -f Makefile test > mathcore-mofiles.log
mathcore-msl.log:
	$(MAKE) -C mathcore-mofiles/msl -f Makefile test > mathcore-msl.log
drmodelica.log:
	$(MAKE) -C mathcore-mofiles/drmodelica -f Makefile test > drmodelica.log
mofiles.log:
	$(MAKE) -C mofiles -f Makefile test > mofiles.log
msl.log:
	$(MAKE) -C mofiles/msl -f Makefile test > msl.log
mosfiles.log:
	$(MAKE) -C mosfiles -f Makefile test > $@
meta.log:
	$(MAKE) -C meta -f Makefile test > $@
mmdev.log:
	$(MAKE) -C meta/MetaModelicaDev -f Makefile.omc test > $@
records.log:
	$(MAKE) -C records -f Makefile test > $@
java.log:
	$(MAKE) -C java -f Makefile test > $@
	
failingtest:
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
