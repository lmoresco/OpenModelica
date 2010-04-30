/* 123 -123 123.456 123.45e23 123.45e-23 10e5 */
%{
#define T_EOF 0
#define T_TEXT 1
#define T_REAL 2
#define T_NEWLINE 3
char* yylval;

%}

digit           [0-9]
letter          [^0-9\-\n\r]


%%

"\n\r"|"\n"         return T_NEWLINE;
"-"?{digit}+("."({digit}+))?(("e"|"E")"-"?{digit}+)?  return T_REAL;
{letter}+    return T_TEXT;

%%

#include <string.h>
#include <math.h>

int yywrap (void ) {
  return 1;
}

int usage(char* exe, char* s1,char* s2) {
  printf("Error: %s%s.\n", s1, s2);
  printf("Usage: %s epsilon $file_expected $file_actual\n",exe);
  printf("  Compares two files. Floating point numbers are parsed.\n");
  printf("  A maximum error of 0.0 < epsilon < 1.0 is tolerated when comparing.\n");
  return 2;
}

int lex_main(double eps, FILE* f1, FILE* f2) {
  YY_BUFFER_STATE y1 = yy_create_buffer(f1,YY_BUF_SIZE);
  YY_BUFFER_STATE y2 = yy_create_buffer(f2,YY_BUF_SIZE);
  int v1,v2;
  char *s1,*s2;
  int line = 1;
  
  while (1) {
    yy_switch_to_buffer(y1);
    v1 = yylex();
    s1 = strdup(yytext);
    
    yy_switch_to_buffer(y2);
    v2 = yylex();
    s2 = yytext;
    
    if (T_EOF == v1 && T_EOF == v2)
      return 0;
    if (T_EOF == v1) {
      printf("Line %d: Actual file has more input than expected.\n", line);
      return 1;
    }
    if (T_EOF == v2) {
      printf("Line %d: Expected file has more input than actual.\n", line);
      return 1;
    }
    
    if (v1 != v2) {
      printf("Line %d: Lexical token differs:\n< %s\n> %s\n", line, s1, s2);
      return 1;
    }
    
    switch (v1) {
    case T_NEWLINE:
      line++;
      break;
    case T_TEXT:
      if (strcmp(s1,s2)) {
      printf("Line %d: Text differs:\n< %s\n> %s\n", line, s1, s2);
        return 1;
      }
      break;
    case T_REAL: {
      double d1 = strtod(s1,NULL);
      double d2 = strtod(s2,NULL);
      if (fabs(d2-d1) > eps) {
        printf("Line %d: Real %s != %s\n  eps: %f, actual diff: %f\n",
               line, s1, s2, eps, fabs(d2-d1));
        return 1;
      }
      break;
    };
    }
    free(s1);
  }
  printf("done \n");  
}

int main(int argc, char** argv) {
  int retval;
  int line = 1;
  FILE *f1, *f2;
  char* endptr;
  double eps;
  if (argc != 4)
    exit(usage(argv[0],"Wrong number of arguments",""));
  eps = strtod(argv[1],&endptr);
  if (endptr == argv[1] || endptr[0] != '\0' || eps < 0.0 || eps > 1.0)
    exit(usage(argv[0],"Failed to convert epsilon ",argv[1]));
  f1 = fopen(argv[2],"r");
  if (f1 == NULL)
    exit(usage(argv[0],"Failed to open file ",argv[2]));
  f2 = fopen(argv[3],"r");
  if (f2 == NULL)
    exit(usage(argv[0],"Failed to open file ",argv[3]));
  
  return lex_main(eps,f1,f2);
}
