

all :
	@echo
	@echo The following teste should not cause any errors
	@echo
	@-for f in *-s-*.mo; do \
	  tmp=/tmp/modeq-test-$$$$; \
	  echo testing $$f; \
	  ../modeq $$f >$$tmp 2>&1; \
	  [ $$? -ne 0 ] || egrep '^#|Execution failed!' $$tmp && \
		( echo FAILURE! Log saved in /tmp/log-$$f ; \
		  mv $$tmp /tmp/log-$$f ); \
	done
	@echo
	@echo The following teste should fail
	@echo
	@-for f in *-f-*.mo; do \
	  echo testing $$f; \
	  (../modeq $$f 2>&1 && echo '! Succeeded') \
		| egrep '^#|!|Execution failed!'; \
	done

