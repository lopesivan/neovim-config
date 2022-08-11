\#
\#  |------------------+------------+-------|
\#  | Command Line     | Variable   | State |
\#  |------------------+------------+-------|
\#  | ""               | DEBUG      | NULL  |
\#  | "--enable-debug" | DEBUG      | 1     |
\#  |----------------------+--------+-------|

AC_ARG_ENABLE([debug],
  [AS_HELP_STRING([--enable-debug],
    [Turn on debugging @<:@default: no@:>@])],
  [case "\${enableval}" in
    yes) debug=yes ;;
    no)  debug=no ;;
    *) AC_MSG_ERROR([bad value \${enableval} for --enable-debug]) ;;
  esac],
  [debug=no])

