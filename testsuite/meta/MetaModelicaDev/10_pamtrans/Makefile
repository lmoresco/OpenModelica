SOLUTIONS=SCRIPT.mos
CLEAN=Absyn_* Emit_* Main_* Mcode_* Parse_* Trans_*
DEPS=lexer.o parser.o Emit.mo Tpl.mo.dummy Print.mo.dummy Util.mo.dummy Debug.mo.dummy RTOpts.mo.dummy System.mo.dummy Error.mo.dummy ErrorExt.mo.dummy
include ../common.omc

Tpl.mo.dummy:
	test -f ../../../../Compiler/Template/Tpl.mo && cp ../../../../Compiler/Template/Tpl.mo .

Print.mo.dummy:
	test -f ../../../../Compiler/Util/Print.mo && cp ../../../../Compiler/Util/Print.mo .

Util.mo.dummy:
	test -f ../../../../Compiler/Util/Util.mo && cp ../../../../Compiler/Util/Util.mo .

Debug.mo.dummy:
	test -f ../../../../Compiler/Util/Debug.mo && cp ../../../../Compiler/Util/Debug.mo .

RTOpts.mo.dummy:
	test -f ../../../../Compiler/Util/RTOpts.mo && cp ../../../../Compiler/Util/RTOpts.mo .

System.mo.dummy:
	test -f ../../../../Compiler/Util/System.mo && cp ../../../../Compiler/Util/System.mo .

Error.mo.dummy:
	test -f ../../../../Compiler/Util/Error.mo && cp ../../../../Compiler/Util/Error.mo .

ErrorExt.mo.dummy:
	test -f ../../../../Compiler/Util/ErrorExt.mo && cp ../../../../Compiler/Util/ErrorExt.mo .

