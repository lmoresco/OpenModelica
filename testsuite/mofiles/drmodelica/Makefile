TEST=./rtest
#TEST=runtest

TESTFILES= AlgorithmSection.mo ModifiedFiltersInSeries.mo \
ArrayDim1.mo Colors.mo MultFuncCall.mo ArrayDim2.mo DAEexample.mo \
PolynomialEvaluator1.mo ArrayDim3.mo ElementWiseMultiplication.mo \
PolynomialEvaluator2.mo ArrayDim4.mo Equations.mo Summation.mo \
BouncingBall.mo VanDerPol.mo LogCall1.mo Xpowers.mo \
AppendElement.mo ArrayAddSub.mo ArrayDiv.mo ArrayExponentiation.mo \
ArrayFieldSlice.mo ArraySlice.mo BlockMatrix.mo BlockMatrix2.mo \
BlockMatrix3.mo PointInst.mo PointSum.mo \
VectorizeSeveralArguments.mo

FAILINGTESTFILES= Circuit.mo ColorClasses.mo LeastSquares.mo ArrayDivError.mo CyclicPerm.mo
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

.PHONY : test
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
