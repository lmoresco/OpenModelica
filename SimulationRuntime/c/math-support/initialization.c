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

/*! \file initialization.c
 */

#include "initialization.h"
#include "simulation_data.h"
#include "error.h"
#include "openmodelica.h"
#include "openmodelica_func.h"
#include "model_help.h"

#include <math.h>
#include <string.h> /* strcmp */

enum INIT_INIT_METHOD
{
  IIM_UNKNOWN = 0,
  IIM_STATE
};

const char *initMethodStr[2] = {"unknown", "state"};

enum INIT_OPTI_METHOD
{
  IOM_UNKNOWN = 0,
  IOM_NELDER_MEAD_EX
};

const char *optiMethodStr[2] = {"unknown", "nelder_mead_ex"};

/*! \fn leastSquareWithLambda
*
*  This function calculates the residual value
*  as the sum of squared residual equations.
*
*  \param [in]  [nz] number of unfixed states and unfixed parameters
*  \param [in]  [z] vector of unfixed states and unfixed parameters
*  \param [in]  [zNominal] vector of nominal-values for z or NULL
*  \param [in]  [initialResidualScalingCoefficients] vector of scaling-coefficients for initial_residuals or NULL
*  \param [in]  [lambda] E [0; 1]
*  \param [in]  [data]
*  \param [out] [initialResiduals]
*/
static double leastSquareWithLambda(long nz, double* z, double* zNominal, double* initialResidualScalingCoefficients, double lambda, _X_DATA* data, double* initialResiduals)
{
  int indz = 0;
  fortran_integer i = 0;
  long j = 0;
  double funcValue = 0;

  for(i=0; i<data->modelData.nStates; ++i)
  {
    if(data->modelData.realVarsData[i].attribute.fixed==0)
    {
      data->localData[0]->realVars[i] = z[indz] * (zNominal ? zNominal[indz] : 1.0);
      indz++;
    }
  }

  /* for real parameters */
  for(i=0; i<data->modelData.nParametersReal; ++i)
  {
    if(data->modelData.realParameterData[i].attribute.fixed == 0)
    {
      data->simulationInfo.realParameter[i] = z[indz] * (zNominal ? zNominal[indz] : 1.0);
      indz++;
    }
  }

  bound_parameters(data);            /* evaluate parameters with respect to other parameters */
  functionODE(data);
  functionAlgebraics(data);
  initial_residual(data, lambda, initialResiduals);

  for(j=0; j<data->modelData.nResiduals; ++j)
  {
    funcValue += (initialResiduals[j] / (initialResidualScalingCoefficients ? initialResidualScalingCoefficients[j] : 1.0)) * (initialResiduals[j] / (initialResidualScalingCoefficients ? initialResidualScalingCoefficients[j] : 1.0));
  }

  /* min/max */
  /*for(i=0; i<data->modelData.nVariablesReal; ++i)
  {
    if(data->localData[0]->realVars[i] < data->modelData.realVarsData[i].attribute.min)
      funcValue += 10.0 + 1000.0 * (data->modelData.realVarsData[i].attribute.min - data->localData[0]->realVars[i]);
    if(data->localData[0]->realVars[i] > data->modelData.realVarsData[i].attribute.max)
      funcValue += 10.0 + 1000.0 * (data->localData[0]->realVars[i] - data->modelData.realVarsData[i].attribute.max);
  }
  for(i=0; i<data->modelData.nParametersReal; ++i)
  {
    if(data->simulationInfo.realParameter[i] < data->modelData.realParameterData[i].attribute.min)
      funcValue += 10.0 + 1000.0 * (data->modelData.realParameterData[i].attribute.min - data->simulationInfo.realParameter[i]);
    if(data->simulationInfo.realParameter[i] > data->modelData.realParameterData[i].attribute.max)
      funcValue += 10.0 + 1000.0 * (data->simulationInfo.realParameter[i] - data->modelData.realParameterData[i].attribute.max);
  }
  for(i=0; i<data->modelData.nVariablesInteger; ++i)
  {
    if(data->localData[0]->integerVars[i] < data->modelData.integerVarsData[i].attribute.min)
      funcValue += 10.0 + 1000.0 * (data->modelData.integerVarsData[i].attribute.min - data->localData[0]->integerVars[i]);
    if(data->localData[0]->integerVars[i] > data->modelData.integerVarsData[i].attribute.max)
      funcValue += 10.0 + 1000.0 * (data->localData[0]->integerVars[i] - data->modelData.integerVarsData[i].attribute.max);
  }*/

  return funcValue;
}

