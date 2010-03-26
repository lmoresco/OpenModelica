.PHONY : all failingtest

all : test
test :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd multibody; $(MAKE) -f Makefile test; cd ..; \
	cd msl221; $(MAKE) -f Makefile test; cd ..; \
	cd msl221/modelicaAdditions; $(MAKE) -f Makefile test; cd ../..;\
	cd biochem; $(MAKE) -f Makefile test; cd ..
	
failingtest:
	cd multibody; $(MAKE) -f Makefile failingtest; cd ..; \
	cd msl221; $(MAKE) -f Makefile failingtest; cd ..; \
	cd msl221/modelicaAdditions; $(MAKE) -f Makefile failingtest; cd ../..;\
	cd biochem; $(MAKE) -f Makefile failingtest; cd ..
