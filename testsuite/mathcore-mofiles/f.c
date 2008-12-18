#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: f ---*/

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
#define f_rettype_1 targ1
typedef struct f_rettype_s
{
    real_array targ1; /* [:] */
} f_rettype;

extern void ExternalFunction2_f(const double * x, size_t x_1, double* y, size_t y_1);


int in_f(type_description * inArgs, type_description * outVar);

f_rettype _f(real_array x);
/* End of header part */

/* Body */
extern void ExternalFunction2_f(const double * x, size_t x_1, double* y, size_t y_1);

int in_f(type_description * inArgs, type_description * outVar)
{
  real_array x; /* [:] */
  state tmp2;
  size_t tmp1;
  f_rettype out;
  if(read_real_array(&inArgs, &x)) return 1;
  tmp2 = get_memory_state();
  tmp1 = size_of_dimension_real_array(x,1);
  alloc_real_array(&out.targ1, 1, tmp1);
  ExternalFunction2_f(data_of_real_array(&(x)), size_of_dimension_real_array(x, 1), data_of_real_array(&(out.targ1)), size_of_dimension_real_array(out.targ1, 1));
  write_real_array(outVar, &out.targ1);
  restore_memory_state(tmp2);
  return 0;
}

f_rettype _f(real_array x)
{
  size_t tmp1;
  f_rettype out;
  tmp1 = size_of_dimension_real_array(x,1);
  alloc_real_array(&out.targ1, 1, tmp1);
  ExternalFunction2_f(data_of_real_array(&(x)), size_of_dimension_real_array(x, 1), data_of_real_array(&(out.targ1)), size_of_dimension_real_array(out.targ1, 1));
  return out;
}

/* End Body */

#ifdef __cplusplus
}
#endif
