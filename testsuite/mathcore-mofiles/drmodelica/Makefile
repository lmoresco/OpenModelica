TEST=../../rtest -v
#TEST=runtest
#adrpo 2008-12-16 disable the .mos files for now.
TESTFILES= AlgorithmSection.mo ModifiedFiltersInSeries.mo \
ArrayDim1.mo Colors.mo MultFuncCall.mo ArrayDim2.mo DAEexample.mo \
ArrayDim3.mo ElementWiseMultiplication.mo ArrayDim4.mo Equations.mo \
Summation.mo BouncingBall.mo VanDerPol.mo LogCall1.mo Xpowers.mo \
ArrayAddSub.mo ArrayDiv.mo ArrayDivError.mo BlockMatrix.mo BlockMatrix2.mo \
BlockMatrix3.mo PointSum.mo ComplexNumbers.mo EquationCall.mo \
VectorizeSeveralArguments.mo AccessDemoIllegalMod.mo AccessDemoLegalMod.mo \
ColoredPointLegalMod.mo ArraysInitLegal.mo CyclicPerm.mo MRFcall.mo \
MicroCircuitInvalid.mo TempDepResistorCircuit.mo TempDepResistorCircuitInherited.mo \
RefinedSimpleCircuitValid.mo RefinedSimpleCircuitInvalid.mo HelloWorld.mo \
Xpowers1.mo Xpowers2.mo Xpowers3.mo PolynomialEvaluator1.mo PolynomialEvaluator2.mo \
FuncMultResults.mo SumForLoop.mo ForLoopHideVariable.mo SumSeriesWhile.mo SumVectorForIf.mo \
AlgorithmCondAssign1.mo Tank.mo HeatTankExpanded.mo FlatTank.mo TankPI.mo \
TankPID.mo TanksConnectedPI.mo TankHybridPID.mo TankHybridPI.mo CyclicPerm.mo \
ArrayAddSub1.mo ArrayDivError.mo ArrayMult.mo ArrayReduce.mo VectorizeOneReturnValue.mo \
ABCDsystem.mo EqualityEquationsCorrect.mo FiveForEquations.mo HideVariableForEquations.mo \
IfEquation.mo WhenEquation.mo WhenVectorPredicateEquation.mo WhenVectorPredicateEquation.mo \
WhenValidResult.mo WhenValidResult.mo PolynomialEvaluatorA.mo PolynomialEvaluatorB.mo \
StepAdvanced.mo AlgorithmSection.mo WhenStatement1.mo WhenStatement2.mo \
WhenStatement3.mo DoubleWhenSequential.mo FuncDer.mo SimplePeriodicSampler.mo TwoRateSampler.mo \
DiscreteVectorStateSpace.mo WatchDog1AlgorithmWhen.mo WatchDog2EquationWhen.mo Epidemics1.mo \
LotkaVolterra.mo HydrogenIodide.mo
#TanksConnectedPI.mos TankPID.mos FlatTank.mos BouncingBall.mos HelloWorld.mos HeatTank.mos TankPI.mos \
#CyclicPerm.mos HydrogenIodide.mos LotkaVolterra.mos DiscreteVectorStateSpace.mos SimplePeriodicSampler.mos \
#DoubleWhenSequential.mos DoubleWhenConflict.mos FuncDer.mos StepAdvanced.mos \
#WhenStatement3.mos WhenStatement2.mos WhenStatement1.mos TwoRateSampler.mos PolynomialEvaluatorB.mos \
#PolynomialEvaluatorA.mos HideVariableForEquations.mos ArrayMult.mos ArrayDivError.mos ArrayAddSub1.mos \
#EqualityEquations.mos FiveForEquations.mos IfEquation.mos WhenEquation.mos AlgorithmSection.mos 

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
