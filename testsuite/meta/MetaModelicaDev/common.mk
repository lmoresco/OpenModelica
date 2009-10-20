CFLAGS = -I$(OPENMODELICAHOME)/include -fPIC
DEPS += rtest
CC = gcc
run: $(DEPS) run2 clean

# rtest

rtest: ../../rtest
	sed 's/build\/bin\/omc/..\/..\/build\/bin\/omc/' $< > $@
	chmod +x rtest

# LEXER

lexer.o:  lexer.c parser.h
lexer.c:  lexer.l
	flex -t -l lexer.l >lexer.c

# PARSER

parser.o:  parser.c parser.h
parser.c parser.h:  parser.y
	bison -d parser.y
	mv parser.tab.c parser.c
	mv parser.tab.h parser.h

clean:
	rm -f $(CLEAN) *.o *.so *.dll *.exe parser.c lexer.c rtest *~

run2:
	./rtest SCRIPT.mos < program.txt

test: $(DEPS) test2 clean

test2:
	./rtest $(SOLUTIONS) < program.txt
