
TESTFILES = ForIterator1.mos ForIterator2.mos ForStatement1.mos ForStatement2.mos ForStatement3.mos ForStatement4.mos \
ForStatement5fail.mos ForStatement6.mos ForStatement7.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
IfStatement.mos IfStatementIllegal.mos WhileStatement.mos WhileStatementIllegal.mos \
interactive_api_param.mos interactive_api_classes.mos Initialization.mos tempInterpol2test.mos \
variables.mos Array1.mos simulation.mos simulation2.mos simulation3.mos differentiate.mos simplify.mos \
strings.mos interactive_api_loadsave.mos  interactive_api_attributes.mos \
matrices.mos BouncingBall.mos ExternalLibraries.mos \
loadFileInteractiveQualified.mos ArrayEquation.mos Rename.mos \
IdealDiode.mos Identifier.mos Time.mos \
blockssources.mos blockssystems.mos rotationalspringinertia.mos \
rotationalsystems.mos rotationalgears.mos Interpolation.mos \
ExtObj.mos algorithms.mos UnpOpPrecedence.mos BouncingBallExamples.mos Riccati.mos Pendulum.mos \
val.mos refactorGraphAnn1.mos refactorGraphAnn2.mos \
DAEexample.mos whenstatements.mos StringTest.mos dertest.mos DefaultComponentName.mos \
BouncingBall2.mos \
HelloWorld.mos Tank.mos HeatTank.mos \
HeatTankExpanded.mos FlatTank.mos TankPI.mos \
TankPID.mos TanksConnectedPI.mos \
CyclicPerm.mos \
ArrayAddSub1.mos ArrayDivError.mos \
ArrayMult.mos \
EqualityEquations.mos FiveForEquations.mos \
HideVariableForEquations.mos \
IfEquation.mos WhenEquation.mos \
PolynomialEvaluatorA.mos \
PolynomialEvaluatorB.mos StepAdvanced.mos \
AlgorithmSection.mos WhenStatement1.mos \
WhenStatement2.mos WhenStatement3.mos \
DoubleWhenConflict.mos DoubleWhenSequential.mos \
FuncDer.mos SimplePeriodicSampler.mos \
TwoRateSampler.mos DiscreteVectorStateSpace.mos \
LotkaVolterra.mos HydrogenIodide.mos \
MyPointsInst1.mos MyPointsInst2.mos \
Switch.mos AlgorithmCondAssign1.mos \
Xpowers1.mos Xpowers2.mos DAEexample2.mos \
ComplexNumbers.mos \
PolynomialEvaluator1.mos PolynomialEvaluator3.mos \
PolynomialEvaluator2.mos Matrix.mos \
FuncNamespace.mos OverloadingFunc.mos \
InOutStrings.mos InOutRecord.mos \
LinearSysEq.mos MissV.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= MoonAndEarth.mos \
JoinThreeVectors2.mos StatementCall.mos \
WhenPriority.mos OneArgBaseFunction.mos \
TankHybridPID.mos TankHybridPI.mos ArrayFieldSlice.mos \
AppendElement.mos ArrayExponentiation.mos \
DimConvert.mos ConstructFunc.mos ArrayReduce.mos \
VectorizeOneReturnValue.mos ABCDsystem.mos EqualityEquationsCorrect.mos \
WatchDog1AlgorithmWhen.mos WatchDog2EquationWhen.mos Epidemics1.mos \
ActivateWhenEquation.mos AlgorithmCondAssign2.mos \
Xpowers3.mos \

TEST = ./rtest -v


.PHONY : test

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
	
failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
