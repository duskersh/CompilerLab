%{
	#include<stdio.h>
	#include"y.tab.h"
	char *prev = "";
%}
IDENTIFIER [a-zA-Z][a-zA-Z0-9_]* 
CONSTANT [0-9]+
%%
"c"		{
			
			fprintf(yyout,"%s",prev);
			prev = strdup(yytext);
			return CND;
		}
"if"		{
			
			fprintf(yyout,"%s",prev);
			prev = strdup(yytext);
			return IF;
		}
"else"	        {
			 
			fprintf(yyout,"%s",prev);
			prev = strdup(yytext);
			return ELSE;
		}
s[0-9]		{
			yylval.str = strdup (yytext);
              
			fprintf(yyout,"%s",prev);
			prev = strdup(yytext);			
			return STMT;
		}
";" 		{
			ECHO;			
			return *yytext;
		}

[(){}]	{
			//ECHO;
			fprintf(yyout,"%s",prev);
			prev = strdup(yytext);
			return *yytext;
		}
[ \n\t]     ;
[$]		{
			fprintf(yyout,"%s",prev);			
			return *yytext;
		}		
.		{ 
			printf("Invalid character!");
		}
%%
int yywrap(void){
	return 1;
}

