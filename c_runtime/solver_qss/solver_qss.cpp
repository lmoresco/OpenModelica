/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-2010, Link�pings University,
 * Department of Computer and Information Science,
 * SE-58183 Link�ping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF THIS OSMC PUBLIC
 * LICENSE (OSMC-PL). ANY USE, REPRODUCTION OR DISTRIBUTION OF
 * THIS PROGRAM CONSTITUTES RECIPIENT'S ACCEPTANCE OF THE OSMC
 * PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Link�pings University, either from the above address,
 * from the URL: http://www.ida.liu.se/projects/OpenModelica
 * and in the OpenModelica distribution.
 *
 * This program is distributed  WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */

#include <string.h>
#include "solver_qss/qss_signal.h"
#include "solver_qss/simulator.h" 
#include "solver_qss/sampler.h"
#include "solver_qss/integrator.h"
#include "solver_qss/static_function.h"
//#include "solver_qss/cross_detector.h"

#include "options.h"
#include <string>
#include <iostream>
#include <math.h>

double dlamch_(char*,int);
using namespace std;

double *tn;
QssSignal *derX;  // Derivates of states
QssSignal *X;     // States
QssSignal *q;     // Quantized versions of states
Simulator **childs;

string *result_file_cstr;

/* The main function for the QSS solver */
int qss_main( int argc, char** argv,double &start,  double &stop, double &step, long &outputSteps, double &tolerance,int flag)
{
  cout << "Running QSS methods" << endl;

  globalData->oldTime = start;

  q = new QssSignal[globalData->nStates];
  X = new QssSignal[globalData->nStates];
  derX = new QssSignal[globalData->nStates];

  const unsigned int size=globalData->nStates + staticBlocks + 1 /*Sampler */;

  childs = new Simulator *[size];
  tn = new double [size];
  const double dQmin=tolerance/100,dQrel=tolerance;
  // Create one integrator for each state
  for (int i=0;i<globalData->nStates;i++)
  {
    childs[i] = new IntegratorQSS(dQmin,dQrel);
    childs[i]->init(globalData->timeValue,i);
    tn[i] = globalData->timeValue+childs[i]->ta();
  }
  // Init static functions - One per state but could differ
  for (int i=0;i<staticBlocks;i++)
  {
    childs[i+globalData->nStates] = new StaticFunction(3,dQmin,dQrel);
    childs[i+globalData->nStates]->init(globalData->timeValue,i);
    tn[i+globalData->nStates] = globalData->timeValue+childs[i+globalData->nStates]->ta();
  }
 
  // Periodic sampler for outputs
  childs[size-1] = new Sampler(outputSteps,start,stop);
  childs[size-1]->init(globalData->timeValue,0);
  tn[size-1] = globalData->timeValue+childs[size-1]->ta();

  double next_tn;
  int index=0;
  unsigned long int steps=0;
  while(globalData->timeValue <= stop)
  {
    // Find minimum
    next_tn=INF;
    for (unsigned int i=0;i<size;++i)
    {
      //cout << "Child " << i << " has tn " << tn[i]<< endl;
      if (tn[i]<next_tn) {
        index=i;
        next_tn=tn[i];
      }
    }
    if (next_tn<globalData->timeValue) 
    {
      cout << "Error" << endl;
      break;
    }
    // If next step is after stop
    if (next_tn>stop) {
      cout << "Simulation finished after " << steps << " integration steps\n";
      break;
    }

    // Advance time
    globalData->timeValue=next_tn;

    // Take step and update tn of transition child
    childs[index]->makeStep(globalData->timeValue);
    tn[index]=globalData->timeValue+childs[index]->ta();
    //cout << "Step from " << index << " at " << globalData->timeValue << endl<<endl;

    // Count integration steps
    if (index<globalData->nStates)
      steps++;

    // Update corresponding childs
    for (int i=0;i<size;i++)
    {
      if (incidenceMatrix[index*size+i])
      {
        childs[i]->update(globalData->timeValue);
        tn[i]=globalData->timeValue+childs[i]->ta();
      }
    }
  }
  return 0;
}


