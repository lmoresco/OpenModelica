#line 1 "Flags_loadFlags.c"
#include "Flags_loadFlags.h"
#line 2 "Flags_loadFlags.c"
#include "modelica.h"
#line 3 "Flags_loadFlags.c"
#define MODELICA_ASSERT(info,msg) { printInfo(stderr,info); fprintf(stderr,"Modelica Assert: %s!\n", msg); }
#line 4 "Flags_loadFlags.c"
#define MODELICA_TERMINATE(msg) { fprintf(stderr,"Modelica Terminate: %s!\n", msg); fflush(stderr); }
#line 5 "Flags_loadFlags.c"

#line 6 "Flags_loadFlags.c"

#line 7 "Flags_loadFlags.c"
#define _OMC_LIT0_data "failtrace"
#line 8 "Flags_loadFlags.c"
static const size_t _OMC_LIT0_strlen = 9;
#line 9 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT0,9,_OMC_LIT0_data);
#line 10 "Flags_loadFlags.c"
#define _OMC_LIT0 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT0)
#line 11 "Flags_loadFlags.c"
#define _OMC_LIT1_data "Sets whether to print a failtrace or not."
#line 12 "Flags_loadFlags.c"
static const size_t _OMC_LIT1_strlen = 41;
#line 13 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT1,41,_OMC_LIT1_data);
#line 14 "Flags_loadFlags.c"
#define _OMC_LIT1 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT1)
#line 15 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT2,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(1)),_OMC_LIT0,_OMC_LIT1}};
#line 16 "Flags_loadFlags.c"
#define _OMC_LIT2 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT2)
#line 17 "Flags_loadFlags.c"
#define _OMC_LIT3_data "ceval"
#line 18 "Flags_loadFlags.c"
static const size_t _OMC_LIT3_strlen = 5;
#line 19 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT3,5,_OMC_LIT3_data);
#line 20 "Flags_loadFlags.c"
#define _OMC_LIT3 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT3)
#line 21 "Flags_loadFlags.c"
#define _OMC_LIT4_data "Prints extra information from Ceval."
#line 22 "Flags_loadFlags.c"
static const size_t _OMC_LIT4_strlen = 36;
#line 23 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT4,36,_OMC_LIT4_data);
#line 24 "Flags_loadFlags.c"
#define _OMC_LIT4 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT4)
#line 25 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT5,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(2)),_OMC_LIT3,_OMC_LIT4}};
#line 26 "Flags_loadFlags.c"
#define _OMC_LIT5 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT5)
#line 27 "Flags_loadFlags.c"
#define _OMC_LIT6_data "linearization"
#line 28 "Flags_loadFlags.c"
static const size_t _OMC_LIT6_strlen = 13;
#line 29 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT6,13,_OMC_LIT6_data);
#line 30 "Flags_loadFlags.c"
#define _OMC_LIT6 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT6)
#line 31 "Flags_loadFlags.c"
#define _OMC_LIT7_data ""
#line 32 "Flags_loadFlags.c"
static const size_t _OMC_LIT7_strlen = 0;
#line 33 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT7,0,_OMC_LIT7_data);
#line 34 "Flags_loadFlags.c"
#define _OMC_LIT7 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT7)
#line 35 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT8,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(3)),_OMC_LIT6,_OMC_LIT7}};
#line 36 "Flags_loadFlags.c"
#define _OMC_LIT8 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT8)
#line 37 "Flags_loadFlags.c"
#define _OMC_LIT9_data "jacobian"
#line 38 "Flags_loadFlags.c"
static const size_t _OMC_LIT9_strlen = 8;
#line 39 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT9,8,_OMC_LIT9_data);
#line 40 "Flags_loadFlags.c"
#define _OMC_LIT9 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT9)
#line 41 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT10,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(4)),_OMC_LIT9,_OMC_LIT7}};
#line 42 "Flags_loadFlags.c"
#define _OMC_LIT10 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT10)
#line 43 "Flags_loadFlags.c"
#define _OMC_LIT11_data "checkBackendDae"
#line 44 "Flags_loadFlags.c"
static const size_t _OMC_LIT11_strlen = 15;
#line 45 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT11,15,_OMC_LIT11_data);
#line 46 "Flags_loadFlags.c"
#define _OMC_LIT11 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT11)
#line 47 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT12,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(5)),_OMC_LIT11,_OMC_LIT7}};
#line 48 "Flags_loadFlags.c"
#define _OMC_LIT12 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT12)
#line 49 "Flags_loadFlags.c"
#define _OMC_LIT13_data "dumpInit"
#line 50 "Flags_loadFlags.c"
static const size_t _OMC_LIT13_strlen = 8;
#line 51 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT13,8,_OMC_LIT13_data);
#line 52 "Flags_loadFlags.c"
#define _OMC_LIT13 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT13)
#line 53 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT14,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(6)),_OMC_LIT13,_OMC_LIT7}};
#line 54 "Flags_loadFlags.c"
#define _OMC_LIT14 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT14)
#line 55 "Flags_loadFlags.c"
#define _OMC_LIT15_data "openmp"
#line 56 "Flags_loadFlags.c"
static const size_t _OMC_LIT15_strlen = 6;
#line 57 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT15,6,_OMC_LIT15_data);
#line 58 "Flags_loadFlags.c"
#define _OMC_LIT15 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT15)
#line 59 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT16,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(7)),_OMC_LIT15,_OMC_LIT7}};
#line 60 "Flags_loadFlags.c"
#define _OMC_LIT16 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT16)
#line 61 "Flags_loadFlags.c"
#define _OMC_LIT17_data "pthreads"
#line 62 "Flags_loadFlags.c"
static const size_t _OMC_LIT17_strlen = 8;
#line 63 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT17,8,_OMC_LIT17_data);
#line 64 "Flags_loadFlags.c"
#define _OMC_LIT17 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT17)
#line 65 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT18,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(8)),_OMC_LIT17,_OMC_LIT7}};
#line 66 "Flags_loadFlags.c"
#define _OMC_LIT18 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT18)
#line 67 "Flags_loadFlags.c"
#define _OMC_LIT19_data "tearing"
#line 68 "Flags_loadFlags.c"
static const size_t _OMC_LIT19_strlen = 7;
#line 69 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT19,7,_OMC_LIT19_data);
#line 70 "Flags_loadFlags.c"
#define _OMC_LIT19 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT19)
#line 71 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT20,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(9)),_OMC_LIT19,_OMC_LIT7}};
#line 72 "Flags_loadFlags.c"
#define _OMC_LIT20 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT20)
#line 73 "Flags_loadFlags.c"
#define _OMC_LIT21_data "relaxation"
#line 74 "Flags_loadFlags.c"
static const size_t _OMC_LIT21_strlen = 10;
#line 75 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT21,10,_OMC_LIT21_data);
#line 76 "Flags_loadFlags.c"
#define _OMC_LIT21 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT21)
#line 77 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT22,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(10)),_OMC_LIT21,_OMC_LIT7}};
#line 78 "Flags_loadFlags.c"
#define _OMC_LIT22 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT22)
#line 79 "Flags_loadFlags.c"
#define _OMC_LIT23_data "noevents"
#line 80 "Flags_loadFlags.c"
static const size_t _OMC_LIT23_strlen = 8;
#line 81 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT23,8,_OMC_LIT23_data);
#line 82 "Flags_loadFlags.c"
#define _OMC_LIT23 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT23)
#line 83 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT24,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(11)),_OMC_LIT23,_OMC_LIT7}};
#line 84 "Flags_loadFlags.c"
#define _OMC_LIT24 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT24)
#line 85 "Flags_loadFlags.c"
#define _OMC_LIT25_data "evalfunc"
#line 86 "Flags_loadFlags.c"
static const size_t _OMC_LIT25_strlen = 8;
#line 87 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT25,8,_OMC_LIT25_data);
#line 88 "Flags_loadFlags.c"
#define _OMC_LIT25 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT25)
#line 89 "Flags_loadFlags.c"
#define _OMC_LIT26_data "Prints extra failtrace from CevalFunction."
#line 90 "Flags_loadFlags.c"
static const size_t _OMC_LIT26_strlen = 42;
#line 91 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT26,42,_OMC_LIT26_data);
#line 92 "Flags_loadFlags.c"
#define _OMC_LIT26 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT26)
#line 93 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT27,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(12)),_OMC_LIT25,_OMC_LIT26}};
#line 94 "Flags_loadFlags.c"
#define _OMC_LIT27 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT27)
#line 95 "Flags_loadFlags.c"
#define _OMC_LIT28_data "noevalfunc"
#line 96 "Flags_loadFlags.c"
static const size_t _OMC_LIT28_strlen = 10;
#line 97 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT28,10,_OMC_LIT28_data);
#line 98 "Flags_loadFlags.c"
#define _OMC_LIT28 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT28)
#line 99 "Flags_loadFlags.c"
#define _OMC_LIT29_data "Turns off function evaluation and uses dynamic loading instead."
#line 100 "Flags_loadFlags.c"
static const size_t _OMC_LIT29_strlen = 63;
#line 101 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT29,63,_OMC_LIT29_data);
#line 102 "Flags_loadFlags.c"
#define _OMC_LIT29 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT29)
#line 103 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT30,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(13)),_OMC_LIT28,_OMC_LIT29}};
#line 104 "Flags_loadFlags.c"
#define _OMC_LIT30 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT30)
#line 105 "Flags_loadFlags.c"
#define _OMC_LIT31_data "nogen"
#line 106 "Flags_loadFlags.c"
static const size_t _OMC_LIT31_strlen = 5;
#line 107 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT31,5,_OMC_LIT31_data);
#line 108 "Flags_loadFlags.c"
#define _OMC_LIT31 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT31)
#line 109 "Flags_loadFlags.c"
#define _OMC_LIT32_data "Turns off dynamic loading of functions."
#line 110 "Flags_loadFlags.c"
static const size_t _OMC_LIT32_strlen = 39;
#line 111 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT32,39,_OMC_LIT32_data);
#line 112 "Flags_loadFlags.c"
#define _OMC_LIT32 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT32)
#line 113 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT33,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(14)),_OMC_LIT31,_OMC_LIT32}};
#line 114 "Flags_loadFlags.c"
#define _OMC_LIT33 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT33)
#line 115 "Flags_loadFlags.c"
#define _OMC_LIT34_data "dynload"
#line 116 "Flags_loadFlags.c"
static const size_t _OMC_LIT34_strlen = 7;
#line 117 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT34,7,_OMC_LIT34_data);
#line 118 "Flags_loadFlags.c"
#define _OMC_LIT34 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT34)
#line 119 "Flags_loadFlags.c"
#define _OMC_LIT35_data "Display debug information about dynamic loading of compiled functions."
#line 120 "Flags_loadFlags.c"
static const size_t _OMC_LIT35_strlen = 70;
#line 121 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT35,70,_OMC_LIT35_data);
#line 122 "Flags_loadFlags.c"
#define _OMC_LIT35 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT35)
#line 123 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT36,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(15)),_OMC_LIT34,_OMC_LIT35}};
#line 124 "Flags_loadFlags.c"
#define _OMC_LIT36 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT36)
#line 125 "Flags_loadFlags.c"
#define _OMC_LIT37_data "generateCodeCheat"
#line 126 "Flags_loadFlags.c"
static const size_t _OMC_LIT37_strlen = 17;
#line 127 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT37,17,_OMC_LIT37_data);
#line 128 "Flags_loadFlags.c"
#define _OMC_LIT37 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT37)
#line 129 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT38,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(16)),_OMC_LIT37,_OMC_LIT7}};
#line 130 "Flags_loadFlags.c"
#define _OMC_LIT38 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT38)
#line 131 "Flags_loadFlags.c"
#define _OMC_LIT39_data "cgraphGraphVizFile"
#line 132 "Flags_loadFlags.c"
static const size_t _OMC_LIT39_strlen = 18;
#line 133 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT39,18,_OMC_LIT39_data);
#line 134 "Flags_loadFlags.c"
#define _OMC_LIT39 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT39)
#line 135 "Flags_loadFlags.c"
#define _OMC_LIT40_data "Generates a graphviz file of the connection graph."
#line 136 "Flags_loadFlags.c"
static const size_t _OMC_LIT40_strlen = 50;
#line 137 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT40,50,_OMC_LIT40_data);
#line 138 "Flags_loadFlags.c"
#define _OMC_LIT40 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT40)
#line 139 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT41,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(17)),_OMC_LIT39,_OMC_LIT40}};
#line 140 "Flags_loadFlags.c"
#define _OMC_LIT41 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT41)
#line 141 "Flags_loadFlags.c"
#define _OMC_LIT42_data "cgraphGraphVizShow"
#line 142 "Flags_loadFlags.c"
static const size_t _OMC_LIT42_strlen = 18;
#line 143 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT42,18,_OMC_LIT42_data);
#line 144 "Flags_loadFlags.c"
#define _OMC_LIT42 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT42)
#line 145 "Flags_loadFlags.c"
#define _OMC_LIT43_data "Displays the connection graph with the GraphViz lefty tool"
#line 146 "Flags_loadFlags.c"
static const size_t _OMC_LIT43_strlen = 58;
#line 147 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT43,58,_OMC_LIT43_data);
#line 148 "Flags_loadFlags.c"
#define _OMC_LIT43 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT43)
#line 149 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT44,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(18)),_OMC_LIT42,_OMC_LIT43}};
#line 150 "Flags_loadFlags.c"
#define _OMC_LIT44 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT44)
#line 151 "Flags_loadFlags.c"
#define _OMC_LIT45_data "frontend-inline-euler"
#line 152 "Flags_loadFlags.c"
static const size_t _OMC_LIT45_strlen = 21;
#line 153 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT45,21,_OMC_LIT45_data);
#line 154 "Flags_loadFlags.c"
#define _OMC_LIT45 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT45)
#line 155 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT46,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(19)),_OMC_LIT45,_OMC_LIT7}};
#line 156 "Flags_loadFlags.c"
#define _OMC_LIT46 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT46)
#line 157 "Flags_loadFlags.c"
#define _OMC_LIT47_data "usedep"
#line 158 "Flags_loadFlags.c"
static const size_t _OMC_LIT47_strlen = 6;
#line 159 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT47,6,_OMC_LIT47_data);
#line 160 "Flags_loadFlags.c"
#define _OMC_LIT47 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT47)
#line 161 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT48,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(20)),_OMC_LIT47,_OMC_LIT7}};
#line 162 "Flags_loadFlags.c"
#define _OMC_LIT48 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT48)
#line 163 "Flags_loadFlags.c"
#define _OMC_LIT49_data "env"
#line 164 "Flags_loadFlags.c"
static const size_t _OMC_LIT49_strlen = 3;
#line 165 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT49,3,_OMC_LIT49_data);
#line 166 "Flags_loadFlags.c"
#define _OMC_LIT49 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT49)
#line 167 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT50,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(21)),_OMC_LIT49,_OMC_LIT7}};
#line 168 "Flags_loadFlags.c"
#define _OMC_LIT50 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT50)
#line 169 "Flags_loadFlags.c"
#define _OMC_LIT51_data "checkDAECrefType"
#line 170 "Flags_loadFlags.c"
static const size_t _OMC_LIT51_strlen = 16;
#line 171 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT51,16,_OMC_LIT51_data);
#line 172 "Flags_loadFlags.c"
#define _OMC_LIT51 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT51)
#line 173 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT52,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(22)),_OMC_LIT51,_OMC_LIT7}};
#line 174 "Flags_loadFlags.c"
#define _OMC_LIT52 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT52)
#line 175 "Flags_loadFlags.c"
#define _OMC_LIT53_data "checkASUB"
#line 176 "Flags_loadFlags.c"
static const size_t _OMC_LIT53_strlen = 9;
#line 177 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT53,9,_OMC_LIT53_data);
#line 178 "Flags_loadFlags.c"
#define _OMC_LIT53 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT53)
#line 179 "Flags_loadFlags.c"
#define _OMC_LIT54_data "Prints out a warning if an ASUB is created from a CREF expression."
#line 180 "Flags_loadFlags.c"
static const size_t _OMC_LIT54_strlen = 66;
#line 181 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT54,66,_OMC_LIT54_data);
#line 182 "Flags_loadFlags.c"
#define _OMC_LIT54 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT54)
#line 183 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT55,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(23)),_OMC_LIT53,_OMC_LIT54}};
#line 184 "Flags_loadFlags.c"
#define _OMC_LIT55 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT55)
#line 185 "Flags_loadFlags.c"
#define _OMC_LIT56_data "instance"
#line 186 "Flags_loadFlags.c"
static const size_t _OMC_LIT56_strlen = 8;
#line 187 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT56,8,_OMC_LIT56_data);
#line 188 "Flags_loadFlags.c"
#define _OMC_LIT56 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT56)
#line 189 "Flags_loadFlags.c"
#define _OMC_LIT57_data "Prints extra failtrace from InstanceHierarchy."
#line 190 "Flags_loadFlags.c"
static const size_t _OMC_LIT57_strlen = 46;
#line 191 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT57,46,_OMC_LIT57_data);
#line 192 "Flags_loadFlags.c"
#define _OMC_LIT57 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT57)
#line 193 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT58,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(24)),_OMC_LIT56,_OMC_LIT57}};
#line 194 "Flags_loadFlags.c"
#define _OMC_LIT58 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT58)
#line 195 "Flags_loadFlags.c"
#define _OMC_LIT59_data "noCache"
#line 196 "Flags_loadFlags.c"
static const size_t _OMC_LIT59_strlen = 7;
#line 197 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT59,7,_OMC_LIT59_data);
#line 198 "Flags_loadFlags.c"
#define _OMC_LIT59 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT59)
#line 199 "Flags_loadFlags.c"
#define _OMC_LIT60_data "Turns off the instantiation cache."
#line 200 "Flags_loadFlags.c"
static const size_t _OMC_LIT60_strlen = 34;
#line 201 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT60,34,_OMC_LIT60_data);
#line 202 "Flags_loadFlags.c"
#define _OMC_LIT60 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT60)
#line 203 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT61,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(25)),_OMC_LIT59,_OMC_LIT60}};
#line 204 "Flags_loadFlags.c"
#define _OMC_LIT61 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT61)
#line 205 "Flags_loadFlags.c"
#define _OMC_LIT62_data "rml"
#line 206 "Flags_loadFlags.c"
static const size_t _OMC_LIT62_strlen = 3;
#line 207 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT62,3,_OMC_LIT62_data);
#line 208 "Flags_loadFlags.c"
#define _OMC_LIT62 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT62)
#line 209 "Flags_loadFlags.c"
#define _OMC_LIT63_data "Turns on extra RML checks."
#line 210 "Flags_loadFlags.c"
static const size_t _OMC_LIT63_strlen = 26;
#line 211 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT63,26,_OMC_LIT63_data);
#line 212 "Flags_loadFlags.c"
#define _OMC_LIT63 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT63)
#line 213 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT64,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(26)),_OMC_LIT62,_OMC_LIT63}};
#line 214 "Flags_loadFlags.c"
#define _OMC_LIT64 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT64)
#line 215 "Flags_loadFlags.c"
#define _OMC_LIT65_data "tail"
#line 216 "Flags_loadFlags.c"
static const size_t _OMC_LIT65_strlen = 4;
#line 217 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT65,4,_OMC_LIT65_data);
#line 218 "Flags_loadFlags.c"
#define _OMC_LIT65 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT65)
#line 219 "Flags_loadFlags.c"
#define _OMC_LIT66_data "Prints out a notification if tail recursion optimization has been applied."
#line 220 "Flags_loadFlags.c"
static const size_t _OMC_LIT66_strlen = 74;
#line 221 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT66,74,_OMC_LIT66_data);
#line 222 "Flags_loadFlags.c"
#define _OMC_LIT66 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT66)
#line 223 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT67,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(27)),_OMC_LIT65,_OMC_LIT66}};
#line 224 "Flags_loadFlags.c"
#define _OMC_LIT67 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT67)
#line 225 "Flags_loadFlags.c"
#define _OMC_LIT68_data "lookup"
#line 226 "Flags_loadFlags.c"
static const size_t _OMC_LIT68_strlen = 6;
#line 227 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT68,6,_OMC_LIT68_data);
#line 228 "Flags_loadFlags.c"
#define _OMC_LIT68 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT68)
#line 229 "Flags_loadFlags.c"
#define _OMC_LIT69_data "Print extra failtrace from lookup."
#line 230 "Flags_loadFlags.c"
static const size_t _OMC_LIT69_strlen = 34;
#line 231 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT69,34,_OMC_LIT69_data);
#line 232 "Flags_loadFlags.c"
#define _OMC_LIT69 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT69)
#line 233 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT70,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(28)),_OMC_LIT68,_OMC_LIT69}};
#line 234 "Flags_loadFlags.c"
#define _OMC_LIT70 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT70)
#line 235 "Flags_loadFlags.c"
#define _OMC_LIT71_data "patternmSkipFilterUnusedBindings"
#line 236 "Flags_loadFlags.c"
static const size_t _OMC_LIT71_strlen = 32;
#line 237 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT71,32,_OMC_LIT71_data);
#line 238 "Flags_loadFlags.c"
#define _OMC_LIT71 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT71)
#line 239 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT72,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(29)),_OMC_LIT71,_OMC_LIT7}};
#line 240 "Flags_loadFlags.c"
#define _OMC_LIT72 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT72)
#line 241 "Flags_loadFlags.c"
#define _OMC_LIT73_data "patternmAllInfo"
#line 242 "Flags_loadFlags.c"
static const size_t _OMC_LIT73_strlen = 15;
#line 243 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT73,15,_OMC_LIT73_data);
#line 244 "Flags_loadFlags.c"
#define _OMC_LIT73 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT73)
#line 245 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT74,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(30)),_OMC_LIT73,_OMC_LIT7}};
#line 246 "Flags_loadFlags.c"
#define _OMC_LIT74 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT74)
#line 247 "Flags_loadFlags.c"
#define _OMC_LIT75_data "patternmSkipMCDCE"
#line 248 "Flags_loadFlags.c"
static const size_t _OMC_LIT75_strlen = 17;
#line 249 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT75,17,_OMC_LIT75_data);
#line 250 "Flags_loadFlags.c"
#define _OMC_LIT75 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT75)
#line 251 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT76,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(31)),_OMC_LIT75,_OMC_LIT7}};
#line 252 "Flags_loadFlags.c"
#define _OMC_LIT76 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT76)
#line 253 "Flags_loadFlags.c"
#define _OMC_LIT77_data "patternmSkipMoveLastExp"
#line 254 "Flags_loadFlags.c"
static const size_t _OMC_LIT77_strlen = 23;
#line 255 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT77,23,_OMC_LIT77_data);
#line 256 "Flags_loadFlags.c"
#define _OMC_LIT77 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT77)
#line 257 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT78,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(32)),_OMC_LIT77,_OMC_LIT7}};
#line 258 "Flags_loadFlags.c"
#define _OMC_LIT78 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT78)
#line 259 "Flags_loadFlags.c"
#define _OMC_LIT79_data "scodeFlatten"
#line 260 "Flags_loadFlags.c"
static const size_t _OMC_LIT79_strlen = 12;
#line 261 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT79,12,_OMC_LIT79_data);
#line 262 "Flags_loadFlags.c"
#define _OMC_LIT79 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT79)
#line 263 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT80,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(33)),_OMC_LIT79,_OMC_LIT7}};
#line 264 "Flags_loadFlags.c"
#define _OMC_LIT80 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT80)
#line 265 "Flags_loadFlags.c"
#define _OMC_LIT81_data "experimentalReductions"
#line 266 "Flags_loadFlags.c"
static const size_t _OMC_LIT81_strlen = 22;
#line 267 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT81,22,_OMC_LIT81_data);
#line 268 "Flags_loadFlags.c"
#define _OMC_LIT81 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT81)
#line 269 "Flags_loadFlags.c"
#define _OMC_LIT82_data "Turns on custom reduction functions (OpenModelica extension)."
#line 270 "Flags_loadFlags.c"
static const size_t _OMC_LIT82_strlen = 61;
#line 271 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT82,61,_OMC_LIT82_data);
#line 272 "Flags_loadFlags.c"
#define _OMC_LIT82 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT82)
#line 273 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT83,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(34)),_OMC_LIT81,_OMC_LIT82}};
#line 274 "Flags_loadFlags.c"
#define _OMC_LIT83 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT83)
#line 275 "Flags_loadFlags.c"
#define _OMC_LIT84_data "evalparam"
#line 276 "Flags_loadFlags.c"
static const size_t _OMC_LIT84_strlen = 9;
#line 277 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT84,9,_OMC_LIT84_data);
#line 278 "Flags_loadFlags.c"
#define _OMC_LIT84 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT84)
#line 279 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT85,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(35)),_OMC_LIT84,_OMC_LIT7}};
#line 280 "Flags_loadFlags.c"
#define _OMC_LIT85 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT85)
#line 281 "Flags_loadFlags.c"
#define _OMC_LIT86_data "types"
#line 282 "Flags_loadFlags.c"
static const size_t _OMC_LIT86_strlen = 5;
#line 283 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT86,5,_OMC_LIT86_data);
#line 284 "Flags_loadFlags.c"
#define _OMC_LIT86 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT86)
#line 285 "Flags_loadFlags.c"
#define _OMC_LIT87_data "Prints extra failtrace from Types."
#line 286 "Flags_loadFlags.c"
static const size_t _OMC_LIT87_strlen = 34;
#line 287 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT87,34,_OMC_LIT87_data);
#line 288 "Flags_loadFlags.c"
#define _OMC_LIT87 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT87)
#line 289 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT88,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(36)),_OMC_LIT86,_OMC_LIT87}};
#line 290 "Flags_loadFlags.c"
#define _OMC_LIT88 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT88)
#line 291 "Flags_loadFlags.c"
#define _OMC_LIT89_data "showStatement"
#line 292 "Flags_loadFlags.c"
static const size_t _OMC_LIT89_strlen = 13;
#line 293 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT89,13,_OMC_LIT89_data);
#line 294 "Flags_loadFlags.c"
#define _OMC_LIT89 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT89)
#line 295 "Flags_loadFlags.c"
#define _OMC_LIT90_data "Shows the statement that is currently being evaluated when evaluating a script."
#line 296 "Flags_loadFlags.c"
static const size_t _OMC_LIT90_strlen = 79;
#line 297 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT90,79,_OMC_LIT90_data);
#line 298 "Flags_loadFlags.c"
#define _OMC_LIT90 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT90)
#line 299 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT91,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(37)),_OMC_LIT89,_OMC_LIT90}};
#line 300 "Flags_loadFlags.c"
#define _OMC_LIT91 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT91)
#line 301 "Flags_loadFlags.c"
#define _OMC_LIT92_data "info"
#line 302 "Flags_loadFlags.c"
static const size_t _OMC_LIT92_strlen = 4;
#line 303 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT92,4,_OMC_LIT92_data);
#line 304 "Flags_loadFlags.c"
#define _OMC_LIT92 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT92)
#line 305 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT93,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(38)),_OMC_LIT92,_OMC_LIT7}};
#line 306 "Flags_loadFlags.c"
#define _OMC_LIT93 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT93)
#line 307 "Flags_loadFlags.c"
#define _OMC_LIT94_data "dump"
#line 308 "Flags_loadFlags.c"
static const size_t _OMC_LIT94_strlen = 4;
#line 309 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT94,4,_OMC_LIT94_data);
#line 310 "Flags_loadFlags.c"
#define _OMC_LIT94 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT94)
#line 311 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT95,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(39)),_OMC_LIT94,_OMC_LIT7}};
#line 312 "Flags_loadFlags.c"
#define _OMC_LIT95 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT95)
#line 313 "Flags_loadFlags.c"
#define _OMC_LIT96_data "graphviz"
#line 314 "Flags_loadFlags.c"
static const size_t _OMC_LIT96_strlen = 8;
#line 315 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT96,8,_OMC_LIT96_data);
#line 316 "Flags_loadFlags.c"
#define _OMC_LIT96 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT96)
#line 317 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT97,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(40)),_OMC_LIT96,_OMC_LIT7}};
#line 318 "Flags_loadFlags.c"
#define _OMC_LIT97 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT97)
#line 319 "Flags_loadFlags.c"
#define _OMC_LIT98_data "execstat"
#line 320 "Flags_loadFlags.c"
static const size_t _OMC_LIT98_strlen = 8;
#line 321 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT98,8,_OMC_LIT98_data);
#line 322 "Flags_loadFlags.c"
#define _OMC_LIT98 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT98)
#line 323 "Flags_loadFlags.c"
#define _OMC_LIT99_data "Prints out execution statistics for the compiler."
#line 324 "Flags_loadFlags.c"
static const size_t _OMC_LIT99_strlen = 49;
#line 325 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT99,49,_OMC_LIT99_data);
#line 326 "Flags_loadFlags.c"
#define _OMC_LIT99 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT99)
#line 327 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT100,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(41)),_OMC_LIT98,_OMC_LIT99}};
#line 328 "Flags_loadFlags.c"
#define _OMC_LIT100 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT100)
#line 329 "Flags_loadFlags.c"
#define _OMC_LIT101_data "transformsbeforedump"
#line 330 "Flags_loadFlags.c"
static const size_t _OMC_LIT101_strlen = 20;
#line 331 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT101,20,_OMC_LIT101_data);
#line 332 "Flags_loadFlags.c"
#define _OMC_LIT101 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT101)
#line 333 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT102,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(42)),_OMC_LIT101,_OMC_LIT7}};
#line 334 "Flags_loadFlags.c"
#define _OMC_LIT102 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT102)
#line 335 "Flags_loadFlags.c"
#define _OMC_LIT103_data "beforefixmodout"
#line 336 "Flags_loadFlags.c"
static const size_t _OMC_LIT103_strlen = 15;
#line 337 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT103,15,_OMC_LIT103_data);
#line 338 "Flags_loadFlags.c"
#define _OMC_LIT103 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT103)
#line 339 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT104,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(43)),_OMC_LIT103,_OMC_LIT7}};
#line 340 "Flags_loadFlags.c"
#define _OMC_LIT104 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT104)
#line 341 "Flags_loadFlags.c"
#define _OMC_LIT105_data "flatmodelica"
#line 342 "Flags_loadFlags.c"
static const size_t _OMC_LIT105_strlen = 12;
#line 343 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT105,12,_OMC_LIT105_data);
#line 344 "Flags_loadFlags.c"
#define _OMC_LIT105 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT105)
#line 345 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT106,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(44)),_OMC_LIT105,_OMC_LIT7}};
#line 346 "Flags_loadFlags.c"
#define _OMC_LIT106 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT106)
#line 347 "Flags_loadFlags.c"
#define _OMC_LIT107_data "daedump"
#line 348 "Flags_loadFlags.c"
static const size_t _OMC_LIT107_strlen = 7;
#line 349 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT107,7,_OMC_LIT107_data);
#line 350 "Flags_loadFlags.c"
#define _OMC_LIT107 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT107)
#line 351 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT108,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(45)),_OMC_LIT107,_OMC_LIT7}};
#line 352 "Flags_loadFlags.c"
#define _OMC_LIT108 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT108)
#line 353 "Flags_loadFlags.c"
#define _OMC_LIT109_data "daedump2"
#line 354 "Flags_loadFlags.c"
static const size_t _OMC_LIT109_strlen = 8;
#line 355 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT109,8,_OMC_LIT109_data);
#line 356 "Flags_loadFlags.c"
#define _OMC_LIT109 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT109)
#line 357 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT110,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(46)),_OMC_LIT109,_OMC_LIT7}};
#line 358 "Flags_loadFlags.c"
#define _OMC_LIT110 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT110)
#line 359 "Flags_loadFlags.c"
#define _OMC_LIT111_data "daedumpdebug"
#line 360 "Flags_loadFlags.c"
static const size_t _OMC_LIT111_strlen = 12;
#line 361 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT111,12,_OMC_LIT111_data);
#line 362 "Flags_loadFlags.c"
#define _OMC_LIT111 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT111)
#line 363 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT112,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(47)),_OMC_LIT111,_OMC_LIT7}};
#line 364 "Flags_loadFlags.c"
#define _OMC_LIT112 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT112)
#line 365 "Flags_loadFlags.c"
#define _OMC_LIT113_data "daedumpgraphv"
#line 366 "Flags_loadFlags.c"
static const size_t _OMC_LIT113_strlen = 13;
#line 367 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT113,13,_OMC_LIT113_data);
#line 368 "Flags_loadFlags.c"
#define _OMC_LIT113 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT113)
#line 369 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT114,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(48)),_OMC_LIT113,_OMC_LIT7}};
#line 370 "Flags_loadFlags.c"
#define _OMC_LIT114 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT114)
#line 371 "Flags_loadFlags.c"
#define _OMC_LIT115_data "blt"
#line 372 "Flags_loadFlags.c"
static const size_t _OMC_LIT115_strlen = 3;
#line 373 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT115,3,_OMC_LIT115_data);
#line 374 "Flags_loadFlags.c"
#define _OMC_LIT115 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT115)
#line 375 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT116,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(49)),_OMC_LIT115,_OMC_LIT7}};
#line 376 "Flags_loadFlags.c"
#define _OMC_LIT116 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT116)
#line 377 "Flags_loadFlags.c"
#define _OMC_LIT117_data "interactive"
#line 378 "Flags_loadFlags.c"
static const size_t _OMC_LIT117_strlen = 11;
#line 379 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT117,11,_OMC_LIT117_data);
#line 380 "Flags_loadFlags.c"
#define _OMC_LIT117 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT117)
#line 381 "Flags_loadFlags.c"
#define _OMC_LIT118_data "Starts omc as a server listening on the socket interface."
#line 382 "Flags_loadFlags.c"
static const size_t _OMC_LIT118_strlen = 57;
#line 383 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT118,57,_OMC_LIT118_data);
#line 384 "Flags_loadFlags.c"
#define _OMC_LIT118 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT118)
#line 385 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT119,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(50)),_OMC_LIT117,_OMC_LIT118}};
#line 386 "Flags_loadFlags.c"
#define _OMC_LIT119 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT119)
#line 387 "Flags_loadFlags.c"
#define _OMC_LIT120_data "interactiveCorba"
#line 388 "Flags_loadFlags.c"
static const size_t _OMC_LIT120_strlen = 16;
#line 389 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT120,16,_OMC_LIT120_data);
#line 390 "Flags_loadFlags.c"
#define _OMC_LIT120 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT120)
#line 391 "Flags_loadFlags.c"
#define _OMC_LIT121_data "Starts omc as a server listening on the Corba interface."
#line 392 "Flags_loadFlags.c"
static const size_t _OMC_LIT121_strlen = 56;
#line 393 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT121,56,_OMC_LIT121_data);
#line 394 "Flags_loadFlags.c"
#define _OMC_LIT121 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT121)
#line 395 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT122,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(51)),_OMC_LIT120,_OMC_LIT121}};
#line 396 "Flags_loadFlags.c"
#define _OMC_LIT122 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT122)
#line 397 "Flags_loadFlags.c"
#define _OMC_LIT123_data "interactivedump"
#line 398 "Flags_loadFlags.c"
static const size_t _OMC_LIT123_strlen = 15;
#line 399 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT123,15,_OMC_LIT123_data);
#line 400 "Flags_loadFlags.c"
#define _OMC_LIT123 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT123)
#line 401 "Flags_loadFlags.c"
#define _OMC_LIT124_data "Prints out debug information for the interactive server."
#line 402 "Flags_loadFlags.c"
static const size_t _OMC_LIT124_strlen = 56;
#line 403 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT124,56,_OMC_LIT124_data);
#line 404 "Flags_loadFlags.c"
#define _OMC_LIT124 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT124)
#line 405 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT125,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(52)),_OMC_LIT123,_OMC_LIT124}};
#line 406 "Flags_loadFlags.c"
#define _OMC_LIT125 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT125)
#line 407 "Flags_loadFlags.c"
#define _OMC_LIT126_data "relidx"
#line 408 "Flags_loadFlags.c"
static const size_t _OMC_LIT126_strlen = 6;
#line 409 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT126,6,_OMC_LIT126_data);
#line 410 "Flags_loadFlags.c"
#define _OMC_LIT126 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT126)
#line 411 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT127,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(53)),_OMC_LIT126,_OMC_LIT7}};
#line 412 "Flags_loadFlags.c"
#define _OMC_LIT127 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT127)
#line 413 "Flags_loadFlags.c"
#define _OMC_LIT128_data "dumprepl"
#line 414 "Flags_loadFlags.c"
static const size_t _OMC_LIT128_strlen = 8;
#line 415 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT128,8,_OMC_LIT128_data);
#line 416 "Flags_loadFlags.c"
#define _OMC_LIT128 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT128)
#line 417 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT129,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(54)),_OMC_LIT128,_OMC_LIT7}};
#line 418 "Flags_loadFlags.c"
#define _OMC_LIT129 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT129)
#line 419 "Flags_loadFlags.c"
#define _OMC_LIT130_data "dumpFPrepl"
#line 420 "Flags_loadFlags.c"
static const size_t _OMC_LIT130_strlen = 10;
#line 421 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT130,10,_OMC_LIT130_data);
#line 422 "Flags_loadFlags.c"
#define _OMC_LIT130 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT130)
#line 423 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT131,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(55)),_OMC_LIT130,_OMC_LIT7}};
#line 424 "Flags_loadFlags.c"
#define _OMC_LIT131 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT131)
#line 425 "Flags_loadFlags.c"
#define _OMC_LIT132_data "dumpParamrepl"
#line 426 "Flags_loadFlags.c"
static const size_t _OMC_LIT132_strlen = 13;
#line 427 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT132,13,_OMC_LIT132_data);
#line 428 "Flags_loadFlags.c"
#define _OMC_LIT132 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT132)
#line 429 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT133,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(56)),_OMC_LIT132,_OMC_LIT7}};
#line 430 "Flags_loadFlags.c"
#define _OMC_LIT133 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT133)
#line 431 "Flags_loadFlags.c"
#define _OMC_LIT134_data "dumpPPrepl"
#line 432 "Flags_loadFlags.c"
static const size_t _OMC_LIT134_strlen = 10;
#line 433 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT134,10,_OMC_LIT134_data);
#line 434 "Flags_loadFlags.c"
#define _OMC_LIT134 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT134)
#line 435 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT135,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(57)),_OMC_LIT134,_OMC_LIT7}};
#line 436 "Flags_loadFlags.c"
#define _OMC_LIT135 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT135)
#line 437 "Flags_loadFlags.c"
#define _OMC_LIT136_data "debugAlias"
#line 438 "Flags_loadFlags.c"
static const size_t _OMC_LIT136_strlen = 10;
#line 439 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT136,10,_OMC_LIT136_data);
#line 440 "Flags_loadFlags.c"
#define _OMC_LIT136 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT136)
#line 441 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT137,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(58)),_OMC_LIT136,_OMC_LIT7}};
#line 442 "Flags_loadFlags.c"
#define _OMC_LIT137 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT137)
#line 443 "Flags_loadFlags.c"
#define _OMC_LIT138_data "tearingdump"
#line 444 "Flags_loadFlags.c"
static const size_t _OMC_LIT138_strlen = 11;
#line 445 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT138,11,_OMC_LIT138_data);
#line 446 "Flags_loadFlags.c"
#define _OMC_LIT138 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT138)
#line 447 "Flags_loadFlags.c"
#define _OMC_LIT139_data "Dumps tearing information."
#line 448 "Flags_loadFlags.c"
static const size_t _OMC_LIT139_strlen = 26;
#line 449 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT139,26,_OMC_LIT139_data);
#line 450 "Flags_loadFlags.c"
#define _OMC_LIT139 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT139)
#line 451 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT140,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(59)),_OMC_LIT138,_OMC_LIT139}};
#line 452 "Flags_loadFlags.c"
#define _OMC_LIT140 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT140)
#line 453 "Flags_loadFlags.c"
#define _OMC_LIT141_data "jacdump"
#line 454 "Flags_loadFlags.c"
static const size_t _OMC_LIT141_strlen = 7;
#line 455 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT141,7,_OMC_LIT141_data);
#line 456 "Flags_loadFlags.c"
#define _OMC_LIT141 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT141)
#line 457 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT142,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(60)),_OMC_LIT141,_OMC_LIT7}};
#line 458 "Flags_loadFlags.c"
#define _OMC_LIT142 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT142)
#line 459 "Flags_loadFlags.c"
#define _OMC_LIT143_data "jacdump2"
#line 460 "Flags_loadFlags.c"
static const size_t _OMC_LIT143_strlen = 8;
#line 461 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT143,8,_OMC_LIT143_data);
#line 462 "Flags_loadFlags.c"
#define _OMC_LIT143 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT143)
#line 463 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT144,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(61)),_OMC_LIT143,_OMC_LIT7}};
#line 464 "Flags_loadFlags.c"
#define _OMC_LIT144 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT144)
#line 465 "Flags_loadFlags.c"
#define _OMC_LIT145_data "jacdumpeqn"
#line 466 "Flags_loadFlags.c"
static const size_t _OMC_LIT145_strlen = 10;
#line 467 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT145,10,_OMC_LIT145_data);
#line 468 "Flags_loadFlags.c"
#define _OMC_LIT145 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT145)
#line 469 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT146,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(62)),_OMC_LIT145,_OMC_LIT7}};
#line 470 "Flags_loadFlags.c"
#define _OMC_LIT146 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT146)
#line 471 "Flags_loadFlags.c"
#define _OMC_LIT147_data "failtraceJac"
#line 472 "Flags_loadFlags.c"
static const size_t _OMC_LIT147_strlen = 12;
#line 473 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT147,12,_OMC_LIT147_data);
#line 474 "Flags_loadFlags.c"
#define _OMC_LIT147 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT147)
#line 475 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT148,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(63)),_OMC_LIT147,_OMC_LIT7}};
#line 476 "Flags_loadFlags.c"
#define _OMC_LIT148 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT148)
#line 477 "Flags_loadFlags.c"
#define _OMC_LIT149_data "varIndex"
#line 478 "Flags_loadFlags.c"
static const size_t _OMC_LIT149_strlen = 8;
#line 479 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT149,8,_OMC_LIT149_data);
#line 480 "Flags_loadFlags.c"
#define _OMC_LIT149 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT149)
#line 481 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT150,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(64)),_OMC_LIT149,_OMC_LIT7}};
#line 482 "Flags_loadFlags.c"
#define _OMC_LIT150 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT150)
#line 483 "Flags_loadFlags.c"
#define _OMC_LIT151_data "varIndex2"
#line 484 "Flags_loadFlags.c"
static const size_t _OMC_LIT151_strlen = 9;
#line 485 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT151,9,_OMC_LIT151_data);
#line 486 "Flags_loadFlags.c"
#define _OMC_LIT151 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT151)
#line 487 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT152,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(65)),_OMC_LIT151,_OMC_LIT7}};
#line 488 "Flags_loadFlags.c"
#define _OMC_LIT152 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT152)
#line 489 "Flags_loadFlags.c"
#define _OMC_LIT153_data "bltdump"
#line 490 "Flags_loadFlags.c"
static const size_t _OMC_LIT153_strlen = 7;
#line 491 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT153,7,_OMC_LIT153_data);
#line 492 "Flags_loadFlags.c"
#define _OMC_LIT153 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT153)
#line 493 "Flags_loadFlags.c"
#define _OMC_LIT154_data "Dumps information from index reduction."
#line 494 "Flags_loadFlags.c"
static const size_t _OMC_LIT154_strlen = 39;
#line 495 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT154,39,_OMC_LIT154_data);
#line 496 "Flags_loadFlags.c"
#define _OMC_LIT154 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT154)
#line 497 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT155,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(66)),_OMC_LIT153,_OMC_LIT154}};
#line 498 "Flags_loadFlags.c"
#define _OMC_LIT155 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT155)
#line 499 "Flags_loadFlags.c"
#define _OMC_LIT156_data "dummyselect"
#line 500 "Flags_loadFlags.c"
static const size_t _OMC_LIT156_strlen = 11;
#line 501 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT156,11,_OMC_LIT156_data);
#line 502 "Flags_loadFlags.c"
#define _OMC_LIT156 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT156)
#line 503 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT157,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(67)),_OMC_LIT156,_OMC_LIT7}};
#line 504 "Flags_loadFlags.c"
#define _OMC_LIT157 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT157)
#line 505 "Flags_loadFlags.c"
#define _OMC_LIT158_data "dumpdaelow"
#line 506 "Flags_loadFlags.c"
static const size_t _OMC_LIT158_strlen = 10;
#line 507 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT158,10,_OMC_LIT158_data);
#line 508 "Flags_loadFlags.c"
#define _OMC_LIT158 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT158)
#line 509 "Flags_loadFlags.c"
#define _OMC_LIT159_data "Dumps the equation system at the beginning of the back end."
#line 510 "Flags_loadFlags.c"
static const size_t _OMC_LIT159_strlen = 59;
#line 511 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT159,59,_OMC_LIT159_data);
#line 512 "Flags_loadFlags.c"
#define _OMC_LIT159 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT159)
#line 513 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT160,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(68)),_OMC_LIT158,_OMC_LIT159}};
#line 514 "Flags_loadFlags.c"
#define _OMC_LIT160 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT160)
#line 515 "Flags_loadFlags.c"
#define _OMC_LIT161_data "dumpindxdae"
#line 516 "Flags_loadFlags.c"
static const size_t _OMC_LIT161_strlen = 11;
#line 517 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT161,11,_OMC_LIT161_data);
#line 518 "Flags_loadFlags.c"
#define _OMC_LIT161 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT161)
#line 519 "Flags_loadFlags.c"
#define _OMC_LIT162_data "Dumps the equation system after index reduction and optimisation."
#line 520 "Flags_loadFlags.c"
static const size_t _OMC_LIT162_strlen = 65;
#line 521 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT162,65,_OMC_LIT162_data);
#line 522 "Flags_loadFlags.c"
#define _OMC_LIT162 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT162)
#line 523 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT163,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(69)),_OMC_LIT161,_OMC_LIT162}};
#line 524 "Flags_loadFlags.c"
#define _OMC_LIT163 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT163)
#line 525 "Flags_loadFlags.c"
#define _OMC_LIT164_data "optdaedump"
#line 526 "Flags_loadFlags.c"
static const size_t _OMC_LIT164_strlen = 10;
#line 527 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT164,10,_OMC_LIT164_data);
#line 528 "Flags_loadFlags.c"
#define _OMC_LIT164 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT164)
#line 529 "Flags_loadFlags.c"
#define _OMC_LIT165_data "Dumps information from the optimisation modules."
#line 530 "Flags_loadFlags.c"
static const size_t _OMC_LIT165_strlen = 48;
#line 531 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT165,48,_OMC_LIT165_data);
#line 532 "Flags_loadFlags.c"
#define _OMC_LIT165 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT165)
#line 533 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT166,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(70)),_OMC_LIT164,_OMC_LIT165}};
#line 534 "Flags_loadFlags.c"
#define _OMC_LIT166 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT166)
#line 535 "Flags_loadFlags.c"
#define _OMC_LIT167_data "execHash"
#line 536 "Flags_loadFlags.c"
static const size_t _OMC_LIT167_strlen = 8;
#line 537 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT167,8,_OMC_LIT167_data);
#line 538 "Flags_loadFlags.c"
#define _OMC_LIT167 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT167)
#line 539 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT168,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(71)),_OMC_LIT167,_OMC_LIT7}};
#line 540 "Flags_loadFlags.c"
#define _OMC_LIT168 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT168)
#line 541 "Flags_loadFlags.c"
#define _OMC_LIT169_data "execFiles"
#line 542 "Flags_loadFlags.c"
static const size_t _OMC_LIT169_strlen = 9;
#line 543 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT169,9,_OMC_LIT169_data);
#line 544 "Flags_loadFlags.c"
#define _OMC_LIT169 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT169)
#line 545 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT170,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(72)),_OMC_LIT169,_OMC_LIT7}};
#line 546 "Flags_loadFlags.c"
#define _OMC_LIT170 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT170)
#line 547 "Flags_loadFlags.c"
#define _OMC_LIT171_data "paramdlowdump"
#line 548 "Flags_loadFlags.c"
static const size_t _OMC_LIT171_strlen = 13;
#line 549 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT171,13,_OMC_LIT171_data);
#line 550 "Flags_loadFlags.c"
#define _OMC_LIT171 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT171)
#line 551 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT172,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(73)),_OMC_LIT171,_OMC_LIT7}};
#line 552 "Flags_loadFlags.c"
#define _OMC_LIT172 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT172)
#line 553 "Flags_loadFlags.c"
#define _OMC_LIT173_data "cpp"
#line 554 "Flags_loadFlags.c"
static const size_t _OMC_LIT173_strlen = 3;
#line 555 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT173,3,_OMC_LIT173_data);
#line 556 "Flags_loadFlags.c"
#define _OMC_LIT173 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT173)
#line 557 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT174,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(74)),_OMC_LIT173,_OMC_LIT7}};
#line 558 "Flags_loadFlags.c"
#define _OMC_LIT174 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT174)
#line 559 "Flags_loadFlags.c"
#define _OMC_LIT175_data "cppvar"
#line 560 "Flags_loadFlags.c"
static const size_t _OMC_LIT175_strlen = 6;
#line 561 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT175,6,_OMC_LIT175_data);
#line 562 "Flags_loadFlags.c"
#define _OMC_LIT175 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT175)
#line 563 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT176,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(75)),_OMC_LIT175,_OMC_LIT7}};
#line 564 "Flags_loadFlags.c"
#define _OMC_LIT176 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT176)
#line 565 "Flags_loadFlags.c"
#define _OMC_LIT177_data "cppvarindex"
#line 566 "Flags_loadFlags.c"
static const size_t _OMC_LIT177_strlen = 11;
#line 567 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT177,11,_OMC_LIT177_data);
#line 568 "Flags_loadFlags.c"
#define _OMC_LIT177 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT177)
#line 569 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT178,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(76)),_OMC_LIT177,_OMC_LIT7}};
#line 570 "Flags_loadFlags.c"
#define _OMC_LIT178 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT178)
#line 571 "Flags_loadFlags.c"
#define _OMC_LIT179_data "cppsim1"
#line 572 "Flags_loadFlags.c"
static const size_t _OMC_LIT179_strlen = 7;
#line 573 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT179,7,_OMC_LIT179_data);
#line 574 "Flags_loadFlags.c"
#define _OMC_LIT179 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT179)
#line 575 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT180,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(77)),_OMC_LIT179,_OMC_LIT7}};
#line 576 "Flags_loadFlags.c"
#define _OMC_LIT180 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT180)
#line 577 "Flags_loadFlags.c"
#define _OMC_LIT181_data "tcvt"
#line 578 "Flags_loadFlags.c"
static const size_t _OMC_LIT181_strlen = 4;
#line 579 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT181,4,_OMC_LIT181_data);
#line 580 "Flags_loadFlags.c"
#define _OMC_LIT181 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT181)
#line 581 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT182,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(78)),_OMC_LIT181,_OMC_LIT7}};
#line 582 "Flags_loadFlags.c"
#define _OMC_LIT182 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT182)
#line 583 "Flags_loadFlags.c"
#define _OMC_LIT183_data "cgraph"
#line 584 "Flags_loadFlags.c"
static const size_t _OMC_LIT183_strlen = 6;
#line 585 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT183,6,_OMC_LIT183_data);
#line 586 "Flags_loadFlags.c"
#define _OMC_LIT183 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT183)
#line 587 "Flags_loadFlags.c"
#define _OMC_LIT184_data "Prints out connection graph information."
#line 588 "Flags_loadFlags.c"
static const size_t _OMC_LIT184_strlen = 40;
#line 589 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT184,40,_OMC_LIT184_data);
#line 590 "Flags_loadFlags.c"
#define _OMC_LIT184 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT184)
#line 591 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT185,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(79)),_OMC_LIT183,_OMC_LIT184}};
#line 592 "Flags_loadFlags.c"
#define _OMC_LIT185 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT185)
#line 593 "Flags_loadFlags.c"
#define _OMC_LIT186_data "dumptr"
#line 594 "Flags_loadFlags.c"
static const size_t _OMC_LIT186_strlen = 6;
#line 595 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT186,6,_OMC_LIT186_data);
#line 596 "Flags_loadFlags.c"
#define _OMC_LIT186 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT186)
#line 597 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT187,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(80)),_OMC_LIT186,_OMC_LIT7}};
#line 598 "Flags_loadFlags.c"
#define _OMC_LIT187 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT187)
#line 599 "Flags_loadFlags.c"
#define _OMC_LIT188_data "dumpIH"
#line 600 "Flags_loadFlags.c"
static const size_t _OMC_LIT188_strlen = 6;
#line 601 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT188,6,_OMC_LIT188_data);
#line 602 "Flags_loadFlags.c"
#define _OMC_LIT188 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT188)
#line 603 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT189,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(81)),_OMC_LIT188,_OMC_LIT7}};
#line 604 "Flags_loadFlags.c"
#define _OMC_LIT189 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT189)
#line 605 "Flags_loadFlags.c"
#define _OMC_LIT190_data "recconst"
#line 606 "Flags_loadFlags.c"
static const size_t _OMC_LIT190_strlen = 8;
#line 607 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT190,8,_OMC_LIT190_data);
#line 608 "Flags_loadFlags.c"
#define _OMC_LIT190 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT190)
#line 609 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT191,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(82)),_OMC_LIT190,_OMC_LIT7}};
#line 610 "Flags_loadFlags.c"
#define _OMC_LIT191 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT191)
#line 611 "Flags_loadFlags.c"
#define _OMC_LIT192_data "updmod"
#line 612 "Flags_loadFlags.c"
static const size_t _OMC_LIT192_strlen = 6;
#line 613 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT192,6,_OMC_LIT192_data);
#line 614 "Flags_loadFlags.c"
#define _OMC_LIT192 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT192)
#line 615 "Flags_loadFlags.c"
#define _OMC_LIT193_data "Prints information about modification updates."
#line 616 "Flags_loadFlags.c"
static const size_t _OMC_LIT193_strlen = 46;
#line 617 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT193,46,_OMC_LIT193_data);
#line 618 "Flags_loadFlags.c"
#define _OMC_LIT193 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT193)
#line 619 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT194,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(83)),_OMC_LIT192,_OMC_LIT193}};
#line 620 "Flags_loadFlags.c"
#define _OMC_LIT194 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT194)
#line 621 "Flags_loadFlags.c"
#define _OMC_LIT195_data "sei"
#line 622 "Flags_loadFlags.c"
static const size_t _OMC_LIT195_strlen = 3;
#line 623 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT195,3,_OMC_LIT195_data);
#line 624 "Flags_loadFlags.c"
#define _OMC_LIT195 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT195)
#line 625 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT196,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(84)),_OMC_LIT195,_OMC_LIT7}};
#line 626 "Flags_loadFlags.c"
#define _OMC_LIT196 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT196)
#line 627 "Flags_loadFlags.c"
#define _OMC_LIT197_data "static"
#line 628 "Flags_loadFlags.c"
static const size_t _OMC_LIT197_strlen = 6;
#line 629 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT197,6,_OMC_LIT197_data);
#line 630 "Flags_loadFlags.c"
#define _OMC_LIT197 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT197)
#line 631 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT198,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(85)),_OMC_LIT197,_OMC_LIT7}};
#line 632 "Flags_loadFlags.c"
#define _OMC_LIT198 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT198)
#line 633 "Flags_loadFlags.c"
#define _OMC_LIT199_data "perfTimes"
#line 634 "Flags_loadFlags.c"
static const size_t _OMC_LIT199_strlen = 9;
#line 635 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT199,9,_OMC_LIT199_data);
#line 636 "Flags_loadFlags.c"
#define _OMC_LIT199 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT199)
#line 637 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT200,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(86)),_OMC_LIT199,_OMC_LIT7}};
#line 638 "Flags_loadFlags.c"
#define _OMC_LIT200 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT200)
#line 639 "Flags_loadFlags.c"
#define _OMC_LIT201_data "checkSimplify"
#line 640 "Flags_loadFlags.c"
static const size_t _OMC_LIT201_strlen = 13;
#line 641 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT201,13,_OMC_LIT201_data);
#line 642 "Flags_loadFlags.c"
#define _OMC_LIT201 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT201)
#line 643 "Flags_loadFlags.c"
#define _OMC_LIT202_data "Enables checks for expression simplification and prints a notification whenever an undesirable transformation has been performed."
#line 644 "Flags_loadFlags.c"
static const size_t _OMC_LIT202_strlen = 129;
#line 645 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT202,129,_OMC_LIT202_data);
#line 646 "Flags_loadFlags.c"
#define _OMC_LIT202 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT202)
#line 647 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT203,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(87)),_OMC_LIT201,_OMC_LIT202}};
#line 648 "Flags_loadFlags.c"
#define _OMC_LIT203 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT203)
#line 649 "Flags_loadFlags.c"
#define _OMC_LIT204_data "scodeInst"
#line 650 "Flags_loadFlags.c"
static const size_t _OMC_LIT204_strlen = 9;
#line 651 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT204,9,_OMC_LIT204_data);
#line 652 "Flags_loadFlags.c"
#define _OMC_LIT204 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT204)
#line 653 "Flags_loadFlags.c"
#define _OMC_LIT205_data "Enables experimental SCode instantiation phase."
#line 654 "Flags_loadFlags.c"
static const size_t _OMC_LIT205_strlen = 47;
#line 655 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT205,47,_OMC_LIT205_data);
#line 656 "Flags_loadFlags.c"
#define _OMC_LIT205 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT205)
#line 657 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT206,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(88)),_OMC_LIT204,_OMC_LIT205}};
#line 658 "Flags_loadFlags.c"
#define _OMC_LIT206 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT206)
#line 659 "Flags_loadFlags.c"
#define _OMC_LIT207_data "delayBreakLoop"
#line 660 "Flags_loadFlags.c"
static const size_t _OMC_LIT207_strlen = 14;
#line 661 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT207,14,_OMC_LIT207_data);
#line 662 "Flags_loadFlags.c"
#define _OMC_LIT207 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT207)
#line 663 "Flags_loadFlags.c"
#define _OMC_LIT208_data "Enables (very) experimental code to break algebraic loops using the delay() operator. Probably messes with initialization."
#line 664 "Flags_loadFlags.c"
static const size_t _OMC_LIT208_strlen = 122;
#line 665 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT208,122,_OMC_LIT208_data);
#line 666 "Flags_loadFlags.c"
#define _OMC_LIT208 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT208)
#line 667 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT209,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(89)),_OMC_LIT207,_OMC_LIT208}};
#line 668 "Flags_loadFlags.c"
#define _OMC_LIT209 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT209)
#line 669 "Flags_loadFlags.c"
#define _OMC_LIT210_data "writeToBuffer"
#line 670 "Flags_loadFlags.c"
static const size_t _OMC_LIT210_strlen = 13;
#line 671 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT210,13,_OMC_LIT210_data);
#line 672 "Flags_loadFlags.c"
#define _OMC_LIT210 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT210)
#line 673 "Flags_loadFlags.c"
#define _OMC_LIT211_data "Enables writing simulation results to buffer."
#line 674 "Flags_loadFlags.c"
static const size_t _OMC_LIT211_strlen = 45;
#line 675 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT211,45,_OMC_LIT211_data);
#line 676 "Flags_loadFlags.c"
#define _OMC_LIT211 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT211)
#line 677 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT212,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(90)),_OMC_LIT210,_OMC_LIT211}};
#line 678 "Flags_loadFlags.c"
#define _OMC_LIT212 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT212)
#line 679 "Flags_loadFlags.c"
#define _OMC_LIT213_data "backenddaeinfo"
#line 680 "Flags_loadFlags.c"
static const size_t _OMC_LIT213_strlen = 14;
#line 681 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT213,14,_OMC_LIT213_data);
#line 682 "Flags_loadFlags.c"
#define _OMC_LIT213 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT213)
#line 683 "Flags_loadFlags.c"
#define _OMC_LIT214_data "Enables dumping of backend information about system (Number of equations before backend,...)."
#line 684 "Flags_loadFlags.c"
static const size_t _OMC_LIT214_strlen = 93;
#line 685 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT214,93,_OMC_LIT214_data);
#line 686 "Flags_loadFlags.c"
#define _OMC_LIT214 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT214)
#line 687 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT215,4,3) {&Flags_DebugFlag_DEBUG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(91)),_OMC_LIT213,_OMC_LIT214}};
#line 688 "Flags_loadFlags.c"
#define _OMC_LIT215 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT215)
#line 689 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT216,2,1) {_OMC_LIT215,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 690 "Flags_loadFlags.c"
#define _OMC_LIT216 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT216)
#line 691 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT217,2,1) {_OMC_LIT212,_OMC_LIT216}};
#line 692 "Flags_loadFlags.c"
#define _OMC_LIT217 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT217)
#line 693 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT218,2,1) {_OMC_LIT209,_OMC_LIT217}};
#line 694 "Flags_loadFlags.c"
#define _OMC_LIT218 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT218)
#line 695 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT219,2,1) {_OMC_LIT206,_OMC_LIT218}};
#line 696 "Flags_loadFlags.c"
#define _OMC_LIT219 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT219)
#line 697 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT220,2,1) {_OMC_LIT203,_OMC_LIT219}};
#line 698 "Flags_loadFlags.c"
#define _OMC_LIT220 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT220)
#line 699 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT221,2,1) {_OMC_LIT200,_OMC_LIT220}};
#line 700 "Flags_loadFlags.c"
#define _OMC_LIT221 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT221)
#line 701 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT222,2,1) {_OMC_LIT198,_OMC_LIT221}};
#line 702 "Flags_loadFlags.c"
#define _OMC_LIT222 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT222)
#line 703 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT223,2,1) {_OMC_LIT196,_OMC_LIT222}};
#line 704 "Flags_loadFlags.c"
#define _OMC_LIT223 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT223)
#line 705 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT224,2,1) {_OMC_LIT194,_OMC_LIT223}};
#line 706 "Flags_loadFlags.c"
#define _OMC_LIT224 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT224)
#line 707 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT225,2,1) {_OMC_LIT191,_OMC_LIT224}};
#line 708 "Flags_loadFlags.c"
#define _OMC_LIT225 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT225)
#line 709 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT226,2,1) {_OMC_LIT189,_OMC_LIT225}};
#line 710 "Flags_loadFlags.c"
#define _OMC_LIT226 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT226)
#line 711 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT227,2,1) {_OMC_LIT187,_OMC_LIT226}};
#line 712 "Flags_loadFlags.c"
#define _OMC_LIT227 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT227)
#line 713 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT228,2,1) {_OMC_LIT185,_OMC_LIT227}};
#line 714 "Flags_loadFlags.c"
#define _OMC_LIT228 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT228)
#line 715 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT229,2,1) {_OMC_LIT182,_OMC_LIT228}};
#line 716 "Flags_loadFlags.c"
#define _OMC_LIT229 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT229)
#line 717 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT230,2,1) {_OMC_LIT180,_OMC_LIT229}};
#line 718 "Flags_loadFlags.c"
#define _OMC_LIT230 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT230)
#line 719 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT231,2,1) {_OMC_LIT178,_OMC_LIT230}};
#line 720 "Flags_loadFlags.c"
#define _OMC_LIT231 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT231)
#line 721 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT232,2,1) {_OMC_LIT176,_OMC_LIT231}};
#line 722 "Flags_loadFlags.c"
#define _OMC_LIT232 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT232)
#line 723 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT233,2,1) {_OMC_LIT174,_OMC_LIT232}};
#line 724 "Flags_loadFlags.c"
#define _OMC_LIT233 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT233)
#line 725 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT234,2,1) {_OMC_LIT172,_OMC_LIT233}};
#line 726 "Flags_loadFlags.c"
#define _OMC_LIT234 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT234)
#line 727 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT235,2,1) {_OMC_LIT170,_OMC_LIT234}};
#line 728 "Flags_loadFlags.c"
#define _OMC_LIT235 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT235)
#line 729 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT236,2,1) {_OMC_LIT168,_OMC_LIT235}};
#line 730 "Flags_loadFlags.c"
#define _OMC_LIT236 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT236)
#line 731 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT237,2,1) {_OMC_LIT166,_OMC_LIT236}};
#line 732 "Flags_loadFlags.c"
#define _OMC_LIT237 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT237)
#line 733 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT238,2,1) {_OMC_LIT163,_OMC_LIT237}};
#line 734 "Flags_loadFlags.c"
#define _OMC_LIT238 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT238)
#line 735 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT239,2,1) {_OMC_LIT160,_OMC_LIT238}};
#line 736 "Flags_loadFlags.c"
#define _OMC_LIT239 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT239)
#line 737 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT240,2,1) {_OMC_LIT157,_OMC_LIT239}};
#line 738 "Flags_loadFlags.c"
#define _OMC_LIT240 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT240)
#line 739 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT241,2,1) {_OMC_LIT155,_OMC_LIT240}};
#line 740 "Flags_loadFlags.c"
#define _OMC_LIT241 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT241)
#line 741 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT242,2,1) {_OMC_LIT152,_OMC_LIT241}};
#line 742 "Flags_loadFlags.c"
#define _OMC_LIT242 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT242)
#line 743 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT243,2,1) {_OMC_LIT150,_OMC_LIT242}};
#line 744 "Flags_loadFlags.c"
#define _OMC_LIT243 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT243)
#line 745 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT244,2,1) {_OMC_LIT148,_OMC_LIT243}};
#line 746 "Flags_loadFlags.c"
#define _OMC_LIT244 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT244)
#line 747 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT245,2,1) {_OMC_LIT146,_OMC_LIT244}};
#line 748 "Flags_loadFlags.c"
#define _OMC_LIT245 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT245)
#line 749 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT246,2,1) {_OMC_LIT144,_OMC_LIT245}};
#line 750 "Flags_loadFlags.c"
#define _OMC_LIT246 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT246)
#line 751 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT247,2,1) {_OMC_LIT142,_OMC_LIT246}};
#line 752 "Flags_loadFlags.c"
#define _OMC_LIT247 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT247)
#line 753 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT248,2,1) {_OMC_LIT140,_OMC_LIT247}};
#line 754 "Flags_loadFlags.c"
#define _OMC_LIT248 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT248)
#line 755 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT249,2,1) {_OMC_LIT137,_OMC_LIT248}};
#line 756 "Flags_loadFlags.c"
#define _OMC_LIT249 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT249)
#line 757 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT250,2,1) {_OMC_LIT135,_OMC_LIT249}};
#line 758 "Flags_loadFlags.c"
#define _OMC_LIT250 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT250)
#line 759 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT251,2,1) {_OMC_LIT133,_OMC_LIT250}};
#line 760 "Flags_loadFlags.c"
#define _OMC_LIT251 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT251)
#line 761 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT252,2,1) {_OMC_LIT131,_OMC_LIT251}};
#line 762 "Flags_loadFlags.c"
#define _OMC_LIT252 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT252)
#line 763 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT253,2,1) {_OMC_LIT129,_OMC_LIT252}};
#line 764 "Flags_loadFlags.c"
#define _OMC_LIT253 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT253)
#line 765 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT254,2,1) {_OMC_LIT127,_OMC_LIT253}};
#line 766 "Flags_loadFlags.c"
#define _OMC_LIT254 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT254)
#line 767 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT255,2,1) {_OMC_LIT125,_OMC_LIT254}};
#line 768 "Flags_loadFlags.c"
#define _OMC_LIT255 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT255)
#line 769 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT256,2,1) {_OMC_LIT122,_OMC_LIT255}};
#line 770 "Flags_loadFlags.c"
#define _OMC_LIT256 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT256)
#line 771 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT257,2,1) {_OMC_LIT119,_OMC_LIT256}};
#line 772 "Flags_loadFlags.c"
#define _OMC_LIT257 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT257)
#line 773 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT258,2,1) {_OMC_LIT116,_OMC_LIT257}};
#line 774 "Flags_loadFlags.c"
#define _OMC_LIT258 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT258)
#line 775 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT259,2,1) {_OMC_LIT114,_OMC_LIT258}};
#line 776 "Flags_loadFlags.c"
#define _OMC_LIT259 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT259)
#line 777 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT260,2,1) {_OMC_LIT112,_OMC_LIT259}};
#line 778 "Flags_loadFlags.c"
#define _OMC_LIT260 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT260)
#line 779 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT261,2,1) {_OMC_LIT110,_OMC_LIT260}};
#line 780 "Flags_loadFlags.c"
#define _OMC_LIT261 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT261)
#line 781 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT262,2,1) {_OMC_LIT108,_OMC_LIT261}};
#line 782 "Flags_loadFlags.c"
#define _OMC_LIT262 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT262)
#line 783 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT263,2,1) {_OMC_LIT106,_OMC_LIT262}};
#line 784 "Flags_loadFlags.c"
#define _OMC_LIT263 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT263)
#line 785 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT264,2,1) {_OMC_LIT104,_OMC_LIT263}};
#line 786 "Flags_loadFlags.c"
#define _OMC_LIT264 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT264)
#line 787 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT265,2,1) {_OMC_LIT102,_OMC_LIT264}};
#line 788 "Flags_loadFlags.c"
#define _OMC_LIT265 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT265)
#line 789 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT266,2,1) {_OMC_LIT100,_OMC_LIT265}};
#line 790 "Flags_loadFlags.c"
#define _OMC_LIT266 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT266)
#line 791 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT267,2,1) {_OMC_LIT97,_OMC_LIT266}};
#line 792 "Flags_loadFlags.c"
#define _OMC_LIT267 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT267)
#line 793 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT268,2,1) {_OMC_LIT95,_OMC_LIT267}};
#line 794 "Flags_loadFlags.c"
#define _OMC_LIT268 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT268)
#line 795 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT269,2,1) {_OMC_LIT93,_OMC_LIT268}};
#line 796 "Flags_loadFlags.c"
#define _OMC_LIT269 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT269)
#line 797 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT270,2,1) {_OMC_LIT91,_OMC_LIT269}};
#line 798 "Flags_loadFlags.c"
#define _OMC_LIT270 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT270)
#line 799 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT271,2,1) {_OMC_LIT88,_OMC_LIT270}};
#line 800 "Flags_loadFlags.c"
#define _OMC_LIT271 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT271)
#line 801 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT272,2,1) {_OMC_LIT85,_OMC_LIT271}};
#line 802 "Flags_loadFlags.c"
#define _OMC_LIT272 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT272)
#line 803 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT273,2,1) {_OMC_LIT83,_OMC_LIT272}};
#line 804 "Flags_loadFlags.c"
#define _OMC_LIT273 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT273)
#line 805 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT274,2,1) {_OMC_LIT80,_OMC_LIT273}};
#line 806 "Flags_loadFlags.c"
#define _OMC_LIT274 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT274)
#line 807 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT275,2,1) {_OMC_LIT78,_OMC_LIT274}};
#line 808 "Flags_loadFlags.c"
#define _OMC_LIT275 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT275)
#line 809 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT276,2,1) {_OMC_LIT76,_OMC_LIT275}};
#line 810 "Flags_loadFlags.c"
#define _OMC_LIT276 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT276)
#line 811 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT277,2,1) {_OMC_LIT74,_OMC_LIT276}};
#line 812 "Flags_loadFlags.c"
#define _OMC_LIT277 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT277)
#line 813 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT278,2,1) {_OMC_LIT72,_OMC_LIT277}};
#line 814 "Flags_loadFlags.c"
#define _OMC_LIT278 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT278)
#line 815 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT279,2,1) {_OMC_LIT70,_OMC_LIT278}};
#line 816 "Flags_loadFlags.c"
#define _OMC_LIT279 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT279)
#line 817 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT280,2,1) {_OMC_LIT67,_OMC_LIT279}};
#line 818 "Flags_loadFlags.c"
#define _OMC_LIT280 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT280)
#line 819 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT281,2,1) {_OMC_LIT64,_OMC_LIT280}};
#line 820 "Flags_loadFlags.c"
#define _OMC_LIT281 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT281)
#line 821 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT282,2,1) {_OMC_LIT61,_OMC_LIT281}};
#line 822 "Flags_loadFlags.c"
#define _OMC_LIT282 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT282)
#line 823 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT283,2,1) {_OMC_LIT58,_OMC_LIT282}};
#line 824 "Flags_loadFlags.c"
#define _OMC_LIT283 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT283)
#line 825 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT284,2,1) {_OMC_LIT55,_OMC_LIT283}};
#line 826 "Flags_loadFlags.c"
#define _OMC_LIT284 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT284)
#line 827 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT285,2,1) {_OMC_LIT52,_OMC_LIT284}};
#line 828 "Flags_loadFlags.c"
#define _OMC_LIT285 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT285)
#line 829 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT286,2,1) {_OMC_LIT50,_OMC_LIT285}};
#line 830 "Flags_loadFlags.c"
#define _OMC_LIT286 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT286)
#line 831 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT287,2,1) {_OMC_LIT48,_OMC_LIT286}};
#line 832 "Flags_loadFlags.c"
#define _OMC_LIT287 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT287)
#line 833 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT288,2,1) {_OMC_LIT46,_OMC_LIT287}};
#line 834 "Flags_loadFlags.c"
#define _OMC_LIT288 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT288)
#line 835 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT289,2,1) {_OMC_LIT44,_OMC_LIT288}};
#line 836 "Flags_loadFlags.c"
#define _OMC_LIT289 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT289)
#line 837 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT290,2,1) {_OMC_LIT41,_OMC_LIT289}};
#line 838 "Flags_loadFlags.c"
#define _OMC_LIT290 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT290)
#line 839 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT291,2,1) {_OMC_LIT38,_OMC_LIT290}};
#line 840 "Flags_loadFlags.c"
#define _OMC_LIT291 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT291)
#line 841 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT292,2,1) {_OMC_LIT36,_OMC_LIT291}};
#line 842 "Flags_loadFlags.c"
#define _OMC_LIT292 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT292)
#line 843 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT293,2,1) {_OMC_LIT33,_OMC_LIT292}};
#line 844 "Flags_loadFlags.c"
#define _OMC_LIT293 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT293)
#line 845 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT294,2,1) {_OMC_LIT30,_OMC_LIT293}};
#line 846 "Flags_loadFlags.c"
#define _OMC_LIT294 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT294)
#line 847 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT295,2,1) {_OMC_LIT27,_OMC_LIT294}};
#line 848 "Flags_loadFlags.c"
#define _OMC_LIT295 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT295)
#line 849 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT296,2,1) {_OMC_LIT24,_OMC_LIT295}};
#line 850 "Flags_loadFlags.c"
#define _OMC_LIT296 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT296)
#line 851 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT297,2,1) {_OMC_LIT22,_OMC_LIT296}};
#line 852 "Flags_loadFlags.c"
#define _OMC_LIT297 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT297)
#line 853 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT298,2,1) {_OMC_LIT20,_OMC_LIT297}};
#line 854 "Flags_loadFlags.c"
#define _OMC_LIT298 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT298)
#line 855 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT299,2,1) {_OMC_LIT18,_OMC_LIT298}};
#line 856 "Flags_loadFlags.c"
#define _OMC_LIT299 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT299)
#line 857 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT300,2,1) {_OMC_LIT16,_OMC_LIT299}};
#line 858 "Flags_loadFlags.c"
#define _OMC_LIT300 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT300)
#line 859 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT301,2,1) {_OMC_LIT14,_OMC_LIT300}};
#line 860 "Flags_loadFlags.c"
#define _OMC_LIT301 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT301)
#line 861 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT302,2,1) {_OMC_LIT12,_OMC_LIT301}};
#line 862 "Flags_loadFlags.c"
#define _OMC_LIT302 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT302)
#line 863 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT303,2,1) {_OMC_LIT10,_OMC_LIT302}};
#line 864 "Flags_loadFlags.c"
#define _OMC_LIT303 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT303)
#line 865 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT304,2,1) {_OMC_LIT8,_OMC_LIT303}};
#line 866 "Flags_loadFlags.c"
#define _OMC_LIT304 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT304)
#line 867 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT305,2,1) {_OMC_LIT5,_OMC_LIT304}};
#line 868 "Flags_loadFlags.c"
#define _OMC_LIT305 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT305)
#line 869 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT306,2,1) {_OMC_LIT2,_OMC_LIT305}};
#line 870 "Flags_loadFlags.c"
#define _OMC_LIT306 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT306)
#line 871 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT307,1,3) {&Flags_FlagData_EMPTY__FLAG__desc,}};
#line 872 "Flags_loadFlags.c"
#define _OMC_LIT307 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT307)
#line 873 "Flags_loadFlags.c"
#define _OMC_LIT308_data "debug"
#line 874 "Flags_loadFlags.c"
static const size_t _OMC_LIT308_strlen = 5;
#line 875 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT308,5,_OMC_LIT308_data);
#line 876 "Flags_loadFlags.c"
#define _OMC_LIT308 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT308)
#line 877 "Flags_loadFlags.c"
#define _OMC_LIT309_data "d"
#line 878 "Flags_loadFlags.c"
static const size_t _OMC_LIT309_strlen = 1;
#line 879 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT309,1,_OMC_LIT309_data);
#line 880 "Flags_loadFlags.c"
#define _OMC_LIT309 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT309)
#line 881 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT310,1,1) {_OMC_LIT309}};
#line 882 "Flags_loadFlags.c"
#define _OMC_LIT310 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT310)
#line 883 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT311,1,4) {&Flags_FlagVisibility_EXTERNAL__desc,}};
#line 884 "Flags_loadFlags.c"
#define _OMC_LIT311 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT311)
#line 885 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT312,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT7}};
#line 886 "Flags_loadFlags.c"
#define _OMC_LIT312 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT312)
#line 887 "Flags_loadFlags.c"
#define _OMC_LIT313_data "Sets debug flags. Use +help=debug to see available flags."
#line 888 "Flags_loadFlags.c"
static const size_t _OMC_LIT313_strlen = 57;
#line 889 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT313,57,_OMC_LIT313_data);
#line 890 "Flags_loadFlags.c"
#define _OMC_LIT313 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT313)
#line 891 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT314,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(1)),_OMC_LIT308,_OMC_LIT310,_OMC_LIT311,_OMC_LIT312,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT313}};
#line 892 "Flags_loadFlags.c"
#define _OMC_LIT314 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT314)
#line 893 "Flags_loadFlags.c"
#define _OMC_LIT315_data "help"
#line 894 "Flags_loadFlags.c"
static const size_t _OMC_LIT315_strlen = 4;
#line 895 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT315,4,_OMC_LIT315_data);
#line 896 "Flags_loadFlags.c"
#define _OMC_LIT315 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT315)
#line 897 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT316,2,4) {&Flags_FlagData_BOOL__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(0))}};
#line 898 "Flags_loadFlags.c"
#define _OMC_LIT316 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT316)
#line 899 "Flags_loadFlags.c"
#define _OMC_LIT317_data "optmodules"
#line 900 "Flags_loadFlags.c"
static const size_t _OMC_LIT317_strlen = 10;
#line 901 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT317,10,_OMC_LIT317_data);
#line 902 "Flags_loadFlags.c"
#define _OMC_LIT317 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT317)
#line 903 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT318,2,1) {_OMC_LIT317,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 904 "Flags_loadFlags.c"
#define _OMC_LIT318 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT318)
#line 905 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT319,2,1) {_OMC_LIT308,_OMC_LIT318}};
#line 906 "Flags_loadFlags.c"
#define _OMC_LIT319 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT319)
#line 907 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT320,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT319}};
#line 908 "Flags_loadFlags.c"
#define _OMC_LIT320 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT320)
#line 909 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT321,1,1) {_OMC_LIT320}};
#line 910 "Flags_loadFlags.c"
#define _OMC_LIT321 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT321)
#line 911 "Flags_loadFlags.c"
#define _OMC_LIT322_data "Displays the help text."
#line 912 "Flags_loadFlags.c"
static const size_t _OMC_LIT322_strlen = 23;
#line 913 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT322,23,_OMC_LIT322_data);
#line 914 "Flags_loadFlags.c"
#define _OMC_LIT322 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT322)
#line 915 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT323,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(2)),_OMC_LIT315,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,_OMC_LIT321,_OMC_LIT322}};
#line 916 "Flags_loadFlags.c"
#define _OMC_LIT323 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT323)
#line 917 "Flags_loadFlags.c"
#define _OMC_LIT324_data "running-testsuite"
#line 918 "Flags_loadFlags.c"
static const size_t _OMC_LIT324_strlen = 17;
#line 919 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT324,17,_OMC_LIT324_data);
#line 920 "Flags_loadFlags.c"
#define _OMC_LIT324 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT324)
#line 921 "Flags_loadFlags.c"
#define _OMC_LIT325_data "Used when running the testsuite."
#line 922 "Flags_loadFlags.c"
static const size_t _OMC_LIT325_strlen = 32;
#line 923 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT325,32,_OMC_LIT325_data);
#line 924 "Flags_loadFlags.c"
#define _OMC_LIT325 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT325)
#line 925 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT326,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(3)),_OMC_LIT324,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT325}};
#line 926 "Flags_loadFlags.c"
#define _OMC_LIT326 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT326)
#line 927 "Flags_loadFlags.c"
#define _OMC_LIT327_data "version"
#line 928 "Flags_loadFlags.c"
static const size_t _OMC_LIT327_strlen = 7;
#line 929 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT327,7,_OMC_LIT327_data);
#line 930 "Flags_loadFlags.c"
#define _OMC_LIT327 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT327)
#line 931 "Flags_loadFlags.c"
#define _OMC_LIT328_data "+v"
#line 932 "Flags_loadFlags.c"
static const size_t _OMC_LIT328_strlen = 2;
#line 933 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT328,2,_OMC_LIT328_data);
#line 934 "Flags_loadFlags.c"
#define _OMC_LIT328 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT328)
#line 935 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT329,1,1) {_OMC_LIT328}};
#line 936 "Flags_loadFlags.c"
#define _OMC_LIT329 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT329)
#line 937 "Flags_loadFlags.c"
#define _OMC_LIT330_data "Print the version and exit."
#line 938 "Flags_loadFlags.c"
static const size_t _OMC_LIT330_strlen = 27;
#line 939 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT330,27,_OMC_LIT330_data);
#line 940 "Flags_loadFlags.c"
#define _OMC_LIT330 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT330)
#line 941 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT331,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(4)),_OMC_LIT327,_OMC_LIT329,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT330}};
#line 942 "Flags_loadFlags.c"
#define _OMC_LIT331 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT331)
#line 943 "Flags_loadFlags.c"
#define _OMC_LIT332_data "target"
#line 944 "Flags_loadFlags.c"
static const size_t _OMC_LIT332_strlen = 6;
#line 945 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT332,6,_OMC_LIT332_data);
#line 946 "Flags_loadFlags.c"
#define _OMC_LIT332 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT332)
#line 947 "Flags_loadFlags.c"
#define _OMC_LIT333_data "gcc"
#line 948 "Flags_loadFlags.c"
static const size_t _OMC_LIT333_strlen = 3;
#line 949 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT333,3,_OMC_LIT333_data);
#line 950 "Flags_loadFlags.c"
#define _OMC_LIT333 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT333)
#line 951 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT334,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT333}};
#line 952 "Flags_loadFlags.c"
#define _OMC_LIT334 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT334)
#line 953 "Flags_loadFlags.c"
#define _OMC_LIT335_data "gcc, msvc"
#line 954 "Flags_loadFlags.c"
static const size_t _OMC_LIT335_strlen = 9;
#line 955 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT335,9,_OMC_LIT335_data);
#line 956 "Flags_loadFlags.c"
#define _OMC_LIT335 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT335)
#line 957 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT336,2,1) {_OMC_LIT335,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 958 "Flags_loadFlags.c"
#define _OMC_LIT336 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT336)
#line 959 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT337,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT336}};
#line 960 "Flags_loadFlags.c"
#define _OMC_LIT337 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT337)
#line 961 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT338,1,1) {_OMC_LIT337}};
#line 962 "Flags_loadFlags.c"
#define _OMC_LIT338 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT338)
#line 963 "Flags_loadFlags.c"
#define _OMC_LIT339_data "Sets the target compiler to use."
#line 964 "Flags_loadFlags.c"
static const size_t _OMC_LIT339_strlen = 32;
#line 965 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT339,32,_OMC_LIT339_data);
#line 966 "Flags_loadFlags.c"
#define _OMC_LIT339 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT339)
#line 967 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT340,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(5)),_OMC_LIT332,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT334,_OMC_LIT338,_OMC_LIT339}};
#line 968 "Flags_loadFlags.c"
#define _OMC_LIT340 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT340)
#line 969 "Flags_loadFlags.c"
#define _OMC_LIT341_data "grammar"
#line 970 "Flags_loadFlags.c"
static const size_t _OMC_LIT341_strlen = 7;
#line 971 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT341,7,_OMC_LIT341_data);
#line 972 "Flags_loadFlags.c"
#define _OMC_LIT341 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT341)
#line 973 "Flags_loadFlags.c"
#define _OMC_LIT342_data "g"
#line 974 "Flags_loadFlags.c"
static const size_t _OMC_LIT342_strlen = 1;
#line 975 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT342,1,_OMC_LIT342_data);
#line 976 "Flags_loadFlags.c"
#define _OMC_LIT342 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT342)
#line 977 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT343,1,1) {_OMC_LIT342}};
#line 978 "Flags_loadFlags.c"
#define _OMC_LIT343 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT343)
#line 979 "Flags_loadFlags.c"
#define _OMC_LIT344_data "Modelica"
#line 980 "Flags_loadFlags.c"
static const size_t _OMC_LIT344_strlen = 8;
#line 981 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT344,8,_OMC_LIT344_data);
#line 982 "Flags_loadFlags.c"
#define _OMC_LIT344 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT344)
#line 983 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT345,2,0) {_OMC_LIT344,MMC_IMMEDIATE(MMC_TAGFIXNUM(1))}};
#line 984 "Flags_loadFlags.c"
#define _OMC_LIT345 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT345)
#line 985 "Flags_loadFlags.c"
#define _OMC_LIT346_data "MetaModelica"
#line 986 "Flags_loadFlags.c"
static const size_t _OMC_LIT346_strlen = 12;
#line 987 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT346,12,_OMC_LIT346_data);
#line 988 "Flags_loadFlags.c"
#define _OMC_LIT346 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT346)
#line 989 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT347,2,0) {_OMC_LIT346,MMC_IMMEDIATE(MMC_TAGFIXNUM(2))}};
#line 990 "Flags_loadFlags.c"
#define _OMC_LIT347 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT347)
#line 991 "Flags_loadFlags.c"
#define _OMC_LIT348_data "ParModelica"
#line 992 "Flags_loadFlags.c"
static const size_t _OMC_LIT348_strlen = 11;
#line 993 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT348,11,_OMC_LIT348_data);
#line 994 "Flags_loadFlags.c"
#define _OMC_LIT348 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT348)
#line 995 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT349,2,0) {_OMC_LIT348,MMC_IMMEDIATE(MMC_TAGFIXNUM(3))}};
#line 996 "Flags_loadFlags.c"
#define _OMC_LIT349 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT349)
#line 997 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT350,2,1) {_OMC_LIT349,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 998 "Flags_loadFlags.c"
#define _OMC_LIT350 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT350)
#line 999 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT351,2,1) {_OMC_LIT347,_OMC_LIT350}};
#line 1000 "Flags_loadFlags.c"
#define _OMC_LIT351 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT351)
#line 1001 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT352,2,1) {_OMC_LIT345,_OMC_LIT351}};
#line 1002 "Flags_loadFlags.c"
#define _OMC_LIT352 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT352)
#line 1003 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT353,3,9) {&Flags_FlagData_ENUM__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(1)),_OMC_LIT352}};
#line 1004 "Flags_loadFlags.c"
#define _OMC_LIT353 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT353)
#line 1005 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT354,2,1) {_OMC_LIT348,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1006 "Flags_loadFlags.c"
#define _OMC_LIT354 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT354)
#line 1007 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT355,2,1) {_OMC_LIT346,_OMC_LIT354}};
#line 1008 "Flags_loadFlags.c"
#define _OMC_LIT355 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT355)
#line 1009 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT356,2,1) {_OMC_LIT344,_OMC_LIT355}};
#line 1010 "Flags_loadFlags.c"
#define _OMC_LIT356 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT356)
#line 1011 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT357,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT356}};
#line 1012 "Flags_loadFlags.c"
#define _OMC_LIT357 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT357)
#line 1013 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT358,1,1) {_OMC_LIT357}};
#line 1014 "Flags_loadFlags.c"
#define _OMC_LIT358 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT358)
#line 1015 "Flags_loadFlags.c"
#define _OMC_LIT359_data "Sets the grammar and semantics to accept."
#line 1016 "Flags_loadFlags.c"
static const size_t _OMC_LIT359_strlen = 41;
#line 1017 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT359,41,_OMC_LIT359_data);
#line 1018 "Flags_loadFlags.c"
#define _OMC_LIT359 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT359)
#line 1019 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT360,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(6)),_OMC_LIT341,_OMC_LIT343,_OMC_LIT311,_OMC_LIT353,_OMC_LIT358,_OMC_LIT359}};
#line 1020 "Flags_loadFlags.c"
#define _OMC_LIT360 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT360)
#line 1021 "Flags_loadFlags.c"
#define _OMC_LIT361_data "annotationVersion"
#line 1022 "Flags_loadFlags.c"
static const size_t _OMC_LIT361_strlen = 17;
#line 1023 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT361,17,_OMC_LIT361_data);
#line 1024 "Flags_loadFlags.c"
#define _OMC_LIT361 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT361)
#line 1025 "Flags_loadFlags.c"
#define _OMC_LIT362_data "3.x"
#line 1026 "Flags_loadFlags.c"
static const size_t _OMC_LIT362_strlen = 3;
#line 1027 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT362,3,_OMC_LIT362_data);
#line 1028 "Flags_loadFlags.c"
#define _OMC_LIT362 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT362)
#line 1029 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT363,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT362}};
#line 1030 "Flags_loadFlags.c"
#define _OMC_LIT363 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT363)
#line 1031 "Flags_loadFlags.c"
#define _OMC_LIT364_data "1.x"
#line 1032 "Flags_loadFlags.c"
static const size_t _OMC_LIT364_strlen = 3;
#line 1033 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT364,3,_OMC_LIT364_data);
#line 1034 "Flags_loadFlags.c"
#define _OMC_LIT364 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT364)
#line 1035 "Flags_loadFlags.c"
#define _OMC_LIT365_data "2.x"
#line 1036 "Flags_loadFlags.c"
static const size_t _OMC_LIT365_strlen = 3;
#line 1037 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT365,3,_OMC_LIT365_data);
#line 1038 "Flags_loadFlags.c"
#define _OMC_LIT365 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT365)
#line 1039 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT366,2,1) {_OMC_LIT362,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1040 "Flags_loadFlags.c"
#define _OMC_LIT366 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT366)
#line 1041 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT367,2,1) {_OMC_LIT365,_OMC_LIT366}};
#line 1042 "Flags_loadFlags.c"
#define _OMC_LIT367 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT367)
#line 1043 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT368,2,1) {_OMC_LIT364,_OMC_LIT367}};
#line 1044 "Flags_loadFlags.c"
#define _OMC_LIT368 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT368)
#line 1045 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT369,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT368}};
#line 1046 "Flags_loadFlags.c"
#define _OMC_LIT369 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT369)
#line 1047 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT370,1,1) {_OMC_LIT369}};
#line 1048 "Flags_loadFlags.c"
#define _OMC_LIT370 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT370)
#line 1049 "Flags_loadFlags.c"
#define _OMC_LIT371_data "Sets the annotation version that should be used."
#line 1050 "Flags_loadFlags.c"
static const size_t _OMC_LIT371_strlen = 48;
#line 1051 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT371,48,_OMC_LIT371_data);
#line 1052 "Flags_loadFlags.c"
#define _OMC_LIT371 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT371)
#line 1053 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT372,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(7)),_OMC_LIT361,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT363,_OMC_LIT370,_OMC_LIT371}};
#line 1054 "Flags_loadFlags.c"
#define _OMC_LIT372 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT372)
#line 1055 "Flags_loadFlags.c"
#define _OMC_LIT373_data "std"
#line 1056 "Flags_loadFlags.c"
static const size_t _OMC_LIT373_strlen = 3;
#line 1057 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT373,3,_OMC_LIT373_data);
#line 1058 "Flags_loadFlags.c"
#define _OMC_LIT373 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT373)
#line 1059 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT374,2,0) {_OMC_LIT364,MMC_IMMEDIATE(MMC_TAGFIXNUM(10))}};
#line 1060 "Flags_loadFlags.c"
#define _OMC_LIT374 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT374)
#line 1061 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT375,2,0) {_OMC_LIT365,MMC_IMMEDIATE(MMC_TAGFIXNUM(20))}};
#line 1062 "Flags_loadFlags.c"
#define _OMC_LIT375 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT375)
#line 1063 "Flags_loadFlags.c"
#define _OMC_LIT376_data "3.0"
#line 1064 "Flags_loadFlags.c"
static const size_t _OMC_LIT376_strlen = 3;
#line 1065 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT376,3,_OMC_LIT376_data);
#line 1066 "Flags_loadFlags.c"
#define _OMC_LIT376 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT376)
#line 1067 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT377,2,0) {_OMC_LIT376,MMC_IMMEDIATE(MMC_TAGFIXNUM(30))}};
#line 1068 "Flags_loadFlags.c"
#define _OMC_LIT377 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT377)
#line 1069 "Flags_loadFlags.c"
#define _OMC_LIT378_data "3.1"
#line 1070 "Flags_loadFlags.c"
static const size_t _OMC_LIT378_strlen = 3;
#line 1071 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT378,3,_OMC_LIT378_data);
#line 1072 "Flags_loadFlags.c"
#define _OMC_LIT378 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT378)
#line 1073 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT379,2,0) {_OMC_LIT378,MMC_IMMEDIATE(MMC_TAGFIXNUM(31))}};
#line 1074 "Flags_loadFlags.c"
#define _OMC_LIT379 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT379)
#line 1075 "Flags_loadFlags.c"
#define _OMC_LIT380_data "3.2"
#line 1076 "Flags_loadFlags.c"
static const size_t _OMC_LIT380_strlen = 3;
#line 1077 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT380,3,_OMC_LIT380_data);
#line 1078 "Flags_loadFlags.c"
#define _OMC_LIT380 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT380)
#line 1079 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT381,2,0) {_OMC_LIT380,MMC_IMMEDIATE(MMC_TAGFIXNUM(32))}};
#line 1080 "Flags_loadFlags.c"
#define _OMC_LIT381 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT381)
#line 1081 "Flags_loadFlags.c"
#define _OMC_LIT382_data "3.3"
#line 1082 "Flags_loadFlags.c"
static const size_t _OMC_LIT382_strlen = 3;
#line 1083 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT382,3,_OMC_LIT382_data);
#line 1084 "Flags_loadFlags.c"
#define _OMC_LIT382 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT382)
#line 1085 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT383,2,0) {_OMC_LIT382,MMC_IMMEDIATE(MMC_TAGFIXNUM(33))}};
#line 1086 "Flags_loadFlags.c"
#define _OMC_LIT383 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT383)
#line 1087 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT384,2,1) {_OMC_LIT383,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1088 "Flags_loadFlags.c"
#define _OMC_LIT384 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT384)
#line 1089 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT385,2,1) {_OMC_LIT381,_OMC_LIT384}};
#line 1090 "Flags_loadFlags.c"
#define _OMC_LIT385 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT385)
#line 1091 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT386,2,1) {_OMC_LIT379,_OMC_LIT385}};
#line 1092 "Flags_loadFlags.c"
#define _OMC_LIT386 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT386)
#line 1093 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT387,2,1) {_OMC_LIT377,_OMC_LIT386}};
#line 1094 "Flags_loadFlags.c"
#define _OMC_LIT387 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT387)
#line 1095 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT388,2,1) {_OMC_LIT375,_OMC_LIT387}};
#line 1096 "Flags_loadFlags.c"
#define _OMC_LIT388 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT388)
#line 1097 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT389,2,1) {_OMC_LIT374,_OMC_LIT388}};
#line 1098 "Flags_loadFlags.c"
#define _OMC_LIT389 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT389)
#line 1099 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT390,3,9) {&Flags_FlagData_ENUM__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(1000)),_OMC_LIT389}};
#line 1100 "Flags_loadFlags.c"
#define _OMC_LIT390 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT390)
#line 1101 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT391,2,1) {_OMC_LIT382,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1102 "Flags_loadFlags.c"
#define _OMC_LIT391 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT391)
#line 1103 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT392,2,1) {_OMC_LIT380,_OMC_LIT391}};
#line 1104 "Flags_loadFlags.c"
#define _OMC_LIT392 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT392)
#line 1105 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT393,2,1) {_OMC_LIT378,_OMC_LIT392}};
#line 1106 "Flags_loadFlags.c"
#define _OMC_LIT393 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT393)
#line 1107 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT394,2,1) {_OMC_LIT365,_OMC_LIT393}};
#line 1108 "Flags_loadFlags.c"
#define _OMC_LIT394 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT394)
#line 1109 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT395,2,1) {_OMC_LIT364,_OMC_LIT394}};
#line 1110 "Flags_loadFlags.c"
#define _OMC_LIT395 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT395)
#line 1111 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT396,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT395}};
#line 1112 "Flags_loadFlags.c"
#define _OMC_LIT396 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT396)
#line 1113 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT397,1,1) {_OMC_LIT396}};
#line 1114 "Flags_loadFlags.c"
#define _OMC_LIT397 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT397)
#line 1115 "Flags_loadFlags.c"
#define _OMC_LIT398_data "Sets the language standard that should be used."
#line 1116 "Flags_loadFlags.c"
static const size_t _OMC_LIT398_strlen = 47;
#line 1117 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT398,47,_OMC_LIT398_data);
#line 1118 "Flags_loadFlags.c"
#define _OMC_LIT398 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT398)
#line 1119 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT399,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(8)),_OMC_LIT373,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT390,_OMC_LIT397,_OMC_LIT398}};
#line 1120 "Flags_loadFlags.c"
#define _OMC_LIT399 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT399)
#line 1121 "Flags_loadFlags.c"
#define _OMC_LIT400_data "showErrorMessages"
#line 1122 "Flags_loadFlags.c"
static const size_t _OMC_LIT400_strlen = 17;
#line 1123 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT400,17,_OMC_LIT400_data);
#line 1124 "Flags_loadFlags.c"
#define _OMC_LIT400 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT400)
#line 1125 "Flags_loadFlags.c"
#define _OMC_LIT401_data "Show error messages immediately when they happen."
#line 1126 "Flags_loadFlags.c"
static const size_t _OMC_LIT401_strlen = 49;
#line 1127 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT401,49,_OMC_LIT401_data);
#line 1128 "Flags_loadFlags.c"
#define _OMC_LIT401 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT401)
#line 1129 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT402,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(9)),_OMC_LIT400,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT401}};
#line 1130 "Flags_loadFlags.c"
#define _OMC_LIT402 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT402)
#line 1131 "Flags_loadFlags.c"
#define _OMC_LIT403_data "showAnnotations"
#line 1132 "Flags_loadFlags.c"
static const size_t _OMC_LIT403_strlen = 15;
#line 1133 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT403,15,_OMC_LIT403_data);
#line 1134 "Flags_loadFlags.c"
#define _OMC_LIT403 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT403)
#line 1135 "Flags_loadFlags.c"
#define _OMC_LIT404_data "Show annotations in the flattened code."
#line 1136 "Flags_loadFlags.c"
static const size_t _OMC_LIT404_strlen = 39;
#line 1137 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT404,39,_OMC_LIT404_data);
#line 1138 "Flags_loadFlags.c"
#define _OMC_LIT404 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT404)
#line 1139 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT405,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(10)),_OMC_LIT403,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT404}};
#line 1140 "Flags_loadFlags.c"
#define _OMC_LIT405 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT405)
#line 1141 "Flags_loadFlags.c"
#define _OMC_LIT406_data "noSimplify"
#line 1142 "Flags_loadFlags.c"
static const size_t _OMC_LIT406_strlen = 10;
#line 1143 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT406,10,_OMC_LIT406_data);
#line 1144 "Flags_loadFlags.c"
#define _OMC_LIT406 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT406)
#line 1145 "Flags_loadFlags.c"
#define _OMC_LIT407_data "Do not simplify expressions if set."
#line 1146 "Flags_loadFlags.c"
static const size_t _OMC_LIT407_strlen = 35;
#line 1147 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT407,35,_OMC_LIT407_data);
#line 1148 "Flags_loadFlags.c"
#define _OMC_LIT407 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT407)
#line 1149 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT408,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(11)),_OMC_LIT406,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT407}};
#line 1150 "Flags_loadFlags.c"
#define _OMC_LIT408 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT408)
#line 1151 "Flags_loadFlags.c"
#define _OMC_LIT409_data "preOptModules"
#line 1152 "Flags_loadFlags.c"
static const size_t _OMC_LIT409_strlen = 13;
#line 1153 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT409,13,_OMC_LIT409_data);
#line 1154 "Flags_loadFlags.c"
#define _OMC_LIT409 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT409)
#line 1155 "Flags_loadFlags.c"
#define _OMC_LIT410_data "removeFinalParameters"
#line 1156 "Flags_loadFlags.c"
static const size_t _OMC_LIT410_strlen = 21;
#line 1157 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT410,21,_OMC_LIT410_data);
#line 1158 "Flags_loadFlags.c"
#define _OMC_LIT410 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT410)
#line 1159 "Flags_loadFlags.c"
#define _OMC_LIT411_data "removeEqualFunctionCalls"
#line 1160 "Flags_loadFlags.c"
static const size_t _OMC_LIT411_strlen = 24;
#line 1161 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT411,24,_OMC_LIT411_data);
#line 1162 "Flags_loadFlags.c"
#define _OMC_LIT411 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT411)
#line 1163 "Flags_loadFlags.c"
#define _OMC_LIT412_data "partitionIndependentBlocks"
#line 1164 "Flags_loadFlags.c"
static const size_t _OMC_LIT412_strlen = 26;
#line 1165 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT412,26,_OMC_LIT412_data);
#line 1166 "Flags_loadFlags.c"
#define _OMC_LIT412 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT412)
#line 1167 "Flags_loadFlags.c"
#define _OMC_LIT413_data "expandDerOperator"
#line 1168 "Flags_loadFlags.c"
static const size_t _OMC_LIT413_strlen = 17;
#line 1169 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT413,17,_OMC_LIT413_data);
#line 1170 "Flags_loadFlags.c"
#define _OMC_LIT413 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT413)
#line 1171 "Flags_loadFlags.c"
#define _OMC_LIT414_data "removeSimpleEquations"
#line 1172 "Flags_loadFlags.c"
static const size_t _OMC_LIT414_strlen = 21;
#line 1173 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT414,21,_OMC_LIT414_data);
#line 1174 "Flags_loadFlags.c"
#define _OMC_LIT414 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT414)
#line 1175 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT415,2,1) {_OMC_LIT414,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1176 "Flags_loadFlags.c"
#define _OMC_LIT415 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT415)
#line 1177 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT416,2,1) {_OMC_LIT413,_OMC_LIT415}};
#line 1178 "Flags_loadFlags.c"
#define _OMC_LIT416 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT416)
#line 1179 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT417,2,1) {_OMC_LIT412,_OMC_LIT416}};
#line 1180 "Flags_loadFlags.c"
#define _OMC_LIT417 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT417)
#line 1181 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT418,2,1) {_OMC_LIT411,_OMC_LIT417}};
#line 1182 "Flags_loadFlags.c"
#define _OMC_LIT418 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT418)
#line 1183 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT419,2,1) {_OMC_LIT410,_OMC_LIT418}};
#line 1184 "Flags_loadFlags.c"
#define _OMC_LIT419 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT419)
#line 1185 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT420,2,8) {&Flags_FlagData_STRING__LIST__FLAG__desc,_OMC_LIT419}};
#line 1186 "Flags_loadFlags.c"
#define _OMC_LIT420 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT420)
#line 1187 "Flags_loadFlags.c"
#define _OMC_LIT421_data "Performs alias eliminiation and removes constant variables from the DAE, replacing all occurances of the old variable reference with the new value (constants) or variable reference (alias elimination)."
#line 1188 "Flags_loadFlags.c"
static const size_t _OMC_LIT421_strlen = 201;
#line 1189 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT421,201,_OMC_LIT421_data);
#line 1190 "Flags_loadFlags.c"
#define _OMC_LIT421 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT421)
#line 1191 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT422,2,0) {_OMC_LIT414,_OMC_LIT421}};
#line 1192 "Flags_loadFlags.c"
#define _OMC_LIT422 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT422)
#line 1193 "Flags_loadFlags.c"
#define _OMC_LIT423_data "inlineArrayEqn"
#line 1194 "Flags_loadFlags.c"
static const size_t _OMC_LIT423_strlen = 14;
#line 1195 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT423,14,_OMC_LIT423_data);
#line 1196 "Flags_loadFlags.c"
#define _OMC_LIT423 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT423)
#line 1197 "Flags_loadFlags.c"
#define _OMC_LIT424_data "DESCRIBE ME"
#line 1198 "Flags_loadFlags.c"
static const size_t _OMC_LIT424_strlen = 11;
#line 1199 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT424,11,_OMC_LIT424_data);
#line 1200 "Flags_loadFlags.c"
#define _OMC_LIT424 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT424)
#line 1201 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT425,2,0) {_OMC_LIT423,_OMC_LIT424}};
#line 1202 "Flags_loadFlags.c"
#define _OMC_LIT425 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT425)
#line 1203 "Flags_loadFlags.c"
#define _OMC_LIT426_data "Structural paramters and parameters declared as final are removed and replaced with their value. They may no longer be changed in the init file."
#line 1204 "Flags_loadFlags.c"
static const size_t _OMC_LIT426_strlen = 144;
#line 1205 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT426,144,_OMC_LIT426_data);
#line 1206 "Flags_loadFlags.c"
#define _OMC_LIT426 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT426)
#line 1207 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT427,2,0) {_OMC_LIT410,_OMC_LIT426}};
#line 1208 "Flags_loadFlags.c"
#define _OMC_LIT427 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT427)
#line 1209 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT428,2,0) {_OMC_LIT411,_OMC_LIT424}};
#line 1210 "Flags_loadFlags.c"
#define _OMC_LIT428 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT428)
#line 1211 "Flags_loadFlags.c"
#define _OMC_LIT429_data "removeProtectedParameters"
#line 1212 "Flags_loadFlags.c"
static const size_t _OMC_LIT429_strlen = 25;
#line 1213 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT429,25,_OMC_LIT429_data);
#line 1214 "Flags_loadFlags.c"
#define _OMC_LIT429 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT429)
#line 1215 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT430,2,0) {_OMC_LIT429,_OMC_LIT424}};
#line 1216 "Flags_loadFlags.c"
#define _OMC_LIT430 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT430)
#line 1217 "Flags_loadFlags.c"
#define _OMC_LIT431_data "removeUnusedParameter"
#line 1218 "Flags_loadFlags.c"
static const size_t _OMC_LIT431_strlen = 21;
#line 1219 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT431,21,_OMC_LIT431_data);
#line 1220 "Flags_loadFlags.c"
#define _OMC_LIT431 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT431)
#line 1221 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT432,2,0) {_OMC_LIT431,_OMC_LIT424}};
#line 1222 "Flags_loadFlags.c"
#define _OMC_LIT432 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT432)
#line 1223 "Flags_loadFlags.c"
#define _OMC_LIT433_data "removeUnusedVariables"
#line 1224 "Flags_loadFlags.c"
static const size_t _OMC_LIT433_strlen = 21;
#line 1225 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT433,21,_OMC_LIT433_data);
#line 1226 "Flags_loadFlags.c"
#define _OMC_LIT433 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT433)
#line 1227 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT434,2,0) {_OMC_LIT433,_OMC_LIT424}};
#line 1228 "Flags_loadFlags.c"
#define _OMC_LIT434 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT434)
#line 1229 "Flags_loadFlags.c"
#define _OMC_LIT435_data "Partitions the equation system into independent equation systems (which can then be simulated in parallel or used to speed up subsequent optimizations)"
#line 1230 "Flags_loadFlags.c"
static const size_t _OMC_LIT435_strlen = 151;
#line 1231 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT435,151,_OMC_LIT435_data);
#line 1232 "Flags_loadFlags.c"
#define _OMC_LIT435 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT435)
#line 1233 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT436,2,0) {_OMC_LIT412,_OMC_LIT435}};
#line 1234 "Flags_loadFlags.c"
#define _OMC_LIT436 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT436)
#line 1235 "Flags_loadFlags.c"
#define _OMC_LIT437_data "collapseIndependentBlocks"
#line 1236 "Flags_loadFlags.c"
static const size_t _OMC_LIT437_strlen = 25;
#line 1237 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT437,25,_OMC_LIT437_data);
#line 1238 "Flags_loadFlags.c"
#define _OMC_LIT437 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT437)
#line 1239 "Flags_loadFlags.c"
#define _OMC_LIT438_data "Collapses all equation systems back into one big system again (undo partitionIndependentBlocks)"
#line 1240 "Flags_loadFlags.c"
static const size_t _OMC_LIT438_strlen = 95;
#line 1241 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT438,95,_OMC_LIT438_data);
#line 1242 "Flags_loadFlags.c"
#define _OMC_LIT438 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT438)
#line 1243 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT439,2,0) {_OMC_LIT437,_OMC_LIT438}};
#line 1244 "Flags_loadFlags.c"
#define _OMC_LIT439 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT439)
#line 1245 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT440,2,0) {_OMC_LIT413,_OMC_LIT424}};
#line 1246 "Flags_loadFlags.c"
#define _OMC_LIT440 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT440)
#line 1247 "Flags_loadFlags.c"
#define _OMC_LIT441_data "residualForm"
#line 1248 "Flags_loadFlags.c"
static const size_t _OMC_LIT441_strlen = 12;
#line 1249 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT441,12,_OMC_LIT441_data);
#line 1250 "Flags_loadFlags.c"
#define _OMC_LIT441 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT441)
#line 1251 "Flags_loadFlags.c"
#define _OMC_LIT442_data "Transforms simple equations x=y to zero-sum equations 0=y-x"
#line 1252 "Flags_loadFlags.c"
static const size_t _OMC_LIT442_strlen = 59;
#line 1253 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT442,59,_OMC_LIT442_data);
#line 1254 "Flags_loadFlags.c"
#define _OMC_LIT442 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT442)
#line 1255 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT443,2,0) {_OMC_LIT441,_OMC_LIT442}};
#line 1256 "Flags_loadFlags.c"
#define _OMC_LIT443 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT443)
#line 1257 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT444,2,1) {_OMC_LIT443,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1258 "Flags_loadFlags.c"
#define _OMC_LIT444 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT444)
#line 1259 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT445,2,1) {_OMC_LIT440,_OMC_LIT444}};
#line 1260 "Flags_loadFlags.c"
#define _OMC_LIT445 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT445)
#line 1261 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT446,2,1) {_OMC_LIT439,_OMC_LIT445}};
#line 1262 "Flags_loadFlags.c"
#define _OMC_LIT446 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT446)
#line 1263 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT447,2,1) {_OMC_LIT436,_OMC_LIT446}};
#line 1264 "Flags_loadFlags.c"
#define _OMC_LIT447 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT447)
#line 1265 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT448,2,1) {_OMC_LIT434,_OMC_LIT447}};
#line 1266 "Flags_loadFlags.c"
#define _OMC_LIT448 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT448)
#line 1267 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT449,2,1) {_OMC_LIT432,_OMC_LIT448}};
#line 1268 "Flags_loadFlags.c"
#define _OMC_LIT449 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT449)
#line 1269 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT450,2,1) {_OMC_LIT430,_OMC_LIT449}};
#line 1270 "Flags_loadFlags.c"
#define _OMC_LIT450 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT450)
#line 1271 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT451,2,1) {_OMC_LIT428,_OMC_LIT450}};
#line 1272 "Flags_loadFlags.c"
#define _OMC_LIT451 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT451)
#line 1273 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT452,2,1) {_OMC_LIT427,_OMC_LIT451}};
#line 1274 "Flags_loadFlags.c"
#define _OMC_LIT452 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT452)
#line 1275 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT453,2,1) {_OMC_LIT425,_OMC_LIT452}};
#line 1276 "Flags_loadFlags.c"
#define _OMC_LIT453 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT453)
#line 1277 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT454,2,1) {_OMC_LIT422,_OMC_LIT453}};
#line 1278 "Flags_loadFlags.c"
#define _OMC_LIT454 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT454)
#line 1279 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT455,2,4) {&Flags_ValidOptions_STRING__DESC__OPTION__desc,_OMC_LIT454}};
#line 1280 "Flags_loadFlags.c"
#define _OMC_LIT455 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT455)
#line 1281 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT456,1,1) {_OMC_LIT455}};
#line 1282 "Flags_loadFlags.c"
#define _OMC_LIT456 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT456)
#line 1283 "Flags_loadFlags.c"
#define _OMC_LIT457_data "Sets the pre optimisation modules to use in the back end. See +help=optmodules for more info."
#line 1284 "Flags_loadFlags.c"
static const size_t _OMC_LIT457_strlen = 93;
#line 1285 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT457,93,_OMC_LIT457_data);
#line 1286 "Flags_loadFlags.c"
#define _OMC_LIT457 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT457)
#line 1287 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT458,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(12)),_OMC_LIT409,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT420,_OMC_LIT456,_OMC_LIT457}};
#line 1288 "Flags_loadFlags.c"
#define _OMC_LIT458 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT458)
#line 1289 "Flags_loadFlags.c"
#define _OMC_LIT459_data "indexReductionMethod"
#line 1290 "Flags_loadFlags.c"
static const size_t _OMC_LIT459_strlen = 20;
#line 1291 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT459,20,_OMC_LIT459_data);
#line 1292 "Flags_loadFlags.c"
#define _OMC_LIT459 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT459)
#line 1293 "Flags_loadFlags.c"
#define _OMC_LIT460_data "dummyDerivative"
#line 1294 "Flags_loadFlags.c"
static const size_t _OMC_LIT460_strlen = 15;
#line 1295 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT460,15,_OMC_LIT460_data);
#line 1296 "Flags_loadFlags.c"
#define _OMC_LIT460 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT460)
#line 1297 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT461,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT460}};
#line 1298 "Flags_loadFlags.c"
#define _OMC_LIT461 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT461)
#line 1299 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT462,2,0) {_OMC_LIT460,_OMC_LIT424}};
#line 1300 "Flags_loadFlags.c"
#define _OMC_LIT462 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT462)
#line 1301 "Flags_loadFlags.c"
#define _OMC_LIT463_data "DynamicStateSelection"
#line 1302 "Flags_loadFlags.c"
static const size_t _OMC_LIT463_strlen = 21;
#line 1303 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT463,21,_OMC_LIT463_data);
#line 1304 "Flags_loadFlags.c"
#define _OMC_LIT463 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT463)
#line 1305 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT464,2,0) {_OMC_LIT463,_OMC_LIT424}};
#line 1306 "Flags_loadFlags.c"
#define _OMC_LIT464 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT464)
#line 1307 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT465,2,1) {_OMC_LIT464,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1308 "Flags_loadFlags.c"
#define _OMC_LIT465 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT465)
#line 1309 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT466,2,1) {_OMC_LIT462,_OMC_LIT465}};
#line 1310 "Flags_loadFlags.c"
#define _OMC_LIT466 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT466)
#line 1311 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT467,2,4) {&Flags_ValidOptions_STRING__DESC__OPTION__desc,_OMC_LIT466}};
#line 1312 "Flags_loadFlags.c"
#define _OMC_LIT467 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT467)
#line 1313 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT468,1,1) {_OMC_LIT467}};
#line 1314 "Flags_loadFlags.c"
#define _OMC_LIT468 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT468)
#line 1315 "Flags_loadFlags.c"
#define _OMC_LIT469_data "Sets the index reduction method to use."
#line 1316 "Flags_loadFlags.c"
static const size_t _OMC_LIT469_strlen = 39;
#line 1317 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT469,39,_OMC_LIT469_data);
#line 1318 "Flags_loadFlags.c"
#define _OMC_LIT469 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT469)
#line 1319 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT470,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(13)),_OMC_LIT459,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT461,_OMC_LIT468,_OMC_LIT469}};
#line 1320 "Flags_loadFlags.c"
#define _OMC_LIT470 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT470)
#line 1321 "Flags_loadFlags.c"
#define _OMC_LIT471_data "postOptModules"
#line 1322 "Flags_loadFlags.c"
static const size_t _OMC_LIT471_strlen = 14;
#line 1323 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT471,14,_OMC_LIT471_data);
#line 1324 "Flags_loadFlags.c"
#define _OMC_LIT471 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT471)
#line 1325 "Flags_loadFlags.c"
#define _OMC_LIT472_data "lateInline"
#line 1326 "Flags_loadFlags.c"
static const size_t _OMC_LIT472_strlen = 10;
#line 1327 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT472,10,_OMC_LIT472_data);
#line 1328 "Flags_loadFlags.c"
#define _OMC_LIT472 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT472)
#line 1329 "Flags_loadFlags.c"
#define _OMC_LIT473_data "constantLinearSystem"
#line 1330 "Flags_loadFlags.c"
static const size_t _OMC_LIT473_strlen = 20;
#line 1331 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT473,20,_OMC_LIT473_data);
#line 1332 "Flags_loadFlags.c"
#define _OMC_LIT473 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT473)
#line 1333 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT474,2,1) {_OMC_LIT473,_OMC_LIT415}};
#line 1334 "Flags_loadFlags.c"
#define _OMC_LIT474 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT474)
#line 1335 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT475,2,1) {_OMC_LIT423,_OMC_LIT474}};
#line 1336 "Flags_loadFlags.c"
#define _OMC_LIT475 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT475)
#line 1337 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT476,2,1) {_OMC_LIT472,_OMC_LIT475}};
#line 1338 "Flags_loadFlags.c"
#define _OMC_LIT476 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT476)
#line 1339 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT477,2,8) {&Flags_FlagData_STRING__LIST__FLAG__desc,_OMC_LIT476}};
#line 1340 "Flags_loadFlags.c"
#define _OMC_LIT477 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT477)
#line 1341 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT478,2,0) {_OMC_LIT472,_OMC_LIT424}};
#line 1342 "Flags_loadFlags.c"
#define _OMC_LIT478 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT478)
#line 1343 "Flags_loadFlags.c"
#define _OMC_LIT479_data "Evaluates constant linear systems (a*x+b*y=c; d*x+e*y=f; a,b,c,d,e,f are constants) at compile-time"
#line 1344 "Flags_loadFlags.c"
static const size_t _OMC_LIT479_strlen = 99;
#line 1345 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT479,99,_OMC_LIT479_data);
#line 1346 "Flags_loadFlags.c"
#define _OMC_LIT479 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT479)
#line 1347 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT480,2,0) {_OMC_LIT473,_OMC_LIT479}};
#line 1348 "Flags_loadFlags.c"
#define _OMC_LIT480 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT480)
#line 1349 "Flags_loadFlags.c"
#define _OMC_LIT481_data "dumpComponentsGraphStr"
#line 1350 "Flags_loadFlags.c"
static const size_t _OMC_LIT481_strlen = 22;
#line 1351 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT481,22,_OMC_LIT481_data);
#line 1352 "Flags_loadFlags.c"
#define _OMC_LIT481 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT481)
#line 1353 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT482,2,0) {_OMC_LIT481,_OMC_LIT424}};
#line 1354 "Flags_loadFlags.c"
#define _OMC_LIT482 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT482)
#line 1355 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT483,2,1) {_OMC_LIT482,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1356 "Flags_loadFlags.c"
#define _OMC_LIT483 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT483)
#line 1357 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT484,2,1) {_OMC_LIT480,_OMC_LIT483}};
#line 1358 "Flags_loadFlags.c"
#define _OMC_LIT484 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT484)
#line 1359 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT485,2,1) {_OMC_LIT432,_OMC_LIT484}};
#line 1360 "Flags_loadFlags.c"
#define _OMC_LIT485 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT485)
#line 1361 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT486,2,1) {_OMC_LIT425,_OMC_LIT485}};
#line 1362 "Flags_loadFlags.c"
#define _OMC_LIT486 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT486)
#line 1363 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT487,2,1) {_OMC_LIT428,_OMC_LIT486}};
#line 1364 "Flags_loadFlags.c"
#define _OMC_LIT487 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT487)
#line 1365 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT488,2,1) {_OMC_LIT422,_OMC_LIT487}};
#line 1366 "Flags_loadFlags.c"
#define _OMC_LIT488 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT488)
#line 1367 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT489,2,1) {_OMC_LIT478,_OMC_LIT488}};
#line 1368 "Flags_loadFlags.c"
#define _OMC_LIT489 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT489)
#line 1369 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT490,2,4) {&Flags_ValidOptions_STRING__DESC__OPTION__desc,_OMC_LIT489}};
#line 1370 "Flags_loadFlags.c"
#define _OMC_LIT490 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT490)
#line 1371 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT491,1,1) {_OMC_LIT490}};
#line 1372 "Flags_loadFlags.c"
#define _OMC_LIT491 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT491)
#line 1373 "Flags_loadFlags.c"
#define _OMC_LIT492_data "Sets the post optimisation modules to use in the back end. See +help=optmodules for more info."
#line 1374 "Flags_loadFlags.c"
static const size_t _OMC_LIT492_strlen = 94;
#line 1375 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT492,94,_OMC_LIT492_data);
#line 1376 "Flags_loadFlags.c"
#define _OMC_LIT492 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT492)
#line 1377 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT493,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(14)),_OMC_LIT471,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT477,_OMC_LIT491,_OMC_LIT492}};
#line 1378 "Flags_loadFlags.c"
#define _OMC_LIT493 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT493)
#line 1379 "Flags_loadFlags.c"
#define _OMC_LIT494_data "simCodeTarget"
#line 1380 "Flags_loadFlags.c"
static const size_t _OMC_LIT494_strlen = 13;
#line 1381 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT494,13,_OMC_LIT494_data);
#line 1382 "Flags_loadFlags.c"
#define _OMC_LIT494 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT494)
#line 1383 "Flags_loadFlags.c"
#define _OMC_LIT495_data "C"
#line 1384 "Flags_loadFlags.c"
static const size_t _OMC_LIT495_strlen = 1;
#line 1385 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT495,1,_OMC_LIT495_data);
#line 1386 "Flags_loadFlags.c"
#define _OMC_LIT495 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT495)
#line 1387 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT496,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT495}};
#line 1388 "Flags_loadFlags.c"
#define _OMC_LIT496 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT496)
#line 1389 "Flags_loadFlags.c"
#define _OMC_LIT497_data "CSharp"
#line 1390 "Flags_loadFlags.c"
static const size_t _OMC_LIT497_strlen = 6;
#line 1391 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT497,6,_OMC_LIT497_data);
#line 1392 "Flags_loadFlags.c"
#define _OMC_LIT497 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT497)
#line 1393 "Flags_loadFlags.c"
#define _OMC_LIT498_data "Cpp"
#line 1394 "Flags_loadFlags.c"
static const size_t _OMC_LIT498_strlen = 3;
#line 1395 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT498,3,_OMC_LIT498_data);
#line 1396 "Flags_loadFlags.c"
#define _OMC_LIT498 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT498)
#line 1397 "Flags_loadFlags.c"
#define _OMC_LIT499_data "Adevs"
#line 1398 "Flags_loadFlags.c"
static const size_t _OMC_LIT499_strlen = 5;
#line 1399 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT499,5,_OMC_LIT499_data);
#line 1400 "Flags_loadFlags.c"
#define _OMC_LIT499 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT499)
#line 1401 "Flags_loadFlags.c"
#define _OMC_LIT500_data "QSS"
#line 1402 "Flags_loadFlags.c"
static const size_t _OMC_LIT500_strlen = 3;
#line 1403 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT500,3,_OMC_LIT500_data);
#line 1404 "Flags_loadFlags.c"
#define _OMC_LIT500 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT500)
#line 1405 "Flags_loadFlags.c"
#define _OMC_LIT501_data "c"
#line 1406 "Flags_loadFlags.c"
static const size_t _OMC_LIT501_strlen = 1;
#line 1407 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT501,1,_OMC_LIT501_data);
#line 1408 "Flags_loadFlags.c"
#define _OMC_LIT501 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT501)
#line 1409 "Flags_loadFlags.c"
#define _OMC_LIT502_data "Dump"
#line 1410 "Flags_loadFlags.c"
static const size_t _OMC_LIT502_strlen = 4;
#line 1411 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT502,4,_OMC_LIT502_data);
#line 1412 "Flags_loadFlags.c"
#define _OMC_LIT502 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT502)
#line 1413 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT503,2,1) {_OMC_LIT502,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1414 "Flags_loadFlags.c"
#define _OMC_LIT503 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT503)
#line 1415 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT504,2,1) {_OMC_LIT501,_OMC_LIT503}};
#line 1416 "Flags_loadFlags.c"
#define _OMC_LIT504 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT504)
#line 1417 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT505,2,1) {_OMC_LIT495,_OMC_LIT504}};
#line 1418 "Flags_loadFlags.c"
#define _OMC_LIT505 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT505)
#line 1419 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT506,2,1) {_OMC_LIT500,_OMC_LIT505}};
#line 1420 "Flags_loadFlags.c"
#define _OMC_LIT506 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT506)
#line 1421 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT507,2,1) {_OMC_LIT499,_OMC_LIT506}};
#line 1422 "Flags_loadFlags.c"
#define _OMC_LIT507 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT507)
#line 1423 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT508,2,1) {_OMC_LIT498,_OMC_LIT507}};
#line 1424 "Flags_loadFlags.c"
#define _OMC_LIT508 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT508)
#line 1425 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT509,2,1) {_OMC_LIT497,_OMC_LIT508}};
#line 1426 "Flags_loadFlags.c"
#define _OMC_LIT509 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT509)
#line 1427 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT510,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT509}};
#line 1428 "Flags_loadFlags.c"
#define _OMC_LIT510 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT510)
#line 1429 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT511,1,1) {_OMC_LIT510}};
#line 1430 "Flags_loadFlags.c"
#define _OMC_LIT511 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT511)
#line 1431 "Flags_loadFlags.c"
#define _OMC_LIT512_data "Sets the target language for the code generation"
#line 1432 "Flags_loadFlags.c"
static const size_t _OMC_LIT512_strlen = 48;
#line 1433 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT512,48,_OMC_LIT512_data);
#line 1434 "Flags_loadFlags.c"
#define _OMC_LIT512 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT512)
#line 1435 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT513,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(15)),_OMC_LIT494,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT496,_OMC_LIT511,_OMC_LIT512}};
#line 1436 "Flags_loadFlags.c"
#define _OMC_LIT513 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT513)
#line 1437 "Flags_loadFlags.c"
#define _OMC_LIT514_data "orderConnections"
#line 1438 "Flags_loadFlags.c"
static const size_t _OMC_LIT514_strlen = 16;
#line 1439 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT514,16,_OMC_LIT514_data);
#line 1440 "Flags_loadFlags.c"
#define _OMC_LIT514 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT514)
#line 1441 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT515,2,4) {&Flags_FlagData_BOOL__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(1))}};
#line 1442 "Flags_loadFlags.c"
#define _OMC_LIT515 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT515)
#line 1443 "Flags_loadFlags.c"
#define _OMC_LIT516_data "Orders connect equations alphabetically if set."
#line 1444 "Flags_loadFlags.c"
static const size_t _OMC_LIT516_strlen = 47;
#line 1445 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT516,47,_OMC_LIT516_data);
#line 1446 "Flags_loadFlags.c"
#define _OMC_LIT516 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT516)
#line 1447 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT517,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(16)),_OMC_LIT514,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT515,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT516}};
#line 1448 "Flags_loadFlags.c"
#define _OMC_LIT517 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT517)
#line 1449 "Flags_loadFlags.c"
#define _OMC_LIT518_data "typeinfo"
#line 1450 "Flags_loadFlags.c"
static const size_t _OMC_LIT518_strlen = 8;
#line 1451 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT518,8,_OMC_LIT518_data);
#line 1452 "Flags_loadFlags.c"
#define _OMC_LIT518 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT518)
#line 1453 "Flags_loadFlags.c"
#define _OMC_LIT519_data "t"
#line 1454 "Flags_loadFlags.c"
static const size_t _OMC_LIT519_strlen = 1;
#line 1455 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT519,1,_OMC_LIT519_data);
#line 1456 "Flags_loadFlags.c"
#define _OMC_LIT519 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT519)
#line 1457 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT520,1,1) {_OMC_LIT519}};
#line 1458 "Flags_loadFlags.c"
#define _OMC_LIT520 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT520)
#line 1459 "Flags_loadFlags.c"
#define _OMC_LIT521_data "Prints out extra type information if set."
#line 1460 "Flags_loadFlags.c"
static const size_t _OMC_LIT521_strlen = 41;
#line 1461 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT521,41,_OMC_LIT521_data);
#line 1462 "Flags_loadFlags.c"
#define _OMC_LIT521 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT521)
#line 1463 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT522,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(17)),_OMC_LIT518,_OMC_LIT520,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT521}};
#line 1464 "Flags_loadFlags.c"
#define _OMC_LIT522 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT522)
#line 1465 "Flags_loadFlags.c"
#define _OMC_LIT523_data "keepArrays"
#line 1466 "Flags_loadFlags.c"
static const size_t _OMC_LIT523_strlen = 10;
#line 1467 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT523,10,_OMC_LIT523_data);
#line 1468 "Flags_loadFlags.c"
#define _OMC_LIT523 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT523)
#line 1469 "Flags_loadFlags.c"
#define _OMC_LIT524_data "a"
#line 1470 "Flags_loadFlags.c"
static const size_t _OMC_LIT524_strlen = 1;
#line 1471 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT524,1,_OMC_LIT524_data);
#line 1472 "Flags_loadFlags.c"
#define _OMC_LIT524 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT524)
#line 1473 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT525,1,1) {_OMC_LIT524}};
#line 1474 "Flags_loadFlags.c"
#define _OMC_LIT525 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT525)
#line 1475 "Flags_loadFlags.c"
#define _OMC_LIT526_data "Sets whether to split arrays or not."
#line 1476 "Flags_loadFlags.c"
static const size_t _OMC_LIT526_strlen = 36;
#line 1477 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT526,36,_OMC_LIT526_data);
#line 1478 "Flags_loadFlags.c"
#define _OMC_LIT526 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT526)
#line 1479 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT527,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(18)),_OMC_LIT523,_OMC_LIT525,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT526}};
#line 1480 "Flags_loadFlags.c"
#define _OMC_LIT527 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT527)
#line 1481 "Flags_loadFlags.c"
#define _OMC_LIT528_data "modelicaOutput"
#line 1482 "Flags_loadFlags.c"
static const size_t _OMC_LIT528_strlen = 14;
#line 1483 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT528,14,_OMC_LIT528_data);
#line 1484 "Flags_loadFlags.c"
#define _OMC_LIT528 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT528)
#line 1485 "Flags_loadFlags.c"
#define _OMC_LIT529_data "m"
#line 1486 "Flags_loadFlags.c"
static const size_t _OMC_LIT529_strlen = 1;
#line 1487 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT529,1,_OMC_LIT529_data);
#line 1488 "Flags_loadFlags.c"
#define _OMC_LIT529 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT529)
#line 1489 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT530,1,1) {_OMC_LIT529}};
#line 1490 "Flags_loadFlags.c"
#define _OMC_LIT530 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT530)
#line 1491 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT531,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(19)),_OMC_LIT528,_OMC_LIT530,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1492 "Flags_loadFlags.c"
#define _OMC_LIT531 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT531)
#line 1493 "Flags_loadFlags.c"
#define _OMC_LIT532_data "paramsStruct"
#line 1494 "Flags_loadFlags.c"
static const size_t _OMC_LIT532_strlen = 12;
#line 1495 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT532,12,_OMC_LIT532_data);
#line 1496 "Flags_loadFlags.c"
#define _OMC_LIT532 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT532)
#line 1497 "Flags_loadFlags.c"
#define _OMC_LIT533_data "p"
#line 1498 "Flags_loadFlags.c"
static const size_t _OMC_LIT533_strlen = 1;
#line 1499 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT533,1,_OMC_LIT533_data);
#line 1500 "Flags_loadFlags.c"
#define _OMC_LIT533 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT533)
#line 1501 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT534,1,1) {_OMC_LIT533}};
#line 1502 "Flags_loadFlags.c"
#define _OMC_LIT534 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT534)
#line 1503 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT535,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(20)),_OMC_LIT532,_OMC_LIT534,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1504 "Flags_loadFlags.c"
#define _OMC_LIT535 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT535)
#line 1505 "Flags_loadFlags.c"
#define _OMC_LIT536_data "silent"
#line 1506 "Flags_loadFlags.c"
static const size_t _OMC_LIT536_strlen = 6;
#line 1507 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT536,6,_OMC_LIT536_data);
#line 1508 "Flags_loadFlags.c"
#define _OMC_LIT536 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT536)
#line 1509 "Flags_loadFlags.c"
#define _OMC_LIT537_data "q"
#line 1510 "Flags_loadFlags.c"
static const size_t _OMC_LIT537_strlen = 1;
#line 1511 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT537,1,_OMC_LIT537_data);
#line 1512 "Flags_loadFlags.c"
#define _OMC_LIT537 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT537)
#line 1513 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT538,1,1) {_OMC_LIT537}};
#line 1514 "Flags_loadFlags.c"
#define _OMC_LIT538 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT538)
#line 1515 "Flags_loadFlags.c"
#define _OMC_LIT539_data "Turns on silent mode."
#line 1516 "Flags_loadFlags.c"
static const size_t _OMC_LIT539_strlen = 21;
#line 1517 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT539,21,_OMC_LIT539_data);
#line 1518 "Flags_loadFlags.c"
#define _OMC_LIT539 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT539)
#line 1519 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT540,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(21)),_OMC_LIT536,_OMC_LIT538,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT539}};
#line 1520 "Flags_loadFlags.c"
#define _OMC_LIT540 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT540)
#line 1521 "Flags_loadFlags.c"
#define _OMC_LIT541_data "corbaSessionName"
#line 1522 "Flags_loadFlags.c"
static const size_t _OMC_LIT541_strlen = 16;
#line 1523 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT541,16,_OMC_LIT541_data);
#line 1524 "Flags_loadFlags.c"
#define _OMC_LIT541 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT541)
#line 1525 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT542,1,1) {_OMC_LIT501}};
#line 1526 "Flags_loadFlags.c"
#define _OMC_LIT542 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT542)
#line 1527 "Flags_loadFlags.c"
#define _OMC_LIT543_data "Sets the name of the corba session if +d=interactiveCorba is used."
#line 1528 "Flags_loadFlags.c"
static const size_t _OMC_LIT543_strlen = 66;
#line 1529 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT543,66,_OMC_LIT543_data);
#line 1530 "Flags_loadFlags.c"
#define _OMC_LIT543 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT543)
#line 1531 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT544,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(22)),_OMC_LIT541,_OMC_LIT542,_OMC_LIT311,_OMC_LIT312,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT543}};
#line 1532 "Flags_loadFlags.c"
#define _OMC_LIT544 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT544)
#line 1533 "Flags_loadFlags.c"
#define _OMC_LIT545_data "numProcs"
#line 1534 "Flags_loadFlags.c"
static const size_t _OMC_LIT545_strlen = 8;
#line 1535 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT545,8,_OMC_LIT545_data);
#line 1536 "Flags_loadFlags.c"
#define _OMC_LIT545 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT545)
#line 1537 "Flags_loadFlags.c"
#define _OMC_LIT546_data "n"
#line 1538 "Flags_loadFlags.c"
static const size_t _OMC_LIT546_strlen = 1;
#line 1539 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT546,1,_OMC_LIT546_data);
#line 1540 "Flags_loadFlags.c"
#define _OMC_LIT546 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT546)
#line 1541 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT547,1,1) {_OMC_LIT546}};
#line 1542 "Flags_loadFlags.c"
#define _OMC_LIT547 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT547)
#line 1543 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT548,2,5) {&Flags_FlagData_INT__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(0))}};
#line 1544 "Flags_loadFlags.c"
#define _OMC_LIT548 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT548)
#line 1545 "Flags_loadFlags.c"
#define _OMC_LIT549_data "Sets the number of processors to use."
#line 1546 "Flags_loadFlags.c"
static const size_t _OMC_LIT549_strlen = 37;
#line 1547 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT549,37,_OMC_LIT549_data);
#line 1548 "Flags_loadFlags.c"
#define _OMC_LIT549 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT549)
#line 1549 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT550,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(23)),_OMC_LIT545,_OMC_LIT547,_OMC_LIT311,_OMC_LIT548,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT549}};
#line 1550 "Flags_loadFlags.c"
#define _OMC_LIT550 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT550)
#line 1551 "Flags_loadFlags.c"
#define _OMC_LIT551_data "latency"
#line 1552 "Flags_loadFlags.c"
static const size_t _OMC_LIT551_strlen = 7;
#line 1553 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT551,7,_OMC_LIT551_data);
#line 1554 "Flags_loadFlags.c"
#define _OMC_LIT551 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT551)
#line 1555 "Flags_loadFlags.c"
#define _OMC_LIT552_data "l"
#line 1556 "Flags_loadFlags.c"
static const size_t _OMC_LIT552_strlen = 1;
#line 1557 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT552,1,_OMC_LIT552_data);
#line 1558 "Flags_loadFlags.c"
#define _OMC_LIT552 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT552)
#line 1559 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT553,1,1) {_OMC_LIT552}};
#line 1560 "Flags_loadFlags.c"
#define _OMC_LIT553 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT553)
#line 1561 "Flags_loadFlags.c"
#define _OMC_LIT554_data "Sets the latency for parallel execution."
#line 1562 "Flags_loadFlags.c"
static const size_t _OMC_LIT554_strlen = 40;
#line 1563 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT554,40,_OMC_LIT554_data);
#line 1564 "Flags_loadFlags.c"
#define _OMC_LIT554 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT554)
#line 1565 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT555,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(24)),_OMC_LIT551,_OMC_LIT553,_OMC_LIT311,_OMC_LIT548,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT554}};
#line 1566 "Flags_loadFlags.c"
#define _OMC_LIT555 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT555)
#line 1567 "Flags_loadFlags.c"
#define _OMC_LIT556_data "bandwidth"
#line 1568 "Flags_loadFlags.c"
static const size_t _OMC_LIT556_strlen = 9;
#line 1569 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT556,9,_OMC_LIT556_data);
#line 1570 "Flags_loadFlags.c"
#define _OMC_LIT556 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT556)
#line 1571 "Flags_loadFlags.c"
#define _OMC_LIT557_data "b"
#line 1572 "Flags_loadFlags.c"
static const size_t _OMC_LIT557_strlen = 1;
#line 1573 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT557,1,_OMC_LIT557_data);
#line 1574 "Flags_loadFlags.c"
#define _OMC_LIT557 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT557)
#line 1575 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT558,1,1) {_OMC_LIT557}};
#line 1576 "Flags_loadFlags.c"
#define _OMC_LIT558 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT558)
#line 1577 "Flags_loadFlags.c"
#define _OMC_LIT559_data "Sets the bandwidth for parallel execution."
#line 1578 "Flags_loadFlags.c"
static const size_t _OMC_LIT559_strlen = 42;
#line 1579 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT559,42,_OMC_LIT559_data);
#line 1580 "Flags_loadFlags.c"
#define _OMC_LIT559 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT559)
#line 1581 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT560,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(25)),_OMC_LIT556,_OMC_LIT558,_OMC_LIT311,_OMC_LIT548,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT559}};
#line 1582 "Flags_loadFlags.c"
#define _OMC_LIT560 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT560)
#line 1583 "Flags_loadFlags.c"
#define _OMC_LIT561_data "instClass"
#line 1584 "Flags_loadFlags.c"
static const size_t _OMC_LIT561_strlen = 9;
#line 1585 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT561,9,_OMC_LIT561_data);
#line 1586 "Flags_loadFlags.c"
#define _OMC_LIT561 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT561)
#line 1587 "Flags_loadFlags.c"
#define _OMC_LIT562_data "i"
#line 1588 "Flags_loadFlags.c"
static const size_t _OMC_LIT562_strlen = 1;
#line 1589 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT562,1,_OMC_LIT562_data);
#line 1590 "Flags_loadFlags.c"
#define _OMC_LIT562 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT562)
#line 1591 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT563,1,1) {_OMC_LIT562}};
#line 1592 "Flags_loadFlags.c"
#define _OMC_LIT563 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT563)
#line 1593 "Flags_loadFlags.c"
#define _OMC_LIT564_data "Instantiate the class given by the fully qualified path."
#line 1594 "Flags_loadFlags.c"
static const size_t _OMC_LIT564_strlen = 56;
#line 1595 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT564,56,_OMC_LIT564_data);
#line 1596 "Flags_loadFlags.c"
#define _OMC_LIT564 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT564)
#line 1597 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT565,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(26)),_OMC_LIT561,_OMC_LIT563,_OMC_LIT311,_OMC_LIT312,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT564}};
#line 1598 "Flags_loadFlags.c"
#define _OMC_LIT565 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT565)
#line 1599 "Flags_loadFlags.c"
#define _OMC_LIT566_data "vectorizationLimit"
#line 1600 "Flags_loadFlags.c"
static const size_t _OMC_LIT566_strlen = 18;
#line 1601 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT566,18,_OMC_LIT566_data);
#line 1602 "Flags_loadFlags.c"
#define _OMC_LIT566 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT566)
#line 1603 "Flags_loadFlags.c"
#define _OMC_LIT567_data "v"
#line 1604 "Flags_loadFlags.c"
static const size_t _OMC_LIT567_strlen = 1;
#line 1605 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT567,1,_OMC_LIT567_data);
#line 1606 "Flags_loadFlags.c"
#define _OMC_LIT567 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT567)
#line 1607 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT568,1,1) {_OMC_LIT567}};
#line 1608 "Flags_loadFlags.c"
#define _OMC_LIT568 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT568)
#line 1609 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT569,2,5) {&Flags_FlagData_INT__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(20))}};
#line 1610 "Flags_loadFlags.c"
#define _OMC_LIT569 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT569)
#line 1611 "Flags_loadFlags.c"
#define _OMC_LIT570_data "Sets the vectorization limit, arrays and matrices larger than this will not be vectorized."
#line 1612 "Flags_loadFlags.c"
static const size_t _OMC_LIT570_strlen = 90;
#line 1613 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT570,90,_OMC_LIT570_data);
#line 1614 "Flags_loadFlags.c"
#define _OMC_LIT570 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT570)
#line 1615 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT571,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(27)),_OMC_LIT566,_OMC_LIT568,_OMC_LIT311,_OMC_LIT569,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT570}};
#line 1616 "Flags_loadFlags.c"
#define _OMC_LIT571 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT571)
#line 1617 "Flags_loadFlags.c"
#define _OMC_LIT572_data "simulationCg"
#line 1618 "Flags_loadFlags.c"
static const size_t _OMC_LIT572_strlen = 12;
#line 1619 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT572,12,_OMC_LIT572_data);
#line 1620 "Flags_loadFlags.c"
#define _OMC_LIT572 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT572)
#line 1621 "Flags_loadFlags.c"
#define _OMC_LIT573_data "s"
#line 1622 "Flags_loadFlags.c"
static const size_t _OMC_LIT573_strlen = 1;
#line 1623 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT573,1,_OMC_LIT573_data);
#line 1624 "Flags_loadFlags.c"
#define _OMC_LIT573 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT573)
#line 1625 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT574,1,1) {_OMC_LIT573}};
#line 1626 "Flags_loadFlags.c"
#define _OMC_LIT574 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT574)
#line 1627 "Flags_loadFlags.c"
#define _OMC_LIT575_data "Turns on simulation code generation."
#line 1628 "Flags_loadFlags.c"
static const size_t _OMC_LIT575_strlen = 36;
#line 1629 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT575,36,_OMC_LIT575_data);
#line 1630 "Flags_loadFlags.c"
#define _OMC_LIT575 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT575)
#line 1631 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT576,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(28)),_OMC_LIT572,_OMC_LIT574,_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT575}};
#line 1632 "Flags_loadFlags.c"
#define _OMC_LIT576 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT576)
#line 1633 "Flags_loadFlags.c"
#define _OMC_LIT577_data "evalAnnotationParams"
#line 1634 "Flags_loadFlags.c"
static const size_t _OMC_LIT577_strlen = 20;
#line 1635 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT577,20,_OMC_LIT577_data);
#line 1636 "Flags_loadFlags.c"
#define _OMC_LIT577 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT577)
#line 1637 "Flags_loadFlags.c"
#define _OMC_LIT578_data "Sets whether to evaluate parameters in annotations or not."
#line 1638 "Flags_loadFlags.c"
static const size_t _OMC_LIT578_strlen = 58;
#line 1639 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT578,58,_OMC_LIT578_data);
#line 1640 "Flags_loadFlags.c"
#define _OMC_LIT578 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT578)
#line 1641 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT579,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(29)),_OMC_LIT577,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT578}};
#line 1642 "Flags_loadFlags.c"
#define _OMC_LIT579 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT579)
#line 1643 "Flags_loadFlags.c"
#define _OMC_LIT580_data "checkModel"
#line 1644 "Flags_loadFlags.c"
static const size_t _OMC_LIT580_strlen = 10;
#line 1645 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT580,10,_OMC_LIT580_data);
#line 1646 "Flags_loadFlags.c"
#define _OMC_LIT580 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT580)
#line 1647 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT581,1,3) {&Flags_FlagVisibility_INTERNAL__desc,}};
#line 1648 "Flags_loadFlags.c"
#define _OMC_LIT581 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT581)
#line 1649 "Flags_loadFlags.c"
#define _OMC_LIT582_data "Set when checkModel is used to turn on specific features for checking."
#line 1650 "Flags_loadFlags.c"
static const size_t _OMC_LIT582_strlen = 70;
#line 1651 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT582,70,_OMC_LIT582_data);
#line 1652 "Flags_loadFlags.c"
#define _OMC_LIT582 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT582)
#line 1653 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT583,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(30)),_OMC_LIT580,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT581,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT582}};
#line 1654 "Flags_loadFlags.c"
#define _OMC_LIT583 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT583)
#line 1655 "Flags_loadFlags.c"
#define _OMC_LIT584_data "cevalEquation"
#line 1656 "Flags_loadFlags.c"
static const size_t _OMC_LIT584_strlen = 13;
#line 1657 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT584,13,_OMC_LIT584_data);
#line 1658 "Flags_loadFlags.c"
#define _OMC_LIT584 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT584)
#line 1659 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT585,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(31)),_OMC_LIT584,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT581,_OMC_LIT515,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1660 "Flags_loadFlags.c"
#define _OMC_LIT585 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT585)
#line 1661 "Flags_loadFlags.c"
#define _OMC_LIT586_data "unitChecking"
#line 1662 "Flags_loadFlags.c"
static const size_t _OMC_LIT586_strlen = 12;
#line 1663 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT586,12,_OMC_LIT586_data);
#line 1664 "Flags_loadFlags.c"
#define _OMC_LIT586 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT586)
#line 1665 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT587,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(32)),_OMC_LIT586,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT581,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1666 "Flags_loadFlags.c"
#define _OMC_LIT587 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT587)
#line 1667 "Flags_loadFlags.c"
#define _OMC_LIT588_data "translateDAEString"
#line 1668 "Flags_loadFlags.c"
static const size_t _OMC_LIT588_strlen = 18;
#line 1669 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT588,18,_OMC_LIT588_data);
#line 1670 "Flags_loadFlags.c"
#define _OMC_LIT588 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT588)
#line 1671 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT589,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(33)),_OMC_LIT588,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT581,_OMC_LIT515,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1672 "Flags_loadFlags.c"
#define _OMC_LIT589 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT589)
#line 1673 "Flags_loadFlags.c"
#define _OMC_LIT590_data "envCache"
#line 1674 "Flags_loadFlags.c"
static const size_t _OMC_LIT590_strlen = 8;
#line 1675 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT590,8,_OMC_LIT590_data);
#line 1676 "Flags_loadFlags.c"
#define _OMC_LIT590 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT590)
#line 1677 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT591,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(34)),_OMC_LIT590,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT581,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT7}};
#line 1678 "Flags_loadFlags.c"
#define _OMC_LIT591 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT591)
#line 1679 "Flags_loadFlags.c"
#define _OMC_LIT592_data "generateLabeledSimCode"
#line 1680 "Flags_loadFlags.c"
static const size_t _OMC_LIT592_strlen = 22;
#line 1681 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT592,22,_OMC_LIT592_data);
#line 1682 "Flags_loadFlags.c"
#define _OMC_LIT592 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT592)
#line 1683 "Flags_loadFlags.c"
#define _OMC_LIT593_data "Turns on labeled SimCode generation for reduction algorithms."
#line 1684 "Flags_loadFlags.c"
static const size_t _OMC_LIT593_strlen = 61;
#line 1685 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT593,61,_OMC_LIT593_data);
#line 1686 "Flags_loadFlags.c"
#define _OMC_LIT593 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT593)
#line 1687 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT594,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(35)),_OMC_LIT592,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT593}};
#line 1688 "Flags_loadFlags.c"
#define _OMC_LIT594 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT594)
#line 1689 "Flags_loadFlags.c"
#define _OMC_LIT595_data "reduceTerms"
#line 1690 "Flags_loadFlags.c"
static const size_t _OMC_LIT595_strlen = 11;
#line 1691 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT595,11,_OMC_LIT595_data);
#line 1692 "Flags_loadFlags.c"
#define _OMC_LIT595 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT595)
#line 1693 "Flags_loadFlags.c"
#define _OMC_LIT596_data "Turns on reducing terms for reduction algorithms."
#line 1694 "Flags_loadFlags.c"
static const size_t _OMC_LIT596_strlen = 49;
#line 1695 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT596,49,_OMC_LIT596_data);
#line 1696 "Flags_loadFlags.c"
#define _OMC_LIT596 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT596)
#line 1697 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT597,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(36)),_OMC_LIT595,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT596}};
#line 1698 "Flags_loadFlags.c"
#define _OMC_LIT597 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT597)
#line 1699 "Flags_loadFlags.c"
#define _OMC_LIT598_data "reductionMethod"
#line 1700 "Flags_loadFlags.c"
static const size_t _OMC_LIT598_strlen = 15;
#line 1701 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT598,15,_OMC_LIT598_data);
#line 1702 "Flags_loadFlags.c"
#define _OMC_LIT598 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT598)
#line 1703 "Flags_loadFlags.c"
#define _OMC_LIT599_data "deletion"
#line 1704 "Flags_loadFlags.c"
static const size_t _OMC_LIT599_strlen = 8;
#line 1705 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT599,8,_OMC_LIT599_data);
#line 1706 "Flags_loadFlags.c"
#define _OMC_LIT599 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT599)
#line 1707 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT600,2,7) {&Flags_FlagData_STRING__FLAG__desc,_OMC_LIT599}};
#line 1708 "Flags_loadFlags.c"
#define _OMC_LIT600 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT600)
#line 1709 "Flags_loadFlags.c"
#define _OMC_LIT601_data "substitution"
#line 1710 "Flags_loadFlags.c"
static const size_t _OMC_LIT601_strlen = 12;
#line 1711 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT601,12,_OMC_LIT601_data);
#line 1712 "Flags_loadFlags.c"
#define _OMC_LIT601 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT601)
#line 1713 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT602,2,1) {_OMC_LIT6,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1714 "Flags_loadFlags.c"
#define _OMC_LIT602 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT602)
#line 1715 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT603,2,1) {_OMC_LIT601,_OMC_LIT602}};
#line 1716 "Flags_loadFlags.c"
#define _OMC_LIT603 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT603)
#line 1717 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT604,2,1) {_OMC_LIT599,_OMC_LIT603}};
#line 1718 "Flags_loadFlags.c"
#define _OMC_LIT604 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT604)
#line 1719 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT605,2,3) {&Flags_ValidOptions_STRING__OPTION__desc,_OMC_LIT604}};
#line 1720 "Flags_loadFlags.c"
#define _OMC_LIT605 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT605)
#line 1721 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT606,1,1) {_OMC_LIT605}};
#line 1722 "Flags_loadFlags.c"
#define _OMC_LIT606 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT606)
#line 1723 "Flags_loadFlags.c"
#define _OMC_LIT607_data "Sets the reduction method to be used."
#line 1724 "Flags_loadFlags.c"
static const size_t _OMC_LIT607_strlen = 37;
#line 1725 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT607,37,_OMC_LIT607_data);
#line 1726 "Flags_loadFlags.c"
#define _OMC_LIT607 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT607)
#line 1727 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT608,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(37)),_OMC_LIT598,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT600,_OMC_LIT606,_OMC_LIT607}};
#line 1728 "Flags_loadFlags.c"
#define _OMC_LIT608 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT608)
#line 1729 "Flags_loadFlags.c"
#define _OMC_LIT609_data "plotSilent"
#line 1730 "Flags_loadFlags.c"
static const size_t _OMC_LIT609_strlen = 10;
#line 1731 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT609,10,_OMC_LIT609_data);
#line 1732 "Flags_loadFlags.c"
#define _OMC_LIT609 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT609)
#line 1733 "Flags_loadFlags.c"
#define _OMC_LIT610_data "Defines whether plot commands should open OMPlot or just output results."
#line 1734 "Flags_loadFlags.c"
static const size_t _OMC_LIT610_strlen = 72;
#line 1735 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT610,72,_OMC_LIT610_data);
#line 1736 "Flags_loadFlags.c"
#define _OMC_LIT610 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT610)
#line 1737 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT611,8,3) {&Flags_ConfigFlag_CONFIG__FLAG__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(38)),_OMC_LIT609,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT311,_OMC_LIT316,MMC_REFSTRUCTLIT(mmc_none),_OMC_LIT610}};
#line 1738 "Flags_loadFlags.c"
#define _OMC_LIT611 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT611)
#line 1739 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT612,2,1) {_OMC_LIT611,MMC_REFSTRUCTLIT(mmc_nil)}};
#line 1740 "Flags_loadFlags.c"
#define _OMC_LIT612 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT612)
#line 1741 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT613,2,1) {_OMC_LIT608,_OMC_LIT612}};
#line 1742 "Flags_loadFlags.c"
#define _OMC_LIT613 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT613)
#line 1743 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT614,2,1) {_OMC_LIT597,_OMC_LIT613}};
#line 1744 "Flags_loadFlags.c"
#define _OMC_LIT614 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT614)
#line 1745 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT615,2,1) {_OMC_LIT594,_OMC_LIT614}};
#line 1746 "Flags_loadFlags.c"
#define _OMC_LIT615 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT615)
#line 1747 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT616,2,1) {_OMC_LIT591,_OMC_LIT615}};
#line 1748 "Flags_loadFlags.c"
#define _OMC_LIT616 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT616)
#line 1749 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT617,2,1) {_OMC_LIT589,_OMC_LIT616}};
#line 1750 "Flags_loadFlags.c"
#define _OMC_LIT617 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT617)
#line 1751 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT618,2,1) {_OMC_LIT587,_OMC_LIT617}};
#line 1752 "Flags_loadFlags.c"
#define _OMC_LIT618 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT618)
#line 1753 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT619,2,1) {_OMC_LIT585,_OMC_LIT618}};
#line 1754 "Flags_loadFlags.c"
#define _OMC_LIT619 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT619)
#line 1755 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT620,2,1) {_OMC_LIT583,_OMC_LIT619}};
#line 1756 "Flags_loadFlags.c"
#define _OMC_LIT620 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT620)
#line 1757 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT621,2,1) {_OMC_LIT579,_OMC_LIT620}};
#line 1758 "Flags_loadFlags.c"
#define _OMC_LIT621 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT621)
#line 1759 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT622,2,1) {_OMC_LIT576,_OMC_LIT621}};
#line 1760 "Flags_loadFlags.c"
#define _OMC_LIT622 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT622)
#line 1761 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT623,2,1) {_OMC_LIT571,_OMC_LIT622}};
#line 1762 "Flags_loadFlags.c"
#define _OMC_LIT623 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT623)
#line 1763 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT624,2,1) {_OMC_LIT565,_OMC_LIT623}};
#line 1764 "Flags_loadFlags.c"
#define _OMC_LIT624 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT624)
#line 1765 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT625,2,1) {_OMC_LIT560,_OMC_LIT624}};
#line 1766 "Flags_loadFlags.c"
#define _OMC_LIT625 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT625)
#line 1767 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT626,2,1) {_OMC_LIT555,_OMC_LIT625}};
#line 1768 "Flags_loadFlags.c"
#define _OMC_LIT626 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT626)
#line 1769 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT627,2,1) {_OMC_LIT550,_OMC_LIT626}};
#line 1770 "Flags_loadFlags.c"
#define _OMC_LIT627 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT627)
#line 1771 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT628,2,1) {_OMC_LIT544,_OMC_LIT627}};
#line 1772 "Flags_loadFlags.c"
#define _OMC_LIT628 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT628)
#line 1773 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT629,2,1) {_OMC_LIT540,_OMC_LIT628}};
#line 1774 "Flags_loadFlags.c"
#define _OMC_LIT629 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT629)
#line 1775 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT630,2,1) {_OMC_LIT535,_OMC_LIT629}};
#line 1776 "Flags_loadFlags.c"
#define _OMC_LIT630 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT630)
#line 1777 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT631,2,1) {_OMC_LIT531,_OMC_LIT630}};
#line 1778 "Flags_loadFlags.c"
#define _OMC_LIT631 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT631)
#line 1779 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT632,2,1) {_OMC_LIT527,_OMC_LIT631}};
#line 1780 "Flags_loadFlags.c"
#define _OMC_LIT632 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT632)
#line 1781 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT633,2,1) {_OMC_LIT522,_OMC_LIT632}};
#line 1782 "Flags_loadFlags.c"
#define _OMC_LIT633 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT633)
#line 1783 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT634,2,1) {_OMC_LIT517,_OMC_LIT633}};
#line 1784 "Flags_loadFlags.c"
#define _OMC_LIT634 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT634)
#line 1785 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT635,2,1) {_OMC_LIT513,_OMC_LIT634}};
#line 1786 "Flags_loadFlags.c"
#define _OMC_LIT635 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT635)
#line 1787 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT636,2,1) {_OMC_LIT493,_OMC_LIT635}};
#line 1788 "Flags_loadFlags.c"
#define _OMC_LIT636 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT636)
#line 1789 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT637,2,1) {_OMC_LIT470,_OMC_LIT636}};
#line 1790 "Flags_loadFlags.c"
#define _OMC_LIT637 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT637)
#line 1791 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT638,2,1) {_OMC_LIT458,_OMC_LIT637}};
#line 1792 "Flags_loadFlags.c"
#define _OMC_LIT638 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT638)
#line 1793 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT639,2,1) {_OMC_LIT408,_OMC_LIT638}};
#line 1794 "Flags_loadFlags.c"
#define _OMC_LIT639 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT639)
#line 1795 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT640,2,1) {_OMC_LIT405,_OMC_LIT639}};
#line 1796 "Flags_loadFlags.c"
#define _OMC_LIT640 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT640)
#line 1797 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT641,2,1) {_OMC_LIT402,_OMC_LIT640}};
#line 1798 "Flags_loadFlags.c"
#define _OMC_LIT641 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT641)
#line 1799 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT642,2,1) {_OMC_LIT399,_OMC_LIT641}};
#line 1800 "Flags_loadFlags.c"
#define _OMC_LIT642 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT642)
#line 1801 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT643,2,1) {_OMC_LIT372,_OMC_LIT642}};
#line 1802 "Flags_loadFlags.c"
#define _OMC_LIT643 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT643)
#line 1803 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT644,2,1) {_OMC_LIT360,_OMC_LIT643}};
#line 1804 "Flags_loadFlags.c"
#define _OMC_LIT644 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT644)
#line 1805 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT645,2,1) {_OMC_LIT340,_OMC_LIT644}};
#line 1806 "Flags_loadFlags.c"
#define _OMC_LIT645 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT645)
#line 1807 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT646,2,1) {_OMC_LIT331,_OMC_LIT645}};
#line 1808 "Flags_loadFlags.c"
#define _OMC_LIT646 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT646)
#line 1809 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT647,2,1) {_OMC_LIT326,_OMC_LIT646}};
#line 1810 "Flags_loadFlags.c"
#define _OMC_LIT647 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT647)
#line 1811 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT648,2,1) {_OMC_LIT323,_OMC_LIT647}};
#line 1812 "Flags_loadFlags.c"
#define _OMC_LIT648 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT648)
#line 1813 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT649,2,1) {_OMC_LIT314,_OMC_LIT648}};
#line 1814 "Flags_loadFlags.c"
#define _OMC_LIT649 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT649)
#line 1815 "Flags_loadFlags.c"
#define _OMC_LIT650_data "Invalid flag "
#line 1816 "Flags_loadFlags.c"
static const size_t _OMC_LIT650_strlen = 13;
#line 1817 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT650,13,_OMC_LIT650_data);
#line 1818 "Flags_loadFlags.c"
#define _OMC_LIT650 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT650)
#line 1819 "Flags_loadFlags.c"
#define _OMC_LIT651_data " with index "
#line 1820 "Flags_loadFlags.c"
static const size_t _OMC_LIT651_strlen = 12;
#line 1821 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT651,12,_OMC_LIT651_data);
#line 1822 "Flags_loadFlags.c"
#define _OMC_LIT651 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT651)
#line 1823 "Flags_loadFlags.c"
#define _OMC_LIT652_data " in Flags.allConfigFlags. Make sure that all flags are present and ordered correctly."
#line 1824 "Flags_loadFlags.c"
static const size_t _OMC_LIT652_strlen = 85;
#line 1825 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT652,85,_OMC_LIT652_data);
#line 1826 "Flags_loadFlags.c"
#define _OMC_LIT652 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT652)
#line 1827 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT653,1,5) {&Error_MessageType_TRANSLATION__desc,}};
#line 1828 "Flags_loadFlags.c"
#define _OMC_LIT653 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT653)
#line 1829 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT654,1,3) {&Error_Severity_ERROR__desc,}};
#line 1830 "Flags_loadFlags.c"
#define _OMC_LIT654 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT654)
#line 1831 "Flags_loadFlags.c"
#define _OMC_LIT655_data "Internal error %s"
#line 1832 "Flags_loadFlags.c"
static const size_t _OMC_LIT655_strlen = 17;
#line 1833 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT655,17,_OMC_LIT655_data);
#line 1834 "Flags_loadFlags.c"
#define _OMC_LIT655 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT655)
#line 1835 "Flags_loadFlags.c"
static const MMC_DEFSTRUCTLIT(_OMC_LIT_STRUCT656,5,3) {&Error_Message_MESSAGE__desc,MMC_IMMEDIATE(MMC_TAGFIXNUM(63)),_OMC_LIT653,_OMC_LIT654,_OMC_LIT655}};
#line 1836 "Flags_loadFlags.c"
#define _OMC_LIT656 MMC_REFSTRUCTLIT(_OMC_LIT_STRUCT656)
#line 1837 "Flags_loadFlags.c"
#define _OMC_LIT657_data " in Flags.allDebugFlags. Make sure that all flags are present and ordered correctly."
#line 1838 "Flags_loadFlags.c"
static const size_t _OMC_LIT657_strlen = 84;
#line 1839 "Flags_loadFlags.c"
static const MMC_DEFSTRINGLIT(_OMC_LIT_STRUCT657,84,_OMC_LIT657_data);
#line 1840 "Flags_loadFlags.c"
#define _OMC_LIT657 MMC_REFSTRINGLIT(_OMC_LIT_STRUCT657)
#line 1841 "Flags_loadFlags.c"

