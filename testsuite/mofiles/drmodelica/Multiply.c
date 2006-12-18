#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: Multiply ---*/

#ifdef __cplusplus
extern "C" {
#endif
/* header part */
#include "modelica.h"
#define Multiply_rettype_1 result
typedef struct Multiply_rettype_s
{
    modelica_real result; /* [] */
} Multiply_rettype;

Multiply_rettype _Multiply(modelica_real x, modelica_real y);

int _Multiply_read_call_write(char const* in_filename, char const* out_filename);


/* body part */
Multiply_rettype _Multiply(modelica_real x, modelica_real y)
{
  Multiply_rettype tmp1;
  state tmp2;
  modelica_real result;

  tmp2 = get_memory_state();

  result = (x * y);

  tmp1.result = result;
  restore_memory_state(tmp2);
  return tmp1;

}
int _Multiply_read_call_write(char const* in_filename, char const* out_filename)
{
  modelica_real x;
  modelica_real y;

  PRE_VARIABLES
  Multiply_rettype out;
  PRE_OPEN_INFILE
  if(read_modelica_real(in_file, &x)) return 1;
  if(read_modelica_real(in_file, &y)) return 1;

  PRE_READ_DONE
  out = _Multiply(x, y);
  PRE_OPEN_OUTFILE
  write_modelica_real(out_file, &out.result);
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
_Multiply_read_call_write(argv[1],argv[2]);
  return 0;
}
