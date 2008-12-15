.PHONY : all failingtest

all :
	@echo OPENMODELICAHOME = " $(OPENMODELICAHOME) "; \
	cd mathcore-mofiles ; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	cd msl; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	cd ../drmodelica; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	#cd mofiles; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	#cd msl; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	#cd ../../mosfiles; $(MAKE) -f Makefile test; rm -f *.dll *.so; \
	#cd ../meta; $(MAKE) -f Makefile test; rm -f *.dll *.so;
	
failingtest:
	cd mofiles; $(MAKE) -f Makefile failingtest; \
	cd msl; $(MAKE) -f Makefile failingtest; \

