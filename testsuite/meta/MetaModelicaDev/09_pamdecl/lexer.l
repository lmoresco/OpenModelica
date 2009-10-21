%{
#include <stdlib.h>
#include "parser.h"
#include "yacclib.h"
#include "Absyn.h"
 
typedef void *rml_t;
/* extern rml_t yylval; */
 
int absyn_integer(char *s);
int absyn_ident_or_keyword(char *s);
int yywrap(); 
%}

%option yylineno
 
%x c_comment

digit           [0-9]
digits          {digit}+
letter          [A-Za-z_]
 
intcon          {digits}
 
dot             "."
sign            [+-]
exponent        ([eE]{sign}?{digits})
realcondot      {digits}{dot}{digits}{exponent}?
realconexp      {digits}({dot}{digits})?{exponent}
realcon         {realcondot}|{realconexp}
 
ident           {letter}({letter}|{digit})*
ws              [ \t\n]
junk            .|\n
 
%% 

"/\*"	     {
		BEGIN(c_comment);
             }
<c_comment>
{
    "\*/"    { BEGIN(INITIAL); }
    "/\*"    { yyerror("Suspicious comment"); }
    [^\n]    ;
    \n       ;
    <<EOF>>  {
               yyerror("Unterminated comment");
	       yyterminate();
	     }
}

"("             return T_LPAREN;
")"             return T_RPAREN;
"+"             return T_PLUS;
"-"             return T_MINUS;
"*"             return T_TIMES;
"/"             return T_DIVIDE;
":="            return T_ASSIGN;
";"             return T_SEMICOLON;
":"             return T_COLON;
"<"             return T_LT;
"<="            return T_LE;
">"             return T_GT;
">="            return T_GE;
"<>"            return T_NE;
"="             return T_EQ;

{intcon}        { return absyn_integer(yytext);}
{realcon}       { return absyn_real(yytext);}
{ident}         { return absyn_ident_or_keyword(yytext);}

{ws}+           ;
{junk}+         return T_GARBAGE;

%%
 
/* Make an RML integer from a C string representation (decimal),
   box it for our abstract syntax, put in yylval and return constant token. */
 
int absyn_integer(char *s)
{
  yylval=(int) Absyn__INTCONST(mk_icon(atoi(s)));
  return T_CONST_INT;
}
 
/* Make an RML real from a C string representation,
   box it for our abstract syntax, put in yylval and return constant token. */
 
int absyn_real(char *s)
{
  yylval=(int) Absyn__REALCONST(mk_rcon(atof(s)));
  return T_CONST_REAL;
}
 
/* Make an RML Ident or a keyword token from a C string */
 
static struct keyword_s
{
  char *name;
  int token;
} kw[] =
{
  {"body",      T_BODY},
  {"do",        T_DO},
  {"else",      T_ELSE},
  {"end",       T_END},
  {"if",        T_IF},
  {"program",   T_PROGRAM},
  {"then",      T_THEN},
  {"while",     T_WHILE},
  {"write",     T_WRITE},
};

int absyn_ident_or_keyword(char *s)
{
        int low = 0;
        int high = (sizeof kw) / sizeof(struct keyword_s) - 1;

        while( low <= high ) {
                int mid = (low + high) / 2;
                int cmp = strcmp(kw[mid].name, yytext);
                if( cmp == 0 )
                {
                        return kw[mid].token;
                }
                else if( cmp < 0 )
                        low = mid + 1;
                else
                        high = mid - 1;
        }
        yylval = (int) mk_scon(s);
        return T_IDENT;
}

int yywrap()
{
	return 1;
}
