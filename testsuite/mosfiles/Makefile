
TESTFILES = \
ABCDsystem.mos \
AlgorithmCondAssign1.mos \
AlgorithmForInClass.mos \
AlgorithmSection.mos \
algorithms.mos \
Array1.mos ArrayAddSub1.mos ArrayDivError.mos \
ArrayEquation.mos ArrayMult.mos ArrayReduce.mos \
blockssources.mos blockssystems.mos \
BouncingBall.mos BouncingBall2.mos BouncingBallExamples.mos \
ComplexNumbers.mos \
ConstructFunc.mos \
Cross.mos \
CyclicPerm.mos \
DAEexample.mos DAEexample2.mos \
DefaultComponentName.mos \
dertest.mos differentiate.mos \
DiscreteVectorStateSpace.mos \
DoubleWhenConflict.mos DoubleWhenSequential.mos \
EqualityEquations.mos \
ExtendsBasic.mos \
ExternalLibraries.mos ExternalFunctionResultOrder.mos\
ExtObj.mos \
FiveForEquations.mos \
FlatTank.mos \
ForIterator1.mos ForIterator2.mos \
ForStatement1.mos ForStatement2.mos ForStatement3.mos ForStatement4.mos \
ForStatement5fail.mos ForStatement6.mos ForStatement7.mos \
FuncDer.mos FuncNamespace.mos \
FunctionIndirectRecursion.mos FunctionIndirectRecursion2.mos \
HeatTank.mos HeatTankExpanded.mos \
HideVariableForEquations.mos \
HydrogenIodide.mos \
Identity.mos \
IdealDiode.mos Identifier.mos \
IfEquation.mos IfEquation2.mos \
IfStatement.mos IfStatementIllegal.mos \
Initialization.mos \
IntMulOverflow.mos IntPowOverflow.mos IntDivOverflow.mos IntAddSubOverflow.mos \
interactive_api_param.mos interactive_api_classes.mos \
interactive_api_loadsave.mos  interactive_api_attributes.mos \
Interpolation.mos \
InOutStrings.mos InOutRecord.mos \
HelloWorld.mos \
LinearSysEq.mos \
loadFileInteractiveQualified.mos \
LotkaVolterra.mos \
Matrix.mos matrices.mos \
MissV.mos \
MyPointsInst1.mos MyPointsInst2.mos \
ModelBalance1.mos ModelBalance2.mos ModelBalance3.mos \
OverloadingFunc.mos \
Pendulum.mos \
PolynomialEvaluatorA.mos PolynomialEvaluatorB.mos \
PolynomialEvaluator1.mos PolynomialEvaluator2.mos PolynomialEvaluator3.mos \
Reductions.mos \
refactorGraphAnn1.mos refactorGraphAnn2.mos \
Rename.mos \
Return.mos \
Riccati.mos \
rotationalsystems.mos rotationalgears.mos \
rotationalspringinertia.mos \
Sign.mos \
SimplePeriodicSampler.mos \
simplify.mos \
simulation.mos simulation2.mos simulation3.mos \
StepAdvanced.mos \
strings.mos StringTest.mos \
SumSeriesWhile.mos \
Switch.mos \
Tank.mos TankPI.mos TankPID.mos TanksConnectedPI.mos TankHybridPID.mos TankHybridPI.mos \
tempInterpol2test.mos \
Time.mos \
TwoRateSampler.mos \
UnpOpPrecedence.mos \
val.mos \
variables.mos \
WhenEquation.mos \
WhenStatement1.mos WhenStatement2.mos WhenStatement3.mos whenstatements.mos \
WhileStatement.mos WhileStatementIllegal.mos \
Xpowers1.mos Xpowers2.mos Xpowers3.mos ModifierProblem.mos

# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= MoonAndEarth.mos \
JoinThreeVectors2.mos StatementCall.mos \
WhenPriority.mos OneArgBaseFunction.mos \
ArrayFieldSlice.mos \
AppendElement.mos ArrayExponentiation.mos \
DimConvert.mos \
VectorizeOneReturnValue.mos EqualityEquationsCorrect.mos \
WatchDog1AlgorithmWhen.mos WatchDog2EquationWhen.mos Epidemics1.mos \
ActivateWhenEquation.mos AlgorithmCondAssign2.mos Enum8.mos 

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
