TEST=../rtest -v

TESTFILES=\
Class3.mo \
Class4.mo \
ConstructParameters1.mo \
Declaration1.mo \
Declaration2.mo \
Declaration3.mo \
Identifier.mo \
IntegerLiterals.mo \
ParseError1.mo \
ParseError2.mo \
RealOpLexerMetaModelica.mo

FAILINGTESTFILES=\
Assign1.mo \
Assign2.mo \
Assign3.mo \
RealOpLexerModelica.mo \

.PHONY : test

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)
