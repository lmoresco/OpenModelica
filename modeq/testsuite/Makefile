TEST=./rtest

TESTFILES=*.mo
DISTFILES=$(TESTFILES) VERSION modtest.texi modtest.info modtest.ps

TEXI2DVI=texi2dvi
MAKEINFO=makeinfo

VERSION = $(shell cat VERSION)

.PHONY : default
default : modtest.dvi modtest.info

.PHONY : test
test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)

keywords :
	$(TEST) -l $(TESTFILES)

modtest.dvi : modtest.texi cases.texi VERSION.texi
	$(TEXI2DVI) $<

modtest.ps : modtest.dvi
	dvips -o $@ $<

modtest.info : modtest.texi cases.texi VERSION.texi
	$(MAKEINFO) $<

cases.texi :
	$(RM) $@
	cases=`$(TEST) -L $(TESTFILES) | sort`; \
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

VERSION.texi : VERSION
	sed -e 's/^\(.*\)$$/@set VERSION \1/' < $< > $@

.PHONY : dist
dist : $(DISTFILES)
	mkdir modtest-$(VERSION)
	cp $(DISTFILES) modtest-$(VERSION)
	tar cvf modtest-$(VERSION).tar modtest-$(VERSION)
	gzip -9 modtest-$(VERSION).tar
	$(RM) -r modtest-$(VERSION)
