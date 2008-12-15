#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: add ---*/

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
#define add_rettype_1 targ1
typedef struct add_rettype_s
{
    modelica_real targ1; /* [] */
} add_rettype;

extern double add(double x, double y);


int _add_read_call_write(char const* in_filename, char const* out_filename);

add_rettype _add(modelica_real x, modelica_real y);


/* body part */
extern double add(double x, double y);

int _add_read_call_write(char const* in_filename, char const* out_filename)
{
  modelica_real x;
  modelica_real y;
  state tmp1;
  add_rettype out;
  double x_ext;
  double y_ext;
  double res_ext;

  PRE_VARIABLES
  PRE_OPEN_INFILE
  if(read_modelica_real(in_file, &x)) return 1;
  if(read_modelica_real(in_file, &y)) return 1;
  PRE_READ_DONE
  tmp1 = get_memory_state();

  x_ext = (double)x;
  y_ext = (double)y;
  res_ext = add(x_ext, y_ext);
  out.targ1 = (modelica_real)res_ext;
  PRE_OPEN_OUTFILE
  write_modelica_real(out_file, &out.targ1);
  PRE_WRITE_DONE

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
_add_read_call_write(argv[1],argv[2]);
  return 0;
}
