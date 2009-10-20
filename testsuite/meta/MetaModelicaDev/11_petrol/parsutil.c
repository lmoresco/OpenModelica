/* parsutil.c */
#include <stdio.h>
#include "rml.h"
#include "yacclib.h"
#include "absyn.h"
#include "parsutil.h"

void *pu_Constant_INTcon(void *icon)		/* Absyn.INTcon=BOX1 */
{
    return mk_box1(Absyn__INTcon_3dBOX1, icon);
}

void *pu_Constant_REALcon(void *rcon)		/* Absyn.REALcon=BOX1 */
{
    return mk_box1(Absyn__REALcon_3dBOX1, rcon);
}

void *pu_Constant_IDENTcon(void *id)		/* Absyn.IDENTcon=BOX1 */
{
    return mk_box1(Absyn__IDENTcon_3dBOX1, id);
}

void *pu_CONBND(void *id, void *con)	/* Absyn.CONBND=BOX2 */
{
    return mk_box2(Absyn__CONBND_3dBOX2, id, con);
}

void *pu_Ty_NAME(void *id)	/* Absyn.NAME=BOX1 */
{
    return mk_box1(Absyn__NAME_3dBOX1, id);
}

void *pu_Ty_PTR(void *ty)	/* Absyn.PTR=BOX1 */
{
    return mk_box1(Absyn__PTR_3dBOX1, ty);
}

void *pu_Ty_ARR(void *con, void *ty)	/* Absyn.ARR=BOX2 */
{
    return mk_box2(Absyn__ARR_3dBOX2, con, ty);
}

void *pu_Ty_REC(void *varbnds)		/* Absyn.REC=BOX1 */
{
    return mk_box1(Absyn__REC_3dBOX1, varbnds);
}

void *pu_VARBND(void *id, void *ty)	/* Absyn.VARBND=BOX2 */
{
    return mk_box2(Absyn__VARBND_3dBOX2, id, ty);
}

void *pu_TYBND(void *id, void *ty)	/* Absyn.TYBND=BOX2 */
{
    return mk_box2(Absyn__TYBND_3dBOX2, id, ty);
}

void *pu_Exp_INT(void *icon)	/* Absyn.INT=BOX1 */
{
    return mk_box1(Absyn__INT_3dBOX1, icon);
}

void *pu_Exp_REAL(void *rcon)	/* Absyn.REAL=BOX1 */
{
    return mk_box1(Absyn__REAL_3dBOX1, rcon);
}

void *pu_Exp_IDENT(void *id)	/* Absyn.IDENT=BOX1 */
{
    return mk_box1(Absyn__IDENT_3dBOX1, id);
}

void *pu_Exp_CAST(void *ty, void *exp)	/* Absyn.CAST=BOX2 */
{
    return mk_box2(Absyn__CAST_3dBOX2, ty, exp);
}

void *pu_Exp_FIELD(void *exp, void *id)	/* Absyn.FIELD=BOX2 */
{
    return mk_box2(Absyn__FIELD_3dBOX2, exp, id);
}

void *pu_Exp_UNARY(enum uop uop, void *exp)	/* Absyn.UNARY=BOX2 */
{
    rml_uint_t unop;
    switch( uop ) {
      case UOP_ADDR:	unop = Absyn__ADDR_3dINT; break;
      case UOP_INDIR:	unop = Absyn__INDIR_3dINT; break;
      case UOP_NOT:	unop = Absyn__NOT_3dINT; break;
      case UOP_PLUS:	return exp;
      case UOP_MINUS:	return pu_Exp_BINARY(pu_Exp_INT(mk_icon(0)), BOP_SUB, exp);
    }
    return mk_box2(Absyn__UNARY_3dBOX2,
		    RML_IMMEDIATE(RML_TAGFIXNUM(unop)),
		    exp);
}

void *pu_Exp_BINARY(void *exp1, enum bop bop, void *exp2) /* Absyn.BINARY=BOX3 */
{
    rml_uint_t binop;
    switch( bop ) {
      case BOP_ADD:	binop = Absyn__ADD_3dINT; break;
      case BOP_SUB:	binop = Absyn__SUB_3dINT; break;
      case BOP_MUL:	binop = Absyn__MUL_3dINT; break;
      case BOP_RDIV:	binop = Absyn__RDIV_3dINT; break;
      case BOP_IDIV:	binop = Absyn__IDIV_3dINT; break;
      case BOP_IMOD:	binop = Absyn__IMOD_3dINT; break;
      case BOP_IAND:	binop = Absyn__IAND_3dINT; break;
      case BOP_IOR:	binop = Absyn__IOR_3dINT; break;
    }
    return mk_box3(Absyn__BINARY_3dBOX3,
		    exp1,
		    RML_IMMEDIATE(RML_TAGFIXNUM(binop)),
		    exp2);
}

