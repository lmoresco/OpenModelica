#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: add ---*/

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
#define add_rettype_1 targ1
typedef struct add_rettype_s
{
    modelica_real targ1; /* [] */
} add_rettype;

extern double add(double x, double y);


int in_add(type_description * inArgs, type_description * outVar);

add_rettype _add(modelica_real x, modelica_real y);
/* End of header part */

/* Body */
extern double add(double x, double y);

int in_add(type_description * inArgs, type_description * outVar)
{
  modelica_real x;
  modelica_real y;
  state tmp1;
  add_rettype out;
  double x_ext;
  double y_ext;
  double res_ext;
  if(read_modelica_real(&inArgs, &x)) return 1;
  if(read_modelica_real(&inArgs, &y)) return 1;
  tmp1 = get_memory_state();
  x_ext = (double)x;
  y_ext = (double)y;
  res_ext = add(x_ext, y_ext);
  out.targ1 = (modelica_real)res_ext;
  write_modelica_real(outVar, &out.targ1);
  restore_memory_state(tmp1);
  return 0;
}

add_rettype _add(modelica_real x, modelica_real y)
{
  add_rettype out;
  double x_ext;
  double y_ext;
  double res_ext;
  x_ext = (double)x;
  y_ext = (double)y;
  res_ext = add(x_ext, y_ext);
  out.targ1 = (modelica_real)res_ext;
  return out;
}

/* End Body */

#ifdef __cplusplus
}
#endif