/*! \fn computeInitialResidualScalingCoefficients
 *
 *  This function calculates coefficients for every initial_residual.
 *  They describe the order of magnitude.
 *
 *  \param [in]  [data]
 *  \param [in]  [nz] number of unfixed states and unfixed parameters
 *  \param [in]  [z] vector of unfixed states and unfixed parameters
 *  \param [in]  [zNominal] vector of nominal-values for z or NULL
 *  \param [in]  [lambda] E [0; 1]
 *  \param [out] [initialResidualScalingCoefficients] vector of scaling-coefficients for initial_residuals
 *
 *  \author lochel
 */
static void computeInitialResidualScalingCoefficients(_X_DATA *data, double nz, double *z, double *zNominal, double lambda, double *initialResidualScalingCoefficients)
{
  int i, j;

  double *tmpInitialResidual1 = (double*)malloc(data->modelData.nResiduals * sizeof(double));
  double *tmpInitialResidual2 = (double*)malloc(data->modelData.nResiduals * sizeof(double));
  double *states = (double*)malloc(nz * sizeof(double));

  const double h = 1e-6;

  for(j=0; j<data->modelData.nResiduals; ++j)
    initialResidualScalingCoefficients[j] = 0.0;

  for(i=0; i<nz; ++i)
    states[i] = z[i] * (zNominal ? zNominal[i] : 1.0);

  /* calculate initial_residuals */
  leastSquareWithLambda(nz, states, NULL, NULL, lambda, data, tmpInitialResidual1);

  for(i=0; i<nz; ++i)
  {
    states[i] += h;
    leastSquareWithLambda(nz, states, NULL, NULL, lambda, data, tmpInitialResidual2);

    for(j=0; j<data->modelData.nResiduals; ++j)
    {
      double f = fabs(zNominal[i] * (tmpInitialResidual2[j] - tmpInitialResidual1[j]) / h /* / tmpInitialResidual2[j] */ );
      if(f > initialResidualScalingCoefficients[j])
        initialResidualScalingCoefficients[j] = f;
    }

    states[i] -= h;
  }

  for(j=0; j<data->modelData.nResiduals; ++j)
      if(initialResidualScalingCoefficients[j] < 1e-42)
        initialResidualScalingCoefficients[j] = 1.0;

  free(tmpInitialResidual1);
  free(tmpInitialResidual2);
  free(states);
}

/*! \fn NelderMeadOptimization
 *
 *  This function performs a Nelder-Mead-Optimization with some
 *  special changes for initialization.
 *
 *  \param [in]  [N] number of unfixed states and unfixed parameters
 *  \param [in]  [var] vector of unfixed states and unfixed parameters
 *  \param [in]  [scale] vector of nominal-values for var or NULL
 *  \param [in]  [initialResidualScalingCoefficients] vector of scaling-coefficients for initial_residuals or NULL
 *  \param [in]  [lambda_step]
 *  \param [in]  [acc]
 *  \param [in]  [maxIt]
 *  \param [in]  [dump]
 *  \param [in]  [pLambda]
 *  \param [in]  [pIteration]
 *  \param [in]  [leastSquare]
 *  \param [in]  [data]
 *  \param [in]  [initialResiduals]
 *
 *  \author lochel
 */
