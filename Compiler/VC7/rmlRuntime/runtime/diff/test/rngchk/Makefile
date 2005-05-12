SHELL=/bin/sh
CC=gcc
CFLAGS=-O2 -fomit-frame-pointer
RNGCHK=RNGCHK_C
CPPFLAGS=-D$(RNGCHK)

a.out:
	$(CC) $(CFLAGS) $(CPPFLAGS) main.c

c:	clean
	$(MAKE) RNGCHK=RNGCHK_C
alpha:	clean
	$(MAKE) RNGCHK=RNGCHK_ALPHA
hppa:	clean
	$(MAKE) RNGCHK=RNGCHK_HPPA
i386:	clean
	$(MAKE) RNGCHK=RNGCHK_I386
i686:	clean
	$(MAKE) RNGCHK=RNGCHK_I686
mips:	clean
	$(MAKE) RNGCHK=RNGCHK_MIPS
rs6000:	clean
	$(MAKE) RNGCHK=RNGCHK_RS6000
sparc7:	clean
	$(MAKE) RNGCHK=RNGCHK_SPARC7
sparc9:	clean
	$(MAKE) RNGCHK=RNGCHK_SPARC9 CC='gcc -Wa,-xarch=v8plus'

clean:
	rm -f a.out core main.o
