.PHONY : all failingtest

all : test
test :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd multibody; $(MAKE) -f Makefile test; \
	cd ../msl221; $(MAKE) -f Makefile test; \
	cd ../biochem; $(MAKE) -f Makefile test;
	
failingtest:
	cd multibody; $(MAKE) -f Makefile failingtest; \
	cd ../msl221; $(MAKE) -f Makefile failingtest; \
	cd ../biochem; $(MAKE) -f Makefile failingtest;

