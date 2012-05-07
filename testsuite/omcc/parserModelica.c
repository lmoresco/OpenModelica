
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton implementation for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.4.1"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 189 of yacc.c  */
#line 1 "parserModelica.y"

import Absyn;
/* Type Declarations */
type AstTree = Absyn.Program;
type Token = OMCCTypes.Token;  
type Program = Absyn.Program;
type Within = Absyn.Within;
type lstClass = list<Absyn.Class>;
type Class = Absyn.Class;
type Ident = Absyn.Ident;
type Path = Absyn.Path;
type ClassDef  = Absyn.ClassDef;
type ClassPart = Absyn.ClassPart;
type ClassParts = list<ClassPart>;
type Import  = Absyn.Import;
type ElementItem = Absyn.ElementItem;
type ElementItems = list<Absyn.ElementItem>;
type Element = Absyn.Element;
type ElementSpec = Absyn.ElementSpec;
type ElementAttributes = Absyn.ElementAttributes;
type Comment = Absyn.Comment;
type Direction = Absyn.Direction;
type Exp = Absyn.Exp;
type Exps = list<Exp>;
type Matrix = list<list<Exp>>;
type Subscript = Absyn.Subscript;
type ArrayDim = list<Subscript>;
type Operator = Absyn.Operator;
type Case = Absyn.Case;
type Cases = list<Case>;
type MatchType = Absyn.MatchType;
type Restriction = Absyn.Restriction;
type InnerOuter = Absyn.InnerOuter;
type ComponentRef = Absyn.ComponentRef;
type Variability = Absyn.Variability;
type RedeclareKeywords = Absyn.RedeclareKeywords;
type NamedArg=Absyn.NamedArg;
type TypeSpec=Absyn.TypeSpec;
type TypeSpecs=list<TypeSpec>;
type ComponentItem=Absyn.ComponentItem;
type ComponentItems=list<ComponentItem>;
type Component=Absyn.Component;
type EquationItem = Absyn.EquationItem;
type EquationItems = list<EquationItem>;
type Equation = Absyn.Equation;
type Elseif = tuple<Exp, list<EquationItem>>;
type Elseifs = list<Elseif>;
type ForIterator= Absyn.ForIterator;
type ForIterators = list<ForIterator>; 
type Elsewhen = tuple<Exp, list<EquationItem>>;
type Elsewhens = list<Elsewhen>;
type FunctionArgs = Absyn.FunctionArgs;
type NamedArgs = list<NamedArg>;
type AlgorithmItem = Absyn.AlgorithmItem;
type AlgorithmItems = list<AlgorithmItem>;
type Algorithm = Absyn.Algorithm;
type AlgElseif = tuple<Exp, list<AlgorithmItem>>;
type AlgElseifs = list<AlgElseif>;
type AlgElsewhen = tuple<Exp, list<AlgorithmItem>>;
type AlgElsewhens = list<AlgElsewhen>;
type ExpElseif = tuple<Exp, Exp>;
type ExpElseifs = list<ExpElseif>;
type EnumDef = Absyn.EnumDef;
type EnumLiteral = Absyn.EnumLiteral;
type EnumLiterals = list<EnumLiteral>;
type Modification = Absyn.Modification;
type Boolean3 = tuple<Boolean,Boolean,Boolean>;
type Boolean2 = tuple<Boolean,Boolean>;
type ElementArg = Absyn.ElementArg;
type ElementArgs = list<ElementArg>;
type Each = Absyn.Each;
type EqMod=Absyn.EqMod;
type ComponentCondition = Absyn.ComponentCondition;
type ExternalDecl = Absyn.ExternalDecl;
type Annotation = Absyn.Annotation;
type ConstrainClass= Absyn.ConstrainClass;

constant list<String> lstSemValue3 = {};

constant list<String> lstSemValue = {
   "error", "$undefined", "ALGORITHM", "AND", "ANNOTATION",
  "BLOCK", "CLASS", "CONNECT", "CONNECTOR", "CONSTANT", "DISCRETE", "DER",
  "DEFINEUNIT", "EACH", "ELSE", "ELSEIF", "ELSEWHEN", "END",
  "ENUMERATION", "EQUATION", "ENCAPSULATED", "EXPANDABLE", "EXTENDS",
  "CONSTRAINEDBY", "EXTERNAL", "FALSE", "FINAL", "FLOW", "FOR",
  "FUNCTION", "IF", "IMPORT", "IN", "INITIAL", "INNER", "INPUT",
  "LOOP", "MODEL", "NOT", "OUTER", "OPERATOR", "OVERLOAD", "OR",
  "OUTPUT", "PACKAGE", "PARAMETER", "PARTIAL", "PROTECTED", "PUBLIC",
  "RECORD", "REDECLARE", "REPLACEABLE", "RESULTS", "THEN", "TRUE",
  "TYPE", "REAL", "WHEN", "WHILE", "WITHIN", "RETURN", "BREAK",
  ".", "(", ")", "[", "]", "{", "}", "=",
  "ASSIGN", "COMMA", "COLON", "SEMICOLON", "CODE", "CODE_NAME", "CODE_EXP",
  "CODE_VAR", "PURE", "IMPURE", "Identity", "DIGIT", "INTEGER",
  "*", "-", "+", "<=", "<>", "<", ">",
  ">=", "==", "^", "SLASH", "STRING", ".+", ".-",
  ".*", "./", ".*", "STREAM", "AS", "CASE", "EQUALITY",
  "FAILURE", "GUARD", "LOCAL", "MATCH", "MATCHCONTINUE", "UNIONTYPE",
  "ALLWILD", "WILD", "SUBTYPEOF", "COLONCOLON", "MOD", "ENDIF", "ENDFOR",
  "ENDWHILE", "ENDWHEN", "ENDCLASS", "ENDMATCHCONTINUE", "ENDMATCH",
   "$accept",
  "program", "within", "classes_list", "class", "classprefix",
  "encapsulated", "partial", "restriction", "classdef",
  "classdefenumeration", "classdefderived", "enumeration", "enumlist",
  "enumliteral", "classparts", "classpart", "restClass",
  "algorithmsection", "algorithmitem", "algorithm", "if_algorithm",
  "algelseifs", "algelseif", "when_algorithm", "algelsewhens",
  "algelsewhen", "equationsection", "equationitem", "equation",
  "when_equation", "elsewhens", "elsewhen", "foriterators", "foriterator",
  "if_equation", "elseifs", "elseif", "elementItems", "elementItem",
  "element", "componentclause", "componentitems", "componentitem",
  "component", "modification", "redeclarekeywords", "innerouter",
  "importelementspec", "classelementspec", "import", "elementspec",
  "elementAttr", "variability", "direction", "typespec", "arrayComplex",
  "typespecs", "arraySubscripts", "arrayDim", "functioncall",
  "functionargs", "namedargs", "namedarg", "exp", "matchcont", "if_exp",
  "expelseifs", "expelseif", "matchlocal", "cases", "case", "casearg",
  "simpleExp", "headtail", "rangeExp", "logicexp", "logicterm",
  "logfactor", "relterm", "addterm", "term", "factor", "expElement",
  "tuple", "explist", "explist2", "cref", "woperator", "soperator",
  "power", "relOperator", "path", "ident", "string", "comment"};



