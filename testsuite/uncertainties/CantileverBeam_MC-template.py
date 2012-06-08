#################################################################
########### Cantilever beam - Wrapper OMC/OpenTURNS #############
#################################################################
### Author: OpenTURNS documentation
### Modified by: 
###   - Audrey JARDIN (EDF, France) - February 2011
#################################################################

from openturns import *
from math import *
from openturns.viewer import ViewImage

#######################
## Function 'deviation'
#######################
# Create here the python lines to define the implementation of the function

# In order to be able to use that function with the openturns library,
#it is necessary to define a class which derives from OpenTURNSPythonFunction

class modelePYTHON(OpenTURNSPythonFunction) :
    # that fllowing method defines the input size (4) and the output size (1)
    def __init__(self) :
        OpenTURNSPythonFunction.__init__(self,4,1)

    # that following method gives the implementation of modelePYTHON
    def f(self,x) :
        E=x[0]
        F=x[1]
        L=x[2]
        I=x[3]
        return [(F*L*L*L)/(3.*E*I)]

# Use that function defined in the script python
# with the openturns library
# Create a NumericalMathFunction from modelPYTHON
deviation = NumericalMathFunction(modelePYTHON())


#######################
## Input random vector
#######################

# Create the marginal distributions of the input random vector
<%distributions%>


# Create the Spearman correlation matrix of the input random vector
<%correlationMatrix%>

# Evaluate the correlation matrix of the Normal copula from RS
R = NormalCopula.GetCorrelationFromSpearmanCorrelation(RS)

# Create the Normal copula parametrized by R
copuleNormal = NormalCopula(R)

# Create a collection of the marginal distributions
<%collectionDistributions%>

# Create the input probability distribution
inputDistribution = ComposedDistribution(collectionMarginals, Copula(copuleNormal))

# Give a description of each component of the input distribution
<%inputDescriptions%>

inputDistribution.setDescription(inputDescription)

# Create the input random vector
inputRandomVector = RandomVector(inputDistribution)

# Create the output variable of interest
outputVariableOfInterest = RandomVector(deviation, inputRandomVector)


print ""
#######################################
### Random Study: central tendance of
### the output variable of interest
#######################################

print "#######################################"
print "Random_Study:_central_tendance_of"
print "the_output_variable_of_interest"
print "#######################################"
print ""

#########################################
### Taylor variance decomposition
#########################################
##
##print "#######################################"
##print "Taylor_variance_decomposition"
##print "#######################################"
##print ""
##
### We create a quadraticCumul algorithm
##myQuadraticCumul = QuadraticCumul(outputVariableOfInterest)
##
### We compute the several elements provided by the quadratic cumul algorithm
### and evaluate the number of calculus needed
##nbBefr = deviation.getEvaluationCallsNumber()
##
### Mean first order
##meanFirstOrder = myQuadraticCumul.getMeanFirstOrder()[0]
##nbAfter1 = deviation.getEvaluationCallsNumber()
##
### Mean second order
##meanSecondOrder = myQuadraticCumul.getMeanSecondOrder()[0]
##nbAfter2 = deviation.getEvaluationCallsNumber()
##
### Standard deviation
##stdDeviation = sqrt(myQuadraticCumul.getCovariance()[0,0])
##nbAfter3 = deviation.getEvaluationCallsNumber()
##
##print "First_order_mean=", myQuadraticCumul.getMeanFirstOrder()[0]
##print "Evaluation_calls_number=", nbAfter1 - nbBefr
##print "Second_order_mean=", myQuadraticCumul.getMeanSecondOrder()[0]
##print "Evaluation_calls_number=", nbAfter2 - nbAfter1
##print "Standard_deviation=", sqrt(myQuadraticCumul.getCovariance()[0,0])
##print "Evaluation_calls_number=", nbAfter3 - nbAfter2
##
##print "Importance_factors="
##for i in range(inputRandomVector.getDimension()):
##    print inputDistribution.getDescription()[i], "=", myQuadraticCumul.getImportanceFactors()[i]
##print ""

