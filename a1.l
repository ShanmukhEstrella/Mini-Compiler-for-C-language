%{
    #include <stdlib.h>
    #include<bits/stdc++.h>
    using namespace std;
	#include "a1.tab.h"
	void yyerror(string);
	extern char mytext[];
    extern int yylineno;  // Declare yylineno as an external variable
%}

%%
int           { return INT; }
char          { return CHAR; }
float         { return FLOAT; }
void          { return VOID; }
return        { return RETURN; }
if            { return IF; }
else          { return ELSE; }
while         { return WHILE; }
for           { return FOR; }
printf        { return PRINT; }
[0-9]+"."[0-9][0-9]*  { yylval.floatvalue = atof(yytext); return FLOAT_VALUE; }
[0-9]+          { yylval.intvalue = atoi(yytext); return INT_VALUE; }
\"[^\"]*\"      { strcpy(yylval.stringvalue, yytext); return STRING_VALUE; }
[a-zA-Z_][a-zA-Z0-9_]*  { return VARIABLE; }
";"             { return SEMICOLON; }
","             { return COMMA; }
"=="            { return EQ; }
"="             { return ASSIGN; }
"["             { return LBRACKET; }
"]"             { return RBRACKET; }
"{"             { return LBRACE; }
"}"             { return RBRACE; }
"("             { return LPAREN; }
")"             { return RPAREN; }
"+"             { return PLUS; }
"-"             { return MINUS; }
"**"            { return EXPONENT; }
"*"             { return MULT; }
"/"             { return DIV; }
"!="            { return NEQ; }
"<="            { return LEQ; }
">="            { return GEQ; }
"<"             { return LT; }
">"             { return GT; }
[ \t\r]+        { /* Ignore whitespace */ }
\n              { yylineno++; /* Increment line number */ }
.               { cout << *yytext << endl; yyerror("Error"); }
%%

int yywrap()
{
    return 1;
}
