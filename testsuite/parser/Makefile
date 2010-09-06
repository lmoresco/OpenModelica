TEST=../rtest -v

ifeq ($(shell uname -m),x86_64)
	ARCH_DEPENDENT_FILES=IntegerLiterals64.mo
else
	ARCH_DEPENDENT_FILES=IntegerLiterals32.mo
endif

TESTFILES=\
$(ARCH_DEPENDENT_FILES) \
Class3.mo \
Class4.mo \
ConstructParameters1.mo \
Declaration1.mo \
Declaration2.mo \
Declaration3.mo \
Identifier.mo \
ParseError1.mo \
ParseError2.mo \
ParseFullModelica3.1.mos \
RealOpLexerMetaModelica.mo

FAILINGTESTFILES=\
Assign1.mo \
Assign2.mo \
Assign3.mo \
MetaModelicaMatchElse.mo \
MetaModelicaStringOpModelicaLexer.mo \
RealOpLexerModelica.mo \
WildLexerModelica.mo \
WildLexerMetaModelica.mo

.PHONY : test

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)

failingtest :
	@$(TEST) $(FAILINGTESTFILES)
