#ifndef MYPRINT_H_
#define MYPRINT_H_

#include <iostream>


using namespace std;

template < typename T >
void print_matrix(ostream& os, unsigned int n, unsigned int m, T *M);


template <typename T >
void print_vector(ostream& os, unsigned int n, T *v);

template < typename T >
void print_matrix(ostream& os, unsigned int n, unsigned int m, T *M) {
  os << "{" << n << ", " << m << ", " << endl;
  os << "{";
  for (unsigned int i=0; i < n; i++) {
    os << "{";
    for (unsigned int j=0; j < m; j++) {
      os << M[m*i+j];
      if (j < m-1)
	os << ", ";
    }
    os << "}" << endl;;
    if (i < n-1)
      os << ", " << endl;
  }
  os << "}" << endl;
  os << "}" << endl;
}

template <typename T >
void print_vector(ostream& os, unsigned int n, T *v) {
  os << "{" << n << ", " << endl;
  os << "{";
  for (unsigned int i=0; i < n; i++) {
    os << v[i];
    if (i < n-1)
      os << ", ";
  }
  os << "}" << endl;
  os << "}" << endl;
}


#endif
