\#ifndef ${header_name_without_h_uppercase}_H
\#define ${header_name_without_h_uppercase}_H

/*****************************************************************************
 *                                                                           *
 * ---------------------------- Public Interface --------------------------- *
 *                                                                           *
 *****************************************************************************/

/*
A pointer to an incomplete type (hides the implementation details).
*/
typedef struct ${struct_name}* ${struct_name}Ptr;

${struct_name}Ptr create${struct_name}(${Arguments});

void destroy${struct_name}(${struct_name}Ptr ${struct_name.lower()});

#endif       /* ${header_name_without_h_uppercase}_H */
