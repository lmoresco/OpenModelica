LOGS = elementary.log loops.log 
.PHONY : all failingtest elementary.log loops.log

all : test
test : $(LOGS)
	@cat $(LOGS)

elementary.log:
	$(MAKE) -C elementary -f Makefile test > $@
loops.log:
	$(MAKE) -C loops -f Makefile test > $@
	
failingtest:
	cd elementary; $(MAKE) -f Makefile failingtest; \
	cd ../elementary; $(MAKE) -f Makefile failingtest; 

