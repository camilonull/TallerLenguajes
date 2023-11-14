%{
    #include <stdio.h>
    #include <string.h>
    #include "parser.tab.h"
%}

date [0-9]{4}-[0-9]{2}-[0-9]{2}T[0-9]{2}:[0-9]{2}:[0-9]{2}

text [A-Za-z]{2}

%%

{date} {
    // Realiza las manipulaciones necesarias en la cadena DATE
    char* originalDate = strdup(yytext);
    int i = 0, j = 0;
    char formattedDate[16];  // 20 caracteres + 1 para el carácter nulo

    formattedDate[0] = '\0'; // Inicializa la cadena vacía

    while (originalDate[i]) {
    if (originalDate[i] != ':' && originalDate[i] != '-') {
        formattedDate[j++] = originalDate[i];  // Usar j++ para copiar e incrementar el índice
    }
    i++;
    }
    formattedDate[j] = 'Z';  // Agrega 'Z' al final de la cadena
    yylval.str = formattedDate;
    printf("%s",formattedDate);  // Asigna la cadena formateada a yylval
    return DATE;
}


[\n]    {return EOL;}


%%

int yywrap() {
    return 1;
}
