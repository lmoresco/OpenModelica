	LOGS = elementary.log loops.log rotational3deffects.log systems.log checkingModels.log
.PHONY : all failingtest elementary.log loops.log rotational3deffects.log systems.log checkingModels.log

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
checkingModels.log:
	$(MAKE) -C checkingModels -f Makefile test > $@

clean: 
	$(MAKE) -C elementary -f Makefile clean
	$(MAKE) -C loops -f Makefile clean
	$(MAKE) -C rotational3deffects -f Makefile clean
	$(MAKE) -C systems -f Makefile clean
	$(MAKE) -C checkingModels -f Makefile clean
	
failingtest:
	cd elementary; $(MAKE) -f Makefile failingtest; \
	cd ../loops; $(MAKE) -f Makefile failingtest; 

