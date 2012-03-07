/*
 * This file is part of OpenModelica.
 *
 * Copyright (c) 1998-CurrentYear, Linköping University,
 * Department of Computer and Information Science,
 * SE-58183 Linköping, Sweden.
 *
 * All rights reserved.
 *
 * THIS PROGRAM IS PROVIDED UNDER THE TERMS OF GPL VERSION 3
 * AND THIS OSMC PUBLIC LICENSE (OSMC-PL).
 * ANY USE, REPRODUCTION OR DISTRIBUTION OF THIS PROGRAM CONSTITUTES RECIPIENT'S
 * ACCEPTANCE OF THE OSMC PUBLIC LICENSE.
 *
 * The OpenModelica software and the Open Source Modelica
 * Consortium (OSMC) Public License (OSMC-PL) are obtained
 * from Linköping University, either from the above address,
 * from the URLs: http://www.ida.liu.se/projects/OpenModelica or
 * http://www.openmodelica.org, and in the OpenModelica distribution.
 * GNU version 3 is obtained from: http://www.gnu.org/copyleft/gpl.html.
 *
 * This program is distributed WITHOUT ANY WARRANTY; without
 * even the implied warranty of  MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE, EXCEPT AS EXPRESSLY SET FORTH
 * IN THE BY RECIPIENT SELECTED SUBSIDIARY LICENSE CONDITIONS
 * OF OSMC-PL.
 *
 * See the full OSMC Public License conditions for more details.
 *
 */

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
  if (!mmc_GC_state)
  {
    mmc_GC_init(mmc_GC_settings_default);
  }
  
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
  }

  return 0;
}
