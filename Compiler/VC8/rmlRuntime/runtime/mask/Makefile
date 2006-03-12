include ../../config.cache
# variables for Intel x86 / Cygwin / gcc
CC=gcc
CFLAGS=
COFLAGS=-O2 -fomit-frame-pointer
CPFLAGS=-fno-omit-frame-pointer -pg
CGFLAGS=-g -DRML_DEBUG
RANLIB=ranlib
CPP=gcc -x c -E -ansi
AS=as
LD=ld
#
# Makefile for the mask runtime
#
GOROOT=../..

CSRC=	bool-and.c bool-not.c bool-or.c\
	int-abs.c int-add.c int-div.c int-eq.c int-ge.c int-gt.c\
	int-int.c int-le.c int-lt.c int-max.c int-min.c int-mod.c\
	int-mul.c int-ne.c int-neg.c int-real.c int-str.c int-sub.c\
	list-append.c list-delete.c list-length.c list-member.c\
	list-nth.c list-reverse.c list-str.c list-vec.c\
	lvar-get.c lvar-new.c lvar-set.c\
	misc-clock.c misc-print.c misc-tick.c\
	p-atoi.c p-clock.c p-equal.c p-gccore.c p-gcuser-block.c\
	p-get-real.c p-init.c p-mkreal.c p-mkstring.c p-motor.c p-nil.c\
	p-once.c p-set-real.c p-stringeq.c p-unwind.c p-usergc.c\
	real-abs.c real-add.c real-atan.c real-cos.c real-div.c\
	real-eq.c real-exp.c real-floor.c real-ge.c real-gt.c\
	real-int.c real-le.c real-ln.c real-lt.c real-max.c\
	real-min.c real-mod.c real-mul.c real-ne.c real-neg.c\
	real-pow.c real-sin.c real-sqrt.c real-str.c real-sub.c\
	str-append.c str-int.c str-length.c str-list.c str-nth.c\
	vec-length.c vec-list.c vec-nth.c\
	rml-debug.c debug.c rmldb-parse.c rmldb-scan.c \
	debug-debug.c debug-print.c debug-dbg.c \
	main.c
RMLHSRC=../common/rml-core.h ../common/rml-state.h rml-labels.h ../common/rml-predef.h ../debug/debug.h ../debug/rml-debug.h 
p-gccore.h=../common/p-gccore.h
rml-debug.h=../debug/rml-debug.h
rmldb-parse.h=../debug/rmldb-parse.h

default:	librml.a

YSIZEDEP=p-gccore.c p-gcuser.c
$(YSIZEDEP:.c=.o):	$(p-gccore.h)
$(YSIZEDEP:.c=.g.o):	$(p-gccore.h)
$(YSIZEDEP:.c=.p.o):	$(p-gccore.h)

# Specifics for the mask runtime
XCSRC=p-mask.c
RMLCRUNTIME=mask
xtra-install:

# Common rules
include $(GOROOT)/etc/runtime.mk
# fake VPATH rules
bool-and.o: ../common/bool-and.c
	$(COMPILE.c) $(COFLAGS) -o bool-and.o ../common/bool-and.c
bool-not.o: ../common/bool-not.c
	$(COMPILE.c) $(COFLAGS) -o bool-not.o ../common/bool-not.c
bool-or.o: ../common/bool-or.c
	$(COMPILE.c) $(COFLAGS) -o bool-or.o ../common/bool-or.c
int-abs.o: ../common/int-abs.c
	$(COMPILE.c) $(COFLAGS) -o int-abs.o ../common/int-abs.c
int-add.o: ../common/int-add.c
	$(COMPILE.c) $(COFLAGS) -o int-add.o ../common/int-add.c
int-div.o: ../common/int-div.c
	$(COMPILE.c) $(COFLAGS) -o int-div.o ../common/int-div.c
int-eq.o: ../common/int-eq.c
	$(COMPILE.c) $(COFLAGS) -o int-eq.o ../common/int-eq.c
int-ge.o: ../common/int-ge.c
	$(COMPILE.c) $(COFLAGS) -o int-ge.o ../common/int-ge.c
int-gt.o: ../common/int-gt.c
	$(COMPILE.c) $(COFLAGS) -o int-gt.o ../common/int-gt.c
int-int.o: ../common/int-int.c
	$(COMPILE.c) $(COFLAGS) -o int-int.o ../common/int-int.c
int-le.o: ../common/int-le.c
	$(COMPILE.c) $(COFLAGS) -o int-le.o ../common/int-le.c
int-lt.o: ../common/int-lt.c
	$(COMPILE.c) $(COFLAGS) -o int-lt.o ../common/int-lt.c
int-max.o: ../common/int-max.c
	$(COMPILE.c) $(COFLAGS) -o int-max.o ../common/int-max.c
int-min.o: ../common/int-min.c
	$(COMPILE.c) $(COFLAGS) -o int-min.o ../common/int-min.c
