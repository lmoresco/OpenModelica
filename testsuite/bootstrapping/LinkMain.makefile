CPPFLAGS=-I"../../build/include/omc"
UNAME=$(shell uname)
ifeq (Darwin,$(UNAME))
CFLAGS=-O3 -g -mfpmath=sse -fPIC
LDFLAGS=-L/opt/openmodelica/lib/ -llpsolve55
else
CFLAGS=-O3 -g -march=native -mfpmath=sse -fPIC
LDFLAGS= -lrt -llpsolve55 -lcolamd
endif

RECS=libmainrecords.a
CC=$(CXX)

main: Main_main2.o $(RECS) main.c
	@echo $(UNAME)
	$(CXX) $(CFLAGS) -o main main.c Main_main2.o $(CPPFLAGS) -L./ -lomparse -lomcruntime -L"../../build/lib/omc" -lmodparomc -lc_runtime $(LDFLAGS) -lm -ldl -lantlr3 -lmainrecords -lomniORB4 -lomnithread
$(RECS): main_records.o
	rm -f $@
	ar -ru $@ $<
	ranlib $@
main_records.o: main_records.c ../../build/include/omc/OpenModelicaBootstrappingHeader.h
	$(CXX) $(CFLAGS) -c $(CPPFLAGS) -o $@ $<
Main_main2.o: Main_main2.c
	$(CXX) $(CFLAGS) -c $(CPPFLAGS) -o Main_main2.o Main_main2.c
Main_main2.c: Main_main.c
	perl ../../build/share/omc/scripts/convert_lines.pl $< $@.tmp
	mv $@.tmp $@
