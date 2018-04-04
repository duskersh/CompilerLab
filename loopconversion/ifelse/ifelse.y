%{
#include<stdio.h>
void yyerror(char*);
int yylex(void);
extern char* prev;
extern FILE* yyin;
extern FILE* yyout;
%}
%token IF ELSE STMT CND
%start s
%union{
	long l;
	char* str;
	int i;
};
%type<str> IF
%type<str> ELSE
%type<str> STMT
%type<str> CND
%%
s:
	condStmt '$' { return 1;}
	;
condStmt:
	ifelse condStmt	 {
				//printf(" Valid ifelse stmt\n");
			}
	| if condStmt  {
				//printf("ELSE{;}\n");
			}
	|
	;
ifelse:
	IF '(' CND ')' '{' stmt '}' ELSE '{' stmt '}'  //{printf("ifelse stmt\n");}
	;
if:
	 IF '(' CND ')' '{' stmt '}' {fprintf(yyout,"else{...}");}
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
	yyin = fopen("kin.txt","r");
	yyout = fopen("kout.txt","w");
	int i = 3 ;	
	while(i--){
		yyparse();
		fprintf(yyout,"\n");
		prev="";
	}
	fclose(yyin);
	return 0;
}
