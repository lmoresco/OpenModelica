

all :
	for f in *.mdc; do \
	  echo testing $$f; \
	  ../modeq $$f 2>&1 | egrep '^#|Execution failed!'; \
	done
