%{
#include <stdio.h>
#include <string.h>
%}

%%
[ \t]    { printf("%s",yytext);}  // Pasar espacios en blanco y tabulaciones sin procesar
\n       { printf("%s",yytext); } // Mantener saltos de línea
[^a-zA-Z0-9_]ps[^a-zA-Z0-9_]    { printf("public static "); }
[^a-zA-Z0-9_]pv[^a-zA-Z0-9_]    { printf("public void "); }
[^a-zA-Z0-9_]pc[^a-zA-Z0-9_]    { printf("public class "); }
[^a-zA-Z0-9_]psv[^a-zA-Z0-9_]   { printf("public static void "); }
[^a-zA-Z0-9_]pri[^a-zA-Z0-9_]   { printf("System.out.println "); }
[^a-zA-Z0-9_]i[^a-zA-Z0-9_]     { printf("if "); }
[^a-zA-Z0-9_]f[^a-zA-Z0-9_]     { printf("for "); }
[^a-zA-Z0-9_]w[^a-zA-Z0-9_]     { printf("while "); }
[^a-zA-Z0-9_]e[^a-zA-Z0-9_]     { printf("else "); }
[^a-zA-Z0-9_]el[^a-zA-Z0-9_]    { printf("else if "); }
[^a-zA-Z0-9_]r[^a-zA-Z0-9_]     { printf("return "); }
.                               { printf("%s",yytext);} // Pasar cualquier otro carácter sin procesar
%%

int main() {
    yylex();
    return 0;
}