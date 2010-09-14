LOGS = multibody.log msl221.log msl221additions.log biochem.log msl31.log
.PHONY : all failingtest msl221.log msl31.log msl221additions.log biochem.log multibody.log

all : test
test : $(LOGS)
	@cat $(LOGS)

msl221.log:
	$(MAKE) -C msl221 -f Makefile test > $@
msl221additions.log:
	$(MAKE) -C msl221/modelicaAdditions -f Makefile test > $@
biochem.log:
	$(MAKE) -C biochem -f Makefile test > $@
multibody.log:
	$(MAKE) -C multibody -f Makefile test > $@
msl31.log:
	$(MAKE) -C msl31 -f Makefile test > $@
	
failingtest:
	cd msl221; $(MAKE) -f Makefile failingtest; \
	cd ../msl221/modelicaAdditions; $(MAKE) -f Makefile failingtest; \
	cd ../../biochem; $(MAKE) -f Makefile failingtest; \
	cd ../multibody; $(MAKE) -f Makefile failingtest; \
	cd ../msl31; $(MAKE) -f Makefile failingtest;