/* Line 189 of yacc.c  */
#line 197 "parserModelica.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_ALGORITHM = 258,
     T_AND = 259,
     T_ANNOTATION = 260,
     BLOCK = 261,
     CLASS = 262,
     CONNECT = 263,
     CONNECTOR = 264,
     CONSTANT = 265,
     DISCRETE = 266,
     DER = 267,
     DEFINEUNIT = 268,
     EACH = 269,
     ELSE = 270,
     ELSEIF = 271,
     ELSEWHEN = 272,
     T_END = 273,
     ENUMERATION = 274,
     EQUATION = 275,
     ENCAPSULATED = 276,
     EXPANDABLE = 277,
     EXTENDS = 278,
     CONSTRAINEDBY = 279,
     EXTERNAL = 280,
     T_FALSE = 281,
     FINAL = 282,
     FLOW = 283,
     FOR = 284,
     FUNCTION = 285,
     IF = 286,
     IMPORT = 287,
     T_IN = 288,
     INITIAL = 289,
     INNER = 290,
     T_INPUT = 291,
     LOOP = 292,
     MODEL = 293,
     T_NOT = 294,
     T_OUTER = 295,
     OPERATOR = 296,
     OVERLOAD = 297,
     T_OR = 298,
     T_OUTPUT = 299,
     T_PACKAGE = 300,
     PARAMETER = 301,
     PARTIAL = 302,
     PROTECTED = 303,
     PUBLIC = 304,
     RECORD = 305,
     REDECLARE = 306,
     REPLACEABLE = 307,
     RESULTS = 308,
     THEN = 309,
     T_TRUE = 310,
     TYPE = 311,
     UNSIGNED_REAL = 312,
     WHEN = 313,
     WHILE = 314,
     WITHIN = 315,
     RETURN = 316,
     BREAK = 317,
     DOT = 318,
     LPAR = 319,
     RPAR = 320,
     LBRACK = 321,
     RBRACK = 322,
     LBRACE = 323,
     RBRACE = 324,
     EQUALS = 325,
     ASSIGN = 326,
     COMMA = 327,
     COLON = 328,
     SEMICOLON = 329,
     CODE = 330,
     CODE_NAME = 331,
     CODE_EXP = 332,
     CODE_VAR = 333,
     PURE = 334,
     IMPURE = 335,
     IDENT = 336,
     DIGIT = 337,
     UNSIGNED_INTEGER = 338,
     STAR = 339,
     MINUS = 340,
     PLUS = 341,
     LESSEQ = 342,
     LESSGT = 343,
     LESS = 344,
     GREATER = 345,
     GREATEREQ = 346,
     EQEQ = 347,
     POWER = 348,
     SLASH = 349,
     STRING = 350,
     PLUS_EW = 351,
     MINUS_EW = 352,
     STAR_EW = 353,
     SLASH_EW = 354,
     POWER_EW = 355,
     STREAM = 356,
     AS = 357,
     CASE = 358,
     EQUALITY = 359,
     FAILURE = 360,
     GUARD = 361,
     LOCAL = 362,
     MATCH = 363,
     MATCHCONTINUE = 364,
     UNIONTYPE = 365,
     ALLWILD = 366,
     WILD = 367,
     SUBTYPEOF = 368,
     COLONCOLON = 369,
     MOD = 370,
     ENDIF = 371,
     ENDFOR = 372,
     ENDWHILE = 373,
     ENDWHEN = 374,
     ENDCLASS = 375,
     ENDMATCHCONTINUE = 376,
     ENDMATCH = 377
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 264 of yacc.c  */
#line 361 "parserModelica.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef _STDLIB_H
#      define _STDLIB_H 1
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined _STDLIB_H \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef _STDLIB_H
#    define _STDLIB_H 1
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined _STDLIB_H && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  34
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   1815

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  123
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  127
/* YYNRULES -- Number of rules.  */
#define YYNRULES  337
/* YYNRULES -- Number of states.  */
#define YYNSTATES  593

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   377

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      25,    26,    27,    28,    29,    30,    31,    32,    33,    34,
      35,    36,    37,    38,    39,    40,    41,    42,    43,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    53,    54,
      55,    56,    57,    58,    59,    60,    61,    62,    63,    64,
      65,    66,    67,    68,    69,    70,    71,    72,    73,    74,
      75,    76,    77,    78,    79,    80,    81,    82,    83,    84,
      85,    86,    87,    88,    89,    90,    91,    92,    93,    94,
      95,    96,    97,    98,    99,   100,   101,   102,   103,   104,
     105,   106,   107,   108,   109,   110,   111,   112,   113,   114,
     115,   116,   117,   118,   119,   120,   121,   122
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     5,     8,    12,    15,    19,    25,    30,
      32,    36,    41,    44,    46,    49,    53,    55,    57,    60,
      62,    64,    65,    67,    68,    70,    72,    74,    76,    78,
      80,    82,    84,    86,    89,    91,    94,    96,   103,   108,
     114,   116,   118,   120,   124,   127,   129,   132,   134,   136,
     139,   142,   145,   148,   150,   152,   156,   160,   162,   163,
     165,   166,   168,   169,   172,   176,   182,   184,   187,   195,
     204,   211,   217,   224,   232,   238,   243,   246,   250,   253,
     257,   260,   262,   264,   266,   268,   274,   280,   285,   291,
     299,   306,   315,   317,   320,   325,   331,   338,   340,   343,
     348,   351,   355,   358,   362,   364,   366,   373,   379,   382,
     388,   395,   397,   400,   405,   407,   411,   413,   417,   423,
     431,   438,   445,   454,   462,   464,   467,   472,   474,   477,
     480,   483,   485,   487,   489,   491,   493,   496,   502,   504,
     507,   509,   512,   517,   521,   526,   529,   533,   535,   539,
     542,   546,   549,   553,   556,   559,   562,   564,   566,   570,
     573,   577,   581,   582,   584,   588,   590,   592,   594,   596,
     600,   605,   610,   616,   621,   626,   632,   638,   643,   648,
     652,   655,   658,   660,   661,   663,   665,   668,   670,   672,
     675,   678,   680,   683,   686,   690,   695,   699,   704,   706,
     710,   714,   717,   719,   721,   724,   728,   732,   735,   737,
     739,   741,   743,   745,   747,   750,   753,   757,   759,   763,
     767,   768,   770,   774,   776,   778,   782,   784,   786,   788,
     790,   794,   798,   800,   804,   808,   810,   812,   814,   819,
     825,   830,   836,   843,   851,   853,   856,   861,   864,   866,
     869,   875,   882,   890,   895,   902,   904,   906,   908,   910,
     914,   918,   922,   926,   932,   934,   938,   940,   944,   946,
     949,   951,   955,   957,   960,   964,   966,   970,   972,   976,
     978,   980,   982,   984,   986,   988,   992,   996,  1000,  1003,
    1006,  1009,  1013,  1015,  1017,  1019,  1021,  1025,  1029,  1033,
    1037,  1038,  1040,  1044,  1045,  1048,  1053,  1056,  1058,  1060,
    1062,  1064,  1066,  1068,  1070,  1072,  1074,  1076,  1078,  1080,
    1082,  1084,  1086,  1088,  1090,  1092,  1094,  1096,  1098,  1100,
    1102,  1106,  1109,  1111,  1113,  1115,  1118,  1120
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int16 yyrhs[] =
{
     124,     0,    -1,   126,    -1,   125,   126,    -1,    60,   246,
      74,    -1,   127,    74,    -1,   127,    74,   126,    -1,    27,
     130,   133,    81,   129,    -1,    27,   133,    81,   129,    -1,
     128,    -1,   133,    81,   129,    -1,   130,   133,    81,   129,
      -1,   248,   120,    -1,   120,    -1,   139,   120,    -1,   248,
     139,   120,    -1,   134,    -1,   135,    -1,    21,   131,    -1,
      47,    -1,    47,    -1,    -1,    27,    -1,    -1,     7,    -1,
      38,    -1,    50,    -1,    45,    -1,    56,    -1,    30,    -1,
     110,    -1,     6,    -1,     9,    -1,    22,     9,    -1,    19,
      -1,    41,    50,    -1,    41,    -1,    70,    19,    64,   136,
      65,   249,    -1,    70,   203,   182,   249,    -1,    70,   200,
     203,   182,   249,    -1,   137,    -1,    73,    -1,   138,    -1,
     138,    72,   137,    -1,   247,   249,    -1,   140,    -1,   140,
     139,    -1,   168,    -1,   141,    -1,    49,   143,    -1,    48,
     143,    -1,    20,   144,    -1,     3,   145,    -1,   142,    -1,
     146,    -1,    34,    20,   157,    -1,    34,     3,   148,    -1,
     168,    -1,    -1,   157,    -1,    -1,   148,    -1,    -1,    25,
      74,    -1,    25,   147,    74,    -1,    25,   147,    74,   180,
      74,    -1,   248,    -1,   248,   180,    -1,   248,   240,    70,
     247,    64,   239,    65,    -1,   248,   240,    70,   247,    64,
     239,    65,   180,    -1,   248,   247,    64,   239,    65,   180,
      -1,   248,   247,    64,   239,    65,    -1,   240,    70,   247,
      64,   239,    65,    -1,   240,    70,   247,    64,   239,    65,
     180,    -1,   247,    64,   239,    65,   180,    -1,   247,    64,
     239,    65,    -1,   149,    74,    -1,   149,    74,   148,    -1,
     150,   249,    -1,   224,    71,   215,    -1,   240,   209,    -1,
      61,    -1,    62,    -1,   151,    -1,   154,    -1,    29,   163,
      37,   148,   117,    -1,    59,   215,    37,   148,   118,    -1,
      31,   215,    54,   116,    -1,    31,   215,    54,   148,   116,
      -1,    31,   215,    54,   148,    15,   148,   116,    -1,    31,
     215,    54,   148,   152,   116,    -1,    31,   215,    54,   148,
     152,    15,   148,   116,    -1,   153,    -1,   153,   152,    -1,
      16,   215,    54,   148,    -1,    58,   215,    54,   148,   119,
      -1,    58,   215,    54,   148,   155,   119,    -1,   156,    -1,
     156,   155,    -1,    17,   215,    54,   148,    -1,   158,    74,
      -1,   158,    74,   157,    -1,   159,   249,    -1,   215,    70,
     215,    -1,   165,    -1,   160,    -1,     8,    64,   240,    72,
     240,    65,    -1,    29,   163,    37,   157,   117,    -1,   240,
     209,    -1,    58,   215,    54,   157,   119,    -1,    58,   215,
      54,   157,   161,   119,    -1,   162,    -1,   162,   161,    -1,
      17,   215,    54,   157,    -1,   164,    -1,   164,    72,   163,
      -1,    81,    -1,    81,    33,   215,    -1,    31,   215,    54,
     157,   116,    -1,    31,   215,    54,   157,    15,   157,   116,
      -1,    31,   215,    54,   157,    15,   116,    -1,    31,   215,
      54,   157,   166,   116,    -1,    31,   215,    54,   157,   166,
      15,   157,   116,    -1,    31,   215,    54,   157,   166,    15,
     116,    -1,   167,    -1,   167,   166,    -1,    16,   215,    54,
     157,    -1,   169,    -1,   169,   168,    -1,   170,    74,    -1,
     180,    74,    -1,   173,    -1,   172,    -1,   194,    -1,   197,
      -1,   171,    -1,    13,   247,    -1,    13,   247,    64,   213,
      65,    -1,   195,    -1,    51,   195,    -1,   199,    -1,   193,
     199,    -1,   192,   132,   193,   199,    -1,   192,   132,   199,
      -1,   192,   132,   199,   198,    -1,    27,   199,    -1,    27,
     193,   199,    -1,   175,    -1,   175,    72,   174,    -1,   177,
     249,    -1,   177,   176,   249,    -1,    31,   215,    -1,   247,
     206,   178,    -1,   247,   206,    -1,    70,   215,    -1,    71,
     215,    -1,   179,    -1,   181,    -1,   181,    70,   215,    -1,
       5,   181,    -1,    64,   183,    65,    -1,    64,   183,    65,
      -1,    -1,   184,    -1,   184,    72,   183,    -1,   185,    -1,
     188,    -1,   186,    -1,   187,    -1,   191,   132,   240,    -1,
     191,   132,   240,   178,    -1,   191,   132,   240,   248,    -1,
     191,   132,   240,   178,   248,    -1,    52,   191,   132,   195,
      -1,    52,   191,   132,   189,    -1,    52,   191,   132,   195,
     198,    -1,    52,   191,   132,   189,   198,    -1,    51,   191,
     132,   195,    -1,    51,   191,   132,   189,    -1,   200,   203,
     190,    -1,   203,   190,    -1,   177,   249,    -1,    14,    -1,
      -1,    51,    -1,    52,    -1,    51,    52,    -1,    35,    -1,
      40,    -1,    35,    40,    -1,   196,   249,    -1,   128,    -1,
      52,   128,    -1,    32,   246,    -1,    32,   246,    98,    -1,
      32,   247,    70,   246,    -1,    23,   246,   182,    -1,    23,
     246,   182,   180,    -1,   197,    -1,    24,   246,   182,    -1,
     200,   203,   174,    -1,   203,   174,    -1,   202,    -1,   201,
      -1,   201,   202,    -1,   101,   201,   202,    -1,    28,   201,
     202,    -1,    28,   202,    -1,    28,    -1,    46,    -1,    10,
      -1,    11,    -1,    36,    -1,    44,    -1,   246,   206,    -1,
     246,   204,    -1,    89,   205,    90,    -1,   203,    -1,   203,
      72,   205,    -1,    66,   207,    67,    -1,    -1,   208,    -1,
     208,    72,   207,    -1,   215,    -1,    73,    -1,    64,   210,
      65,    -1,   213,    -1,   211,    -1,   212,    -1,   239,    -1,
     239,    72,   213,    -1,   215,    29,   163,    -1,   214,    -1,
     214,    72,   213,    -1,   247,    70,   215,    -1,   224,    -1,
     217,    -1,   216,    -1,   108,   215,   221,   122,    -1,   108,
     215,   220,   221,   122,    -1,   109,   215,   221,   121,    -1,
     109,   215,   220,   221,   121,    -1,    31,   215,    54,   215,
      15,   215,    -1,    31,   215,    54,   215,   218,    15,   215,
      -1,   219,    -1,   219,   218,    -1,    16,   215,    54,   215,
      -1,   107,   168,    -1,   222,    -1,   222,   221,    -1,   103,
     223,    54,   215,    74,    -1,   103,   223,    20,    54,   215,
      74,    -1,   103,   223,    20,   157,    54,   215,    74,    -1,
      15,    54,   215,    74,    -1,    15,    20,   157,    54,   215,
      74,    -1,   215,    -1,   227,    -1,   226,    -1,   225,    -1,
     247,   102,   224,    -1,   227,   114,   227,    -1,   227,   114,
     225,    -1,   227,    73,   227,    -1,   227,    73,   227,    73,
     227,    -1,   228,    -1,   227,    43,   228,    -1,   229,    -1,
     228,     4,   229,    -1,   230,    -1,    39,   230,    -1,   231,
      -1,   231,   245,   231,    -1,   232,    -1,   241,   232,    -1,
     231,   242,   232,    -1,   233,    -1,   232,   243,   233,    -1,
     234,    -1,   234,   244,   233,    -1,   235,    -1,   240,    -1,
      26,    -1,    55,    -1,   248,    -1,   237,    -1,    68,   239,
      69,    -1,    68,   210,    69,    -1,    66,   236,    67,    -1,
     240,   209,    -1,    12,   209,    -1,    34,   209,    -1,    64,
     215,    65,    -1,    18,    -1,    83,    -1,    57,    -1,   239,
      -1,   239,    74,   236,    -1,    64,   238,    65,    -1,   215,
      72,   215,    -1,   215,    72,   238,    -1,    -1,   215,    -1,
     239,    72,   215,    -1,    -1,   247,   206,    -1,   247,   206,
      63,   240,    -1,    63,   240,    -1,   112,    -1,   111,    -1,
      86,    -1,    85,    -1,    96,    -1,    97,    -1,    86,    -1,
      85,    -1,    96,    -1,    97,    -1,    84,    -1,    94,    -1,
      98,    -1,    99,    -1,    93,    -1,   100,    -1,    89,    -1,
      87,    -1,    90,    -1,    91,    -1,    92,    -1,    88,    -1,
     247,    -1,   247,    63,   246,    -1,    63,   246,    -1,    81,
      -1,    95,    -1,   248,    -1,   248,   180,    -1,   180,    -1,
      -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   257,   257,   259,   263,   267,   268,   275,   277,   279,
     281,   283,   287,   289,   291,   293,   295,   297,   300,   302,
     309,   310,   312,   313,   315,   316,   317,   318,   319,   320,
     321,   322,   323,   324,   325,   326,   327,   331,   334,   336,
     339,   340,   342,   343,   345,   347,   348,   350,   351,   355,
     356,   357,   358,   359,   360,   362,   363,   365,   366,   368,
     369,   371,   372,   374,   375,   376,   379,   380,   381,   382,
     383,   384,   385,   386,   387,   388,   393,   394,   396,   399,
     401,   403,   405,   407,   409,   411,   413,   416,   417,   418,
     419,   420,   422,   423,   425,   427,   429,   432,   433,   435,
     439,   440,   442,   445,   447,   449,   451,   453,   455,   457,
     459,   462,   463,   465,   467,   468,   470,   471,   473,   475,
     477,   479,   481,   483,   486,   487,   489,   493,   494,   497,
     498,   500,   502,   504,   506,   508,   511,   512,   515,   517,
     523,   525,   527,   529,   531,   533,   535,   538,   539,   541,
     542,   544,   546,   547,   549,   550,   551,   553,   555,   558,
     560,   562,   563,   565,   566,   568,   569,   571,   572,   574,
     576,   578,   580,   584,   586,   588,   590,   594,   596,   600,
     603,   607,   609,   610,   612,   613,   614,   616,   617,   618,
     622,   624,   625,   627,   628,   629,   631,   633,   636,   637,
     639,   642,   646,   648,   651,   654,   656,   658,   660,   664,
     665,   666,   669,   670,   675,   676,   678,   680,   681,   683,
     684,   686,   687,   689,   690,   694,   696,   698,   699,   703,
     705,   710,   714,   715,   718,   722,   723,   724,   726,   727,
     728,   729,   732,   733,   735,   736,   738,   741,   743,   744,
     746,   748,   750,   752,   754,   757,   760,   761,   762,   763,
     765,   766,   768,   769,   771,   772,   774,   775,   777,   778,
     780,   781,   783,   784,   785,   787,   788,   790,   791,   793,
     794,   795,   796,   797,   798,   799,   800,   801,   802,   803,
     804,   805,   806,   808,   809,   811,   812,   814,   816,   817,
     818,   820,   821,   822,   824,   825,   826,   827,   828,   830,
     831,   832,   833,   836,   837,   838,   839,   842,   843,   844,
     845,   847,   848,   850,   851,   852,   853,   854,   855,   857,
     858,   859,   861,   863,   865,   866,   867,   868
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "T_ALGORITHM", "T_AND", "T_ANNOTATION",
  "BLOCK", "CLASS", "CONNECT", "CONNECTOR", "CONSTANT", "DISCRETE", "DER",
  "DEFINEUNIT", "EACH", "ELSE", "ELSEIF", "ELSEWHEN", "T_END",
  "ENUMERATION", "EQUATION", "ENCAPSULATED", "EXPANDABLE", "EXTENDS",
  "CONSTRAINEDBY", "EXTERNAL", "T_FALSE", "FINAL", "FLOW", "FOR",
  "FUNCTION", "IF", "IMPORT", "T_IN", "INITIAL", "INNER", "T_INPUT",
  "LOOP", "MODEL", "T_NOT", "T_OUTER", "OPERATOR", "OVERLOAD", "T_OR",
  "T_OUTPUT", "T_PACKAGE", "PARAMETER", "PARTIAL", "PROTECTED", "PUBLIC",
  "RECORD", "REDECLARE", "REPLACEABLE", "RESULTS", "THEN", "T_TRUE",
  "TYPE", "UNSIGNED_REAL", "WHEN", "WHILE", "WITHIN", "RETURN", "BREAK",
  "DOT", "LPAR", "RPAR", "LBRACK", "RBRACK", "LBRACE", "RBRACE", "EQUALS",
  "ASSIGN", "COMMA", "COLON", "SEMICOLON", "CODE", "CODE_NAME", "CODE_EXP",
  "CODE_VAR", "PURE", "IMPURE", "IDENT", "DIGIT", "UNSIGNED_INTEGER",
  "STAR", "MINUS", "PLUS", "LESSEQ", "LESSGT", "LESS", "GREATER",
  "GREATEREQ", "EQEQ", "POWER", "SLASH", "STRING", "PLUS_EW", "MINUS_EW",
  "STAR_EW", "SLASH_EW", "POWER_EW", "STREAM", "AS", "CASE", "EQUALITY",
  "FAILURE", "GUARD", "LOCAL", "MATCH", "MATCHCONTINUE", "UNIONTYPE",
  "ALLWILD", "WILD", "SUBTYPEOF", "COLONCOLON", "MOD", "ENDIF", "ENDFOR",
  "ENDWHILE", "ENDWHEN", "ENDCLASS", "ENDMATCHCONTINUE", "ENDMATCH",
  "$accept", "program", "within", "classes_list", "class2", "class",
  "classdef", "classprefix", "partial", "final", "restriction",
  "classdefenumeration", "classdefderived", "enumeration", "enumlist",
  "enumliteral", "classparts", "classpart", "restClass", "initialClass",
  "optelement", "optequationsection", "optalgorithmsection", "external",
  "externalDecl", "algorithmsection", "algorithmitem", "algorithm",
  "if_algorithm", "algelseifs", "algelseif", "when_algorithm",
  "algelsewhens", "algelsewhen", "equationsection", "equationitem",
  "equation", "when_equation", "elsewhens", "elsewhen", "foriterators",
  "foriterator", "if_equation", "elseifs", "elseif", "elementItems",
  "elementItem", "element", "unitclause", "classElement2",
  "componentclause", "componentitems", "componentitem",
  "componentcondition", "component", "modification", "class_modification",
  "annotation", "elementargs", "elementargs2", "argumentlist",
  "elementarg", "element_mod_rep", "element_mod", "element_rep",
  "element_redec", "elementspec2", "componentitems2", "eachprefix",
  "redeclarekeywords", "innerouter", "importelementspec",
  "classelementspec", "import", "extends", "constraining_clause",
  "elementspec", "elementAttr", "variability", "direction", "typespec",
  "arrayComplex", "typespecs", "arraySubscripts", "arrayDim", "subscript",
  "functioncall", "functionargs", "functionargs2", "functionargs3",
  "namedargs", "namedarg", "exp", "matchcont", "if_exp", "expelseifs",
  "expelseif", "matchlocal", "cases", "case", "casearg", "simpleExp",
  "headtail", "rangeExp", "logicexp", "logicterm", "logfactor", "relterm",
  "addterm", "term", "factor", "expElement", "number", "matrix", "tuple",
  "explist", "explist2", "cref", "unoperator", "woperator", "soperator",
  "power", "relOperator", "path", "ident", "string", "comment", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,   280,   281,   282,   283,   284,
     285,   286,   287,   288,   289,   290,   291,   292,   293,   294,
     295,   296,   297,   298,   299,   300,   301,   302,   303,   304,
     305,   306,   307,   308,   309,   310,   311,   312,   313,   314,
     315,   316,   317,   318,   319,   320,   321,   322,   323,   324,
     325,   326,   327,   328,   329,   330,   331,   332,   333,   334,
     335,   336,   337,   338,   339,   340,   341,   342,   343,   344,
     345,   346,   347,   348,   349,   350,   351,   352,   353,   354,
     355,   356,   357,   358,   359,   360,   361,   362,   363,   364,
     365,   366,   367,   368,   369,   370,   371,   372,   373,   374,
     375,   376,   377
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,   123,   124,   124,   125,   126,   126,   127,   127,   127,
     128,   128,   129,   129,   129,   129,   129,   129,   130,   130,
     131,   131,   132,   132,   133,   133,   133,   133,   133,   133,
     133,   133,   133,   133,   133,   133,   133,   134,   135,   135,
     136,   136,   137,   137,   138,   139,   139,   140,   140,   141,
     141,   141,   141,   141,   141,   142,   142,   143,   143,   144,
     144,   145,   145,   146,   146,   146,   147,   147,   147,   147,
     147,   147,   147,   147,   147,   147,   148,   148,   149,   150,
     150,   150,   150,   150,   150,   150,   150,   151,   151,   151,
     151,   151,   152,   152,   153,   154,   154,   155,   155,   156,
     157,   157,   158,   159,   159,   159,   159,   159,   159,   160,
     160,   161,   161,   162,   163,   163,   164,   164,   165,   165,
     165,   165,   165,   165,   166,   166,   167,   168,   168,   169,
     169,   170,   170,   170,   170,   170,   171,   171,   172,   172,
     173,   173,   173,   173,   173,   173,   173,   174,   174,   175,
     175,   176,   177,   177,   178,   178,   178,   179,   179,   180,
     181,   182,   182,   183,   183,   184,   184,   185,   185,   186,
     186,   186,   186,   187,   187,   187,   187,   188,   188,   189,
     189,   190,   191,   191,   192,   192,   192,   193,   193,   193,
     194,   195,   195,   196,   196,   196,   197,   197,   198,   198,
     199,   199,   200,   200,   200,   200,   200,   200,   200,   201,
     201,   201,   202,   202,   203,   203,   204,   205,   205,   206,
     206,   207,   207,   208,   208,   209,   210,   210,   210,   211,
     211,   212,   213,   213,   214,   215,   215,   215,   216,   216,
     216,   216,   217,   217,   218,   218,   219,   220,   221,   221,
     222,   222,   222,   222,   222,   223,   224,   224,   224,   224,
     225,   225,   226,   226,   227,   227,   228,   228,   229,   229,
     230,   230,   231,   231,   231,   232,   232,   233,   233,   234,
     234,   234,   234,   234,   234,   234,   234,   234,   234,   234,
     234,   234,   234,   235,   235,   236,   236,   237,   238,   238,
     238,   239,   239,   239,   240,   240,   240,   240,   240,   241,
     241,   241,   241,   242,   242,   242,   242,   243,   243,   243,
     243,   244,   244,   245,   245,   245,   245,   245,   245,   246,
     246,   246,   247,   248,   249,   249,   249,   249
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     1,     2,     3,     2,     3,     5,     4,     1,
       3,     4,     2,     1,     2,     3,     1,     1,     2,     1,
       1,     0,     1,     0,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     2,     1,     2,     1,     6,     4,     5,
       1,     1,     1,     3,     2,     1,     2,     1,     1,     2,
       2,     2,     2,     1,     1,     3,     3,     1,     0,     1,
       0,     1,     0,     2,     3,     5,     1,     2,     7,     8,
       6,     5,     6,     7,     5,     4,     2,     3,     2,     3,
       2,     1,     1,     1,     1,     5,     5,     4,     5,     7,
       6,     8,     1,     2,     4,     5,     6,     1,     2,     4,
       2,     3,     2,     3,     1,     1,     6,     5,     2,     5,
       6,     1,     2,     4,     1,     3,     1,     3,     5,     7,
       6,     6,     8,     7,     1,     2,     4,     1,     2,     2,
       2,     1,     1,     1,     1,     1,     2,     5,     1,     2,
       1,     2,     4,     3,     4,     2,     3,     1,     3,     2,
       3,     2,     3,     2,     2,     2,     1,     1,     3,     2,
       3,     3,     0,     1,     3,     1,     1,     1,     1,     3,
       4,     4,     5,     4,     4,     5,     5,     4,     4,     3,
       2,     2,     1,     0,     1,     1,     2,     1,     1,     2,
       2,     1,     2,     2,     3,     4,     3,     4,     1,     3,
       3,     2,     1,     1,     2,     3,     3,     2,     1,     1,
       1,     1,     1,     1,     2,     2,     3,     1,     3,     3,
       0,     1,     3,     1,     1,     3,     1,     1,     1,     1,
       3,     3,     1,     3,     3,     1,     1,     1,     4,     5,
       4,     5,     6,     7,     1,     2,     4,     2,     1,     2,
       5,     6,     7,     4,     6,     1,     1,     1,     1,     3,
       3,     3,     3,     5,     1,     3,     1,     3,     1,     2,
       1,     3,     1,     2,     3,     1,     3,     1,     3,     1,
       1,     1,     1,     1,     1,     3,     3,     3,     2,     2,
       2,     3,     1,     1,     1,     1,     3,     3,     3,     3,
       0,     1,     3,     0,     2,     4,     2,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       1,     1,     1,     1,     1,     1,     1,     1,     1,     1,
       3,     2,     1,     1,     1,     2,     1,     0
};

