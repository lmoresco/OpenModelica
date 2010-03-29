.PHONY : all failingtest

all : test
test :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd msl221; $(MAKE) -f Makefile test; \
	cd ../msl221/modelicaAdditions; $(MAKE) -f Makefile test; \
	cd ../../biochem; $(MAKE) -f Makefile test; \
	cd ../multibody; $(MAKE) -f Makefile test;
	
failingtest:
	cd msl221; $(MAKE) -f Makefile failingtest; \
	cd ../msl221/modelicaAdditions; $(MAKE) -f Makefile failingtest; \
	cd ../../biochem; $(MAKE) -f Makefile failingtest; \
	cd ../multibody; $(MAKE) -f Makefile failingtest;