###################
# Random sampling
###################

print "###################"
print "Random_sampling"
print "###################"

size1 = 10000
output_Sample1 = outputVariableOfInterest.getNumericalSample(size1)
outputMean = output_Sample1.computeMean()
outputCovariance = output_Sample1.computeCovariance()

print "Sample_size_=_", size1
print "Mean_from_sample_=_", outputMean[0]
print "Standard_deviation_from_sample_=_", sqrt(outputCovariance[0,0])
print ""


################################################################
##### Probabilistic Study : threshold exceedance : deviation > 30 cm
################################################################
##
##print ""
##print "##############################################################"
##print " Probabilistic_Study_:_threshold_exceedance:_deviation_>_30cm"
##print "##############################################################"
##
### We create an Event from this RandomVector
### threshold has been defined in the kernel smoothing section
##threshold = 30
##myEvent = Event(outputVariableOfInterest, ComparisonOperator(Greater()), threshold)
##myEvent.setName("Deviation_>_30_cm")
##
##
##################
### MC
##################
##
##print "###########"
##print "Monte_Carlo"
##print "###########"
##print ""
##
##maximumOuterSampling = 40000
##blockSize = 100
##coefficientOfVariation = 0.1
##
##
### We create a Monte Carlo algorithm
##myAlgoMonteCarlo = MonteCarlo(myEvent)
##myAlgoMonteCarlo.setMaximumOuterSampling(maximumOuterSampling)
##myAlgoMonteCarlo.setBlockSize(blockSize)
##myAlgoMonteCarlo.setMaximumCoefficientOfVariation(coefficientOfVariation)
##
### Define the HistiryStrategy to store the numerical samples generated
### both for the input random vector and the output random vector
### Full strategy
##myAlgoMonteCarlo.setInputOutputStrategy(HistoryStrategy(Full()))
##
### Define the HistoryStrategy to store the values of the probability estimator
### and the variance estimator
### used to draw the convergence graph
### Full strategy
##myAlgoMonteCarlo.setConvergenceStrategy(HistoryStrategy(Full()))
##
### Perform the simulation
##myAlgoMonteCarlo.run()
##
### Display the number of iterations and number of evaluations
### of the limit state function
##print "NUmber_of_evaluations_of_the_limit_state_function_=_", myAlgoMonteCarlo.getResult().getOuterSampling()*myAlgoMonteCarlo.getResult().getBlockSize()
##
### Display the Monte Carlo probability of 'myEvent'
##print "Monte_Carlo_probability_estimation_=_", myAlgoMonteCarlo.getResult().getProbabilityEstimate()
##
### Display the variance of the Monte Carlo probability estimator
##print "Variance_of_the_Monte_Carlo_probability_estimator_=_", myAlgoMonteCarlo.getResult().getVarianceEstimate()
##
### Display the confidence interval length centered around
### the Monte Carlo probability MCProb
### IC = [MCProb - 0.5*length, MCProb + O.5*length]
### level 0.95
##
##print "0.95_Confidence_Interval_=_[", myAlgoMonteCarlo.getResult().getProbabilityEstimate() - 0.5*myAlgoMonteCarlo.getResult().getConfidenceLength(0.95), ",_",myAlgoMonteCarlo.getResult().getProbabilityEstimate()+0.5*myAlgoMonteCarlo.getResult().getConfidenceLength(0.95),"]"
##print ""
##
### Draw the convergence graph and the confidence interval of level alpha
##alpha = 0.90
##convergenceGraphMonteCarlo = myAlgoMonteCarlo.drawProbabilityConvergence(alpha)
### In order to see the graph without creating the associated files
##Show(convergenceGraphMonteCarlo)
##
### Create the file .EPS
##convergenceGraphMonteCarlo.draw("convergenceGraphMonteCarlo", 640, 480, GraphImplementation .EPS)
##Show(convergenceGraphMonteCarlo)


