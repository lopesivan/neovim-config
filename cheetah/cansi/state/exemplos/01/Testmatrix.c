#include <stdio.h>
#include <stdlib.h>

#include "matrix.h"


int main(int argc, char *argv[])
{
    MatrixPtr matrix_ptr;

    matrix_ptr = createMatrix(/*size_t rows, size_t columns*/);

    destroyMatrix(matrix_ptr);

    return EXIT_SUCCESS;

}
