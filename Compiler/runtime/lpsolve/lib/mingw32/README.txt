2011-05-22 [Adrian.Pop@liu.se]

- added static liblpsolve55.a build with mingw32.
- the package from here:
  http://sourceforge.net/projects/lpsolve/files/lpsolve/5.5.2.0/lp_solve_5.5.2.0_source.tar.gz/download
- unpack, run msys, cd to lp_solve_5.5/lpsolve55

adrpo@ida-liu050 ~/dev/lp_solve_5.5/lpsolve55
$ sh -c cmd.exe /c cgcc.bat
Microsoft Windows [Version 6.1.7601]
Copyright (c) 2009 Microsoft Corporation.  All rights reserved.

c:\bin\cygwin\home\adrpo\dev\lp_solve_5.5\lpsolve55>cgcc.bat
cgcc.bat
a - colamd.o
a - commonlib.o
a - ini.o
a - lp_crash.o
a - lp_Hash.o
a - lp_lib.o
a - lp_LUSOL.o
a - lp_matrix.o
a - lp_MDO.o
a - lp_mipbb.o
a - lp_MPS.o
a - lp_params.o
a - lp_presolve.o
a - lp_price.o
a - lp_pricePSE.o
a - lp_report.o
a - lp_rlp.o
a - lp_scale.o
a - lp_simplex.o
a - lp_SOS.o
a - lp_utils.o
a - lp_wlp.o
a - lusol.o
a - mmio.o
a - myblas.o
a - yacc_read.o
ar: creating bin\win32\liblpsolve55.a

- copy bin\win32\liblpsolve55* to here.
- todo: move it to OMDev!


  