#ifndef POISSON_RHEOLEF_EXT_H
#define POISSON_RHEOLEF_EXT_H

#include "read_array_common.h"

#ifdef __cplusplus
extern "C" {
#endif

void get_rheolef_poisson_ext_laplace(void *meshData, int nv, double *laplace);
void get_rheolef_poisson_ext_g(void *meshData, int nv, double *g);


#ifdef __cplusplus
}
#endif


#endif /* POISSON_RHEOLEF_H */