#line 1842 "Flags_loadFlags.c"
Flags_loadFlags_rettype _Flags_loadFlags()
#line 1843 "Flags_loadFlags.c"
{
#line 1844 "Flags_loadFlags.c"

#line 1845 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 1846 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_Flags_loadFlags");
#line 1847 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 1848 "Flags_loadFlags.c"
  
#line 1849 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 1850 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 1851 "Flags_loadFlags.c"
  Flags_loadFlags_rettype tmp1;
#line 1852 "Flags_loadFlags.c"
  modelica_metatype _outFlags = NULL; mmc_GC_add_root(&_outFlags, mmc_GC_local_state, "_outFlags");
#line 1853 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[5] = {0};
#line 1854 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 5, mmc_GC_local_state, "Array of temporaries");
#line 1855 "Flags_loadFlags.c"
  _tailrecursive:
#line 1856 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 1857 "Flags_loadFlags.c"
  /* varOutput varInits(_outFlags) */ 
#line 1858 "Flags_loadFlags.c"
  
#line 1859 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 1860 "Flags_loadFlags.c"
  
#line 1861 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 1862 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 1865 "Flags_loadFlags.c"
  { /* matchcontinue expression */
#line 1866 "Flags_loadFlags.c"
    {
#line 1867 "Flags_loadFlags.c"
      modelica_metatype _debug_flags = NULL; mmc_GC_add_root(&_debug_flags, mmc_GC_local_state, "_debug_flags");
#line 1868 "Flags_loadFlags.c"
      modelica_metatype _config_flags = NULL; mmc_GC_add_root(&_config_flags, mmc_GC_local_state, "_config_flags");
#line 1869 "Flags_loadFlags.c"
      modelica_metatype _flags = NULL; mmc_GC_add_root(&_flags, mmc_GC_local_state, "_flags");
#line 1870 "Flags_loadFlags.c"
      modelica_integer _debug_count;
#line 1871 "Flags_loadFlags.c"
      modelica_integer _config_count;
#line 1872 "Flags_loadFlags.c"
      mmc_switch_type tmp3;
#line 1873 "Flags_loadFlags.c"
      int tmp4;
#line 1874 "Flags_loadFlags.c"
      for (tmp3 = 0, tmp4 = 0; tmp3 < 2 && !tmp4; tmp3++) {
#line 1875 "Flags_loadFlags.c"
        MMC_TRY()
#line 1876 "Flags_loadFlags.c"
        
#line 1877 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp3)) {
#line 1878 "Flags_loadFlags.c"
        case 0: {
#line 1879 "Flags_loadFlags.c"
        
#line 1880 "Flags_loadFlags.c"

#line 1881 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 675 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[1] = getGlobalRoot((modelica_integer) 7);
#line 675 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[0] = tmpMeta[1];
#line 1886 "Flags_loadFlags.c"
          tmp4 = 1;
#line 1887 "Flags_loadFlags.c"
          break;
#line 1888 "Flags_loadFlags.c"
        }
#line 1889 "Flags_loadFlags.c"
        case 1: {
#line 1890 "Flags_loadFlags.c"
        
#line 1891 "Flags_loadFlags.c"
          List_fold_rettype tmp5;
#line 1892 "Flags_loadFlags.c"
          List_fold1_rettype tmp6;
#line 1893 "Flags_loadFlags.c"

#line 1894 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 681 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmp5 = _List_fold(_OMC_LIT306, ((modelica_fnptr)boxptr_Flags_checkDebugFlag), mmc_mk_integer((modelica_integer) 1));
#line 681 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _debug_count = (mmc_unbox_integer(tmp5.List_fold_rettype_1) /* DAE.UNBOX */ + (modelica_integer) -1);
#line 682 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _config_count = (modelica_integer) 38;
#line 683 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[2] = arrayCreate((modelica_integer)_debug_count, mmc_mk_boolean((0)));
#line 683 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _debug_flags = tmpMeta[2];
#line 684 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[3] = arrayCreate((modelica_integer)_config_count, _OMC_LIT307);
#line 684 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _config_flags = tmpMeta[3];
#line 685 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmp6 = _List_fold1(_OMC_LIT649, ((modelica_fnptr)boxptr_Flags_setDefaultConfig), _config_flags, mmc_mk_integer((modelica_integer) 1));
#line 686 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[4] = mmc_mk_box3(3, &Flags_Flags_FLAGS__desc, _debug_flags, _config_flags);
#line 686 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _flags = tmpMeta[4];
#line 687 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _Flags_saveFlags(_flags);
#line 687 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          /* NORETCALL */;
#line 688 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[0] = _flags;
#line 1924 "Flags_loadFlags.c"
          tmp4 = 1;
#line 1925 "Flags_loadFlags.c"
          break;
#line 1926 "Flags_loadFlags.c"
        }
#line 1927 "Flags_loadFlags.c"
        }
#line 1928 "Flags_loadFlags.c"
        
#line 1929 "Flags_loadFlags.c"
        MMC_CATCH()
#line 1930 "Flags_loadFlags.c"
      }
#line 1931 "Flags_loadFlags.c"
      
#line 1932 "Flags_loadFlags.c"
      if (!tmp4) MMC_THROW();
#line 1933 "Flags_loadFlags.c"
    }
#line 1934 "Flags_loadFlags.c"
  }
