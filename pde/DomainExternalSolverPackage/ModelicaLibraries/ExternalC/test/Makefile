default: test test_row test_form test_formsize test_ext test_meshext test_indices


# default: test

DYMOLAINC=-I$(DYMOLADIR)/Source

CPPFLAGS += $(DYMOLAINC) -I.. -I ../rheolef -DWITHOUT_DYMOLA

LIBEXTSRCS= read_array_common.c read_matrix.c 

LIBRHEOLEFSRCS= poisson_rheolef.c
LIBBAMGSRCS= bamg.c
LIBMESHEXTSRCS= meshext.c

LIBEXTOBJS=  $(LIBEXTSRCS:%.c=%.o) 
LIBRHEOLEFOBJS= $(LIBRHEOLEFSRCS:%.c=%.o)
LIBBAMGOBJS= $(LIBBAMGSRCS:%.c=%.o)
LIBMESHEXTOBJS= $(LIBMESHEXTSRCS:%.c=%.o)

LIBSRCS= $(LIBEXTSRCS) $(LIBRHEOLEFSRCS) $(LIBBAMGSRCS) $(LIBMESHEXTSRCS)

LIBOBJS= $(LIBEXTOBJS) $(LIBRHEOLEFOBJS) $(LIBBAMGOBJS) $(LIBMESHEXTOBJS)


%.o: ../%.c
	$(CC) $(CPPFLAGS) $(CFLAGS) -c -o $@ $<


test: $(LIBOBJS) test.o
	$(CXX) $(LDFLAGS) -o test  test.o $(LIBOBJS) $(LDLIBS)

test_row: $(LIBOBJS) test_row.o
	$(CXX) $(LDFLAGS) -o test_row  test_row.o $(LIBOBJS) $(LDLIBS)

test_form: $(LIBOBJS) test_form.o ../rheolef/print.h
	$(CXX) $(LDFLAGS) -o test_form  test_form.o $(LIBOBJS) $(LDLIBS)

test_indices: $(LIBOBJS) test_indices.o ../rheolef/print.h
	$(CXX) $(LDFLAGS) -o test_indices  test_indices.o $(LIBOBJS) $(LDLIBS)

test_formsize: $(LIBOBJS) test_formsize.o 
	$(CXX) $(LDFLAGS) -o test_formsize  test_formsize.o $(LIBOBJS) $(LDLIBS)

test_ext: $(LIBOBJS) test_ext.o
	$(CXX) $(LDFLAGS) -o test_ext  test_ext.o $(LIBOBJS) $(LDLIBS)

test_meshext: $(LIBOBJS) test_meshext.o
	$(CXX) $(LDFLAGS) -o test_meshext test_meshext.o $(LIBOBJS) $(LDLIBS)

