OMC = ../rtest
TESTFLAG = -v
BASEFLAG = -b 
test:
	@echo
	@echo Running OMCCP...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@echo
	@echo Setting BaseLine...
	@echo 
	@$(OMC) $(TESTFLAG) SCRIPT.mos 
baseline:
	@echo Setting BaseLine...
	@$(OMC) $(BASEFLAG) SCRIPT.mos 


        

DEPENDENCIES = \
*.mo \
*.mos \
lexerModelica.l \
parserModelica.y \
ParseCode.tmo \
LexerCode.tmo \
Readme.txt \
Makefile 
	
CLEAN = `ls | grep -w -v -f deps.tmp`

# Cleans all files that are not listed as dependencies 
clean :
	@echo $(DEPENDENCIES) | sed 's/ /\\|/g' > deps.tmp
	@rm -f $(CLEAN)
