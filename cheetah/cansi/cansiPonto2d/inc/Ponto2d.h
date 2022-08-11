//
// Created by ivan on 26/10/17.
//

#ifndef CANSIPONTO2D_PONTO2D_H
#define CANSIPONTO2D_PONTO2D_H

typedef struct Ponto2d_t *Ponto2d;

/* Criação/Destruição */
Ponto2d ponto_novo    (float x, float y);
void    ponto_remove  (Ponto2d ponto);

/* operação */
Ponto2d ponto_soma    (Ponto2d ponto1,Ponto2d ponto2);

/* impressão */
void    ponto_imprime (Ponto2d ponto);

/* get/set */
void    ponto_set     (Ponto2d ponto, float x, float y);
float   ponto_get_x   (Ponto2d ponto);
float   ponto_get_y   (Ponto2d ponto);

void ponto_imprime (Ponto2d ponto);

#endif //CANSIPONTO2D_PONTO2D_H
