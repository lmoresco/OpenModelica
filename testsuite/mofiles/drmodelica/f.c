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
#define f_rettype_1 r1
#define f_rettype_2 r2
#define f_rettype_3 r3
typedef struct f_rettype_s
{
    modelica_real r1; /* [] */
    modelica_real r2; /* [] */
    modelica_real r3; /* [] */
} f_rettype;

f_rettype _f(modelica_real x, modelica_real y);

int _f_read_call_write(char const* in_filename, char const* out_filename);


/* body part */
f_rettype _f(modelica_real x, modelica_real y)
{
  f_rettype tmp1;
  state tmp2;
  modelica_real r1;
  modelica_real r2;
  modelica_real r3;

  tmp2 = get_memory_state();

  r1 = x;
  r2 = y;
  r3 = (x * y);

  tmp1.r1 = r1;
  tmp1.r2 = r2;
  tmp1.r3 = r3;
  restore_memory_state(tmp2);
  return tmp1;

}
int _f_read_call_write(char const* in_filename, char const* out_filename)
{
  modelica_real x;
  modelica_real y;

  PRE_VARIABLES
  f_rettype out;
  PRE_OPEN_INFILE
  if(read_modelica_real(in_file, &x)) return 1;
  if(read_modelica_real(in_file, &y)) return 1;

  PRE_READ_DONE
  out = _f(x, y);
  PRE_OPEN_OUTFILE
  write_modelica_real(out_file, &out.r1);
  write_modelica_real(out_file, &out.r2);
  write_modelica_real(out_file, &out.r3);
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
_f_read_call_write(argv[1],argv[2]);
  return 0;
}