#line 1935 "Flags_loadFlags.c"
  _outFlags = tmpMeta[0];
#line 1937 "Flags_loadFlags.c"
  
#line 1938 "Flags_loadFlags.c"
  _return:
#line 1939 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 1940 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 1941 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 1942 "Flags_loadFlags.c"
  /* varOutput varAssign(_outFlags) */ 
#line 1943 "Flags_loadFlags.c"
  tmp1.targ1 = _outFlags;
#line 1944 "Flags_loadFlags.c"
  
#line 1945 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 1946 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 1947 "Flags_loadFlags.c"
  
#line 1948 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 1949 "Flags_loadFlags.c"
  return  tmp1;
#line 1950 "Flags_loadFlags.c"
}
#line 1951 "Flags_loadFlags.c"

#line 1952 "Flags_loadFlags.c"
int in_Flags_loadFlags(type_description * inArgs, type_description * outVar)
#line 1953 "Flags_loadFlags.c"
{
#line 1954 "Flags_loadFlags.c"
  void* states = push_memory_states(1);
#line 1955 "Flags_loadFlags.c"
  Flags_loadFlags_rettype out;
#line 1956 "Flags_loadFlags.c"
  MMC_TRY_TOP()
#line 1957 "Flags_loadFlags.c"
  out = _Flags_loadFlags();
#line 1958 "Flags_loadFlags.c"
  MMC_CATCH_TOP(return 1)
#line 1959 "Flags_loadFlags.c"
  write_modelica_metatype(outVar, &out.targ1);
#line 1960 "Flags_loadFlags.c"
  fflush(NULL);
#line 1961 "Flags_loadFlags.c"
  pop_memory_states(states);
#line 1962 "Flags_loadFlags.c"
  return 0;
#line 1963 "Flags_loadFlags.c"
}
#line 1964 "Flags_loadFlags.c"

