all: run

SRC = haskelltut
BIBLIOGRAPHY = bibliography

# -P      => move ponctuation after reference
# -S      => label and bracket-label options
# -e      => accumulate (use a reference section)
# -p bib  => bibliography file
REFER_OPTS = -PS -e -p $(BIBLIOGRAPHY)
REFER = refer $(REFER_OPTS)

# -k     => iconv conversion (did it ever worked?)
# -ms    => ms macro
# -Tpdf  => output device is PDF
GROFF_OPTS = -ms -t -Tpdf
GROFF = groff $(GROFF_OPTS)

# ghighlight brings `source-highlight` to troff
GHIGHLIGHT_OPTS =
GHIGHLIGHT = ghighlight $(GHIGHLIGHT_OPTS)

VIEWER_OPTS = -
VIEWER = zathura $(VIEWER_OPTS)

$(SRC).pdf:
	cat $(SRC).ms | $(GHIGHLIGHT) | $(REFER) | $(GROFF) > $@

run:
	cat $(SRC).ms | $(GHIGHLIGHT) | $(REFER) | $(GROFF) | $(VIEWER)
