%{
    #include<bits/stdc++.h>
    using namespace std;
    void yyerror(string);
    int yylex(void);
    char mytext[100];
    char var[100];
    int num = 0;
    extern char* yytext;
    extern int yylineno;
%}

%union
{
    int intvalue;
    float floatvalue;
    char stringvalue[256];
}

%token <intvalue> INT_VALUE
%token <floatvalue> FLOAT_VALUE
%token <stringvalue> STRING_VALUE VARIABLE
%token INT CHAR FLOAT VOID
%token WHILE FOR PRINT RETURN IF ELSE
%token LBRACE RBRACE LBRACKET RBRACKET LPAREN RPAREN
%token SEMICOLON COMMA ASSIGN
%token PLUS MINUS MULT DIV EXPONENT
%token EQ NEQ LT LEQ GT GEQ

%left EQ NEQ
%left LT LEQ GT GEQ

%right ASSIGN

%left PLUS MINUS
%left MULT DIV
%right EXPONENT

%precedence ELSE


%%
program:
    lines
    {

    }
;
lines:
    lines statement
    {

    }
    |statement
    {

    }
;
type:
    INT
    {

    }
    |CHAR
    {

    }
    |FLOAT
    {

    }
    |VOID 
    {

    }
;
arguments_type:
    arguments_type COMMA parameter
    {

    }
    |parameter
    {

    }
    | 
    {

    }
;
parameter:
    type VARIABLE
    {

    }
    | type VARIABLE LBRACKET RBRACKET
    {

    }
;
compound_statement:
    LBRACE local_declarations RBRACE
    {

    }
    |
    {

    }
;
local_declarations:
    local_declarations statement
    {

    }
    |
    {

    }
;

statement:
    type VARIABLE SEMICOLON
    {

    }
    |type VARIABLE LPAREN arguments_type RPAREN compound_statement
    {

    }
    |
    expression_statement
    {

    }
    | compound_statement
    {

    }
    | conditional_statement
    {

    }
    | iteration_statement
    {

    }
    | return_statement
    {

    }
    | printf_statement
    {

    }
;
expression_statement:
    expression SEMICOLON
    {

    }
    | SEMICOLON
    {

    }
;
conditional_statement:
    IF LPAREN expression RPAREN statement
    {

    }
    |IF LPAREN expression RPAREN statement ELSE statement
    {

    }
;
iteration_statement:
    WHILE LPAREN expression RPAREN statement
    {

    }
    | FOR LPAREN expression_statement expression_statement expression RPAREN statement
    {

    }
;
return_statement:
    RETURN expression SEMICOLON
    {

    }
    | RETURN SEMICOLON
    {

    }
;
printf_statement:
    PRINT LPAREN STRING_VALUE RPAREN SEMICOLON
    {

    }
    |
    PRINT LPAREN STRING_VALUE COMMA VARIABLE RPAREN SEMICOLON
    {

    }
    |
    PRINT LPAREN INT_VALUE RPAREN SEMICOLON
    {

    }
;
expression:
    VARIABLE ASSIGN expression
    {

    }
    | expression PLUS expression
    {

    }
    | expression MINUS expression
    {

    }
    | expression MULT expression
    {

    }
    | expression DIV expression
    {

    }
    | expression EXPONENT expression
    {

    }
    | expression GT expression
    {

    }
    | expression LT expression
    {

    }
    | expression GEQ expression
    {

    }
    | expression LEQ expression
    {

    }
    |expression EQ expression
    {

    }
    | expression NEQ expression
    {

    }
    | INT_VALUE
    {

    }
    | FLOAT_VALUE
    {

    }
    | VARIABLE
    {

    }
    |expression1
    {

    }
;

expression1:
 LPAREN expression RPAREN
 {

 }
 ;

%%

void yyerror(string s)
{
   cerr<<s<<" "<<yylineno<<endl;
   exit(0);
}

int main(void)
{
    yylineno = 1;
    return yyparse();
}