int-mod.o: ../common/int-mod.c
	$(COMPILE.c) $(COFLAGS) -o int-mod.o ../common/int-mod.c
int-mul.o: ../common/int-mul.c
	$(COMPILE.c) $(COFLAGS) -o int-mul.o ../common/int-mul.c
int-ne.o: ../common/int-ne.c
	$(COMPILE.c) $(COFLAGS) -o int-ne.o ../common/int-ne.c
int-neg.o: ../common/int-neg.c
	$(COMPILE.c) $(COFLAGS) -o int-neg.o ../common/int-neg.c
int-real.o: ../common/int-real.c
	$(COMPILE.c) $(COFLAGS) -o int-real.o ../common/int-real.c
int-str.o: ../common/int-str.c
	$(COMPILE.c) $(COFLAGS) -o int-str.o ../common/int-str.c
int-sub.o: ../common/int-sub.c
	$(COMPILE.c) $(COFLAGS) -o int-sub.o ../common/int-sub.c
list-append.o: ../common/list-append.c
	$(COMPILE.c) $(COFLAGS) -o list-append.o ../common/list-append.c
list-delete.o: ../common/list-delete.c
	$(COMPILE.c) $(COFLAGS) -o list-delete.o ../common/list-delete.c
list-length.o: ../common/list-length.c
	$(COMPILE.c) $(COFLAGS) -o list-length.o ../common/list-length.c
list-member.o: ../common/list-member.c
	$(COMPILE.c) $(COFLAGS) -o list-member.o ../common/list-member.c
list-nth.o: ../common/list-nth.c
	$(COMPILE.c) $(COFLAGS) -o list-nth.o ../common/list-nth.c
list-reverse.o: ../common/list-reverse.c
	$(COMPILE.c) $(COFLAGS) -o list-reverse.o ../common/list-reverse.c
list-str.o: ../common/list-str.c
	$(COMPILE.c) $(COFLAGS) -o list-str.o ../common/list-str.c
list-vec.o: ../common/list-vec.c
	$(COMPILE.c) $(COFLAGS) -o list-vec.o ../common/list-vec.c
lvar-get.o: ../common/lvar-get.c
	$(COMPILE.c) $(COFLAGS) -o lvar-get.o ../common/lvar-get.c
lvar-new.o: ../common/lvar-new.c
	$(COMPILE.c) $(COFLAGS) -o lvar-new.o ../common/lvar-new.c
lvar-set.o: ../common/lvar-set.c
	$(COMPILE.c) $(COFLAGS) -o lvar-set.o ../common/lvar-set.c
misc-clock.o: ../common/misc-clock.c
	$(COMPILE.c) $(COFLAGS) -o misc-clock.o ../common/misc-clock.c
misc-print.o: ../common/misc-print.c
	$(COMPILE.c) $(COFLAGS) -o misc-print.o ../common/misc-print.c
misc-tick.o: ../common/misc-tick.c
	$(COMPILE.c) $(COFLAGS) -o misc-tick.o ../common/misc-tick.c
p-atoi.o: ../common/p-atoi.c
	$(COMPILE.c) $(COFLAGS) -o p-atoi.o ../common/p-atoi.c
p-clock.o: ../common/p-clock.c
	$(COMPILE.c) $(COFLAGS) -o p-clock.o ../common/p-clock.c
p-equal.o: ../common/p-equal.c
	$(COMPILE.c) $(COFLAGS) -o p-equal.o ../common/p-equal.c
p-gccore.o: ../common/p-gccore.c
	$(COMPILE.c) $(COFLAGS) -o p-gccore.o ../common/p-gccore.c
p-gcuser-block.o: ../common/p-gcuser-block.c
	$(COMPILE.c) $(COFLAGS) -o p-gcuser-block.o ../common/p-gcuser-block.c
p-get-real.o: ../common/p-get-real.c
	$(COMPILE.c) $(COFLAGS) -o p-get-real.o ../common/p-get-real.c
p-init.o: ../common/p-init.c
	$(COMPILE.c) $(COFLAGS) -o p-init.o ../common/p-init.c
p-mkreal.o: ../common/p-mkreal.c
	$(COMPILE.c) $(COFLAGS) -o p-mkreal.o ../common/p-mkreal.c
p-mkstring.o: ../common/p-mkstring.c
	$(COMPILE.c) $(COFLAGS) -o p-mkstring.o ../common/p-mkstring.c
p-motor.o: ../common/p-motor.c
	$(COMPILE.c) $(COFLAGS) -o p-motor.o ../common/p-motor.c
p-nil.o: ../common/p-nil.c
	$(COMPILE.c) $(COFLAGS) -o p-nil.o ../common/p-nil.c
p-once.o: ../common/p-once.c
	$(COMPILE.c) $(COFLAGS) -o p-once.o ../common/p-once.c
p-set-real.o: ../common/p-set-real.c
	$(COMPILE.c) $(COFLAGS) -o p-set-real.o ../common/p-set-real.c
