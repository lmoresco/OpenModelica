#include "Main_main.h"

int main(int argc, char **argv) {
  void *lst = mmc_mk_nil();
  for (int i=argc-1; i>0; i--)
    lst = mmc_mk_cons(mmc_mk_scon(argv[i]), lst);
  try {
    _Main_main(lst);
  } catch (...) {
    fflush(NULL);
    fprintf(stderr, "Execution failed!\n");
    return 1;
  }
  return 0;
}
