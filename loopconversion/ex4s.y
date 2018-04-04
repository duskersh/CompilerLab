%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern FILE* yyin;
extern FILE* yyout;
%}
%token IF ELSE STMT CND WH FOR
%start s
%type<str> IF
%type<str> ELSE
%type<str> STMT
%type<str> CND
%type<str> WH
%type<str> FOR
%%

s:
	condStmt '$' { /*printf("return 1\n");*/{fprintf(yyout,"\n THIS IS WHILE LOOP");}return 1;}
	;
condStmt:
	
	 FOR '(' CND ')' '{' stmt '}' { }
	;
stmt:
	STMT //{printf("stmt\n");}
	|condStmt
	;
%% 
void yyerror(char* s){
	printf("%s",s);
}
int main(){
	yyin = fopen("sam4.txt","r");
	yyout = fopen("sam4out.txt","w");
	yyparse();
	fclose(yyin);
	return 0;
}
