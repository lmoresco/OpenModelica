TEST=./rtest -v
#TEST=runtest

TESTFILES= AlgorithmSection.mo ModifiedFiltersInSeries.mo \
ArrayDim1.mo Colors.mo MultFuncCall.mo ArrayDim2.mo DAEexample.mo \
ArrayDim3.mo ElementWiseMultiplication.mo \
ArrayDim4.mo Equations.mo Summation.mo \
BouncingBall.mo VanDerPol.mo LogCall1.mo Xpowers.mo \
ArrayAddSub.mo ArrayDiv.mo ArrayDivError.mo \
BlockMatrix.mo BlockMatrix2.mo \
BlockMatrix3.mo  PointSum.mo \
ComplexNumbers.mo EquationCall.mo  \
BouncingBall.mos \
VectorizeSeveralArguments.mo \
AccessDemoIllegalMod.mo AccessDemoLegalMod.mo \
ColoredPointLegalMod.mo ArraysInitLegal.mo \
CyclicPerm.mo \
MRFcall.mo \
MicroCircuitInvalid.mo \
TempDepResistorCircuit.mo TempDepResistorCircuitInherited.mo \
RefinedSimpleCircuitValid.mo RefinedSimpleCircuitInvalid.mo \
HelloWorld.mo HelloWorld.mos Xpowers1.mo Xpowers2.mo Xpowers3.mo \
PolynomialEvaluator1.mo PolynomialEvaluator2.mo FuncMultResults.mo \
SumForLoop.mo ForLoopHideVariable.mo SumSeriesWhile.mo SumVectorForIf.mo \
AlgorithmCondAssign1.mo Tank.mo HeatTank.mos HeatTankExpanded.mo \
FlatTank.mo FlatTank.mos TankPI.mos TankPI.mo \
TankPID.mos TankPID.mo TanksConnectedPI.mos TanksConnectedPI.mo \
TankHybridPID.mo TankHybridPI.mo CyclicPerm.mo CyclicPerm.mos \
ArrayAddSub1.mo ArrayAddSub1.mos ArrayDivError.mo ArrayDivError.mos \
ArrayMult.mo ArrayMult.mos ArrayReduce.mo \
VectorizeOneReturnValue.mo ABCDsystem.mo EqualityEquationsCorrect.mo \
EqualityEquations.mos FiveForEquations.mo FiveForEquations.mos \
HideVariableForEquations.mo HideVariableForEquations.mos IfEquation.mo \
IfEquation.mos WhenEquation.mo WhenEquation.mos WhenVectorPredicateEquation.mo \
WhenVectorPredicateEquation.mo WhenValidResult.mo WhenValidResult.mo \
PolynomialEvaluatorA.mo PolynomialEvaluatorA.mos \
PolynomialEvaluatorB.mo PolynomialEvaluatorB.mos StepAdvanced.mo StepAdvanced.mos \
AlgorithmSection.mo AlgorithmSection.mos WhenStatement1.mo WhenStatement1.mos \
WhenStatement2.mo WhenStatement2.mos WhenStatement3.mo WhenStatement3.mos \
DoubleWhenConflict.mos DoubleWhenSequential.mo DoubleWhenSequential.mos \
FuncDer.mo FuncDer.mos SimplePeriodicSampler.mo SimplePeriodicSampler.mos \
TwoRateSampler.mo TwoRateSampler.mos DiscreteVectorStateSpace.mo DiscreteVectorStateSpace.mos \
WatchDog1AlgorithmWhen.mo WatchDog2EquationWhen.mo Epidemics1.mo \
LotkaVolterra.mo LotkaVolterra.mos HydrogenIodide.mo HydrogenIodide.mos \

FAILINGTESTFILES= AppendElement.mo ArrayExponentiation.mo Circuit.mo ColorClasses.mo LeastSquares.mo \
AlgorithmCondAssign2.mo \
ArrayFieldSlice.mo ArraySlice.mo \
PointInst.mo \
ColoredPointIllegalMod1.mo \
ColoredPointIllegalMod2.mo ColoredPointIllegalMod3.mo \
ArraysInitIllegal.mo RefinedSimpleCircuitValid2.mo \
MicroCircuitValid.mo \
GenericMicroCircuit.mo \
PolynomialEvaluator1.mos  PolynomialEvaluator3.mos PolynomialEvaluator2.mos \
JoinThreeVectors2.mos StatementCall.mos WhenPriority.mos OneArgBaseFunction.mos \
HeatTank.mo TankHybridPID.mos TankHybridPI.mos ArrayFieldSlice.mo ArrayFieldSlice.mos \
AppendElement.mo AppendElement.mos ArrayExponentiation.mo ArrayExponentiation.mos \
DimConvert.mo DimConvert.mos ConstructFunc.mo ConstructFunc.mos ArrayReduce.mos \
VectorizeOneReturnValue.mos ABCDsystem.mos EqualityEquationsCorrect.mos \
EqualityEquations.mo DimSize.mo WhenNotValid.mo ErrorNestedWhen.mo \
DoubleWhenConflict.mo WatchDog1AlgorithmWhen.mos WatchDog2EquationWhen.mos Epidemics1.mos \

 



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
