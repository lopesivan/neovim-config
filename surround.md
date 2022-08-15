
let g:surround_108 = "\\begin{\1environment: \1}\n\r\n\\end{\1\r}.*\r\1}"

let g:surround_108 = "\\begin{\1environment: \1}\r\\end{\1\r}.*\r\1}"

<
This will remove anything after the first } in the input when
the text is placed within the \end{} slot. The first \r marks
where the pattern begins, and the second where the replacement
text begins.

Here's a second example for creating an HTML <div>. The
substitution cleverly prompts for an id, but only adds id=""
if it is non-blank. You may have to read this one a few times
slowly before you understand it.
>

  let g:surround_{char2nr("d")} = "<div\1id: \r..*\r id=\"&\"\1>\r</div>"

# change

```txt

                 s

             s  [c]  s  ]  }

                 s

                 "

                <q>
```

# delete

```txt
                 s

             s  [d]  s "

                 s
                 '
```

# append

```txt
                 B

                 s

                 s

       (  W  s  [y]  s  i  w "

                 s

                 s

                 '

```