static void NelderMeadOptimization(long N,
  double* var,
  double* scale,
  double* initialResidualScalingCoefficients,
  double lambda_step,
  double acc,
  long maxIt,
  long dump,
  double* pLambda,
  long* pIteration,
  double (*leastSquare)(long, double*, double*, double*, double, _X_DATA*, double*),
  _X_DATA* data,
  double* initialResiduals)
{
  const double alpha    = 1.0;        /* 0 < alpha */
  const double beta     = 2;        	/* 1 < beta */
  const double gamma    = 0.5;        /* 0 < gamma < 1 */

  double* simplex = (double*)malloc((N+1)*N*sizeof(double));
  double* fvalues = (double*)malloc((N+1)*sizeof(double));

  double* xr = (double*)malloc(N * sizeof(double));
  double* xe = (double*)malloc(N * sizeof(double));
  double* xk = (double*)malloc(N * sizeof(double));
  double* xbar = (double*)malloc(N * sizeof(double));

  double fxr;
  double fxe;
  double fxk;

  long xb = 0;        /* best vertex */
  long xs = 0;        /* worst vertex */
  long xz = 0;        /* second-worst vertex */

  long x = 0;
  long i = 0;

  double lambda = 0.0;
  long iteration = 0;

  /* check Memory */
  ASSERT(simplex, "out of memory");
  ASSERT(fvalues, "out of memory");
  ASSERT(xr, "out of memory");
  ASSERT(xe, "out of memory");
  ASSERT(xk, "out of memory");
  ASSERT(xbar, "out of memory");

  /* initialize simplex */
  for(x=0; x<N+1; x++)
  {
    for(i=0; i<N; i++)
    {
      /* vertex x / var i */
      simplex[x*N + i] = var[i] + ((x==i) ? 1.0 : 0.0);    /* canonical simplex */
    }
  }

  computeInitialResidualScalingCoefficients(data, N, simplex, scale, 0.0, initialResidualScalingCoefficients);

  do
  {
    /* lambda-control */
    double sigma = 0.0;
    double average = 0.0;
    double g = 0.000001;

    iteration++;

    /* dump every dump-th step */
    if(dump && !(iteration % dump))
      INFO3("NelderMeadOptimization | lambda=%g / step=%d / f=%g", lambda, (int)iteration, leastSquare(N, simplex, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals));

    /* func-values for the simplex */
    for(x=0; x<N+1; x++)
      fvalues[x] = leastSquare(N, &simplex[x*N], scale, initialResidualScalingCoefficients, lambda, data, initialResiduals);

    /* calculate xb, xs, xz */
    xb = 0;
    for(x=1; x<N+1; x++)
    {
      if(fvalues[x] < fvalues[xb])
        xb = x;
    }

    xs = xb;
    xz = xb;
    for(x=0; x<N+1; x++)
    {
      if(fvalues[x] > fvalues[xs])
      {
        xz = xs;
        xs = x;
      }

      if(fvalues[x] > fvalues[xz] && (x != xs))
        xz = x;
    }

    for(x=0; x<N+1; x++)
      average += fvalues[x];
    average /= (N+1);

    for(x=0; x<N+1; x++)
      sigma += (fvalues[x] - average) * (fvalues[x] - average);
    sigma /= N;

    if(sigma < g*g && lambda < 1.0)
    {
      lambda += lambda_step;
      if(lambda > 1.0)
        lambda = 1.0;

      computeInitialResidualScalingCoefficients(data, N, &simplex[xb*N], scale, lambda, initialResidualScalingCoefficients);

      DEBUG_INFO3(LOG_INIT, "NelderMeadOptimization | increasing lambda to %g in step %d at f=%g", lambda, (int)iteration, leastSquare(N, simplex, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals));
      for(i=0; i<data->modelData.nResiduals; i++)
        DEBUG_INFO2(LOG_INIT, "initialResidualScalingCoefficients[%d] = %g", i, initialResidualScalingCoefficients[i]);

      continue;
    }

    /* calculate central point for the n best vertices */
    for(i=0; i<N; i++)
      xbar[i] = 0;

    for(x=0; x<N+1; x++)
    {
      if(x != xs)            /* leaving worst vertex */
      {
        for(i=0; i<N; i++)
          xbar[i] += simplex[x*N+i];
      }
    }

    for(i=0; i<N; i++)
      xbar[i] /= N;

    /* reflect worst vertex at xbar */
    for(i=0; i<N; i++)
      xr[i] = xbar[i] + alpha*(xbar[i] - simplex[xs*N + i]);
    fxr = leastSquare(N, xr, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals);

    if(fvalues[xb] <= fxr && fxr <= fvalues[xz])
    {
      /* replace xs by xr */
      for(i=0; i<N; i++)
        simplex[xs*N+i] = xr[i];
    }
    else if(fxr < fvalues[xb])
    {
      for(i=0; i<N; i++)
        xe[i] = xbar[i] + beta*(xr[i] - xbar[i]);
      fxe = leastSquare(N, xe, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals);

      if(fxe < fxr)    /* if(fxe < fvalues[xb]) */
      {
        /* replace xs by xe */
        for(i=0; i<N; i++)
          simplex[xs*N+i] = xe[i];
      }
      else
      {
        /* replace xs by xr */
        for(i=0; i<N; i++)
          simplex[xs*N+i] = xr[i];
      }
    }
    else if(fxr > fvalues[xz])
    {
      if(fxr >= fvalues[xs])
      {
        for(i=0; i<N; i++)
          xk[i] = xbar[i] + gamma*(simplex[xs*N+i] - xbar[i]);
        fxk = leastSquare(N, xk, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals);
      }
      else
      {
        for(i=0; i<N; i++)
          xk[i] = xbar[i] + gamma*(xr[i] - xbar[i]);
        fxk = leastSquare(N, xk, scale, initialResidualScalingCoefficients, lambda, data, initialResiduals);
      }

      if(fxk < fvalues[xs])
      {
        /* replace xs by xk */
        for(i=0; i<N; i++)
          simplex[xs*N+i] = xk[i];
      }
      else
      {
        /* constrict simplex around xb */
        for(x=0; x<N+1; x++)
        {
          for(i=0; i<N; i++)
          {
            simplex[x*N+i] = (simplex[x*N+i] + simplex[xb*N+i]) / 2.0;
          }
        }
      }
    }
    else
    {
      /* not possible to be here */
      INFO("not possible to be here");
    }
  }while((lambda < 1.0 || fvalues[xb] > acc) && iteration < maxIt);

  /* copying solution */
  for(i=0; i<N; i++)
    var[i] = simplex[xs*N+i];

  if(pLambda)
    *pLambda = lambda;

  if(pIteration)
    *pIteration = iteration;

  free(xe);
  free(xr);
  free(xk);
  free(xbar);
  free(fvalues);
  free(simplex);
}