#line 1965 "Flags_loadFlags.c"
void _Flags_saveFlags(modelica_metatype _inFlags)
#line 1966 "Flags_loadFlags.c"
{
#line 1967 "Flags_loadFlags.c"

#line 1968 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 1969 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_Flags_saveFlags");
#line 1970 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 1971 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inFlags, mmc_GC_local_state, "_inFlags");
#line 1972 "Flags_loadFlags.c"
  
#line 1973 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 1974 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 1975 "Flags_loadFlags.c"
  _tailrecursive:
#line 1976 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 1977 "Flags_loadFlags.c"
  
#line 1978 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 1979 "Flags_loadFlags.c"
  
#line 1980 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 1981 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 658 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
  setGlobalRoot((modelica_integer) 7, _inFlags);
#line 658 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
  /* NORETCALL */;
#line 1986 "Flags_loadFlags.c"
  
#line 1987 "Flags_loadFlags.c"
  _return:
#line 1988 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 1989 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 1990 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 1991 "Flags_loadFlags.c"
  
#line 1992 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 1993 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 1994 "Flags_loadFlags.c"
  
#line 1995 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 1996 "Flags_loadFlags.c"
  return ;
#line 1997 "Flags_loadFlags.c"
}
#line 1998 "Flags_loadFlags.c"

