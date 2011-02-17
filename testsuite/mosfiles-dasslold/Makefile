TEST = ../rtest -v

TESTFILES = \
ABCDsystem.csv.mos \
ABCDsystem.empty.mos \
ABCDsystem.plt.mos \
AlgorithmArrayEqn.mos \
AlgorithmCondAssign1.mos \
AlgorithmForInClass.mos \
AlgorithmSection.mos \
algorithms.mos \
ArrayAddSub1.mos \
ArrayDivError.mos \
ArrayEquation.mos \
ArrayMult.mos \
ArrayParameterSize.mos \
ArrayReduce.mos \
ArraySlice.mos \
AsubCrefExpType.mos \
BooleanArray.mos \
BouncingBall2.mos \
BouncingBallExamples.mos \
BouncingBall.mos \
BuiltinMath.mos \
ComplexNumbers.mos \
ComplexTypeEquationCount.mos \
ConstructFunc.mos \
Cross.mos \
CyclicPerm.mos \
DAEexample.mos DAEexample2.mos \
Delay.mos \
dertest.mos  \
DiscreteVectorStateSpace.mos \
DoubleWhenConflict.mos \
DoubleWhenSequential.mos \
EnumArray.mos \
EqualityEquations.mos \
EquationCallIntegerArray.mos \
EventIteration.mos \
ExtendsBasic.mos  \
ExternalLibraries.mos \
ExtObj.mos \
ExtObjStringParam.mos \
FiveForEquations.mos \
FlatTank.mos \
ForIterator1.mos \
ForIterator2.mos \
FuncDer.mos  \
FunctionIndirectRecursion2.mos \
FunctionIndirectRecursion.mos \
FunctionInReinit.mos \
HeatTankExpanded.mos \
HeatTank.mos \
HelloWorld.mos \
HideVariableForEquations.mos \
HydrogenIodide.mos \
IdealDiode.mos  \
Identity.mos \
IfEquation2.mos \
IfEquation3.mos \
IfEquation.mos \
Initialization.mos \
InlineSolverCodeGenerationEuler.mos \
InlineSolverCodeGenerationRK.mos \
InOutStrings.mos InOutRecord.mos \
Interpolation.mos \
LinearSysEq.mos \
LocalVariableInit.mos \
LotkaVolterra.mos \
Matrix.mos  \
MissV.mos \
ModelBalance1.mos \
ModelBalance2.mos \
ModelBalance3.mos \
ModelicaUtilities.mos \
MyPointsInst1.mos \
MyPointsInst2.mos \
nonConstantParam.mos \
Pendulum.mos \
PolynomialEvaluator1.mos \
PolynomialEvaluator2.mos \
PolynomialEvaluator3.mos \
PolynomialEvaluatorA.mos \
PolynomialEvaluatorB.mos \
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
SyncFilter.mos \
TankHybridPID.mos \
TankHybridPI.mos \
Tank.mos \
TankPID.mos \
TankPI.mos \
TanksConnectedPI.mos \
tempInterpol2test.mos \
Time.mos \
TupleReturn.mos \
TwoRateSampler.mos \
val.mos \
WhenEquation1.mos \
WhenEquation.mos \
when_sorting.mos \
WhenStatement1.mos \
WhenStatement2.mos \
WhenStatement3.mos \
whenstatements.mos \
Xpowers1.mos \
Xpowers2.mos \
Xpowers3.mos  \
 


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES = \
ActivateWhenEquation.mos \
AlgorithmCondAssign2.mos \
AppendElement.mos \
ArrayExponentiation.mos \
ArrayFieldSlice.mos \
DimConvert.mos \
Enum8.mos \
Epidemics1.mos \
EqualityEquationsCorrect.mos \
JoinThreeVectors2.mos \
MoonAndEarth.mos \
OneArgBaseFunction.mos \
StatementCall.mos \
WatchDog1AlgorithmWhen.mos \
WatchDog2EquationWhen.mos \
VectorizeOneReturnValue.mos \
WhenPriority.mos \

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