/*! \fn reportResidualValue
*
*  Returns 1 if residual is non-zero and prints appropriate error message.
*
*  \param [in]  [funcValue] leastSquare-Value
*  \param [in]  [data]
*  \param [in]  [initialResiduals]
*/
static int reportResidualValue(double funcValue, _X_DATA* data, double* initialResiduals)
{
  long i = 0;
  if(funcValue > 1e-5)
  {
    WARNING("reportResidualValue | error in initialization. System of initial equations are not consistent");
    WARNING1("reportResidualValue | (Least Square function value is %g)", funcValue);

    for(i=0; i<data->modelData.nResiduals; i++)
    {
      if(fabs(initialResiduals[i]) > 1e-6)
      {
        INFO2("reportResidualValue | residual[%d] = %g", (int) i, initialResiduals[i]);
      }
    }
    return 1;
  }
  return 0;
}

/*! \fn nelderMeadEx_initialization
*
*  This function performs initialization by using an extend version of the
*  nelderMead algorithm.
*  This does not require a jacobian for the residuals.
*
*  \param [in]  [data]
*  \param [in]  [nz] number of unfixed states and unfixed parameters
*  \param [in]  [z] vector of unfixed states and unfixed parameters
*  \param [in]  [zNominal] vector of nominal-values for z
*  \param [in]  [initialResiduals]
*
*  \author lochel
*/
static int nelderMeadEx_initialization(_X_DATA *data, long nz, double *z, double *zNominal, double* initialResiduals)
{
  double STOPCR = 1.e-16;
  double lambda_step = 0.1;
  long NLOOP = 10000 * nz;

  double funcValue;

  double lambda = 0;
  long iteration = 0;

  long l=0, i=0;

  double* initialResidualScalingCoefficients = (double*)malloc(data->modelData.nResiduals * sizeof(double));

  /* down-scale */
  for(i=0; i<nz; i++)
    z[i] /= zNominal[i];

  funcValue = leastSquareWithLambda(nz, z, zNominal, NULL, 1.0, data, initialResiduals);

  for(l=0; l<100 && funcValue > STOPCR; l++)
  {
    DEBUG_INFO1(LOG_INIT, "nelderMeadEx_initialization | initialization-nr. %d", (int)l);

    NelderMeadOptimization(nz, z, zNominal, initialResidualScalingCoefficients, lambda_step, STOPCR, NLOOP, DEBUG_FLAG(LOG_INIT) ? 100000 : 0, &lambda, &iteration, leastSquareWithLambda, data, initialResiduals);

    if(DEBUG_FLAG(LOG_INIT))
    {
      INFO3("nelderMeadEx_initialization | iteration=%d / lambda=%g / f=%g", (int) iteration, lambda, leastSquareWithLambda(nz, z, zNominal, initialResidualScalingCoefficients, lambda, data, initialResiduals));
      for(i=0; i<nz; i++)
      {
        INFO_AL2("nelderMeadEx_initialization | states | %d: %g", (int) i, z[i]);
      }
    }

    storePreValues(data);                       /* save pre-values */
    overwriteOldSimulationData(data);           /* if there are non-linear equations */

    update_DAEsystem(data);                     /* evaluate discrete variables */

    /* valid system for the first time! */

    SaveZeroCrossings(data);
    storePreValues(data);
    overwriteOldSimulationData(data);

    funcValue = leastSquareWithLambda(nz, z, zNominal, initialResidualScalingCoefficients, 1.0, data, initialResiduals);
  }
  free(initialResidualScalingCoefficients);

  /* up-scale */
  for(i=0; i<nz; i++)
    z[i] *= zNominal[i];

  DEBUG_INFO1(LOG_INIT, "nelderMeadEx_initialization | leastSquare=%g", funcValue);

  if(lambda < 1.0 && funcValue > STOPCR)
  {
    DEBUG_INFO1(LOG_INIT, "nelderMeadEx_initialization | lambda = %g", lambda);
    return -1;
  }

  return reportResidualValue(funcValue, data, initialResiduals);
}

