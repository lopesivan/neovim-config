//
// Created by ivan on 26/10/17.
//

#include <stdlib.h>
#include <stdio.h>

#include "Ponto2d.h"

struct Ponto2d_t
{
    float x;
    float y;

};

Ponto2d ponto_novo (float x, float y)
{

    Ponto2d ponto = malloc (sizeof *ponto);

    if (ponto == NULL)
    {
        printf ("%s:In function `%s':\n" "%s:%d: %s\n", \
                __FILE__, __FUNCTION__, __FILE__, __LINE__, \
                "could not allocate the Array pointer"
               );

        exit (EXIT_FAILURE);
    }

    ponto->x = x;
    ponto->y = y;

    return ponto;

}


void ponto_remove (Ponto2d ponto)
{
    free (ponto);
}

Ponto2d ponto_soma (Ponto2d ponto1, Ponto2d ponto2)
{

    float x = ponto1->x + ponto2->x;
    float y = ponto1->y + ponto2->y;


    return ponto_novo (x, y);
}

void ponto_imprime (Ponto2d ponto)
{

    /* apenas como exemplo:
     * printf("(X,Y) = (%05.2f, %05.2f)\n", ponto->x, ponto->y);
     */
    printf ("(X,Y) = (%-6.3f, %6.3f)\n", ponto_get_x (ponto),
            ponto_get_y (ponto));
}

void ponto_set (Ponto2d ponto, float x, float y)
{

    ponto->x = x;
    ponto->y = y;
}

float ponto_get_x (Ponto2d ponto)
{
    return ponto->x;
}

float ponto_get_y (Ponto2d ponto)
{
    return ponto->y;
}