p-stringeq.o: ../common/p-stringeq.c
	$(COMPILE.c) $(COFLAGS) -o p-stringeq.o ../common/p-stringeq.c
p-unwind.o: ../common/p-unwind.c
	$(COMPILE.c) $(COFLAGS) -o p-unwind.o ../common/p-unwind.c
p-usergc.o: ../common/p-usergc.c
	$(COMPILE.c) $(COFLAGS) -o p-usergc.o ../common/p-usergc.c
real-abs.o: ../common/real-abs.c
	$(COMPILE.c) $(COFLAGS) -o real-abs.o ../common/real-abs.c
real-add.o: ../common/real-add.c
	$(COMPILE.c) $(COFLAGS) -o real-add.o ../common/real-add.c
real-atan.o: ../common/real-atan.c
	$(COMPILE.c) $(COFLAGS) -o real-atan.o ../common/real-atan.c
real-cos.o: ../common/real-cos.c
	$(COMPILE.c) $(COFLAGS) -o real-cos.o ../common/real-cos.c
real-div.o: ../common/real-div.c
	$(COMPILE.c) $(COFLAGS) -o real-div.o ../common/real-div.c
real-eq.o: ../common/real-eq.c
	$(COMPILE.c) $(COFLAGS) -o real-eq.o ../common/real-eq.c
real-exp.o: ../common/real-exp.c
	$(COMPILE.c) $(COFLAGS) -o real-exp.o ../common/real-exp.c
real-floor.o: ../common/real-floor.c
	$(COMPILE.c) $(COFLAGS) -o real-floor.o ../common/real-floor.c
real-ge.o: ../common/real-ge.c
	$(COMPILE.c) $(COFLAGS) -o real-ge.o ../common/real-ge.c
real-gt.o: ../common/real-gt.c
	$(COMPILE.c) $(COFLAGS) -o real-gt.o ../common/real-gt.c
real-int.o: ../common/real-int.c
	$(COMPILE.c) $(COFLAGS) -o real-int.o ../common/real-int.c
real-le.o: ../common/real-le.c
	$(COMPILE.c) $(COFLAGS) -o real-le.o ../common/real-le.c
real-ln.o: ../common/real-ln.c
	$(COMPILE.c) $(COFLAGS) -o real-ln.o ../common/real-ln.c
real-lt.o: ../common/real-lt.c
	$(COMPILE.c) $(COFLAGS) -o real-lt.o ../common/real-lt.c
real-max.o: ../common/real-max.c
	$(COMPILE.c) $(COFLAGS) -o real-max.o ../common/real-max.c
real-min.o: ../common/real-min.c
	$(COMPILE.c) $(COFLAGS) -o real-min.o ../common/real-min.c
real-mod.o: ../common/real-mod.c
	$(COMPILE.c) $(COFLAGS) -o real-mod.o ../common/real-mod.c
real-mul.o: ../common/real-mul.c
	$(COMPILE.c) $(COFLAGS) -o real-mul.o ../common/real-mul.c
real-ne.o: ../common/real-ne.c
	$(COMPILE.c) $(COFLAGS) -o real-ne.o ../common/real-ne.c
real-neg.o: ../common/real-neg.c
	$(COMPILE.c) $(COFLAGS) -o real-neg.o ../common/real-neg.c
real-pow.o: ../common/real-pow.c
	$(COMPILE.c) $(COFLAGS) -o real-pow.o ../common/real-pow.c
real-sin.o: ../common/real-sin.c
	$(COMPILE.c) $(COFLAGS) -o real-sin.o ../common/real-sin.c
real-sqrt.o: ../common/real-sqrt.c
	$(COMPILE.c) $(COFLAGS) -o real-sqrt.o ../common/real-sqrt.c
real-str.o: ../common/real-str.c
	$(COMPILE.c) $(COFLAGS) -o real-str.o ../common/real-str.c
real-sub.o: ../common/real-sub.c
	$(COMPILE.c) $(COFLAGS) -o real-sub.o ../common/real-sub.c
str-append.o: ../common/str-append.c
	$(COMPILE.c) $(COFLAGS) -o str-append.o ../common/str-append.c
str-int.o: ../common/str-int.c
	$(COMPILE.c) $(COFLAGS) -o str-int.o ../common/str-int.c
str-length.o: ../common/str-length.c
	$(COMPILE.c) $(COFLAGS) -o str-length.o ../common/str-length.c
str-list.o: ../common/str-list.c
	$(COMPILE.c) $(COFLAGS) -o str-list.o ../common/str-list.c
str-nth.o: ../common/str-nth.c
	$(COMPILE.c) $(COFLAGS) -o str-nth.o ../common/str-nth.c
vec-length.o: ../common/vec-length.c
	$(COMPILE.c) $(COFLAGS) -o vec-length.o ../common/vec-length.c
vec-list.o: ../common/vec-list.c
	$(COMPILE.c) $(COFLAGS) -o vec-list.o ../common/vec-list.c
