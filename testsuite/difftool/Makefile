ifdef OMDEV
EXT="".exe"
endif

../../build/bin/omc-difftool$(EXT): omc-diff.l
	flex omc-diff.l
	gcc -o $@ lex.yy.c
