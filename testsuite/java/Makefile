TEST=./rtest -v
TESTFILES=JavaExt.mos JavaExtArrays.mos JavaExtInteractive.mos JavaExtRecord.mos JavaExtUniontype.mos
SEP=$(shell test -e "`which mingw32-gcc.exe`" && echo ";" || echo ":")
LDL=$(shell test -e "`which mingw32-gcc.exe`" && echo "" || echo "-ldl")
RUNTIME=$(OPENMODELICAHOME)/share/java/modelica_java.jar
ANTLR=$(OPENMODELICAHOME)/share/java/antlr-3.1.3.jar
OMC=$(OPENMODELICAHOME)/bin/omc
CLEAN=JavaTest_*

CLASSPATH:=JavaExtDefs.jar$(SEP).

test: check defs clean
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@echo CLASSPATH=" $(CLASSPATH) "
	@echo JAVA_HOME=" $(JAVA_HOME) "
	@$(TEST) $(TESTFILES)
	$(RM) -f JavaTest_*
interactivetest: check defs
	@$(TEST) JavaExtInteractive.mos	
failingtest : check defs
	@echo
	@echo Running failing tests...
	@echo
	@$(TEST) $(FAILINGTESTFILES)
check:
	@echo
	@echo Checking if JRE is installed
	@echo
	$(TEST) JavaTest.mos || (echo "Skipping Java testsuite.\nInstall Java or add the Java installation directory to the JAVA_HOME environment variable" && false)
defs: check_javac JavaExtDefs.jar JavaExt.class
check_javac:
	javac -version || (echo "No Java Compiler on the system PATH. Install a Java Development Kit (JDK)" && false)
JavaExtDefs.jar: JavaExt.mo $(OMC) $(RUNTIME)
	java -classpath "$(RUNTIME)$(SEP)$(ANTLR)" org.openmodelica.corba.parser.DefinitionsCreator $@ org.openmodelica.JavaExtTest "." $<
JavaExt.class: JavaExt.java JavaExtDefs.jar $(OMC) $(RUNTIME)
	javac -classpath "$(OPENMODELICAHOME)/share/java/modelica_java.jar$(SEP)JavaExtDefs.jar" $<
    
clean:
	rm -f $(CLEAN)

# To debug the JavaExtInteractive session; it has more test cases than the other mos files...
JavaExtInteractiveTrace.mos: JavaExtInteractiveTrace.txt
	echo "loadFile(\"JavaExt.mo\");" > $@
	grep "^>>" $< | sed "s/^>> //" | sed "s/$$/;/" >> $@
# Used to test the data types we can't test in real OMC right now
dummytest:
	gcc -o dummy dummy_test.c -I../../build/include/ ../../build/lib/libc_runtime.a $(LDL)
	dummy | diff -w dummy_test_expected.txt -
	rm -f dummy dummy.exe
