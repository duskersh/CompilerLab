%{
#include<stdio.h>
void yyerror(char*);
extern char* yytext;
char temp = 'A';
char *p="A";
extern FILE *yyin;
extern FILE *yyout;
%}
%union
{
char *str;
}

%token NUM NL
%type<str> S E
%left '+' '-'
%left '*' '/'
%right '^'
%nonassoc UMINUS
%%
S : E {fprintf(yyout," \n\tx = %c\n",--temp);temp='A';return 1;}
;
E : NUM {}
| E '+' E {fprintf(yyout,"\n %c = %s + %s ",temp++,$1,$3);$$=p;}
| E '-' E {fprintf(yyout,"\n %c = %s – %s ",temp++,$1,$3);$$=p;}
| E '*' E {fprintf(yyout,"\n %c = %s * %s ",temp++,$1,$3);$$=p;}
| E '/' E {fprintf(yyout,"\n %c = %s / %s ",temp++,$1,$3);$$=p;}
| E '^' E {fprintf(yyout,"\n %c = %s ^ %s ",temp++,$1,$3);$$=p;}
| '(' E ')' {$$=p;}
| '-' E %prec UMINUS {p++;fprintf(yyout,"\n %c = - %s",temp++,$2);$$=p;}
;
%%

void yyerror(char* st){
	printf("error: %s\n",st);
}

int main(void)
{
  yyin = fopen("3din.txt","r");
  yyout = fopen("3dout.txt","w");
  int i=4;
  while(i--)
  {
   yyparse();
  }
  fclose(yyin);
  return(0);
}


