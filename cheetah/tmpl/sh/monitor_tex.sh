#!/usr/bin/env bash


# Rebuild if any git tracked file changes.
build(){
    inotifywait --event close_write --monitor --recursive . |
        while read -r directory events filename; do
            if [[ "$filename" =~ .*\.tex$ ]]; then # Does the file end with .tex?
                echo "$action: $file"
                echo `tput bold setb 3`directory events filename:`tput setaf 1` "\"${directory}\" \"${events}\" \"${filename}\"" `tput sgr0`;
                exit_status=0
                env time -f 'build time: %E' make || exit_status="$?"
                if [ "$exit_status" -ne 0 ]; then
                    echo "BUILD ERROR!"
                fi
            fi
        done

    }

abort()
{
    echo >&2 '
***************
*** ABORTED ***
***************
'
    echo "An error occurred. Exiting..." >&2
    exit 1
}

trap 'abort' 0

set -e

# Add your script below....
# If an error occurs, the abort() function will be called.
#----------------------------------------------------------
# ===> Your script goes here
build
# Done!
trap : 0

echo >&2 '
************
*** DONE ***
************
'
# ----------------------------------------------------------------------------
exit 0

