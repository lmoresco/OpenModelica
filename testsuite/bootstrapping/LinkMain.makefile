main: Main_main.o
	g++ -o main main.c Main_main.o -I"/home/marsj/dev/trunk/build/include/omc" -march=native -mfpmath=sse  -lomcruntime -L"/home/marsj/dev/trunk/build/lib/omc" -lmodparomc -lc_runtime -lm -lrt -ldl -llpsolve55 -lcolamd -lsendDataHumbug -lomparse -lantlr3
Main_main.o: Main_main.c
	g++ -c -fPIC -I"/home/marsj/dev/trunk/build/include/omc" -march=native -mfpmath=sse -o Main_main.o Main_main.c
