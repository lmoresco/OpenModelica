LOGS = elementary.log loops.log rotational3deffects.log systems.log
.PHONY : all failingtest elementary.log loops.log rotational3deffects.log systems.log

all : test
test : $(LOGS)
	@cat $(LOGS)

elementary.log:
	$(MAKE) -C elementary -f Makefile test > $@
loops.log:
	$(MAKE) -C loops -f Makefile test > $@
rotational3deffects.log:
	$(MAKE) -C rotational3deffects -f Makefile test > $@
systems.log:
	$(MAKE) -C systems -f Makefile test > $@

	
failingtest:
	cd elementary; $(MAKE) -f Makefile failingtest; \
	cd ../loops; $(MAKE) -f Makefile failingtest; 

