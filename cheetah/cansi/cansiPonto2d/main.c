#include <stdio.h>
#include "Ponto2d.h"

int main()
{

    printf ("%s\n", "início ===================");

    Ponto2d A = ponto_novo (2, 5);
    Ponto2d B = ponto_novo (1, 8);

    Ponto2d C = ponto_soma (A, B);

    ponto_imprime (A);
    ponto_imprime (B);
    ponto_imprime (C);

    printf ("%s\n","Mudando o ponto A:");
    ponto_set (A, 12, 5.8);
    ponto_imprime (A);


    ponto_remove (A);
    ponto_remove (B);
    ponto_remove (C);

    printf ("%s\n", "Fim    ===================");

    return 0;
}