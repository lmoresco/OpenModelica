TEST=./rtest
#TEST=runtest

TESTFILES= Abs2.mo AddReal1.mo Algorithm1.mo Algorithm2.mo Algorithm3.mo \
Array1.mo Array2.mo Array8.mo Array9.mo Array_builtin.mo ArrayModification11.mo \
ArrayModification5.mo ArrayModification6.mo ArrayModification8.mo ArraySlice1.mo \
Circuit1.mo Class1.mo Class2.mo Class4.mo ConditionalArrayExpression1.mo \
Connect1.mo Connect2.mo Connect4.mo Connect7.mo Connect8.mo Connect9.mo \
ConnectFlowEffort.mo ConnectHierarchical1.mo ConnectHierarchical2.mo \
ConnectInner1.mo Constant2.mo Constant1.mo \
Constant4.mo ConstrainingType1.mo ConstructParameters.mo \
ConstructParameters1.mo Declaration1.mo Declaration2.mo Declaration3.mo \
DeclareConstant1.mo DependsMutual.mo DependsRecursive.mo Discrete1.mo Discrete2.mo \
Encapsulated1.mo Encapsulated2.mo EquationComponent1.mo EquationComponent2.mo \
EquationComponent3.mo EquationComponent4.mo EquationComponent5.mo \
EquationFor1.mo EquationFor2.mo EquationFor3.mo EquationFor4.mo \
EquationIf1.mo EquationIf2.mo EquationIf3.mo EquationIf4.mo  Extends1.mo Function1.mo \
Function3.mo Function5.mo Function6.mo Function7.mo Function8.mo \
Function9.mo Import1.mo Import2.mo Import3.mo Import4.mo \
InnerClass1.mo Integer2Real.mo Lookup1.mo Lookup2.mo Lookup4.mo Lookup6.mo Lookup7.mo \
modelica_1_1_Array9.mo modelica_1_1_Type10.mo modelica_1_1_Type9.mo Modification1.mo \
Modification10.mo Modification2.mo Modification6.mo Modification7.mo Modification9.mo \
ModifyConstant3.mo NoEvent1.mo Overwriting1.mo Overwriting2.mo \
Overwriting4.mo package-s-1.mo ParseError1.mo ParseError2.mo \
partial-s-1.mo Protected1.mo prtest.mo \
Range1.mo Real2Integer1.mo Real2Integer2.mo Record1.mo Redeclare1.mo Redeclare2.mo \
Redeclare3.mo RedeclareFlowEffort.mo \
ScopeDeclaration3.mo ScopeModification1.mo ScopeModification2.mo Shadow1.mo \
SimpleIntegrator1.mo SimpleIntegrator2.mo SimpleIntegrator3.mo SimpleIntegrator4.mo \
Terminal1.mo Terminal2.mo \
Type1.mo Type3.mo Type4.mo Type5.mo Type6.mo Type7.mo Type8.mo \
Units2.mo XPowers1.mo XPowers2.mo XPowers3.mo \
FunctionEval1.mo FunctionEval2.mo FunctionEval3.mo \
FunctionEval4.mo FunctionEval5.mo FunctionEval6.mo \
FunctionEval7.mo FunctionEval8.mo FunctionEval9.mo \
FunctionEvalBuiltin.mo FunctionBubblesort.mo FunctionSimplex.mo \
ExternalFunction1.mo ExternalFunction2.mo ExternalFunction3.mo

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
