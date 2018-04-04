%{
#include<stdio.h>
#include "y.tab.h"
%}
%%
[0-9]+  { yylval.str=strdup(yytext);return NUM;}
[\n\t]  {return 0;}
.       {return yytext[0];}
[$]     {return *yytext;}
%% 
int yywrap (void)  
{return 1;} 