vec-nth.o: ../common/vec-nth.c
	$(COMPILE.c) $(COFLAGS) -o vec-nth.o ../common/vec-nth.c
main.o: ../common/main.c
	$(COMPILE.c) $(COFLAGS) -o main.o ../common/main.c
bool-and.g.o: ../common/bool-and.c
	$(COMPILE.c) $(CGFLAGS) -o bool-and.g.o ../common/bool-and.c
bool-not.g.o: ../common/bool-not.c
	$(COMPILE.c) $(CGFLAGS) -o bool-not.g.o ../common/bool-not.c
bool-or.g.o: ../common/bool-or.c
	$(COMPILE.c) $(CGFLAGS) -o bool-or.g.o ../common/bool-or.c
int-abs.g.o: ../common/int-abs.c
	$(COMPILE.c) $(CGFLAGS) -o int-abs.g.o ../common/int-abs.c
int-add.g.o: ../common/int-add.c
	$(COMPILE.c) $(CGFLAGS) -o int-add.g.o ../common/int-add.c
int-div.g.o: ../common/int-div.c
	$(COMPILE.c) $(CGFLAGS) -o int-div.g.o ../common/int-div.c
int-eq.g.o: ../common/int-eq.c
	$(COMPILE.c) $(CGFLAGS) -o int-eq.g.o ../common/int-eq.c
int-ge.g.o: ../common/int-ge.c
	$(COMPILE.c) $(CGFLAGS) -o int-ge.g.o ../common/int-ge.c
int-gt.g.o: ../common/int-gt.c
	$(COMPILE.c) $(CGFLAGS) -o int-gt.g.o ../common/int-gt.c
int-int.g.o: ../common/int-int.c
	$(COMPILE.c) $(CGFLAGS) -o int-int.g.o ../common/int-int.c
int-le.g.o: ../common/int-le.c
	$(COMPILE.c) $(CGFLAGS) -o int-le.g.o ../common/int-le.c
int-lt.g.o: ../common/int-lt.c
	$(COMPILE.c) $(CGFLAGS) -o int-lt.g.o ../common/int-lt.c
int-max.g.o: ../common/int-max.c
	$(COMPILE.c) $(CGFLAGS) -o int-max.g.o ../common/int-max.c
int-min.g.o: ../common/int-min.c
	$(COMPILE.c) $(CGFLAGS) -o int-min.g.o ../common/int-min.c
int-mod.g.o: ../common/int-mod.c
	$(COMPILE.c) $(CGFLAGS) -o int-mod.g.o ../common/int-mod.c
int-mul.g.o: ../common/int-mul.c
	$(COMPILE.c) $(CGFLAGS) -o int-mul.g.o ../common/int-mul.c
int-ne.g.o: ../common/int-ne.c
	$(COMPILE.c) $(CGFLAGS) -o int-ne.g.o ../common/int-ne.c
int-neg.g.o: ../common/int-neg.c
	$(COMPILE.c) $(CGFLAGS) -o int-neg.g.o ../common/int-neg.c
int-real.g.o: ../common/int-real.c
	$(COMPILE.c) $(CGFLAGS) -o int-real.g.o ../common/int-real.c
int-str.g.o: ../common/int-str.c
	$(COMPILE.c) $(CGFLAGS) -o int-str.g.o ../common/int-str.c
int-sub.g.o: ../common/int-sub.c
	$(COMPILE.c) $(CGFLAGS) -o int-sub.g.o ../common/int-sub.c
list-append.g.o: ../common/list-append.c
	$(COMPILE.c) $(CGFLAGS) -o list-append.g.o ../common/list-append.c
list-delete.g.o: ../common/list-delete.c
	$(COMPILE.c) $(CGFLAGS) -o list-delete.g.o ../common/list-delete.c
list-length.g.o: ../common/list-length.c
	$(COMPILE.c) $(CGFLAGS) -o list-length.g.o ../common/list-length.c
list-member.g.o: ../common/list-member.c
	$(COMPILE.c) $(CGFLAGS) -o list-member.g.o ../common/list-member.c
list-nth.g.o: ../common/list-nth.c
	$(COMPILE.c) $(CGFLAGS) -o list-nth.g.o ../common/list-nth.c
list-reverse.g.o: ../common/list-reverse.c
	$(COMPILE.c) $(CGFLAGS) -o list-reverse.g.o ../common/list-reverse.c
list-str.g.o: ../common/list-str.c
	$(COMPILE.c) $(CGFLAGS) -o list-str.g.o ../common/list-str.c
list-vec.g.o: ../common/list-vec.c
	$(COMPILE.c) $(CGFLAGS) -o list-vec.g.o ../common/list-vec.c
lvar-get.g.o: ../common/lvar-get.c
	$(COMPILE.c) $(CGFLAGS) -o lvar-get.g.o ../common/lvar-get.c
