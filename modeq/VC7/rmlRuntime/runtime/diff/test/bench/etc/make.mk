SHELL=/bin/sh

default:
	@echo '[EXAMPLE: mf ]'
	@echo '[RUNTIME: switch ]'
	cd examples/mf; make RMLCFLAGS=+Rswitch benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff ]'
	cd examples/mf; make RMLCFLAGS=+Rdiff benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff2 ]'
	cd examples/mf; make RMLCFLAGS='+Rdiff -DRML_DIFF_LABEL0_INREG' benchexe; make benchrun10; make realclean
	@echo '[EXAMPLE: miniml ]'
	@echo '[RUNTIME: switch ]'
	cd examples/miniml; make RMLCFLAGS=+Rswitch benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff ]'
	cd examples/miniml; make RMLCFLAGS=+Rdiff benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff2 ]'
	cd examples/miniml; make RMLCFLAGS='+Rdiff -DRML_DIFF_LABEL0_INREG' benchexe; make benchrun10; make realclean
	@echo '[EXAMPLE: petrol ]'
	@echo '[RUNTIME: switch ]'
	cd examples/petrol; make RMLCFLAGS=+Rswitch benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff ]'
	cd examples/petrol; make RMLCFLAGS=+Rdiff benchexe; make benchrun10; make realclean
	@echo '[RUNTIME: diff2 ]'
	cd examples/petrol; make RMLCFLAGS='+Rdiff -DRML_DIFF_LABEL0_INREG' benchexe; make benchrun10; make realclean