/* YYDEFACT[STATE-NAME] -- Default rule to reduce with in state
   STATE-NUM when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint16 yydefact[] =
{
       0,    31,    24,    32,    34,    21,     0,     0,    29,    25,
      36,    27,    19,    26,    28,     0,    30,     0,     0,     2,
       0,     9,     0,     0,    20,    18,    33,     0,     0,    35,
       0,   332,     0,   329,     1,     3,     5,     0,     0,     0,
       0,   331,     4,     0,     6,     0,    62,     0,   210,   211,
       0,    60,     0,     0,     0,   208,     0,     0,   187,   212,
     188,   213,   209,    58,    58,   184,   185,     0,   333,     0,
      13,   191,    10,    16,    17,     0,    45,    48,    53,    54,
      47,   127,     0,   135,   132,   131,     0,    23,     0,   133,
     138,   337,   134,   140,     0,   203,   202,     0,   220,     0,
       0,     8,   330,    11,     0,   292,   281,     0,     0,     0,
       0,   282,   294,     0,     0,    81,    82,     0,   300,   303,
     303,   293,   310,   309,   311,   312,   308,   307,    52,    61,
       0,   337,    83,    84,     0,   258,   257,   256,   264,   266,
     268,   270,   272,   275,   277,   279,   284,   280,     0,   220,
     283,   183,   159,   136,     0,     0,     0,     0,     0,     0,
      51,    59,     0,   337,   105,   104,     0,   237,   236,   235,
     280,   162,    63,     0,     0,   220,    66,     0,   145,     0,
     207,   193,   329,     0,     0,   189,    50,    57,    49,   186,
     139,   192,     0,     0,   162,     0,    14,    46,   128,   129,
     130,    22,     0,   141,   336,   334,   190,     0,   204,   201,
     147,   337,   220,     0,     0,   215,   214,    12,     0,     7,
     303,   289,   116,     0,   114,     0,     0,   280,   290,   269,
     220,     0,     0,   306,     0,     0,   301,     0,   295,     0,
     227,   228,   226,   232,   301,     0,   220,    76,    78,     0,
       0,     0,     0,     0,   314,   313,   324,   328,   323,   325,
     326,   327,   315,   316,     0,     0,   317,   318,   319,   320,
       0,   321,   322,     0,   288,   273,     0,   304,   182,   183,
     183,     0,   163,   165,   167,   168,   166,    23,     0,     0,
       0,     0,     0,     0,     0,   100,   102,     0,   288,   183,
     196,    64,     0,   303,    67,     0,   220,   146,   206,   194,
       0,    56,    55,     0,   162,   337,   205,     0,   143,   335,
     200,     0,     0,   337,   149,   153,   224,     0,   221,   223,
     217,     0,    15,     0,   229,     0,     0,     0,     0,     0,
     288,     0,     0,   291,   300,   297,   287,     0,   303,   286,
       0,     0,   285,     0,     0,    77,    79,   265,   262,   261,
     260,   267,   274,   271,   276,   278,   259,     0,    23,    23,
     160,   183,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   248,     0,     0,   101,   103,     0,
     197,     0,     0,     0,     0,   303,   195,    41,     0,    40,
      42,   337,   337,    38,   142,     0,   198,   144,   148,   151,
     150,     0,     0,   152,   156,   157,   219,     0,     0,   216,
     225,   117,     0,   115,     0,    87,     0,     0,     0,   298,
     299,   302,   296,   233,   231,   230,   234,     0,   305,     0,
       0,   164,   169,   137,     0,     0,     0,     0,     0,     0,
       0,   255,     0,   247,     0,   238,   249,     0,   240,   161,
      65,   303,    75,     0,     0,   337,     0,    44,    39,   162,
     154,   155,     0,   222,   218,    85,     0,     0,     0,    88,
       0,    92,     0,    95,     0,    97,    86,   263,     0,   178,
     177,     0,     0,   174,   173,   170,   171,     0,   107,     0,
       0,   118,     0,   124,     0,     0,     0,   244,     0,   109,
       0,   111,     0,     0,     0,     0,   239,   241,     0,    74,
     303,    71,    37,    43,   199,   158,     0,     0,     0,    90,
      93,     0,    96,    98,     0,   337,   180,   176,   175,   172,
     106,   120,     0,     0,     0,   121,   125,   242,     0,     0,
     245,     0,   110,   112,     0,   253,     0,     0,     0,    72,
       0,    70,    89,     0,     0,     0,   179,   181,   119,     0,
     123,     0,     0,   243,     0,     0,     0,     0,   250,    73,
      68,    94,    91,    99,   126,   122,   246,   113,   254,   251,
       0,    69,   252
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,    17,    18,    19,    20,    71,    72,    22,    25,   202,
      23,    73,    74,   398,   399,   400,    75,    76,    77,    78,
     186,   160,   128,    79,   173,   129,   130,   131,   132,   480,
     481,   133,   484,   485,   161,   162,   163,   164,   510,   511,
     223,   224,   165,   502,   503,    80,    81,    82,    83,    84,
      85,   209,   210,   323,   211,   413,   414,    86,   415,   300,
     281,   282,   283,   284,   285,   286,   489,   536,   287,    87,
      88,    89,    90,    91,    92,   407,    93,    94,    95,    96,
      97,   215,   331,   277,   327,   328,   221,   239,   240,   241,
     242,   243,   166,   167,   168,   506,   507,   382,   383,   384,
     452,   169,   135,   136,   137,   138,   139,   140,   141,   142,
     143,   144,   145,   237,   146,   235,   238,   227,   148,   264,
     270,   273,   265,    98,   149,   150,   206
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -454
static const yytype_int16 yypact[] =
{
    1368,  -454,  -454,  -454,  -454,    48,    41,  1485,  -454,  -454,
      33,  -454,  -454,  -454,  -454,    30,  -454,   117,  1410,  -454,
     123,  -454,   207,   110,  -454,  -454,  -454,   207,   131,  -454,
      30,  -454,   144,   101,  -454,  -454,  1410,   141,   818,   146,
     818,  -454,  -454,    30,  -454,   818,  1513,   183,  -454,  -454,
     197,  1226,    30,   130,   445,   298,    30,    79,   248,  -454,
    -454,  -454,  -454,  1020,  1020,  1443,  1485,   538,  -454,   224,
    -454,  -454,  -454,  -454,  -454,   198,   972,  -454,  -454,  -454,
    -454,  1020,   249,  -454,  -454,  -454,   269,   328,  1136,  -454,
    -454,    26,  -454,  -454,    30,   238,  -454,   197,    83,   895,
     818,  -454,  -454,  -454,   295,  -454,  -454,   283,  1602,   295,
    1703,  -454,  -454,  1602,  1602,  -454,  -454,   121,  1602,  1602,
    1602,  -454,  -454,  -454,  -454,  -454,  -454,  -454,  -454,  -454,
     293,    26,  -454,  -454,   297,  -454,  -454,     1,   365,  -454,
    -454,   615,   187,  -454,   222,  -454,  -454,   295,  1185,   -24,
    -454,   155,  -454,   315,   321,   283,  1602,  1602,  1602,  1602,
    -454,  -454,   312,    26,  -454,  -454,   320,  -454,  -454,  -454,
     295,   327,  -454,   319,   325,   285,    44,  1136,  -454,   238,
    -454,   301,   217,  1513,  1226,  -454,  -454,  -454,  -454,  1485,
    -454,  -454,   332,    30,   327,   238,  -454,  -454,  -454,  -454,
    -454,  -454,   445,  -454,  -454,   395,  -454,   197,  -454,  -454,
     329,    63,   339,  1566,    30,  -454,  -454,  -454,   286,  -454,
    1602,  -454,   376,   373,   341,  1602,   364,   295,  -454,  -454,
     339,   366,   382,  -454,   235,   357,  -454,   356,   288,   355,
    -454,  -454,  -454,   354,   398,    90,   170,  1513,  -454,  1602,
    1668,  1668,  1668,  1668,  -454,  -454,  -454,  -454,  -454,  -454,
    -454,  -454,  -454,  -454,  1185,  1703,  -454,  -454,  -454,  -454,
    1185,  -454,  -454,  1185,   100,   187,  1668,   367,  -454,   414,
     414,   368,   362,  -454,  -454,  -454,  -454,   328,   197,   121,
     392,   381,   384,     9,     9,  1226,  -454,  1602,   129,   155,
     395,   395,   197,  1602,  -454,   371,   299,  -454,  -454,  -454,
      30,  -454,  -454,   216,   327,    26,  -454,  1136,   158,  -454,
    -454,   197,  1602,    26,  -454,   265,  -454,   378,   374,  -454,
     377,   358,  -454,   385,   379,  1602,  1513,   283,   400,  1074,
    -454,  1513,  1513,  -454,  1602,  -454,  -454,  1602,  1602,  -454,
     197,   283,  -454,  1602,  1602,  -454,  -454,   365,    66,  -454,
      -6,  -454,   187,   134,  -454,  -454,  -454,   121,   328,   328,
    -454,   155,   121,   387,   388,   389,  1226,  1226,  1226,    65,
    1602,  1020,    47,   337,    47,    47,   342,  -454,  -454,   399,
    -454,   386,   401,   274,   197,  1602,  -454,  -454,   402,  -454,
     394,    26,    26,  -454,  -454,    30,  -454,  -454,  -454,  -454,
    -454,  1602,  1602,  -454,  -454,   404,  -454,  1566,    30,  -454,
    -454,  -454,   353,  -454,  1602,  -454,    20,    -1,   361,   412,
    -454,  -454,  -454,  -454,  -454,  -454,  -454,  1668,  -454,  1320,
    1320,  -454,   180,  -454,   121,   359,    45,    74,    13,  1226,
    1602,  -454,   174,  -454,   370,  -454,  -454,   372,  -454,  -454,
    -454,  1602,   395,   422,   275,    26,   197,  -454,  -454,   327,
    -454,  -454,  1602,  -454,  -454,  -454,   244,  1513,  1602,  -454,
      12,   471,  1602,  -454,   369,   479,  -454,   454,  1485,  -454,
    -454,    30,   197,   158,   158,   406,  -454,   437,  -454,   565,
    1602,  -454,    36,   487,  1602,  1602,   489,   490,  1602,  -454,
     390,   488,   456,   438,  1150,  1602,  -454,  -454,   276,  -454,
    1602,   395,  -454,  -454,  -454,  -454,   397,   457,  1513,  -454,
    -454,   461,  -454,  -454,   197,    26,  -454,  -454,  -454,  -454,
    -454,  -454,   405,   462,   660,  -454,  -454,  -454,   464,  1602,
    -454,   466,  -454,  -454,  1602,  -454,  1602,   468,   450,   395,
     289,  -454,  -454,  1513,   413,  1513,  -454,  -454,  -454,  1226,
    -454,   416,  1602,  -454,  1226,   459,   460,  1602,  -454,  -454,
     395,  -454,  -454,  -454,  -454,  -454,  -454,  -454,  -454,  -454,
     465,  -454,  -454
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -454,  -454,  -454,    78,  -454,    11,    24,   528,  -454,  -222,
     292,  -454,  -454,  -454,    70,  -454,   163,  -454,  -454,  -454,
     474,  -454,  -454,  -454,  -454,  -171,  -454,  -454,  -454,    59,
    -454,  -454,    56,  -454,  -112,  -454,  -454,  -454,    31,  -454,
    -152,  -454,  -454,    40,  -454,   -43,  -454,  -454,  -454,  -454,
    -454,  -188,  -454,  -454,  -453,   102,  -454,    10,   500,  -192,
    -265,  -454,  -454,  -454,  -454,  -454,   111,    16,     4,  -454,
     -45,  -454,   -51,  -454,  -305,  -166,   -48,   -57,    98,    -3,
     -66,  -454,   135,   -72,   137,  -454,   -84,   336,  -454,  -454,
    -190,  -454,   258,  -454,  -454,    51,  -454,   266,  -207,  -454,
    -454,   -38,   300,  -454,  -229,   309,   310,   452,   302,  -133,
     -12,  -454,  -454,   220,  -454,   221,  -116,   -46,  -454,  -454,
    -454,  -454,  -454,     2,     3,    35,   -21
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If zero, do what YYDEFACT says.
   If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -109
static const yytype_int16 yytable[] =
{
     147,   194,   315,   290,   245,   170,   178,   174,   134,   177,
     193,    21,   311,   406,   190,   275,   482,    32,    33,   320,
     187,   187,   358,   360,   379,   228,   216,   528,   207,    21,
     508,    47,    41,    33,   389,   477,   478,   250,   198,   535,
     203,    33,   213,    33,   250,   102,    33,    21,    33,    47,
      26,   544,   180,   153,   171,    33,   175,    33,   181,   182,
     499,   500,   379,   274,   101,   372,    33,    33,    47,   103,
      33,   233,   312,    99,   251,    99,   355,   191,   276,    33,
      99,   535,   183,    29,    33,   449,   298,   386,   176,   504,
     505,    33,   208,    30,   322,    24,    35,    33,   373,   184,
     212,   204,    33,    33,   334,   -80,   441,   117,   252,   250,
     248,    31,   380,   230,    44,   252,   381,    34,   483,   450,
     230,    68,   402,   246,   219,    31,   205,   314,   529,   307,
     305,   362,   509,   408,  -108,    99,   479,   147,   170,   437,
     325,   204,   296,   340,   297,   134,   439,   440,   330,   213,
     380,   230,   545,   179,   318,   126,   127,   317,    68,   352,
     433,   501,   353,   435,    43,   422,   205,   195,   426,   278,
     427,   428,   214,   204,   -80,   454,   308,   456,   457,   306,
      33,    52,   405,   387,   117,   423,   304,   393,   406,   406,
     324,    38,   316,   117,   514,   -80,    33,    36,   205,   434,
     191,   147,    31,  -108,   172,    33,   279,   280,   487,   134,
     212,    31,    40,     1,     2,   319,     3,    33,    42,   254,
     255,   204,    45,   246,  -108,    68,     4,   100,   515,     6,
     262,   263,   126,   127,    48,    49,   213,     8,   366,   197,
     354,   126,   127,   375,   151,     9,   205,   151,    10,   170,
     411,   412,    11,   230,   230,   230,   230,    13,   364,   504,
     505,   365,   218,    14,   445,   446,   448,   230,   230,   404,
      62,   266,   276,   230,    59,    68,   230,   524,    31,   464,
      43,   267,    61,   368,   369,   268,   269,   310,   185,   397,
     147,   374,   230,   147,   403,   147,   147,    31,   134,    28,
     343,   134,   410,   134,   134,   392,   526,   344,    48,    49,
     390,   391,   396,    33,    37,   271,   401,    16,   196,    39,
      33,   438,   272,   199,   212,   204,   442,   537,   538,   151,
     170,   170,   170,   204,    59,   411,   412,   512,   453,   462,
     521,   559,    61,   200,    62,   518,   347,   347,   347,   303,
     205,   213,   330,   374,   580,   201,   246,   564,   205,   220,
     347,   347,   348,   395,   222,   213,   226,   247,   249,   253,
     230,   231,   232,   492,   492,   230,   234,   236,   244,   288,
     467,   468,   491,   491,    33,   289,   295,   542,   490,   494,
     297,   299,   581,   301,   583,   302,   313,   463,   497,   309,
      47,   321,   557,   170,   560,   213,   332,   469,    33,   335,
     336,   204,   204,   337,   291,   292,   293,   294,   339,   342,
     341,    33,   345,   346,   349,   534,   350,   351,   278,   376,
     367,   147,   571,   370,   371,   377,   205,   205,   378,   134,
     230,   394,    33,    33,   522,   416,   417,   230,   419,   418,
     420,   353,   443,   170,   424,    48,    49,   584,   354,   455,
     460,   444,   587,   458,   459,   461,   466,   465,   170,   401,
     475,   329,   519,    55,   472,   204,   498,   496,   244,   486,
      58,    59,   147,   338,   344,    60,   520,   478,   532,    61,
     134,    62,   516,   517,    33,   212,   482,   250,   170,   191,
     205,    68,   540,   500,   549,   508,   505,   356,    30,   552,
     554,   563,   555,   562,   567,   565,   569,   147,   572,   147,
     574,   568,   577,   170,   578,   134,    31,   134,   170,   582,
     539,   561,   585,   588,   589,    27,   523,   212,   188,   592,
     530,   533,   553,   546,   495,   204,    69,   152,    48,    49,
     566,   493,   359,   474,   473,   388,   333,   192,   550,   357,
     385,   236,   229,   361,     0,   430,    55,   363,   432,   579,
     205,     0,     0,   154,    59,     0,     0,   104,     0,     0,
     409,     0,    61,   105,    62,     0,     0,     0,     0,     0,
     591,   106,     0,   421,   155,     0,   156,     0,     0,   109,
       0,    30,   429,     0,   110,   431,   236,     0,     0,     0,
       0,   431,   436,     0,     0,     0,     0,     0,     0,    31,
     111,     0,   112,   157,     0,     0,     0,     0,   117,   118,
       0,   119,     0,   120,     0,   447,     0,     0,   451,    69,
       0,     0,     0,     0,     0,     0,    31,     0,   121,     0,
     122,   123,     0,   236,     0,     0,     0,     0,     0,     0,
      68,   124,   125,     0,     0,     0,     0,     0,   154,   470,
     471,     0,   104,   158,   159,   329,   126,   127,   105,     0,
       0,   541,   476,     0,     0,     0,   106,     0,     0,   155,
       0,   156,     0,     0,   109,     0,     0,     0,     0,   110,
     254,   255,   256,   257,   258,   259,   260,   261,   513,     0,
       0,   262,   263,     0,     0,   111,     0,   112,   157,   236,
       0,     0,     0,   117,   118,     0,   119,     0,   120,     0,
     525,     0,     0,     0,     0,     0,   527,     0,     0,     0,
     531,    31,     0,   121,     0,   122,   123,     0,     0,     0,
       0,     0,     0,     0,     0,    68,   124,   125,   543,     0,
       0,     0,   547,   548,     0,     0,   551,     0,   158,   159,
       0,   126,   127,   558,     0,     0,   570,     0,   236,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,   573,     0,     0,
       0,     0,   575,     0,   576,     0,     0,     0,     0,     0,
       0,    46,     0,    47,     1,     2,     0,     3,    48,    49,
     586,    50,     0,     0,     0,   590,     0,     4,    51,     5,
       6,    52,     0,    53,     0,    54,    55,     0,     8,     0,
      56,     0,    57,    58,    59,     0,     9,     0,    60,    10,
       0,     0,    61,    11,    62,    12,    63,    64,    13,    65,
      66,     0,     0,     0,    14,     0,     0,     0,     0,     0,
       0,    30,     0,     0,     0,     0,     0,     0,    67,     0,
       0,     0,     0,     0,     0,     0,     0,     0,    46,    31,
      47,     1,     2,     0,     3,    48,    49,     0,    50,     0,
       0,     0,     0,    68,     4,    51,     5,     6,    52,    69,
      53,     0,    54,    55,     0,     8,     0,    56,    16,    57,
      58,    59,     0,     9,     0,    60,    10,     0,    70,    61,
      11,    62,    12,    63,    64,    13,    65,    66,     0,     0,
       0,    14,     0,     0,     0,     0,     0,     0,    30,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,    46,    31,    47,     1,     2,
       0,     3,    48,    49,     0,    50,     0,     0,     0,     0,
       0,     4,    51,     5,     6,    52,    69,    53,     0,    54,
      55,     0,     8,     0,    56,    16,    57,    58,    59,     0,
       9,     0,    60,    10,     0,   217,    61,    11,    62,    12,
      63,    64,    13,    65,    66,    47,     1,     2,    14,     3,
      48,    49,     0,    50,     0,    30,     0,     0,     0,     4,
       0,     5,     6,    52,     0,     0,     0,    54,    55,     0,
       8,     0,    56,    31,     0,    58,    59,     0,     9,     0,
      60,    10,     0,     0,    61,    11,    62,    12,     0,     0,
      13,    65,    66,    69,     0,     0,    14,     0,     0,     0,
       0,     0,    16,    30,     0,     0,   104,     0,     0,     0,
       0,     0,   105,     0,     0,     0,     0,     0,     0,     0,
     106,    31,     0,   107,     0,   108,     0,     0,   109,     0,
       0,     0,     0,   110,     0,     0,     0,     0,     0,     0,
       0,    69,     0,     0,     0,     0,     0,     0,     0,   111,
      16,   112,   113,   114,     0,   115,   116,   117,   118,     0,
     119,     0,   120,     0,     0,     0,    48,    49,     0,     0,
       0,     0,     0,     0,     0,    31,     0,   121,   154,   122,
     123,     0,   104,     0,    55,     0,     0,     0,   105,    68,
     124,   125,    59,     0,     0,     0,   106,     0,     0,   155,
      61,   156,    62,     0,   109,   126,   127,     0,     0,   110,
     425,     0,     0,     0,     0,     0,     0,   104,     0,    30,
       0,     0,     0,   105,   556,   111,     0,   112,   157,     0,
       0,   106,     0,   117,   118,     0,   119,    31,   120,   109,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,    31,     0,   121,   154,   122,   123,    69,   104,     0,
     111,     0,   112,     0,   105,    68,   124,   125,   117,   118,
       0,   119,   106,   120,     0,   155,     0,   156,   158,   159,
     109,   126,   127,     0,     0,   110,    31,     0,   121,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,     0,
      68,   111,     0,   112,   157,     0,     0,     0,     0,   117,
     118,     0,   119,     0,   120,     0,   126,   127,     0,     0,
       0,     0,     0,     0,     0,     0,     0,    31,     0,   121,
       0,   122,   123,     0,     0,     0,     0,     0,     0,     0,
       0,    68,   124,   125,     0,     0,     1,     2,     0,     3,
      48,    49,     0,     0,   158,   159,     0,   126,   127,     4,
       0,     5,     6,     0,     0,     0,     0,     0,    55,     0,
       8,     0,     0,     0,     0,     0,    59,     0,     9,     0,
       0,    10,     0,     0,    61,    11,    62,    12,     0,     0,
      13,     0,   488,     0,     1,     2,    14,     3,     0,     0,
       0,     0,     0,    30,     0,     0,     0,     4,     0,     5,
       6,     0,     0,     0,     0,     7,     0,     0,     8,     0,
       0,    31,     0,     0,     0,     0,     9,     0,     0,    10,
       0,     0,     0,    11,     0,    12,     1,     2,    13,     3,
       0,    69,     0,     0,    14,     0,     0,     0,    15,     4,
      16,     5,     6,     0,     0,     0,     0,     7,     0,     0,
       8,     0,     0,     0,     0,     0,     0,     0,     9,     1,
       2,    10,     3,     0,     0,    11,     0,    12,     0,     0,
      13,     0,     4,     0,     5,     6,    14,     0,     0,     0,
       0,     0,     0,     8,     0,     0,     0,     0,    16,     0,
       0,     9,     0,     0,    10,     0,     0,     0,    11,     0,
      12,     1,     2,    13,     3,   189,     0,     0,     0,    14,
       0,     0,     0,     0,     4,     0,     5,     6,     0,     0,
       0,     0,     0,     0,     0,     8,     0,     0,     0,     0,
      16,     0,     0,     9,     0,   104,    10,     0,     0,     0,
      11,   105,    12,     0,     0,    13,     0,     0,     0,   106,
       0,    14,   107,     0,   108,     0,     0,   109,     0,     0,
       0,     0,   110,    16,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,   111,     0,
     112,   113,   114,     0,   115,   116,   117,   118,   104,   119,
       0,   120,     0,     0,   105,     0,     0,     0,     0,     0,
       0,     0,   106,     0,    31,    16,   121,   225,   122,   123,
     109,     0,     0,     0,     0,   110,     0,     0,    68,   124,
     125,     0,     0,     0,   104,     0,     0,     0,     0,     0,
     105,   111,     0,   112,   126,   127,     0,     0,   106,   117,
     118,     0,   119,   225,   120,     0,   109,     0,     0,   326,
       0,   110,     0,     0,     0,     0,     0,    31,     0,   121,
       0,   122,   123,     0,     0,     0,     0,   111,     0,   112,
       0,    68,   124,   125,     0,   117,   118,     0,   119,     0,
     120,     0,     0,     0,   158,   159,     0,   126,   127,     0,
     104,     0,     0,    31,     0,   121,   105,   122,   123,     0,
       0,     0,     0,     0,   106,     0,     0,    68,   124,   125,
       0,     0,   109,     0,     0,     0,     0,   110,     0,     0,
     158,   159,     0,   126,   127,   104,     0,     0,     0,     0,
       0,   105,     0,   111,     0,   112,     0,     0,     0,   106,
       0,   117,   118,     0,   119,     0,   120,   109,     0,     0,
       0,     0,     0,     0,     0,     0,     0,     0,     0,    31,
       0,   121,     0,   122,   123,     0,     0,     0,   111,     0,
     112,     0,     0,    68,   124,   125,   117,   118,     0,   119,
       0,   120,     0,     0,     0,     0,     0,     0,     0,   126,
     127,     0,     0,     0,    31,     0,   121,     0,   122,   123,
       0,     0,     0,     0,     0,     0,     0,     0,    68,   124,
     125,     0,     0,     0,     0,     0,     0,     0,     0,     0,
       0,     0,     0,     0,   126,   127
};

static const yytype_int16 yycheck[] =
{
      46,    67,   194,   155,   120,    51,    54,    53,    46,    54,
      67,     0,   183,   318,    65,   148,    17,    15,    15,   207,
      63,    64,   251,   252,    15,   109,    98,    15,    94,    18,
      17,     5,    30,    30,   299,    15,    16,    43,    81,   492,
      88,    38,    66,    40,    43,    43,    43,    36,    45,     5,
       9,    15,    55,    50,    52,    52,    53,    54,    56,    56,
      15,    16,    15,   147,    40,   287,    63,    64,     5,    45,
      67,   117,   184,    38,    73,    40,   247,    66,   102,    76,
      45,   534,     3,    50,    81,    20,   170,   294,    53,    15,
      16,    88,    95,    63,    31,    47,    18,    94,   288,    20,
      97,    91,    99,   100,   220,     5,   371,    63,   114,    43,
     131,    81,   103,   110,    36,   114,   107,     0,   119,    54,
     117,    95,   314,   120,   100,    81,    91,   193,   116,   177,
     176,   264,   119,   321,     5,   100,   116,   183,   184,    73,
     212,   131,   163,   227,    70,   183,   368,   369,   214,    66,
     103,   148,   116,    55,   202,   111,   112,   202,    95,    69,
     350,   116,    72,   353,    63,   336,   131,    69,   339,    14,
     341,   342,    89,   163,    74,   382,   179,   384,   385,   176,
     177,    23,    24,   295,    63,   337,   176,   303,   493,   494,
     211,    81,   195,    63,    20,    95,   193,    74,   163,   351,
     189,   247,    81,    74,    74,   202,    51,    52,   437,   247,
     207,    81,    81,     6,     7,   205,     9,   214,    74,    85,
      86,   211,    81,   220,    95,    95,    19,    81,    54,    22,
      96,    97,   111,   112,    10,    11,    66,    30,   276,    76,
      70,   111,   112,   289,    64,    38,   211,    64,    41,   295,
      70,    71,    45,   250,   251,   252,   253,    50,   270,    15,
      16,   273,    99,    56,   376,   377,   378,   264,   265,   317,
      46,    84,   102,   270,    36,    95,   273,   469,    81,   395,
      63,    94,    44,   279,   280,    98,    99,    70,    40,    73,
     336,   288,   289,   339,   315,   341,   342,    81,   336,     7,
      65,   339,   323,   341,   342,   302,   477,    72,    10,    11,
     300,   301,   310,   310,    22,    93,   313,   110,   120,    27,
     317,   367,   100,    74,   321,   315,   372,   493,   494,    64,
     376,   377,   378,   323,    36,    70,    71,   449,   381,    65,
      65,    65,    44,    74,    46,   461,    72,    72,    72,    64,
     315,    66,   418,   350,    65,    27,   353,   528,   323,    64,
      72,    72,    74,    64,    81,    66,   108,    74,    71,     4,
     367,   113,   114,   439,   440,   372,   118,   119,   120,    64,
     401,   402,   439,   440,   381,    64,    74,   499,   439,   440,
      70,    64,   563,    74,   565,    70,    64,   394,   444,    98,
       5,    72,   514,   449,   520,    66,   120,   405,   405,    33,
      37,   401,   402,    72,   156,   157,   158,   159,    54,    37,
      54,   418,    65,    67,    69,   491,    72,    29,    14,    37,
      63,   477,   544,    65,    72,    54,   401,   402,    54,   477,
     437,    70,   439,   440,   465,    67,    72,   444,    90,    72,
      65,    72,    65,   499,    54,    10,    11,   569,    70,   122,
      74,    72,   574,   121,    65,    64,    72,    65,   514,   466,
     117,   213,   462,    28,    70,   465,   117,   442,   220,   118,
      35,    36,   528,   225,    72,    40,    64,    16,   119,    44,
     528,    46,   122,   121,   491,   492,    17,    43,   544,   488,
     465,    95,    65,    16,    15,    17,    16,   249,    63,   119,
      54,    54,    74,   116,   535,    54,    54,   563,    54,   565,
      54,   116,    54,   569,    74,   563,    81,   565,   574,   116,
     495,   521,   116,    74,    74,     7,   466,   534,    64,    74,
     481,   485,   511,   503,   442,   535,   101,    47,    10,    11,
     534,   440,   252,   418,   417,   297,   220,    19,   507,   250,
     294,   303,   110,   253,    -1,   344,    28,   265,   348,   559,
     535,    -1,    -1,     8,    36,    -1,    -1,    12,    -1,    -1,
     322,    -1,    44,    18,    46,    -1,    -1,    -1,    -1,    -1,
     580,    26,    -1,   335,    29,    -1,    31,    -1,    -1,    34,
      -1,    63,   344,    -1,    39,   347,   348,    -1,    -1,    -1,
      -1,   353,   354,    -1,    -1,    -1,    -1,    -1,    -1,    81,
      55,    -1,    57,    58,    -1,    -1,    -1,    -1,    63,    64,
      -1,    66,    -1,    68,    -1,   377,    -1,    -1,   380,   101,
      -1,    -1,    -1,    -1,    -1,    -1,    81,    -1,    83,    -1,
      85,    86,    -1,   395,    -1,    -1,    -1,    -1,    -1,    -1,
      95,    96,    97,    -1,    -1,    -1,    -1,    -1,     8,   411,
     412,    -1,    12,   108,   109,   417,   111,   112,    18,    -1,
      -1,   116,   424,    -1,    -1,    -1,    26,    -1,    -1,    29,
      -1,    31,    -1,    -1,    34,    -1,    -1,    -1,    -1,    39,
      85,    86,    87,    88,    89,    90,    91,    92,   450,    -1,
      -1,    96,    97,    -1,    -1,    55,    -1,    57,    58,   461,
      -1,    -1,    -1,    63,    64,    -1,    66,    -1,    68,    -1,
     472,    -1,    -1,    -1,    -1,    -1,   478,    -1,    -1,    -1,
     482,    81,    -1,    83,    -1,    85,    86,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    95,    96,    97,   500,    -1,
      -1,    -1,   504,   505,    -1,    -1,   508,    -1,   108,   109,
      -1,   111,   112,   515,    -1,    -1,   116,    -1,   520,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,   549,    -1,    -1,
      -1,    -1,   554,    -1,   556,    -1,    -1,    -1,    -1,    -1,
      -1,     3,    -1,     5,     6,     7,    -1,     9,    10,    11,
     572,    13,    -1,    -1,    -1,   577,    -1,    19,    20,    21,
      22,    23,    -1,    25,    -1,    27,    28,    -1,    30,    -1,
      32,    -1,    34,    35,    36,    -1,    38,    -1,    40,    41,
      -1,    -1,    44,    45,    46,    47,    48,    49,    50,    51,
      52,    -1,    -1,    -1,    56,    -1,    -1,    -1,    -1,    -1,
      -1,    63,    -1,    -1,    -1,    -1,    -1,    -1,    70,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,     3,    81,
       5,     6,     7,    -1,     9,    10,    11,    -1,    13,    -1,
      -1,    -1,    -1,    95,    19,    20,    21,    22,    23,   101,
      25,    -1,    27,    28,    -1,    30,    -1,    32,   110,    34,
      35,    36,    -1,    38,    -1,    40,    41,    -1,   120,    44,
      45,    46,    47,    48,    49,    50,    51,    52,    -1,    -1,
      -1,    56,    -1,    -1,    -1,    -1,    -1,    -1,    63,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,     3,    81,     5,     6,     7,
      -1,     9,    10,    11,    -1,    13,    -1,    -1,    -1,    -1,
      -1,    19,    20,    21,    22,    23,   101,    25,    -1,    27,
      28,    -1,    30,    -1,    32,   110,    34,    35,    36,    -1,
      38,    -1,    40,    41,    -1,   120,    44,    45,    46,    47,
      48,    49,    50,    51,    52,     5,     6,     7,    56,     9,
      10,    11,    -1,    13,    -1,    63,    -1,    -1,    -1,    19,
      -1,    21,    22,    23,    -1,    -1,    -1,    27,    28,    -1,
      30,    -1,    32,    81,    -1,    35,    36,    -1,    38,    -1,
      40,    41,    -1,    -1,    44,    45,    46,    47,    -1,    -1,
      50,    51,    52,   101,    -1,    -1,    56,    -1,    -1,    -1,
      -1,    -1,   110,    63,    -1,    -1,    12,    -1,    -1,    -1,
      -1,    -1,    18,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      26,    81,    -1,    29,    -1,    31,    -1,    -1,    34,    -1,
      -1,    -1,    -1,    39,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,   101,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    55,
     110,    57,    58,    59,    -1,    61,    62,    63,    64,    -1,
      66,    -1,    68,    -1,    -1,    -1,    10,    11,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    81,    -1,    83,     8,    85,
      86,    -1,    12,    -1,    28,    -1,    -1,    -1,    18,    95,
      96,    97,    36,    -1,    -1,    -1,    26,    -1,    -1,    29,
      44,    31,    46,    -1,    34,   111,   112,    -1,    -1,    39,
     116,    -1,    -1,    -1,    -1,    -1,    -1,    12,    -1,    63,
      -1,    -1,    -1,    18,    54,    55,    -1,    57,    58,    -1,
      -1,    26,    -1,    63,    64,    -1,    66,    81,    68,    34,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    81,    -1,    83,     8,    85,    86,   101,    12,    -1,
      55,    -1,    57,    -1,    18,    95,    96,    97,    63,    64,
      -1,    66,    26,    68,    -1,    29,    -1,    31,   108,   109,
      34,   111,   112,    -1,    -1,    39,    81,    -1,    83,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      95,    55,    -1,    57,    58,    -1,    -1,    -1,    -1,    63,
      64,    -1,    66,    -1,    68,    -1,   111,   112,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    81,    -1,    83,
      -1,    85,    86,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    95,    96,    97,    -1,    -1,     6,     7,    -1,     9,
      10,    11,    -1,    -1,   108,   109,    -1,   111,   112,    19,
      -1,    21,    22,    -1,    -1,    -1,    -1,    -1,    28,    -1,
      30,    -1,    -1,    -1,    -1,    -1,    36,    -1,    38,    -1,
      -1,    41,    -1,    -1,    44,    45,    46,    47,    -1,    -1,
      50,    -1,    52,    -1,     6,     7,    56,     9,    -1,    -1,
      -1,    -1,    -1,    63,    -1,    -1,    -1,    19,    -1,    21,
      22,    -1,    -1,    -1,    -1,    27,    -1,    -1,    30,    -1,
      -1,    81,    -1,    -1,    -1,    -1,    38,    -1,    -1,    41,
      -1,    -1,    -1,    45,    -1,    47,     6,     7,    50,     9,
      -1,   101,    -1,    -1,    56,    -1,    -1,    -1,    60,    19,
     110,    21,    22,    -1,    -1,    -1,    -1,    27,    -1,    -1,
      30,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    38,     6,
       7,    41,     9,    -1,    -1,    45,    -1,    47,    -1,    -1,
      50,    -1,    19,    -1,    21,    22,    56,    -1,    -1,    -1,
      -1,    -1,    -1,    30,    -1,    -1,    -1,    -1,   110,    -1,
      -1,    38,    -1,    -1,    41,    -1,    -1,    -1,    45,    -1,
      47,     6,     7,    50,     9,    52,    -1,    -1,    -1,    56,
      -1,    -1,    -1,    -1,    19,    -1,    21,    22,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    30,    -1,    -1,    -1,    -1,
     110,    -1,    -1,    38,    -1,    12,    41,    -1,    -1,    -1,
      45,    18,    47,    -1,    -1,    50,    -1,    -1,    -1,    26,
      -1,    56,    29,    -1,    31,    -1,    -1,    34,    -1,    -1,
      -1,    -1,    39,   110,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    55,    -1,
      57,    58,    59,    -1,    61,    62,    63,    64,    12,    66,
      -1,    68,    -1,    -1,    18,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    26,    -1,    81,   110,    83,    31,    85,    86,
      34,    -1,    -1,    -1,    -1,    39,    -1,    -1,    95,    96,
      97,    -1,    -1,    -1,    12,    -1,    -1,    -1,    -1,    -1,
      18,    55,    -1,    57,   111,   112,    -1,    -1,    26,    63,
      64,    -1,    66,    31,    68,    -1,    34,    -1,    -1,    73,
      -1,    39,    -1,    -1,    -1,    -1,    -1,    81,    -1,    83,
      -1,    85,    86,    -1,    -1,    -1,    -1,    55,    -1,    57,
      -1,    95,    96,    97,    -1,    63,    64,    -1,    66,    -1,
      68,    -1,    -1,    -1,   108,   109,    -1,   111,   112,    -1,
      12,    -1,    -1,    81,    -1,    83,    18,    85,    86,    -1,
      -1,    -1,    -1,    -1,    26,    -1,    -1,    95,    96,    97,
      -1,    -1,    34,    -1,    -1,    -1,    -1,    39,    -1,    -1,
     108,   109,    -1,   111,   112,    12,    -1,    -1,    -1,    -1,
      -1,    18,    -1,    55,    -1,    57,    -1,    -1,    -1,    26,
      -1,    63,    64,    -1,    66,    -1,    68,    34,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    81,
      -1,    83,    -1,    85,    86,    -1,    -1,    -1,    55,    -1,
      57,    -1,    -1,    95,    96,    97,    63,    64,    -1,    66,
      -1,    68,    -1,    -1,    -1,    -1,    -1,    -1,    -1,   111,
     112,    -1,    -1,    -1,    81,    -1,    83,    -1,    85,    86,
      -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    95,    96,
      97,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,   111,   112
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,     6,     7,     9,    19,    21,    22,    27,    30,    38,
      41,    45,    47,    50,    56,    60,   110,   124,   125,   126,
     127,   128,   130,   133,    47,   131,     9,   130,   133,    50,
      63,    81,   246,   247,     0,   126,    74,   133,    81,   133,
      81,   246,    74,    63,   126,    81,     3,     5,    10,    11,
      13,    20,    23,    25,    27,    28,    32,    34,    35,    36,
      40,    44,    46,    48,    49,    51,    52,    70,    95,   101,
     120,   128,   129,   134,   135,   139,   140,   141,   142,   146,
     168,   169,   170,   171,   172,   173,   180,   192,   193,   194,
     195,   196,   197,   199,   200,   201,   202,   203,   246,   248,
      81,   129,   246,   129,    12,    18,    26,    29,    31,    34,
      39,    55,    57,    58,    59,    61,    62,    63,    64,    66,
      68,    83,    85,    86,    96,    97,   111,   112,   145,   148,
     149,   150,   151,   154,   224,   225,   226,   227,   228,   229,
     230,   231,   232,   233,   234,   235,   237,   240,   241,   247,
     248,    64,   181,   247,     8,    29,    31,    58,   108,   109,
     144,   157,   158,   159,   160,   165,   215,   216,   217,   224,
     240,   246,    74,   147,   240,   247,   248,   193,   199,   201,
     202,   246,   247,     3,    20,    40,   143,   168,   143,    52,
     195,   128,    19,   200,   203,   201,   120,   139,   168,    74,
      74,    27,   132,   199,   180,   248,   249,   203,   202,   174,
     175,   177,   247,    66,    89,   204,   206,   120,   139,   129,
      64,   209,    81,   163,   164,    31,   215,   240,   209,   230,
     247,   215,   215,   240,   215,   238,   215,   236,   239,   210,
     211,   212,   213,   214,   215,   239,   247,    74,   249,    71,
      43,    73,   114,     4,    85,    86,    87,    88,    89,    90,
      91,    92,    96,    97,   242,   245,    84,    94,    98,    99,
     243,    93,   100,   244,   209,   232,   102,   206,    14,    51,
      52,   183,   184,   185,   186,   187,   188,   191,    64,    64,
     163,   215,   215,   215,   215,    74,   249,    70,   209,    64,
     182,    74,    70,    64,   180,   240,   247,   199,   202,    98,
      70,   148,   157,    64,   203,   182,   202,   193,   199,   180,
     174,    72,    31,   176,   249,   206,    73,   207,   208,   215,
     203,   205,   120,   210,   239,    33,    37,    72,   215,    54,
     209,    54,    37,    65,    72,    65,    67,    72,    74,    69,
      72,    29,    69,    72,    70,   148,   215,   228,   227,   225,
     227,   229,   232,   231,   233,   233,   224,    63,   191,   191,
      65,    72,   132,   213,   247,   240,    37,    54,    54,    15,
     103,   107,   220,   221,   222,   220,   221,   157,   215,   183,
     180,   180,   247,   239,    70,    64,   246,    73,   136,   137,
     138,   247,   182,   249,   199,    24,   197,   198,   174,   215,
     249,    70,    71,   178,   179,   181,    67,    72,    72,    90,
      65,   215,   148,   163,    54,   116,   148,   148,   148,   215,
     238,   215,   236,   213,   163,   213,   215,    73,   240,   132,
     132,   183,   240,    65,    72,   157,   157,   215,   157,    20,
      54,   215,   223,   168,   221,   122,   221,   221,   121,    65,
      74,    64,    65,   247,   239,    65,    72,   249,   249,   246,
     215,   215,    70,   207,   205,   117,   215,    15,    16,   116,
     152,   153,    17,   119,   155,   156,   118,   227,    52,   189,
     195,   200,   203,   189,   195,   178,   248,   240,   117,    15,
      16,   116,   166,   167,    15,    16,   218,   219,    17,   119,
     161,   162,   157,   215,    20,    54,   122,   121,   239,   180,
      64,    65,   249,   137,   182,   215,   148,   215,    15,   116,
     152,   215,   119,   155,   203,   177,   190,   198,   198,   248,
      65,   116,   157,   215,    15,   116,   166,   215,   215,    15,
     218,   215,   119,   161,    54,    74,    54,   157,   215,    65,
     239,   180,   116,    54,   148,    54,   190,   249,   116,    54,
     116,   157,    54,   215,    54,   215,   215,    54,    74,   180,
      65,   148,   116,   148,   157,   116,   215,   157,    74,    74,
     215,   180,    74
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  */