void init_ompd()
{
  int argc=0;
  char **argv=NULL;
  initRuntimeAndSimulation(argc, argv);
  double start = 0.0;
  double stop = 5.0;
  double stepSize = 0.05;
  long outputSteps = 500;
  double tolerance = 1e-4;
  string method, outputFormat, variableFilter;
  read_input(argc, argv, globalData, &start, &stop, &stepSize, &outputSteps, &tolerance, &method, &outputFormat, &variableFilter);
  initializeOutputFilter(globalData,variableFilter);
  callExternalObjectConstructors(globalData);
  globalData->lastEmittedTime = start;
  globalData->forceEmit = 0;

  // Create a result file
  string *result_file = (string*) getFlagValue("r", argc, argv);
  result_file_cstr = new string();
  if (!result_file) {
      *result_file_cstr = string(globalData->modelFilePrefix) + string("_res.") + outputFormat; /* TODO: Fix result file name based on mode */
  } else {
      *result_file_cstr = *result_file;
  }

  const string *init_method = getFlagValue("im", argc, argv);
  if (initializeEventData())
    {
      cout << "Internal error, allocating event data structures" << endl;
      return ;
    }

  if (bound_parameters())
    {
      printf("Error calculating bound parameters\n");
      return ;
    }
   globalData->init = 1;
  initial_function();
  saveall();
  storeExtrapolationData();
  // Calculate initial values from (fixed) start attributes

  int needToIterate = 0;
  int IterationNum = 0;
  functionDAE(&needToIterate);
  functionAliasEquations();

  long maxSteps = 2 * outputSteps + 2 * globalData->nSampleTimes;
  if (isInteractiveSimulation() || sim_noemit || 0 == strcmp("empty", outputFormat.c_str())) {
      sim_result = new simulation_result_empty(result_file_cstr->c_str(),maxSteps);
  } else if (0 == strcmp("csv", outputFormat.c_str())) {
      sim_result = new simulation_result_csv(result_file_cstr->c_str(), maxSteps);
  } else if (0 == strcmp("mat", outputFormat.c_str())) {
      sim_result = new simulation_result_mat(result_file_cstr->c_str(), start, stop);
  } else if (0 == strcmp("plt", outputFormat.c_str())) {
      sim_result = new simulation_result_plt(result_file_cstr->c_str(), maxSteps);
  } else {
      cerr << "Unknown output format: " << outputFormat << endl;
      return;
  }
 
  //work-around problem with discrete algorithm vars
  //
  //functionDAE(needToIterate);
  //functionAliasEquations();
  if (sim_verbose >= LOG_SOLVER)
    {
      sim_result->emit();
    }
   do
    {
      if (IterationNum > IterationMax)
        {
          throw TerminateSimulationException(globalData->timeValue, string(
              "ERROR: Too many Iteration while the initialization. System is not consistent!\n"));
        }
      if (initialize(init_method))
        {
          throw TerminateSimulationException(globalData->timeValue, string(
              "Error in initialization. Storing results and exiting.\n"));
        }
      saveall();
      functionDAE(&needToIterate);
      functionAliasEquations();
      IterationNum++;
    }  while (checkForDiscreteChanges() || needToIterate);
  SaveZeroCrossings();
  saveall();
  if (sim_verbose >= LOG_SOLVER)
    {
      sim_result->emit();
    }

  // Calculate stable discrete state
  // and initial ZeroCrossings
  if (globalData->curSampleTimeIx < globalData->nSampleTimes)
    {
      activateSampleEvents();
    }
  //Activate sample and evaluate again
  needToIterate = 0;
  IterationNum = 0;
  functionDAE(&needToIterate);
  if (sim_verbose >= LOG_SOLVER)
    {
      sim_result->emit();
    }
  while (checkForDiscreteChanges() || needToIterate)
    {
      saveall();
      functionDAE(&needToIterate);
      IterationNum++;
      if (IterationNum > IterationMax)
        {
          throw TerminateSimulationException(globalData->timeValue, string(
              "ERROR: Too many Iteration. System is not consistent!\n"));
        }
    }
  functionAliasEquations();
  SaveZeroCrossings();

  saveall();
  sim_result->emit();
 
}

void clean_ompd()
{
  delete result_file_cstr;
  deinitializeEventData();
  delete sim_result;
  deInitializeDataStruc(globalData);
  free(globalData);
}

int
main_qss(int argc, char**argv)
{
  int retVal = -1;
  
  if (initRuntimeAndSimulation(argc, argv)) //initRuntimeAndSimulation returns 1 if an error occurs
    return 1;

  if (interactiveSimuation) {
    //cout << "startInteractiveSimulation: " << version << endl;
    retVal = startInteractiveSimulation(argc, argv);
  } else {
    //cout << "startNonInteractiveSimulation: " << version << endl;
    retVal = startNonInteractiveSimulation(argc, argv);
  }

  deInitializeDataStruc(globalData);
  free(globalData);
  fflush(NULL);
  EXIT(retVal);
}
