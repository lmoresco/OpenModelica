OPENMODELICALIBRARY := ../../../libraries/msl31/

TEST=../rtest -v

ifeq ($(shell uname -m),x86_64)
	ARCH_DEPENDENT_FILES=IntegerLiterals64.mo
else
	ARCH_DEPENDENT_FILES=IntegerLiterals32.mo
endif

TESTFILES=\
$(ARCH_DEPENDENT_FILES) \
Assign1.mo \
Assign2.mo \
Assign3.mo \
Class3.mo \
Class4.mo \
Code.mo \
ConstructParameters1.mo \
Declaration1.mo \
Declaration2.mo \
Declaration3.mo \
DocumentationBackslash.mo \
DotName.mos \
EmptyWithin.mo \
Identifier.mo \
MetaModelicaMatchElse.mo \
MetaModelicaStringOpModelicaLexer.mo \
MissingSemicolon.mo \
ModifyConstant3.mo \
OptionalOutput.mos \
ParseCompilerSources.mos \
ParseElementReplaceable.mo \
ParseError1.mo \
ParseError2.mo \
ParseFullModelica1.6.mos \
ParseFullModelica2.2.1.mos \
ParseFullModelica3.1.mos \
ParseFullModelica3.2.mos \
RealOpLexerModelica.mo \
RealOpLexerMetaModelica.mo \
SimpleIntegrator4.mo \
WildLexerModelica.mo \
WildLexerMetaModelica.mo \
ParseModel.mos

FAILINGTESTFILES= \

.PHONY : test

test :
	@echo
	@echo Running tests...
	@echo
	@$(TEST) $(TESTFILES)

failingtest :
	@$(TEST) $(FAILINGTESTFILES)
