\#include <stdio.h>
\#include <stdlib.h>

\#include "${AdtHeader}"

struct ${struct_name}{
    #for b in $struct_body:
    ${b};
	#end for
};

${struct_name}Ptr create${struct_name}(${Arguments})
{
    ${struct_name}Ptr ${struct_name.lower()} = malloc(sizeof *${struct_name.lower()});

    if is_null(${struct_name.lower()}) {
        printf("%s:In function `%s':\n" "%s:%d: %s\n", \
           __FILE__, __FUNCTION__, __FILE__, __LINE__, \
           "could not allocate the ${struct_name} pointer"
        );

        exit(EXIT_FAILURE);
    }


    return ${struct_name.lower()};

}

void destroy${struct_name}(${struct_name}Ptr ${struct_name.lower()})
{
    free(${struct_name.lower()});

    return;

}