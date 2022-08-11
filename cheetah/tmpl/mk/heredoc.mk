SHELL = bash
.ONESHELL:
MYVAR = "Some Title"

file.md:
	cat <<- EOF > $@
		$(MYVAR)
		========

		This stuff will all be written to the target file. Be sure
		to escape dollar-signs and backslashes as Make will be scanning
		this text for variable replacements before bash scans it for its
		own strings.

		Otherwise formatting is just as in any other bash heredoc. Note
		I used the <<- operator which allows for indentation. This markdown
		file will not have whitespace at the start of lines.

		Here is a programmatic way to generate a markdwon list all PDF files
		in the current directory:
		$(shell pwd)
		$(shell ls)
		`find -maxdepth 1 -name '*.pdf' -exec echo " + {}" \;`
	EOF

clean:
	rm -f file.md