/*! \fn initialize
 *
 *  \param [in]  [data]
 *  \param [in]  [optiMethod]
 *
 *  \author lochel
 */
static int initialize(_X_DATA *data, int optiMethod)
{
  long i = 0;
  long iz = 0;
  long nz = 0;
  int retVal = 0;
  double *z = NULL;
  double *zNominal = NULL;
  double *initialResiduals = NULL;

  DEBUG_INFO1(LOG_INIT, "initialization by method: %s", optiMethodStr[optiMethod]);

  /* count unfixed states */
  DEBUG_INFO(LOG_INIT, "fixed attribute for states:");
  for(i=0; i<data->modelData.nStates; ++i)
  {
    DEBUG_INFO2(LOG_INIT, "state %s(fixed=%s)", data->modelData.realVarsData[i].info.name, (data->modelData.realVarsData[i].attribute.fixed ? "true" : "false"));
    if(data->modelData.realVarsData[i].attribute.fixed == 0)
      ++nz;
  }

  /* plus unfixed real-parameters */
  DEBUG_INFO(LOG_INIT, "fixed attribute for parameters:");
  for(i=0; i<data->modelData.nParametersReal; ++i)
  {
    DEBUG_INFO2(LOG_INIT, "parameter %s(fixed=%s)", data->modelData.realParameterData[i].info.name, (data->modelData.realParameterData[i].attribute.fixed ? "true" : "false"));
    if(data->modelData.realParameterData[i].attribute.fixed == 0)
      ++nz;
  }

  DEBUG_INFO1(LOG_INIT, "number of non-fixed variables: %d", (int)nz);

  /* No initial values to calculate. */
  if(nz == 0)
  {
    DEBUG_INFO(LOG_INIT, "no initial values to calculate");
    return 0;
  }

  z = (double*)calloc(nz, sizeof(double));
  zNominal = (double*)calloc(nz, sizeof(double));
  initialResiduals = (double*) calloc(data->modelData.nResiduals, sizeof(double));
  ASSERT(z, "out of memory");
  ASSERT(zNominal, "out of memory");
  ASSERT(initialResiduals, "out of memory");

  /* fill z with the non-fixed variables from x and p */
  for(i=0, iz=0; i<data->modelData.nStates; ++i)
  {
    if(data->modelData.realVarsData[i].attribute.fixed == 0)
    {
      zNominal[iz] = fabs(data->modelData.realVarsData[i].attribute.nominal);

      if(zNominal[iz] == 0.0)
      {
        WARNING1("nominal for real parameter is zero > nominal(%s) := 1.0", data->modelData.realParameterData[i].info.name);
        zNominal[iz] = 1.0;
      }

      z[iz++] = data->modelData.realVarsData[i].attribute.start;
    }
  }

  /* for real parameters */
  for(i=0; i<data->modelData.nParametersReal; ++i)
  {
    if(data->modelData.realParameterData[i].attribute.fixed == 0)
    {
      zNominal[iz] = fabs(data->modelData.realParameterData[i].attribute.nominal);

      if(zNominal[iz] == 0.0)
      {
        WARNING1("nominal for real parameter is zero > nominal(%s) := 1.0", data->modelData.realParameterData[i].info.name);
        zNominal[iz] = 1.0;
      }

      z[iz++] = data->modelData.realParameterData[i].attribute.start;
    }
  }

  if(optiMethod == IOM_NELDER_MEAD_EX)
    retVal = nelderMeadEx_initialization(data, nz, z, zNominal, initialResiduals);
  else
  {
    WARNING1("unrecognized option -iom %s", optiMethodStr[optiMethod]);
    WARNING_AL("current options are: nelder_mead_ex");   /* WARNING_AL("current options are: nelder_mead_ex, simplex or newuoa"); */
    retVal= -1;
  }

  free(z);
  free(zNominal);
  free(initialResiduals);
  return retVal;
}

