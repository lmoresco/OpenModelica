ifdef OMDEV
EXT=".exe"
endif

../../build/bin/omc-diff$(EXT): omc-diff.l
	flex omc-diff.l
	gcc -o $@ lex.yy.c
