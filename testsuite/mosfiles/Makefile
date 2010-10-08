TEST = ../rtest -v

TESTFILES = \
ABCDsystem.plt.mos \
ABCDsystem.csv.mos \
ABCDsystem.empty.mos \
AlgorithmArrayEqn.mos \
AlgorithmCondAssign1.mos \
AlgorithmForInClass.mos \
AlgorithmSection.mos \
algorithms.mos \
ArrayAddSub1.mos ArrayDivError.mos \
ArrayEquation.mos ArrayMult.mos ArrayReduce.mos \
ArraySlice.mos \
BooleanArray.mos \
BouncingBall.mos BouncingBall2.mos BouncingBallExamples.mos \
BuiltinMath.mos \
ComplexNumbers.mos \
ConstructFunc.mos \
Cross.mos \
CyclicPerm.mos \
DAEexample.mos DAEexample2.mos \
Delay.mos \
dertest.mos  \
DiscreteVectorStateSpace.mos \
DoubleWhenConflict.mos DoubleWhenSequential.mos \
EnumArray.mos \
EquationCallIntegerArray.mos \
EqualityEquations.mos \
ExtendsBasic.mos  \
ExternalLibraries.mos \
ExtObj.mos ExtObjStringParam.mos \
FiveForEquations.mos \
FlatTank.mos \
ForIterator1.mos ForIterator2.mos \
FuncDer.mos  \
FunctionIndirectRecursion.mos \
FunctionIndirectRecursion2.mos \
FunctionInReinit.mos \
HeatTank.mos HeatTankExpanded.mos \
HideVariableForEquations.mos \
HydrogenIodide.mos \
Identity.mos \
IdealDiode.mos  \
IfEquation.mos IfEquation2.mos IfEquation3.mos \
Initialization.mos \
InlineSolverCodeGenerationEuler.mos \
InlineSolverCodeGenerationRK.mos \
Interpolation.mos \
InOutStrings.mos InOutRecord.mos \
HelloWorld.mos \
LinearSysEq.mos \
LocalVariableInit.mos \
LotkaVolterra.mos \
Matrix.mos  \
MissV.mos \
ModelicaUtilities.mos \
MyPointsInst1.mos MyPointsInst2.mos \
ModelBalance1.mos ModelBalance2.mos ModelBalance3.mos \
nonConstantParam.mos \
Pendulum.mos \
PolynomialEvaluatorA.mos PolynomialEvaluatorB.mos \
PolynomialEvaluator1.mos PolynomialEvaluator2.mos PolynomialEvaluator3.mos \
PreAndAliasedVar.mos \
Random.mos \
Reductions.mos \
Riccati.mos \
Sample1.mos \
SemiLinear.mos \
Sign.mos \
SimplePeriodicSampler.mos \
SimResultScripting.mos \
simulation.mos \
SliceAssignment.mos \
StepAdvanced.mos \
StringTest.mos \
SumSeriesWhile.mos \
Switch.mos \
Tank.mos TankPI.mos TankPID.mos TanksConnectedPI.mos TankHybridPID.mos TankHybridPI.mos \
tempInterpol2test.mos \
Time.mos \
TupleReturn.mos \
TwoRateSampler.mos \
val.mos \
WhenEquation.mos WhenEquation1.mos \
WhenStatement1.mos WhenStatement2.mos WhenStatement3.mos whenstatements.mos \
Xpowers1.mos Xpowers2.mos Xpowers3.mos  \
when_sorting.mos EventIteration.mos \
 


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
