#include "Main_main.h"

int rml_execution_failed(mmc_GC_local_state_type local_GC_state)
{
  mmc_GC_undo_roots_state(local_GC_state);
  fflush(NULL);
  fprintf(stderr, "Execution failed!\n");
  return 1;
}

int main(int argc, char **argv)
{
  mmc_GC_local_state_type local_GC_state = mmc_GC_save_roots_state("top"); /* push the first mark */
  void *lst = mmc_mk_nil();
  int i = 0;

  for (i=argc-1; i>0; i--)
    lst = mmc_mk_cons(mmc_mk_scon(argv[i]), lst);

  mmc_GC_add_root(&lst, local_GC_state, "commandLineParameters"); /* add to roots */

  MMC_TRY_TOP()

  _Main_main(lst);

  MMC_CATCH_TOP(return rml_execution_failed(local_GC_state));

  return 0;
}