lvar-new.g.o: ../common/lvar-new.c
	$(COMPILE.c) $(CGFLAGS) -o lvar-new.g.o ../common/lvar-new.c
lvar-set.g.o: ../common/lvar-set.c
	$(COMPILE.c) $(CGFLAGS) -o lvar-set.g.o ../common/lvar-set.c
misc-clock.g.o: ../common/misc-clock.c
	$(COMPILE.c) $(CGFLAGS) -o misc-clock.g.o ../common/misc-clock.c
misc-print.g.o: ../common/misc-print.c
	$(COMPILE.c) $(CGFLAGS) -o misc-print.g.o ../common/misc-print.c
misc-tick.g.o: ../common/misc-tick.c
	$(COMPILE.c) $(CGFLAGS) -o misc-tick.g.o ../common/misc-tick.c
p-atoi.g.o: ../common/p-atoi.c
	$(COMPILE.c) $(CGFLAGS) -o p-atoi.g.o ../common/p-atoi.c
p-clock.g.o: ../common/p-clock.c
	$(COMPILE.c) $(CGFLAGS) -o p-clock.g.o ../common/p-clock.c
p-equal.g.o: ../common/p-equal.c
	$(COMPILE.c) $(CGFLAGS) -o p-equal.g.o ../common/p-equal.c
p-gccore.g.o: ../common/p-gccore.c
	$(COMPILE.c) $(CGFLAGS) -o p-gccore.g.o ../common/p-gccore.c
p-gcuser-block.g.o: ../common/p-gcuser-block.c
	$(COMPILE.c) $(CGFLAGS) -o p-gcuser-block.g.o ../common/p-gcuser-block.c
p-get-real.g.o: ../common/p-get-real.c
	$(COMPILE.c) $(CGFLAGS) -o p-get-real.g.o ../common/p-get-real.c
p-init.g.o: ../common/p-init.c
	$(COMPILE.c) $(CGFLAGS) -o p-init.g.o ../common/p-init.c
p-mkreal.g.o: ../common/p-mkreal.c
	$(COMPILE.c) $(CGFLAGS) -o p-mkreal.g.o ../common/p-mkreal.c
p-mkstring.g.o: ../common/p-mkstring.c
	$(COMPILE.c) $(CGFLAGS) -o p-mkstring.g.o ../common/p-mkstring.c
p-motor.g.o: ../common/p-motor.c
	$(COMPILE.c) $(CGFLAGS) -o p-motor.g.o ../common/p-motor.c
p-nil.g.o: ../common/p-nil.c
	$(COMPILE.c) $(CGFLAGS) -o p-nil.g.o ../common/p-nil.c
p-once.g.o: ../common/p-once.c
	$(COMPILE.c) $(CGFLAGS) -o p-once.g.o ../common/p-once.c
p-set-real.g.o: ../common/p-set-real.c
	$(COMPILE.c) $(CGFLAGS) -o p-set-real.g.o ../common/p-set-real.c
p-stringeq.g.o: ../common/p-stringeq.c
	$(COMPILE.c) $(CGFLAGS) -o p-stringeq.g.o ../common/p-stringeq.c
p-unwind.g.o: ../common/p-unwind.c
	$(COMPILE.c) $(CGFLAGS) -o p-unwind.g.o ../common/p-unwind.c
p-usergc.g.o: ../common/p-usergc.c
	$(COMPILE.c) $(CGFLAGS) -o p-usergc.g.o ../common/p-usergc.c
real-abs.g.o: ../common/real-abs.c
	$(COMPILE.c) $(CGFLAGS) -o real-abs.g.o ../common/real-abs.c
real-add.g.o: ../common/real-add.c
	$(COMPILE.c) $(CGFLAGS) -o real-add.g.o ../common/real-add.c
real-atan.g.o: ../common/real-atan.c
	$(COMPILE.c) $(CGFLAGS) -o real-atan.g.o ../common/real-atan.c
real-cos.g.o: ../common/real-cos.c
	$(COMPILE.c) $(CGFLAGS) -o real-cos.g.o ../common/real-cos.c
real-div.g.o: ../common/real-div.c
	$(COMPILE.c) $(CGFLAGS) -o real-div.g.o ../common/real-div.c
real-eq.g.o: ../common/real-eq.c
	$(COMPILE.c) $(CGFLAGS) -o real-eq.g.o ../common/real-eq.c
real-exp.g.o: ../common/real-exp.c
	$(COMPILE.c) $(CGFLAGS) -o real-exp.g.o ../common/real-exp.c
real-floor.g.o: ../common/real-floor.c
	$(COMPILE.c) $(CGFLAGS) -o real-floor.g.o ../common/real-floor.c
real-ge.g.o: ../common/real-ge.c
	$(COMPILE.c) $(CGFLAGS) -o real-ge.g.o ../common/real-ge.c
real-gt.g.o: ../common/real-gt.c
	$(COMPILE.c) $(CGFLAGS) -o real-gt.g.o ../common/real-gt.c