#define YYFAIL		goto yyerrlab

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      yytoken = YYTRANSLATE (yychar);				\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* YY_LOCATION_PRINT -- Print the location on the stream.
   This macro was not mandated originally: define only if we know
   we won't break user code: when these are the locations we know.  */

#ifndef YY_LOCATION_PRINT
# if YYLTYPE_IS_TRIVIAL
#  define YY_LOCATION_PRINT(File, Loc)			\
     fprintf (File, "%d.%d-%d.%d",			\
	      (Loc).first_line, (Loc).first_column,	\
	      (Loc).last_line,  (Loc).last_column)
# else
#  define YY_LOCATION_PRINT(File, Loc) ((void) 0)
# endif
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif



#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into YYRESULT an error message about the unexpected token
   YYCHAR while in state YYSTATE.  Return the number of bytes copied,
   including the terminating null byte.  If YYRESULT is null, do not
   copy anything; just return the number of bytes that would be
   copied.  As a special case, return 0 if an ordinary "syntax error"
   message will do.  Return YYSIZE_MAXIMUM if overflow occurs during
   size calculation.  */
static YYSIZE_T
yysyntax_error (char *yyresult, int yystate, int yychar)
{
  int yyn = yypact[yystate];

  if (! (YYPACT_NINF < yyn && yyn <= YYLAST))
    return 0;
  else
    {
      int yytype = YYTRANSLATE (yychar);
      YYSIZE_T yysize0 = yytnamerr (0, yytname[yytype]);
      YYSIZE_T yysize = yysize0;
      YYSIZE_T yysize1;
      int yysize_overflow = 0;
      enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
      char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
      int yyx;

# if 0
      /* This is so xgettext sees the translatable formats that are
	 constructed on the fly.  */
      YY_("syntax error, unexpected %s");
      YY_("syntax error, unexpected %s, expecting %s");
      YY_("syntax error, unexpected %s, expecting %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s");
      YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s");
# endif
      char *yyfmt;
      char const *yyf;
      static char const yyunexpected[] = "syntax error, unexpected %s";
      static char const yyexpecting[] = ", expecting %s";
      static char const yyor[] = " or %s";
      char yyformat[sizeof yyunexpected
		    + sizeof yyexpecting - 1
		    + ((YYERROR_VERBOSE_ARGS_MAXIMUM - 2)
		       * (sizeof yyor - 1))];
      char const *yyprefix = yyexpecting;

      /* Start YYX at -YYN if negative to avoid negative indexes in
	 YYCHECK.  */
      int yyxbegin = yyn < 0 ? -yyn : 0;

      /* Stay within bounds of both yycheck and yytname.  */
      int yychecklim = YYLAST - yyn + 1;
      int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
      int yycount = 1;

      yyarg[0] = yytname[yytype];
      yyfmt = yystpcpy (yyformat, yyunexpected);

      for (yyx = yyxbegin; yyx < yyxend; ++yyx)
	if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR)
	  {
	    if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
	      {
		yycount = 1;
		yysize = yysize0;
		yyformat[sizeof yyunexpected - 1] = '\0';
		break;
	      }
	    yyarg[yycount++] = yytname[yyx];
	    yysize1 = yysize + yytnamerr (0, yytname[yyx]);
	    yysize_overflow |= (yysize1 < yysize);
	    yysize = yysize1;
	    yyfmt = yystpcpy (yyfmt, yyprefix);
	    yyprefix = yyor;
	  }

      yyf = YY_(yyformat);
      yysize1 = yysize + yystrlen (yyf);
      yysize_overflow |= (yysize1 < yysize);
      yysize = yysize1;

      if (yysize_overflow)
	return YYSIZE_MAXIMUM;

      if (yyresult)
	{
	  /* Avoid sprintf, as that infringes on the user's name space.
	     Don't have undefined behavior even if the translation
	     produced a string with the wrong number of "%s"s.  */
	  char *yyp = yyresult;
	  int yyi = 0;
	  while ((*yyp = *yyf) != '\0')
	    {
	      if (*yyp == '%' && yyf[1] == 's' && yyi < yycount)
		{
		  yyp += yytnamerr (yyp, yyarg[yyi++]);
		  yyf += 2;
		}
	      else
		{
		  yyp++;
		  yyf++;
		}
	    }
	}
      return yysize;
    }
}
#endif /* YYERROR_VERBOSE */


