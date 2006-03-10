/*
 * main.c -- provide a dummy main for RML -- call procedure main in module Main
 */
#include <string.h>
#include <stdio.h>
#include <limits.h>
#include <stdlib.h>
#include "rml.h"

static void rml_prim_argv(int argc, char **argv)
{
#if	defined(RML_STATE_APTR) || defined(RML_STATE_LPTR)
    struct rml_state *rmlState = &rml_state;
#endif	/*RML_STATE_APTR || RML_STATE_LPTR*/
    rmlA0 = RML_TAGPTR(&rml_prim_nil);
    while( --argc >= 0 ) {
	{
	    char *s = argv[argc];
	    rml_uint_t len = strlen(s);
	    struct rml_string *str = rml_prim_mkstring(len, 1);
	    memcpy(str->data, s, len);
		str->data[len] = '\0';
	    rmlA1 = RML_TAGPTR(str);
	}
	{
	    struct rml_struct *cons = (struct rml_struct*)rml_prim_alloc(3, 2);
	    cons->header = RML_CONSHDR;
	    cons->data[0] = rmlA1;
	    cons->data[1] = rmlA0;
	    rmlA0 = RML_TAGPTR(cons);
	}
    }
}

static unsigned long my_atoul(const char *nptr)
{
    unsigned long res;
    char *endptr;

    res = strtoul(nptr, &endptr, 0);
    if( res != ULONG_MAX ) {
	switch( *endptr ) {
	  case 'M':
	    res *= 1024;
	    /*FALLTHROUGH*/
	  case 'K':
	    res *= 1024;
	    /*FALLTHROUGH*/
	  case '\0':
	    return res;
	}
    }
    return ULONG_MAX;
}

int main(int argc, char **argv)
{
#ifdef RML_DEBUG
	rmldb_execution_startup_type = RMLDB_STEP;
#endif /* RML_DEBUG */
    for(++argv, --argc; argc > 0 && argv[0][0] == '-';) {
	char *arg = &argv[0][1];
	++argv, --argc;
	if( strcmp(arg, "log") == 0 ) {
	    rml_flag_log = 1;
	    rml_flag_gclog = 1;
	    rml_flag_no_stack_check = 0;
	    continue;
	} else if( strcmp(arg, "gcgag") == 0 ) {
	    rml_flag_gclog = 0;
	    continue;
	} else if( strcmp(arg, "bench") == 0 ) {
	    rml_flag_bench = 1;
	    rml_flag_no_stack_check = 1;
	    rml_clock_start = rml_prim_clock();
	    continue;
	} else if( strcmp(arg, "no-stack-check") == 0 ) {
	    rml_flag_no_stack_check = 1;
	    continue;
	} else if( strncmp(arg, "stack-size=", 11) == 0 ) {
	    if( (rml_stack_size = my_atoul(arg+11)) == ULONG_MAX ) {
		fprintf(stderr, "Illegal argument: -stack-size=%s\n", arg);
		rml_stack_size = 0;
		rml_exit(1);
	    }
	    continue;
	}  else if( strncmp(arg, "young-size=", 11) == 0 ) {
	    if( (rml_young_size = my_atoul(arg+11)) == ULONG_MAX ) {
		fprintf(stderr, "Illegal argument: -young-size=%s\n", arg);
		fprintf(stderr, "Falback to: -young-size=%s\n", RML_YOUNG_SIZE);
		rml_young_size = RML_YOUNG_SIZE;
		continue;
	    }
	    continue;
	} else if( strcmp(arg, "debugrun") == 0 ) {
        #ifdef RML_DEBUG
	    rmldb_execution_startup_type = RMLDB_RUN;
        #endif /* RML_DEBUG */
	    continue;
	} else if( strcmp(arg, "debugfast") == 0 ) {
        #ifdef RML_DEBUG
	    rmldb_execution_startup_type = RMLDB_FAST;
        #endif /* RML_DEBUG */
	    continue;
	} else if( strcmp(arg, "-") == 0 ) {
	    break;
	} else {
	    fprintf(stderr, "Illegal argument: -%s\n", arg);
	    rml_exit(1);
	}
    }
    Main_5finit();
    rml_prim_argv(argc, argv);
    if( rml_prim_once(RML_LABPTR(Main__main)) == 0 ) {
	fprintf(stderr, "Execution failed!\n");
	rml_exit(1);
    } else
	rml_exit(0);
    /*NOTREACHED*/
    return 1;
}
