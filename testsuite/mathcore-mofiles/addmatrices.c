#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: addmatrices ---*/

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
#define addmatrices_rettype_1 targ1
typedef struct addmatrices_rettype_s
{
    real_array targ1; /* [:, :] */
} addmatrices_rettype;

extern void addmatrices(const double * a, size_t a_1, size_t a_2, const double * b, size_t b_1, size_t b_2, double* c, size_t c_1, size_t c_2);


int in_addmatrices(type_description * inArgs, type_description * outVar);

addmatrices_rettype _addmatrices(real_array a, real_array b);
/* End of header part */

/* Body */
extern void addmatrices(const double * a, size_t a_1, size_t a_2, const double * b, size_t b_1, size_t b_2, double* c, size_t c_1, size_t c_2);

int in_addmatrices(type_description * inArgs, type_description * outVar)
{
  real_array a; /* [:, :] */
  real_array b; /* [:, :] */
  state tmp3;
  size_t tmp1;
  size_t tmp2;
  addmatrices_rettype out;
  if(read_real_array(&inArgs, &a)) return 1;
  if(read_real_array(&inArgs, &b)) return 1;
  tmp3 = get_memory_state();
  tmp1 = size_of_dimension_real_array(a,1);
  tmp2 = size_of_dimension_real_array(a,2);
  alloc_real_array(&out.targ1, 2, tmp1, tmp2);
  addmatrices(data_of_real_array(&(a)), size_of_dimension_real_array(a, 1), size_of_dimension_real_array(a, 2), data_of_real_array(&(b)), size_of_dimension_real_array(b, 1), size_of_dimension_real_array(b, 2), data_of_real_array(&(out.targ1)), size_of_dimension_real_array(out.targ1, 1), size_of_dimension_real_array(out.targ1, 2));
  write_real_array(outVar, &out.targ1);
  restore_memory_state(tmp3);
  return 0;
}

addmatrices_rettype _addmatrices(real_array a, real_array b)
{
  size_t tmp1;
  size_t tmp2;
  addmatrices_rettype out;
  tmp1 = size_of_dimension_real_array(a,1);
  tmp2 = size_of_dimension_real_array(a,2);
  alloc_real_array(&out.targ1, 2, tmp1, tmp2);
  addmatrices(data_of_real_array(&(a)), size_of_dimension_real_array(a, 1), size_of_dimension_real_array(a, 2), data_of_real_array(&(b)), size_of_dimension_real_array(b, 1), size_of_dimension_real_array(b, 2), data_of_real_array(&(out.targ1)), size_of_dimension_real_array(out.targ1, 1), size_of_dimension_real_array(out.targ1, 2));
  return out;
}

/* End Body */

#ifdef __cplusplus
}
#endif