/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}

/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;



/*-------------------------.
| yyparse or yypush_parse.  |
`-------------------------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{


    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yyn == YYPACT_NINF)
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yyn == 0 || yyn == YYTABLE_NINF)
	goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1455 of yacc.c  */
#line 258 "parserModelica.y"
    { (absyntree)[Program] = Absyn.PROGRAM((yyvsp[(1) - (1)])[lstClass],Absyn.TOP(),Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); ;}
    break;

  case 3:

/* Line 1455 of yacc.c  */
#line 260 "parserModelica.y"
    { (absyntree)[Program] = Absyn.PROGRAM((yyvsp[(2) - (2)])[lstClass],(yyvsp[(1) - (2)])[Within],Absyn.TIMESTAMP(System.getCurrentTime(),System.getCurrentTime())); ;}
    break;

  case 4:

/* Line 1455 of yacc.c  */
#line 263 "parserModelica.y"
    { (yyval)[Within] = Absyn.WITHIN((yyvsp[(2) - (3)])[Path]); ;}
    break;

  case 5:

/* Line 1455 of yacc.c  */
#line 267 "parserModelica.y"
    { (yyval)[lstClass] = (yyvsp[(1) - (2)])[Class]::{}; ;}
    break;

  case 6:

/* Line 1455 of yacc.c  */
#line 268 "parserModelica.y"
    { (yyval)[lstClass] = (yyvsp[(1) - (3)])[Class]::(yyvsp[(2) - (3)])[lstClass]; ;}
    break;

  case 7:

/* Line 1455 of yacc.c  */
#line 275 "parserModelica.y"
    { (v1Boolean,v2Boolean) = (yyvsp[(2) - (5)])[Boolean2]; 
                                 (yyval)[Class] = Absyn.CLASS((yyvsp[(4) - (5)]),v2Boolean,true,v1Boolean,(yyvsp[(3) - (5)])[Restriction],(yyvsp[(5) - (5)])[ClassDef],info); ;}
    break;

  case 8:

/* Line 1455 of yacc.c  */
#line 278 "parserModelica.y"
    {  (yyval)[Class] = Absyn.CLASS((yyvsp[(3) - (4)]),false,true,false,(yyvsp[(2) - (4)])[Restriction],(yyvsp[(4) - (4)])[ClassDef],info); ;}
    break;

  case 9:

/* Line 1455 of yacc.c  */
#line 279 "parserModelica.y"
    { (yyval)[Class] = (yyvsp[(1) - (1)])[Class]; ;}
    break;

  case 10:

/* Line 1455 of yacc.c  */
#line 282 "parserModelica.y"
    { (yyval)[Class] = Absyn.CLASS((yyvsp[(2) - (3)]),false,false,false,(yyvsp[(1) - (3)])[Restriction],(yyvsp[(3) - (3)])[ClassDef],info); ;}
    break;

  case 11:

/* Line 1455 of yacc.c  */
#line 284 "parserModelica.y"
    { (v1Boolean,v2Boolean) = (yyvsp[(1) - (4)])[Boolean2]; 
                                 (yyval)[Class] = Absyn.CLASS((yyvsp[(3) - (4)]),v2Boolean,false,v1Boolean,(yyvsp[(2) - (4)])[Restriction],(yyvsp[(4) - (4)])[ClassDef],info); ;}
    break;

  case 12:

/* Line 1455 of yacc.c  */
#line 288 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.PARTS({},{},SOME((yyvsp[(1) - (2)]))); ;}
    break;

  case 13:

/* Line 1455 of yacc.c  */
#line 290 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.PARTS({},{},NONE()); ;}
    break;

  case 14:

/* Line 1455 of yacc.c  */
#line 292 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.PARTS({},(yyvsp[(1) - (2)])[ClassParts],NONE()); ;}
    break;

  case 15:

/* Line 1455 of yacc.c  */
#line 294 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.PARTS({},(yyvsp[(2) - (3)])[ClassParts],SOME((yyvsp[(1) - (3)]))); ;}
    break;

  case 16:

/* Line 1455 of yacc.c  */
#line 296 "parserModelica.y"
    { (yyval)[ClassDef] = (yyvsp[(1) - (1)])[ClassDef]; ;}
    break;

  case 17:

/* Line 1455 of yacc.c  */
#line 298 "parserModelica.y"
    { (yyval)[ClassDef] = (yyvsp[(1) - (1)])[ClassDef]; ;}
    break;

  case 18:

/* Line 1455 of yacc.c  */
#line 301 "parserModelica.y"
    { (yyval)[Boolean2] = (true,(yyvsp[(2) - (2)])[Boolean]); ;}
    break;

  case 19:

/* Line 1455 of yacc.c  */
#line 303 "parserModelica.y"
    { (yyval)[Boolean2] = (false,true); ;}
    break;

  case 20:

/* Line 1455 of yacc.c  */
#line 309 "parserModelica.y"
    { (yyval)[Boolean] = true;   ;}
    break;

  case 21:

/* Line 1455 of yacc.c  */
#line 310 "parserModelica.y"
    { (yyval)[Boolean] = false; ;}
    break;

  case 22:

/* Line 1455 of yacc.c  */
#line 312 "parserModelica.y"
    { (yyval)[Boolean] = true;   ;}
    break;

  case 23:

/* Line 1455 of yacc.c  */
#line 313 "parserModelica.y"
    { (yyval)[Boolean] = false; ;}
    break;

  case 24:

/* Line 1455 of yacc.c  */
#line 315 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_CLASS(); ;}
    break;

  case 25:

/* Line 1455 of yacc.c  */
#line 316 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_MODEL(); ;}
    break;

  case 26:

/* Line 1455 of yacc.c  */
#line 317 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_RECORD(); ;}
    break;

  case 27:

/* Line 1455 of yacc.c  */
#line 318 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_PACKAGE(); ;}
    break;

  case 28:

/* Line 1455 of yacc.c  */
#line 319 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_TYPE(); ;}
    break;

  case 29:

/* Line 1455 of yacc.c  */
#line 320 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_FUNCTION(Absyn.FR_NORMAL_FUNCTION()); ;}
    break;

  case 30:

/* Line 1455 of yacc.c  */
#line 321 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_UNIONTYPE(); ;}
    break;

  case 31:

/* Line 1455 of yacc.c  */
#line 322 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_BLOCK(); ;}
    break;

  case 32:

/* Line 1455 of yacc.c  */
#line 323 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_CONNECTOR(); ;}
    break;

  case 33:

/* Line 1455 of yacc.c  */
#line 324 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_EXP_CONNECTOR(); ;}
    break;

  case 34:

/* Line 1455 of yacc.c  */
#line 325 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_ENUMERATION(); ;}
    break;

  case 35:

/* Line 1455 of yacc.c  */
#line 326 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_OPERATOR_RECORD(); ;}
    break;

  case 36:

/* Line 1455 of yacc.c  */
#line 327 "parserModelica.y"
    { (yyval)[Restriction] = Absyn.R_OPERATOR(); ;}
    break;

  case 37:

/* Line 1455 of yacc.c  */
#line 332 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.ENUMERATION((yyvsp[(4) - (6)])[EnumDef],SOME((yyvsp[(6) - (6)])[Comment])); ;}
    break;

  case 38:

/* Line 1455 of yacc.c  */
#line 335 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.DERIVED((yyvsp[(2) - (4)])[TypeSpec],Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),Absyn.VAR(), Absyn.BIDIR(),{}),(yyvsp[(3) - (4)])[ElementArgs],SOME((yyvsp[(4) - (4)])[Comment])); ;}
    break;

  case 39:

/* Line 1455 of yacc.c  */
#line 337 "parserModelica.y"
    { (yyval)[ClassDef] = Absyn.DERIVED((yyvsp[(3) - (5)])[TypeSpec],(yyvsp[(2) - (5)])[ElementAttributes],(yyvsp[(4) - (5)])[ElementArgs],SOME((yyvsp[(5) - (5)])[Comment])); ;}
    break;

  case 40:

/* Line 1455 of yacc.c  */
#line 339 "parserModelica.y"
    { (yyval)[EnumDef] = Absyn.ENUMLITERALS((yyvsp[(1) - (1)])[EnumLiterals]); ;}
    break;

  case 41:

/* Line 1455 of yacc.c  */
#line 340 "parserModelica.y"
    { (yyval)[EnumDef] = Absyn.ENUM_COLON(); ;}
    break;

  case 42:

/* Line 1455 of yacc.c  */
#line 342 "parserModelica.y"
    { (yyval)[EnumLiterals] = (yyvsp[(1) - (1)])[EnumLiteral]::{}; ;}
    break;

  case 43:

/* Line 1455 of yacc.c  */
#line 343 "parserModelica.y"
    { (yyval)[EnumLiterals] = (yyvsp[(1) - (3)])[EnumLiteral]::(yyvsp[(3) - (3)])[EnumLiterals]; ;}
    break;

  case 44:

/* Line 1455 of yacc.c  */
#line 345 "parserModelica.y"
    { (yyval)[EnumLiteral] = Absyn.ENUMLITERAL((yyvsp[(1) - (2)])[Ident],SOME((yyvsp[(2) - (2)])[Comment])); ;}
    break;

  case 45:

/* Line 1455 of yacc.c  */
#line 347 "parserModelica.y"
    { (yyval)[ClassParts] = (yyvsp[(1) - (1)])[ClassPart]::{}; ;}
    break;

  case 46:

/* Line 1455 of yacc.c  */
#line 348 "parserModelica.y"
    { (yyval)[ClassParts] = (yyvsp[(1) - (2)])[ClassPart]::(yyvsp[(2) - (2)])[ClassParts]; ;}
    break;

  case 47:

/* Line 1455 of yacc.c  */
#line 350 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.PUBLIC((yyvsp[(1) - (1)])[ElementItems]); ;}
    break;

  case 48:

/* Line 1455 of yacc.c  */
#line 351 "parserModelica.y"
    { (yyval)[ClassPart] = (yyvsp[(1) - (1)])[ClassPart]; ;}
    break;

  case 49:

/* Line 1455 of yacc.c  */
#line 355 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.PUBLIC((yyvsp[(1) - (2)])[ElementItems]); ;}
    break;

  case 50:

/* Line 1455 of yacc.c  */
#line 356 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.PROTECTED((yyvsp[(1) - (2)])[ElementItems]); ;}
    break;

  case 51:

/* Line 1455 of yacc.c  */
#line 357 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.EQUATIONS((yyvsp[(1) - (2)])[EquationItems]); ;}
    break;

  case 52:

/* Line 1455 of yacc.c  */
#line 358 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.ALGORITHMS((yyvsp[(1) - (2)])[AlgorithmItems]); ;}
    break;

  case 53:

/* Line 1455 of yacc.c  */
#line 359 "parserModelica.y"
    { (yyval)[ClassPart]=(yyvsp[(1) - (1)])[ClassPart]; ;}
    break;

  case 54:

/* Line 1455 of yacc.c  */
#line 360 "parserModelica.y"
    { (yyval)[ClassPart]=(yyvsp[(1) - (1)])[ClassPart]; ;}
    break;

  case 55:

/* Line 1455 of yacc.c  */
#line 362 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.INITIALEQUATIONS((yyvsp[(1) - (3)])[EquationItems]); ;}
    break;

  case 56:

/* Line 1455 of yacc.c  */
#line 363 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.INITIALALGORITHMS((yyvsp[(1) - (3)])[AlgorithmItems]); ;}
    break;

  case 57:

/* Line 1455 of yacc.c  */
#line 365 "parserModelica.y"
    { (yyval)[ElementItems]=(yyvsp[(1) - (1)])[ElementItems]; ;}
    break;

  case 58:

/* Line 1455 of yacc.c  */
#line 366 "parserModelica.y"
    { (yyval)[ElementItems]={}; ;}
    break;

  case 59:

/* Line 1455 of yacc.c  */
#line 368 "parserModelica.y"
    { (yyval)[EquationItems]=(yyvsp[(1) - (1)])[EquationItems]; ;}
    break;

  case 60:

/* Line 1455 of yacc.c  */
#line 369 "parserModelica.y"
    { (yyval)[EquationItems]={}; ;}
    break;

  case 61:

/* Line 1455 of yacc.c  */
#line 371 "parserModelica.y"
    { (yyval)[AlgorithmItems]=(yyvsp[(1) - (1)])[AlgorithmItems]; ;}
    break;

  case 62:

/* Line 1455 of yacc.c  */
#line 372 "parserModelica.y"
    { (yyval)[AlgorithmItems]={}; ;}
    break;

  case 63:

/* Line 1455 of yacc.c  */
#line 374 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.EXTERNAL(Absyn.EXTERNALDECL(NONE(),NONE(),NONE(),{},NONE()),NONE()); ;}
    break;

  case 64:

/* Line 1455 of yacc.c  */
#line 375 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.EXTERNAL((yyvsp[(2) - (3)])[ExternalDecl],NONE()); ;}
    break;

  case 65:

/* Line 1455 of yacc.c  */
#line 376 "parserModelica.y"
    { (yyval)[ClassPart] = Absyn.EXTERNAL((yyvsp[(2) - (5)])[ExternalDecl],SOME((yyvsp[(3) - (5)])[Annotation])); ;}
    break;

  case 66:

/* Line 1455 of yacc.c  */
#line 379 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(NONE(),SOME((yyvsp[(1) - (1)])),NONE(),{},NONE()); ;}
    break;

  case 67:

/* Line 1455 of yacc.c  */
#line 380 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(NONE(),SOME((yyvsp[(1) - (2)])),NONE(),{},SOME((yyvsp[(2) - (2)])[Annotation])); ;}
    break;

  case 68:

/* Line 1455 of yacc.c  */
#line 381 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(4) - (7)])[Ident]),SOME((yyvsp[(1) - (7)])),SOME((yyvsp[(2) - (7)])[ComponentRef]),(yyvsp[(6) - (7)])[Exps],NONE()); ;}
    break;

  case 69:

/* Line 1455 of yacc.c  */
#line 382 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(4) - (8)])[Ident]),SOME((yyvsp[(1) - (8)])),SOME((yyvsp[(2) - (8)])[ComponentRef]),(yyvsp[(6) - (8)])[Exps],SOME((yyvsp[(8) - (8)])[Annotation])); ;}
    break;

  case 70:

/* Line 1455 of yacc.c  */
#line 383 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(2) - (6)])[Ident]),SOME((yyvsp[(1) - (6)])),NONE(),(yyvsp[(4) - (6)])[Exps],SOME((yyvsp[(6) - (6)])[Annotation])); ;}
    break;

  case 71:

/* Line 1455 of yacc.c  */
#line 384 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(2) - (5)])[Ident]),SOME((yyvsp[(1) - (5)])),NONE(),(yyvsp[(4) - (5)])[Exps],NONE()); ;}
    break;

  case 72:

/* Line 1455 of yacc.c  */
#line 385 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(3) - (6)])[Ident]),NONE(),SOME((yyvsp[(1) - (6)])[ComponentRef]),(yyvsp[(5) - (6)])[Exps],NONE()); ;}
    break;

  case 73:

/* Line 1455 of yacc.c  */
#line 386 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(3) - (7)])[Ident]),NONE(),SOME((yyvsp[(1) - (7)])[ComponentRef]),(yyvsp[(5) - (7)])[Exps],SOME((yyvsp[(7) - (7)])[Annotation])); ;}
    break;

  case 74:

/* Line 1455 of yacc.c  */
#line 387 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(1) - (5)])[Ident]),NONE(),NONE(),(yyvsp[(3) - (5)])[Exps],SOME((yyvsp[(5) - (5)])[Annotation])); ;}
    break;

  case 75:

/* Line 1455 of yacc.c  */
#line 388 "parserModelica.y"
    { (yyval)[ExternalDecl] = Absyn.EXTERNALDECL(SOME((yyvsp[(1) - (4)])[Ident]),NONE(),NONE(),(yyvsp[(3) - (4)])[Exps],NONE()); ;}
    break;

  case 76:

/* Line 1455 of yacc.c  */
#line 393 "parserModelica.y"
    { (yyval)[AlgorithmItems] = (yyvsp[(1) - (2)])[AlgorithmItem]::{}; ;}
    break;

  case 77:

/* Line 1455 of yacc.c  */
#line 394 "parserModelica.y"
    { (yyval)[AlgorithmItems] = (yyvsp[(1) - (3)])[AlgorithmItem]::(yyvsp[(2) - (3)])[AlgorithmItems]; ;}
    break;

  case 78:

/* Line 1455 of yacc.c  */
#line 397 "parserModelica.y"
    { (yyval)[AlgorithmItem] = Absyn.ALGORITHMITEM((yyvsp[(1) - (2)])[Algorithm],SOME((yyvsp[(2) - (2)])[Comment]),info); ;}
    break;

  case 79:

/* Line 1455 of yacc.c  */
#line 400 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_ASSIGN((yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 80:

/* Line 1455 of yacc.c  */
#line 402 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_NORETCALL((yyvsp[(1) - (2)])[ComponentRef],(yyvsp[(2) - (2)])[FunctionArgs]); ;}
    break;

  case 81:

/* Line 1455 of yacc.c  */
#line 404 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_RETURN(); ;}
    break;

  case 82:

/* Line 1455 of yacc.c  */
#line 406 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_BREAK(); ;}
    break;

  case 83:

/* Line 1455 of yacc.c  */
#line 408 "parserModelica.y"
    { (yyval)[Algorithm] = (yyvsp[(1) - (1)])[Algorithm]; ;}
    break;

  case 84:

/* Line 1455 of yacc.c  */
#line 410 "parserModelica.y"
    { (yyval)[Algorithm] = (yyvsp[(1) - (1)])[Algorithm]; ;}
    break;

  case 85:

/* Line 1455 of yacc.c  */
#line 412 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_FOR((yyvsp[(3) - (5)])[ForIterators],(yyvsp[(5) - (5)])[AlgorithmItems]); ;}
    break;

  case 86:

/* Line 1455 of yacc.c  */
#line 414 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_WHILE((yyvsp[(3) - (5)])[Exp],(yyvsp[(5) - (5)])[AlgorithmItems]); ;}
    break;

  case 87:

/* Line 1455 of yacc.c  */
#line 416 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_IF((yyvsp[(2) - (4)])[Exp],{},{},{}); ;}
    break;

  case 88:

/* Line 1455 of yacc.c  */
#line 417 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_IF((yyvsp[(2) - (5)])[Exp],(yyvsp[(4) - (5)])[AlgorithmItems],{},{}); ;}
    break;

  case 89:

