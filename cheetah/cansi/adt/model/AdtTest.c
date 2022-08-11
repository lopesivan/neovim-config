\#include <stdio.h>
\#include <stdlib.h>

\#include "${AdtHeader}"


int main(int argc, char *argv[])
{
    ${struct_name}Ptr ${struct_name.lower()}_ptr;

    ${struct_name.lower()}_ptr = create${struct_name}(/*${Arguments}*/);

    destroy${struct_name}(${struct_name.lower()}_ptr);

    return EXIT_SUCCESS;

}