/*! \fn state_initialization
 *
 *  \param [in]  [data]
 *  \param [in]  [optiMethod]
 *
 *  \author lochel
 */
static int state_initialization(_X_DATA *data, int optiMethod)
{
  int retVal = 0, i;

  /* call initialize function and save start values */
  storeStartValues(data);
  storeStartValuesParam(data);
  initial_function(data);           /* set all start-Values */
  /* initialize all relations that are ZeroCrossings */
  bound_parameters(data);

  storePreValues(data);
  overwriteOldSimulationData(data);

  update_DAEsystem(data);

  /* and restore start values and helpvars */
  restoreExtrapolationDataOld(data);
  resetAllHelpVars(data);
  storePreValues(data);

  /* debug print */
  if (DEBUG_FLAG(LOG_DEBUG)){
    for (i=0; i<3;i++){
      INFO1("Print values for buffer segment = %d",i);
      printAllVars(data,i);
    }
  }
  /* start with the real initialization */
  data->simulationInfo.initial = 1;             /* to evaluate when-equations with initial()-conditions */

  retVal = initialize(data, optiMethod);

  /* debug print */
  if (DEBUG_FLAG(LOG_DEBUG)){
    for (i=0; i<3;i++){
      INFO1("Print values for buffer segment = %d",i);
      printAllVars(data,i);
    }
  }

  storeInitialValuesParam(data);
  storePreValues(data);             /* save pre-values */
  overwriteOldSimulationData(data); /* if there are non-linear equations */

  update_DAEsystem(data);           /* evaluate discrete variables */

  /* valid system for the first time! */
  SaveZeroCrossings(data);
  storePreValues(data);             /* save pre-values */
  overwriteOldSimulationData(data); /* if there are non-linear equations */

  data->simulationInfo.initial = 0;

  return retVal;
}

/*! \fn initialization
 *
 *  \param [ref] [data]
 *  \param [in]  [pInitMethod] user defined initialization method
 *  \param [in]  [pOptiMethod] user defined optimization method
 *
 *  \author lochel
 */
int initialization(_X_DATA *data, const char* pInitMethod, const char* pOptiMethod)
{
  int initMethod = IIM_STATE;               /* default method */
  int optiMethod = IOM_NELDER_MEAD_EX;      /* default method */

  /* if there are user-specified options, use them! */
  if(pInitMethod)
  {
    if(!strcmp(pInitMethod, "state"))
      initMethod = IIM_STATE;
    else
      initMethod = IIM_UNKNOWN;
  }

  if(pOptiMethod)
  {
    if(!strcmp(pOptiMethod, "nelder_mead_ex"))
      optiMethod = IOM_NELDER_MEAD_EX;
    else
      optiMethod = IOM_UNKNOWN;
  }

  DEBUG_INFO1(LOG_INIT,    "initialization | initialization method: %s", initMethodStr[initMethod]);
  DEBUG_INFO_AL1(LOG_INIT, "                 optimization method:   %s", optiMethodStr[optiMethod]);

  /* select the right initialization-method */
  if(initMethod == IIM_STATE)
    return state_initialization(data, optiMethod);

  /* unrecognized initialization-method */
  WARNING1("unrecognized option -iim %s", initMethodStr[initMethod]);
  WARNING_AL("current options are: state");
  return -1;
}
