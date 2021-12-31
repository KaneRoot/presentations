#!/bin/sh

# HOW TO USE

# . ./$0
# cat file | modernize_roff | remove-eol.pl > file.new

modernize_roff() {
	sed \
		-e "s/^\.PP/.PARAGRAPH_INDENTED/" \
		-e "s/^\.NH 1/.SECTION/" \
		-e "s/^\.NH 2/.SUBSECTION/" \
		-e "s/^\.NH 3/.SUBSUBSECTION/" \
		-e "s/^\.NH 4/.SUBSUBSUBSECTION/" \
		-e "s/^\.SH [1-4]/.SECTION_NO_NUMBER/" \
		-e "s/^\.SH$/.SECTION_NO_NUMBER/" \
		-e "s/^\.LP/.PARAGRAPH_UNINDENTED/"
}
