/*
 * rml-predef.h
 */

extern void rml_prim_motor(rml_labptr_t);
extern int rml_prim_once(rml_labptr_t);	/* C calls RML */
extern RML_FORWARD_LABEL(Main__main);	/* user code's entry point */

/*
 * Standard procedures
 */
extern RML_FORWARD_LABEL(RML__bool_5fand);
extern RML_FORWARD_LABEL(RML__bool_5fnot);
extern RML_FORWARD_LABEL(RML__bool_5for);
#define RML__char_5fint	RML__int_5fint
extern RML_FORWARD_LABEL(RML__int_5fabs);
extern RML_FORWARD_LABEL(RML__int_5fadd);
#define RML__int_5fchar	RML__int_5fint
extern RML_FORWARD_LABEL(RML__int_5fdiv);
extern RML_FORWARD_LABEL(RML__int_5feq);
extern RML_FORWARD_LABEL(RML__int_5fge);
extern RML_FORWARD_LABEL(RML__int_5fgt);
extern RML_FORWARD_LABEL(RML__int_5fint);
extern RML_FORWARD_LABEL(RML__int_5fle);
extern RML_FORWARD_LABEL(RML__int_5flt);
extern RML_FORWARD_LABEL(RML__int_5fmax);
extern RML_FORWARD_LABEL(RML__int_5fmin);
extern RML_FORWARD_LABEL(RML__int_5fmod);
extern RML_FORWARD_LABEL(RML__int_5fmul);
extern RML_FORWARD_LABEL(RML__int_5fne);
extern RML_FORWARD_LABEL(RML__int_5fneg);
extern RML_FORWARD_LABEL(RML__int_5freal);
extern RML_FORWARD_LABEL(RML__int_5fstring);
extern RML_FORWARD_LABEL(RML__int_5fsub);
extern RML_FORWARD_LABEL(RML__list_5fappend);
extern RML_FORWARD_LABEL(RML__list_5fdelete);
extern RML_FORWARD_LABEL(RML__list_5flength);
extern RML_FORWARD_LABEL(RML__list_5fmember);
extern RML_FORWARD_LABEL(RML__list_5fnth);
extern RML_FORWARD_LABEL(RML__list_5freverse);
extern RML_FORWARD_LABEL(RML__list_5fstring);
extern RML_FORWARD_LABEL(RML__list_5fvector);
extern RML_FORWARD_LABEL(RML__lvar_5fget);
extern RML_FORWARD_LABEL(RML__lvar_5fnew);
extern RML_FORWARD_LABEL(RML__lvar_5fset);
extern RML_FORWARD_LABEL(RML__real_5fabs);
extern RML_FORWARD_LABEL(RML__real_5fadd);
extern RML_FORWARD_LABEL(RML__real_5fatan);
extern RML_FORWARD_LABEL(RML__real_5fcos);
extern RML_FORWARD_LABEL(RML__real_5fdiv);
extern RML_FORWARD_LABEL(RML__real_5feq);
extern RML_FORWARD_LABEL(RML__real_5fexp);
extern RML_FORWARD_LABEL(RML__real_5ffloor);
extern RML_FORWARD_LABEL(RML__real_5fge);
extern RML_FORWARD_LABEL(RML__real_5fgt);
extern RML_FORWARD_LABEL(RML__real_5fint);
extern RML_FORWARD_LABEL(RML__real_5fle);
extern RML_FORWARD_LABEL(RML__real_5fln);
extern RML_FORWARD_LABEL(RML__real_5flt);
extern RML_FORWARD_LABEL(RML__real_5fmax);
extern RML_FORWARD_LABEL(RML__real_5fmin);
extern RML_FORWARD_LABEL(RML__real_5fmod);
extern RML_FORWARD_LABEL(RML__real_5fmul);
extern RML_FORWARD_LABEL(RML__real_5fne);
extern RML_FORWARD_LABEL(RML__real_5fneg);
extern RML_FORWARD_LABEL(RML__real_5fpow);
extern RML_FORWARD_LABEL(RML__real_5fsin);
extern RML_FORWARD_LABEL(RML__real_5fsqrt);
extern RML_FORWARD_LABEL(RML__real_5fstring);
extern RML_FORWARD_LABEL(RML__real_5fsub);
extern RML_FORWARD_LABEL(RML__string_5fappend);
extern RML_FORWARD_LABEL(RML__string_5fint);
extern RML_FORWARD_LABEL(RML__string_5flength);
extern RML_FORWARD_LABEL(RML__string_5flist);
extern RML_FORWARD_LABEL(RML__string_5fnth);
extern RML_FORWARD_LABEL(RML__vector_5flength);
extern RML_FORWARD_LABEL(RML__vector_5flist);
extern RML_FORWARD_LABEL(RML__vector_5fnth);
extern RML_FORWARD_LABEL(RML__clock);
extern RML_FORWARD_LABEL(RML__print);
extern RML_FORWARD_LABEL(RML__tick);
extern RML_FORWARD_LABEL(RML__debug);
extern RML_FORWARD_LABEL(RML__debug_print);
extern RML_FORWARD_LABEL(RML__dbg);
