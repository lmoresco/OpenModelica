#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: f ---*/

#ifdef __cplusplus
extern "C" {
#endif
/* header part */
#include "modelica.h"
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


int _f_read_call_write(char const* in_filename, char const* out_filename);

f_rettype _f(real_array x);


/* body part */
extern void ExternalFunction2_f(const double * x, size_t x_1, double* y, size_t y_1);

int _f_read_call_write(char const* in_filename, char const* out_filename)
{
  real_array x; /* [:] */
  state tmp2;
  size_t tmp1;
  f_rettype out;

  PRE_VARIABLES
  PRE_OPEN_INFILE
  if(read_real_array(in_file, &x)) return 1;
  PRE_READ_DONE
  tmp2 = get_memory_state();
  tmp1 = size_of_dimension_real_array(x,1);
  alloc_real_array(&out.targ1, 1, tmp1);

  ExternalFunction2_f(x.data, size_of_dimension_real_array(x, 1), out.targ1.data, size_of_dimension_real_array(out.targ1, 1));
  PRE_OPEN_OUTFILE
  write_real_array(out_file, &out.targ1);
  PRE_WRITE_DONE

  restore_memory_state(tmp2);
  return 0;

}
f_rettype _f(real_array x)
{
  f_rettype out;
  size_t tmp1;

  tmp1 = size_of_dimension_real_array(x,1);
  alloc_real_array(&out.targ1, 1, tmp1);

  ExternalFunction2_f(x.data, size_of_dimension_real_array(x, 1), out.targ1.data, size_of_dimension_real_array(out.targ1, 1));

  return out;

}


#ifdef __cplusplus
}
#endif

int main(int argc, char** argv)
{

  if (argc != 3)
{
      fprintf(stderr,"# Incorrect number of arguments\n");
return 1;
    }
_f_read_call_write(argv[1],argv[2]);
  return 0;
}
