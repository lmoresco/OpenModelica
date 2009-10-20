/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     T_AMPER = 258,
     T_AND = 259,
     T_ARRAY = 260,
     T_ASSIGN = 261,
     T_BEGIN = 262,
     T_CARET = 263,
     T_CAST = 264,
     T_COLON = 265,
     T_COMMA = 266,
     T_CONST = 267,
     T_DO = 268,
     T_DOT = 269,
     T_ELSE = 270,
     T_ELSIF = 271,
     T_END = 272,
     T_EQ = 273,
     T_EXTERN = 274,
     T_FUNCTION = 275,
     T_GE = 276,
     T_GT = 277,
     T_ICON = 278,
     T_IDENT = 279,
     T_IDIV = 280,
     T_IF = 281,
     T_IMOD = 282,
     T_LBRACK = 283,
     T_LE = 284,
     T_LPAREN = 285,
     T_LT = 286,
     T_MINUS = 287,
     T_MUL = 288,
     T_NE = 289,
     T_NOT = 290,
     T_OF = 291,
     T_OR = 292,
     T_PLUS = 293,
     T_PROCEDURE = 294,
     T_PROGRAM = 295,
     T_RBRACK = 296,
     T_RCON = 297,
     T_RDIV = 298,
     T_RECORD = 299,
     T_RETURN = 300,
     T_RPAREN = 301,
     T_SEMI = 302,
     T_THEN = 303,
     T_TYPE = 304,
     T_VAR = 305,
     T_WHILE = 306
   };
#endif
/* Tokens.  */
#define T_AMPER 258
#define T_AND 259
#define T_ARRAY 260
#define T_ASSIGN 261
#define T_BEGIN 262
#define T_CARET 263
#define T_CAST 264
#define T_COLON 265
#define T_COMMA 266
#define T_CONST 267
#define T_DO 268
#define T_DOT 269
#define T_ELSE 270
#define T_ELSIF 271
#define T_END 272
#define T_EQ 273
#define T_EXTERN 274
#define T_FUNCTION 275
#define T_GE 276
#define T_GT 277
#define T_ICON 278
#define T_IDENT 279
#define T_IDIV 280
#define T_IF 281
#define T_IMOD 282
#define T_LBRACK 283
#define T_LE 284
#define T_LPAREN 285
#define T_LT 286
#define T_MINUS 287
#define T_MUL 288
#define T_NE 289
#define T_NOT 290
#define T_OF 291
#define T_OR 292
#define T_PLUS 293
#define T_PROCEDURE 294
#define T_PROGRAM 295
#define T_RBRACK 296
#define T_RCON 297
#define T_RDIV 298
#define T_RECORD 299
#define T_RETURN 300
#define T_RPAREN 301
#define T_SEMI 302
#define T_THEN 303
#define T_TYPE 304
#define T_VAR 305
#define T_WHILE 306




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 13 "parser.y"
{
    void	*voidp;
    enum uop	uop;
    enum bop	bop;
    enum rop	rop;
    enum eop	eop;
}
/* Line 1529 of yacc.c.  */
#line 159 "parser.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

