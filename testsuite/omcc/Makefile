OMC = ../../build/bin/omc +g=MetaModelica +d=rml 
test:
	@echo
	@echo Running OMCCP...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(OMC) SCRIPT.mos 
	
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