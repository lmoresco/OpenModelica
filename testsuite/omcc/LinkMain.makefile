CC=gcc-4.4
CXX=g++-4.4
CFLAGS=-O0 -g -march=native -fPIC -falign-functions
LDFLAGS=  -lrt  -llpsolve55 -lcolamd -lm -lreadline  -llapack -lblas

CPPFLAGS=-I"../../build/include/omc" 

RECS=libmainrecords.a

main: Main_main2.o $(RECS) main.c
	@echo $(UNAME)
	$(CC) $(CFLAGS) -o main main.c Main_main2.o $(CPPFLAGS) -L./ -lomparse -lomcruntime -L"../../build/lib/omc" -lmodparomc -lSimulationRuntimeC $(LDFLAGS) -lm -ldl -lantlr3 -lmainrecords -lomniORB4 -lomnithread
$(RECS): main_records.o
	rm -f $@
	ar -ru $@ $<
	ranlib $@
main_records.o: main_records.c ../../build/include/omc/OpenModelicaBootstrappingHeader.h Main_main_records.c
	$(CC) $(CFLAGS) -c $(CPPFLAGS) -o $@ $<
Main_main2.o: Main_main2.c
	$(CC) $(CFLAGS) -c $(CPPFLAGS) -o Main_main2.o Main_main2.c
Main_main2.c: Main_main.c
	perl ../../build/share/omc/scripts/convert_lines.pl $< $@.tmp
	mv $@.tmp $@

pre:
	$(CC) $(CFLAGS) -E $(CPPFLAGS) Main_main.c
  
