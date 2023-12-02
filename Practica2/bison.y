%{
  #include <stdio.h>
  #include <stdlib.h>
  extern int yylex();
  int yyerror(char *s);
  int count_ab = 0;
  int count_cd = 0;
%}

%token a
%token b
%token c
%token d

%%

start: seq 
     | error 

seq: 
   | seq ab
   | seq cd
   ;

ab: a b { count_ab++; }
    ;

cd: c d { count_cd++; }
  ;

%%

int yyerror(char *s) {
  exit(EXIT_FAILURE);
}

int main(int argc, char **argv) {
  yyparse();
  if (count_ab == count_cd){
      fprintf(stdout, "Si pertenece\n");
  }
  else{
      fprintf(stdout, "No pertenece\n");
  }
}
