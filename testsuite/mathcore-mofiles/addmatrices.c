#include "modelica.h"
#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
/*---FUNC: addmatrices ---*/

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
#define addmatrices_rettype_1 targ1
typedef struct addmatrices_rettype_s
{
    real_array targ1; /* [:, :] */
} addmatrices_rettype;

extern void addmatrices(const double * a, size_t a_1, size_t a_2, const double * b, size_t b_1, size_t b_2, double* c, size_t c_1, size_t c_2);


int _addmatrices_read_call_write(char const* in_filename, char const* out_filename);

addmatrices_rettype _addmatrices(real_array a, real_array b);


/* body part */
extern void addmatrices(const double * a, size_t a_1, size_t a_2, const double * b, size_t b_1, size_t b_2, double* c, size_t c_1, size_t c_2);

int _addmatrices_read_call_write(char const* in_filename, char const* out_filename)
{
  real_array a; /* [:, :] */
  real_array b; /* [:, :] */
  state tmp3;
  size_t tmp1;
  size_t tmp2;
  addmatrices_rettype out;

  PRE_VARIABLES
  PRE_OPEN_INFILE
  if(read_real_array(in_file, &a)) return 1;
  if(read_real_array(in_file, &b)) return 1;
  PRE_READ_DONE
  tmp3 = get_memory_state();
  tmp1 = size_of_dimension_real_array(a,1);
  tmp2 = size_of_dimension_real_array(a,2);
  alloc_real_array(&out.targ1, 2, tmp1, tmp2);

  addmatrices(a.data, size_of_dimension_real_array(a, 1), size_of_dimension_real_array(a, 2), b.data, size_of_dimension_real_array(b, 1), size_of_dimension_real_array(b, 2), out.targ1.data, size_of_dimension_real_array(out.targ1, 1), size_of_dimension_real_array(out.targ1, 2));
  PRE_OPEN_OUTFILE
  write_real_array(out_file, &out.targ1);
  PRE_WRITE_DONE

  restore_memory_state(tmp3);
  return 0;

}
addmatrices_rettype _addmatrices(real_array a, real_array b)
{
  addmatrices_rettype out;
  size_t tmp1;
  size_t tmp2;

  tmp1 = size_of_dimension_real_array(a,1);
  tmp2 = size_of_dimension_real_array(a,2);
  alloc_real_array(&out.targ1, 2, tmp1, tmp2);

  addmatrices(a.data, size_of_dimension_real_array(a, 1), size_of_dimension_real_array(a, 2), b.data, size_of_dimension_real_array(b, 1), size_of_dimension_real_array(b, 2), out.targ1.data, size_of_dimension_real_array(out.targ1, 1), size_of_dimension_real_array(out.targ1, 2));

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
_addmatrices_read_call_write(argv[1],argv[2]);
  return 0;
}
