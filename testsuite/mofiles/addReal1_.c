#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: addReal1_ ---*/

#ifdef __cplusplus
extern "C" {
#endif
/* header part */
#ifdef __cplusplus
extern "C" {
#endif

#ifdef __cplusplus
}
#endif
#define addReal1__rettype_1 targ1
typedef struct addReal1__rettype_s
{
    modelica_real targ1; /* [] */
} addReal1__rettype;

extern double addReal1_(double x, double y);


int in_addReal1_(type_description * inArgs, type_description * outVar);

addReal1__rettype _addReal1_(modelica_real x, modelica_real y);
/* End of header part */

/* Body */
extern double addReal1_(double x, double y);

int in_addReal1_(type_description * inArgs, type_description * outVar)
{
  modelica_real x;
  modelica_real y;
  state tmp1;
  addReal1__rettype out;
  double x_ext;
  double y_ext;
  double res_ext;
  if(read_modelica_real(&inArgs, &x)) return 1;
  if(read_modelica_real(&inArgs, &y)) return 1;
  tmp1 = get_memory_state();
  x_ext = (double)x;
  y_ext = (double)y;
  res_ext = addReal1_(x_ext, y_ext);
  out.targ1 = (modelica_real)res_ext;
  write_modelica_real(outVar, &out.targ1);
  restore_memory_state(tmp1);
  return 0;
}

addReal1__rettype _addReal1_(modelica_real x, modelica_real y)
{
  addReal1__rettype out;
  double x_ext;
  double y_ext;
  double res_ext;
  x_ext = (double)x;
  y_ext = (double)y;
  res_ext = addReal1_(x_ext, y_ext);
  out.targ1 = (modelica_real)res_ext;
  return out;
}

/* End Body */

#ifdef __cplusplus
}
#endif
