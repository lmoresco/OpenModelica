.PHONY: test dyn clean clean-dyn

MO_FILES = MyHelloWorld.mo
MOS_FILES = PowerOf3.mos MyHelloWorld.mos

MO_TEST = ./rtest-mo -v
MOS_TEST = ./rtest-mos -v

all: test dyn

test:
	@echo
	@echo Running tests...
	@echo
	@echo OPENMODELICAHOME=" $(OPENMODELICAHOME) "
	@$(MO_TEST) $(MO_FILES)
	@$(MOS_TEST) $(MOS_FILES)

dyn: clean-dyn
	$(MOS_TEST) dyn1.mos dyn2.mos

clean-dyn:
	@rm -f dyn? dyn?.c dyn?.makefile output.log dyn?.log dyn?_*.txt
	@rm -f dyn1real* dyn1int* dyn1str* dyn1strlst*
	@rm -f Dyn2.makefile Dyn2.log Dyn2.libs Dyn2_*.txt Dyn2.cpp Dyn2.exe Dyn2 Dyn2_res.plt Dyn2_functions.cpp

clean: clean-dyn
	@rm -f MyHelloWorld MyHelloWorld*.cpp MyHelloWorld.libs MyHelloWorld.log MyHelloWorld.makefile MyHelloWorld_res.plt MyHelloWorld_*.txt
	@rm -f PowerOf3*.txt PowerOf3 PowerOf3.c PowerOf3.log PowerOf3.so PowerOf3.libs PowerOf3.makefile