real-int.g.o: ../common/real-int.c
	$(COMPILE.c) $(CGFLAGS) -o real-int.g.o ../common/real-int.c
real-le.g.o: ../common/real-le.c
	$(COMPILE.c) $(CGFLAGS) -o real-le.g.o ../common/real-le.c
real-ln.g.o: ../common/real-ln.c
	$(COMPILE.c) $(CGFLAGS) -o real-ln.g.o ../common/real-ln.c
real-lt.g.o: ../common/real-lt.c
	$(COMPILE.c) $(CGFLAGS) -o real-lt.g.o ../common/real-lt.c
real-max.g.o: ../common/real-max.c
	$(COMPILE.c) $(CGFLAGS) -o real-max.g.o ../common/real-max.c
real-min.g.o: ../common/real-min.c
	$(COMPILE.c) $(CGFLAGS) -o real-min.g.o ../common/real-min.c
real-mod.g.o: ../common/real-mod.c
	$(COMPILE.c) $(CGFLAGS) -o real-mod.g.o ../common/real-mod.c
real-mul.g.o: ../common/real-mul.c
	$(COMPILE.c) $(CGFLAGS) -o real-mul.g.o ../common/real-mul.c
real-ne.g.o: ../common/real-ne.c
	$(COMPILE.c) $(CGFLAGS) -o real-ne.g.o ../common/real-ne.c
real-neg.g.o: ../common/real-neg.c
	$(COMPILE.c) $(CGFLAGS) -o real-neg.g.o ../common/real-neg.c
real-pow.g.o: ../common/real-pow.c
	$(COMPILE.c) $(CGFLAGS) -o real-pow.g.o ../common/real-pow.c
real-sin.g.o: ../common/real-sin.c
	$(COMPILE.c) $(CGFLAGS) -o real-sin.g.o ../common/real-sin.c
real-sqrt.g.o: ../common/real-sqrt.c
	$(COMPILE.c) $(CGFLAGS) -o real-sqrt.g.o ../common/real-sqrt.c
real-str.g.o: ../common/real-str.c
	$(COMPILE.c) $(CGFLAGS) -o real-str.g.o ../common/real-str.c
real-sub.g.o: ../common/real-sub.c
	$(COMPILE.c) $(CGFLAGS) -o real-sub.g.o ../common/real-sub.c
str-append.g.o: ../common/str-append.c
	$(COMPILE.c) $(CGFLAGS) -o str-append.g.o ../common/str-append.c
str-int.g.o: ../common/str-int.c
	$(COMPILE.c) $(CGFLAGS) -o str-int.g.o ../common/str-int.c
str-length.g.o: ../common/str-length.c
	$(COMPILE.c) $(CGFLAGS) -o str-length.g.o ../common/str-length.c
str-list.g.o: ../common/str-list.c
	$(COMPILE.c) $(CGFLAGS) -o str-list.g.o ../common/str-list.c
str-nth.g.o: ../common/str-nth.c
	$(COMPILE.c) $(CGFLAGS) -o str-nth.g.o ../common/str-nth.c
vec-length.g.o: ../common/vec-length.c
	$(COMPILE.c) $(CGFLAGS) -o vec-length.g.o ../common/vec-length.c
vec-list.g.o: ../common/vec-list.c
	$(COMPILE.c) $(CGFLAGS) -o vec-list.g.o ../common/vec-list.c
vec-nth.g.o: ../common/vec-nth.c
	$(COMPILE.c) $(CGFLAGS) -o vec-nth.g.o ../common/vec-nth.c
main.g.o: ../common/main.c
	$(COMPILE.c) $(CGFLAGS) -o main.g.o ../common/main.c