#line 1999 "Flags_loadFlags.c"

#line 2000 "Flags_loadFlags.c"

#line 2001 "Flags_loadFlags.c"
List_fold1_rettype _List_fold1(modelica_metatype _inList, modelica_fnptr inFoldFunc, modelica_metatype _inExtraArg, modelica_metatype _inStartValue)
#line 2002 "Flags_loadFlags.c"
{
#line 2003 "Flags_loadFlags.c"

#line 2004 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 2005 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_List_fold1");
#line 2006 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 2007 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inList, mmc_GC_local_state, "_inList");
#line 2008 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inExtraArg, mmc_GC_local_state, "_inExtraArg");
#line 2009 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inStartValue, mmc_GC_local_state, "_inStartValue");
#line 2010 "Flags_loadFlags.c"
  
#line 2011 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 2012 "Flags_loadFlags.c"
  #define inFoldFunc_rettype_1 targ1
#line 2013 "Flags_loadFlags.c"
  typedef struct inFoldFunc_rettype_s
#line 2014 "Flags_loadFlags.c"
  {
#line 2015 "Flags_loadFlags.c"
    modelica_metatype targ1;
#line 2016 "Flags_loadFlags.c"
  } inFoldFunc_rettype;
#line 2017 "Flags_loadFlags.c"
  inFoldFunc_rettype(*_inFoldFunc)(modelica_metatype, modelica_metatype, modelica_metatype);
#line 2018 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 2019 "Flags_loadFlags.c"
  List_fold1_rettype tmp1;
#line 2020 "Flags_loadFlags.c"
  modelica_metatype _outResult = NULL; mmc_GC_add_root(&_outResult, mmc_GC_local_state, "_outResult");
#line 2021 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[4] = {0};
#line 2022 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 4, mmc_GC_local_state, "Array of temporaries");
#line 2023 "Flags_loadFlags.c"
  _tailrecursive:
#line 2024 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 2025 "Flags_loadFlags.c"
  /* varOutput varInits(_outResult) */ 
#line 2026 "Flags_loadFlags.c"
  
#line 2027 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 2028 "Flags_loadFlags.c"
  
#line 2029 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 2030 "Flags_loadFlags.c"
  _inFoldFunc = (inFoldFunc_rettype(*)(modelica_metatype, modelica_metatype, modelica_metatype)) inFoldFunc;
#line 2031 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 2034 "Flags_loadFlags.c"
  { /* match expression */
#line 2035 "Flags_loadFlags.c"
    tmpMeta[1+0] = _inList;
#line 2036 "Flags_loadFlags.c"
    {
#line 2037 "Flags_loadFlags.c"
      modelica_metatype _e = NULL; mmc_GC_add_root(&_e, mmc_GC_local_state, "_e");
#line 2038 "Flags_loadFlags.c"
      modelica_metatype _rest = NULL; mmc_GC_add_root(&_rest, mmc_GC_local_state, "_rest");
#line 2039 "Flags_loadFlags.c"
      modelica_metatype _arg = NULL; mmc_GC_add_root(&_arg, mmc_GC_local_state, "_arg");
#line 2040 "Flags_loadFlags.c"
      mmc_switch_type tmp3;
#line 2041 "Flags_loadFlags.c"
      int tmp4;
#line 2042 "Flags_loadFlags.c"
      for (tmp3 = 0, tmp4 = 0; tmp3 < 2 && !tmp4; tmp3++) {
#line 2043 "Flags_loadFlags.c"
        
#line 2044 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp3)) {
#line 2045 "Flags_loadFlags.c"
        case 0: {
#line 2046 "Flags_loadFlags.c"
        
#line 2047 "Flags_loadFlags.c"

#line 2048 "Flags_loadFlags.c"
          if (!listEmpty(tmpMeta[1+0])) break;
#line 2049 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 3987 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          tmpMeta[0] = _inStartValue;
#line 2053 "Flags_loadFlags.c"
          tmp4 = 1;
#line 2054 "Flags_loadFlags.c"
          break;
#line 2055 "Flags_loadFlags.c"
        }
#line 2056 "Flags_loadFlags.c"
        case 1: {
#line 2057 "Flags_loadFlags.c"
        
#line 2058 "Flags_loadFlags.c"
          inFoldFunc_rettype tmp5;
#line 2059 "Flags_loadFlags.c"

#line 2060 "Flags_loadFlags.c"
          if (listEmpty(tmpMeta[1+0])) break;
#line 2061 "Flags_loadFlags.c"
          tmpMeta[2] = MMC_CAR(tmpMeta[1+0]);
#line 2062 "Flags_loadFlags.c"
          tmpMeta[3] = MMC_CDR(tmpMeta[1+0]);
#line 2063 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2064 "Flags_loadFlags.c"
          _e = tmpMeta[2];
#line 2065 "Flags_loadFlags.c"
          _rest = tmpMeta[3];
#line 3991 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          tmp5 = _inFoldFunc(_e, _inExtraArg, _inStartValue);
#line 3991 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _arg = tmp5.inFoldFunc_rettype_1;
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          /* Tail recursive call List.fold1(rest,inFoldFunc,inExtraArg,arg) */
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _inList = _rest;
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _inExtraArg = _inExtraArg;
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _inStartValue = _arg;
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          goto _tailrecursive;
#line 3992 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          /* TODO: Make sure any eventual dead code below is never generated */
#line 2078 "Flags_loadFlags.c"
          tmp4 = 1;
#line 2079 "Flags_loadFlags.c"
          break;
#line 2080 "Flags_loadFlags.c"
        }
#line 2081 "Flags_loadFlags.c"
        }
#line 2082 "Flags_loadFlags.c"
        
#line 2083 "Flags_loadFlags.c"
      }
#line 2084 "Flags_loadFlags.c"
      
#line 2085 "Flags_loadFlags.c"
      if (!tmp4) MMC_THROW();
#line 2086 "Flags_loadFlags.c"
    }
#line 2087 "Flags_loadFlags.c"
  }
