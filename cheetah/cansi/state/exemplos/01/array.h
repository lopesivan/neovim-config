#ifndef ARRAY_H
#define ARRAY_H

/*****************************************************************************
 *                                                                           *
 * ---------------------------- Public Interface --------------------------- *
 *                                                                           *
 *****************************************************************************/

/*
A pointer to an incomplete type (hides the implementation details).
*/
typedef struct Array* ArrayPtr;

ArrayPtr createArray(size_t size);

void destroyArray(ArrayPtr array);

#endif       /* ARRAY_H */