bool-and.p.o: ../common/bool-and.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o bool-and.p.o ../common/bool-and.c
bool-not.p.o: ../common/bool-not.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o bool-not.p.o ../common/bool-not.c
bool-or.p.o: ../common/bool-or.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o bool-or.p.o ../common/bool-or.c
int-abs.p.o: ../common/int-abs.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-abs.p.o ../common/int-abs.c
int-add.p.o: ../common/int-add.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-add.p.o ../common/int-add.c
int-div.p.o: ../common/int-div.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-div.p.o ../common/int-div.c
int-eq.p.o: ../common/int-eq.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-eq.p.o ../common/int-eq.c
int-ge.p.o: ../common/int-ge.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-ge.p.o ../common/int-ge.c
int-gt.p.o: ../common/int-gt.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-gt.p.o ../common/int-gt.c
int-int.p.o: ../common/int-int.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-int.p.o ../common/int-int.c
int-le.p.o: ../common/int-le.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-le.p.o ../common/int-le.c
int-lt.p.o: ../common/int-lt.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-lt.p.o ../common/int-lt.c
int-max.p.o: ../common/int-max.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-max.p.o ../common/int-max.c
int-min.p.o: ../common/int-min.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-min.p.o ../common/int-min.c
int-mod.p.o: ../common/int-mod.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-mod.p.o ../common/int-mod.c
int-mul.p.o: ../common/int-mul.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-mul.p.o ../common/int-mul.c
int-ne.p.o: ../common/int-ne.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-ne.p.o ../common/int-ne.c
int-neg.p.o: ../common/int-neg.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-neg.p.o ../common/int-neg.c
int-real.p.o: ../common/int-real.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-real.p.o ../common/int-real.c
int-str.p.o: ../common/int-str.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-str.p.o ../common/int-str.c
int-sub.p.o: ../common/int-sub.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o int-sub.p.o ../common/int-sub.c
list-append.p.o: ../common/list-append.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-append.p.o ../common/list-append.c
list-delete.p.o: ../common/list-delete.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-delete.p.o ../common/list-delete.c
list-length.p.o: ../common/list-length.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-length.p.o ../common/list-length.c
list-member.p.o: ../common/list-member.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-member.p.o ../common/list-member.c
list-nth.p.o: ../common/list-nth.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-nth.p.o ../common/list-nth.c
list-reverse.p.o: ../common/list-reverse.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-reverse.p.o ../common/list-reverse.c
list-str.p.o: ../common/list-str.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-str.p.o ../common/list-str.c
list-vec.p.o: ../common/list-vec.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o list-vec.p.o ../common/list-vec.c
lvar-get.p.o: ../common/lvar-get.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o lvar-get.p.o ../common/lvar-get.c
lvar-new.p.o: ../common/lvar-new.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o lvar-new.p.o ../common/lvar-new.c
lvar-set.p.o: ../common/lvar-set.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o lvar-set.p.o ../common/lvar-set.c
misc-clock.p.o: ../common/misc-clock.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o misc-clock.p.o ../common/misc-clock.c
misc-print.p.o: ../common/misc-print.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o misc-print.p.o ../common/misc-print.c
misc-tick.p.o: ../common/misc-tick.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o misc-tick.p.o ../common/misc-tick.c
p-atoi.p.o: ../common/p-atoi.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-atoi.p.o ../common/p-atoi.c
p-clock.p.o: ../common/p-clock.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-clock.p.o ../common/p-clock.c
p-equal.p.o: ../common/p-equal.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-equal.p.o ../common/p-equal.c
p-gccore.p.o: ../common/p-gccore.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-gccore.p.o ../common/p-gccore.c
p-gcuser-block.p.o: ../common/p-gcuser-block.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-gcuser-block.p.o ../common/p-gcuser-block.c
p-get-real.p.o: ../common/p-get-real.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-get-real.p.o ../common/p-get-real.c
p-init.p.o: ../common/p-init.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-init.p.o ../common/p-init.c
p-mkreal.p.o: ../common/p-mkreal.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-mkreal.p.o ../common/p-mkreal.c
p-mkstring.p.o: ../common/p-mkstring.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-mkstring.p.o ../common/p-mkstring.c
p-motor.p.o: ../common/p-motor.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-motor.p.o ../common/p-motor.c
p-nil.p.o: ../common/p-nil.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-nil.p.o ../common/p-nil.c
p-once.p.o: ../common/p-once.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-once.p.o ../common/p-once.c
p-set-real.p.o: ../common/p-set-real.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-set-real.p.o ../common/p-set-real.c
p-stringeq.p.o: ../common/p-stringeq.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-stringeq.p.o ../common/p-stringeq.c
p-unwind.p.o: ../common/p-unwind.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-unwind.p.o ../common/p-unwind.c
p-usergc.p.o: ../common/p-usergc.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o p-usergc.p.o ../common/p-usergc.c
real-abs.p.o: ../common/real-abs.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-abs.p.o ../common/real-abs.c
real-add.p.o: ../common/real-add.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-add.p.o ../common/real-add.c
real-atan.p.o: ../common/real-atan.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-atan.p.o ../common/real-atan.c
real-cos.p.o: ../common/real-cos.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-cos.p.o ../common/real-cos.c
real-div.p.o: ../common/real-div.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-div.p.o ../common/real-div.c
real-eq.p.o: ../common/real-eq.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-eq.p.o ../common/real-eq.c
real-exp.p.o: ../common/real-exp.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-exp.p.o ../common/real-exp.c
real-floor.p.o: ../common/real-floor.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-floor.p.o ../common/real-floor.c
real-ge.p.o: ../common/real-ge.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-ge.p.o ../common/real-ge.c
real-gt.p.o: ../common/real-gt.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-gt.p.o ../common/real-gt.c
real-int.p.o: ../common/real-int.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-int.p.o ../common/real-int.c
real-le.p.o: ../common/real-le.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-le.p.o ../common/real-le.c
real-ln.p.o: ../common/real-ln.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-ln.p.o ../common/real-ln.c
real-lt.p.o: ../common/real-lt.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-lt.p.o ../common/real-lt.c
real-max.p.o: ../common/real-max.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-max.p.o ../common/real-max.c
real-min.p.o: ../common/real-min.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-min.p.o ../common/real-min.c
real-mod.p.o: ../common/real-mod.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-mod.p.o ../common/real-mod.c
real-mul.p.o: ../common/real-mul.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-mul.p.o ../common/real-mul.c
real-ne.p.o: ../common/real-ne.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-ne.p.o ../common/real-ne.c
real-neg.p.o: ../common/real-neg.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-neg.p.o ../common/real-neg.c
real-pow.p.o: ../common/real-pow.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-pow.p.o ../common/real-pow.c
real-sin.p.o: ../common/real-sin.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-sin.p.o ../common/real-sin.c
real-sqrt.p.o: ../common/real-sqrt.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-sqrt.p.o ../common/real-sqrt.c
real-str.p.o: ../common/real-str.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-str.p.o ../common/real-str.c
real-sub.p.o: ../common/real-sub.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o real-sub.p.o ../common/real-sub.c
str-append.p.o: ../common/str-append.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o str-append.p.o ../common/str-append.c
str-int.p.o: ../common/str-int.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o str-int.p.o ../common/str-int.c
str-length.p.o: ../common/str-length.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o str-length.p.o ../common/str-length.c
str-list.p.o: ../common/str-list.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o str-list.p.o ../common/str-list.c
str-nth.p.o: ../common/str-nth.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o str-nth.p.o ../common/str-nth.c
vec-length.p.o: ../common/vec-length.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o vec-length.p.o ../common/vec-length.c
vec-list.p.o: ../common/vec-list.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o vec-list.p.o ../common/vec-list.c
vec-nth.p.o: ../common/vec-nth.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o vec-nth.p.o ../common/vec-nth.c
main.p.o: ../common/main.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o main.p.o ../common/main.c
rml-debug.o: ../debug/rml-debug.c
	$(COMPILE.c) $(COFLAGS) -o rml-debug.o ../debug/rml-debug.c
