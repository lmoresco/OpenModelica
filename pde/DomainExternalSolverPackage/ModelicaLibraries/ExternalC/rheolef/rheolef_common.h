#ifndef _RHEOLEF_COMMON_H_
#define _RHEOLEF_COMMON_H_

#include "rheolef.h"
#include <vector>

using namespace std;

#ifdef __cplusplus
extern "C" {
#endif 

typedef unsigned int size_type;

#define PRINT_GEO_INFO(omega)	do {			\
    std::cout << "geo" << std::endl;				\
    std::cout << "size=" << omega.size() << std::endl;		\
    std::cout << "vertices=" << omega.n_vertice() << std::endl;	\
    std::cout << "nodes=" << omega.n_node() << std::endl;		\
    std::cout << "elements=" << omega.n_element() << std::endl;	\
    std::cout << "triangles=" << omega.n_triangle() << std::endl;	\
    std::cout << "faces=" << omega.n_face() << std::endl;		\
    std::cout << "----------------------------" << std::endl; } while(0)

#define PRINT_CSR_INFO(m) do {				\
    std::cout << "csr" << std::endl;			\
    std::cout << "nrow=" << m.nrow() << std::endl;	\
    std::cout << "ncol=" << m.ncol() << std::endl;	\
    std::cout << "nnz=" << m.nnz() << std::endl; } while(0)

void get_geo_bamg(const char *meshfile, geo& omega);
void get_full_matrix_laplace(const form& a, dns<Float>& M);
void get_full_matrix_mass(const form& a, dns<Float>& M);
void get_full_rhs(const field & uh, const vec<Float>& bu, vec<Float>& rhs);
void get_unknown_indices(const field &uh, vector<int> &indices);
void get_blocked_indices(const field &uh, vector<int> &indices);


#endif // _RHEOLEF_COMMON_H_



#ifdef __cplusplus
}
#endif 
