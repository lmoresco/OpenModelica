/*
 * rml-state.h
 */

#ifdef	RML_STATE_JOIN

#define RML_NUM_ARGS	16

struct rml_state {
    void *SP, *FC, *SC, **TP, *ARGS[RML_NUM_ARGS];
    void **young_next, **young_limit;
};
extern struct rml_state rml_state;

#define rml_state_SP		(rml_state.SP)
#define rml_state_FC		(rml_state.FC)
#define rml_state_SC		(rml_state.SC)
#define rml_state_TP		(rml_state.TP)
#define rml_state_ARGS		(rml_state.ARGS)
#define rml_state_young_next	(rml_state.young_next)
#define rml_state_young_limit	(rml_state.young_limit)

#if	defined(RML_STATE_APTR) || defined(RML_STATE_LPTR)

#define rmlSP			(rmlState->SP)
#define rmlFC			(rmlState->FC)
#define rmlSC			(rmlState->SC)
#define rmlTP			(rmlState->TP)
#define rmlA0			(rmlState->ARGS[0])
#define rmlA1			(rmlState->ARGS[1])
#define rmlA2			(rmlState->ARGS[2])
#define rmlA3			(rmlState->ARGS[3])
#define rmlA4			(rmlState->ARGS[4])
#define rmlA5			(rmlState->ARGS[5])
#define rmlA6			(rmlState->ARGS[6])
#define rmlA7			(rmlState->ARGS[7])
#define rmlA8			(rmlState->ARGS[8])
#define rmlA9			(rmlState->ARGS[9])
#define rmlA10			(rmlState->ARGS[10])
#define rmlA11			(rmlState->ARGS[11])
#define rmlA12			(rmlState->ARGS[12])
#define rmlA13			(rmlState->ARGS[13])
#define rmlA14			(rmlState->ARGS[14])
#define rmlA15			(rmlState->ARGS[15])
#define rml_young_next		(rmlState->young_next)
#define rml_young_limit		(rmlState->young_limit)

#else	/*!(RML_STATE_APTR || RML_STATE_LPTR)*/

#define rmlSP			(rml_state.SP)
#define rmlFC			(rml_state.FC)
#define rmlSC			(rml_state.SC)
#define rmlTP			(rml_state.TP)
#define rmlA0			(rml_state.ARGS[0])
#define rmlA1			(rml_state.ARGS[1])
#define rmlA2			(rml_state.ARGS[2])
#define rmlA3			(rml_state.ARGS[3])
#define rmlA4			(rml_state.ARGS[4])
#define rmlA5			(rml_state.ARGS[5])
#define rmlA6			(rml_state.ARGS[6])
#define rmlA7			(rml_state.ARGS[7])
#define rmlA8			(rml_state.ARGS[8])
#define rmlA9			(rml_state.ARGS[9])
#define rmlA10			(rml_state.ARGS[10])
#define rmlA11			(rml_state.ARGS[11])
#define rmlA12			(rml_state.ARGS[12])
#define rmlA13			(rml_state.ARGS[13])
#define rmlA14			(rml_state.ARGS[14])
#define rmlA15			(rml_state.ARGS[15])
#define rml_young_next		(rml_state.young_next)
#define rml_young_limit		(rml_state.young_limit)

#endif	/*RML_STATE_APTR || RML_STATE_LPTR*/

#else	/*!RML_STATE_JOIN*/

extern void *rmlSP, *rmlFC, *rmlSC, **rmlTP, *rmlARGS[];
extern void **rml_young_next, **rml_young_limit;
#define rml_state_SP		rmlSP
#define rml_state_FC		rmlFC
#define rml_state_SC		rmlSC
#define rml_state_TP		rmlTP
#define rml_state_ARGS		rmlARGS
#define rml_state_young_next	rml_young_next
#define rml_state_young_limit	rml_young_limit
#define rmlA0			(rmlARGS[0])
#define rmlA1			(rmlARGS[1])
#define rmlA2			(rmlARGS[2])
#define rmlA3			(rmlARGS[3])
#define rmlA4			(rmlARGS[4])
#define rmlA5			(rmlARGS[5])
#define rmlA6			(rmlARGS[6])
#define rmlA7			(rmlARGS[7])
#define rmlA8			(rmlARGS[8])
#define rmlA9			(rmlARGS[9])
#define rmlA10			(rmlARGS[10])
#define rmlA11			(rmlARGS[11])
#define rmlA12			(rmlARGS[12])
#define rmlA13			(rmlARGS[13])
#define rmlA14			(rmlARGS[14])
#define rmlA15			(rmlARGS[15])

#endif	/*RML_STATE_JOIN*/
