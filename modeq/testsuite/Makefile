

test :
	@echo
	@echo The following teste should not cause any errors
	@echo
	@-for f in *-s-*.mo; do \
	  tmp=/tmp/modeq-test-$$$$; \
	  echo testing $$f; \
	  ./runtest $$f; \
	done
	@echo
	@echo The following teste should fail
	@echo
	@-for f in *-f-*.mo; do \
	  echo testing $$f; \
	  ./runtest >/dev/null $$f && echo SUCCEDED; \
	done

