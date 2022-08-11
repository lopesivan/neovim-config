#include <stdio.h>
#include <stdlib.h>

#include "array.h"


int main(int argc, char *argv[])
{
    ArrayPtr array_ptr;

    array_ptr = createArray(/*size_t size*/);

    destroyArray(array_ptr);

    return EXIT_SUCCESS;

}
