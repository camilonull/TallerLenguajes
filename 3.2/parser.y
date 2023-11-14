%{
    #include <stdio.h>
    extern int yylex(void);
    void yyerror(char *s);
    extern char *yytext;
    #include <stdlib.h>
    #include <string.h>
%}

%union {
    char* str;
}

%token <str> DATE
%token <str> TEXT
%token EOL

%%

input: 
    lines;

lines:
    lines line
    |
    line;

line:
    DATE EOL {
        printf("\n");
    }


%%

int main() {
    yyparse();
    return 0;
}


void yyerror(char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

