main: Main_main.o main.c
	g++ -o main main.c Main_main.o -I"/home/marsj/dev/trunk/build/include/omc" -march=native -mfpmath=sse -lomparse -lomcruntime -L"/home/marsj/dev/trunk/build/lib/omc" -lmodparomc -lc_runtime -lm -lrt -ldl -llpsolve55 -lcolamd -lsendDataHumbug -lantlr3
Main_main.o: Main_main.c
	g++ $(CFLAGS) -g -c -fPIC -I"/home/marsj/dev/trunk/build/include/omc" -march=native -mfpmath=sse -o Main_main.o Main_main.c