debug.o: ../debug/debug.c
	$(COMPILE.c) $(COFLAGS) -o debug.o ../debug/debug.c
rmldb-parse.o: ../debug/rmldb-parse.c
	$(COMPILE.c) $(COFLAGS) -o rmldb-parse.o ../debug/rmldb-parse.c
rmldb-scan.o: ../debug/rmldb-scan.c
	$(COMPILE.c) $(COFLAGS) -o rmldb-scan.o ../debug/rmldb-scan.c
debug-debug.o: ../debug/debug-debug.c
	$(COMPILE.c) $(COFLAGS) -o debug-debug.o ../debug/debug-debug.c
debug-print.o: ../debug/debug-print.c
	$(COMPILE.c) $(COFLAGS) -o debug-print.o ../debug/debug-print.c
debug-dbg.o: ../debug/debug-dbg.c
	$(COMPILE.c) $(COFLAGS) -o debug-dbg.o ../debug/debug-dbg.c
rml-debug.g.o: ../debug/rml-debug.c
	$(COMPILE.c) $(CGFLAGS) -o rml-debug.g.o ../debug/rml-debug.c
debug.g.o: ../debug/debug.c
	$(COMPILE.c) $(CGFLAGS) -o debug.g.o ../debug/debug.c
rmldb-parse.g.o: ../debug/rmldb-parse.c
	$(COMPILE.c) $(CGFLAGS) -o rmldb-parse.g.o ../debug/rmldb-parse.c
rmldb-scan.g.o: ../debug/rmldb-scan.c
	$(COMPILE.c) $(CGFLAGS) -o rmldb-scan.g.o ../debug/rmldb-scan.c
debug-debug.g.o: ../debug/debug-debug.c
	$(COMPILE.c) $(CGFLAGS) -o debug-debug.g.o ../debug/debug-debug.c
debug-print.g.o: ../debug/debug-print.c
	$(COMPILE.c) $(CGFLAGS) -o debug-print.g.o ../debug/debug-print.c
debug-dbg.g.o: ../debug/debug-dbg.c
	$(COMPILE.c) $(CGFLAGS) -o debug-dbg.g.o ../debug/debug-dbg.c
rml-debug.p.o: ../debug/rml-debug.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o rml-debug.p.o ../debug/rml-debug.c
debug.p.o: ../debug/debug.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o debug.p.o ../debug/debug.c
rmldb-parse.p.o: ../debug/rmldb-parse.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o rmldb-parse.p.o ../debug/rmldb-parse.c
rmldb-scan.p.o: ../debug/rmldb-scan.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o rmldb-scan.p.o ../debug/rmldb-scan.c
debug-debug.p.o: ../debug/debug-debug.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o debug-debug.p.o ../debug/debug-debug.c
debug-print.p.o: ../debug/debug-print.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o debug-print.p.o ../debug/debug-print.c
debug-dbg.p.o: ../debug/debug-dbg.c
	$(COMPILE.c) $(COFLAGS) $(CPFLAGS) -o debug-dbg.p.o ../debug/debug-dbg.c
