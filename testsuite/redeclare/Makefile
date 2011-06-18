TEST=../rtest -v

TESTFILES=\
ClassExtends1.mo \
ClassExtends2.mo \
ClassExtends3.mo \
ClassExtends4.mo \
ClassExtends5.mo \
ClassExtendsInvalid1.mo \
ClassExtendsInvalid2.mo \
ConstantRedeclareModifier.mo \
FinalRedeclareModifier.mo \
FinalRedeclareModifier2.mo \
Redeclare1.mo \
Redeclare2.mo \
Redeclare3.mo \
Redeclare4.mo \
Redeclare5.mo \
RedeclareBaseClass1.mo \
RedeclareFlowEffort.mo \
RedeclareFunction.mo \
RedeclareFunction1.mo \
RedeclareModifierInvalid1.mo \
RedeclareModifierInvalid2.mo \
RedeclareVisibility.mo \
RedeclareVisibility2.mo \

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES=\
ConstrainingType1.mo \
ConstrainingType2.mo \
Modification1.mo \
Modification2.mo \
RedeclareClass1.mo \
RedeclareClass2.mo \
RedeclareClass3.mo \
RedeclareComponent1.mo \
RedeclareComponent2.mo \
RedeclareComponent3.mo \
RedeclareComponentInvalid1.mo \
RedeclareComponentInvalid2.mo \
RedeclareComponentInvalid3.mo \

DOCFILES=modtest.texi cases.texi VERSION.texi
DISTFILES=$(TESTFILES) VERSION modtest.texi \
	Makefile rtest cases.texi index.html
HTMLFILE=modtest_toc.html

TEXI2DVI=texi2dvi
TEXI2HTML=texi2html -split_chapter
MAKEINFO=makeinfo

VERSION = $(shell cat VERSION)

.PHONY : default
default : modtest.info modtest.ps $(HTMLFILE)

.PHONY : test failingtest

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)

failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)

keywords :
	$(TEST) -l $(TESTFILES)

modtest.dvi : $(DOCFILES)
	$(TEXI2DVI) $<

modtest.ps : modtest.dvi
	dvips -o $@ $<

modtest.info : $(DOCFILES)
	$(MAKEINFO) $<

$(HTMLFILE) : $(DOCFILES)
	$(TEXI2HTML) $<

cases.texi : $(TESTFILES)
	$(RM) $@
	cases=`$(TEST) -L $(TESTFILES) | sort`; \
	echo "@menu" >> $@; \
	for c in $$cases; do echo "* $$c::" >> $@; done; \
	echo "@end menu" >> $@; \
	set "Test Cases" $$cases ""; \
	while [ "$$2" != "" ] ; do \
		echo ""                 	    >> $@; \
		echo "@node $$2,$$3,$$1,Test Cases" >> $@; \
		echo "@appendixsec $$2" 	    >> $@; \
		echo "@example"         	    >> $@; \
		echo "@include $$2.mo"  	    >> $@; \
		echo "@end example"     	    >> $@; \
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
