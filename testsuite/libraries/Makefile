.PHONY : all failingtest

all : test
test :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd multibody; $(MAKE) -f Makefile test;
	
failingtest:
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \

