CPPFLAGS=-I"/home/marsj/dev/trunk/build/include/omc"
main: Main_main.o Main_main_records.o main.c
	g++ -o main main.c Main_main.o $(CPPFLAGS) -march=native -mfpmath=sse -lomparse -lomcruntime -L"/home/marsj/dev/trunk/build/lib/omc" -lmodparomc -lc_runtime -lm -lrt -ldl -llpsolve55 -lcolamd -lsendDataHumbug -lantlr3 Main_main_records.o
Main_main_records.o: Main_main_records.c
	g++ -O3 -g -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o Main_main_records.o Main_main_records.c
Main_main.o: Main_main.c
	g++ $(CFLAGS) -g -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o Main_main.o Main_main.c
