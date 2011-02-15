CPPFLAGS=-I"../../build/include/omc"
RECS=libmainrecords.a
CC=$(CXX)

main: Main_main2.o $(RECS) main.c
	$(CXX) $(CFLAGS) -o main main.c Main_main2.o $(CPPFLAGS) -L./ -march=native -mfpmath=sse -lomparse -lomcruntime -L"/home/marsj/dev/trunk/build/lib/omc" -lmodparomc -lc_runtime -lm -lrt -ldl -llpsolve55 -lcolamd -lantlr3 -lmainrecords -lomniORB4 -lomnithread
$(RECS): main_records.o
	rm -f $@
	ar -ru $@ $<
	ranlib $@
main_records.o: main_records.c ../../build/include/omc/OpenModelicaBootstrappingHeader.h
	$(CXX) $(CFLAGS) -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o $@ $<
Main_main2.o: Main_main2.c
	$(CXX) $(CFLAGS) -c -fPIC $(CPPFLAGS) -march=native -mfpmath=sse -o Main_main2.o Main_main2.c
Main_main2.c: Main_main.c
	perl ../../build/share/omc/scripts/convert_lines.pl $< $@.tmp
	mv $@.tmp $@
