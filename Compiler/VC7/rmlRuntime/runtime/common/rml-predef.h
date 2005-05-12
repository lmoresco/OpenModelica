
/*
 * rml-predef.h
 */

extern void rml_prim_motor(rml_labptr_t);
extern int rml_prim_once(rml_labptr_t);	/* C calls RML */
extern RML_FORWARD_LABEL(Main__main);	/* user code's entry point */
/* let the print relation be available for non-debug-version-rml-library also */
extern void rmldb_var_print(void *p);

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
extern RML_FORWARD_LABEL(RML__list_5farray);

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
extern RML_FORWARD_LABEL(RML__vector_5fupdate);
extern RML_FORWARD_LABEL(RML__vector_5fcreate);
extern RML_FORWARD_LABEL(RML__vector_5fadd);
extern RML_FORWARD_LABEL(RML__vector_5farray);

extern RML_FORWARD_LABEL(RML__array_5flength);
extern RML_FORWARD_LABEL(RML__array_5flist);
extern RML_FORWARD_LABEL(RML__array_5fnth);
extern RML_FORWARD_LABEL(RML__array_5fupdate);
extern RML_FORWARD_LABEL(RML__array_5fcreate);
extern RML_FORWARD_LABEL(RML__array_5fadd);
extern RML_FORWARD_LABEL(RML__array_5fvector);

extern RML_FORWARD_LABEL(RML__clock);
extern RML_FORWARD_LABEL(RML__print);
extern RML_FORWARD_LABEL(RML__tick);
/* debugging */
/* let these relation be available in all rml libraries */
/* however their code depends on _RMLDB_DEFINED_ */
extern RML_FORWARD_LABEL(RML__debug_5fprint);
extern RML_FORWARD_LABEL(RML__debug);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fvars);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin01);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin02);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin03);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin04);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin05);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin06);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin07);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin08);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin09);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin10);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin11);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin12);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin13);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin14);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin15);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fin16);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout01);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout02);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout03);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout04);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout05);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout06);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout07);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout08);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout09);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout10);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout11);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout12);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout13);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout14);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout15);
extern RML_FORWARD_LABEL(RML__debug_5fpush_5fout16);

