#include <iostream>
#include "Ponto2d.h"

int main()
{
    Ponto2d A (2, 4);
    Ponto2d B;

    B.set_x (3);
    B.set_y (4);

    std::cout << "A     : " << A << "\n";
    std::cout << "B     : " << B << "\n";
    std::cout << "A + B : " << A+B << "\n";

    return 0;
}