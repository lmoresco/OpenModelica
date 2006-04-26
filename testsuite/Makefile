.PHONY : all failingtest

all :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd mofiles; $(MAKE) -f Makefile test; \
	cd msl; $(MAKE) -f Makefile test; \
	cd ../drmodelica; $(MAKE) -f Makefile test; \
	cd ../../mosfiles; $(MAKE) -f Makefile test
failingtest:
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \
	cd ../drmodelica; $(MAKE) -f Makefile failingtest; 

drmodelica:
	cd mofiles/drmodelica; $(MAKE) -f Makefile test; 
