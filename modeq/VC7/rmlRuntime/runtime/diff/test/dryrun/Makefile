SHELL=/bin/sh
CC=xlc
CFLAGS=-O2 -qinlglue
#CC=gcc
#CFLAGS=-O2
COMPILE.c=$(CC) $(CFLAGS) $(CPPFLAGS) -c
CPPFLAGS=-DDEBUG
CHECK=check.o

.c.o:
	$(COMPILE.c) $<

dryrun:	main.o ticks.o test.o $(CHECK)
	$(CC) -o dryrun main.o ticks.o test.o $(CHECK)

test.o:	$(TESTC)
	$(COMPILE.c) -o test.o $(TESTC)

# MASK

mask:	clean
	$(MAKE) TESTC=mask.c CPPFLAGS="-DMASK $(CPPFLAGS)"

mask.jptab:	clean
	$(MAKE) TESTC=mask.c CPPFLAGS="-DMASK -DJPTAB $(CPPFLAGS)"

mask.jptab.noshift:	clean
	$(MAKE) TESTC=mask.c CPPFLAGS="-DMASK -DJPTAB -DNOSHIFT $(CPPFLAGS)"

# DIFF

diff:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF $(CPPFLAGS)"

diff.hack:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DHACK $(CPPFLAGS)"

diff.jptab.rngchk-goto:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_GOTO $(CPPFLAGS)"

diff.jptab.rngchk-goto.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_GOTO -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-setzero:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SETZERO $(CPPFLAGS)"

diff.jptab.rngchk-setzero.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SETZERO -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-i386:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_I386 $(CPPFLAGS)"

diff.jptab.rngchk-i386.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_I386 -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-i686-cmov:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_I686_CMOV $(CPPFLAGS)"

diff.jptab.rngchk-i686-cmov.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_I686_CMOV -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-sparc:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SPARC $(CPPFLAGS)"

diff.jptab.rngchk-sparc.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SPARC -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-sparc9-movcc:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SPARC9_MOVCC -Wa,-xarch=v8plus $(CPPFLAGS)"

diff.jptab.rngchk-sparc9-movcc.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_SPARC9_MOVCC -Wa,-xarch=v8plus -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-alpha-cmpult:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_ALPHA_CMPULT $(CPPFLAGS)"

diff.jptab.rngchk-alpha-cmpult.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_ALPHA_CMPULT -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-alpha-cmpule:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_ALPHA_CMPULE $(CPPFLAGS)"

diff.jptab.rngchk-alpha-cmpule.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_ALPHA_CMPULE -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-mips:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_MIPS $(CPPFLAGS)"

diff.jptab.rngchk-mips.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_MIPS -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-hppa:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_HPPA $(CPPFLAGS)"

diff.jptab.rngchk-hppa.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_HPPA -DNOSHIFT $(CPPFLAGS)"

diff.jptab.rngchk-rs6000:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_RS6000 $(CPPFLAGS)"

diff.jptab.rngchk-rs6000.noshift:	clean
	$(MAKE) TESTC=diff.c CPPFLAGS="-DDIFF -DJPTAB -DRNGCHK_RS6000 -DNOSHIFT $(CPPFLAGS)"

# CLEAN

clean:
	rm -f a.out core dryrun main.o ticks.o check.o test.o
