#include "read_array_common.h"
#include "poisson_rheolef_ext.h"


void get_rheolef_poisson_ext_laplace(const char *meshfile, int nv, double *laplace)
{
  char buf[1024];

  sprintf(buf, "extsolverrun.bat -m %s %d P1 > temp_m.txt", meshfile, nv);
  printf("Running: %s\n", buf);
  system(buf);
  read_square_matrix("temp_m.txt", nv, laplace);
}

void get_rheolef_poisson_ext_g(const char *meshfile, int nv, double *g)
{
  char buf[1024];

  sprintf(buf, "extsolverrun.bat -g %s %d P1 > temp_g.txt", meshfile, nv);
  printf("Running: %s\n", buf);
  system(buf);
  read_vector("temp_g.txt", nv, g);
 
}



#ifdef __cplusplus
}
#endif 

