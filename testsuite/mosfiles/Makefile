TEST = ../rtest -v

TESTFILES = \
ABCDsystem.plt.mos \
ABCDsystem.csv.mos \
ABCDsystem.empty.mos \
ActivateWhenEquation.mos \
AliasEquations.mos \
AlgorithmArrayEqn.mos \
AlgorithmCondAssign1.mos \
AlgorithmCondAssign2.mos \
AlgorithmForInClass.mos \
AlgorithmSection.mos \
algorithms.mos \
ArrayAddSub1.mos ArrayDivError.mos \
ArrayExponentiation.mos \
ArrayEquation.mos ArrayMult.mos \
ArrayFromRange.mos \
ArrayReduce.mos \
ArrayParameterSize.mos \
ArraySlice.mos \
AssertTest.mos \
AssertTest1.mos \
AssertTest2.mos \
AsubCrefExpType.mos \
ASubIfExp.mos \
BooleanArray.mos \
BouncingBall.mos BouncingBall2.mos BouncingBallExamples.mos \
BuiltinMath.mos \
Bug1687.mos \
CheckEvents.mos \
ComplexNumbers.mos \
ComplexSystem.mos \
ComplexTypeEquationCount.mos \
ConstructFunc.mos \
constantLinSys.mos \
Cross.mos \
CyclicPerm.mos \
Delay.mos \
DAEexample.mos DAEexample2.mos \
dertest.mos  \
DimConvert.mos \
DiscreteVectorStateSpace.mos \
DoubleWhenConflict.mos DoubleWhenSequential.mos \
DummyDerMatching.mos  \
EnumArray.mos \
Epidemics1.mos \
EquationCallIntegerArray.mos \
EqualityEquations.mos \
EqualityEquationsCorrect.mos \
EventDelay.mos \
EventIteration.mos \
EventTests.mos \
ExtendsBasic.mos  \
ExternalLibraries.mos \
ExtObj.mos ExtObjStringParam.mos \
FiveForEquations.mos \
FinalPropagation.mos \
FlatTank.mos \
ForIterator1.mos \
FrameTest.mos \
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
JBouncingBall.mos \
HelloWorld.mos \
LinearSysEq.mos \
LocalVariableInit.mos \
LotkaVolterra.mos \
Matrix.mos  \
MeasureTime.mos \
MissV.mos \
ModelicaUtilities.mos \
MyPointsInst1.mos MyPointsInst2.mos \
ModelBalance1.mos ModelBalance2.mos ModelBalance3.mos \
nonConstantIndex.mos \
nonConstantParam.mos \
NonlinearFailed.mos \
NonlinearMixed.mos \
OneArgBaseFunction.mos \
ParameterCycle.mos \
ParameterModel.mos \
Pendulum.mos \
PolynomialEvaluatorA.mos PolynomialEvaluatorB.mos \
PolynomialEvaluator1.mos PolynomialEvaluator2.mos PolynomialEvaluator3.mos \
PreAndAliasedVar.mos \
PreMatrix.mos \
Random.mos \
RedeclarePackage.mos \
Reductions.mos \
Riccati.mos \
Sample1.mos Sample2.mos Sample3.mos \
SemiLinear.mos \
Sign.mos \
SimplePeriodicSampler.mos \
SimResultScripting.mos \
simulation.mos \
SliceAssignment.mos \
StepAdvanced.mos \
StringTest.mos \
SumSeriesWhile.mos \
SyncFilter.mos \
Switch.mos \
Tank.mos TankPI.mos TankPID.mos TankHybridPID.mos TankHybridPI.mos TanksConnectedPI.mos \
terminal.mos \
tempInterpol2test.mos \
TestLapack.mos \
TestSolve.mos \
Time.mos \
TupleReturn.mos \
TwoRateSampler.mos \
val.mos \
VariableFilter.mos \
VectorizeOneReturnValue.mos \
WatchDog1AlgorithmWhen.mos WatchDog2EquationWhen.mos \
WhenEquation.mos WhenEquation1.mos WhenPriority.mos \
when_sorting.mos \
WhenStatement1.mos WhenStatement2.mos WhenStatement3.mos whenstatements.mos \
Xpowers1.mos Xpowers2.mos Xpowers3.mos  \
ZeroCross.mos \


# test that currently fail. Move up when fixed. 
# Run make testfailing
FAILINGTESTFILES= MoonAndEarth.mos \
JoinThreeVectors2.mos StatementCall.mos \
ArrayFieldSlice.mos \
AppendElement.mos \
Enum8.mos  \
ForIterator2.mos \
TankPIDOPRI5.mos TanksConnectedPIDOPRI5.mos\
SpaceProbe.mos \
BouncingBallExamplesDOPRI5.mos \
InitialConstantSection.mos \

# Dependency files that are not .mo .mos or Makefile
# Add them here or they will be cleaned.
DEPENDENCIES = \
*.mo \
*.mos \
FlatParse.mof \
Makefile \
EventTests.mat \
ExtObj.c \
ExtObj.h \
ExtObjStringParam.ext.c \
ExtObjStringParam.ext.h \
ExternalFunc1.c \
ExternalFunc1_ext.h \
ExternalFunc2.c \
ExternalFunc2.h \
Func.c \
Func.h \
InOutStrings_fkn1.cc \
InOutStrings_fkn2.cc \
ModelicaUtilities.myExtFunction.c \
dependencies.dep \
testTables.txt \
testTables2.csv \
testTables2.txt \
testTables2D.txt \


CLEAN = `ls | grep -w -v -f deps.tmp`

.PHONY : test clean getdeps

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(TEST) $(TESTFILES)
	
# Cleans all files that are not listed as dependencies 
clean :
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)

# Run this if you want to list out the files (dependencies).
# do it after cleaning and updating the folder
# then you can get a list of file names (which must be dependencies
# since you got them from repository + your own new files)
# then add them to the DEPENDENCIES. You can find the 
# list in deps.txt 
getdeps: 
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@echo $(CLEAN) | sed -r 's/deps.txt|deps.tmp//g' | sed 's/ / \\\n/g' > deps.txt	
	@echo Dependency list saved in deps.txt.
	@echo Copy the list from deps.txt and add it to the Makefile @DEPENDENCIES

failingtest :
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