/* Line 1455 of yacc.c  */
#line 418 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_IF((yyvsp[(2) - (7)])[Exp],(yyvsp[(4) - (7)])[AlgorithmItems],{},(yyvsp[(6) - (7)])[AlgorithmItems]); ;}
    break;

  case 90:

/* Line 1455 of yacc.c  */
#line 419 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_IF((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[AlgorithmItems],(yyvsp[(5) - (6)])[AlgElseifs],{}); ;}
    break;

  case 91:

/* Line 1455 of yacc.c  */
#line 420 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_IF((yyvsp[(2) - (8)])[Exp],(yyvsp[(4) - (8)])[AlgorithmItems],(yyvsp[(5) - (8)])[AlgElseifs],(yyvsp[(7) - (8)])[AlgorithmItems]); ;}
    break;

  case 92:

/* Line 1455 of yacc.c  */
#line 422 "parserModelica.y"
    { (yyval)[AlgElseifs] = (yyvsp[(1) - (1)])[AlgElseif]::{}; ;}
    break;

  case 93:

/* Line 1455 of yacc.c  */
#line 423 "parserModelica.y"
    { (yyval)[AlgElseifs] = (yyvsp[(1) - (2)])[AlgElseif]::(yyvsp[(2) - (2)])[AlgElseifs]; ;}
    break;

  case 94:

/* Line 1455 of yacc.c  */
#line 425 "parserModelica.y"
    { (yyval)[AlgElseif] = ((yyvsp[(2) - (4)])[Exp],(yyvsp[(4) - (4)])[AlgorithmItems]); ;}
    break;

  case 95:

/* Line 1455 of yacc.c  */
#line 428 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_WHEN_A((yyvsp[(2) - (5)])[Exp],(yyvsp[(4) - (5)])[AlgorithmItems],{}); ;}
    break;

  case 96:

/* Line 1455 of yacc.c  */
#line 430 "parserModelica.y"
    { (yyval)[Algorithm] = Absyn.ALG_WHEN_A((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[AlgorithmItems],(yyvsp[(5) - (6)])[AlgElsewhens]); ;}
    break;

  case 97:

/* Line 1455 of yacc.c  */
#line 432 "parserModelica.y"
    { (yyval)[AlgElsewhens] = (yyvsp[(1) - (1)])[AlgElsewhen]::{}; ;}
    break;

  case 98:

/* Line 1455 of yacc.c  */
#line 433 "parserModelica.y"
    { (yyval)[AlgElsewhens] = (yyvsp[(1) - (2)])[AlgElsewhen]::(yyvsp[(2) - (2)])[AlgElsewhens]; ;}
    break;

  case 99:

/* Line 1455 of yacc.c  */
#line 435 "parserModelica.y"
    { (yyval)[AlgElsewhen] = ((yyvsp[(2) - (4)])[Exp],(yyvsp[(4) - (4)])[AlgorithmItems]); ;}
    break;

  case 100:

/* Line 1455 of yacc.c  */
#line 439 "parserModelica.y"
    { (yyval)[EquationItems] = (yyvsp[(1) - (2)])[EquationItem]::{}; ;}
    break;

  case 101:

/* Line 1455 of yacc.c  */
#line 440 "parserModelica.y"
    { (yyval)[EquationItems] = (yyvsp[(1) - (3)])[EquationItem]::(yyvsp[(2) - (3)])[EquationItems]; ;}
    break;

  case 102:

/* Line 1455 of yacc.c  */
#line 443 "parserModelica.y"
    { (yyval)[EquationItem] = Absyn.EQUATIONITEM((yyvsp[(1) - (2)])[Equation],SOME((yyvsp[(2) - (2)])[Comment]),info); ;}
    break;

  case 103:

/* Line 1455 of yacc.c  */
#line 446 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_EQUALS((yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 104:

/* Line 1455 of yacc.c  */
#line 448 "parserModelica.y"
    { (yyval)[Equation] = (yyvsp[(1) - (1)])[Equation]; ;}
    break;

  case 105:

/* Line 1455 of yacc.c  */
#line 450 "parserModelica.y"
    { (yyval)[Equation] = (yyvsp[(1) - (1)])[Equation]; ;}
    break;

  case 106:

/* Line 1455 of yacc.c  */
#line 452 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_CONNECT((yyvsp[(3) - (6)])[ComponentRef],(yyvsp[(5) - (6)])[ComponentRef]); ;}
    break;

  case 107:

/* Line 1455 of yacc.c  */
#line 454 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_FOR((yyvsp[(3) - (5)])[ForIterators],(yyvsp[(5) - (5)])[EquationItems]); ;}
    break;

  case 108:

/* Line 1455 of yacc.c  */
#line 455 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_NORETCALL((yyvsp[(1) - (2)])[ComponentRef],(yyvsp[(2) - (2)])[FunctionArgs]); ;}
    break;

  case 109:

/* Line 1455 of yacc.c  */
#line 458 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_WHEN_E((yyvsp[(2) - (5)])[Exp],(yyvsp[(4) - (5)])[EquationItems],{}); ;}
    break;

  case 110:

/* Line 1455 of yacc.c  */
#line 460 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_WHEN_E((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[EquationItems],(yyvsp[(5) - (6)])[Elsewhens]); ;}
    break;

  case 111:

/* Line 1455 of yacc.c  */
#line 462 "parserModelica.y"
    { (yyval)[Elsewhens] = (yyvsp[(1) - (1)])[Elsewhen]::{}; ;}
    break;

  case 112:

/* Line 1455 of yacc.c  */
#line 463 "parserModelica.y"
    { (yyval)[Elsewhens] = (yyvsp[(1) - (2)])[Elsewhen]::(yyvsp[(2) - (2)])[Elsewhens]; ;}
    break;

  case 113:

/* Line 1455 of yacc.c  */
#line 465 "parserModelica.y"
    { (yyval)[Elsewhen] = ((yyvsp[(2) - (4)])[Exp],(yyvsp[(4) - (4)])[EquationItems]); ;}
    break;

  case 114:

/* Line 1455 of yacc.c  */
#line 467 "parserModelica.y"
    { (yyval)[ForIterators] = (yyvsp[(1) - (1)])[ForIterator]::{}; ;}
    break;

  case 115:

/* Line 1455 of yacc.c  */
#line 468 "parserModelica.y"
    { (yyval)[ForIterators] = (yyvsp[(1) - (3)])[ForIterator]::(yyvsp[(2) - (3)])[ForIterators]; ;}
    break;

  case 116:

/* Line 1455 of yacc.c  */
#line 470 "parserModelica.y"
    { (yyval)[ForIterator] = Absyn.ITERATOR((yyvsp[(1) - (1)]),NONE(),NONE()); ;}
    break;

  case 117:

/* Line 1455 of yacc.c  */
#line 471 "parserModelica.y"
    { (yyval)[ForIterator] = Absyn.ITERATOR((yyvsp[(1) - (3)]),NONE(),SOME((yyvsp[(3) - (3)])[Exp])); ;}
    break;

  case 118:

/* Line 1455 of yacc.c  */
#line 474 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (5)])[Exp],(yyvsp[(4) - (5)])[EquationItems],{},{}); ;}
    break;

  case 119:

/* Line 1455 of yacc.c  */
#line 476 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (7)])[Exp],(yyvsp[(4) - (7)])[EquationItems],{},(yyvsp[(6) - (7)])[EquationItems]); ;}
    break;

  case 120:

/* Line 1455 of yacc.c  */
#line 478 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[EquationItems],{},{}); ;}
    break;

  case 121:

/* Line 1455 of yacc.c  */
#line 480 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[EquationItems],(yyvsp[(5) - (6)])[Elseifs],{}); ;}
    break;

  case 122:

/* Line 1455 of yacc.c  */
#line 482 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (8)])[Exp],(yyvsp[(4) - (8)])[EquationItems],(yyvsp[(5) - (8)])[Elseifs],(yyvsp[(7) - (8)])[EquationItems]); ;}
    break;

  case 123:

/* Line 1455 of yacc.c  */
#line 484 "parserModelica.y"
    { (yyval)[Equation] = Absyn.EQ_IF((yyvsp[(2) - (7)])[Exp],(yyvsp[(4) - (7)])[EquationItems],(yyvsp[(5) - (7)])[Elseifs],{}); ;}
    break;

  case 124:

/* Line 1455 of yacc.c  */
#line 486 "parserModelica.y"
    { (yyval)[Elseifs] = (yyvsp[(1) - (1)])[Elseif]::{}; ;}
    break;

  case 125:

/* Line 1455 of yacc.c  */
#line 487 "parserModelica.y"
    { (yyval)[Elseifs] = (yyvsp[(1) - (2)])[Elseif]::(yyvsp[(2) - (2)])[Elseifs]; ;}
    break;

  case 126:

/* Line 1455 of yacc.c  */
#line 489 "parserModelica.y"
    { (yyval)[Elseif] = ((yyvsp[(2) - (4)])[Exp],(yyvsp[(4) - (4)])[EquationItems]); ;}
    break;

  case 127:

/* Line 1455 of yacc.c  */
#line 493 "parserModelica.y"
    { (yyval)[ElementItems] = (yyvsp[(1) - (1)])[ElementItem]::{}; ;}
    break;

  case 128:

/* Line 1455 of yacc.c  */
#line 494 "parserModelica.y"
    { (yyval)[ElementItems] = (yyvsp[(1) - (2)])[ElementItem]::(yyvsp[(2) - (2)])[ElementItems]; ;}
    break;

  case 129:

/* Line 1455 of yacc.c  */
#line 497 "parserModelica.y"
    { (yyval)[ElementItem] = Absyn.ELEMENTITEM((yyvsp[(1) - (2)])[Element]); ;}
    break;

  case 130:

/* Line 1455 of yacc.c  */
#line 498 "parserModelica.y"
    { (yyval)[ElementItem] = Absyn.ANNOTATIONITEM((yyvsp[(1) - (2)])[Annotation]); ;}
    break;

  case 131:

/* Line 1455 of yacc.c  */
#line 501 "parserModelica.y"
    { (yyval)[Element] = (yyvsp[(1) - (1)])[Element]; ;}
    break;

  case 132:

/* Line 1455 of yacc.c  */
#line 503 "parserModelica.y"
    { (yyval)[Element] = (yyvsp[(1) - (1)])[Element]; ;}
    break;

  case 133:

/* Line 1455 of yacc.c  */
#line 505 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"IMPORT",(yyvsp[(1) - (1)])[ElementSpec],info,NONE()); ;}
    break;

  case 134:

/* Line 1455 of yacc.c  */
#line 507 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"EXTENDS",(yyvsp[(1) - (1)])[ElementSpec],info,NONE()); ;}
    break;

  case 135:

/* Line 1455 of yacc.c  */
#line 509 "parserModelica.y"
    { (yyval)[Element] = (yyvsp[(1) - (1)])[Element]; ;}
    break;

  case 136:

/* Line 1455 of yacc.c  */
#line 511 "parserModelica.y"
    { (yyval)[Element] = Absyn.DEFINEUNIT((yyvsp[(2) - (2)])[Ident],{}); ;}
    break;

  case 137:

/* Line 1455 of yacc.c  */
#line 512 "parserModelica.y"
    { (yyval)[Element] = Absyn.DEFINEUNIT((yyvsp[(2) - (5)])[Ident],(yyvsp[(4) - (5)])[NamedArgs]); ;}
    break;

  case 138:

/* Line 1455 of yacc.c  */
#line 516 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"??",(yyvsp[(1) - (1)])[ElementSpec],info,NONE()); ;}
    break;

  case 139:

/* Line 1455 of yacc.c  */
#line 518 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,SOME(Absyn.REDECLARE()),Absyn.NOT_INNER_OUTER(),"CLASS",(yyvsp[(1) - (2)])[ElementSpec],info,NONE()); ;}
    break;

  case 140:

/* Line 1455 of yacc.c  */
#line 524 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,NONE(),Absyn.NOT_INNER_OUTER(),"component",(yyvsp[(1) - (1)])[ElementSpec],info,NONE()); ;}
    break;

  case 141:

/* Line 1455 of yacc.c  */
#line 526 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(false,NONE(),(yyvsp[(1) - (2)])[InnerOuter],"INNEROUTTER ELEMENTSPEC",(yyvsp[(2) - (2)])[ElementSpec],info,NONE()); ;}
    break;

  case 142:

/* Line 1455 of yacc.c  */
#line 528 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT((yyvsp[(2) - (4)])[Boolean],SOME((yyvsp[(1) - (4)])[RedeclareKeywords]),(yyvsp[(3) - (4)])[InnerOuter],"REDE ELEMENTSPEC",(yyvsp[(4) - (4)])[ElementSpec],info,NONE()); ;}
    break;

  case 143:

/* Line 1455 of yacc.c  */
#line 530 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT((yyvsp[(2) - (3)])[Boolean],SOME((yyvsp[(1) - (3)])[RedeclareKeywords]),Absyn.NOT_INNER_OUTER(),"REDE ELEMENTSPEC",(yyvsp[(3) - (3)])[ElementSpec],info,NONE()); ;}
    break;

  case 144:

/* Line 1455 of yacc.c  */
#line 532 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT((yyvsp[(2) - (4)])[Boolean],SOME((yyvsp[(1) - (4)])[RedeclareKeywords]),Absyn.NOT_INNER_OUTER(),"REDE ELEMENTSPEC",(yyvsp[(3) - (4)])[ElementSpec],info,SOME((yyvsp[(4) - (4)])[ConstrainClass])); ;}
    break;

  case 145:

/* Line 1455 of yacc.c  */
#line 534 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(true,NONE(),Absyn.NOT_INNER_OUTER(),"FINAL ELEMENTSPEC",(yyvsp[(2) - (2)])[ElementSpec],info,NONE()); ;}
    break;

  case 146:

/* Line 1455 of yacc.c  */
#line 536 "parserModelica.y"
    { (yyval)[Element] = Absyn.ELEMENT(true,NONE(),(yyvsp[(2) - (3)])[InnerOuter],"FINAL INNEROUTER ELEMENTSPEC",(yyvsp[(3) - (3)])[ElementSpec],info,NONE()); ;}
    break;

  case 147:

/* Line 1455 of yacc.c  */
#line 538 "parserModelica.y"
    { (yyval)[ComponentItems] = (yyvsp[(1) - (1)])[ComponentItem]::{}; ;}
    break;

  case 148:

/* Line 1455 of yacc.c  */
#line 539 "parserModelica.y"
    { (yyval)[ComponentItems] = (yyvsp[(1) - (3)])[ComponentItem]::(yyvsp[(2) - (3)])[ComponentItems]; ;}
    break;

  case 149:

/* Line 1455 of yacc.c  */
#line 541 "parserModelica.y"
    { (yyval)[ComponentItem] = Absyn.COMPONENTITEM((yyvsp[(1) - (2)])[Component],NONE(),SOME((yyvsp[(2) - (2)])[Comment])); ;}
    break;

  case 150:

/* Line 1455 of yacc.c  */
#line 542 "parserModelica.y"
    { (yyval)[ComponentItem] = Absyn.COMPONENTITEM((yyvsp[(1) - (3)])[Component],SOME((yyvsp[(2) - (3)])[ComponentCondition]),SOME((yyvsp[(3) - (3)])[Comment])); ;}
    break;

  case 151:

/* Line 1455 of yacc.c  */
#line 544 "parserModelica.y"
    { (yyval)[ComponentCondition] = (yyvsp[(1) - (2)])[Exp]; ;}
    break;

  case 152:

/* Line 1455 of yacc.c  */
#line 546 "parserModelica.y"
    { (yyval)[Component] = Absyn.COMPONENT((yyvsp[(1) - (3)])[Ident],(yyvsp[(2) - (3)])[ArrayDim],SOME((yyvsp[(3) - (3)])[Modification])); ;}
    break;

  case 153:

/* Line 1455 of yacc.c  */
#line 547 "parserModelica.y"
    { (yyval)[Component] = Absyn.COMPONENT((yyvsp[(1) - (2)])[Ident],(yyvsp[(2) - (2)])[ArrayDim],NONE()); ;}
    break;

  case 154:

/* Line 1455 of yacc.c  */
#line 549 "parserModelica.y"
    { (yyval)[Modification] = Absyn.CLASSMOD({},Absyn.EQMOD((yyvsp[(2) - (2)])[Exp],info)); ;}
    break;

  case 155:

/* Line 1455 of yacc.c  */
#line 550 "parserModelica.y"
    { (yyval)[Modification] = Absyn.CLASSMOD({},Absyn.EQMOD((yyvsp[(2) - (2)])[Exp],info)); ;}
    break;

  case 156:

/* Line 1455 of yacc.c  */
#line 551 "parserModelica.y"
    { (yyval)[Modification] = (yyvsp[(1) - (1)])[Modification]; ;}
    break;

  case 157:

/* Line 1455 of yacc.c  */
#line 554 "parserModelica.y"
    { (yyval)[Modification] = Absyn.CLASSMOD((yyvsp[(1) - (1)])[ElementArgs],Absyn.NOMOD()); ;}
    break;

  case 158:

/* Line 1455 of yacc.c  */
#line 556 "parserModelica.y"
    { (yyval)[Modification] = Absyn.CLASSMOD((yyvsp[(1) - (3)])[ElementArgs],Absyn.EQMOD((yyvsp[(3) - (3)])[Exp],info)); ;}
    break;

  case 159:

/* Line 1455 of yacc.c  */
#line 558 "parserModelica.y"
    { (yyval)[Annotation]= Absyn.ANNOTATION((yyvsp[(1) - (2)])[ElementArgs]); ;}
    break;

  case 160:

/* Line 1455 of yacc.c  */
#line 560 "parserModelica.y"
    { (yyval)[ElementArgs] = (yyvsp[(1) - (3)])[ElementArgs]; ;}
    break;

  case 161:

/* Line 1455 of yacc.c  */
#line 562 "parserModelica.y"
    { (yyval)[ElementArgs] = (yyvsp[(1) - (3)])[ElementArgs]; ;}
    break;

  case 162:

/* Line 1455 of yacc.c  */
#line 563 "parserModelica.y"
    { (yyval)[ElementArgs] = {}; ;}
    break;

  case 163:

/* Line 1455 of yacc.c  */
#line 565 "parserModelica.y"
    { (yyval)[ElementArgs] = {(yyvsp[(1) - (1)])[ElementArg]}; ;}
    break;

  case 164:

/* Line 1455 of yacc.c  */
#line 566 "parserModelica.y"
    { (yyval)[ElementArgs] = (yyvsp[(1) - (3)])[ElementArg]::(yyvsp[(2) - (3)])[ElementArgs]; ;}
    break;

  case 165:

/* Line 1455 of yacc.c  */
#line 568 "parserModelica.y"
    { (yyval)[ElementArg] = (yyvsp[(1) - (1)])[ElementArg]; ;}
    break;

  case 166:

/* Line 1455 of yacc.c  */
#line 569 "parserModelica.y"
    { (yyval)[ElementArg] = (yyvsp[(1) - (1)])[ElementArg]; ;}
    break;

  case 167:

/* Line 1455 of yacc.c  */
#line 571 "parserModelica.y"
    { (yyval)[ElementArg] = (yyvsp[(1) - (1)])[ElementArg]; ;}
    break;

  case 168:

/* Line 1455 of yacc.c  */
#line 572 "parserModelica.y"
    { (yyval)[ElementArg] = (yyvsp[(1) - (1)])[ElementArg]; ;}
    break;

  case 169:

/* Line 1455 of yacc.c  */
#line 575 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.MODIFICATION((yyvsp[(2) - (3)])[Boolean],(yyvsp[(1) - (3)])[Each],(yyvsp[(3) - (3)])[ComponentRef],NONE(),NONE(),info); ;}
    break;

  case 170:

/* Line 1455 of yacc.c  */
#line 577 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.MODIFICATION((yyvsp[(2) - (4)])[Boolean],(yyvsp[(1) - (4)])[Each],(yyvsp[(3) - (4)])[ComponentRef],SOME((yyvsp[(4) - (4)])[Modification]),NONE(),info); ;}
    break;

  case 171:

/* Line 1455 of yacc.c  */
#line 579 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.MODIFICATION((yyvsp[(2) - (4)])[Boolean],(yyvsp[(1) - (4)])[Each],(yyvsp[(3) - (4)])[ComponentRef],NONE(),SOME((yyvsp[(4) - (4)])),info); ;}
    break;

  case 172:

/* Line 1455 of yacc.c  */
#line 581 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.MODIFICATION((yyvsp[(2) - (5)])[Boolean],(yyvsp[(1) - (5)])[Each],(yyvsp[(3) - (5)])[ComponentRef],SOME((yyvsp[(4) - (5)])[Modification]),SOME((yyvsp[(5) - (5)])),info); ;}
    break;

  case 173:

/* Line 1455 of yacc.c  */
#line 585 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (4)])[Boolean],Absyn.REPLACEABLE(),(yyvsp[(2) - (4)])[Each],(yyvsp[(4) - (4)])[ElementSpec],NONE(),info); ;}
    break;

  case 174:

/* Line 1455 of yacc.c  */
#line 587 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (4)])[Boolean],Absyn.REPLACEABLE(),(yyvsp[(2) - (4)])[Each],(yyvsp[(4) - (4)])[ElementSpec],NONE(),info); ;}
    break;

  case 175:

/* Line 1455 of yacc.c  */
#line 589 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (5)])[Boolean],Absyn.REDECLARE(),(yyvsp[(2) - (5)])[Each],(yyvsp[(4) - (5)])[ElementSpec],SOME((yyvsp[(5) - (5)])[ConstrainClass]),info); ;}
    break;

  case 176:

/* Line 1455 of yacc.c  */
#line 591 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (5)])[Boolean],Absyn.REDECLARE(),(yyvsp[(2) - (5)])[Each],(yyvsp[(4) - (5)])[ElementSpec],SOME((yyvsp[(5) - (5)])[ConstrainClass]),info); ;}
    break;

  case 177:

/* Line 1455 of yacc.c  */
#line 595 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (4)])[Boolean],Absyn.REDECLARE(),(yyvsp[(2) - (4)])[Each],(yyvsp[(4) - (4)])[ElementSpec],NONE(),info); ;}
    break;

  case 178:

/* Line 1455 of yacc.c  */
#line 597 "parserModelica.y"
    { (yyval)[ElementArg] = Absyn.REDECLARATION((yyvsp[(3) - (4)])[Boolean],Absyn.REDECLARE(),(yyvsp[(2) - (4)])[Each],(yyvsp[(4) - (4)])[ElementSpec],NONE(),info); ;}
    break;

  case 179:

/* Line 1455 of yacc.c  */
#line 601 "parserModelica.y"
    { ((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec]) = fixArray((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec]);
                          (yyval)[ElementSpec] = Absyn.COMPONENTS((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec],(yyvsp[(3) - (3)])[ComponentItems]); ;}
    break;

  case 180:

/* Line 1455 of yacc.c  */
#line 604 "parserModelica.y"
    { (v1ElementAttributes,(yyvsp[(1) - (2)])[TypeSpec]) = fixArray(Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),Absyn.VAR(), Absyn.BIDIR(),{}),(yyvsp[(1) - (2)])[TypeSpec]); 
                         (yyval)[ElementSpec] = Absyn.COMPONENTS(v1ElementAttributes,(yyvsp[(1) - (2)])[TypeSpec],(yyvsp[(2) - (2)])[ComponentItems]); ;}
    break;

  case 181:

