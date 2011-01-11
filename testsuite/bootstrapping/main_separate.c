#include "meta_modelica.h"
#define ADD_METARECORD_DEFINTIONS
#include "AllRecords.c"

void _Main_main(void*);

int rml_execution_failed()
{
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  return 1;
}

int main(int argc, char **argv) {
  void *lst = mmc_mk_nil();
  for (int i=argc-1; i>0; i--)
    lst = mmc_mk_cons(mmc_mk_scon(argv[i]), lst);
  MMC_TRY_TOP()
    _Main_main(lst);
  MMC_CATCH_TOP(return rml_execution_failed())
  return 0;
}
