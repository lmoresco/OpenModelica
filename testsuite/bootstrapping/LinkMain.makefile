CPPFLAGS=-I"/home/marsj/dev/trunk/build/include/omc"
RECS=libmainrecords.a

main: Main_main.o $(RECS) main.c
	$(CXX) -o main main.c Main_main.o $(CPPFLAGS) -L./ -march=native -mfpmath=sse -lomparse -lomcruntime -L"/home/marsj/dev/trunk/build/lib/omc" -lmodparomc -lc_runtime -lm -lrt -ldl -llpsolve55 -lcolamd -lantlr3 -lmainrecords -lomniORB4 -lomnithread
$(RECS): main_records.o
	rm -f $@
	ar -ru $@ $<
	ranlib $@
main_records.o: main_records.c ../../build/include/omc/OpenModelicaBootstrappingHeader.h
	$(CXX) $(CFLAGS) -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o $@ $<
Main_main.o: Main_main.c
	$(CXX) $(CFLAGS) -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o Main_main.o Main_main.c
