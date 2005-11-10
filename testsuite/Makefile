.PHONY : all

all :
	cd mofiles; $(MAKE) -f Makefile test; \
	cd msl_1_5; $(MAKE) -f Makefile test; \
	cd ../drmodelica; $(MAKE) -f Makefile test; \
	cd ../../mosfiles; $(MAKE) -f Makefile test