/* Line 1455 of yacc.c  */
#line 607 "parserModelica.y"
    { (yyval)[ComponentItems] = {Absyn.COMPONENTITEM((yyvsp[(1) - (2)])[Component],NONE(),SOME((yyvsp[(2) - (2)])[Comment]))}; ;}
    break;

  case 182:

/* Line 1455 of yacc.c  */
#line 609 "parserModelica.y"
    { (yyval)[Each]= Absyn.EACH(); ;}
    break;

  case 183:

/* Line 1455 of yacc.c  */
#line 610 "parserModelica.y"
    { (yyval)[Each]= Absyn.NON_EACH(); ;}
    break;

  case 184:

/* Line 1455 of yacc.c  */
#line 612 "parserModelica.y"
    { (yyval)[RedeclareKeywords] = Absyn.REDECLARE(); ;}
    break;

  case 185:

/* Line 1455 of yacc.c  */
#line 613 "parserModelica.y"
    { (yyval)[RedeclareKeywords] = Absyn.REPLACEABLE(); ;}
    break;

  case 186:

/* Line 1455 of yacc.c  */
#line 614 "parserModelica.y"
    { (yyval)[RedeclareKeywords] = Absyn.REDECLARE_REPLACEABLE(); ;}
    break;

  case 187:

/* Line 1455 of yacc.c  */
#line 616 "parserModelica.y"
    { (yyval)[InnerOuter] = Absyn.INNER(); ;}
    break;

  case 188:

/* Line 1455 of yacc.c  */
#line 617 "parserModelica.y"
    { (yyval)[InnerOuter] = Absyn.OUTER(); ;}
    break;

  case 189:

/* Line 1455 of yacc.c  */
#line 618 "parserModelica.y"
    { (yyval)[InnerOuter] = Absyn.INNER_OUTER(); ;}
    break;

  case 190:

/* Line 1455 of yacc.c  */
#line 622 "parserModelica.y"
    { (yyval)[ElementSpec] = Absyn.IMPORT((yyvsp[(1) - (2)])[Import],SOME((yyvsp[(2) - (2)])[Comment]),info); ;}
    break;

  case 191:

/* Line 1455 of yacc.c  */
#line 624 "parserModelica.y"
    { (yyval)[ElementSpec] = Absyn.CLASSDEF(false,(yyvsp[(1) - (1)])[Class]); ;}
    break;

  case 192:

/* Line 1455 of yacc.c  */
#line 625 "parserModelica.y"
    { (yyval)[ElementSpec] = Absyn.CLASSDEF(true,(yyvsp[(2) - (2)])[Class]); ;}
    break;

  case 193:

/* Line 1455 of yacc.c  */
#line 627 "parserModelica.y"
    { (yyval)[Import] = Absyn.QUAL_IMPORT((yyvsp[(2) - (2)])[Path]); ;}
    break;

  case 194:

/* Line 1455 of yacc.c  */
#line 628 "parserModelica.y"
    { (yyval)[Import] = Absyn.UNQUAL_IMPORT((yyvsp[(2) - (3)])[Path]); ;}
    break;

  case 195:

/* Line 1455 of yacc.c  */
#line 629 "parserModelica.y"
    { (yyval)[Import] = Absyn.NAMED_IMPORT((yyvsp[(2) - (4)])[Ident],(yyvsp[(4) - (4)])[Path]); ;}
    break;

  case 196:

/* Line 1455 of yacc.c  */
#line 632 "parserModelica.y"
    { (yyval)[ElementSpec] = Absyn.EXTENDS((yyvsp[(2) - (3)])[Path],(yyvsp[(3) - (3)])[ElementArgs],NONE()); ;}
    break;

  case 197:

/* Line 1455 of yacc.c  */
#line 634 "parserModelica.y"
    { (yyval)[ElementSpec] = Absyn.EXTENDS((yyvsp[(2) - (4)])[Path],(yyvsp[(3) - (4)])[ElementArgs],SOME((yyvsp[(4) - (4)])[Annotation])); ;}
    break;

  case 198:

/* Line 1455 of yacc.c  */
#line 636 "parserModelica.y"
    { (yyval)[ConstrainClass]= Absyn.CONSTRAINCLASS((yyvsp[(1) - (1)])[ElementSpec],NONE()); ;}
    break;

  case 199:

/* Line 1455 of yacc.c  */
#line 637 "parserModelica.y"
    { (yyval)[ConstrainClass]= Absyn.CONSTRAINCLASS(Absyn.EXTENDS((yyvsp[(2) - (3)])[Path],(yyvsp[(3) - (3)])[ElementArgs],NONE()),NONE()); ;}
    break;

  case 200:

/* Line 1455 of yacc.c  */
#line 640 "parserModelica.y"
    { ((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec]) = fixArray((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec]);
                          (yyval)[ElementSpec] = Absyn.COMPONENTS((yyvsp[(1) - (3)])[ElementAttributes],(yyvsp[(2) - (3)])[TypeSpec],(yyvsp[(3) - (3)])[ComponentItems]); ;}
    break;

  case 201:

/* Line 1455 of yacc.c  */
#line 643 "parserModelica.y"
    { (v1ElementAttributes,(yyvsp[(1) - (2)])[TypeSpec]) = fixArray(Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),Absyn.VAR(), Absyn.BIDIR(),{}),(yyvsp[(1) - (2)])[TypeSpec]); 
                         (yyval)[ElementSpec] = Absyn.COMPONENTS(v1ElementAttributes,(yyvsp[(1) - (2)])[TypeSpec],(yyvsp[(2) - (2)])[ComponentItems]); ;}
    break;

  case 202:

/* Line 1455 of yacc.c  */
#line 647 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),Absyn.VAR(), (yyvsp[(1) - (1)])[Direction],{}); ;}
    break;

  case 203:

/* Line 1455 of yacc.c  */
#line 649 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),(yyvsp[(1) - (1)])[Variability], Absyn.BIDIR(),{}); ;}
    break;

  case 204:

/* Line 1455 of yacc.c  */
#line 652 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(false,false,Absyn.NON_PARALLEL(),(yyvsp[(1) - (2)])[Variability], (yyvsp[(2) - (2)])[Direction],{}); ;}
    break;

  case 205:

/* Line 1455 of yacc.c  */
#line 655 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(false,true,Absyn.NON_PARALLEL(),(yyvsp[(2) - (3)])[Variability], (yyvsp[(3) - (3)])[Direction],{}); ;}
    break;

  case 206:

/* Line 1455 of yacc.c  */
#line 657 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(true,false,Absyn.NON_PARALLEL(),(yyvsp[(2) - (3)])[Variability], (yyvsp[(3) - (3)])[Direction],{}); ;}
    break;

  case 207:

/* Line 1455 of yacc.c  */
#line 659 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(true,false,Absyn.NON_PARALLEL(),Absyn.VAR(), (yyvsp[(2) - (2)])[Direction],{}); ;}
    break;

  case 208:

/* Line 1455 of yacc.c  */
#line 661 "parserModelica.y"
    { (yyval)[ElementAttributes] = Absyn.ATTR(true,false,Absyn.NON_PARALLEL(),Absyn.VAR(),Absyn.BIDIR(),{}); ;}
    break;

  case 209:

/* Line 1455 of yacc.c  */
#line 664 "parserModelica.y"
    { (yyval)[Variability] = Absyn.PARAM(); ;}
    break;

  case 210:

/* Line 1455 of yacc.c  */
#line 665 "parserModelica.y"
    { (yyval)[Variability] = Absyn.CONST(); ;}
    break;

  case 211:

/* Line 1455 of yacc.c  */
#line 666 "parserModelica.y"
    { (yyval)[Variability] = Absyn.DISCRETE(); ;}
    break;

  case 212:

/* Line 1455 of yacc.c  */
#line 669 "parserModelica.y"
    { (yyval)[Direction] = Absyn.INPUT(); ;}
    break;

  case 213:

/* Line 1455 of yacc.c  */
#line 670 "parserModelica.y"
    { (yyval)[Direction] = Absyn.OUTPUT(); ;}
    break;

  case 214:

/* Line 1455 of yacc.c  */
#line 675 "parserModelica.y"
    { (yyval)[TypeSpec] = Absyn.TPATH((yyvsp[(1) - (2)])[Path],SOME((yyvsp[(2) - (2)])[ArrayDim])); ;}
    break;

  case 215:

/* Line 1455 of yacc.c  */
#line 676 "parserModelica.y"
    { (yyval)[TypeSpec] = Absyn.TCOMPLEX((yyvsp[(1) - (2)])[Path],(yyvsp[(2) - (2)])[TypeSpecs],NONE()); ;}
    break;

  case 216:

/* Line 1455 of yacc.c  */
#line 678 "parserModelica.y"
    { (yyval)[TypeSpecs] = (yyvsp[(1) - (3)])[TypeSpecs]; ;}
    break;

  case 217:

/* Line 1455 of yacc.c  */
#line 680 "parserModelica.y"
    { (yyval)[TypeSpecs] = (yyvsp[(1) - (1)])[TypeSpec]::{}; ;}
    break;

  case 218:

/* Line 1455 of yacc.c  */
#line 681 "parserModelica.y"
    { (yyval)[TypeSpecs] = (yyvsp[(1) - (3)])[TypeSpec]::(yyvsp[(2) - (3)])[TypeSpecs]; ;}
    break;

  case 219:

/* Line 1455 of yacc.c  */
#line 683 "parserModelica.y"
    { (yyval)[ArrayDim] = (yyvsp[(1) - (3)])[ArrayDim]; ;}
    break;

  case 220:

/* Line 1455 of yacc.c  */
#line 684 "parserModelica.y"
    { (yyval)[ArrayDim] = {}; ;}
    break;

  case 221:

/* Line 1455 of yacc.c  */
#line 686 "parserModelica.y"
    { (yyval)[ArrayDim] = (yyvsp[(1) - (1)])[Subscript]::{}; ;}
    break;

  case 222:

/* Line 1455 of yacc.c  */
#line 687 "parserModelica.y"
    { (yyval)[ArrayDim] = (yyvsp[(1) - (3)])[Subscript]::(yyvsp[(2) - (3)])[ArrayDim]; ;}
    break;

  case 223:

/* Line 1455 of yacc.c  */
#line 689 "parserModelica.y"
    { (yyval)[Subscript] = Absyn.SUBSCRIPT((yyvsp[(1) - (1)])[Exp]); ;}
    break;

  case 224:

/* Line 1455 of yacc.c  */
#line 690 "parserModelica.y"
    { (yyval)[Subscript] = Absyn.NOSUB(); ;}
    break;

  case 225:

/* Line 1455 of yacc.c  */
#line 694 "parserModelica.y"
    { (yyval)[FunctionArgs] = (yyvsp[(1) - (3)])[FunctionArgs]; ;}
    break;

  case 226:

/* Line 1455 of yacc.c  */
#line 697 "parserModelica.y"
    { (yyval)[FunctionArgs] = Absyn.FUNCTIONARGS({},(yyvsp[(1) - (1)])[NamedArgs]); ;}
    break;

  case 227:

/* Line 1455 of yacc.c  */
#line 698 "parserModelica.y"
    { (yyval)[FunctionArgs]= (yyvsp[(1) - (1)])[FunctionArgs]; ;}
    break;

  case 228:

/* Line 1455 of yacc.c  */
#line 699 "parserModelica.y"
    { (yyval)[FunctionArgs]= (yyvsp[(1) - (1)])[FunctionArgs]; ;}
    break;

  case 229:

/* Line 1455 of yacc.c  */
#line 704 "parserModelica.y"
    { (yyval)[FunctionArgs] = Absyn.FUNCTIONARGS((yyvsp[(1) - (1)])[Exps],{}); ;}
    break;

  case 230:

/* Line 1455 of yacc.c  */
#line 706 "parserModelica.y"
    { (yyval)[FunctionArgs] = Absyn.FUNCTIONARGS((yyvsp[(1) - (3)])[Exps],(yyvsp[(3) - (3)])[NamedArgs]); ;}
    break;

  case 231:

