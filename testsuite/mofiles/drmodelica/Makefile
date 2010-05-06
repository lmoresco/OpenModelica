TEST=../../rtest -v

TESTFILES=\
ABCDsystem.mo \
AccessDemoIllegalMod.mo \
AccessDemoLegalMod.mo \
ActivateWhenEquation.mo \
AlgorithmCondAssign1.mo \
AlgorithmCondAssign2.mo \
AlgorithmSection.mo \
ArrayAddSub1.mo \
ArrayAddSub.mo \
ArrayConstruct1.mo \
ArrayDim1.mo \
ArrayDim2.mo \
ArrayDim3.mo \
ArrayDim4.mo \
ArrayDivError.mo \
ArrayDiv.mo \
ArrayExponentiation.mo \
ArrayFieldSlice.mo \
ArrayIndex.mo \
ArrayMult.mo \
ArrayReduce.mo \
ArraysInitIllegal.mo \
ArraysInitLegal.mo \
AssertTest.mo \
AssertTest1.mo \
AssertTest2.mo \
BlockMatrix.mo \
BlockMatrix2.mo \
BlockMatrix3.mo \
BouncingBall.mo \
ColoredPointLegalMod.mo \
Colors.mo \
ComplexNumbers.mo \
Concat3.mo \
ConstructFunc.mo \
CyclicPerm.mo \
DAEexample.mo \
DiscreteVectorStateSpace.mo \
DoubleWhenSequential.mo \
ElementWiseMultiplication.mo \
Epidemics1.mo \
EqualityEquationsCorrect.mo \
EquationCall.mo \
Equations.mo \
FilterBlock1.mo \
FiveForEquations.mo \
FlatTank.mo \
ForLoopHideVariable.mo \
FuncDer.mo \
FuncMultResults.mo \
HeatTankExpanded.mo \
HeatTank.mo \
HelloWorld.mo \
HideVariableForEquations.mo \
HydrogenIodide.mo \
IfEquation.mo \
JoinThreeVectors2.mo \
LeastSquares.mo \
LogCall1.mo \
LotkaVolterra.mo \
MicroCircuitInvalid.mo \
ModifiedFiltersInSeries.mo \
MoonLanding.mo \
MRFcall.mo \
MultFuncCall.mo \
OneArgBaseFunction.mo \
PointSum.mo \
PolynomialEvaluator1.mo \
PolynomialEvaluator2.mo \
PolynomialEvaluator3.mo \
PolynomialEvaluatorA.mo \
PolynomialEvaluatorB.mo \
RangeVector.mo \
RefinedSimpleCircuitInvalid.mo \
RefinedSimpleCircuitValid.mo \
RefinedSimpleCircuitValid2.mo \
SimplePeriodicSampler.mo \
StepAdvanced.mo \
SumForLoop.mo \
Summation.mo \
SumSeriesWhile.mo \
SumVectorForIf.mo \
TankHybridPID.mo \
TankHybridPI.mo \
Tank.mo \
TankPID.mo \
TankPI.mo \
TanksConnectedPI.mo \
TempDepResistorCircuitInherited.mo \
TempDepResistorCircuit.mo \
TwoRateSampler.mo \
VanDerPol.mo \
WatchDog1AlgorithmWhen.mo \
WatchDog2EquationWhen.mo \
VectorizeOneReturnValue.mo \
VectorizeSeveralArguments.mo \
WhenEquation.mo \
WhenNotValid.mo \
WhenPriority.mo \
WhenStatement1.mo \
WhenStatement2.mo \
WhenStatement3.mo \
WhenValidResult.mo \
WhenVectorPredicateEquation.mo \
Xpowers1.mo \
Xpowers2.mo \
Xpowers3.mo \
Xpowers.mo 

FAILINGTESTFILES= AddEmpty.mo AppendElement.mo Circuit.mo ColorClasses.mo \
ArraySlice.mo PointInst.mo DoubleWhenConflict.mo \
ColoredPointIllegalMod1.mo ColoredPointIllegalMod2.mo ColoredPointIllegalMod3.mo \
MicroCircuitValid.mo GenericMicroCircuit.mo DimConvert.mo \
EqualityEquations.mo DimSize.mo WhenNotValid.mo ErrorNestedWhen.mo \
ArrayAlgebraFunc.mo ArrayEmpty.mo ColorPixel.mo \
ConcatArr1.mo ConcatArr2.mo Concat4.mo ConnectForEquations.mo \
Oscillator.mo StatementCall.mo SubArrayIndex.mo TempResistor3.mo \
VectorizeSumVec.mo

DOCFILES=modtest.texi cases.texi VERSION.texi
DISTFILES=$(TESTFILES) VERSION modtest.texi \
	Makefile rtest cases.texi index.html
HTMLFILE=modtest_toc.html

TEXI2DVI=texi2dvi
TEXI2HTML=texi2html -split_chapte
MAKEINFO=makeinfo

VERSION = $(shell cat VERSION)

.PHONY : default
default : modtest.info modtest.ps $(HTMLFILE)

.PHONY : test
test :
	@echo
	@echo Running tests:
	@echo
	@$(TEST) $(TESTFILES)

failingtest :
	@echo
	@echo Running failing tests:
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
