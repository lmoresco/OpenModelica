#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: PolynomialEvaluator ---*/

#ifdef __cplusplus
extern "C" {
#endif
/* header part */
#include "modelica.h"
#define PolynomialEvaluator_rettype_1 sum
typedef struct PolynomialEvaluator_rettype_s
{
    modelica_real sum; /* [] */
} PolynomialEvaluator_rettype;

PolynomialEvaluator_rettype _PolynomialEvaluator(real_array A, modelica_real x);

int _PolynomialEvaluator_read_call_write(char const* in_filename, char const* out_filename);


/* body part */
PolynomialEvaluator_rettype _PolynomialEvaluator(real_array A, modelica_real x)
{
  PolynomialEvaluator_rettype tmp1;
  state tmp2;
  modelica_real sum;
  modelica_real xpower;
  size_t tmp8;
  state tmp3;
  modelica_integer tmp5;
  modelica_integer tmp6;
  modelica_integer tmp7;

  tmp2 = get_memory_state();

  sum = ((modelica_real)0);
  xpower = ((modelica_real)1);
  tmp8 = size_of_dimension_real_array(A,1);
  tmp5 = 1; tmp6 = (1); tmp7 = tmp8;
  {
  modelica_integer i;

    for (i = tmp5; in_range_integer(i, tmp5, tmp7); i += tmp6) {
      tmp3 = get_memory_state();
      sum = (sum + ((*real_array_element_addr1(&A, 1, i)) * xpower));
      xpower = (xpower * x);
      restore_memory_state(tmp3);
    }
  } /* end for*/


  tmp1.sum = sum;
  restore_memory_state(tmp2);
  return tmp1;

}
int _PolynomialEvaluator_read_call_write(char const* in_filename, char const* out_filename)
{
  real_array A; /* [:] */
  modelica_real x;

  PRE_VARIABLES
  PolynomialEvaluator_rettype out;
  PRE_OPEN_INFILE
  if(read_real_array(in_file, &A)) return 1;
  if(read_modelica_real(in_file, &x)) return 1;

  PRE_READ_DONE
  out = _PolynomialEvaluator(A, x);
  PRE_OPEN_OUTFILE
  write_modelica_real(out_file, &out.sum);
  PRE_WRITE_DONE
  return 0;


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
_PolynomialEvaluator_read_call_write(argv[1],argv[2]);
  return 0;
}
