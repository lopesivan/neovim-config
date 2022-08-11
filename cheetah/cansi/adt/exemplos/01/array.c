#include <stdio.h>
#include <stdlib.h>

#include "array.h"

struct Array{
    size_t    size;
    float     **data;
};

ArrayPtr createArray(size_t size)
{
    ArrayPtr array = malloc(sizeof *array);

    if is_null(array) {
        printf("%s:In function `%s':\n" "%s:%d: %s\n", \
           __FILE__, __FUNCTION__, __FILE__, __LINE__, \
           "could not allocate the Array pointer"
        );

        exit(EXIT_FAILURE);
    }


    return array;

}

void destroyArray(ArrayPtr array)
{
    free(array);

    return;

}