#line 2088 "Flags_loadFlags.c"
  _outResult = tmpMeta[0];
#line 2090 "Flags_loadFlags.c"
  
#line 2091 "Flags_loadFlags.c"
  _return:
#line 2092 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 2093 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 2094 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 2095 "Flags_loadFlags.c"
  /* varOutput varAssign(_outResult) */ 
#line 2096 "Flags_loadFlags.c"
  tmp1.targ1 = _outResult;
#line 2097 "Flags_loadFlags.c"
  
#line 2098 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 2099 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2100 "Flags_loadFlags.c"
  
#line 2101 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 2102 "Flags_loadFlags.c"
  return  tmp1;
#line 2103 "Flags_loadFlags.c"
}
#line 2104 "Flags_loadFlags.c"

#line 2105 "Flags_loadFlags.c"

#line 2106 "Flags_loadFlags.c"

#line 2107 "Flags_loadFlags.c"
Flags_setDefaultConfig_rettype _Flags_setDefaultConfig(modelica_metatype _inConfigFlag, modelica_metatype _inConfigData, modelica_integer _inFlagIndex)
#line 2108 "Flags_loadFlags.c"
{
#line 2109 "Flags_loadFlags.c"

#line 2110 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 2111 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_Flags_setDefaultConfig");
#line 2112 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 2113 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inConfigFlag, mmc_GC_local_state, "_inConfigFlag");
#line 2114 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inConfigData, mmc_GC_local_state, "_inConfigData");
#line 2115 "Flags_loadFlags.c"
  
#line 2116 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 2117 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 2118 "Flags_loadFlags.c"
  Flags_setDefaultConfig_rettype tmp1;
#line 2119 "Flags_loadFlags.c"
  modelica_integer _outFlagIndex;
#line 2120 "Flags_loadFlags.c"
  modelica_integer tmp2;
#line 2121 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[22] = {0};
#line 2122 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 22, mmc_GC_local_state, "Array of temporaries");
#line 2123 "Flags_loadFlags.c"
  _tailrecursive:
#line 2124 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 2125 "Flags_loadFlags.c"
  /* varOutput varInits(_outFlagIndex) */ 
#line 2126 "Flags_loadFlags.c"
  
#line 2127 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 2128 "Flags_loadFlags.c"
  
#line 2129 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 2130 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 2133 "Flags_loadFlags.c"
  { /* matchcontinue expression */
#line 2134 "Flags_loadFlags.c"
    tmpMeta[0+0] = _inConfigFlag;
#line 2135 "Flags_loadFlags.c"
    {
#line 2136 "Flags_loadFlags.c"
      modelica_integer _index;
#line 2137 "Flags_loadFlags.c"
      modelica_metatype _default_value = NULL; mmc_GC_add_root(&_default_value, mmc_GC_local_state, "_default_value");
#line 2138 "Flags_loadFlags.c"
      modelica_metatype _name = NULL; mmc_GC_add_root(&_name, mmc_GC_local_state, "_name");
#line 2139 "Flags_loadFlags.c"
      modelica_metatype _index_str = NULL; mmc_GC_add_root(&_index_str, mmc_GC_local_state, "_index_str");
#line 2140 "Flags_loadFlags.c"
      modelica_metatype _err_str = NULL; mmc_GC_add_root(&_err_str, mmc_GC_local_state, "_err_str");
#line 2141 "Flags_loadFlags.c"
      mmc_switch_type tmp4;
#line 2142 "Flags_loadFlags.c"
      int tmp5;
#line 2143 "Flags_loadFlags.c"
      for (tmp4 = 0, tmp5 = 0; tmp4 < 2 && !tmp5; tmp4++) {
#line 2144 "Flags_loadFlags.c"
        MMC_TRY()
#line 2145 "Flags_loadFlags.c"
        
#line 2146 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp4)) {
#line 2147 "Flags_loadFlags.c"
        case 0: {
#line 2148 "Flags_loadFlags.c"
        
#line 2149 "Flags_loadFlags.c"
          modelica_integer tmp6;
#line 2150 "Flags_loadFlags.c"

#line 2151 "Flags_loadFlags.c"
          tmpMeta[1] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 2));
#line 2152 "Flags_loadFlags.c"
          tmp6 = mmc_unbox_integer(tmpMeta[1]);
#line 2153 "Flags_loadFlags.c"
          tmpMeta[2] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 3));
#line 2154 "Flags_loadFlags.c"
          tmpMeta[3] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 4));
