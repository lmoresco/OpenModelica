TEST=./rtest

FILES=*.mo

TEXI2DVI=texi2dvi
MAKEINFO=makeinfo

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(FILES)

keywords :
	$(TEST) -l $(FILES)

modtest.dvi : modtest.texi cases.texi
	$(TEXI2DVI) $<

modtest.info : modtest.texi cases.texi
	$(MAKEINFO) $<

cases.texi :
	$(RM) $@
	cases=`$(TEST) -L $(FILES) | sort`; \
	echo "@menu" >> $@; \
	for c in $$cases; do echo "* $$c::" >> $@; done; \
	echo "@end menu" >> $@; \
	set Testcases $$cases ""; \
	while [ "$$2" != "" ] ; do \
		echo ""                 	   >> $@; \
		echo "@page"                       >> $@; \
		echo "@node $$2,$$3,$$1,Testcases" >> $@; \
		echo "@appendixsec $$2" 	   >> $@; \
		echo "@example"         	   >> $@; \
		echo "@include $$2.mo"  	   >> $@; \
		echo "@end example"     	   >> $@; \
		shift ; \
	done