/* Line 1455 of yacc.c  */
#line 711 "parserModelica.y"
    { (yyval)[FunctionArgs] = Absyn.FOR_ITER_FARG((yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[ForIterators]); ;}
    break;

  case 232:

/* Line 1455 of yacc.c  */
#line 714 "parserModelica.y"
    { (yyval)[NamedArgs] = (yyvsp[(1) - (1)])[NamedArg]::{}; ;}
    break;

  case 233:

/* Line 1455 of yacc.c  */
#line 715 "parserModelica.y"
    { (yyval)[NamedArgs] = (yyvsp[(1) - (3)])[NamedArg]::(yyvsp[(2) - (3)])[NamedArgs]; ;}
    break;

  case 234:

/* Line 1455 of yacc.c  */
#line 718 "parserModelica.y"
    { (yyval)[NamedArg] = Absyn.NAMEDARG((yyvsp[(1) - (3)])[Ident],(yyvsp[(2) - (3)])[Exp]);  ;}
    break;

  case 235:

/* Line 1455 of yacc.c  */
#line 722 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 236:

/* Line 1455 of yacc.c  */
#line 723 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 237:

/* Line 1455 of yacc.c  */
#line 724 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 238:

/* Line 1455 of yacc.c  */
#line 726 "parserModelica.y"
    { (yyval)[Exp] = Absyn.MATCHEXP(Absyn.MATCH(),(yyvsp[(2) - (4)])[Exp],{},(yyvsp[(3) - (4)])[Cases],NONE()); ;}
    break;

  case 239:

/* Line 1455 of yacc.c  */
#line 727 "parserModelica.y"
    { (yyval)[Exp] = Absyn.MATCHEXP(Absyn.MATCH(),(yyvsp[(2) - (5)])[Exp],(yyvsp[(3) - (5)])[ElementItems],(yyvsp[(4) - (5)])[Cases],NONE()); ;}
    break;

  case 240:

/* Line 1455 of yacc.c  */
#line 728 "parserModelica.y"
    { (yyval)[Exp] = Absyn.MATCHEXP(Absyn.MATCHCONTINUE(),(yyvsp[(2) - (4)])[Exp],{},(yyvsp[(3) - (4)])[Cases],NONE()); ;}
    break;

  case 241:

/* Line 1455 of yacc.c  */
#line 729 "parserModelica.y"
    { (yyval)[Exp] = Absyn.MATCHEXP(Absyn.MATCHCONTINUE(),(yyvsp[(2) - (5)])[Exp],(yyvsp[(3) - (5)])[ElementItems],(yyvsp[(4) - (5)])[Cases],NONE()); ;}
    break;

  case 242:

/* Line 1455 of yacc.c  */
#line 732 "parserModelica.y"
    { (yyval)[Exp] = Absyn.IFEXP((yyvsp[(2) - (6)])[Exp],(yyvsp[(4) - (6)])[Exp],(yyvsp[(6) - (6)])[Exp],{}); ;}
    break;

  case 243:

/* Line 1455 of yacc.c  */
#line 733 "parserModelica.y"
    { (yyval)[Exp] = Absyn.IFEXP((yyvsp[(2) - (7)])[Exp],(yyvsp[(4) - (7)])[Exp],(yyvsp[(7) - (7)])[Exp],(yyvsp[(5) - (7)])[ExpElseifs]); ;}
    break;

  case 244:

/* Line 1455 of yacc.c  */
#line 735 "parserModelica.y"
    { (yyval)[ExpElseifs] = (yyvsp[(1) - (1)])[ExpElseif]::{}; ;}
    break;

  case 245:

/* Line 1455 of yacc.c  */
#line 736 "parserModelica.y"
    { (yyval)[ExpElseifs] = (yyvsp[(1) - (2)])[ExpElseif]::(yyvsp[(2) - (2)])[ExpElseifs]; ;}
    break;

  case 246:

/* Line 1455 of yacc.c  */
#line 738 "parserModelica.y"
    { (yyval)[ExpElseif] = ((yyvsp[(2) - (4)])[Exp],(yyvsp[(4) - (4)])[Exp]); ;}
    break;

  case 247:

/* Line 1455 of yacc.c  */
#line 741 "parserModelica.y"
    { (yyval)[ElementItems] = (yyvsp[(1) - (2)])[ElementItems]; ;}
    break;

  case 248:

/* Line 1455 of yacc.c  */
#line 743 "parserModelica.y"
    { (yyval)[Cases] = (yyvsp[(1) - (1)])[Case]::{}; ;}
    break;

  case 249:

/* Line 1455 of yacc.c  */
#line 744 "parserModelica.y"
    { (yyval)[Cases] = (yyvsp[(1) - (2)])[Case]::(yyvsp[(2) - (2)])[Cases]; ;}
    break;

  case 250:

/* Line 1455 of yacc.c  */
#line 747 "parserModelica.y"
    { (yyval)[Case] = Absyn.CASE((yyvsp[(2) - (5)])[Exp],info,{},{},(yyvsp[(4) - (5)])[Exp],info,NONE(),info); ;}
    break;

  case 251:

/* Line 1455 of yacc.c  */
#line 749 "parserModelica.y"
    { (yyval)[Case] = Absyn.CASE((yyvsp[(2) - (6)])[Exp],info,{},{},(yyvsp[(4) - (6)])[Exp],info,NONE(),info);  ;}
    break;

  case 252:

/* Line 1455 of yacc.c  */
#line 751 "parserModelica.y"
    { (yyval)[Case] = Absyn.CASE((yyvsp[(2) - (7)])[Exp],info,{},(yyvsp[(4) - (7)])[EquationItems],(yyvsp[(6) - (7)])[Exp],info,NONE(),info); ;}
    break;

  case 253:

/* Line 1455 of yacc.c  */
#line 753 "parserModelica.y"
    { (yyval)[Case] = Absyn.ELSE({},{},(yyvsp[(3) - (4)])[Exp],info,NONE(),info); ;}
    break;

  case 254:

/* Line 1455 of yacc.c  */
#line 755 "parserModelica.y"
    { (yyval)[Case] = Absyn.ELSE({},(yyvsp[(3) - (6)])[EquationItems],(yyvsp[(5) - (6)])[Exp],info,NONE(),info); ;}
    break;

  case 255:

/* Line 1455 of yacc.c  */
#line 757 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 256:

/* Line 1455 of yacc.c  */
#line 760 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 257:

/* Line 1455 of yacc.c  */
#line 761 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 258:

/* Line 1455 of yacc.c  */
#line 762 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 259:

/* Line 1455 of yacc.c  */
#line 763 "parserModelica.y"
    { (yyval)[Exp] = Absyn.AS((yyvsp[(1) - (3)])[Ident],(yyvsp[(2) - (3)])[Exp]); ;}
    break;

  case 260:

/* Line 1455 of yacc.c  */
#line 765 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CONS((yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 261:

/* Line 1455 of yacc.c  */
#line 766 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CONS((yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 262:

/* Line 1455 of yacc.c  */
#line 768 "parserModelica.y"
    { (yyval)[Exp] = Absyn.RANGE((yyvsp[(1) - (3)])[Exp],NONE(),(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 263:

/* Line 1455 of yacc.c  */
#line 769 "parserModelica.y"
    { (yyval)[Exp] = Absyn.RANGE((yyvsp[(1) - (5)])[Exp],SOME((yyvsp[(3) - (5)])[Exp]),(yyvsp[(5) - (5)])[Exp]); ;}
    break;

  case 264:

/* Line 1455 of yacc.c  */
#line 771 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 265:

/* Line 1455 of yacc.c  */
#line 772 "parserModelica.y"
    { (yyval)[Exp] = Absyn.LBINARY((yyvsp[(1) - (3)])[Exp],Absyn.OR(),(yyvsp[(2) - (3)])[Exp]); ;}
    break;

  case 266:

/* Line 1455 of yacc.c  */
#line 774 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 267:

/* Line 1455 of yacc.c  */
#line 775 "parserModelica.y"
    { (yyval)[Exp] = Absyn.LBINARY((yyvsp[(1) - (3)])[Exp],Absyn.AND(),(yyvsp[(2) - (3)])[Exp]); ;}
    break;

  case 268:

/* Line 1455 of yacc.c  */
#line 777 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 269:

/* Line 1455 of yacc.c  */
#line 778 "parserModelica.y"
    { (yyval)[Exp] = Absyn.LUNARY(Absyn.NOT(),(yyvsp[(1) - (2)])[Exp]); ;}
    break;

  case 270:

/* Line 1455 of yacc.c  */
#line 780 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 271:

/* Line 1455 of yacc.c  */
#line 781 "parserModelica.y"
    { (yyval)[Exp] = Absyn.RELATION((yyvsp[(1) - (3)])[Exp],(yyvsp[(2) - (3)])[Operator],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 272:

/* Line 1455 of yacc.c  */
#line 783 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 273:

/* Line 1455 of yacc.c  */
#line 784 "parserModelica.y"
    { (yyval)[Exp] = Absyn.UNARY((yyvsp[(1) - (2)])[Operator],(yyvsp[(2) - (2)])[Exp]); ;}
    break;

  case 274:

/* Line 1455 of yacc.c  */
#line 785 "parserModelica.y"
    { (yyval)[Exp] = Absyn.BINARY((yyvsp[(1) - (3)])[Exp],(yyvsp[(2) - (3)])[Operator],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 275:

/* Line 1455 of yacc.c  */
#line 787 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 276:

/* Line 1455 of yacc.c  */
#line 788 "parserModelica.y"
    { (yyval)[Exp] = Absyn.BINARY((yyvsp[(1) - (3)])[Exp],(yyvsp[(2) - (3)])[Operator],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 277:

/* Line 1455 of yacc.c  */
#line 790 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 278:

/* Line 1455 of yacc.c  */
#line 791 "parserModelica.y"
    { (yyval)[Exp] = Absyn.BINARY((yyvsp[(1) - (3)])[Exp],(yyvsp[(2) - (3)])[Operator],(yyvsp[(3) - (3)])[Exp]); ;}
    break;

  case 279:

/* Line 1455 of yacc.c  */
#line 793 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 280:

/* Line 1455 of yacc.c  */
#line 794 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CREF((yyvsp[(1) - (1)])[ComponentRef]); ;}
    break;

  case 281:

/* Line 1455 of yacc.c  */
#line 795 "parserModelica.y"
    { (yyval)[Exp] = Absyn.BOOL(false); ;}
    break;

  case 282:

/* Line 1455 of yacc.c  */
#line 796 "parserModelica.y"
    { (yyval)[Exp] = Absyn.BOOL(true); ;}
    break;

  case 283:

/* Line 1455 of yacc.c  */
#line 797 "parserModelica.y"
    { (yyval)[Exp] = Absyn.STRING((yyvsp[(1) - (1)])); ;}
    break;

  case 284:

/* Line 1455 of yacc.c  */
#line 798 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(1) - (1)])[Exp]; ;}
    break;

  case 285:

/* Line 1455 of yacc.c  */
#line 799 "parserModelica.y"
    { (yyval)[Exp] = Absyn.ARRAY((yyvsp[(2) - (3)])[Exps]); ;}
    break;

  case 286:

/* Line 1455 of yacc.c  */
#line 800 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CALL(Absyn.CREF_IDENT("array",{}),(yyvsp[(2) - (3)])[FunctionArgs]); ;}
    break;

  case 287:

/* Line 1455 of yacc.c  */
#line 801 "parserModelica.y"
    { (yyval)[Exp] = Absyn.MATRIX((yyvsp[(2) - (3)])[Matrix]); ;}
    break;

  case 288:

/* Line 1455 of yacc.c  */
#line 802 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CALL((yyvsp[(1) - (2)])[ComponentRef],(yyvsp[(2) - (2)])[FunctionArgs]); ;}
    break;

  case 289:

/* Line 1455 of yacc.c  */
#line 803 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CALL(Absyn.CREF_IDENT("der",{}),(yyvsp[(2) - (2)])[FunctionArgs]); ;}
    break;

  case 290:

/* Line 1455 of yacc.c  */
#line 804 "parserModelica.y"
    { (yyval)[Exp] = Absyn.CALL(Absyn.CREF_IDENT("initial",{}),(yyvsp[(2) - (2)])[FunctionArgs]); ;}
    break;

  case 291:

/* Line 1455 of yacc.c  */
#line 805 "parserModelica.y"
    { (yyval)[Exp] = (yyvsp[(2) - (3)])[Exp]; ;}
    break;

  case 292:

/* Line 1455 of yacc.c  */
#line 806 "parserModelica.y"
    { (yyval)[Exp] = Absyn.END(); ;}
    break;

  case 293:

/* Line 1455 of yacc.c  */
#line 808 "parserModelica.y"
    { (yyval)[Exp] = Absyn.INTEGER(stringInt((yyvsp[(1) - (1)]))); ;}
    break;

  case 294:

/* Line 1455 of yacc.c  */
#line 809 "parserModelica.y"
    { (yyval)[Exp] = Absyn.REAL(stringReal((yyvsp[(1) - (1)]))); ;}
    break;

  case 295:

/* Line 1455 of yacc.c  */
#line 811 "parserModelica.y"
    { (yyval)[Matrix] = {(yyvsp[(1) - (1)])[Exps]}; ;}
    break;

  case 296:

/* Line 1455 of yacc.c  */
#line 812 "parserModelica.y"
    { (yyval)[Matrix] = (yyvsp[(1) - (3)])[Exps]::(yyvsp[(3) - (3)])[Matrix]; ;}
    break;

  case 297:

/* Line 1455 of yacc.c  */
#line 814 "parserModelica.y"
    { (yyval)[Exp] = Absyn.TUPLE((yyvsp[(2) - (3)])[Exps]); ;}
    break;

  case 298:

/* Line 1455 of yacc.c  */
#line 816 "parserModelica.y"
    { (yyval)[Exps] = {(yyvsp[(1) - (3)])[Exp],(yyvsp[(3) - (3)])[Exp]};  ;}
    break;

  case 299:

/* Line 1455 of yacc.c  */
#line 817 "parserModelica.y"
    { (yyval)[Exps] = (yyvsp[(1) - (3)])[Exp]::(yyvsp[(3) - (3)])[Exps]; ;}
    break;

  case 300:

/* Line 1455 of yacc.c  */
#line 818 "parserModelica.y"
    { (yyval)[Exps] = {}; ;}
    break;

  case 301:

/* Line 1455 of yacc.c  */
#line 820 "parserModelica.y"
    { (yyval)[Exps] = {(yyvsp[(1) - (1)])[Exp]};  ;}
    break;

  case 302:

/* Line 1455 of yacc.c  */
#line 821 "parserModelica.y"
    { (yyval)[Exps] = listReverse((yyvsp[(3) - (3)])[Exp]::listReverse((yyvsp[(1) - (3)])[Exps])); ;}
    break;

  case 303:

/* Line 1455 of yacc.c  */
#line 822 "parserModelica.y"
    { (yyval)[Exps] = {}; ;}
    break;

  case 304:

/* Line 1455 of yacc.c  */
#line 824 "parserModelica.y"
    { (yyval)[ComponentRef] = Absyn.CREF_IDENT((yyvsp[(1) - (2)])[Ident],(yyvsp[(2) - (2)])[ArrayDim]); ;}
    break;

  case 305:

/* Line 1455 of yacc.c  */
#line 825 "parserModelica.y"
    { (yyval)[ComponentRef] = Absyn.CREF_QUAL((yyvsp[(1) - (4)])[Ident],(yyvsp[(2) - (4)])[ArrayDim],(yyvsp[(4) - (4)])[ComponentRef]); ;}
    break;

  case 306:

/* Line 1455 of yacc.c  */
#line 826 "parserModelica.y"
    { (yyval)[ComponentRef] = Absyn.CREF_FULLYQUALIFIED((yyvsp[(2) - (2)])[ComponentRef]); ;}
    break;

  case 307:

/* Line 1455 of yacc.c  */
#line 827 "parserModelica.y"
    { (yyval)[ComponentRef] = Absyn.WILD();;}
    break;

  case 308:

/* Line 1455 of yacc.c  */
#line 828 "parserModelica.y"
    { (yyval)[ComponentRef] = Absyn.ALLWILD();;}
    break;

  case 309:

/* Line 1455 of yacc.c  */
#line 830 "parserModelica.y"
    { (yyval)[Operator] = Absyn.UPLUS(); ;}
    break;

  case 310:

/* Line 1455 of yacc.c  */
#line 831 "parserModelica.y"
    { (yyval)[Operator] = Absyn.UMINUS(); ;}
    break;

  case 311:

/* Line 1455 of yacc.c  */
#line 832 "parserModelica.y"
    { (yyval)[Operator] = Absyn.UPLUS_EW(); ;}
    break;

  case 312:

/* Line 1455 of yacc.c  */
#line 833 "parserModelica.y"
    { (yyval)[Operator] = Absyn.UMINUS_EW(); ;}
    break;

  case 313:

/* Line 1455 of yacc.c  */
#line 836 "parserModelica.y"
    { (yyval)[Operator] = Absyn.ADD(); ;}
    break;

  case 314:

/* Line 1455 of yacc.c  */
#line 837 "parserModelica.y"
    { (yyval)[Operator] = Absyn.SUB(); ;}
    break;

  case 315:

/* Line 1455 of yacc.c  */
#line 838 "parserModelica.y"
    { (yyval)[Operator] = Absyn.ADD_EW(); ;}
    break;

  case 316:

/* Line 1455 of yacc.c  */
#line 839 "parserModelica.y"
    { (yyval)[Operator] = Absyn.SUB_EW(); ;}
    break;

  case 317:

/* Line 1455 of yacc.c  */
#line 842 "parserModelica.y"
    { (yyval)[Operator] = Absyn.MUL(); ;}
    break;

  case 318:

/* Line 1455 of yacc.c  */
#line 843 "parserModelica.y"
    { (yyval)[Operator] = Absyn.DIV(); ;}
    break;

  case 319:

/* Line 1455 of yacc.c  */
#line 844 "parserModelica.y"
    { (yyval)[Operator] = Absyn.MUL_EW(); ;}
    break;

  case 320:

/* Line 1455 of yacc.c  */
#line 845 "parserModelica.y"
    { (yyval)[Operator] = Absyn.DIV_EW(); ;}
    break;

  case 321:

/* Line 1455 of yacc.c  */
#line 847 "parserModelica.y"
    { (yyval)[Operator] = Absyn.POW(); ;}
    break;

  case 322:

/* Line 1455 of yacc.c  */
#line 848 "parserModelica.y"
    { (yyval)[Operator] = Absyn.POW_EW(); ;}
    break;

  case 323:

/* Line 1455 of yacc.c  */
#line 850 "parserModelica.y"
    { (yyval)[Operator] = Absyn.LESS(); ;}
    break;

  case 324:

/* Line 1455 of yacc.c  */
#line 851 "parserModelica.y"
    { (yyval)[Operator] = Absyn.LESSEQ(); ;}
    break;

  case 325:

/* Line 1455 of yacc.c  */
#line 852 "parserModelica.y"
    { (yyval)[Operator] = Absyn.GREATER(); ;}
    break;

  case 326:

/* Line 1455 of yacc.c  */
#line 853 "parserModelica.y"
    { (yyval)[Operator] = Absyn.GREATEREQ(); ;}
    break;

  case 327:

/* Line 1455 of yacc.c  */
#line 854 "parserModelica.y"
    { (yyval)[Operator] = Absyn.EQUAL(); ;}
    break;

  case 328:

/* Line 1455 of yacc.c  */
#line 855 "parserModelica.y"
    { (yyval)[Operator] = Absyn.NEQUAL(); ;}
    break;

  case 329:

/* Line 1455 of yacc.c  */
#line 857 "parserModelica.y"
    { (yyval)[Path] = Absyn.IDENT((yyvsp[(1) - (1)])[Ident]); ;}
    break;

  case 330:

/* Line 1455 of yacc.c  */
#line 858 "parserModelica.y"
    { (yyval)[Path] = Absyn.QUALIFIED((yyvsp[(1) - (3)])[Ident],(yyvsp[(2) - (3)])[Path]); ;}
    break;

  case 331:

/* Line 1455 of yacc.c  */
#line 859 "parserModelica.y"
    { (yyval)[Path] = Absyn.FULLYQUALIFIED((yyvsp[(2) - (2)])[Path]); ;}
    break;

  case 332:

/* Line 1455 of yacc.c  */
#line 861 "parserModelica.y"
    { (yyval)[Ident] = (yyvsp[(1) - (1)]); ;}
    break;

  case 333:

/* Line 1455 of yacc.c  */
#line 863 "parserModelica.y"
    { (yyval) = trimquotes((yyvsp[(1) - (1)])); ;}
    break;

  case 334:

/* Line 1455 of yacc.c  */
#line 865 "parserModelica.y"
    { (yyval)[Comment] = Absyn.COMMENT(NONE(),SOME((yyvsp[(1) - (1)]))); ;}
    break;

  case 335:

/* Line 1455 of yacc.c  */
#line 866 "parserModelica.y"
    { (yyval)[Comment] = Absyn.COMMENT(SOME((yyvsp[(2) - (2)])[Annotation]),SOME((yyvsp[(1) - (2)]))); ;}
    break;

  case 336:

/* Line 1455 of yacc.c  */
#line 867 "parserModelica.y"
    { (yyval)[Comment] = Absyn.COMMENT(SOME((yyvsp[(1) - (1)])[Annotation]),NONE()); ;}
    break;

  case 337:

/* Line 1455 of yacc.c  */
#line 868 "parserModelica.y"
    { (yyval)[Comment] = Absyn.COMMENT(NONE(),NONE()); ;}
    break;



/* Line 1455 of yacc.c  */
#line 4771 "parserModelica.c"
      default: break;
    }
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
      {
	YYSIZE_T yysize = yysyntax_error (0, yystate, yychar);
	if (yymsg_alloc < yysize && yymsg_alloc < YYSTACK_ALLOC_MAXIMUM)
	  {
	    YYSIZE_T yyalloc = 2 * yysize;
	    if (! (yysize <= yyalloc && yyalloc <= YYSTACK_ALLOC_MAXIMUM))
	      yyalloc = YYSTACK_ALLOC_MAXIMUM;
	    if (yymsg != yymsgbuf)
	      YYSTACK_FREE (yymsg);
	    yymsg = (char *) YYSTACK_ALLOC (yyalloc);
	    if (yymsg)
	      yymsg_alloc = yyalloc;
	    else
	      {
		yymsg = yymsgbuf;
		yymsg_alloc = sizeof yymsgbuf;
	      }
	  }

	if (0 < yysize && yysize <= yymsg_alloc)
	  {
	    (void) yysyntax_error (yymsg, yystate, yychar);
	    yyerror (yymsg);
	  }
	else
	  {
	    yyerror (YY_("syntax error"));
	    if (yysize != 0)
	      goto yyexhaustedlab;
	  }
      }
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (yyn != YYPACT_NINF)
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
     yydestruct ("Cleanup: discarding lookahead",
		 yytoken, &yylval);
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 1675 of yacc.c  */
#line 871 "parserModelica.y"


public function trimquotes
"removes chars in charsToRemove from inString"
  input String inString;
  output String outString;
 algorithm
  if (stringLength(inString)>2) then
    outString := System.substring(inString,2,stringLength(inString)-1);
  else
    outString := "";
  end if;
end trimquotes;

function fixArray
  input ElementAttributes v1ElementAttributes;
  input TypeSpec v2TypeSpec;
  output ElementAttributes v1ElementAttributes2;
  output TypeSpec v2TypeSpec2;
  protected
   Boolean flowPrefix,b1,b2 "flow" ;
    Boolean streamPrefix "stream" ;
//    Boolean inner_ "inner";
//    Boolean outer_ "outer";
    Variability variability,v1 "variability ; parameter, constant etc." ;
    Direction direction,d1 "direction" ;
    Absyn.Parallelism parallelism;
    ArrayDim arrayDim,a1 "arrayDim" ;
    Path path,p1;
    Option<ArrayDim> oa1;
 algorithm 
   Absyn.ATTR(flowPrefix=b1,streamPrefix=b2,parallelism=Absyn.NON_PARALLEL(),variability=v1,direction=d1,arrayDim=a1) := v1ElementAttributes;
   
   Absyn.TPATH(path=p1,arrayDim=oa1) :=v2TypeSpec;
   
   a1 := match oa1 
     local ArrayDim l1;
      case SOME(l1)
       then (l1);
      case NONE() then ({});
    end match;    
        
   v1ElementAttributes2 := Absyn.ATTR(b1,b2,parallelism,v1,d1,a1);
   v2TypeSpec2 := Absyn.TPATH(p1,NONE());
   
end fixArray;

function printContentStack
  input AstStack astStk;
   protected
   list<Token> skToken;
  list<Path> skPath;
   list<ClassDef> skClassDef;
   list<Ident> skIdent;
   list<Class> skClass;
   list<Program> skProgram;
   list<lstClass> sklstClass;
   list<String> skString;
   list<Integer> skInteger;
algorithm
 ASTSTACK(stackToken=skToken,stackPath=skPath,stackClassDef=skClassDef,stackIdent=skIdent,stackClass=skClass,stackProgram=skProgram,stacklstClass=sklstClass,stackString=skString,stackInteger=skInteger) := astStk;
  
  print("\n Stack content:");
  print(" skToken:");
  print(intString(listLength(skToken)));
  print(" skPath:");
  print(intString(listLength(skPath)));
  print(" skClassDef:");
  print(intString(listLength(skClassDef)));
  print(" skIdent:");
  print(intString(listLength(skIdent)));
  print(" skClass:");
  print(intString(listLength(skClass)));
  print(" skProgram:");
  print(intString(listLength(skProgram)));
  print(" sklstClass:");
  print(intString(listLength(sklstClass)));
  print(" skString:");
  print(intString(listLength(skString)));
  print(" skInteger:");
  print(intString(listLength(skInteger)));
end printContentStack;