#line 2155 "Flags_loadFlags.c"
          tmpMeta[4] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 5));
#line 2156 "Flags_loadFlags.c"
          tmpMeta[5] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 6));
#line 2157 "Flags_loadFlags.c"
          tmpMeta[6] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 7));
#line 2158 "Flags_loadFlags.c"
          tmpMeta[7] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 8));
#line 2159 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2160 "Flags_loadFlags.c"
          _index = tmp6;
#line 2161 "Flags_loadFlags.c"
          _default_value = tmpMeta[5];
#line 751 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          /* Pattern-matching assignment */
#line 751 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          if (1 != ((modelica_integer)_index == (modelica_integer)_inFlagIndex)) MMC_THROW();
#line 752 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[8] = arrayUpdate(_inConfigData, (modelica_integer)_index, _default_value);
#line 753 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmp2 = ((modelica_integer) 1 + (modelica_integer)_inFlagIndex);
#line 2172 "Flags_loadFlags.c"
          tmp5 = 1;
#line 2173 "Flags_loadFlags.c"
          break;
#line 2174 "Flags_loadFlags.c"
        }
#line 2175 "Flags_loadFlags.c"
        case 1: {
#line 2176 "Flags_loadFlags.c"
        
#line 2177 "Flags_loadFlags.c"
          modelica_integer tmp7;
#line 2178 "Flags_loadFlags.c"

#line 2179 "Flags_loadFlags.c"
          tmpMeta[9] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 2));
#line 2180 "Flags_loadFlags.c"
          tmp7 = mmc_unbox_integer(tmpMeta[9]);
#line 2181 "Flags_loadFlags.c"
          tmpMeta[10] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 3));
#line 2182 "Flags_loadFlags.c"
          tmpMeta[11] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 4));
#line 2183 "Flags_loadFlags.c"
          tmpMeta[12] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 5));
#line 2184 "Flags_loadFlags.c"
          tmpMeta[13] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 6));
#line 2185 "Flags_loadFlags.c"
          tmpMeta[14] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 7));
#line 2186 "Flags_loadFlags.c"
          tmpMeta[15] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 8));
#line 2187 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2188 "Flags_loadFlags.c"
          _index = tmp7;
#line 2189 "Flags_loadFlags.c"
          _name = tmpMeta[10];
#line 758 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[16] = intString((modelica_integer)_index);
#line 758 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _index_str = tmpMeta[16];
#line 759 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[17] = stringAppend(_OMC_LIT650,_name);
#line 759 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[18] = stringAppend(tmpMeta[17],_OMC_LIT651);
#line 759 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[19] = stringAppend(tmpMeta[18],_index_str);
#line 759 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[20] = stringAppend(tmpMeta[19],_OMC_LIT652);
#line 759 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _err_str = tmpMeta[20];
#line 761 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[21] = mmc_mk_cons(_err_str, MMC_REFSTRUCTLIT(mmc_nil));
#line 761 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _Error_addMessage(_OMC_LIT656, tmpMeta[21]);
#line 761 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          /* NORETCALL */;
#line 762 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          MMC_THROW();
#line 2209 "Flags_loadFlags.c"
          tmp5 = 1;
#line 2210 "Flags_loadFlags.c"
          break;
#line 2211 "Flags_loadFlags.c"
        }
#line 2212 "Flags_loadFlags.c"
        }
#line 2213 "Flags_loadFlags.c"
        
#line 2214 "Flags_loadFlags.c"
        MMC_CATCH()
#line 2215 "Flags_loadFlags.c"
      }
#line 2216 "Flags_loadFlags.c"
      
#line 2217 "Flags_loadFlags.c"
      if (!tmp5) MMC_THROW();
#line 2218 "Flags_loadFlags.c"
    }
#line 2219 "Flags_loadFlags.c"
  }
#line 2220 "Flags_loadFlags.c"
  _outFlagIndex = tmp2;
#line 2222 "Flags_loadFlags.c"
  
#line 2223 "Flags_loadFlags.c"
  _return:
#line 2224 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 2225 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 2226 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 2227 "Flags_loadFlags.c"
  /* varOutput varAssign(_outFlagIndex) */ 
