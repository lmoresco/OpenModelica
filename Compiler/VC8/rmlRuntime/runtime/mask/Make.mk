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