void *pu_Exp_RELATION(void *exp1, enum rop rop, void *exp2) /* Absyn.RELATION=BOX3 */
{
    void *lhs, *rhs;
    rml_uint_t relop;
    switch( rop ) {
      case ROP_LT:	relop = Absyn__LT_3dINT; lhs = exp1; rhs = exp2; break;
      case ROP_LE:	relop = Absyn__LE_3dINT; lhs = exp1; rhs = exp2; break;
      case ROP_GE:	relop = Absyn__LE_3dINT; lhs = exp2; rhs = exp1; break;
      case ROP_GT:	relop = Absyn__LT_3dINT; lhs = exp2; rhs = exp1; break;
    }
    return mk_box3(Absyn__RELATION_3dBOX3,
		    lhs,
		    RML_IMMEDIATE(RML_TAGFIXNUM(relop)),
		    rhs);
}

void *pu_Exp_EQUALITY(void *exp1, enum eop eop, void *exp2) /* Absyn.EQUALITY=BOX2 */
{
    void *exp = mk_box2(Absyn__EQUALITY_3dBOX2, exp1, exp2);
    if( eop == EOP_NE )
	exp = pu_Exp_UNARY(UOP_NOT, exp);
    return exp;
}

void *pu_Exp_FCALL(void *id, void *args)	/* Absyn.FCALL=BOX2 */
{
    return mk_box2(Absyn__FCALL_3dBOX2, id, args);
}

void *pu_Stmt_ASSIGN(void *lhs, void *rhs)	/* Absyn.ASSIGN=BOX2 */
{
    return mk_box2(Absyn__ASSIGN_3dBOX2, lhs, rhs);
}

void *pu_Stmt_PCALL(void *id, void *args)	/* Absyn.PCALL=BOX2 */
{
    return mk_box2(Absyn__PCALL_3dBOX2, id, args);
}

void *pu_Stmt_FRETURN(void *exp)	/* Absyn.FRETURN=BOX1 */
{
    return mk_box1(Absyn__FRETURN_3dBOX1, exp);
}

void *pu_Stmt_PRETURN(void)	/* Absyn.PRETURN=BOX0 */
{
    static struct rml_header pret = { RML_STRUCTHDR(0, Absyn__PRETURN_3dBOX0) };
    return RML_TAGPTR(&pret);
}

void *pu_Stmt_WHILE(void *exp, void *stmt)	/* Absyn.WHILE=BOX2 */
{
    return mk_box2(Absyn__WHILE_3dBOX2, exp, stmt);
}

void *pu_Stmt_IF(void *exp, void *stmt1, void *stmt2)	/* Absyn.IF=BOX3 */
{
    return mk_box3(Absyn__IF_3dBOX3, exp, stmt1, stmt2);
}

void *pu_Stmt_SEQ(void *stmt1, void *stmt2)	/* Absyn.SEQ=BOX2 */
{
    return mk_box2(Absyn__SEQ_3dBOX2, stmt1, stmt2);
}

void *pu_Stmt_SKIP(void)	/* Absyn.SKIP=BOX0 */
{
    static struct rml_header skip = { RML_STRUCTHDR(0, Absyn__SKIP_3dBOX0) };
    return RML_TAGPTR(&skip);
}

void *pu_SubBnd_FUNCBND(void *id, void *varbnds, void *ty, void *block_opt) /* Absyn.FUNCBND=BOX4 */
{
    return mk_box4(Absyn__FUNCBND_3dBOX4, id, varbnds, ty, block_opt);
}

void *pu_SubBnd_PROCBND(void *id, void *varbnds, void *block_opt)	/* Absyn.PROCBND=BOX3 */
{
    return mk_box3(Absyn__PROCBND_3dBOX3, id, varbnds, block_opt);
}

void *pu_BLOCK(void *conbnds, void *tybnds, void *varbnds, void *subbnds, void *stmt)	/* Absyn.BLOCK=BOX5 */
{
    return mk_box5(Absyn__BLOCK_3dBOX5, conbnds, tybnds, varbnds, subbnds, stmt);
}

void *pu_PROG(void *id, void *block)	/* Absyn.PROG=BOX2 */
{
    return mk_box2(Absyn__PROG_3dBOX2, id, block);
}