#line 2228 "Flags_loadFlags.c"
  tmp1.targ1 = _outFlagIndex;
#line 2229 "Flags_loadFlags.c"
  
#line 2230 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 2231 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2232 "Flags_loadFlags.c"
  
#line 2233 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 2234 "Flags_loadFlags.c"
  return  tmp1;
#line 2235 "Flags_loadFlags.c"
}
#line 2236 "Flags_loadFlags.c"

#line 2237 "Flags_loadFlags.c"

#line 2238 "Flags_loadFlags.c"
Flags_setDefaultConfig_rettypeboxed boxptr_Flags_setDefaultConfig(modelica_metatype _inConfigFlag, modelica_metatype _inConfigData, modelica_metatype _inFlagIndex)
#line 2239 "Flags_loadFlags.c"
{
#line 2240 "Flags_loadFlags.c"
  /* GC: save roots mark when you enter the function */
#line 2241 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("boxptr__Flags_setDefaultConfig");
#line 2242 "Flags_loadFlags.c"

#line 2243 "Flags_loadFlags.c"
  Flags_setDefaultConfig_rettypeboxed tmp1;
#line 2244 "Flags_loadFlags.c"
  Flags_setDefaultConfig_rettype tmp2;
#line 2245 "Flags_loadFlags.c"
  modelica_integer tmp3;
#line 2246 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[1] = {0};
#line 2247 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 1, mmc_GC_local_state, "Array of temporaries");
#line 2248 "Flags_loadFlags.c"
  tmp3 = mmc_unbox_integer(_inFlagIndex);
#line 2249 "Flags_loadFlags.c"
  tmp2 = _Flags_setDefaultConfig(_inConfigFlag, _inConfigData, tmp3);
#line 2250 "Flags_loadFlags.c"
  tmpMeta[0] = mmc_mk_icon(tmp2.Flags_setDefaultConfig_rettype_1);
#line 2251 "Flags_loadFlags.c"
  tmp1.Flags_setDefaultConfig_rettypeboxed_1 = tmpMeta[0];
#line 2252 "Flags_loadFlags.c"
  
#line 2253 "Flags_loadFlags.c"
  /* GC: pop roots mark when you exit the function */
#line 2254 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2255 "Flags_loadFlags.c"
  
#line 2256 "Flags_loadFlags.c"
  return tmp1;
#line 2257 "Flags_loadFlags.c"
}
#line 2258 "Flags_loadFlags.c"
void _Error_addMessage(modelica_metatype _inErrorMsg, modelica_metatype _inMessageTokens)
#line 2259 "Flags_loadFlags.c"
{
#line 2260 "Flags_loadFlags.c"

#line 2261 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 2262 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_Error_addMessage");
#line 2263 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 2264 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inErrorMsg, mmc_GC_local_state, "_inErrorMsg");
#line 2265 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inMessageTokens, mmc_GC_local_state, "_inMessageTokens");
#line 2266 "Flags_loadFlags.c"
  
#line 2267 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 2268 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 2269 "Flags_loadFlags.c"
  modelica_complex tmp1;
#line 2270 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[6] = {0};
#line 2271 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 6, mmc_GC_local_state, "Array of temporaries");
#line 2272 "Flags_loadFlags.c"
  _tailrecursive:
#line 2273 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 2274 "Flags_loadFlags.c"
  
#line 2275 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 2276 "Flags_loadFlags.c"
  
#line 2277 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 2278 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 2281 "Flags_loadFlags.c"
  { /* match expression */
#line 2282 "Flags_loadFlags.c"
    tmpMeta[0+0] = _inErrorMsg;
#line 2283 "Flags_loadFlags.c"
    tmpMeta[0+1] = _inMessageTokens;
#line 2284 "Flags_loadFlags.c"
    {
#line 2285 "Flags_loadFlags.c"
      modelica_metatype _msg_type = NULL; mmc_GC_add_root(&_msg_type, mmc_GC_local_state, "_msg_type");
#line 2286 "Flags_loadFlags.c"
      modelica_metatype _severity = NULL; mmc_GC_add_root(&_severity, mmc_GC_local_state, "_severity");
#line 2287 "Flags_loadFlags.c"
      modelica_metatype _msg = NULL; mmc_GC_add_root(&_msg, mmc_GC_local_state, "_msg");
#line 2288 "Flags_loadFlags.c"
      modelica_integer _error_id;
#line 2289 "Flags_loadFlags.c"
      modelica_metatype _tokens = NULL; mmc_GC_add_root(&_tokens, mmc_GC_local_state, "_tokens");
#line 2290 "Flags_loadFlags.c"
      mmc_switch_type tmp3;
#line 2291 "Flags_loadFlags.c"
      int tmp4;
#line 2292 "Flags_loadFlags.c"
      for (tmp3 = 0, tmp4 = 0; tmp3 < 1 && !tmp4; tmp3++) {
#line 2293 "Flags_loadFlags.c"
        
#line 2294 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp3)) {
#line 2295 "Flags_loadFlags.c"
        case 0: {
#line 2296 "Flags_loadFlags.c"
        
#line 2297 "Flags_loadFlags.c"
          modelica_integer tmp5;
#line 2298 "Flags_loadFlags.c"

#line 2299 "Flags_loadFlags.c"
          tmpMeta[2] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 2));
#line 2300 "Flags_loadFlags.c"
          tmp5 = mmc_unbox_integer(tmpMeta[2]);
#line 2301 "Flags_loadFlags.c"
          tmpMeta[3] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 3));
#line 2302 "Flags_loadFlags.c"
          tmpMeta[4] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 4));
#line 2303 "Flags_loadFlags.c"
          tmpMeta[5] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 5));
#line 2304 "Flags_loadFlags.c"
          
#line 2305 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2306 "Flags_loadFlags.c"
          _error_id = tmp5;
#line 2307 "Flags_loadFlags.c"
          _msg_type = tmpMeta[3];
#line 2308 "Flags_loadFlags.c"
          _severity = tmpMeta[4];
#line 2309 "Flags_loadFlags.c"
          _msg = tmpMeta[5];
#line 2310 "Flags_loadFlags.c"
          _tokens = tmpMeta[0+1];
#line 779 "/d/thesis/OpenModelica/Compiler/Util/Error.mo"
          _ErrorExt_addMessage((modelica_integer)_error_id, _msg_type, _severity, _msg, _tokens);
#line 779 "/d/thesis/OpenModelica/Compiler/Util/Error.mo"
          /* NORETCALL */;
#line 2317 "Flags_loadFlags.c"
          tmp4 = 1;
#line 2318 "Flags_loadFlags.c"
          break;
#line 2319 "Flags_loadFlags.c"
        }
#line 2320 "Flags_loadFlags.c"
        }
#line 2321 "Flags_loadFlags.c"
        
#line 2322 "Flags_loadFlags.c"
      }
#line 2323 "Flags_loadFlags.c"
      
#line 2324 "Flags_loadFlags.c"
      if (!tmp4) MMC_THROW();
#line 2325 "Flags_loadFlags.c"
    }
#line 2326 "Flags_loadFlags.c"
  }
#line 2328 "Flags_loadFlags.c"
  
#line 2329 "Flags_loadFlags.c"
  _return:
#line 2330 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 2331 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 2332 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 2333 "Flags_loadFlags.c"
  
#line 2334 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 2335 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2336 "Flags_loadFlags.c"
  
#line 2337 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 2338 "Flags_loadFlags.c"
  return ;
#line 2339 "Flags_loadFlags.c"
}
#line 2340 "Flags_loadFlags.c"

#line 2341 "Flags_loadFlags.c"

#line 2342 "Flags_loadFlags.c"

#line 2343 "Flags_loadFlags.c"
void _ErrorExt_addMessage(modelica_integer _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens)
#line 2344 "Flags_loadFlags.c"
{
#line 2345 "Flags_loadFlags.c"
  /* functionBodyExternalFunction: varDecls */
#line 2346 "Flags_loadFlags.c"
  int _id_ext;
#line 2347 "Flags_loadFlags.c"
  modelica_metatype _msg_type_ext;
#line 2348 "Flags_loadFlags.c"
  modelica_metatype _msg_severity_ext;
#line 2349 "Flags_loadFlags.c"
  modelica_metatype _msg_tokens_ext;
#line 2350 "Flags_loadFlags.c"
  /* functionBodyExternalFunction: preExp */
#line 2351 "Flags_loadFlags.c"
  /* functionBodyExternalFunction: outputAlloc */
#line 2352 "Flags_loadFlags.c"
  /* functionBodyExternalFunction: callPart */
#line 2353 "Flags_loadFlags.c"
  _id_ext = (int)_id;
#line 2354 "Flags_loadFlags.c"
  _msg_type_ext = (modelica_metatype)_msg_type;
#line 2355 "Flags_loadFlags.c"
  _msg_severity_ext = (modelica_metatype)_msg_severity;
#line 2356 "Flags_loadFlags.c"
  _msg_tokens_ext = (modelica_metatype)_msg_tokens;
#line 2357 "Flags_loadFlags.c"
  Error_addMessage(_id_ext, _msg_type_ext, _msg_severity_ext, MMC_STRINGDATA(_msg), _msg_tokens_ext);
#line 2358 "Flags_loadFlags.c"
  /* functionBodyExternalFunction: return */
#line 2359 "Flags_loadFlags.c"
  return ;
#line 2360 "Flags_loadFlags.c"
}
#line 2361 "Flags_loadFlags.c"

#line 2362 "Flags_loadFlags.c"

#line 2363 "Flags_loadFlags.c"
void boxptr_ErrorExt_addMessage(modelica_metatype _id, modelica_metatype _msg_type, modelica_metatype _msg_severity, modelica_metatype _msg, modelica_metatype _msg_tokens)
#line 2364 "Flags_loadFlags.c"
{
#line 2365 "Flags_loadFlags.c"
  /* GC: save roots mark when you enter the function */
#line 2366 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("boxptr__ErrorExt_addMessage");
#line 2367 "Flags_loadFlags.c"

#line 2368 "Flags_loadFlags.c"
  modelica_integer tmp1;
#line 2369 "Flags_loadFlags.c"
  tmp1 = mmc_unbox_integer(_id);
#line 2370 "Flags_loadFlags.c"
  _ErrorExt_addMessage(tmp1, _msg_type, _msg_severity, _msg, _msg_tokens);
#line 2371 "Flags_loadFlags.c"
  
#line 2372 "Flags_loadFlags.c"
  /* GC: pop roots mark when you exit the function */
#line 2373 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2374 "Flags_loadFlags.c"
  
#line 2375 "Flags_loadFlags.c"
  return ;
#line 2376 "Flags_loadFlags.c"
}
#line 2377 "Flags_loadFlags.c"
List_fold_rettype _List_fold(modelica_metatype _inList, modelica_fnptr inFoldFunc, modelica_metatype _inStartValue)
#line 2378 "Flags_loadFlags.c"
{
#line 2379 "Flags_loadFlags.c"

#line 2380 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 2381 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_List_fold");
#line 2382 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 2383 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inList, mmc_GC_local_state, "_inList");
#line 2384 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inStartValue, mmc_GC_local_state, "_inStartValue");
#line 2385 "Flags_loadFlags.c"
  
#line 2386 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 2387 "Flags_loadFlags.c"
  #define inFoldFunc_rettype_1 targ1
#line 2388 "Flags_loadFlags.c"
  typedef struct inFoldFunc_rettype_s
#line 2389 "Flags_loadFlags.c"
  {
#line 2390 "Flags_loadFlags.c"
    modelica_metatype targ1;
#line 2391 "Flags_loadFlags.c"
  } inFoldFunc_rettype;
#line 2392 "Flags_loadFlags.c"
  inFoldFunc_rettype(*_inFoldFunc)(modelica_metatype, modelica_metatype);
#line 2393 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 2394 "Flags_loadFlags.c"
  List_fold_rettype tmp1;
#line 2395 "Flags_loadFlags.c"
  modelica_metatype _outResult = NULL; mmc_GC_add_root(&_outResult, mmc_GC_local_state, "_outResult");
#line 2396 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[4] = {0};
#line 2397 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 4, mmc_GC_local_state, "Array of temporaries");
#line 2398 "Flags_loadFlags.c"
  _tailrecursive:
#line 2399 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 2400 "Flags_loadFlags.c"
  /* varOutput varInits(_outResult) */ 
#line 2401 "Flags_loadFlags.c"
  
#line 2402 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 2403 "Flags_loadFlags.c"
  
#line 2404 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 2405 "Flags_loadFlags.c"
  _inFoldFunc = (inFoldFunc_rettype(*)(modelica_metatype, modelica_metatype)) inFoldFunc;
#line 2406 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 2409 "Flags_loadFlags.c"
  { /* match expression */
#line 2410 "Flags_loadFlags.c"
    tmpMeta[1+0] = _inList;
#line 2411 "Flags_loadFlags.c"
    {
#line 2412 "Flags_loadFlags.c"
      modelica_metatype _e = NULL; mmc_GC_add_root(&_e, mmc_GC_local_state, "_e");
#line 2413 "Flags_loadFlags.c"
      modelica_metatype _rest = NULL; mmc_GC_add_root(&_rest, mmc_GC_local_state, "_rest");
#line 2414 "Flags_loadFlags.c"
      modelica_metatype _arg = NULL; mmc_GC_add_root(&_arg, mmc_GC_local_state, "_arg");
#line 2415 "Flags_loadFlags.c"
      mmc_switch_type tmp3;
#line 2416 "Flags_loadFlags.c"
      int tmp4;
#line 2417 "Flags_loadFlags.c"
      for (tmp3 = 0, tmp4 = 0; tmp3 < 2 && !tmp4; tmp3++) {
#line 2418 "Flags_loadFlags.c"
        
#line 2419 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp3)) {
#line 2420 "Flags_loadFlags.c"
        case 0: {
#line 2421 "Flags_loadFlags.c"
        
#line 2422 "Flags_loadFlags.c"

#line 2423 "Flags_loadFlags.c"
          if (!listEmpty(tmpMeta[1+0])) break;
#line 2424 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 3922 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          tmpMeta[0] = _inStartValue;
#line 2428 "Flags_loadFlags.c"
          tmp4 = 1;
#line 2429 "Flags_loadFlags.c"
          break;
#line 2430 "Flags_loadFlags.c"
        }
#line 2431 "Flags_loadFlags.c"
        case 1: {
#line 2432 "Flags_loadFlags.c"
        
#line 2433 "Flags_loadFlags.c"
          inFoldFunc_rettype tmp5;
#line 2434 "Flags_loadFlags.c"

#line 2435 "Flags_loadFlags.c"
          if (listEmpty(tmpMeta[1+0])) break;
#line 2436 "Flags_loadFlags.c"
          tmpMeta[2] = MMC_CAR(tmpMeta[1+0]);
#line 2437 "Flags_loadFlags.c"
          tmpMeta[3] = MMC_CDR(tmpMeta[1+0]);
#line 2438 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2439 "Flags_loadFlags.c"
          _e = tmpMeta[2];
#line 2440 "Flags_loadFlags.c"
          _rest = tmpMeta[3];
#line 3926 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          tmp5 = _inFoldFunc(_e, _inStartValue);
#line 3926 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _arg = tmp5.inFoldFunc_rettype_1;
#line 3927 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          /* Tail recursive call List.fold(rest,inFoldFunc,arg) */
#line 3927 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _inList = _rest;
#line 3927 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          _inStartValue = _arg;
#line 3927 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          goto _tailrecursive;
#line 3927 "/d/thesis/OpenModelica/Compiler/Util/List.mo"
          /* TODO: Make sure any eventual dead code below is never generated */
#line 2452 "Flags_loadFlags.c"
          tmp4 = 1;
#line 2453 "Flags_loadFlags.c"
          break;
#line 2454 "Flags_loadFlags.c"
        }
#line 2455 "Flags_loadFlags.c"
        }
#line 2456 "Flags_loadFlags.c"
        
#line 2457 "Flags_loadFlags.c"
      }
#line 2458 "Flags_loadFlags.c"
      
#line 2459 "Flags_loadFlags.c"
      if (!tmp4) MMC_THROW();
#line 2460 "Flags_loadFlags.c"
    }
#line 2461 "Flags_loadFlags.c"
  }
#line 2462 "Flags_loadFlags.c"
  _outResult = tmpMeta[0];
#line 2464 "Flags_loadFlags.c"
  
#line 2465 "Flags_loadFlags.c"
  _return:
#line 2466 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 2467 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 2468 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 2469 "Flags_loadFlags.c"
  /* varOutput varAssign(_outResult) */ 
#line 2470 "Flags_loadFlags.c"
  tmp1.targ1 = _outResult;
#line 2471 "Flags_loadFlags.c"
  
#line 2472 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 2473 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2474 "Flags_loadFlags.c"
  
#line 2475 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 2476 "Flags_loadFlags.c"
  return  tmp1;
#line 2477 "Flags_loadFlags.c"
}
#line 2478 "Flags_loadFlags.c"

#line 2479 "Flags_loadFlags.c"

#line 2480 "Flags_loadFlags.c"

#line 2481 "Flags_loadFlags.c"
Flags_checkDebugFlag_rettype _Flags_checkDebugFlag(modelica_metatype _inDebugFlag, modelica_integer _inFlagIndex)
#line 2482 "Flags_loadFlags.c"
{
#line 2483 "Flags_loadFlags.c"

#line 2484 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: save roots mark when you enter the function */
#line 2485 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("_Flags_checkDebugFlag");
#line 2486 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: GC: adding inputs as roots! */
#line 2487 "Flags_loadFlags.c"
  mmc_GC_add_root(&_inDebugFlag, mmc_GC_local_state, "_inDebugFlag");
#line 2488 "Flags_loadFlags.c"
  
#line 2489 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: arguments */
#line 2490 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: locals */
#line 2491 "Flags_loadFlags.c"
  Flags_checkDebugFlag_rettype tmp1;
#line 2492 "Flags_loadFlags.c"
  modelica_integer _outNextFlagIndex;
#line 2493 "Flags_loadFlags.c"
  modelica_integer tmp2;
#line 2494 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[13] = {0};
#line 2495 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 13, mmc_GC_local_state, "Array of temporaries");
#line 2496 "Flags_loadFlags.c"
  _tailrecursive:
#line 2497 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out inits */
#line 2498 "Flags_loadFlags.c"
  /* varOutput varInits(_outNextFlagIndex) */ 
#line 2499 "Flags_loadFlags.c"
  
#line 2500 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state in */
#line 2501 "Flags_loadFlags.c"
  
#line 2502 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: var inits */
#line 2503 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: body */
#line 2506 "Flags_loadFlags.c"
  { /* matchcontinue expression */
#line 2507 "Flags_loadFlags.c"
    tmpMeta[0+0] = _inDebugFlag;
#line 2508 "Flags_loadFlags.c"
    {
#line 2509 "Flags_loadFlags.c"
      modelica_integer _index;
#line 2510 "Flags_loadFlags.c"
      modelica_metatype _name = NULL; mmc_GC_add_root(&_name, mmc_GC_local_state, "_name");
#line 2511 "Flags_loadFlags.c"
      modelica_metatype _index_str = NULL; mmc_GC_add_root(&_index_str, mmc_GC_local_state, "_index_str");
#line 2512 "Flags_loadFlags.c"
      modelica_metatype _err_str = NULL; mmc_GC_add_root(&_err_str, mmc_GC_local_state, "_err_str");
#line 2513 "Flags_loadFlags.c"
      mmc_switch_type tmp4;
#line 2514 "Flags_loadFlags.c"
      int tmp5;
#line 2515 "Flags_loadFlags.c"
      for (tmp4 = 0, tmp5 = 0; tmp4 < 2 && !tmp5; tmp4++) {
#line 2516 "Flags_loadFlags.c"
        MMC_TRY()
#line 2517 "Flags_loadFlags.c"
        
#line 2518 "Flags_loadFlags.c"
        switch (MMC_SWITCH_CAST(tmp4)) {
#line 2519 "Flags_loadFlags.c"
        case 0: {
#line 2520 "Flags_loadFlags.c"
        
#line 2521 "Flags_loadFlags.c"
          modelica_integer tmp6;
#line 2522 "Flags_loadFlags.c"

#line 2523 "Flags_loadFlags.c"
          tmpMeta[1] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 2));
#line 2524 "Flags_loadFlags.c"
          tmp6 = mmc_unbox_integer(tmpMeta[1]);
#line 2525 "Flags_loadFlags.c"
          tmpMeta[2] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 3));
#line 2526 "Flags_loadFlags.c"
          tmpMeta[3] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 4));
#line 2527 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2528 "Flags_loadFlags.c"
          _index = tmp6;
#line 720 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          /* Pattern-matching assignment */
#line 720 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          if (1 != ((modelica_integer)_index == (modelica_integer)_inFlagIndex)) MMC_THROW();
#line 721 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmp2 = ((modelica_integer) 1 + (modelica_integer)_inFlagIndex);
#line 2536 "Flags_loadFlags.c"
          tmp5 = 1;
#line 2537 "Flags_loadFlags.c"
          break;
#line 2538 "Flags_loadFlags.c"
        }
#line 2539 "Flags_loadFlags.c"
        case 1: {
#line 2540 "Flags_loadFlags.c"
        
#line 2541 "Flags_loadFlags.c"
          modelica_integer tmp7;
#line 2542 "Flags_loadFlags.c"

#line 2543 "Flags_loadFlags.c"
          tmpMeta[4] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 2));
#line 2544 "Flags_loadFlags.c"
          tmp7 = mmc_unbox_integer(tmpMeta[4]);
#line 2545 "Flags_loadFlags.c"
          tmpMeta[5] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 3));
#line 2546 "Flags_loadFlags.c"
          tmpMeta[6] = MMC_FETCH(MMC_OFFSET(MMC_UNTAGPTR(tmpMeta[0+0]), 4));
#line 2547 "Flags_loadFlags.c"
          /* Pattern matching succeeded */
#line 2548 "Flags_loadFlags.c"
          _index = tmp7;
#line 2549 "Flags_loadFlags.c"
          _name = tmpMeta[5];
#line 726 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[7] = intString((modelica_integer)_index);
#line 726 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _index_str = tmpMeta[7];
#line 727 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[8] = stringAppend(_OMC_LIT650,_name);
#line 727 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[9] = stringAppend(tmpMeta[8],_OMC_LIT651);
#line 727 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[10] = stringAppend(tmpMeta[9],_index_str);
#line 727 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[11] = stringAppend(tmpMeta[10],_OMC_LIT657);
#line 727 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _err_str = tmpMeta[11];
#line 729 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          tmpMeta[12] = mmc_mk_cons(_err_str, MMC_REFSTRUCTLIT(mmc_nil));
#line 729 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          _Error_addMessage(_OMC_LIT656, tmpMeta[12]);
#line 729 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          /* NORETCALL */;
#line 730 "/d/thesis/OpenModelica/Compiler/Util/Flags.mo"
          MMC_THROW();
#line 2569 "Flags_loadFlags.c"
          tmp5 = 1;
#line 2570 "Flags_loadFlags.c"
          break;
#line 2571 "Flags_loadFlags.c"
        }
#line 2572 "Flags_loadFlags.c"
        }
#line 2573 "Flags_loadFlags.c"
        
#line 2574 "Flags_loadFlags.c"
        MMC_CATCH()
#line 2575 "Flags_loadFlags.c"
      }
#line 2576 "Flags_loadFlags.c"
      
#line 2577 "Flags_loadFlags.c"
      if (!tmp5) MMC_THROW();
#line 2578 "Flags_loadFlags.c"
    }
#line 2579 "Flags_loadFlags.c"
  }
#line 2580 "Flags_loadFlags.c"
  _outNextFlagIndex = tmp2;
#line 2582 "Flags_loadFlags.c"
  
#line 2583 "Flags_loadFlags.c"
  _return:
#line 2584 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var copy */
#line 2585 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: state out */
#line 2586 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: out var assign */
#line 2587 "Flags_loadFlags.c"
  /* varOutput varAssign(_outNextFlagIndex) */ 
#line 2588 "Flags_loadFlags.c"
  tmp1.targ1 = _outNextFlagIndex;
#line 2589 "Flags_loadFlags.c"
  
#line 2590 "Flags_loadFlags.c"
  /* GC: pop the mark! */
#line 2591 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2592 "Flags_loadFlags.c"
  
#line 2593 "Flags_loadFlags.c"
  /* functionBodyRegularFunction: return the outs */
#line 2594 "Flags_loadFlags.c"
  return  tmp1;
#line 2595 "Flags_loadFlags.c"
}
#line 2596 "Flags_loadFlags.c"

#line 2597 "Flags_loadFlags.c"

#line 2598 "Flags_loadFlags.c"
Flags_checkDebugFlag_rettypeboxed boxptr_Flags_checkDebugFlag(modelica_metatype _inDebugFlag, modelica_metatype _inFlagIndex)
#line 2599 "Flags_loadFlags.c"
{
#line 2600 "Flags_loadFlags.c"
  /* GC: save roots mark when you enter the function */
#line 2601 "Flags_loadFlags.c"
  mmc_GC_local_state_type mmc_GC_local_state = mmc_GC_save_roots_state("boxptr__Flags_checkDebugFlag");
#line 2602 "Flags_loadFlags.c"

#line 2603 "Flags_loadFlags.c"
  Flags_checkDebugFlag_rettypeboxed tmp1;
#line 2604 "Flags_loadFlags.c"
  Flags_checkDebugFlag_rettype tmp2;
#line 2605 "Flags_loadFlags.c"
  modelica_integer tmp3;
#line 2606 "Flags_loadFlags.c"
  modelica_metatype tmpMeta[1] = {0};
#line 2607 "Flags_loadFlags.c"
  mmc_GC_add_roots(tmpMeta, 1, mmc_GC_local_state, "Array of temporaries");
#line 2608 "Flags_loadFlags.c"
  tmp3 = mmc_unbox_integer(_inFlagIndex);
#line 2609 "Flags_loadFlags.c"
  tmp2 = _Flags_checkDebugFlag(_inDebugFlag, tmp3);
#line 2610 "Flags_loadFlags.c"
  tmpMeta[0] = mmc_mk_icon(tmp2.Flags_checkDebugFlag_rettype_1);
#line 2611 "Flags_loadFlags.c"
  tmp1.Flags_checkDebugFlag_rettypeboxed_1 = tmpMeta[0];
#line 2612 "Flags_loadFlags.c"
  
#line 2613 "Flags_loadFlags.c"
  /* GC: pop roots mark when you exit the function */
#line 2614 "Flags_loadFlags.c"
  mmc_GC_undo_roots_state(mmc_GC_local_state);
#line 2615 "Flags_loadFlags.c"
  
#line 2616 "Flags_loadFlags.c"
  return tmp1;
#line 2617 "Flags_loadFlags.c"
}