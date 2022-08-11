//
// Created by ivan on 27/10/17.
//

#ifndef CPPPONTO2D_PONTO2D_H
#define CPPPONTO2D_PONTO2D_H


#include <ostream>

class Ponto2d
{

private:
    float _x;
    float _y;

public:
    Ponto2d (float _x, float _y);

    Ponto2d();

    float get_y  () const;

    void  set_y  (float _y);

    float get_x  () const;

    void  set_x  (float _x);

    Ponto2d operator+ (Ponto2d ponto);

public:
    friend std::ostream &operator<< (std::ostream &os, const Ponto2d &d);
};


#endif //CPPPONTO2D_PONTO2D_H
