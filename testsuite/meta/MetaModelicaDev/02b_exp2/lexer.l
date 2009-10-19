%{
#include "parser.h"
#include "meta_modelica.h"

void* absyn_integer(char *s);

const char* Exp2_INT__desc__fields[] = {"integer"};
struct record_description Exp2_INT__desc = {
    "Exp2_INT",
    "Exp2.INT",
    Exp2_INT__desc__fields
};
#define Exp2__INT(X1) (mmc_mk_box2(3,&Exp2_INT__desc,(X1)))

%}

digit           ("0"|"1"|"2"|"3"|"4"|"5"|"6"|"7"|"8"|"9")
digits          {digit}+
junk            \n
letter          [$_A-Za-z.]
letters         {letter}+


%%

{digits}     { yylval=(long)absyn_integer(yytext); return T_INTCONST; }
"+"          return T_ADD;
"-"          return T_SUB;
"*"          return T_MUL;
"/"          return T_DIV;
"^"          return T_POW;
"!"          return T_FACTORIAL;
"("          return T_LPAREN;
")"          return T_RPAREN;
{junk}+         ;
{letters}    return T_ERR;

%%

void* absyn_integer(char *s)
{
  return Exp2__INT(mmc_mk_icon(atoi(s)));
}
